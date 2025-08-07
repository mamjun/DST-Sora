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
	Asset("ANIM", "anim/sorapick.zip"),
	Asset("ATLAS", "images/inventoryimages/sorapick.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sorapick.xml",256),
	Asset("IMAGE", "images/inventoryimages/sorapick.tex"),
}

local prefabs = {
}
local ice1 = getsora("sorapickice1")
local ice2 = getsora("sorapickice2")
local pick1 = getsora("sorapickpick1")
local pick2 = getsora("sorapickpick2")
local cd1 = getsora("sorapickcd1")
local cd2 = getsora("sorapickcd2")

local function upgrade(inst)
	inst.icelevel = math.min(math.floor(inst.icenum / inst.need/20),inst.maxlevel)
	inst.zbslevel = math.min(math.floor(inst.zbsnum / inst.need),inst.maxlevel)
	inst.cbslevel = math.min(math.floor(inst.cbsnum / inst.need),inst.maxlevel)
	inst.cd = math.max(cd1 -inst.zbslevel*cd2,0.01)
	inst.miehuo = math.max(ice1+inst.icelevel*ice2,0)
	inst.caiji = math.max(pick1+inst.cbslevel*pick2,0)
	inst.components.rechargeable:SetMaxCharge(inst.cd)
end

local function OnRefuseItem(inst, giver, item)
	if item then
	local refusesay = "\t\t穹の采\n物\t数\t级\t属"
			refusesay = refusesay..string.format("\n灭火(冰):\t%d/%d\t%d\t%d",inst.icenum,inst.need * inst.maxlevel*20,inst.icelevel,math.max(ice1 +inst.icelevel*ice2,0))
			refusesay = refusesay..string.format("\n冷却(紫):\t%d/%d\t%d\t%d",inst.zbsnum,inst.need * inst.maxlevel,inst.zbslevel,math.max(cd1 -inst.zbslevel*cd2,0))
			refusesay = refusesay..string.format("\n采集(橙):\t%d/%d\t%d\t%d",inst.cbsnum,inst.need * inst.maxlevel,inst.cbslevel,math.max(pick1+inst.cbslevel*pick2,0))
			giver.components.talker:Say(refusesay)
	end
end

local function AcceptTest(inst, item)
	if (item.prefab == "ice" ) then
		return 	inst.icenum < inst.need * inst.maxlevel*20,"GENERIC"
	elseif (item.prefab == "purplegem") then
		return 	inst.zbsnum < inst.need * inst.maxlevel,"GENERIC"
	elseif (item.prefab == "orangegem") then
		return 	inst.cbsnum < inst.need * inst.maxlevel,"GENERIC"
	end
	return false,"WRONGTYPE" 
end
local function TraderCount(inst,giver,item)
	if (item.prefab == "ice" ) then
		return 	 inst.need * inst.maxlevel*20 - inst.icenum
	elseif (item.prefab == "purplegem") then
		return  inst.need * inst.maxlevel - inst.zbsnum
	elseif (item.prefab == "orangegem") then
		return  inst.need * inst.maxlevel - inst.cbsnum
	end
	return 1
end
local function OnGetItemFromPlayer(inst, giver, item, player)
		local num = 1
		if item.components.stackable then
		num = item.components.stackable.stacksize
		end
		if (item.prefab == "ice")then
			inst.icenum = inst.icenum + num
			inst.icelevel = math.min(math.floor(inst.icenum / inst.need/20),inst.maxlevel)
			if inst.icelevel < inst.maxlevel  then 
				giver.components.talker:Say("冰数量:"..inst.icenum.."/"..inst.need*20*inst.maxlevel .."\tLV:"..inst.icelevel.."\n灭火范围："..math.max(ice1+inst.icelevel*ice2,0))
				else
				giver.components.talker:Say("冰已满\tLV:"..inst.maxlevel.."\n灭火范围："..math.max(ice1+inst.icelevel*ice2,0))
			end
			
		elseif (item.prefab == "purplegem") 
			then
			inst.zbsnum = inst.zbsnum+num
			inst.zbslevel = math.min(math.floor(inst.zbsnum / inst.need),inst.maxlevel)
			
			if inst.zbslevel < inst.maxlevel then 
				giver.components.talker:Say("紫宝石数量:"..inst.zbsnum.."/"..inst.need *inst.maxlevel.."\tLV:"..inst.zbslevel.."\n冷却时间："..math.max(cd1 -inst.zbslevel*cd2,0))
				else
				giver.components.talker:Say("紫宝石已满\tLV:"..inst.maxlevel .."\n冷却时间："..math.max(cd1 -inst.zbslevel*cd2,0))
			end
			
		elseif (item.prefab == "orangegem") 
			then
			inst.cbsnum = inst.cbsnum +num
			inst.cbslevel = math.min(math.floor(inst.cbsnum / inst.need),inst.maxlevel)
			if inst.cbslevel <  inst.maxlevel then 
				giver.components.talker:Say("橙宝石数量:"..inst.cbsnum.."/"..inst.need*inst.maxlevel.."\tLV:"..inst.cbslevel.."\n采集范围："..math.max(pick1+inst.cbslevel*pick2,0))
				else
				giver.components.talker:Say("橙宝石已满\tLV:"..inst.maxlevel .."\n采集范围："..math.max(pick1+inst.cbslevel*pick2,0))
			end	
		end
	upgrade(inst)
