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
local treeconfig = require "config/sora2tree"

require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/sorachest.zip"),
	Asset("ANIM", "anim/wintertree.zip"),
	Asset("ANIM", "anim/wintertree_build.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2tree.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2tree.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2tree.xml", 256),
    Asset("ANIM", "anim/sora2treedecor.zip"),
    Asset("ANIM", "anim/evergreen_new.zip"),
}
--有一个箱子 可以消耗物品获得经验
--根据经验可以领取礼物(每个玩家每天只能领一次) 礼物有一些材料  概率由经验决定 给出礼物之后消耗经验
--消耗的物品有一个列表 列表对应经验  不在列表里的不给放进来
--这是一颗树 根据经验等级装饰不一样 
local prefabs =
{
    "collapse_small",
}

local notdrop = {
	gift=1,
	bundle=1,
	redpouch=1,
	redpouch_yotp=1,
	wetpouch=1, 
	sora3packer=1,
	sorapacker=1,
}



local function onopen(inst)
    --inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst)
	inst.components.soragift:GetItem()
   -- inst.AnimState:PlayAnimation("close")
	--inst.AnimState:PlayAnimation("closed")
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
    inst.AnimState:PlayAnimation("chop_tall")
    inst.components.container:DropEverything()
    inst.AnimState:PushAnimation("sway1_loop_tall", true)
    inst.components.container:Close()
end
local function decor(inst,level)
    inst.AnimState:Hide("snow")
    inst.AnimState:ClearOverrideSymbol("plain1")
    inst.AnimState:ClearOverrideSymbol("plain2")
    inst.AnimState:ClearOverrideSymbol("plain3")
    inst.AnimState:ClearOverrideSymbol("plain4")
    inst.AnimState:ClearOverrideSymbol("plain5")
    inst.AnimState:ClearOverrideSymbol("plain6")
    inst.AnimState:ClearOverrideSymbol("plain7")
    inst.AnimState:ClearOverrideSymbol("plain8")
    if level >0 then inst.AnimState:OverrideSymbol("plain1", "sora2treedecor","decor7") end
    if level >1 then inst.AnimState:OverrideSymbol("plain2", "sora2treedecor","decor8") end
    if level >2 then inst.AnimState:OverrideSymbol("plain3", "sora2treedecor","decor9") end
    if level >3 then inst.AnimState:OverrideSymbol("plain4", "sora2treedecor","decor5") end
    if level >4 then inst.AnimState:OverrideSymbol("plain5", "sora2treedecor","decor4") end
    if level >5 then inst.AnimState:OverrideSymbol("plain6", "sora2treedecor","decor1") end
    if level >6 then inst.AnimState:OverrideSymbol("plain7", "sora2treedecor","decor2") end
    if level >7 then inst.AnimState:OverrideSymbol("plain8", "sora2treedecor","decor3") end
end
local function onbuilt(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/together/wintertree_place")
    inst.AnimState:PlayAnimation("grow_normal_to_tall", false)
    inst.AnimState:PushAnimation("sway1_loop_tall", true)
    decor(inst,0)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("sora2tree.tex")
	--MakeObstaclePhysics(inst, .4)
    --inst:AddTag("fridge")
    inst:AddTag("structure")
	inst:AddTag("sora2tree")
    inst.AnimState:SetBank("wintertree")
    inst.AnimState:SetBuild("evergreen_new")
    inst.AnimState:AddOverrideBuild("wintertree_build")
    inst.AnimState:PlayAnimation("sway1_loop_tall")
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")
    inst.AnimState:Hide("snow")
    inst:AddComponent("talker")
    inst.entity:SetPristine()
    
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora2tree")
        end
        return inst
    end
    
    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription("这是一颗树")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora2tree")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst:AddComponent("soragift")
    inst.components.soragift:SetConfig(treeconfig)
    inst.components.soragift.levelchangefn = decor
    
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit) 
    inst:ListenForEvent("onbuilt", onbuilt)
    
    return inst
end

return Prefab("sora2tree", fn, assets, prefabs),
    MakePlacer("sora2tree_placer", "wintertree", "wintertree_build", "idle")
