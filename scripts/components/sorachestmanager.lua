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
]] --[[专属交互
]] --
SoraAPI.ChestData = {}
local cmp
local orderData = {}
local allchest = {}
--[[prefab = {
    inst = {
        control = {},
        container = {},
        data = {
            updated = {},    --需要更新多少次 
            update = {},
        }
    }
    }
    ]]
-- function D_C()
--     local a = SpawnPrefab("log") a.components.sorachestmanager = TheWorld.components.sorachestmanager  c_select(a)
-- end

local map = {}
map['antliontrinket'] = 'trinket'
-- map['boards'] = 'log'
-- map['rope'] = 'cutgrass'
-- map['cutstone'] = 'rocks'
-- map['papyrus'] = 'cutreeds'
map['myth_coin_box'] = 'myth_coin'
map['thulecite_pieces'] = 'thulecite'

-- map['feather_crow'] = "feather"
-- map['feather_robin'] = "feather"
-- map['feather_robin_winter'] = "feather"
-- map['feather_canary'] = "feather"

map['killerbee'] = "bee"
map['trunk_summer'] = "trunk_winter"

-- map['blue_cap'] = "cap"
-- map['moon_cap'] = "cap"
-- map['red_cap'] = "cap"
-- map['green_cap'] = "cap"

for i = 1, 31 do
    map['trinket_' .. tostring(i)] = 'trinket'
end
for i = 32, 46 do
    map['trinket_' .. tostring(i)] = 'hallow_trinket'
end
local function FindPrefab() -- tools_1 tools_2 这样的自动合并
    for k, v in pairs(Prefabs) do
        if k and not map[k] then
            local p = k:match("^(.+)%D%d+$")
            if p then
                map[k] = p
            end
            if k:match("winter_ornament") then
                map[k] = "winter_ornament"
            end
            if k:match("^medal_fruit_tree_.+_scion$") then
                map[k] = "medal_fruit_tree_scion"
            end

        end
    end
end
for k, v in pairs({"bfmt", "yzmn", "clzy", "rlsn", "clzx", "ygpy", "cbzh", "jyqy"}) do
    for ik, iv in pairs({"flower", "plume", "sands", "goblet", "circlet"}) do
        map[v .. "_" .. iv] = v
    end
end

local notdrop = {
    gift = 1,
    bundle = 1,
    redpouch = 1,
    redpouch_yotp = 1,
    wetpouch = 1,
    sora3packer = 1,
    sorapacker = 1
}
local cacheents = {}
local updateents = {}
local updatechests = {}
local UpdateEnts
local overfullfn = function(chest, inst)
    return inst:HasTag("bird")
end
local function toprefab(prefab)
    return map[prefab] or prefab or "unknow prefab"
end
local function CanStack(a, b)
    return a and b and a.components.stackable and b.components.stackable and a.prefab == b.prefab and a.skinname ==
               b.skinname and not a.components.stackable:IsFull()
    -- body
end
local function CanDeployAnyWhere()
    return true
end

local function HeLiMiZhi(inst, doer, maxplant, container)

    local x, y, z = inst.Transform:GetWorldPosition()
    -- x, y, z = TheWorld.Map:GetTileCenterPoint(x+4, 0, z)
    x = x + 4
    local ents = TheSim:FindEntities(x, y, z, 1.5, nil,
        {"FX", "NOBLOCK", "NOCLICK", "player", "INLIMBO", "_inventoryitem"})
    local num = #ents
    local pos = Vector3(x, y, z)
    for k, n in pairs(container) do
        local item = inst.components.container:GetItemInSlot(n)
        if item and item.components.deployable and not item.prefab:match("^turf_") and
            not (item.components.deployable.mode == DEPLOYMODE.TURF) then
            if num >= maxplant then
                return
            end
            item = inst.components.container:RemoveItem(item, true)
            if item.components.stackable then
                for i = 1, item.components.stackable.stacksize do
                    if num >= maxplant then
                        if item and item:IsValid() then
                            inst.components.container:GiveItem(item)
                        end
                        return
                    end
                    local one = item.components.stackable:Get()
                    one.components.deployable.CanDeploy = CanDeployAnyWhere
                    one.components.deployable.IsDeployable = CanDeployAnyWhere
                    one.components.deployable:Deploy(pos, doer or inst)
                    num = num + 1
                end
            else
                num = num + 1
                item.components.deployable.CanDeploy = CanDeployAnyWhere
                item.components.deployable:Deploy(pos, doer or inst)
            end
        end
    end