end

local function onpreload(inst, data)
	if data then
		inst.icenum = data.icenum or 0
		inst.zbsnum = data.zbsnum or 0
		inst.cbsnum = data.cbsnum or 0
		upgrade(inst)
	end
end

local function onsave(inst, data)
	data.icenum = inst.icenum
	data.zbsnum = inst.zbsnum
	data.cbsnum = inst.cbsnum
end

local function onequip(inst, owner) 
	if owner ~= nil and not owner:HasTag("sora") then 
	owner:DoTaskInTime(0, function()
            if owner.components.inventory  then owner.components.inventory :GiveItem(inst) end
            if  owner.components.talker then owner.components.talker:Say("这是Sora的法杖") end
        end)
	return
	end
    owner.AnimState:OverrideSymbol("swap_object", "sorapick", "swap_weapon")
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

local function stackin (v,v1,k,k1)
	if v and v1 then
        local newtotal = v.components.stackable.stacksize + v1.components.stackable.stacksize
        local oldsize = v.components.stackable.stacksize
        local newsize = math.min(v.components.stackable.maxsize, newtotal)        
        if v.components.stackable.maxsize >= newtotal then
			--print ("del",k,k1)
            v1.soradel = true
        else
            v1.components.stackable:SetStackSize(newtotal - v.components.stackable.maxsize)
        end
        v.components.stackable:SetStackSize(newsize)
	end
end

local function stackall(inst,pos,fw)
	local finds = TheSim:FindEntities(pos.x, pos.y, pos.z,fw)
	for k,v in pairs (finds) do 
		if v and not v.soradel and not v.components.health and v.components.stackable and not v.components.stackable:IsFull() and v.components.inventoryitem and not v.components.inventoryitem.owner and not v.components.health then
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


local function soramagicfn(staff, target, pos)
	local caster = staff.components.inventoryitem.owner
	if not caster or not caster:HasTag("Sora") then
	return false
	end
	if not staff.components.rechargeable:IsCharged() then 
		local t= staff.components.rechargeable:GetTimeToCharge()
		caster.components.talker:Say("冷却中："..math.floor(t).."S")
		return false
	end
	
	if not pos then
	pos  = target:GetPosition()
	end
	local hasdo = false
	local x, y, z = pos:Get()
	--灭火
	local ents = TheSim:FindEntities(x, y, z,staff.miehuo,nil,nil, { "fire","smolder" })
	for i, v in ipairs(ents) do
        if v.components.burnable ~= nil then
            v.components.burnable:Extinguish()
			hasdo = true
			caster.components.sanity:DoDelta(-1)
        end
    end
	--破坏礁石
    local rocks = TheSim:FindEntities(x, y, z,staff.caiji, { "ignorewalkableplatforms" })
    for i,v in ipairs(rocks) do 
        if v.prefab=="seastack" and   v.components.workable then
			hasdo = true
            v.components.workable:WorkedBy(caster,15)
        end
    end
	--采集
    local ents = TheSim:FindEntities(x, y, z,staff.caiji, { "_inventoryitem" }, { "INLIMBO", "NOCLICK", "catchable", "fire", "minesprung", "mineactive" , "sora2base"})
    for i, v in ipairs(ents) do
        if v.components.inventoryitem ~= nil and
            v.components.inventoryitem.canbepickedup and
            v.components.inventoryitem.cangoincontainer and
            not v.components.inventoryitem:IsHeld() then
            SpawnPrefab("sand_puff").Transform:SetPosition(v.Transform:GetWorldPosition())
            local v_pos = v:GetPosition()
            if v.components.trap ~= nil and v.components.trap:IsSprung() then
                v.components.trap:Harvest(caster)
            else
                caster.components.inventory:GiveItem(v, nil, pos)
            end
			hasdo = true
			caster.components.sanity:DoDelta(-1)
        end
    end
	local enta = TheSim:FindEntities(x,y,z,staff.caiji,nil,{"sora2base"},{"pickable","pickable_lotus","harvestable","dried","donecooking","readyforharvest","donecooking_fur"})
	for i,v in pairs(enta) do
        if v.prefab == "flower" then
        
        elseif v.components.pickable  then 
			v.components.pickable:Pick(caster)
			hasdo = true
			caster.components.sanity:DoDelta(-1)
		elseif v.components.harvestable then
			v.components.harvestable:Harvest(caster)
			hasdo = true 
			caster.components.sanity:DoDelta(-1)
		elseif v.components.dryer then
			v.components.dryer:Harvest(caster)
			hasdo = true 
			caster.components.sanity:DoDelta(-1)
		elseif v.components.stewer then
			v.components.stewer:Harvest(caster)
			hasdo = true
			caster.components.sanity:DoDelta(-1)
		elseif v.components.stewer_fur then
			v.components.stewer_fur:Harvest(caster)
			hasdo = true
			caster.components.sanity:DoDelta(-1)
        elseif v.components.crop then
			v.components.crop:Harvest(caster)
			hasdo = true
			caster.components.sanity:DoDelta(-1)
        end
	end
    
    local entfish = TheSim:FindEntities(x,y,z,staff.caiji,{"oceanfishable"})
    for k,v in pairs(entfish) do
        if v and v:IsValid() and v.components.oceanfishable then
            if v.components.weighable then
                v.components.weighable:SetPlayerAsOwner(caster)
            end
            caster:PushEvent("medal_fishingcollect",{fish=v})
            local projectile = v.components.oceanfishable:MakeProjectile()
            local ae_cp = v.components.complexprojectile
            if ae_cp then
                ae_cp:SetHorizontalSpeed(16)
                ae_cp:SetGravity(-12)
                ae_cp:SetLaunchOffset(Vector3(0, 0.5, 0))
                ae_cp:SetTargetOffset(Vector3(0, 0.5, 0))
                local fx = SpawnPrefab("crab_king_waterspout")
                fx.Transform:SetPosition(v:GetPosition():Get())
                local v_position = caster:GetPosition()
                ae_cp:Launch(v_position, caster)
            end
			hasdo = true
            caster.components.sanity:DoDelta(-10)
        end
    end
    if hasdo then
		staff.components.rechargeable:Discharge(staff.cd)
	end
	caster:DoTaskInTime(0.1, stackall,pos,staff.caiji)
	return true
