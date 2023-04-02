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
local assets =
{
    Asset("ANIM", "anim/sora_fl.zip"),
}
    
local function makeemptyfn(inst)
    if inst:HasTag("withered") or inst.AnimState:IsCurrentAnimation("idle_dead") then
        --inst.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
        inst.AnimState:PlayAnimation("dead_to_empty")
        inst.AnimState:PushAnimation("idle_empty", true)
    else
        inst.AnimState:PlayAnimation("idle_empty", true)
    end
end

local function makebarrenfn(inst)--, wasempty)
    if inst:HasTag("withered") or inst.AnimState:IsCurrentAnimation("idle_empty") then
        inst.AnimState:PlayAnimation("empty_to_dead")
        inst.AnimState:PushAnimation("idle_dead")
    else
        inst.AnimState:PlayAnimation("idle_dead")
    end
end

local function onpickedfn(inst, picker)
    inst.AnimState:PlayAnimation("rustle")
    inst.AnimState:PushAnimation("idle_empty")

end

local function makefullfn(inst)
    if inst.components.pickable:IsBarren() then
        inst.AnimState:PlayAnimation("empty_to_dead")
        inst.AnimState:PushAnimation("idle_dead", true)
    else
        inst.AnimState:PlayAnimation("grow")
        inst.AnimState:PushAnimation("idle_flower", true)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeSmallObstaclePhysics(inst, .1)

    inst:AddTag("plant")
    inst:AddTag("ghost")
    inst.MiniMapEntity:SetIcon("sora_fl.tex")

    inst.AnimState:SetBank("sora_fl")
    inst.AnimState:SetBuild("sora_fl")
    inst.AnimState:PlayAnimation("idle_flower", true)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.makeemptyfn = makeemptyfn
    inst.components.pickable.makebarrenfn = makebarrenfn
    inst.components.pickable.makefullfn = makefullfn
    inst.components.pickable:SetUp("sora_flh_helper", 480 * 20)
    inst.components.pickable.max_cycles = 5
    inst.components.pickable.cycles_left = 5
    inst.components.pickable.FinishGrowing = function () end
    local oldPick = inst.components.pickable.Pick 
    inst.components.pickable.Pick = function(s,doer,...)
        if doer and doer:HasTag("sora") then
            s.product = "sora_flh" 
            local r = oldPick(s,doer,...)
            s.product = "sora_flh_helper"
            return r
        else
            return oldPick(s,doer,...)
        end
    
    end
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("这个感觉.......是?")
    inst.components.inspectable.GetDescription = function(i,doer)
        if doer and doer.userid and inst:HasTag(doer.userid) then
            return "这个感觉.......是?"
        else
            return "这是"..(inst.components.sorabind.name or inst.components.sorabind.bind or "未知").."的风铃草"
        end
    end
    inst:AddComponent("sorabind")
    inst:AddComponent("sorafllink")
    return inst
end
STRINGS.NAMES.SORA_FL = "风铃草"
local function helperfn()
    local inst = CreateEntity()
    inst:DoTaskInTime(0,inst.Remove)

end
return Prefab("sora_fl", fn, assets),Prefab("sora_flh_helper",helperfn,assets),MakePlacer("sora_fl_place","sora_fl","sora_fl","idle_flower")