end

local function catch(inst)
    if not inst:IsInLimbo() and not inst:HasTag("decorationitem") and inst.components.inventoryitem and
        not inst.components.inventoryitem.owner and not (inst.components.health and inst.components.health:IsDead()) and
        inst:IsValid() then
        return true
    end
    return false
end

local function TryPutToContainer(chest, ents, container, fn)
    if not next(ents) then
        return true
    end
    local i = {}
    local con = chest.components.container
    local pos = chest:GetPosition()
    local puted = {}
    for k, v in pairs(ents) do
        i[k.prefab] = 1
    end
    for k, v in pairs(ents) do
        local over = false
        while catch(k) and i[k.prefab] <= #container and not over and (not fn or fn and fn(chest, k)) do
            local item = con:GetItemInSlot(container[i[k.prefab]])
            if CanStack(item, k) then
                if item.components.inventoryitem ~= nil and item.components.inventoryitem.owner ~= nil then
                    item.components.inventoryitem.owner:PushEvent("gotnewitem", {
                        item = item,
                        slot = container[i[k.prefab]]
                    })
                end
                local ret = item.components.stackable:Put(k, pos)
                if not ret then
                    puted[k] = 1
                    over = true
                    i[k.prefab] = i[k.prefab] - 1
                end
            elseif not item then
                con:GiveItem(k, container[i[k.prefab]], nil, true)
                if k.components.knownlocations then -- 有家就忘了 
                    k.components.knownlocations:ForgetLocation("home")
                end
                if k.components.inventoryitem then
                    k.components.inventoryitem:OnPickup(chest)
                end
                puted[k] = 1
                over = true
                i[k.prefab] = i[k.prefab] - 1
            end
            i[k.prefab] = i[k.prefab] + 1
        end
    end
    for k, v in pairs(puted) do
        ents[k] = nil
    end
    if not next(ents) then
        return true
    end
end
local DayUpdate
local TryPut
local GetOneItem
if TUNING.SORACHESTRANGE > 2000 then
    function DayUpdate() -- 只负责收东西
        if cmp:IsStop() then
            return
        end
        UpdateEnts()
        local topick = {}
        for ent, v in pairs(cacheents) do
            local p = toprefab(ent.prefab)
            if not topick[p] then
                topick[p] = {}
            end
            topick[p][ent] = 1
        end
        for _, d in pairs(orderData) do
            for chest, data in pairs(allchest[d[1]] or {}) do
                for index, c in pairs(data.c) do
                    if topick[c] then
                        TryPutToContainer(chest, topick[c], data.containers[index])
                    end
                end
            end
        end
    end
    function GetOneItem(chest, container, prefab, overfull)
        local ents = {}
        local pos = chest:GetPosition()
        for ent, v in pairs(cacheents) do
            if toprefab(ent.prefab) == prefab and catch(ent) then
                ents[ent] = 1
            end
        end
        TryPutToContainer(chest, ents, container)
        local first = true
        if overfull and next(ents) then
            for item, v in pairs(ents) do
                if not overfullfn(chest, item) then
                    if first then
                        first = false
                    else
                        return
                    end
                end
                if item.components.inventoryitem then
                    item.components.inventoryitem:OnPickup(chest)
                end
                item.Transform:SetPosition(pos:Get())
                if item.components.knownlocations then -- 有家就忘了 
                    item.components.knownlocations:ForgetLocation("home")
                end
                if item.components.inventoryitem then
                    item.components.inventoryitem:OnDropped(true)
                end
            end
        end
    end
