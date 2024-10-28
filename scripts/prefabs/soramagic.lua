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
	Asset("ANIM", "anim/soramagic.zip"),
	Asset("ATLAS", "images/inventoryimages/soramagic.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/soramagic.xml",256),
	Asset("IMAGE", "images/inventoryimages/soramagic.tex"),

	Asset("ANIM", "anim/soramagic_sby.zip"),
	Asset("ATLAS", "images/inventoryimages/soramagic_sby.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/soramagic_sby.xml",256),
	Asset("IMAGE", "images/inventoryimages/soramagic_sby.tex"),

}

local prefabs = {
"sorafireball_projectile"
}
local att1 = getsora("soramagicatt1")
local att2 = getsora("soramagicatt2")
local range1 = getsora("soramagicrange1")
local range2 = getsora("soramagicrange2")
local skill1 = getsora("soramagicskill1")
local skill2 = getsora("soramagicskill2")
local cd = math.max(getsora("soramagicskillcd"),0.01)
local function upgrade(inst)
	inst.hbslevel = math.min(math.floor(inst.hbsnum / inst.need),inst.maxlevel*5)
	inst.jsqlevel = math.min(math.floor(inst.jsqnum / inst.need),inst.maxlevel*5)
	inst.jzlevel = math.min(math.floor(inst.jznum / inst.need/10),inst.maxlevel*5)
	--攻击力
	inst.components.weapon:SetDamage(math.max(att1+inst.jzlevel*att2,0))
	--攻击范围
	inst.components.weapon:SetRange(math.max(range1+inst.jsqlevel*range2,0))
end

local function OnRefuseItem(inst, giver, item)
	if item then
	local refusesay = "\t\t穹の空\n物\t数\t级\t属"
			refusesay = refusesay..string.format("\n攻(金):\t%d/%d\t%d\t%d",inst.jznum,inst.need * inst.maxlevel*50,inst.jzlevel,math.max(att1+inst.jzlevel*att2,0))
			refusesay = refusesay..string.format("\n距(羽):\t%d/%d\t%d\t%d",inst.jsqnum,inst.need * inst.maxlevel*5,inst.jsqlevel,math.max(range1+inst.jsqlevel*range2,0))
			refusesay = refusesay..string.format("\n技(红):\t%d/%d\t%d\t%d",inst.hbsnum,inst.need * inst.maxlevel*5,inst.hbslevel,skill1+skill2*inst.hbslevel)
		giver.components.talker:Say(refusesay)
	end
end

local function AcceptTest(inst, item)
	if (item.prefab == "redgem" ) then
		return 	inst.hbsnum < inst.need * inst.maxlevel*5,"GENERIC"
	elseif (item.prefab == "feather_canary") then
		return 	inst.jsqnum < inst.need * inst.maxlevel*5,"GENERIC"
	elseif (item.prefab == "goldnugget") then
		return 	inst.jznum < inst.need * inst.maxlevel*50,"GENERIC"
	end
	return false,"WRONGTYPE" 
end
local function TraderCount(inst,giver,item)
	if (item.prefab == "redgem" ) then
		return  inst.need * inst.maxlevel*5 - inst.hbsnum
	elseif (item.prefab == "feather_canary") then
		return  inst.need * inst.maxlevel*5 - inst.jsqnum
	elseif (item.prefab == "goldnugget") then
		return  inst.need * inst.maxlevel*50 - inst.jznum
	end
	return 1
end
local function OnGetItemFromPlayer(inst, giver, item, player)
		local num = 1
		if item.components.stackable then
		num = item.components.stackable.stacksize
		end
		if (item.prefab == "redgem")then
			inst.hbsnum = inst.hbsnum + num
			inst.hbslevel = math.min(math.floor(inst.hbsnum / inst.need),inst.maxlevel*5)
			if inst.hbslevel < inst.maxlevel*5  then 
				giver.components.talker:Say("红宝石数量:"..inst.hbsnum.."/"..inst.need * inst.maxlevel*5 .."\tLV:"..inst.hbslevel.."\n技能伤害："..(math.max(skill1+skill2*inst.hbslevel,0)))
				else
				giver.components.talker:Say("红宝石已满\tLV:"..inst.maxlevel*5 .."\n技能伤害："..math.max(skill1+skill2*inst.hbslevel,0))
			end
			
		elseif (item.prefab == "feather_canary") 
			then
			inst.jsqnum = inst.jsqnum+num
			inst.jsqlevel = math.min(math.floor(inst.jsqnum / inst.need),inst.maxlevel*5)
			
			if inst.jsqlevel < inst.maxlevel *5   then 
				giver.components.talker:Say("羽毛数量:"..inst.jsqnum.."/"..inst.need * inst.maxlevel*5 .."\tLV:"..inst.jsqlevel.."\n攻击范围："..(math.max(range1+inst.jsqlevel*range2,0)))
				else
				giver.components.talker:Say("羽毛已满\tLV:"..inst.maxlevel *5 .."\n攻击范围："..math.max(range1+inst.jsqlevel*range2,0))
			end
			
		elseif (item.prefab == "goldnugget") 
			then
			inst.jznum = inst.jznum +num
			inst.jzlevel = math.min(math.floor(inst.jznum / inst.need/10),inst.maxlevel*5)
			if inst.jzlevel <  inst.maxlevel *5 
				then 
				giver.components.talker:Say("金子数量:"..inst.jznum.."/"..inst.need * inst.maxlevel*50 .."\tLV:"..inst.jzlevel.."\n攻击力："..(math.max(att1+inst.jzlevel*att2,0))  )
				else
				giver.components.talker:Say("金子已满\tLV:"..inst.maxlevel *5 .."\n攻击力："..math.max(att1+inst.jzlevel*att2,0))
			end	
		end

	upgrade(inst)
