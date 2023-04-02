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
	Asset("ANIM", "anim/sorahealing.zip"),
	Asset("ATLAS", "images/inventoryimages/sorahealing.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sorahealing.xml",256),
	Asset("IMAGE", "images/inventoryimages/sorahealing.tex"),
}

local prefabs = {
}
local cd1 = getsora("sorahealingcd1")
local cd2 = getsora("sorahealingcd2")
local att1 = getsora("sorahealingatt1")
local att2 = getsora("sorahealingatt2")
local player1 = getsora("sorahealingplayer1")
local player2 = getsora("sorahealingplayer2")
local function getname(inst)
inst.components.named:SetName(inst.heal and "穹の愈(治疗)" or  "穹の愈(冰冻)" )
end
local function upgrade(inst)
	inst.zbslevel = math.min(math.floor(inst.zbsnum / inst.need),inst.maxlevel)
	inst.hbslevel = math.min(math.floor(inst.hbsnum / inst.need),inst.maxlevel)
	inst.lbslevel = math.min(math.floor(inst.lbsnum / inst.need),inst.maxlevel)
	inst.cd = math.max(cd1 -inst.hbslevel*cd2,0)
	inst.components.weapon:SetDamage(math.max(att1+inst.zbslevel*att2,0))
	getname(inst)
end

local function OnRefuseItem(inst, giver, item)
	if item then
	local refusesay = "\t\t穹の愈\n物\t数\t级\t属"
			refusesay = refusesay..string.format("\n攻击(紫):\t%d/%d\t%d\t%d",inst.zbsnum,inst.need * inst.maxlevel,inst.zbslevel,math.max(att1+inst.zbslevel*att2,0))
			refusesay = refusesay..string.format("\n冷却(黄):\t%d/%d\t%d\t%d",inst.hbsnum,inst.need * inst.maxlevel,inst.hbslevel,math.max(cd1 -inst.hbslevel*cd2,0))
			refusesay = refusesay..string.format("\n治疗(绿):\t%d/%d\t%d\t%d",inst.lbsnum,inst.need * inst.maxlevel,inst.lbslevel,20+3*inst.lbslevel)
			giver.components.talker:Say(refusesay)
	end
end

local function AcceptTest(inst, item)
	if (item.prefab == "purplegem" ) then
		return 	inst.zbsnum < inst.need * inst.maxlevel,"GENERIC"
	elseif (item.prefab == "yellowgem") then
		return 	inst.hbsnum < inst.need * inst.maxlevel,"GENERIC"
	elseif (item.prefab == "greengem") then
		return 	inst.lbsnum < inst.need * inst.maxlevel,"GENERIC"
	end
	return false,"WRONGTYPE" 
end
local function TraderCount(inst, giver,item)
	if (item.prefab == "purplegem" ) then
		return  inst.need * inst.maxlevel -	inst.zbsnum 
	elseif (item.prefab == "yellowgem") then
		return 	 inst.need * inst.maxlevel - inst.hbsnum 
	elseif (item.prefab == "greengem") then
		return 	 inst.need * inst.maxlevel - inst.lbsnum 
	end
	return 1
