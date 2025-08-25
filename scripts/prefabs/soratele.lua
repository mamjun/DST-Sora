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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]]
local assets=
{
	Asset("ANIM", "anim/soratele.zip"),
	Asset("ATLAS", "images/inventoryimages/soratele.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/soratele.xml",256),
	Asset("IMAGE", "images/inventoryimages/soratele.tex"),
}

local prefabs = {
}
local san1 = getsora("soratelesan1")
local san2 = getsora("soratelesan2")
local cd1 = getsora("soratelecd1")
local cd2 = getsora("soratelecd2")

local function upgrade(inst)
	inst.zbslevel = math.min(math.floor(inst.zbsnum / inst.need),inst.maxlevel)
	inst.sflevel = math.min(math.floor(inst.sfnum / inst.need/20),inst.maxlevel)
	inst.cd = math.max(cd1 -inst.zbslevel*cd2,0.01 )
	inst.sf = math.max(san1-inst.sflevel*san2,0)
	inst.components.rechargeable:SetMaxCharge(inst.cd)
end
local function getname(inst)
inst.components.named:SetName(inst.hammer and "穹の瞬(全开)"  or  "穹の瞬(标准)" )
end
local function onuse (inst)
inst.hammer = not inst.hammer 
if inst.hammer then
	inst:AddTag("HAMMER_tool")
	inst:AddTag("DIG_tool")
    inst:AddTag("propweapon")
    inst.components.weapon:SetRange(0)
else
	inst:RemoveTag("HAMMER_tool")
	inst:RemoveTag("DIG_tool")
    inst:RemoveTag("propweapon")
    inst.components.weapon:SetRange(12)
end
getname(inst)
	if inst.components.inventoryitem.owner then
	inst.components.inventoryitem.owner.components.talker:Say(inst.hammer and "切换成功！现在可以锤和铲！" or "切换成功！现在不能锤和铲！")
	end
return false
end

local function OnRefuseItem(inst, giver, item)
	if item then
	local refusesay = "\t\t穹の瞬\n物\t数\t级\t属"
			refusesay = refusesay..string.format("\n冷却(紫):\t%d/%d\t%d\t%d",inst.zbsnum,inst.need * inst.maxlevel,inst.zbslevel,math.max(cd1 -inst.zbslevel*cd2,0 ))
			refusesay = refusesay..string.format("\n消耗(梦):\t%d/%d\t%d\t%d",inst.sfnum,inst.need * inst.maxlevel*20,inst.sflevel,(math.max(san1-inst.sflevel*san2,0)))
			giver.components.talker:Say(refusesay)
	end
end

local function AcceptTest(inst, item)
	if (item.prefab == "purplegem") then
		return 	inst.zbsnum < inst.need * inst.maxlevel,"GENERIC"
	elseif (item.prefab == "nightmarefuel") then
		return 	inst.sfnum < inst.need * inst.maxlevel*20,"GENERIC"
	end
	return false,"WRONGTYPE" 
end
local function TraderCount(inst,giver,item)
	if (item.prefab == "purplegem") then
		return  inst.need * inst.maxlevel - inst.zbsnum
	elseif (item.prefab == "nightmarefuel") then
		return 	inst.need * inst.maxlevel*20 - inst.sfnum
	end
	return 1
end
local function OnGetItemFromPlayer(inst, giver, item)
		local num = 1
		if item.components.stackable then
		num = item.components.stackable.stacksize
		end
		if (item.prefab == "purplegem") 
			then
			inst.zbsnum = inst.zbsnum+num
			inst.zbslevel = math.min(math.floor(inst.zbsnum / inst.need),inst.maxlevel)
			if inst.zbslevel < inst.maxlevel then 
				giver.components.talker:Say("紫宝石数量:"..inst.zbsnum.."/"..inst.need *inst.maxlevel.."\tLV:"..inst.zbslevel.."\n冷却时间："..(math.max(cd1 -inst.zbslevel*cd2,0 )))

				else
				giver.components.talker:Say("紫宝石已满\tLV:"..inst.maxlevel .."\n冷却时间："..(math.max(cd1 -inst.zbslevel*cd2,0 )))
			end
		elseif (item.prefab == "nightmarefuel") 
			then
			inst.sfnum = inst.sfnum +num
			inst.sflevel = math.min(math.floor(inst.sfnum / inst.need/20),inst.maxlevel)
			if inst.sflevel <  inst.maxlevel then 
				giver.components.talker:Say("噩梦燃料数量:"..inst.sfnum.."/"..inst.need*20*inst.maxlevel.."\tLV:"..inst.sflevel.."\n施法消耗："..(math.max(san1-inst.sflevel*san2,0)))
				
			else
				giver.components.talker:Say("噩梦燃料已满\tLV:"..inst.maxlevel .."\n施法消耗："..(math.max(san1-inst.sflevel*san2,0)))
			end	
		end
		upgrade(inst)	
end

