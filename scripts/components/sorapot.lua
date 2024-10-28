--[[
授权级别:参考级
Copyright 2022 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638724235
WeGame平台: 穹の空 模组ID：workshop-2199027653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
2, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
3，禁止修改经验、进食、皮肤、热更相关内容。
4，本人保留要求相关patch、补丁包下架和做出反制的权利 。
5，之后会有详细的说明放置于mod根目录下的 ReadMe.txt文件，会提供更详细的说明和示例。


声明：本MOD所有内容不用于盈利，且拒绝接受捐赠、红包等行为。

对moder:
授权声明：
1,本mod内源码会严格分为'参考级'和'开放级',我会在源码内标明。
其中'参考级'允许作为参考,可以按照我的思路自行编写其他逻辑,但是禁止直接复制粘贴.
'开放级'允许直接复制粘贴后使用,并允许根据自己的需要进行修改,
但是我期望尽量减少修改以保证兼容和后续更新带来的麻烦,如果有功能改动可以和我沟通进行合并。
未标明的文件，默认授权级别为'参考级'。
2,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]] --[[标准组件
]] --
local cooking = require "cooking"
local sorafoods = require "preparedfoods_sora"
local com = Class(function(self, inst)
    self.inst = inst
    self.power = 2000
    self.powermax = 2000
    self.powerrate = 1
    self.cookslot = {}
    self.cookcache = {}
    self.powerslot = {}
    self.updatetask = {}
    self.taskid = 0
    self.expsave = {}
    self.tick = 0
    self.con = inst.components.container
    self.ticktask = inst:DoPeriodicTask(0.1, function()
        self:Update()
    end, math.random() * .5)
    local conOpen = self.con.Open
    self.con.Open = function(s, doer, ...)
        if not (doer and doer:HasTag("player")) then
            return
        end
        if not (doer:HasTag("sora")) then
            SoraAPI.Say(doer, "我不能使用这个")
            return
        end
        return conOpen(s, doer, ...)
    end

end)

function com:RegSlot(type, inslot, outslot, powerneed)
    local slot = self.cookslot[type] or {}
    self.cookslot[type] = slot
    table.insert(slot, {inslot, outslot, powerneed, nil})
end

function com:RegPower(type, slot, power)
    self.powerslot[type] = self.powerslot[type] or {}
    table.insert(self.powerslot[type], {slot, power})
end
function com:SetPower(power)
    self.power = math.clamp(power, 0, self.powermax)
    self.inst:SetPotPer(self.power / self.powermax)
end

function com:Update(dt)
    self.tick = self.tick + 1
    if self.tick > 36000000 then
        self.tick = 1
    end
    local m = self.tick % 10
    -- 每0.1秒刷一次能量
    self:UpdatePower()
    -- 每1秒刷一次产物
    if m ~= 0 then
        return
    end
    if self.power > 0 then
        self:UpdateDry()
        self:UpdateCook()
        self:UpdateIce()
        self:UpdateSoraPot()
        self:UpdatePot()
        self:UpdateSpice()
    end
    self:UpdateCookUI()
    self:UpdateExp()
end

function com:UpdateCookUI()
    for k, v in pairs(self.cookslot.pot) do
        local v2 = self.cookslot.sorapot[k]
        if (v[4] and not v[4].disable and v[4].lastwork > 2) or
            (v2 and v2[4] and not v2[4].disable and v2[4].lastwork > 2) then
            self:SetUI('pot', k, true)
        else
            self:SetUI('pot', k, false)
        end
    end
    for k, v in pairs(self.cookslot.spice) do
        local v2 = self.cookslot.sorapot[k]
        if (v[4] and not v[4].disable and v[4].lastwork > 2) or
            (v[5] and v2 and v2[4] and not v2[4].disable and v2[4].lastwork > 2) then
            self:SetUI('spice', k, true)
        else
            self:SetUI('spice', k, false)
        end
    end
end
function com:GetDoer()
    local owner = self.inst.components.inventoryitem:GetGrandOwner()
    if not owner then
        local openers = self.con:GetOpeners()
        if next(openers) then
            owner = openers[1]
        end
    end
    if not owner then
        return
    end
    return owner