end
local function OnGetItemFromPlayer(inst, giver, item)
		local num = 1
		if item.components.stackable then
		num = item.components.stackable.stacksize
		end
		if (item.prefab == "purplegem")then
			inst.zbsnum = inst.zbsnum + num
			inst.zbslevel = math.min(math.floor(inst.zbsnum / inst.need),inst.maxlevel)
			if inst.zbslevel < inst.maxlevel  then 
				giver.components.talker:Say("紫宝石数量:"..inst.zbsnum.."/"..inst.need*inst.maxlevel .."\tLV:"..inst.zbslevel.."\n攻击力："..(math.max(att1+inst.zbslevel*att2,0)))
				else
				giver.components.talker:Say("紫宝石已满\tLV:"..inst.maxlevel.."\n攻击力："..math.max(att1+inst.zbslevel*att2,0))
			end
		elseif (item.prefab == "yellowgem") 
			then
			inst.hbsnum = inst.hbsnum+num
			inst.hbslevel = math.min(math.floor(inst.hbsnum / inst.need),inst.maxlevel)
			if inst.hbslevel < inst.maxlevel then 
				giver.components.talker:Say("黄宝石数量:"..inst.hbsnum.."/"..inst.need *inst.maxlevel.."\tLV:"..inst.hbslevel.."\n冷却时间："..(math.max(cd1 -inst.hbslevel*cd2,0)))
				else
				giver.components.talker:Say("黄宝石已满\tLV:"..inst.maxlevel .."\n冷却时间："..math.max(cd1 -inst.hbslevel*cd2,0))
			end
		elseif (item.prefab == "greengem") 
			then
			inst.lbsnum = inst.lbsnum +num
			inst.lbslevel = math.min(math.floor(inst.lbsnum / inst.need),inst.maxlevel)
			if inst.lbslevel <  inst.maxlevel then 
				giver.components.talker:Say("绿宝石数量:"..inst.lbsnum.."/"..inst.need*inst.maxlevel.."\tLV:"..inst.lbslevel.."\n生命回复："..math.max(player1+inst.lbslevel*player2,0))
				else
				giver.components.talker:Say("绿宝石已满\tLV:"..inst.maxlevel .."\n生命回复："..math.max(player1+inst.lbslevel*player2,0))
			end	
		end

	upgrade(inst)
end

local function onpreload(inst, data)
	if data then
		inst.zbsnum = data.zbsnum or 0
		inst.hbsnum = data.hbsnum or 0
		inst.lbsnum = data.lbsnum or 0
		inst.heal = data.heal or false
		upgrade(inst)
	end
end

local function onsave(inst, data)
	data.zbsnum = inst.zbsnum
	data.hbsnum = inst.hbsnum
	data.lbsnum = inst.lbsnum
	data.heal = inst.heal
end

local function onequip(inst, owner) 
	if owner ~= nil and not owner:HasTag("sora") then 
	owner:DoTaskInTime(0, function()
            if owner.components.inventory  then owner.components.inventory :GiveItem(inst) end
            if  owner.components.talker then owner.components.talker:Say("这是Sora的法杖") end
        end)
	return
	end
    owner.AnimState:OverrideSymbol("swap_object", "sorahealing", "swap_weapon")
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

local function onuse (inst)
inst.heal = not inst.heal 
getname(inst)
	if inst.components.inventoryitem.owner then
	inst.components.inventoryitem.owner.components.talker:Say(inst.heal and "切换成功！现在会治疗怪物！" or "切换成功！现在会冰冻怪物！")
	end
return false
end
local function soramagicfn(staff, target, pos)
	local caster = staff.components.inventoryitem.owner
	if not caster or not caster:HasTag("Sora") then
	return false
	end
	local t = GetTime()
	if (t-staff.lastspell) < staff.cd then 
		t= staff.cd-t+staff.lastspell
		caster.components.talker:Say("冷却中："..math.floor(t).."S")
		return false
	end
	staff.lastspell = t 
	if not pos then
	pos  = target:GetPosition()
	end
	caster.components.sanity:DoDelta(-20*TUNING.SORAMODE)
	caster.components.hunger:DoDelta(-30*TUNING.SORAMODE)
	local x, y, z = pos:Get()
	local healstar = SpawnPrefab("sorahealstar")
	if healstar then
		healstar.Transform:SetPosition(pos:Get())
		healstar:Start(caster,staff,staff.heal)
	end
end

local function onhaunt (inst,doer)
	if not doer then
	return false
	end
	
	if not doer:HasTag("Sora") then
		if	doer.components.talker then
		doer.components.talker:Say("这是Sora的法杖")
		end
		return true
	end
	if inst.lbslevel < 5  then
		if	doer.components.talker then
		doer.components.talker:Say("法杖等级不足，需要5级才能使用")
		end
		return true
	end
	
	local t = GetTime()
	if (t-inst.cd2) < 300 then 
		t= 300-t+inst.cd2
		if	doer.components.talker then
		doer.components.talker:Say("冷却中："..math.floor(t).."S")
		end
		return true
	end
	if  doer:HasTag("playerghost")  then
		doer:PushEvent("respawnfromghost", { source = inst })
		inst.cd2 = t
		return true
	end
