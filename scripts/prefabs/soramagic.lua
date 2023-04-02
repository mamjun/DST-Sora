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
local cd = math.max(getsora("soramagicskillcd"),0)
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
    owner.AnimState:OverrideSymbol("swap_object", "soramagic", "swap_weapon")
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
--[[
local DESTSOUNDS =
{
    {   --magic
        soundpath = "dontstarve/common/destroy_magic",
        ing = { "nightmarefuel", "livinglog" },
    },
    {   --cloth
        soundpath = "dontstarve/common/destroy_clothing",
        ing = { "silk", "beefalowool" },
    },
    {   --tool
        soundpath = "dontstarve/common/destroy_tool",
        ing = { "twigs" },
    },
    {   --gem
        soundpath = "dontstarve/common/gem_shatter",
        ing = { "redgem", "bluegem", "greengem", "purplegem", "yellowgem", "orangegem" },
    },
    {   --wood
        soundpath = "dontstarve/common/destroy_wood",
        ing = { "log", "boards" },
    },
    {   --stone
        soundpath = "dontstarve/common/destroy_stone",
        ing = { "rocks", "cutstone" },
    },
    {   --straw
        soundpath = "dontstarve/common/destroy_straw",
        ing = { "cutgrass", "cutreeds" },
    },
}
local DESTSOUNDSMAP = {}
for i, v in ipairs(DESTSOUNDS) do
    for i2, v2 in ipairs(v.ing) do
        DESTSOUNDSMAP[v2] = v.soundpath
    end
end
DESTSOUNDS = nil
local function stackin (v,v1,k,k1)
	if v and v1 then
        local newtotal = v.components.stackable.stacksize + v1.components.stackable.stacksize
        local oldsize = v.components.stackable.stacksize
        local newsize = math.min(v.components.stackable.maxsize, newtotal)        
        if v.components.stackable.maxsize >= newtotal then
            v1.soradel = true
        else
            v1.components.stackable:SetStackSize(newtotal - v.components.stackable.maxsize)
        end
        v.components.stackable:SetStackSize(newsize)
	end
end

local function stackall(pos)
	local finds = TheSim:FindEntities(pos.x, pos.y, pos.z, 5)
	for k,v in pairs (finds) do 
		if v and not v.soradel and v.components.stackable and not v.components.stackable:IsFull() and not v.components.inventoryitem.owner then
			for k1,v1 in pairs (finds) do 
				if v1 and not v1.soradel and k ~= k1 and v ~= v1 and v.prefab == v1.prefab and not v1.components.inventoryitem.owner   then
				stackin(v,v1,k,k1)
				end
			end
		end
	end 
	for k,v in pairs (finds) do 
		if v and v.soradel then
			v:Remove()
		end
	end 
end

local function CheckSpawnedLoot(loot)
    if loot.components.inventoryitem == nil or not loot.components.inventoryitem:IsHeld() then
        local x, y, z = loot.Transform:GetWorldPosition()
        if not loot:IsOnValidGround() or TheWorld.Map:IsPointNearHole(Vector3(x, 0, z)) then
            SpawnPrefab("splash_ocean").Transform:SetPosition(x, y, z)
            if loot:HasTag("irreplaceable") then
                loot.Transform:SetPosition(FindSafeSpawnLocation(x, y, z))
            else
                loot:Remove()
            end
        end
    end
end

local function SpawnLootPrefab(inst, lootprefab,lootnum)
    if lootprefab == nil then
        return
    end
while lootnum > 0 do
	
    local loot = SpawnPrefab(lootprefab)
    if loot == nil then
        return
    end
	if loot.components.stackable then 
			if loot.components.stackable.maxsize >= lootnum then
			loot.components.stackable:SetStackSize(lootnum)
			lootnum = 0 
			else 
			loot.components.stackable:SetStackSize(loot.components.stackable.maxsize)
			lootnum = lootnum - loot.components.stackable.maxsize
			end
	else
	lootnum = lootnum -1
	end
    local x, y, z = inst.Transform:GetWorldPosition()

    if loot.Physics ~= nil then
        local angle = math.random() * 2 * PI
        loot.Physics:SetVel(2 * math.cos(angle), 10, 2 * math.sin(angle))

        if inst.Physics ~= nil then
            local len = loot:GetPhysicsRadius(0) + inst:GetPhysicsRadius(0)
            x = x + math.cos(angle) * len
            z = z + math.sin(angle) * len
        end

        loot:DoTaskInTime(1, CheckSpawnedLoot)
    end

    loot.Transform:SetPosition(x, y, z)
end

end

local function soramagicfnone(staff,target) 
	local ret =0 
	local recipe = AllRecipes[target.prefab]
		if recipe == nil or target:HasTag("nosoramagic") then
        --不可建造的物品不处理
        return ret
		end
		
		if target.components.inventoryitem and target.components.inventoryitem.owner ~= nil then
		return ret
		end
		
		--返还材料
		local caster = staff.components.inventoryitem.owner
		local stacksize = 1
		if target.components.stackable then stacksize = target.components.stackable.stacksize end

			for i, v in ipairs(recipe.ingredients) do
				ret = 1
				if caster ~= nil and DESTSOUNDSMAP[v.type] ~= nil then
				caster.SoundEmitter:PlaySound(DESTSOUNDSMAP[v.type])
				end
				SpawnLootPrefab(target, v.type,stacksize * v.amount) 
			end
		
		if target.components.inventory ~= nil then target.components.inventory:DropEverything() end
		if target.components.container ~= nil then target.components.container:DropEverything() end
		if target.components.spawner ~= nil and target.components.spawner:IsOccupied() then target.components.spawner:ReleaseChild() end
		if target.components.occupiable ~= nil and target.components.occupiable:IsOccupied() then
			local item = target.components.occupiable:Harvest()
			if item ~= nil then
				item.Transform:SetPosition(target.Transform:GetWorldPosition())
				item.components.inventoryitem:OnDropped()
			end
		end

		if target.components.trap ~= nil then target.components.trap:Harvest() end
		if target.components.dryer ~= nil then target.components.dryer:DropItem() end
		if target.components.harvestable ~= nil then target.components.harvestable:Harvest() end
		if target.components.stewer ~= nil then target.components.stewer:Harvest() end
		target:Remove()
	return ret
end

local function soramagicfn(staff, target, pos)
	local caster = staff.components.inventoryitem.owner
	if caster.components.sanity.current < staff.sf then
		caster.components.talker:Say("法力不足，当前需要："..staff.sf)
	return
	end
	local count = 0
    local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 2.7)
    for k,v in pairs(ents) do
		count = count + soramagicfnone(staff,v)
    end
	stackall(pos)
	--施法声音和消耗
	if count > 0 then
		
		if caster ~= nil then
			caster.SoundEmitter:PlaySound("dontstarve/common/staff_dissassemble")
			if caster.components.sanity ~= nil then
				caster.components.sanity:DoDelta(-staff.sf)
			end
		end
	end
end

local function onattack(inst, attacker, target)
	if not target:IsValid() then
		--target killed or removed in combat damage phase
		return
	end
	--local x, y, z = target.Transform:GetWorldPosition()
	--SpawnPrefab("soralighting").Transform:SetPosition(x, y - .5, z)
end
]]--