end
function com:UpdateExp()
    if not next(self.expsave) then
        return
    end
    local owner = self:GetDoer()
    if not owner then
        return
    end
    if owner.GetExp then
        for i = 1, 5 do
            if next(self.expsave) then
                local t = table.remove(self.expsave, 1)
                owner:GetExp(t[3], t[1], nil, t[2])
            else
                return
            end
        end
    end
end

function com:SetUI(type, index, enable)
    if self.UiFn then
        self.UiFn(self.inst, type, index, enable)
    end
end
function com:UpdateSoraPot()
    if not self.cookslot.sorapot then
        return
    end
    if not self.cookslot.pot then
        return
    end
    if not self.cookslot.spice then
        return
    end
    for k, v in pairs(self.cookslot.sorapot) do
        self:UpdateSubSoraPot(k, v)
    end
end

function com:UpdatePot()
    if not self.cookslot.pot then
        return
    end
    for k, v in pairs(self.cookslot.pot) do
        self:UpdateSubPot(k, v)
    end
end

function com:UpdateSpice()
    if not self.cookslot.spice then
        return
    end
    for k, v in pairs(self.cookslot.spice) do
        self:UpdateSubSpice(k, v)
    end
end

function com:SaveExp(type, once, num)
    table.insert(self.expsave, {type, once, num})
end
function com:UpdateSubSoraPot(k, data)
    if not self.cookslot.pot[k] and self.cookslot.spice[k] then
        return
    end
    -- 刷新缓存区
    if not data[4] then
        data[4] = {
            rec = nil, -- 配方
            disable = true,
            items = {}, -- 物品
            useitem = {},
            outitems = {},
            time = 0,
            power = 0,
            timeneed = 0,
            powerneed = 0,
            lastwork = 0,
            nopower = nil
        }
    end
    local d = data[4]
    local needrepot = false
    -- 检测物品是否有变化

    for ik, slot in pairs(data[1]) do
        local item = self.con:GetItemInSlot(slot)
        if item and item.prefab ~= d.items[ik] then
            needrepot = true
            d.items[ik] = item.prefab
        elseif not item and d.items[ik] then
            needrepot = true
            d.items[ik] = nil
        end
    end

    for ik, slot in pairs(data[2]) do
        local item = self.con:GetItemInSlot(slot)
        if item and item.prefab ~= d.outitems[ik] then
            needrepot = true
            d.outitems[ik] = item.prefab
        elseif not item and d.outitems[ik] then
            needrepot = true
            d.outitems[ik] = nil
        end
    end

    -- 有变化 刷新配方
    if needrepot then
        -- 刷新配方了 重计燃料和时间
        d.power = 0
        d.time = 0
        local rec, uses = self:GetSoraPotRec(data[1])
        if not rec then
            -- 没有配方
            -- 解除对子格的占用
            self.cookslot.pot[k][5] = false
            self.cookslot.spice[k][5] = false
            d.disable = true
            d.useitem = {}
            d.lastwork = 0
            d.rec = nil
            return
        else
            -- 新配方 同时重置pot 和 spice
            local outitem = self.con:GetItemInSlot(data[2][1])
            if outitem then
                -- 无法输出 解除对子格的占用
                if rec.name ~= outitem.prefab or self:IsStackFull(outitem) then
                    self.cookslot.pot[k][5] = false
                    self.cookslot.spice[k][5] = false
                    d.disable = true
                    d.lastwork = 0
                    d.useitem = {}
                    d.rec = nil
                    return
                end
            end
            -- 占用子格
            self.cookslot.pot[k][5] = true
            d.rec = rec

            d.timeneed = (rec.cooktime or 2) * 10
            d.powerneed = d.timeneed * data[3]
            d.useitem = uses
            self.cookslot.spice[k][5] = false
            for insloti, slot in pairs(self.cookslot.spice[k][1]) do
                if table.contains(d.useitem, slot) then
                    self.cookslot.spice[k][5] = true
                end
            end
            d.disable = false
            d.lastwork = 3
            return
        end
    end
    -- 不需要刷新配方 
    if d.disable then -- 未启用
        return
    end
    d.lastwork = math.clamp(d.lastwork + (d.nopower and -1 or 1), 0, 3)
    if d.nopower then
        return
    end
    local outslot = data[2][1]
    local outitem = self.con:GetItemInSlot(outslot)
    local num = d.rec.stacksize or 1
    if outitem then
        if self:IsStackFull(outitem) then
            d.lastwork = 0
            return
        end
        if d.rec.name ~= outitem.prefab then
            d.lastwork = 0
            return
        end
    end

    d.time = math.clamp(d.time + 1, 0, d.timeneed)
    if d.time >= d.timeneed and d.power >= d.powerneed then
        -- 条件满足 尝试寻找输出点
        local rec, uses = self:GetSoraPotRec(data[1])
        if not (rec and (rec.name == d.rec.name)) then
            d.lastwork = 3
            d.time = 0
            d.power = 0
            if d.rec.JustOnce then
                -- 强制清空重新计算
                d.items = {}
                d.disable = true
                d.rec = nil
            end
            return
        end
        if outitem then
            local stack = outitem.components.stackable
            stack:SetStackSize(stack.stacksize + num)
            self:SaveExp(outitem.prefab, true, 20)
        else
            local item = SpawnPrefab(d.rec.name)
            if item.components.stackable then
                item.components.stackable:SetStackSize(num)
            end
            self.con:GiveItem(item, outslot)
            self:SaveExp(item.prefab, true, 20)
        end
        local data = {
            items = {},
            rec = d.rec
        }
        for index, inslot in pairs(d.useitem) do
            local initem = self.con:GetItemInSlot(inslot)
            table.insert(data.items, initem)
        end
        if d.rec.OnCook then
            d.rec.OnCook(self.inst, self:GetDoer(), data)
        end
        for inde, initem in pairs(data.items) do
            if initem then
                if initem.components.stackable then
                    initem.components.stackable:Get(1):Remove()
                else
                    initem:Remove()
                end
            end
        end
        self:SaveExp("stewer", false, 10 * num)

        -- 输出成功 重置计数
        d.lastwork = 3
        d.time = 0
        d.power = 0
        if d.rec.JustOnce then
            -- 强制清空重新计算
            d.items = {}
            d.disable = true
            d.rec = nil
        end
    end
