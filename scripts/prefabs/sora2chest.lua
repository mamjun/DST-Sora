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
]]
require "prefabutil"
--[[
▶红 → 快速腐败效果
  ▶蓝 → 些许返鲜效果
  ▶紫 → 溢出物品自动打包
  ▶绿 → 自动种植箱子里的种子
  ▶橙 → 每隔一段时间收集物品
  ▶黄 → 自动丢物品到最近的圣诞树
  ▶彩 → 缓慢恢复耐久
多重效果可以叠加
重复可提升效果(紫黄除外)
]] --

local assets = {
    Asset("ANIM", "anim/sorachest.zip"), Asset("ANIM", "anim/sora2fire.zip"),
    Asset("ATLAS", "images/inventoryimages/sora2fire.xml"),
    Asset("IMAGE", "images/inventoryimages/sora2fire.tex"),
    Asset("ATLAS_BUILD", "images/inventoryimages/sora2fire.xml", 256)
}

local prefabs = {"collapse_small"}

local allchest = {}
local CheckChest
local UpdateChest 
local map = {}
local function FindPrefab() -- tools_1 tools_2 这样的自动合并
    for k, v in pairs(Prefabs) do
        if k then
            local p = k:match("^(.+)%D%d+$")
            if p then map[k] = p end
            if k:match("winter_ornament") then
                map[k] = "winter_ornament"
            end
        end
    end
end
for k,v in pairs({"bfmt","yzmn","clzy","rlsn","clzx","ygpy","cbzh","jyqy"}) do
    for ik,iv in pairs({"flower","plume","sands","goblet","circlet"}) do
        map[v.."_"..iv] = v
    end
end

local function cachetoprefab(prefab) return map[prefab] or prefab end

local function toprefab(...) -- 第一次调用的时候 遍历prefab 然后归一处理
    FindPrefab()
    toprefab = cachetoprefab
    return toprefab(...)
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
local items = {}
local TryPut

if TUNING.SORACHESTRANGE > 2000 then
    function TryPut(inst,chest)
        local p = toprefab(inst.prefab)
        for k,v in pairs(chest) do
            if v == p then
                k.components.container:GiveItem(inst, nil, nil, true)
                return 
            end
        end
    end
else
    local maxrange = TUNING.SORACHESTRANGE * TUNING.SORACHESTRANGE
    function TryPut(inst,chest)
        local p = toprefab(inst.prefab)
        for k,v in pairs(chest) do
            if v == p and inst:GetDistanceSqToInst(k) < maxrange  then
                k.components.container:GiveItem(inst, nil, nil, true)
                return 
            end
        end
    end
end

local function DayUpdate()
    local chest = {}
    for k,v in pairs(allchest) do
        chest[k] = CheckChest(k,true)
    end
    for k,v in pairs(Ents) do
        if type(v) == "table" and v.IsValid  and v:IsValid() and v.components.inventoryitem and
                not v:IsInLimbo() and
                not v.components.inventoryitem.owner then
                
                TryPut(v,chest)
        end
    end
end
SoarChestDayUpdate = DayUpdate
local GetItem
local function catch(inst)
    if inst:IsValid() and not inst:IsInLimbo() 
        and inst.components.inventoryitem and not inst.components.inventoryitem.owner
        and not (inst.components.health and inst.components.health:IsDead())
        then return true
    end
    
    return false
end
if TUNING.SORACHESTRANGE > 2000 then
    function GetItem(inst, prefab)
        local p = toprefab(prefab)
        local container = inst.components.container
        for k, v in pairs(Ents) do
            if type(v) == "table" and v.IsValid and catch(v) and toprefab(v.prefab) == p then
                if not (container:GiveItem(v, nil, nil, true)) then 
                    if not v:HasTag("bird") then
                        return 
                    end
                end
            end
        end
    end
else
    function GetItem(inst, prefab)
        local p = toprefab(prefab)
        local pos = Vector3(inst.Transform:GetWorldPosition())
        local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,
                                         TUNING.SORACHESTRANGE)
        local container = inst.components.container
        for k, v in pairs(ents) do
            if catch(v) and toprefab(v.prefab) == p then
                if not (container:GiveItem(v, nil, nil, true)) then 
                    if not v:HasTag("bird") then
                        return 
                    end
                end
            end
        end
    end
end