else
    local maxrange = TUNING.SORACHESTRANGE * TUNING.SORACHESTRANGE
    function DayUpdate(inst, chest, container)
        if cmp:IsStop() then
            return
        end
        UpdateEnts()
        local topick = {}
        for ent, v in pairs(cacheents) do
            local p = toprefab(ent.prefab)
            if not topick[p] then
                topick[p] = {}
            end
            topick[p][ent] = 1
        end
        for _, d in pairs(orderData) do
            for chest, data in pairs(allchest[d[1]] or {}) do
                for index, c in pairs(data.c) do
                    if topick[c] then
                        TryPutToContainer(chest, topick[c], data.containers[index], function(a, b)
                            return a:GetDistanceSqToInst(b) < maxrange
                        end)
                    end
                end
            end
        end
    end
    function GetOneItem(chest, container, prefab, overfull)
        local ents = {}
        local pos = chest:GetPosition()
        for ent, v in pairs(cacheents) do
            if toprefab(ent.prefab) == prefab and catch(ent) and chest:GetDistanceSqToInst(ent) < maxrange then
                ents[ent] = 1
            end
        end
        TryPutToContainer(chest, ents, container)
        local first = true
        if overfull and next(ents) then
            for item, v in pairs(ents) do
                if not overfullfn(chest, item) then
                    if first then
                        first = false
                    else
                        return
                    end
                end
                if item.components.inventoryitem then
                    item.components.inventoryitem:OnPickup(chest)
                end
                item.Transform:SetPosition(pos:Get())
                if item.components.knownlocations then -- 有家就忘了 
                    item.components.knownlocations:ForgetLocation("home")
                end
                if item.components.inventoryitem then
                    item.components.inventoryitem:OnDropped(true)
                end
            end
        end
    end
end
local function GetItem(inst, data) -- 箱子收东西
    if cmp:IsStop() then
        return
    end
    UpdateEnts()
    for k, v in pairs(data.c) do
        if v then
            GetOneItem(inst, data.containers[k], v, data.overfull)
        end
    end

end

local function GetData(inst)
    return allchest[inst.sorachesttype] and allchest[inst.sorachesttype][inst] and
               allchest[inst.sorachesttype][inst].data
end
local function OnChestRemove(chest)
    TheWorld.components.sorachestmanager:UnReg(chest)
    -- body
end
local updategem = {
    opalpreciousgem = 100,
    orangegem = 50,
    yellowgem = 60,
    purplegem = 60
}
local GemTask = {
    opalpreciousgem = function(inst, data, v)
        local con = inst.components.container
        local use = (v % 30) == 0
        for k, container in pairs(data.containers) do
            for ik, slot in pairs(container) do
                local it = con:GetItemInSlot(slot)
                if it then
                    if it.components.fueled and it.components.fueled:GetPercent() < 1 then
                        it.components.fueled:DoDelta(50)
                    end
                    if it.components.armor and not it.components.armor.indestructible and
                        it.components.armor:GetPercent() < 10 then
                        local rep = it.components.armor:GetPercent() < 1 and 0.1 or 0.01
                        rep = it.components.armor.maxcondition * rep
                        it.components.armor.condition = it.components.armor.condition + rep
                        it:PushEvent("percentusedchange", {
                            percent = it.components.armor:GetPercent()
                        })
                    end
                    if use and it.components.finiteuses and it.components.finiteuses:GetPercent() < 10 then
                        local peruse = math.ceil(it.components.finiteuses.total *
                                                     (it.components.finiteuses:GetPercent() < 1 and 0.2 or 0.02))
                        peruse = math.max(peruse, 1)
                        if peruse > 1 or ((v % 180) == 0) or it.components.finiteuses:GetPercent() < 1 then
                            it.components.finiteuses:Use(-peruse)
                        end
                    end
                end
            end
        end
    end,
    orangegem = function(inst, data, v)
        GetItem(inst, data)
    end,
    yellowgem = function(inst, data, v)
        local pos = inst:GetPosition()
        local con = inst.components.container
        local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 30, {"sora2tree"})
        local ent = ents and ents[1]
        if not ent then
            return
        end
        for k, container in pairs(data.containers) do
            for ik, slot in pairs(container) do
                local it = con:GetItemInSlot(slot)
                if it and ik > 1 then
                    local item = con:RemoveItem(it, true)
                    ent.components.container:GiveItem(item)
                    if ent.components.container:IsFull() then
                        ent.components.soragift:GetItem()
                    end
                end
            end
        end
        if not ent.components.container:IsEmpty() then
            ent.components.soragift:GetItem()
        end
    end,

    purplegem = function(inst, data, v)
        local pos = inst:GetPosition()
        local con = inst.components.container
        for k, container in pairs(data.containers) do
            local full = true
            for ik, slot in pairs(container) do
                local it = con:GetItemInSlot(slot)
                if it then

                else
                    full = false
                end
            end
            if full then
                local gifts = {}
                local maxlevel = 1
                for ik, slot in pairs(container) do
                    local item = inst.components.container:GetItemInSlot(slot)
                    local level = SoraAPI.GetSoraPackLevel(item)
                    if item and ik > 1 and level < 30 then
                        local it = inst.components.container:RemoveItem(item, true)
                        table.insert(gifts, it)
                        maxlevel = math.max(maxlevel, level + 1)
                    end
                end
                if next(gifts) then
                    local gift = SpawnPrefab("sora3packer")
                    gift.components.unwrappable:WrapItems(gifts)
                    gift.sorapacklevel = maxlevel
                    for index, ent in pairs(gifts) do
                        if ent then
                            ent:Remove()
                        end
                    end
                    for index, newslot in pairs(container) do
                        if index > 1 then
                            local item = inst.components.container:GetItemInSlot(newslot)
                            if not item then
                                inst.components.container:GiveItem(gift, newslot)
                                gift = nil
                            end
                        end
                    end
                    if gift then
                        gift.Transform:SetPosition(pos:Get())
                        if gift.components.inventoryitem then
                            gift.components.inventoryitem:OnDropped(true)
                        end
                    end
                end
            end
        end
    end
}
local function UpdateChest(inst, data)
    for k, v in pairs(data.gem) do
        if updategem[k] then
            data.gemtask[k] = (data.gemtask[k] or 0) + (data.gem[k] * data.gem[k])
            if data.gemtask[k] >= updategem[k] then
                data.gemtick[k] = (data.gemtick[k] or 0) + 1
                data.gemtask[k] = 0
            end
        end
    end
    for k, v in pairs(data.gemtask) do
        if updategem[k] and (v % updategem[k]) == 0 then
            if GemTask[k] then
                GemTask[k](inst, data, data.gemtick[k] or 0)
            end
        end
    end