end

function com:UpdateSubPot(k, data)
    if not self.cookslot.pot[k] then
        return
    end
    if data[5] then
        return
    end
    -- 刷新缓存区
    if not data[4] then
        data[4] = {
            rec = nil, -- 配方
            disable = true,
            items = {}, -- 物品
            outitems = {}, -- 物品
            time = 0,
            power = 0,
            timeneed = 0,
            powerneed = 0,
            lastwork = 0,
            nopower = nil
        }
    end
    local d = data[4]
    local needrepot = false
    -- 检测物品是否有变化
    for ik, slot in pairs(data[1]) do
        local item = self.con:GetItemInSlot(slot)
        if item and item.prefab ~= d.items[ik] then
            needrepot = true
            d.items[ik] = item.prefab
        elseif not item and d.items[ik] then
            needrepot = true
            d.items[ik] = nil
        end
    end

    for ik, slot in pairs(data[2]) do
        local item = self.con:GetItemInSlot(slot)
        if item and item.prefab ~= d.outitems[ik] then
            needrepot = true
            d.outitems[ik] = item.prefab
        elseif not item and d.outitems[ik] then
            needrepot = true
            d.outitems[ik] = nil
        end
    end

    -- 有变化 刷新配方
    if needrepot then
        -- 刷新配方了 重计燃料和时间
        d.power = 0
        d.time = 0
        local rec = self:GetPotRec(data[1])
        if not rec then
            -- 没有配方
            d.disable = true
            d.lastwork = 0
            d.rec = nil
            return
        else
            -- 新配方 同时重置pot 和 spice
            local outitem = self.con:GetItemInSlot(data[2][1])
            if outitem then
                -- 无法输出 解除对子格的占用
                if rec.name ~= outitem.prefab or self:IsStackFull(outitem) then
                    d.disable = true
                    d.lastwork = 0
                    d.rec = nil
                    return
                end
            end
            d.rec = rec
            d.timeneed = (rec.cooktime or 20) * 10
            d.powerneed = d.timeneed * data[3]
            d.disable = false
            d.lastwork = 3
            return
        end
    end
    -- 不需要刷新配方 
    if d.disable then -- 未启用
        return
    end
    d.lastwork = math.clamp(d.lastwork + (d.nopower and -1 or 1), 0, 3)
    if d.nopower then
        return
    end
    local outslot = data[2][1]
    local outitem = self.con:GetItemInSlot(outslot)
    local num = d.rec.stacksize or 1
    if outitem then
        if self:IsStackFull(outitem) then
            d.lastwork = 0
            return
        end
        if d.rec.name ~= outitem.prefab then
            d.lastwork = 0
            return
        end
    end

    d.time = math.clamp(d.time + 1, 0, d.timeneed)
    if d.time >= d.timeneed and d.power >= d.powerneed then
        -- 条件满足 尝试寻找输出点
        if outitem then
            local stack = outitem.components.stackable
            stack:SetStackSize(stack.stacksize + num)
            self:SaveExp(outitem.prefab, true, 20)
        else
            local item = SpawnPrefab(d.rec.name)
            if item.components.stackable then
                item.components.stackable:SetStackSize(num)
            end
            self.con:GiveItem(item, outslot)
            self:SaveExp(item.prefab, true, 20)
        end
        for index, inslot in pairs(data[1]) do
            local initem = self.con:GetItemInSlot(inslot)
            if initem then
                if initem.components.stackable then
                    initem.components.stackable:Get(1):Remove()
                else
                    initem:Remove()
                end
            end
        end
        self:SaveExp("stewer", false, 10 * num)
        -- 输出成功 重置计数
        d.lastwork = 3
        d.time = 0
        d.power = 0
    end