end
local function cancast(target, pos)
    if self.spell ~= nil then
        self.spell(self.inst, target, pos)

        if self.onspellcast ~= nil then
            self.onspellcast(self.inst, target, pos)
        end
    end
end

local function IsWorkAction(action)
    return action == ACTIONS.CHOP
        or action == ACTIONS.DIG
        or action == ACTIONS.HAMMER
        or action == ACTIONS.MINE
end

-- function cancast(self,doer, target, pos)
    -- if self.spell == nil then
        -- return false
    -- elseif target == nil then
        -- if pos == nil then
            -- return self.canusefrominventory
        -- end
        -- return self.canuseonpoint
            -- and TheWorld.Map:IsAboveGroundAtPoint(pos:Get())
            -- and not TheWorld.Map:IsGroundTargetBlocked(pos)
    -- elseif target:IsInLimbo()
        -- or not target.entity:IsVisible()
        -- or (target.components.health ~= nil and target.components.health:IsDead())
        -- or (target.sg ~= nil and (
                -- target.sg.currentstate.name == "death" or
                -- target.sg:HasStateTag("flight") or
                -- target.sg:HasStateTag("invisible")
            -- )) then
        -- return false
    -- end
    -- return self.canuseontargets 
-- end
local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
	inst:AddTag("aquatic")
    anim:SetBank("sorapick")
    anim:SetBuild("sorapick")
    anim:PlayAnimation("idle")
	inst:AddTag("soratrader")
    inst:AddTag("nopunch")
    inst:AddTag("allow_action_on_impassable")
	inst:AddTag("rechargeable")
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sorapick.tex")
	inst:AddComponent("soratwoface")
	if not TheWorld.ismastersim then
        return inst
    end
	inst.icenum=0
	inst.zbsnum=0
	inst.cbsnum=0
	inst.icelevel=0
	inst.zbslevel=0
	inst.cbslevel=0
	inst.need = TUNING.SORAMODE/2
	inst.maxlevel = 10 
	inst.cd =cd1
	inst.miehuo= ice1
	inst.caiji =pick1
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[这是sora的采集法杖
	可以通过冰块升级灭火范围
	可以通过紫色宝石降低施法冷却
	可以通过橙色宝石升级采集范围]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/sorapick.xml"
	inst.components.inventoryitem.imagename = "sorapick"
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst.components.equippable.walkspeedmult = math.min(getsora("sorapickspe"),2.5)
	inst:AddComponent("spellcaster")
	inst.components.spellcaster.CanCast = function() return true end
    inst.components.spellcaster.canuseontargets = true
	inst.components.spellcaster.quickcast = true
    inst.components.spellcaster.canuseonpoint = true
    inst.components.spellcaster.canuseonpoint_water = true
	--inst.components.spellcaster.CanCast = function() return true end
    inst.components.spellcaster:SetSpellFn(soramagicfn)
	--inst.magicfx.entity:SetParent(inst.entity)
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(math.max(getsora("sorapickatt"),0))
	inst.components.weapon:SetRange(math.max(getsora("sorapickrange"),0))
   --inst.components.weapon:SetElectric()
    --inst.components.weapon.OnAttack = onattack
	inst.components.weapon:SetProjectile("sorapick_projectile")

	inst:AddComponent("rechargeable")
	inst.components.rechargeable:SetMaxCharge(inst.cd)

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
SoraAPI.MakeItemSkinDefaultData("sorapick", {}, {})
return	Prefab( "sorapick", fn, assets, prefabs)