function CheckChest(inst,dontpick)
    if not inst:IsValid() then return end
    SoraAPI.CheckChestValid(inst)
    local container = inst.components.container
    local first
    local drop_first 
    local pos = Vector3(inst.Transform:GetWorldPosition())
    for i = 1, container:GetNumSlots() do
        local item = container:GetItemInSlot(i)
        if item then
            local p = toprefab(item.prefab)
            if notdrop[item.prefab] then
                drop_first = drop_first or p
            elseif not first and not (i >20 and item.prefab:match("gem") ) then
                first = p
            else
                if p ~= first and not (p:match("gem") and i>20 )then
                    local itemdrop = container:RemoveItem(item, true)
                    if itemdrop then
                        itemdrop.Transform:SetPosition(pos:Get())
                        if itemdrop.components.inventoryitem then
                            itemdrop.components.inventoryitem:OnDropped(true)
                        end
                        itemdrop.prevcontainer = nil
                        itemdrop.prevslot = nil
                        inst:PushEvent("dropitem", {item = itemdrop})
                    end
                end
            end
        end
    end
    for i =21,25 do
        local item = container:GetItemInSlot(i)
        if item and item.prefab:match("gem") then
            if item.components.stackable and item.components.stackable.stacksize >1 then
                local itemdrop = item.components.stackable:Get(item.components.stackable.stacksize-1)
                if itemdrop then
                    itemdrop.Transform:SetPosition(pos:Get())
                    if itemdrop.components.inventoryitem then
                        itemdrop.components.inventoryitem:OnDropped(true)
                    end
                    itemdrop.prevcontainer = nil
                    itemdrop.prevslot = nil
                    inst:PushEvent("dropitem", {item = itemdrop})
                end
            end
        end
    end
    first = first or drop_first
    if first and not dontpick then GetItem(inst, first) end
    
    return not container:IsFull()and first
end

local function GetPackLevel(data)
    local level = 1
    if data then
        if data.sorapacklevel then
            level = data.sorapacklevel
        elseif data.data and data.data.sorapacklevel then
            level = data.data.sorapacklevel
        elseif data.components and data.components.unwrappable and data.components.unwrappable.itemdata then
            for k,v in pairs(data.components.unwrappable.itemdata) do
                level = math.max(level,GetPackLevel(v)+1)
            end
        elseif data.data and data.data.unwrappable and data.data.unwrappable.itemdata then
            for k,v in pairs(data.data.unwrappable.itemdata) do
                level = math.max(level,GetPackLevel(v)+1)
            end
        end
    end
    return level 
end
    
    
local function GemTask(inst)
    inst.GemTime.orangegem =( inst.GemTime.orangegem or 50 ) - inst.Gem.orangegem * inst.Gem.orangegem
    inst.GemTime.opalpreciousgem =( inst.GemTime.opalpreciousgem or 100 ) - inst.Gem.opalpreciousgem * inst.Gem.opalpreciousgem
    inst.GemTime.opalpreciousgem2 =( inst.GemTime.opalpreciousgem2 or 1000 ) - (inst.Gem.opalpreciousgem *0.5+0.5)
    if inst.GemTime.orangegem <= 0 then
        inst.GemTime.orangegem = 50
        CheckChest(inst)
    end
    
    if inst.GemTime.opalpreciousgem <= 0 then
        inst.GemTime.opalpreciousgem = 100
        local container = inst.components.container
        for i = 1, container:GetNumSlots() do
            local item = container:GetItemInSlot(i)
            if item then
                if item.components.fueled then
                    item.components.fueled:DoDelta(50)
                end
                if item.components.armor then
                    item.components.armor:SetPercent(item.components.armor:GetPercent()+0.1)
                end
            end
        end
    end
    
    if inst.GemTime.opalpreciousgem2 <= 0 then
        inst.GemTime.opalpreciousgem2 = 1000
        local container = inst.components.container
        for i = 1, container:GetNumSlots() do
            local item = container:GetItemInSlot(i)
            if item and item.components.finiteuses then
                item.components.finiteuses:Use(-1)
                if  item.components.finiteuses:GetPercent() > 1 then
                    item.components.finiteuses:SetPercent(1)
                end
            end
        end
    end            
                
    if inst.Gem.purplegem > 0 then
        if inst.components.container:IsFull() then
            local gift = SpawnPrefab("sora3packer")
            local gifts = {}
            local maxlevel = 1 
            for n=2,25 do
                local item = inst.components.container:GetItemInSlot(n)
                local level = GetPackLevel(item)
                
                if item and not (n >20 and item.prefab:match("gem")) and level < 21 then
                    item = inst.components.container:RemoveItem(item, true)
                    table.insert(gifts,item)
                    maxlevel = math.max(maxlevel,level+1)
                end
            end
            gift.components.unwrappable:WrapItems(gifts)
            gift.sorapacklevel = maxlevel
            
            for k, v in pairs(gifts) do if v then v:Remove() end end
            inst.components.container:GiveItem(gift)
        end
    end           
end
local function CanDeployAnyWhere()
    return true
end
local function HeLiMiZhi(inst,m,doer)
    
    local x,y,z = inst.Transform:GetWorldPosition()
    x, y, z = TheWorld.Map:GetTileCenterPoint(x+4, 0, z)
    local ents = TheSim:FindEntities(x,y,z,2,nil,{"FX","NOBLOCK","NOCLICK","player","INLIMBO"})
    local num = #ents
    local pos = Vector3(x,y,z)
    for n=1,25 do 
        local item = inst.components.container:GetItemInSlot(n)
        if item and not item.prefab:match("gem") and item.components.deployable and not item.prefab:match("^turf_") and not (item.components.deployable.mode == DEPLOYMODE.TURF)  then
             if num >= m then return  end
             item = inst.components.container:RemoveItem(item, true)
             if item.components.stackable then
                for i=1,item.components.stackable.stacksize do
                    if num >= m then if item and item:IsValid() then inst.components.container:GiveItem(item) end return  end
                    local one = item.components.stackable:Get()
                    one.components.deployable.CanDeploy = CanDeployAnyWhere
                    one.components.deployable:Deploy(pos,doer or inst)
                    num = num +1
                end
             else
             num = num +1
             item.components.deployable.CanDeploy = CanDeployAnyWhere
             item.components.deployable:Deploy(pos,doer or inst)
             end
        end
    end

