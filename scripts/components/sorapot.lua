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
    self.tick = 0
    self.con = inst.components.container
    self.ticktask = inst:DoPeriodicTask(0.1, function()
        self:Update()
    end, math.random() * .5)
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
    self:UpdateDry()
    self:UpdateCook()
    self:UpdateIce()
end
function com:SetUI(type, index, enable)
    if self.UiFn then
        self.UiFn(self.inst, type, index, enable)
    end
end
function com:UpdateDry()
    if not self.cookslot.meat then
        return
    end
    print("风干")
    for k, v in pairs(self.cookslot.meat) do
        local skip = false
        local work = false
        local inslot = v[1] and v[1][1]
        local outslot = v[2] and v[2][1]
        local initem = self.con:GetItemInSlot(inslot)
        if not (initem and initem.components.dryable and initem.components.dryable.product) then
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
            elseif outitem and ((not outitem.components.stackable) or outitem.components.stackable.stacksize >=
                ((outitem.components.stackable.originalmaxsize or outitem.components.stackable.maxsize) * 10)) then
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
                        lastwork = 0,
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
        if not (initem and initem.components.cookable and initem.components.cookable.product) then
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
            elseif outitem and ((not outitem.components.stackable) or outitem.components.stackable.stacksize >=
                ((outitem.components.stackable.originalmaxsize or outitem.components.stackable.maxsize) * 10)) then
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
                        lastwork = 0,
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
                lastwork = 0,
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
                            if stack and stack.stacksize < ((stack.originalmaxsize or stack.maxsize) * 10) then
                                stack:SetStackSize(stack.stacksize + 1)
                            end
                            outok = true
                            data.time = 0
                            data.power = 0
                        else
                            local item = SpawnPrefab(data.product)
                            self.con:GiveItem(item, slot)
                            -- 输出成功 重置计数
                            outok = true
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
            if data[4] then
                local v = data[4]
                if v.power < v.powerneed then
                    if power > self.powerrate then
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