end
--[[
local function ReticuleTargetFn()
    return Vector3(ThePlayer.entity:LocalToWorldSpace(6.5, 0, 0))
end

local function ReticuleMouseTargetFn(inst, mousepos)
    if mousepos ~= nil then
        local x, y, z = inst.Transform:GetWorldPosition()
        local dx = mousepos.x - x
        local dz = mousepos.z - z
        local l = dx * dx + dz * dz
        if l <= 0 then
            return inst.components.reticule.targetpos
        end
        l = 6.5 / math.sqrt(l)
        return Vector3(x + dx * l, 0, z + dz * l)
    end
end

local function ReticuleUpdatePositionFn(inst, pos, reticule, ease, smoothing, dt)
    local x, y, z = inst.Transform:GetWorldPosition()
    reticule.Transform:SetPosition(x, 0, z)
    local rot = -math.atan2(pos.z - z, pos.x - x) / DEGREES
    if ease and dt ~= nil then
        local rot0 = reticule.Transform:GetRotation()
        local drot = rot - rot0
        rot = Lerp((drot > 180 and rot0 + 360) or (drot < -180 and rot0 - 360) or rot0, rot, dt * smoothing)
    end
    reticule.Transform:SetRotation(rot)
end
]]--

local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
	inst:AddTag("aquatic")
    anim:SetBank("sorahealing")
    anim:SetBuild("sorahealing")
    anim:PlayAnimation("idle")
	inst:AddTag("soratrader")
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sorahealing.tex")
	--[[inst:AddComponent("aoetargeting")
    inst.components.aoetargeting:SetAlwaysValid(true)
	inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoe"
    inst.components.aoetargeting.reticule.pingprefab = "reticuleaoeping"
    inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
	inst.components.aoetargeting.range=1
	
    --inst.components.aoetargeting.reticule.mousetargetfn = ReticuleMouseTargetFn
    --inst.components.aoetargeting.reticule.updatepositionfn = ReticuleUpdatePositionFn
    inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true
	]]--
	if not TheWorld.ismastersim then
        return inst
    end
	inst.zbsnum=0
	inst.hbsnum=0
	inst.lbsnum=0
	inst.zbslevel=0
	inst.hbslevel=0
	inst.lbslevel=0
	inst.need = TUNING.SORAMODE/2
	inst.maxlevel = 10 
	inst.cd =cd1
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[这是sora的治疗法杖
	通过紫色宝石升级攻击力
	通过黄色宝石降低施法冷却
	通过绿色宝石升级生命回复
	通过右键切换开关治疗还是冰冻怪物
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/sorahealing.xml"
	inst.components.inventoryitem.imagename = "sorahealing"
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	inst.components.equippable.walkspeedmult = getsora("sorahealingspe")
	inst:AddComponent("spellcaster")
    inst.components.spellcaster.canuseontargets = true
    inst.components.spellcaster.canonlyuseoncombat = true
	inst.components.spellcaster.quickcast = true
    inst.components.spellcaster.canuseonpoint = true
	--inst.components.spellcaster.CanCast = function() return true end
    inst.components.spellcaster:SetSpellFn(soramagicfn)
	inst.lastspell = GetTime()-cd1
	inst.cd2 = GetTime()-300
	--inst.magicfx.entity:SetParent(inst.entity)
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(att1)
	inst.components.weapon:SetRange(getsora("sorahealingrange"))
   --inst.components.weapon:SetElectric()
    --inst.components.weapon.OnAttack = onattack
	inst.components.weapon:SetProjectile("sorahealing_projectile")
	inst:AddComponent("trader")
	inst.cantrader = TraderCount
	inst.components.trader:SetAcceptTest(AcceptTest)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(onuse)
	inst.heal = false
	
	inst:AddComponent("named")
	getname(inst)
	inst:AddComponent("hauntable")
	inst.components.hauntable.onhaunt = onhaunt
    --inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
	inst:AddComponent("soraitem")
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
    return inst
end
return	Prefab( "sorahealing", fn, assets, prefabs)