end
function UpdateChest(inst,doer) 
    local container = inst.components.container
    local gem = {
        purplegem  = 0,
        bluegem    = 0,
        redgem     = 0,
        orangegem  = 0,
        yellowgem  = 0,
        greengem   = 0,
        opalpreciousgem    = 0,
    }
    for i=21,25 do
        local item = container:GetItemInSlot(i)
        if item then
            local p = item.prefab
            if gem[p] then gem[p] = gem[p] +1 end
        end
    end
    local rate = gem.redgem * gem.redgem  + gem.bluegem * gem.bluegem * -1 +0.5
    inst.components.preserver:SetPerishRateMultiplier(rate*2)
    
    if (gem.orangegem + gem.opalpreciousgem + inst.Gem.purplegem) > 0 then
        if not inst.UpdateTask then
            inst.UpdateTask = inst:DoPeriodicTask(1,GemTask)
        end
    else
        if inst.UpdateTask then
            inst.UpdateTask:Cancel()
            inst.UpdateTask = nil
        end
    end
    inst.Gem = gem 
    if gem.greengem > 0 and inGamePlay  and doer then
        HeLiMiZhi(inst,gem.greengem * gem.greengem * 2,doer)
    end
    if gem.yellowgem > 0 then
        local pos = inst:GetPosition()
        local ents = TheSim:FindEntities(pos.x,pos.y,pos.z,30,{"sora2tree"})
        if ents and #ents > 0 then
            for i=2,20 do
                local it = container:GetItemInSlot(i)
                if it then
                    local item = inst.components.container:RemoveItem(it, true)
                    ents[1].components.container:GiveItem(item)
                    ents[1].components.soragift:GetItem()
                end
            end
            
        end
    end
end

local function onopen(inst)
    SoraAPI.CheckChestValid(inst)
    inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst,doer)
    SoraAPI.CheckChestValid(inst)
    inst:DoTaskInTime(0, CheckChest)
    if doer and doer:HasTag("player") then
        inst:DoTaskInTime( 0.1 , function ()
            UpdateChest(inst,doer)
        end )
    end
    inst.AnimState:PlayAnimation("close")
    inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
end

local function onhammered(inst, worker)
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.components.container:DropEverything()
    inst.AnimState:PushAnimation("closed", false)
    inst.components.container:Close()
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_craft")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("sora2fire.tex")
    -- MakeObstaclePhysics(inst, .4)
    -- inst:AddTag("fridge")
    inst:AddTag("structure")
    inst:AddTag("plantkin")
    inst:AddTag("nosteal")
    inst.AnimState:SetBank("sora2fire")
    inst.AnimState:SetBuild("sora2fire")
    inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    -- MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora2chest")
        end
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("好奇怪的箱子")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora2chest")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(1)
    if not TheWorld.sorachestdayupdate then
        TheWorld:WatchWorldState("cycles", function() 
            inst:DoTaskInTime(1, DayUpdate) 
            inst:DoTaskInTime(2, DayUpdate) 
            inst:DoTaskInTime(3, DayUpdate) 
            end)
        
        TheWorld.sorachestdayupdate = true
    end
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
    inst.GemTime = {}
    inst.Gem = {
        purplegem  = 0,
        bluegem    = 0,
        redgem     = 0,
        orangegem  = 0,
        yellowgem  = 0,
        greengem   = 0,
        opalpreciousgem    = 0,
    }
    inst:ListenForEvent("onbuilt", onbuilt)
    if TUNING.SMART_SIGN_DRAW_ENABLE then SMART_SIGN_DRAW(inst) end
    allchest[inst] = 1
    inst:ListenForEvent("OnRemove", function() allchest[inst] = nil end)
    inst:DoTaskInTime(0, UpdateChest)
    inst:ListenForEvent("itemget",function(i,data)
        if data.item and not data.item.prefab:match("gem") and not data.item:HasTag("bird") and data.slot >1 then
            if inst.Gem.yellowgem > 0 then
                local pos = i:GetPosition()
                local ents = TheSim:FindEntities(pos.x,pos.y,pos.z,30,{"sora2tree"})
                if ents and #ents > 0 then
                    local item = i.components.container:RemoveItem(data.item, true)
                    ents[1].components.container:GiveItem(item)
                    ents[1].components.soragift:GetItem()
                end
            end
        end
    end)
    return inst
end

return Prefab("sora2chest", fn, assets, prefabs),
       MakePlacer("sora2chest_placer", "chest", "treasure_chest", "closed")
