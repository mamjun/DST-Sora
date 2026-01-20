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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]] --[[用于堆叠不可堆叠的物品
]] --
local Say = SoraAPI.Say
local com = Class(function(self, inst)
    self.inst = inst
    self.slots = {}
    --[[
    存储格式
    {   
        [slot] = {{data=data,count=num},...},
    }
    ]]
    self.slotslast = {}
    --[[
    存储格式
    {   
        [slot] = {prefab=prefab,inv={atlas=atlas,image=image},bg={atlas=atlas,image=image}},
    }
    ]]
    self.cangive = true
    self.maxslot = 0
    self.delay_send = 0

end)

function com:Init()
    local container = self.inst.components.container
    self.container = container
    self.maxslot = container:GetNumSlots()
    self.inst:ListenForEvent("itemlose", function(inst, data)
        self:GetAllItemInSlot()
    end)
    self.inst:ListenForEvent("itemget", function(inst, data)
        -- 自己给的 不重复计算
        if self.giving then
            return
        end
        if data and data.slot then
            self:GetNewItem(data.slot)
        end
    end)
    local oldSwapActiveItemWithSlot = container.SwapActiveItemWithSlot
    -- 交换物品时优先进后台
    container.SwapActiveItemWithSlot = function(container, slot, doer, ...)
        if not (doer and doer:HasTag("player")) then
            return
        end
        local act = doer.components.inventory:GetActiveItem()
        local item = self.container:GetItemInSlot(slot)
        if not act then
            return
        end
        if item then
            self:GiveItem(doer, act, slot)
            return
        else
            -- 没物品就放进去 然后刷新一下缓存
            oldSwapActiveItemWithSlot(container, slot, doer, ...)
            self:FixSlotLast(doer)
            self:GetData(doer)
        end
    end
end
-- 前台收到物品
function com:GetNewItem(slot)
    if self.isloading then
        return
    end
    local item = self.container:GetItemInSlot(slot)
    if not item then
        return
    end -- ???
    local doer = self.inst.components.inventoryitem:GetGrandOwner()
    if not (doer and doer:HasTag("player")) then
        doer = nil
    end
    for i = 1, self.maxslot do
        local data = self.slotslast[i]
        -- 找到相同的数据 直接合并
        if data and data.prefab == item.prefab then
            return self:GiveItem(doer, item, i)
        end
    end
    if not self.slotslast[slot] then -- 格子是空的 直接写入
        self:UpdateSlot(slot, item)
        self:GetData(doer)
        return
    end
    local data = self.slotslast[slot]
    if data.prefab == item.prefab then
        -- 相同的prfab直接更新图片
        self:UpdateSlot(slot, item)
    else
        local store = self.slots[slot]
        if not (store and next(store)) then
            -- 没数据
            self:UpdateSlot(slot, item)
        else
            self.container:DropItem(item)
        end
    end

end
-- 前台失去物品 且无物品 则后台自动补货
function com:GetItemInSlot(slot)
    -- 没数据 不补货
    if not self.slotslast[slot] then
        return
    end
    local itemdata = self.slots[slot]
    if not (itemdata and next(itemdata)) then
        -- 没东西了 清空
        return
    end
    for k, data in pairs(itemdata) do
        local d = data.data
        local item = SpawnSaveRecord(d)
        if item then
            self.giving = true
            self.container:GiveItem(item, slot)
            self.giving = false
            data.count = data.count - 1
            if data.count <= 0 then
                table.remove(itemdata, k)
                if not next(itemdata) then
                    self.slots[slot] = nil
                end
            end
            return
        else
            -- Spawn不出来  是数据损坏了吧 直接清空了
            self.slotslast[slot] = nil
            self.slots[slot] = nil
            return
        end
    end
end
function com:GetAllItemInSlot()
    if self.isloading then
        return
    end
    local doer = self.inst.components.inventoryitem and self.inst.components.inventoryitem:GetGrandOwner()
    if not doer then
        doer = self.container:GetOpeners()[1]
    end
    for i = 1, self.maxslot do
        local item = self.container:GetItemInSlot(i)
        if not item then
            self:GetItemInSlot(i)
        end
    end
    self:GetData(doer)
end
function com:UpdateSlot(slot, item)
    self.slotslast[slot] = {
        prefab = item.prefab
    }
    self.slotslast[slot].inv = {
        atlas = item.replica.inventoryitem:GetAtlas(),
        image = item.replica.inventoryitem:GetImage()
    }
    if item.inv_image_bg then
        self.slotslast[slot].bg = {
            atlas = item.inv_image_bg.atlas,
            image = item.inv_image_bg.image
        }
    end