end

local function UpdateAllChest()
    local UnReg = {}
    for type, chests in pairs(allchest) do -- 统计失效箱子
        for k, v in pairs(chests) do
            if not k:IsValid() then
                if not UnReg[type] then
                    UnReg[type] = {}
                end
                UnReg[type][v] = 1
            end
        end
    end
    for type, chests in pairs(UnReg) do -- 清理失效箱子
        for k, v in pairs(chests) do
            allchest[type][v] = nil
            updatechests[v] = nil
        end
    end
    for k, v in pairs(updatechests) do -- 刷新有宝石的箱子
        UpdateChest(k, v) -- 只负责刷新宝石类  
    end
    -- body
end
local function TryCacheEnt(inst, all) -- 尝试缓存下来
    if not inst.replica then
        inst.SoraChestSkip = true
        return
    end
    if not inst.replica.inventoryitem then
        inst.SoraChestSkip = true
        return
    end
    if inst:HasTag("decorationitem") then
        inst.SoraChestSkip = true
        return
    end
    if inst.components.projectile and (inst.components.projectile.target or inst.components.projectile.dest) then -- 投射物
        inst.SoraChestSkip = true
        return
    end
    if inst:IsInLimbo() then -- 不可见实体
        return true
    end
    if inst.components.health and inst.components.health:IsDead() then -- 已经死了
        inst.SoraChestSkip = true
        return
    end
    if inst.components.inventoryitem and not inst.components.inventoryitem.owner then -- 无主的 缓存
        all[inst] = 1
    end
end
local function UpdateAllEnts() -- 尝试清除所有实体的跳过标记
    for k, v in pairs(Ents) do
        if v.SoraChestSkip and v.replica and v.replica.inventoryitem then
            v.SoraChestSkip = nil
        end
    end
end

function UpdateEnts() -- 尝试缓存有用的实体 减少运算量
    if not TheWorld.components.sorachestmanager.UpdateEntsCD() then
        return
    end
    if TheWorld.components.sorachestmanager.UpdateAllEntsCD() then
        UpdateAllEnts()
    end
    cacheents = {}
    for k, v in pairs(Ents) do
        if not v.SoraChestSkip then
            TryCacheEnt(v, cacheents)
        end
    end
end

