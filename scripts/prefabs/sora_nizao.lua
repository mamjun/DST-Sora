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
]] local All = {}

local function OnDropped(inst)

    if inst.components.workable ~= nil then
        inst.components.workable:SetWorkLeft(1)
    end
    if inst.components.stackable ~= nil then
        while inst.components.stackable:StackSize() > 1 do
            local item = inst.components.stackable:Get()
            if item ~= nil then
                if item.components.inventoryitem ~= nil then
                    item.components.inventoryitem:OnDropped()
                end
                local pos = inst:GetPosition() + Point(math.random(), 0, math.random())
                item.Transform:SetPosition(pos:Get())
                -- item.Physics:Teleport(inst.Transform:GetWorldPosition())
            end
        end
    end
end

local function OnWorked(inst, worker)
    if worker.components.inventory ~= nil then
        worker.components.inventory:GiveItem(inst, nil, inst:GetPosition())
        inst.components.workable:SetWorkLeft(1)
        worker.SoundEmitter:PlaySound("dontstarve/common/butterfly_trap")
    end
end
local function OnDeploy(inst, pt, deployer)
    local flower = SpawnPrefab(inst.prefab)
    if flower then
        flower.Transform:SetPosition(pt:Get())
        inst.components.stackable:Get():Remove()
        if deployer and deployer.SoundEmitter then
            deployer.SoundEmitter:PlaySound("dontstarve/common/plant")
        end
    end
end
function makebutter(ismoon)
    local function butterfn()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        inst:AddTag("NOBLOCK")
       
        inst.Transform:SetTwoFaced()
        inst.AnimState:SetBuild(ismoon and "butterfly_moon" or "butterfly_basic")
        inst.AnimState:SetBank("butterfly")
        inst.AnimState:PlayAnimation("idle_flight_loop", true)
        if ismoon then 
            inst.entity:AddLight()
            inst.Light:SetFalloff(.8)
            inst.Light:SetIntensity(.5)
            inst.Light:SetRadius(.5)
            inst.Light:SetColour(0.3, 0.55, 0.45)
            inst.Light:Enable(true)
            inst.Light:EnableClientModulation(true)
        
        end
        inst.entity:SetPristine()
        
        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddComponent("stackable")

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.imagename = (ismoon and "moon" or "") .. "butterfly"
        inst.components.inventoryitem.atlasname = GetInventoryItemAtlas((ismoon and "moon" or "") .. "butterfly.tex")
        inst.components.inventoryitem.canbepickedup = false
        inst.components.inventoryitem.canbepickedupalive = true
        inst.components.inventoryitem.nobounce = true
        inst.components.inventoryitem.pushlandedevents = false
        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.NET)
        inst.components.workable:SetWorkLeft(1)
        inst.components.workable:SetOnFinishCallback(OnWorked)
        inst:ListenForEvent("ondropped", OnDropped)
        inst:AddComponent("deployable")
        inst.components.deployable.ondeploy = OnDeploy
        inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)

        return inst
    end
    return Prefab("sora_" .. (ismoon and "moon" or "") .. "butterfly", butterfn)
end
table.insert(All, makebutter(false))
table.insert(All, makebutter(true))
table.insert(All, MakePlacer("sora_butterfly_placer", "butterfly", "butterfly_basic", "idle_flight_loop"))
table.insert(All, MakePlacer("sora_moonbutterfly_placer", "butterfly", "butterfly_moon", "idle_flight_loop"))
local function uninit(inst)
    if inst and inst.cat and inst.cat:IsValid() then
        local data, refs = inst.cat:GetPersistData()
        inst.components.sorasavecmp:SetSave("cat", {
            init = 0,
            data = data,
            refs = refs
        })
        inst.cat:AddTag("FX")
        inst.cat:AddTag("NOCLICK")
        if inst.cat.components.container:IsOpen() then
            inst.cat.components.container:Close()
        end
        local items = inst.cat.components.container:RemoveAllItems()
        for k, v in pairs(items) do
            v:Remove()
        end
        ErodeAway(inst.cat, 2)
        inst.components.rechargeable:Discharge(0)
    end
    inst.cat = nil