end
function com:FixSlotLast(doer)
    for i = 1, self.maxslot do
        local item = self.container:GetItemInSlot(i)
        if item then
            local old = self.slotslast[i]
            if old and old.prefab ~= item.prefab then
                -- 数据存在 且prefab不同 则丢出
                local slots = self.slots[i]
                if not (slots and next(slots)) then
                    -- 后台没东西了 就替换
                    self:UpdateSlot(i, item)
                else
                    -- 后台数据和前台不同步 清空
                    self.container:DropItem(item)
                end

            else
                -- 数据不存在 或者 prefab相同 则更新
                self:UpdateSlot(i, item)
            end
        end
    end
end
-- 获取物品数量
function com:GetItemCountInSlot(slot)
    local count = 0
    local itemdata = self.slots[slot]
    if itemdata then
        for _, v in pairs(itemdata) do
            count = count + v.count
        end
    end
    if self.container:GetItemInSlot(slot) then
        count = count + 1
    end
    return count
end
-- 发送给客户端的数据
function com:GetData(doer, db)
    if self.delay_send > 0 then
        return
    end
    self.delay_send = 0
    if not (doer and doer:HasTag("player")) and not db then
        return
    end
    local data = {}
    for i = 1, self.maxslot do
        if not self.container:GetItemInSlot(i) then -- 没物品了 才需要发last
            if self.slotslast[i] then
                data[i] = {
                    last = {
                        inv = self.slotslast[i].inv,
                        bg = self.slotslast[i].bg
                    }
                }
            end
        else -- 有物品就发数量
            data[i] = {
                num = self:GetItemCountInSlot(i)
            }
        end
    end
    if db then
        db:PushEvent("Sora2ListData", {
            slots = data
        })
    else
        SoraAPI.r_event(doer, "Sora2ListData", {
            slots = data
        })
    end
end
function com:TryToEquipOrGive(doer, item, isback)
    local pos = doer:GetPosition()
    item.prevslot = nil
    item.prevcontainer = nil
    if item.components.equippable then
        local eslot = item.components.equippable.equipslot
        -- 不能装备则直接给与玩家
        if (not doer.components.inventory.isloading and item.components.equippable:IsRestricted(doer) or
            doer.components.inventory.isloading and item.components.equippable:IsRestricted_FromLoad(doer)) or
            (doer.components.inventory.noheavylifting and item:HasTag("heavy")) then
            doer.components.inventory:GiveItem(item, nil, pos)
            return true
        end
        -- 先卸载旧的
        local olditem = doer.components.inventory:Unequip(eslot)
        if olditem then
            self.delay_send = 99
            self:GiveItem(doer, olditem)
        end
        local equip = doer.components.inventory:GetEquippedItem(eslot)
        if not olditem and equip then
            doer.components.inventory:GiveItem(item, nil, pos)
        else
            doer.components.inventory:Equip(item)
        end
    else
        -- 不是装备则直接给玩家
        doer.components.inventory:GiveItem(item, nil, pos)
    end
    return true
end
-- 按键取出物品
function com:GetOne(doer, slot)
    local itemdata = self.slots[slot]
    if not (itemdata and next(itemdata)) then
        local item = self.container:GetItemInSlot(slot)
        if item then
            self.container:RemoveItem(item, true, true, true)
            self:TryToEquipOrGive(doer, item)
        end
        self:GetAllItemInSlot()
        self.delay_send = 0
        self:GetData(doer)
        return
    end

    local pos = doer:GetPosition()
    for k, data in pairs(itemdata) do
        local d = data.data
        local item = SpawnSaveRecord(d)
        if item then
            self:TryToEquipOrGive(doer, item)
            data.count = data.count - 1
            if data.count <= 0 then
                table.remove(itemdata, k)
                if not next(itemdata) then
                    self.slots[slot] = nil
                end
            end
            self:GetAllItemInSlot()
            self.delay_send = 0
            self:GetData(doer)
            return item
        else
            -- Spawn不出来  是数据损坏了吧 直接清空了
            self.slotslast[slot] = nil
            self.slots[slot] = nil
            Say(doer, "数据损坏,已清理")
            self:GetData(doer)
            return
        end
    end
end
-- 存入物品
function com:GiveItem(doer, item, slot)
    if not item then
        return
    end
    local pos = (doer or self.inst):GetPosition()
    local prefab = item.prefab
    local find = false
    local findnil = false
    if slot then
        local v = self.slotslast[slot]
        if v and v.prefab == prefab then
            find = slot
        end
    end
    if not find then
        for i = 1, self.maxslot do
            local v = self.slotslast[i]
            if not v then
                findnil = i
            end
            if v and v.prefab == prefab then
                find = i
                break
            end
        end
    end
    -- 没有空间去存储了
    if not find and not findnil then
        if doer then
            doer.components.inventory:GiveItem(item, nil, pos)
        else
            self.container:DropItem(item)
            -- 手动应该是塞不进来的
        end
        self:GetData(doer)
        return
    end
    local slotid = find or findnil
    local data = item:GetSaveRecord()
    local srcdata = self.slots[slotid]
    if not srcdata then
        srcdata = {}
        self.slots[slotid] = srcdata
        -- 更新最后存储信息
        self:UpdateSlot(slotid, item)
    end
    for k, v in pairs(srcdata) do
        if self:IsSameData(v.data, data) then
            v.count = v.count + 1
            item:Remove()
            if doer then
                self:GetData(doer)
            end
            return true
        end
    end
    table.insert(srcdata, {
        data = data,
        count = 1
    })
    item:Remove()
    self:GetData(doer)
    return true
