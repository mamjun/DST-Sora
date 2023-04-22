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
    owner.AnimState:OverrideSymbol("swap_object", "sora2plant", "swap_weapon")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal")
end
local function StartAOETargeting(inst)
	local playercontroller = ThePlayer.components.playercontroller
	if playercontroller ~= nil then
		playercontroller:StartAOETargetingUsing(inst)
	end
end
local function ReticuleTargetAllowWaterFn()
	local player = ThePlayer
	local ground = TheWorld.Map
	local pos = Vector3()
	--Cast range is 8, leave room for error
	--4 is the aoe range
	for r = 7, 0, -.25 do
		pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
		if ground:IsPassableAtPoint(pos.x, 0, pos.z, true) and not ground:IsGroundTargetBlocked(pos) then
			return pos
		end
	end
	return pos
end

local ICON_SCALE = .6
local ICON_RADIUS = 60
local SPELLBOOK_RADIUS = 100
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2
local SPELLS =
{
	{
		label = "3x3",	--铲出3x3的坑
		onselect = function(inst) end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_protector.tex",
	},
	{
		label = "4x4",	--铲出4x4的坑
		onselect = function(inst) end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_trap.tex",
	},
	{
		label = "9x9",	--铲出9x9的坑 仅限穹妹
		onselect = function(inst) end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_pillars.tex",
	},
	{
		label = "收",	--批量收取大作物的产出 仅限穹妹 且可以铲树根 
		onselect = function(inst) end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_pillars.tex",
	},
	{
		label = "育",	--作物的压力值-2 仅限穹妹 15级以后 每个作物只能1次 
		onselect = function(inst) end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_pillars.tex",
	},
	{
		label = "肥",	--对普通作物进行施肥     穹妹10级以后 可以对农田进行施肥  15级以后 可以把普通作物转换为野生状态 参考空白
		onselect = function(inst) end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_pillars.tex",
	}
}
for k, v in pairs(SPELLS) do
	v.widget_scale = ICON_SCALE
	v.hit_radius = ICON_RADIUS
	v.execute = StartAOETargeting
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

	inst:AddComponent("spellbook")
	inst.components.spellbook:SetRadius(100)
	inst.components.spellbook:SetFocusRadius(102)
	inst.components.spellbook:SetItems(SPELLS)
	inst.components.spellbook.opensound = "dontstarve/common/together/book_maxwell/use"
	inst.components.spellbook.closesound = "dontstarve/common/together/book_maxwell/close"
	--inst.components.spellbook.executesound = "dontstarve/common/together/book_maxwell/close"

	inst:AddComponent("aoetargeting")
	inst.components.aoetargeting:SetAllowWater(false)
	inst.components.aoetargeting.reticule.targetfn = nil
	inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
	inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
	inst.components.aoetargeting.reticule.ease = true
	inst.components.aoetargeting.reticule.mouseenabled = true
	inst.components.aoetargeting.reticule.twinstickmode = 1
	inst.components.aoetargeting.reticule.twinstickrange = 8

	if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[桃源深处有
	大规模手工业生产基地]])
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
	inst.components.rechargeable:SetMaxCharge(5)

    return inst
end
return	Prefab( "sora2plant", fn, assets, prefabs)