local function onpreload(inst, data)
	if data then
		inst.sfnum = data.sfnum or 0
		inst.zbsnum = data.zbsnum or 0
		upgrade(inst)
	end
	getname(inst)
end

local function onsave(inst, data)
	data.sfnum = inst.sfnum
	data.zbsnum = inst.zbsnum
end

local function onequip(inst, owner) 
	if owner ~= nil and not owner:HasTag("sora") then 
	owner:DoTaskInTime(0, function()
            if owner.components.inventory  then owner.components.inventory :GiveItem(inst) end
            if  owner.components.talker then owner.components.talker:Say("这是Sora的法杖") end
        end)
	return
	end
    owner.AnimState:OverrideSymbol("swap_object", inst.skinname or  "soratele", "swap_weapon")
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
local function SoraBlink(blink, pos, caster)
	if not caster or not caster:HasTag("Sora") then
	return false
	end
	local staff = blink.inst
	if not staff.components.rechargeable:IsCharged() then 
		local t= staff.components.rechargeable:GetTimeToCharge()
		caster.components.talker:Say("冷却中："..math.floor(t).."S")
		return true
	end
	staff.components.rechargeable:Discharge(staff.cd)
    if caster.components.sanity ~= nil then
        caster.components.sanity:DoDelta(-staff.sf)
    end
	staff.blink(blink, pos, caster)
	return true
end

local function NoHoles(pt)    --soratelepatch
    return not TheWorld.Map:IsGroundTargetBlocked(pt)
end
local function blinkstaff_reticuletargetfn()
    local player = ThePlayer
    local rotation = player.Transform:GetRotation() * DEGREES
    local pos = player:GetPosition()
    for r = 13, 1, -1 do
        local numtries = 2 * PI * r
        local offset = FindWalkableOffset(pos, rotation, r, numtries, false, true, NoHoles)
        if offset ~= nil then
            pos.x = pos.x + offset.x
            pos.y = 0
            pos.z = pos.z + offset.z
            return pos
        end
    end
end

local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
	inst:AddTag("aquatic")
    inst:AddTag("medal_fishingrod")
    anim:SetBank("soratele")
    anim:SetBuild("soratele")
    anim:PlayAnimation("idle",true)
	inst:AddComponent("soratwoface")
	inst:AddTag("soratrader")
    inst:AddTag("nopunch")
	inst:AddTag("rechargeable")
    inst:AddTag("allow_action_on_impassable")
	inst:AddTag("meteor_protection")
	inst:AddComponent("reticule")
    inst.components.reticule.targetfn = blinkstaff_reticuletargetfn
    inst.components.reticule.ease = true
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("soratele.tex")
	if not TheWorld.ismastersim then
        return inst
    end
	inst.zbsnum=0
	inst.sfnum=0
	inst.zbslevel=0
	inst.sflevel=0
	inst.sf = math.max(san1,0.01)
	inst.need = TUNING.SORAMODE/2
	inst.maxlevel = 10 
	inst.cd =math.max(cd1,0)
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[这是sora的瞬移法杖
	可以通过紫色宝石降低施法冷却
	可以通过噩梦燃料升级施法消耗]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/soratele.xml"
	inst.components.inventoryitem.imagename="soratele"
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst.components.equippable.walkspeedmult = getsora("soratelespe")
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	inst:AddComponent("blinkstaff")
    inst.components.blinkstaff:SetFX("sand_puff_large_front", "sand_puff_large_back")
	inst.blink = inst.components.blinkstaff.Blink
	inst.components.blinkstaff.Blink = SoraBlink
	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.CHOP,10)
	inst.components.tool:SetAction(ACTIONS.MINE,7.9)
	inst.components.tool:SetAction(ACTIONS.HAMMER)
	inst.components.tool:SetAction(ACTIONS.DIG,10)
	inst.components.tool:SetAction(ACTIONS.NET)
	inst.components.tool:EnableToughWork(true)
    inst:AddComponent("fishingrod")
	inst.components.fishingrod:SetWaitTimes(1, 3)
	inst.components.fishingrod:SetStrainTimes(60, 60)
	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(onuse)
	inst.hammer = false
	inst:RemoveTag("HAMMER_tool")
	inst:RemoveTag("DIG_tool")
	
	inst:AddComponent("named")
    inst:DoTaskInTime(0.1,getname)
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(17)
	inst.components.weapon:SetRange(12)
	inst.components.weapon:SetProjectile("soratele_projectile")
	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetMaxCharge(inst.cd)

	inst:AddComponent("trader")
    inst:AddComponent("soraitem")
	inst.cantrader = TraderCount
	inst.components.trader:SetAcceptTest(AcceptTest)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	inst.cantrader = TraderCount
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
    
    return inst
end
SoraAPI.MakeItemSkinDefaultData("soratele", {}, {})
local tname = "soratele_wsqy"
SoraAPI.MakeItemSkin("soratele",tname , {
    name = "荒野",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank =  tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
})
SoraAPI.MakeAssetTable(tname,assets)
return	Prefab( "soratele", fn, assets, prefabs)