end

function com:UpdateSubSpice(k, data)
    if not self.cookslot.pot[k] then
        return
    end
    if data[5] then
        return
    end
    -- 刷新缓存区
    if not data[4] then
        data[4] = {
            rec = nil, -- 配方
            disable = true,
            items = {}, -- 物品
            outitems = {}, -- 物品
            time = 0,
            power = 0,
            timeneed = 0,
            powerneed = 0,
            lastwork = 0,
            nopower = nil
        }
    end
    local d = data[4]
    local needrepot = false
    -- 检测物品是否有变化
    for ik, slot in pairs(data[1]) do
        local item = self.con:GetItemInSlot(slot)
        if item and item.prefab ~= d.items[ik] then
            needrepot = true
            d.items[ik] = item.prefab
        elseif not item and d.items[ik] then
            needrepot = true
            d.items[ik] = nil
        end
    end

    for ik, slot in pairs(data[2]) do
        local item = self.con:GetItemInSlot(slot)
        if item and item.prefab ~= d.outitems[ik] then
            needrepot = true
            d.outitems[ik] = item.prefab
        elseif not item and d.outitems[ik] then
            needrepot = true
            d.outitems[ik] = nil
        end
    end

    -- 有变化 刷新配方
    if needrepot then
        -- 刷新配方了 重计燃料和时间
        d.power = 0
        d.time = 0
        local rec = self:GetSpiceRec(data[1])
        if not rec then
            -- 没有配方
            d.disable = true
            d.lastwork = 0
            d.rec = nil
            return
        else
            -- 新配方 同时重置pot 和 spice
            local outitem = self.con:GetItemInSlot(data[2][1])
            if outitem then
                -- 无法输出 解除对子格的占用
                if rec.name ~= outitem.prefab or self:IsStackFull(outitem) then
                    d.disable = true
                    d.lastwork = 0
                    d.rec = nil
                    return
                end
            end
            d.rec = rec
            d.timeneed = (rec.cooktime or 20) * 10
            d.powerneed = d.timeneed * data[3]
            d.disable = false
            d.lastwork = 3
            return
        end
    end
    -- 不需要刷新配方 
    if d.disable then -- 未启用
        return
    end
    d.lastwork = math.clamp(d.lastwork + (d.nopower and -1 or 1), 0, 3)
    if d.nopower then
        return
    end
    local outslot = data[2][1]
    local outitem = self.con:GetItemInSlot(outslot)
    local num = d.rec.stacksize or 1
    if outitem then
        if self:IsStackFull(outitem) then
            d.lastwork = 0
            return
        end
        if d.rec.name ~= outitem.prefab then
            d.lastwork = 0
            return
        end
    end

    d.time = math.clamp(d.time + 1, 0, d.timeneed)
    if d.time >= d.timeneed and d.power >= d.powerneed then
        -- 条件满足 尝试寻找输出点
        if outitem then
            local stack = outitem.components.stackable
            stack:SetStackSize(stack.stacksize + num)
            self:SaveExp(outitem.prefab, true, 20)
        else
            local item = SpawnPrefab(d.rec.name)
            if item.components.stackable then
                item.components.stackable:SetStackSize(num)
            end
            self.con:GiveItem(item, outslot)
            self:SaveExp(item.prefab, true, 20)
        end
        for index, inslot in pairs(data[1]) do
            local initem = self.con:GetItemInSlot(inslot)
            if initem then
                if initem.components.stackable then
                    initem.components.stackable:Get(1):Remove()
                else
                    initem:Remove()
                end
            end
        end
        self:SaveExp("stewer", false, 10 * num)
        -- 输出成功 重置计数
        d.lastwork = 3
        d.time = 0
        d.power = 0
    end