end
local function OnDropped(inst)
    uninit(inst)
end
local function onuse(inst, doer)
    if inst.cat and inst.cat:IsValid() then
        uninit(inst)
        if doer and doer.components.talker then
            doer.components.talker:Say("回去休息吧")
        end
        return false
    elseif doer then
        if doer.sora_lightflier_cat and doer.sora_lightflier_cat:IsValid() then
            if doer and doer.components.talker then
                doer.components.talker:Say("你已经有一只了")
            end
            return false
        end
        inst.components.rechargeable:Discharge(99999999)
        local cat = SpawnAt("sora_lightflier_cat", doer)

        local save = inst.components.sorasavecmp:GetSave("cat")
        if save and save.data then
            cat:SetPersistData(save.data, save.refs)
        end
        cat.components.container.canbeopened = true
        cat.components.sorafollewer:Init(doer)
        doer.sora_lightflier_cat = cat
        inst.cat = cat
        if doer and doer.components.talker then
            doer.components.talker:Say("拟造-萤火！")
        end
        return false
    end
    inst.components.rechargeable:Discharge(0)
    return false
end

function makelightflier()
    local function lightflierfn()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        inst:AddTag("NOBLOCK")
        inst:AddTag("rechargeable")
        inst:AddTag("soracantpack")
        inst.Transform:SetTwoFaced()
        inst.AnimState:SetBuild("lightflier")
        inst.AnimState:SetBank("lightflier")
        inst.AnimState:PlayAnimation("sleep_loop", true)
        
        inst.entity:SetPristine()
        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.imagename = "lightflier"
        inst.components.inventoryitem.atlasname = GetInventoryItemAtlas("lightflier.tex")
        inst.components.inventoryitem.canonlygoinpocket = true

        inst:AddComponent("sorauseable")
        inst.components.sorauseable:SetOnUseFn(onuse)
        inst:AddComponent("rechargeable")
        inst.components.rechargeable:SetMaxCharge(99999999)

        inst:AddComponent("sorasavecmp")
        inst.components.sorasavecmp:AddSave("cat", function(inst, data)
            if inst.cat and inst.cat:IsValid() then
                local d, r = inst.cat:GetPersistData()
                return {
                    init = (inst.cat and inst.cat:IsValid() and 1 or 0),
                    data = d,
                    refs = r
                }
            end
            return data
        end)
        inst.components.sorasavecmp:AddLoad("cat", function(i, data)
            if data.init == 1 and data.data then
                i:DoTaskInTime(1, function()
                    local owner = i.components.inventoryitem:GetGrandOwner()
                    if owner then
                        onuse(inst, owner)
                    end
                end)
            end
            return data
        end)

        inst:ListenForEvent("ondropped", OnDropped)
        inst:ListenForEvent("onremove", uninit)
        return inst
    end
    return Prefab("sora_lightflier", lightflierfn)