end

local function onpreload(inst, data)
	if data then
		inst.hbsnum = data.hbsnum or 0
		inst.jsqnum = data.jsqnum or 0
		inst.jznum = data.jznum or 0
		upgrade(inst)
	end
end

local function onsave(inst, data)
	data.hbsnum = inst.hbsnum
	data.jsqnum = inst.jsqnum
	data.jznum = inst.jznum
end


local function onequip(inst, owner) 
	if owner ~= nil and not owner:HasTag("sora") then 
	owner:DoTaskInTime(0, function()
            if owner.components.inventory  then owner.components.inventory :GiveItem(inst) end
            if  owner.components.talker then owner.components.talker:Say("这是Sora的法杖") end
        end)
	return
	end
    owner.AnimState:OverrideSymbol("swap_object", inst.skinname ~= "" and inst.skinname or "soramagic", "swap_weapon")
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

local function soramagicfn(staff, target, pos)
	local caster = staff.components.inventoryitem.owner
	if not caster or not caster:HasTag("Sora") then
	return false
	end
	if not staff.components.rechargeable:IsCharged() then 
		local t = math.floor(staff.components.rechargeable:GetTimeToCharge() )
		caster.components.talker:Say("冷却中"..t.."S")
		return false
	end
	if not pos then
	pos  = target:GetPosition()
	end
    local mul = caster.components.combat.externaldamagemultipliers:Get()
	local att = caster.components.combat.damagemultiplier * (math.max(skill1+skill2*staff.hbslevel,0))*mul
	SpawnPrefab("sorameteor"):AttackArea(caster, staff, pos,att)
	staff.components.rechargeable:Discharge(cd)
end
local function onattack(inst, attacker, target)
    if inst and attacker and target then
        local x, y, z = target:GetPosition():Get()
        local ents = TheSim:FindEntities(x, y, z, 2, nil, {"player", "companion","wall","sora2lm"})
        local att = attacker.components.combat.externaldamagemultipliers:Get() * attacker.components.combat.damagemultiplier
        local d = inst.components.weapon.damage * att
        for _,ent in ipairs(ents) do
            if ent and ent.entity:IsValid() and ent ~= target and ent.entity:IsVisible() and ent.components.health and not ent.components.health:IsDead() and ent.components.combat then
            ent.components.combat:GetAttacked(attacker,d,inst,"fire")
			end
		end
        if math.random() < 0.03 then
            SpawnPrefab("sorameteor"):AttackArea(attacker, inst, target:GetPosition(),att*(math.max(skill1+skill2*inst.hbslevel,0)))
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
    anim:SetBank("soramagic")
    anim:SetBuild("soramagic")
    anim:PlayAnimation("idle",true)
	inst:AddTag("soratrader")
	inst:AddTag("waterproofer")
	inst:AddTag("rechargeable")
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("soramagic.tex")
	
	if not TheWorld.ismastersim then
        return inst
    end
	inst.jsqnum=0
	inst.hbsnum=0
	inst.jznum=0
	inst.jsqlevel=0
	inst.hbslevel=0
	inst.jzlevel=0
	inst.need = TUNING.SORAMODE/2
	inst.maxlevel = 10 
	
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[
	这是sora的火焰法杖
	可以通过黄金升级攻击
	可以通过橙色羽毛升级攻击范围
	可以通过红宝石升级技能伤害
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/soramagic.xml"
	inst.components.inventoryitem.imagename = "soramagic"
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst.components.equippable.walkspeedmult = math.min(getsora("soramagicspe"),2.5)
	inst:AddComponent("spellcaster")
    inst.components.spellcaster.canuseontargets = true
    inst.components.spellcaster.canonlyuseoncombat = true
	inst.components.spellcaster.quickcast = true
    inst.components.spellcaster.canuseonpoint = true
	--inst.components.spellcaster.CanCast = function() return true end
    inst.components.spellcaster:SetSpellFn(soramagicfn)
	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetMaxCharge(cd)
	--inst.magicfx.entity:SetParent(inst.entity)
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(att1)
	inst.components.weapon:SetRange(range1)
    inst.components.weapon:SetOnAttack(onattack)
   --inst.components.weapon:SetElectric()
    --inst.components.weapon.OnAttack = onattack
	inst.components.weapon:SetProjectile("sorafireball_projectile")
	inst:AddComponent("trader")
	inst.cantrader = TraderCount
	inst.components.trader:SetAcceptTest(AcceptTest)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
    inst:AddComponent("soraitem")
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
    
    return inst
end
SoraAPI.MakeItemSkinDefaultData("soramagic", {}, {})
local tname = "soramagic_sby"
SoraAPI.MakeItemSkin("soramagic",tname , {
    name = "永恒水兵月",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank =  tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
	init_fn = function(inst)
		inst.components.weapon:SetProjectile("sorafireball_sby_projectile")
	end,
	clear_fn = function(inst)
		inst.components.weapon:SetProjectile("sorafireball_projectile")
	end,

})

local tname = "soramagic_wsqy"
SoraAPI.MakeItemSkin("soramagic",tname , {
    name = "赴约",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank =  tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
})
SoraAPI.MakeAssetTable(tname,assets)
return	Prefab( "soramagic", fn, assets, prefabs)