local function soramagicfn(staff, target, pos)
	local caster = staff.components.inventoryitem.owner
	if not caster or not caster:HasTag("Sora") then
	return false
	end
	local t = GetTime()
	if (t-staff.lastspell) < cd then 
		t= cd-t+staff.lastspell
		caster.components.talker:Say("冷却中："..math.floor(t).."S")
		return false
	end
	staff.lastspell = t 
	if not pos then
	pos  = target:GetPosition()
	end
    local mul = caster.components.combat.externaldamagemultipliers:Get()
	local att = caster.components.combat.damagemultiplier * (math.max(skill1+skill2*staff.hbslevel,0))*mul
	SpawnPrefab("sorameteor"):AttackArea(caster, staff, pos,att)
	
end
local function onattack(inst, attacker, target)
    if inst and attacker and target then
        local x, y, z = target:GetPosition():Get()
        local ents = TheSim:FindEntities(x, y, z, 2, nil, {"player", "companion","wall","sora2lm"})
        local att = attacker.components.combat.externaldamagemultipliers:Get() * attacker.components.combat.damagemultiplier
        local d = inst.components.weapon.damage * att
        for _,ent in ipairs(ents) do
            if ent and ent.entity:IsValid() and ent ~= target and ent.entity:IsVisible() and ent.components.health and not ent.components.health:IsDead() and ent.components.combat then
            ent.components.combat:GetAttacked(attacker,d,inst)
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
    anim:PlayAnimation("idle")
	inst:AddTag("soratrader")
	inst:AddTag("waterproofer")
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
	inst.lastspell = GetTime()-cd
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
return	Prefab( "soramagic", fn, assets, prefabs)