end
table.insert(All, makelightflier())
local catbrain = require "brains/sora_followerbrain"
function makelightflier_cat()

    local function lightflier_catfn()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        MakeGhostPhysics(inst, 1, .1)
        inst:AddTag("NOBLOCK")
        inst:AddTag("soracantpack")
        inst:AddTag("companion")
        inst:AddTag("nosteal")
        inst:AddTag("flying")
        inst.entity:SetCanSleep(false)
        inst.Transform:SetTwoFaced()
        inst.AnimState:SetBuild("lightflier")
        inst.AnimState:SetBank("lightflier")
        inst.AnimState:PlayAnimation("walk_loop", true)
        inst.AnimState:SetLightOverride(1)
        inst.entity:AddLight()
        inst.Light:SetFalloff(0.8)
        inst.Light:SetIntensity(.6)
        inst.Light:SetRadius(4.8)
        inst.Light:SetColour(237 / 255, 237 / 255, 209 / 255)
        inst.Light:Enable(true)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddComponent("container")
        inst.components.container.openlimit = 1
        inst.components.container:WidgetSetup("sora_lightflier_cat")
        inst.components.container.canbeopened = false
        inst:AddComponent("preserver")
        inst.components.preserver:SetPerishRateMultiplier(-5000)
        inst:DoTaskInTime(0,function ()
            if not inst.components.container.canbeopened then
                local items = inst.components.container:RemoveAllItems()
                for k,v in pairs(items) do
                    v:Remove()
                end
            end
        end)
        -- inst:AddComponent("locomotor")
        -- inst.components.locomotor.walkspeed = TUNING.LIGHTFLIER.WALK_SPEED * 3
        -- inst.components.locomotor.runspeed = TUNING.LIGHTFLIER.WALK_SPEED * 5
        -- inst.components.locomotor:SetTriggersCreep(false)
        -- inst.components.locomotor.pathcaps = { allowocean = true }

        inst:SetStateGraph("SGlightflier")
        -- inst:SetBrain(catbrain)
        inst:AddComponent("scaler")
        inst.components.scaler:SetScale(1.25)
        inst:AddComponent("sorafollewer")
        inst.magicfx = SpawnPrefab("cane_victorian_fx")
        if inst.magicfx then
            inst.magicfx.entity:AddFollower()
            inst.magicfx.entity:SetParent(inst.entity)
            inst.magicfx.Follower:FollowSymbol(inst.GUID, "body_full", 0, -60, 0)
        end
        inst.persists = false
        return inst
    end
    return Prefab("sora_lightflier_cat", lightflier_catfn)
end
table.insert(All, makelightflier_cat())


local assets =
{
    Asset("ANIM", "anim/sign_home.zip"),
    Asset("ANIM", "anim/ui_board_5x3.zip"),
    Asset("MINIMAP_IMAGE", "sign"),
}
local function OnDismantle(inst,doer)
    if not(doer and doer:HasTag("player"))then return end
    if not (inst.components.container and inst.components.container:IsEmpty()) then 
        return SoraAPI.Say(doer,"牌子里有物品哦") 
    end
    local item = SpawnPrefab("sora_sign_item")
    if item then 
        doer.components.inventory:GiveItem(item,nil,doer:GetPosition())
        inst:Remove()
    end
end
local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    MakeObstaclePhysics(inst, .2)
    inst.AnimState:SetBank("sign_home")
    inst.AnimState:SetBuild("sign_home")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Show("WRITING")
    inst:AddTag("NOBLOCK")
    inst:AddTag("soratargetthis")
    inst.entity:SetPristine()
    
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)
    inst:AddComponent("container")
    return inst
end
local function ondeploy(inst, pt, deployer)
    local blender = SpawnPrefab("sora_sign")
    if blender ~= nil then
        blender.Physics:SetCollides(false)
        blender.Physics:Teleport(pt.x, 0, pt.z)
        blender.Physics:SetCollides(true)
        blender.AnimState:PlayAnimation("idle", false)
        inst.components.stackable:Get():Remove()
    end
end

local function item_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("portable_blender")
    inst.AnimState:SetBuild("portable_blender")
    inst.AnimState:PlayAnimation("idle_ground")
    inst:AddTag("portableitem")
    MakeInventoryFloatable(inst, nil, 0.05, 0.7)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = GetInventoryItemAtlas("minisign_item.tex")
	inst.components.inventoryitem.imagename = "minisign_item"
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
    inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.NONE)
    return inst
end

table.insert(All, Prefab("sora_sign", fn, assets))
table.insert(All, Prefab("sora_sign_item", item_fn, assets))
table.insert(All, MakePlacer("sora_sign_placer", "sign_home", "sign_home", "idle"))
table.insert(All, MakePlacer("sora_sign_item_placer", "sign_home", "sign_home", "idle"))

return unpack(All)
