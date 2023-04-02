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
local assets=
{
	Asset("ANIM", "anim/sora_huapen.zip"),
	Asset("ATLAS", "images/inventoryimages/sora_huapen.xml"),
	Asset("IMAGE", "images/inventoryimages/sora_huapen.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora_huapen.xml", 256),
}

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("pot")
    inst:Remove()
end
local function onbuilt(inst)
    inst.AnimState:PlayAnimation("plant")
    inst.AnimState:PushAnimation("idle", true)
end
local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle", true)
end

local function SetSkin(inst,x,y)
    --inst.AnimState:SetBank("sora_huapen_"..x.."_"..y)

end
local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
    anim:SetBank("sora_huapen_1_1")
    anim:SetBuild("sora_huapen")
    anim:PlayAnimation("idle",true)
	if not TheWorld.ismastersim then
        return inst
    end
    inst.SetSkin = SetSkin
    inst:AddTag("structure")
    inst:AddComponent("sanityaura")
    inst.components.sanityaura.GetAura = function() return 10 / 60 end
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
    inst:ListenForEvent("onbuilt", onbuilt)
    inst:DoTaskInTime(0,function()
        if not inst.skinname then
            TheSim:ReskinEntity(inst.GUID, inst.skinname,"sora_huapen_"..math.random(1,2).."_"..math.random(1,10), nil, nil )
        end
    end)
    return inst
end

SoraAPI.MakeItemSkinDefaultImage("sora_huapen","images/inventoryimages/sora_huapen.xml","sora_huapen")

for x=1,2 do
    for y=1,10 do
        local name = "sora_huapen_"..x.."_"..y
        table.insert(assets,Asset("ATLAS", "images/inventoryimages/sora_huapen/"..name..".xml"))
        table.insert(assets,Asset("IMAGE", "images/inventoryimages/sora_huapen/"..name..".tex"))
        
        SoraAPI.MakeItemSkin("sora_huapen",name,{
            name = "穹の花盆",
            atlas = "images/inventoryimages/sora_huapen/"..name..".xml",
            image = name,
            build = "sora_huapen",
            bank = name,
            basebuild = "sora_huapen",
            basebank = "sora_huapen_1_1",
            init_fn = function(inst)   end
        })
    end
end
        
return	Prefab("sora_huapen", fn, assets, prefabs),
        MakePlacer("sora_huapen_placer", "sora_huapen_1_1", "sora_huapen", "idle")