end

local aliases = {
    cookedsmallmeat = "smallmeat_cooked",
    cookedmonstermeat = "monstermeat_cooked",
    cookedmeat = "meat_cooked"
}
local ingredients = cooking.ingredients
local function GetIngredientValues(prefablist)
    local prefabs = {}
    local tags = {}
    for k, v in pairs(prefablist) do
        local name = aliases[v] or v
        prefabs[name] = (prefabs[name] or 0) + 1
        local data = ingredients[name]
        if data ~= nil then
            for kk, vv in pairs(data.tags) do
                tags[kk] = (tags[kk] or 0) + vv
            end
        end
    end
    return {
        tags = tags,
        names = prefabs
    }
end
local WList = require("util/weighted_list")

function com:GetSoraPotRec(slots)
    local data = {
        cooker = self.inst,
        doer = self:GetDoer(),
        items = {},
        prefablist = {}
    }
    local alluse = {}
    local use = {}
    for k, v in pairs(slots) do
        local item = self.con:GetItemInSlot(v)
        if item then
            table.insert(data.items, item)
            table.insert(alluse, v)
            if cooking.IsCookingIngredient(item.prefab) then
                table.insert(use, v)
                table.insert(data.prefablist, item.prefab)
            end
        end
    end
    if #data.items < 4 then
        return nil
    end
    local ings = GetIngredientValues(data.prefablist)
    local topp = -10000 * 10000
    local topr = {}
    ings.names.sora_pot_need = 0
    for k, v in pairs(sorafoods) do
        -- print(v.name,v.test,fastdump(ings),fastdump(data))
        v.SetSoraExtData(data)
        if v.priority >= topp and v.test(self.inst.prefab, ings.names, ings.tags, data) then
            if v.priority > topp then
                topp = v.priority
                topr = {}
            end
            topr[v.name] = v.weight
        end
        v.SetSoraExtData(nil)
    end
    if next(topr) then
        local recs = WList()
        for k, v in pairs(topr) do
            recs:addChoice(k, v)
        end
        local name = recs:getChoice(math.random() * recs:getTotalWeight())
        local rec = sorafoods[name]
        local speuse
        if rec.speuse then
            use = rec.speuse(data, data.items, alluse)
        end
        -- print( rec, rec.alluse and alluse or use)
        return rec, rec.alluse and alluse or use
    end
    return nil
end
function com:GetPotRec(slots)
    local data = {
        -- cooker = self.inst,
        -- doer = self:GetDoer(),
        -- items = {},
        prefablist = {}
    }
    for k, v in pairs(slots) do
        local item = self.con:GetItemInSlot(v)
        if item then
            -- table.insert(data.items, item)
            if cooking.IsCookingIngredient(item.prefab) then
                table.insert(data.prefablist, item.prefab)
            end
        end
    end
    if #data.prefablist < 4 then
        return nil
    end
    local recname = cooking.CalculateRecipe("portablecookpot", data.prefablist)
    -- print(recname,fastdump(data))
    if recname then
        if recname:match("wetgoop") then
            return nil
        end
        local rec = cooking.GetRecipe("portablecookpot", recname)
        -- print(fastdump(rec))
        return rec
    end
    return nil
