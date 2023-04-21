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
	Asset("ANIM", "anim/sora2plant.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2plant.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2plant.xml",256),
	Asset("IMAGE", "images/inventoryimages/sora2plant.tex"),
}

local prefabs = {
}


local function onequip(inst, owner) 
	if owner ~= nil and not owner:HasTag("sora") then 
	owner:DoTaskInTime(0, function()
            if owner.components.inventory  then owner.components.inventory :GiveItem(inst) end
            if  owner.components.talker then owner.components.talker:Say("这是Sora的法杖") end
        end)
	return
	end
    owner.AnimState:OverrideSymbol("swap_object", "sora2plant", "swap_weapon")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal")
	if inst.magicfx ~= nil then
        inst.magicfx:Remove()
        inst.magicfx = nil
    end
	inst.magicfx = SpawnPrefab("cane_victorian_fx")
	if inst.magicfx then 
	inst.magicfx.entity:AddFollower()
	inst.magicfx.entity:SetParent(owner.entity)
    inst.magicfx.Follower:FollowSymbol(owner.GUID, "swap_object", 0, -60, 0)
	end
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal")
	if inst.magicfx ~= nil then
        inst.magicfx:Remove()
        inst.magicfx = nil
    end
end


local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
	inst:AddTag("aquatic")
    anim:SetBank("sora2plant")
    anim:SetBuild("sora2plant")
    anim:PlayAnimation("anim")
    inst:AddTag("nopunch")
    inst:AddTag("allow_action_on_impassable")
	inst:AddTag("rechargeable")
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sora2plant.tex")
	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2plant.xml"
	inst.components.inventoryitem.imagename = "sora2plant"
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	inst.components.equippable.walkspeedmult = math.min(getsora("sora2swordspe"),2.5)
	-- inst:AddComponent("spellcaster")
	-- inst.components.spellcaster.CanCast = function() return true end
    -- inst.components.spellcaster.canuseontargets = true
	-- inst.components.spellcaster.quickcast = true
    -- inst.components.spellcaster.canuseonpoint = true
    -- inst.components.spellcaster.canuseonpoint_water = true
    -- inst.components.spellcaster:SetSpellFn(soramagicfn)
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(10)
	inst.components.weapon:SetRange(8)
	inst.components.weapon:SetProjectile("sorapick_projectile")

	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetMaxCharge(10)

	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
    
    return inst
end
return	Prefab( "sora2plant", fn, assets, prefabs)