local function ResetChestData(inst, doer)
    if not inst.sorachestdata then
        return
    end
    if not inst.components.container then
        return
    end
    local data = inst.sorachestdata
    local container = inst.components.container
    local pos = inst:GetPosition()
    data.gem = {}
    data.gemtask = data.gemtask or {}
    data.gemtick = data.gemtick or {}
    for k, v in pairs(data.controls) do -- 统计宝石
        local item = container:GetItemInSlot(v)
        if item and item:HasTag("gem") then
            data.gem[item.prefab] = (data.gem[item.prefab] or 0) + 1
            if item.components.stackable and item.components.stackable.stacksize > 1 then
                local itemdrop = item.components.stackable:Get(item.components.stackable.stacksize - 1)
                if itemdrop then
                    itemdrop.Transform:SetPosition(pos:Get())
                    if itemdrop.components.inventoryitem then
                        itemdrop.components.inventoryitem:OnDropped(true)
                    end
                    itemdrop.prevcontainer = nil
                    itemdrop.prevslot = nil
                    inst:PushEvent("dropitem", {
                        item = itemdrop
                    })
                end
            end
        elseif item then
            local itemdrop = container:RemoveItem(item, true)
            if itemdrop then
                itemdrop.Transform:SetPosition(pos:Get())
                if itemdrop.components.inventoryitem then
                    itemdrop.components.inventoryitem:OnDropped(true)
                end
                itemdrop.prevcontainer = nil
                itemdrop.prevslot = nil
                inst:PushEvent("dropitem", {
                    item = itemdrop
                })
            end
        end
    end
    if inst.components.preserver then
        local rate =
            (data.gem.redgem or 0) * (data.gem.redgem or 0) + (data.gem.bluegem or 0) * (data.gem.bluegem or 0) * -1 +
                0.5
        inst.components.preserver:SetPerishRateMultiplier(rate * 2)
    end
    for k, v in pairs(data.gemtask) do
        if not data.gem[k] then
            data.gemtask[k] = nil
        end
    end
    if data.gemtask and data.gemtask.yellowgem then
        data.gemtask.yellowgem = 30
    end
    if data.gemtask and data.gemtask.purplegem then
        data.gemtask.purplegem = 59
    end
    data.c = {}
    if InGamePlay then
        for k, slots in pairs(data.containers) do
            local first
            local drop_first
            for ik, slot in pairs(slots) do
                local item = container:GetItemInSlot(slot)
                if item then
                    local p = toprefab(item.prefab)
                    if notdrop[p] then
                        drop_first = drop_first or p
                    else
                        first = first or p
                    end
                    if first ~= p and not notdrop[p] then -- 丢弃多余的 
                        local itemdrop = container:RemoveItem(item, true)
                        if itemdrop then
                            itemdrop.Transform:SetPosition(pos:Get())
                            if itemdrop.components.inventoryitem then
                                itemdrop.components.inventoryitem:OnDropped(true)
                            end
                            itemdrop.prevcontainer = nil
                            itemdrop.prevslot = nil
                            inst:PushEvent("dropitem", {
                                item = itemdrop
                            })
                        end
                    end
                end
            end
            data.c[k] = first or drop_first -- 选定拾取的
            TheWorld.components.sorachestmanager:ResetCache()
            if not data.c[k] and inst.sorasign then
                data.c[k] = toprefab(inst.sorasign.name)
            end
        end
    end
    -- data.pick = 1
    local needupdate = false
    for k, v in pairs(data.gem) do
        if updategem[k] then
            needupdate = true
        end
    end
    if needupdate then
        updatechests[inst] = data -- 下一次刷新
    elseif updatechests[inst] then
        updatechests[inst] = nil
    end
end
local function OnOpen(inst, event)
    -- SoraAPI.CheckChestValid(inst)
end
local function OnClose(inst, event)
    local doer = event and event.doer
    ResetChestData(inst, doer)
    if not (doer and doer:HasTag("player")) then
        return
    end

    if not inst.sorachestdata then
        return
    end
    if not inst.components.container then
        return
    end
    -- SoraAPI.CheckChestValid(inst)
    local data = inst.sorachestdata
    GetItem(inst, data)
    if inGamePlay and data.gem.greengem and data.gem.greengem > 0 and doer and doer:HasTag("player") then
        for k, container in pairs(data.containers) do
            HeLiMiZhi(inst, doer, data.gem.greengem * data.gem.greengem * 2, container)
        end
    end
end
FindPrefab()

