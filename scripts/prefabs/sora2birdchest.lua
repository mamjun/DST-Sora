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
]] require "prefabutil"

local assets = {Asset("ANIM", "anim/sora2birdchest.zip"), Asset("ANIM", "anim/sorachest.zip"),
                Asset("ATLAS", "images/inventoryimages/sora2birdchest.xml"),
                Asset("IMAGE", "images/inventoryimages/sora2birdchest.tex"),
                Asset("ATLAS_BUILD", "images/inventoryimages/sora2birdchest.xml", 256)}

local prefabs = {"collapse_small"}

local function onopen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst)
    inst.components.sora2bird:GetItem()
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.components.container:DropEverything()
    inst.components.container:Close()
end

local function onbuilt(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_craft")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("sora2birdchest.tex")
    inst:AddTag("structure")
    inst:AddTag("nosteal")
    inst.AnimState:SetBank("sora2birdchest")
    inst.AnimState:SetBuild("sora2birdchest")
    inst.AnimState:PlayAnimation("idle", true)
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    -- MakeSnowCoveredPristine(inst)
    inst:AddComponent("talker")
    inst.components.talker.offset = Vector3(0, -200, 0)
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sorafire")
        end
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("又是加班的一天呢")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sorafire")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst:AddComponent("sora2bird")
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:ListenForEvent("onbuilt", onbuilt)

    return inst
end
RegisterInventoryItemAtlas("images/inventoryimages/sora2birdchest.xml", "sora2birdchest.tex")
SoraAPI.MakeItemSkinDefaultImage("sora2birdchest", GetInventoryItemAtlas("sora2birdchest.tex"), "sora2birdchest")
STRINGS.NAMES.SORA2BIRDCHEST = "咯咯哒"
SoraAPI.MakeItemSkinDefaultData("sora2birdchest", {}, {})
local tname = "sora2birdchest_ggd"
SoraAPI.MakeItemSkin("sora2birdchest", tname, {

    name = "菇菇毒",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = function(inst)
    end,

    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)
return Prefab("sora2birdchest", fn, assets, prefabs),
    MakePlacer("sora2birdchest_placer", "sora2birdchest", "sora2birdchest", "idle")
