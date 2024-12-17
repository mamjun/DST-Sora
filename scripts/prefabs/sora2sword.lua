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
	Asset("ANIM", "anim/sora2sword.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2sword.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2sword.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2sword.xml", 256),
}

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "sora2sword", "swap_weapon")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal")
end
local function getname(inst)
inst.components.named:SetName(inst.hammer and "奇妙法杖(全开)"  or  "奇妙法杖(标准)" )
end

local function onuse (inst)
inst.hammer = not inst.hammer 
if inst.hammer then
	inst:AddTag("HAMMER_tool")
	inst:AddTag("DIG_tool")
else
	inst:RemoveTag("HAMMER_tool")
	inst:RemoveTag("DIG_tool")
end
getname(inst)
	if inst.components.inventoryitem.owner then
	inst.components.inventoryitem.owner.components.talker:Say(inst.hammer and "切换成功！现在可以锤和铲！" or "切换成功！现在不能锤和铲！")
	end
return false
end
local function onload(inst,data)
getname(inst)
end
local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
	inst:AddTag("aquatic")
	inst:AddTag("waterproofer")
	inst:AddTag("hammer")
    anim:SetBank("sora2sword")
    anim:SetBuild("sora2sword")
    anim:PlayAnimation("anim")
	inst:AddComponent("soratwoface")
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sora2sword.tex")
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("tool")
	
	inst.components.tool:SetAction(ACTIONS.CHOP,5)
	inst.components.tool:SetAction(ACTIONS.MINE,6)
	inst.components.tool:SetAction(ACTIONS.HAMMER)
	inst.components.tool:SetAction(ACTIONS.DIG)
	inst.components.tool:SetAction(ACTIONS.NET)
	inst.components.tool:EnableToughWork(true)
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	inst:AddComponent("fishingrod")
	inst.components.fishingrod:SetWaitTimes(3, 10)
	inst.components.fishingrod:SetStrainTimes(30, 60)
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[
	奇妙的法杖，可以做很多事情
	可以右键开关来切换是否可以锤和铲
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2sword.xml"
	inst.components.inventoryitem.imagename = "sora2sword"
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst.components.equippable.walkspeedmult = getsora("sora2swordspe")
	
	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(onuse)
	inst.hammer = false
	inst:RemoveTag("HAMMER_tool")
	inst:RemoveTag("DIG_tool")
	
	inst:AddComponent("named")
	getname(inst)
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(getsora("sora2swordatt"))
	inst.components.weapon:SetRange(getsora("sora2swordatt2"))
   --inst.components.weapon:SetElectric()
    --inst.components.weapon.OnAttack = onattack
	inst.components.weapon:SetProjectile("sora2sword_projectile")
	inst.OnLoad = onload 
    return inst
end
return	Prefab( "sora2sword", fn, assets, prefabs)