local function HitProtect(inst, data)
    if not inst.components.workable then
        return
    end
    if not inst.hitcount then
        inst.hitcount = 0
        inst.hitcd = SoraCD(30)
    end
    if inst.hitcd() then
        inst.hitcount = 0
        inst.components.workable.workleft = 10
    else
        inst.hitcount = inst.hitcount + 1
        if inst.hitcount > 4 then
            inst.components.workable.workleft = 0
        else
            inst.components.workable.workleft = 10
        end
    end
end
local function OnItemGet(inst,data)
    local controls = inst.sorachestdata.controls
    if data and data.item and data.slot then 
        if table.contains(controls,data.slot) and data.item:HasTag("gem") then 
            data.item:AddTag("nocrafting")
        end
    end
end
local function OnItemLose(inst,data)
    local controls = inst.sorachestdata.controls
    if data and data.prev_item and data.slot then 
        if table.contains(controls,data.slot) and data.prev_item:HasTag("gem") then 
            data.prev_item:RemoveTag("nocrafting")
        end
    end
end
local ChestData = SoraAPI.ChestData
local com = Class(function(self, inst)
    self.inst = inst
    cmp = self
    self.stoptime = 0
    self.chestcache = {}
    self.UpdateEntsCD = SoraCD(1)
    self.UpdateAllEntsCD = SoraCD(10)
    self.UpdateAllChestTask = inst:DoPeriodicTask(1, UpdateAllChest)
    -- self.UpdateEntsTask = inst:DoPeriodicTask(1, UpdateEnts)
    inst:WatchWorldState("cycles", function()
        UpdateAllEnts()
        inst:DoTaskInTime(1, DayUpdate)
        inst:DoTaskInTime(3, DayUpdate)
        inst:DoTaskInTime(5, DayUpdate)
    end)
end)
function com:SetStopTime(time)
    self.stoptime = time + GetTime()
end
function com:Pause(yes)
    self.stoptime = yes and -1 or 0
end
function com:IsStop()
    if self.stoptime < 0 then
        return true
    elseif self.stoptime == 0 then
        return false
    else
        return self.stoptime > GetTime()
    end
end
function com:GetStopTime(doer)
    local tosay = ""
    if self.stoptime == 0 then
        tosay = "正常收集中"
    elseif self.stoptime < 0 then
        tosay = "暂停收集中"
    else
        tosay = tostring(math.floor(self.stoptime - GetTime())) .. "s后恢复收集"
    end
    if doer then
        SoraAPI.Say(doer, tosay)
    end
    return tosay
end

function com:GetBuilderChest(doer)
    local chests = {}
    for type, v in pairs(allchest) do
        for chest, v in pairs(allchest[type]) do
            if chest and chest:IsValid() and
                (TUNING.SORACHESTRANGE > 2000 or chest:GetDistanceSqToInst(doer) <
                    (TUNING.SORACHESTRANGE * TUNING.SORACHESTRANGE)) then
                table.insert(chests, chest)
            end
        end
    end
    return chests
end
function com:ResetCache(item)
    local chestcache = self.chestcache
    if item then
        self.chestcache[item] = nil
    else
        self.chestcache = {}
    end
end
function com:GetCacheChest(item)
    local chestcache = self.chestcache
    local needprefab = toprefab(item)
    local t = GetTime()
    if chestcache[item] and (t - chestcache[item].time) < 10 then
        return chestcache[item].chest
    else
        chestcache[item] = {
            time = t,
            chest = {}
        }
        for type, v in pairs(allchest) do
            for chest, data in pairs(allchest[type]) do
                for k, v in pairs(data.c) do
                    if v == needprefab then
                        table.insert(chestcache[item].chest, {chest, k})
                    end
                end
            end
        end
        return chestcache[item].chest
    end
end

function com:GetItems(chest, k)
    local items = {}
    local toget = chest.sorachestdata.containers[k]
    if toget then
        for k, v in pairs(toget) do
            local item = chest.components.container:GetItemInSlot(v)
            if item then
                table.insert(items, item)
            end
        end
    end
    return items
end
function com:HasItem(doer, item, need)
    local chests = self:GetCacheChest(item)
    local needprefab = toprefab(item)
    local find = 0
    for k, data in pairs(chests) do
        local items = self:GetItems(data[1], data[2])
        if (TUNING.SORACHESTRANGE > 2000 or
            (data[1]:GetDistanceSqToInst(doer) < TUNING.SORACHESTRANGE * TUNING.SORACHESTRANGE)) then
            for _, it in pairs(items) do
                if it.prefab == item and not it:HasTag("nocrafting") then
                    find = find + (it.components.stackable and it.components.stackable.stacksize or 1)
                    if find >= need then
                        return find >= need, find
                    end
                end
            end
        end
    end
    return find >= need, find