end

function com:IsSameData(data1, data2)
    if not data1 or not data2 then
        return false
    end
    if data1.prefab ~= data2.prefab then
        return false
    end
    if data1.skinname ~= data2.skinname then
        return false
    end
    if data1.skin_id ~= data2.skin_id then
        return false
    end
    if data1.alt_skin_ids ~= data2.alt_skin_ids then
        return false
    end
    if not data1.data and not data2.data then
        return true
    end
    if not (data1.data and data2.data) then
        return false
    end
    if GetTableSize(data1.data) ~= GetTableSize(data2.data) then
        return false
    end
    for cmpname, cmpdata in pairs(data1.data) do
        if not data2.data[cmpname] then
            return false
        end
        if not SoraAPI.DeepEqual(cmpdata, data2.data[cmpname]) then
            return false
        end
    end
    return true
end
-- 存入物品数据 慎用 建议只用于封装包裹 不会主动同步数据 未测试
function com:GiveData(doer, sdata)
    if not (sdata and sdata.data) then
        return
    end
    local prefab = sdata.prefab
    local find = false
    local findnil = false
    for i = 1, self.maxslot do
        local v = self.slotslast[i]
        if not v then
            findnil = i
        end
        if v and v.prefab == prefab then
            find = i
            break
        end
    end
    -- 没有空间去存储了
    if not find and not findnil then
        return false
    end
    local slotid = find or findnil
    local data = sdata.data
    local srcdata = self.slots[slotid]
    if not srcdata then
        srcdata = {}
        self.slots[slotid] = srcdata
    end
    -- 不检测相同性 直接插入
    table.insert(srcdata, sdata)
    return true
end
-- 丢出所有物品
function com:DropAll(doer)
    self.delay_send = 99
    local pos = doer:GetPosition()
    for slot = 1, self.maxslot do
        local itemdata = self.slots[slot]
        if itemdata then
            for _, v in pairs(itemdata) do
                for i = 1, v.count or 1 do
                    local item = SpawnSaveRecord(v.data)
                    if item then
                        doer.components.inventory:GiveItem(item, nil, pos)
                    end
                end
            end
            self.slots[slot] = nil
        end
        local item = self.container:GetItemInSlot(slot)
        if item then
            self.container:RemoveItem(item, true, true, true)
            item.prevslot = nil
            item.prevcontainer = nil
            doer.components.inventory:GiveItem(item, nil, pos)
        end
    end
    self.delay_send = 0
    self:GetData(doer)
end
-- 收集已打开的容器
function com:CollectSelf(doer)
    if not (doer and doer.components.inventory) then
        return false
    end
    self.delay_send = 99
    for k, v in pairs(self.slotslast) do
        if v and v.prefab then
            local items = doer.components.inventory:GetItemByName(v.prefab, 999, true)
            for item, _ in pairs(items) do
                local owner = item.components.inventoryitem and item.components.inventoryitem.owner
                if not (owner == self.container.inst) and not item.components.stackable and
                    not item.components.container then
                    doer.components.inventory:RemoveItem(item, true, true, true)
                    self:GiveItem(doer, item, k)
                end
            end
        end
    end
    self:GetAllItemInSlot(doer)
    self.delay_send = 0
    self:GetData(doer)
    return true
end
-- 收集周围
function com:CollectAll(doer)
    self.delay_send = 99
    local x, y, z = doer:GetPosition():Get()
    local ents = TheSim:FindEntities(x, 0, z, 30, {"_inventoryitem"},
        {"_container", "INLIMBO", "_stackable", "_combat", "_health", "irreplaceable"})
    for k, v in pairs(ents) do
        if v.components.inventoryitem and v.components.inventoryitem.canbepickedup and
            v.components.inventoryitem.cangoincontainer then
            self:GiveItem(doer, v)
        end
    end
    self:GetAllItemInSlot(doer)
    self.delay_send = 0
    self:GetData(doer)
end
function com:OnSave()
    return {
        slots = self.slots,
        slotslast = self.slotslast,
        version = 1
    }
end

function com:OnLoad(data)
    if not data then
        return
    end
    self.slots = data.slots or {}
    self.slotslast = data.slotslast or {}
    self.isloading = true
    self.inst:DoTaskInTime(0, function()
        self.isloading = false
    end)
end

function com:GetDebugString()
    return ""
end

return com