end
function com:GetSpiceRec(slots)
    local data = {
        -- cooker = self.inst,
        -- doer = self:GetDoer(),
        -- items = {},
        prefablist = {}
    }
    for k, v in pairs(slots) do
        local item = self.con:GetItemInSlot(v)
       
        if item then
            if item:HasTag("spicedfood") then 
                return nil
            end
            -- table.insert(data.items, item)
            table.insert(data.prefablist, item.prefab)
        end
    end
    if #data.prefablist < 2 then
        return nil
    end
    local recname = cooking.CalculateRecipe("portablespicer", data.prefablist)
    if recname then
        if recname:match("wetgoop") then
            return nil
        end
        local rec = cooking.GetRecipe("portablespicer", recname)
        return rec
    end
    return nil
end
function com:UpdateDry()
    if not self.cookslot.meat then
        return
    end

    for k, v in pairs(self.cookslot.meat) do
        local skip = false
        local work = false
        local inslot = v[1] and v[1][1]
        local outslot = v[2] and v[2][1]
        local initem = self.con:GetItemInSlot(inslot)
        if not (initem and initem.components.dryable and type(initem.components.dryable.product) == "string") then
            work = false
            -- 无原料 清空任务
            v[4] = nil
            self:SetUI('meat', k, work)
        else
            local outitem = self.con:GetItemInSlot(outslot)
            if outitem and initem.components.dryable.product ~= outitem.prefab then
                work = false
                skip = true
                -- 出口材料不对 清空任务
                v[4] = nil
                self:SetUI('meat', k, work)
            elseif outitem and self:IsStackFull(outitem) then
                work = false
                skip = true
                -- 材料满了 清空任务
                v[4] = nil
                self:SetUI('meat', k, work)
            end
            if not skip then
                if not v[4] then
                    v[4] = {
                        product = initem.components.dryable.product,
                        power = 0,
                        powerneed = initem.components.dryable.drytime * 0.02 * v[3],
                        time = 0,
                        timeneed = initem.components.dryable.drytime * 0.02,
                        lastwork = 3,
                        nopower = nil
                    }
                else
                    local data = v[4]
                    data.time = math.clamp(data.time + 1, 0, data.timeneed)
                    data.lastwork = math.clamp(data.lastwork + (data.nopower and -1 or 1), 0, 3)
                    work = data.lastwork > 2
                    if data.time >= data.timeneed and data.power >= data.powerneed then
                        -- 条件满足 尝试寻找输出点
                        if outitem then
                            local stack = outitem.components.stackable
                            stack:SetStackSize(stack.stacksize + 1)
                        else
                            local item = SpawnPrefab(data.product)
                            self.con:GiveItem(item, outslot)
                        end

                        self:SaveExp(data.product, true, 20)
                        self:SaveExp('dryer', false, 10)
                        if initem.components.stackable then
                            initem.components.stackable:Get(1):Remove()
                        else
                            initem:Remove()
                        end

                        -- 输出成功 重置计数
                        work = true
                        data.time = 0
                        data.power = 0
                    end

                end
                self:SetUI('meat', k, work)
            end
        end
    end
end
function com:IsStackFull(stackitem)
    if not stackitem.components.stackable then
        return true
    end
    local stack = stackitem.components.stackable
    if stack.stacksize >= ((stack.originalmaxsize or stack.maxsize) * 10) then
        return true
    end
    return false