end
function com:GetIngredients(doer, item, need)
    local chests = self:GetCacheChest(item)
    local needprefab = toprefab(item)
    local find = 0
    local itemsfind = {}
    for k, data in pairs(chests) do
        local items = self:GetItems(data[1], data[2])
        if (TUNING.SORACHESTRANGE > 2000 or
            (data[1]:GetDistanceSqToInst(doer) < TUNING.SORACHESTRANGE * TUNING.SORACHESTRANGE)) then
            for _, it in pairs(items) do
                if it.prefab == item and not it:HasTag("nocrafting") then
                    if it.components.stackable then 
                        local get = need - find
                        get = math.min(it.components.stackable.stacksize,get)
                        itemsfind[it] = get
                        find = find + get 
                    else
                        itemsfind[it] = 1
                        find = find +1 
                    end
                    if find >= need then
                        return itemsfind
                    end
                end
            end
        end
    end
    return itemsfind
end

function com:RegType(type, data)
    data.controls = data.controls or {}
    data.containers = data.containers or {}
    data.c = {}
    data.gem = {}

    data.update = {}
    data.updated = {}
    ChestData[type] = data
    orderData = {}
    for k, v in pairs(ChestData) do
        table.insert(orderData, {k, v.pri or 0})
    end
    table.sort(orderData, function(a, b)
        return a[2] > b[2]
    end)
end

function com:RegByType(chest, type)
    if ChestData[type] then
        if not allchest[type] then
            allchest[type] = {}
        end
        allchest[type][chest] = deepcopy(ChestData[type])
        chest.sorachestdata = allchest[type][chest]
        chest.sorachesttype = type
        chest:DoTaskInTime(0, ResetChestData)
        chest:ListenForEvent("onopen", OnOpen)
        chest:ListenForEvent("onclose", OnClose)
        chest:ListenForEvent("onremove", OnChestRemove)
        chest:ListenForEvent("worked", HitProtect)
        chest:ListenForEvent("itemget", OnItemGet)
        chest:ListenForEvent("itemlose", OnItemLose)
        chest:AddTag("sorasmartchest")
    end
end
function com:UnReg(chest)
    if chest.sorachesttype and allchest[chest.sorachesttype] then
        chest:RemoveEventCallback("onopen", OnOpen)
        chest:RemoveEventCallback("onclose", OnClose)
        chest:RemoveEventCallback("worked", HitProtect)
        chest:RemoveEventCallback("itemget", OnItemGet)
        chest:RemoveEventCallback("itemlose", OnItemLose)
        updatechests[chest] = nil
        chest.sorachestdata = nil
        allchest[chest.sorachesttype][chest] = nil
        chest:RemoveTag("sorasmartchest")
    end
end

function com:UpdateChest(chest)
    UpdateChest(chest)
end
function com:OnClose(chest, doer)
    OnClose(chest, {
        doer = doer
    })
end
function com:UpdateChest(chest)
    UpdateChest(chest)
end

function com:UpdataAllChest()
    UpdateAllChest()
end

function com:GetDebugString()
    local str = {"\nSoraChest"}
    table.insert(str, "collect:" .. self:GetStopTime())
    table.insert(str, "-----allchest-------")
    local trace = true
    for k, v in pairs(allchest) do
        table.insert(str, "prefab:" .. tostring(k) .. " num:" .. GetTableSize(v))
        if trace then
            for ik, iv in pairs(v) do
                if trace then
                    table.insert(str, "------------------------")
                    for key, va in pairs(iv) do
                        local ret, json = pcall(json.encode, va)
                        table.insert(str, "key:" .. key .. "  v:" .. tostring(json))
                    end
                    table.insert(str, "------------------------")
                    trace = false
                end
            end
        end
    end
    table.insert(str, "-----update-" .. GetTableSize(updatechests) .. "------")

    table.insert(str, "-----Ents-" .. GetTableSize(Ents) .. "|" .. GetTableSize(cacheents) .. "------")
    return table.concat(str, "\n")
end

return com