end
function com:UpdateCook()
    if not self.cookslot.cook then
        return
    end
    for k, v in pairs(self.cookslot.cook) do
        local skip = false
        local work = false
        local inslot = v[1] and v[1][1]
        local outslot = v[2] and v[2][1]
        local initem = self.con:GetItemInSlot(inslot)
        if not (initem and initem.components.cookable and type(initem.components.cookable.product) == "string") then
            work = false
            -- 无原料 清空任务
            v[4] = nil
            self:SetUI('cook', k, work)
        else
            local outitem = self.con:GetItemInSlot(outslot)
            if outitem and initem.components.cookable.product ~= outitem.prefab then
                work = false
                skip = true
                -- 出口材料不对 清空任务
                v[4] = nil
                self:SetUI('cook', k, work)
            elseif outitem and self:IsStackFull(outitem) then
                work = false
                skip = true
                -- 材料满了 清空任务
                v[4] = nil
                self:SetUI('cook', k, work)
            end
            if not skip then
                if not v[4] then
                    v[4] = {
                        product = initem.components.cookable.product,
                        power = 0,
                        powerneed = v[3],
                        time = 0,
                        timeneed = 1,
                        lastwork = 3,
                        nopower = nil
                    }
                else
                    local data = v[4]
                    data.time = math.clamp(data.time + 1, 0, data.timeneed)
                    data.lastwork = math.clamp(data.lastwork + (data.nopower and -1 or 1), 0, 3)
                    work = data.lastwork > 2
                    if data.time >= data.timeneed and data.power >= data.powerneed then
                        -- 条件满足 尝试寻找输出点
                        if outitem then
                            local stack = outitem.components.stackable
                            stack:SetStackSize(stack.stacksize + 1)
                        else
                            local item = SpawnPrefab(data.product)
                            self.con:GiveItem(item, outslot)
                        end
                        self:SaveExp(data.product, true, 20)
                        self:SaveExp('cook', false, 5)
                        if initem.components.stackable then
                            initem.components.stackable:Get(1):Remove()
                        else
                            initem:Remove()
                        end
                        -- 输出成功 重置计数
                        work = true
                        data.time = 0
                        data.power = 0
                    end
                end
                self:SetUI('cook', k, work)
            end
        end
    end
end

function com:UpdateIce()
    if not self.cookslot.ice then
        return
    end
    for k, v in pairs(self.cookslot.ice) do
        local work = false
        if not v[4] then
            v[4] = {
                product = "ice",
                power = 0,
                powerneed = v[3],
                time = 0,
                timeneed = 30,
                lastwork = 3,
                nopower = nil
            }
        else
            local data = v[4]
            data.time = math.clamp(data.time + 1, 0, data.timeneed)
            data.lastwork = math.clamp(data.lastwork + (data.nopower and -1 or 1), 0, 3)
            work = data.lastwork > 2
            if data.time >= data.timeneed and data.power >= data.powerneed then
                -- 条件满足 尝试寻找输出点
                local outok = false
                for i, slot in pairs(v[2]) do
                    if not outok then
                        local item = self.con:GetItemInSlot(slot)
                        if item and item.prefab == data.product then
                            local stack = item.components.stackable
                            if stack and not self:IsStackFull(item) then
                                stack:SetStackSize(stack.stacksize + 1)
                            end
                            outok = true
                            self:SaveExp('make', false, 3)
                            data.time = 0
                            data.power = 0
                        elseif not item then
                            local item = SpawnPrefab(data.product)
                            self.con:GiveItem(item, slot)
                            -- 输出成功 重置计数
                            outok = true
                            self:SaveExp('make', false, 3)
                            data.time = 0
                            data.power = 0
                        end
                    end
                end
                if not outok then
                    work = false
                end
            end

        end
        self:SetUI('ice', k, work)
    end
end
function com:UpdatePower()
    local power = self.power
    for type, datas in pairs(self.powerslot) do
        for i, data in pairs(datas) do
            for key, slot in pairs(data[1]) do
                local item = self.con:GetItemInSlot(slot)
                if item and item.prefab == type then
                    if (power + data[2]) <= self.powermax then
                        power = power + data[2]
                        if item.components.stackable then
                            item.components.stackable:Get(1):Remove()
                        else
                            item:Remove()
                        end
                    end
                end
            end
        end
    end

    for type, datas in pairs(self.cookslot) do
        for i, data in pairs(datas) do
            if data[4] and not data[4].disable then
                local v = data[4]
                if v.power < v.powerneed then
                    if power >= self.powerrate then
                        v.power = v.power + self.powerrate
                        power = power - self.powerrate
                        v.nopower = nil
                    else
                        v.nopower = true
                    end
                end
            end
        end
    end
    -- power = power - 10
    self:SetPower(power)
end

function com:OnSave()
    return {
        power = self.power
        -- add_component_if_missing_sora = (self.pass ~= "") and 1 or nil
    }
end

function com:OnLoad(data)
    if not data then
        return
    end
    if data.power then
        self:SetPower(data.power)
    end
end

function com:GetDebugString()
    return ""
end

return com
