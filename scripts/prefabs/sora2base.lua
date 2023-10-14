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
    Asset("ANIM", "anim/sora2base.zip"),
    Asset("ANIM", "anim/sorachest.zip"),
	Asset( "IMAGE", "images/inventoryimages/sora2base.tex" ),
    Asset( "ATLAS", "images/inventoryimages/sora2base.xml" ),
}

local stoneassets = {
    Asset("ANIM", "anim/sora2stone.zip"),
	Asset( "IMAGE", "images/inventoryimages/sora2stone.tex" ),
    Asset( "ATLAS", "images/inventoryimages/sora2stone.xml" ),
    Asset( "ATLAS_BUILD", "images/inventoryimages/sora2stone.xml" ,256),
}
local prefabs =
{
    "moonrocknugget",
    "moonhound",
    "moonpig",
    "positronbeam_front",
    "positronbeam_back",
    "positronpulse",
    "staffcoldlightfx",
}

local MIN_CHARGE_START_DELAY = 1
local KEY_STAFF = "yellowstaff"
local MORPHED_STAFF = "opalstaff"

local function HasStaff(inst, staffname)
    return (inst._staffinst ~= nil and inst._staffinst.prefab or inst.components.pickable.product) == staffname
end
local function CancelStaffBuffer(inst) --取消原有buffer
	if inst._staffstar ~= nil then
        inst._staffstar:Remove()
        inst._staffstar = nil
        if not inst.Light:IsEnabled() then
            inst.AnimState:ClearBloomEffectHandle()
        end
    end
	inst:RemoveTag("sora2base_tele")
end
--Not all staff prefabs match asset names!
local STAFF_SYMBOLS =
{
    ["firestaff"] = "redstaff",
    ["icestaff"] = "bluestaff",
    ["telestaff"] = "purplestaff",
}

local function GetStaffSymbol(staffname)
    return STAFF_SYMBOLS[staffname] or staffname
end

local slight = {
	firestaff = function(inst)
		inst.Light:SetColour(255/ 255, 0 / 255, 0 / 255)
		inst.AnimState:SetAddColour(255/ 255, 0 / 255, 0 / 255,1)
		inst.AnimState:SetMultColour( 255 / 255, 255 / 255, 0 / 255 ,255/255)
			end,
	icestaff = function(inst)
		inst.Light:SetColour(40/ 255, 40 / 255, 255 / 255)
		inst.AnimState:SetAddColour(40/ 255, 40/ 255, 255 / 255,1)
		inst.AnimState:SetMultColour( 255 / 255, 255 / 255, 255 / 255 ,125/255)
	end,
	telestaff = function(inst)
		inst.Light:SetColour(200/ 255, 80 / 255, 255 / 255)
		inst.AnimState:SetAddColour(200/ 255, 80 / 255, 255 / 255,1)
		inst.AnimState:SetMultColour( 100 / 255, 100 / 255, 255 / 255 ,125/255)
	end,
	orangestaff = function(inst)
		inst.Light:SetColour(180/ 255, 140 / 255, 0 / 255)
		inst.AnimState:SetAddColour(180/ 255, 140 / 255, 0 / 255,1)
		inst.AnimState:SetMultColour( 255 / 255, 255 / 255, 0 / 255 ,255/255)
	end,
	greenstaff = function(inst)
		inst.Light:SetColour(80/ 255, 200 / 255, 80 / 255)
		inst.AnimState:SetAddColour(80/ 255, 200 / 255, 80 / 255,1)
		inst.AnimState:SetMultColour( 255 / 255, 255 / 255, 255 / 255 ,255/255)
	end,
	
	yellowstaff = function(inst)
		inst.Light:SetColour(200/ 255, 200 / 255,0 / 255)
		inst.AnimState:SetAddColour(200/ 255, 200 / 255,0 / 255,1)
		inst.AnimState:SetMultColour( 255/ 255, 255 / 255, 0 / 255 ,255/255)
	end,
	opalstaff = function(inst)
		inst.Light:SetColour(80/ 255, 200 / 255, 180 / 255)
		inst.AnimState:SetAddColour(80/ 255, 200 / 255, 180 / 255,1)
		inst.AnimState:SetMultColour( 255 / 255, 255 / 255, 255 / 255 ,255/255)
	end,
}
local function calcdest(inst,dest)
	if inst and dest then
		return 1.3 -  inst:GetDistanceSqToInst(dest) / 225
	end
	return 0
end
local stafftask  = {
	firestaff = function(inst)
        if inst:IsAsleep() then return end
		local pos = inst:GetPosition()
        local ent = TheSim:FindEntities(pos.x, pos.y, pos.z,15,nil,nil,{"sora2basefire","daylight","HASHEATER"})
        local closest = 225
        local closestinst = nil
        if #ent > 0 then
            for i, v in ipairs(ent) do
                local sq = inst:GetDistanceSqToInst(v)
                if sq < closest and (v.prefab == "stafflight" or v.prefab == "staffcoldlight" or v.prefab == "staffcoldlightfx" )then
                    closest = sq
                    closestinst = v
                end
            end
        end
		if not closestinst then
            local enta = TheSim:FindEntities(pos.x, pos.y, pos.z,15,nil, {"player", "companion","wall","sora2lm"})
            
            for i, v in ipairs(enta) do
                if v:HasTag("monster") then
                    local sq = inst:GetDistanceSqToInst(v)
                    if sq < closest then
                        closest = sq
                        closestinst = v
                    end
                end
            end
        end
		if closestinst then
		SpawnPrefab("sorameteor"):AttackArea(inst, inst, closestinst:GetPosition(),60)
		--SpawnPrefab("collapse_small").Transform:SetPosition(pos:Get())
		end
		
	end,
	icestaff = function(inst)
		local pos = inst:GetPosition()
		local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,120,nil,{"campfire"}, { "fire","smolder" })
		for i, v in ipairs(ents) do
            ---v:GetDebugString()
			if v.components.burnable ~= nil and v.prefab ~= "laozi_sp" and v.prefab ~= "book_myth" then
				v.components.burnable:Extinguish()
			end

		end
		local enta = TheSim:FindEntities(pos.x, pos.y, pos.z,120,nil,nil, { "witherable"})
		for i, v in ipairs(enta) do
			if v.components.witherable ~= nil then
				v.components.witherable:Protect(60)
			end
		end
	end,
	telestaff = function(inst)
	inst:AddTag("sora2base_tele")
	end,
	orangestaff = function(inst)
		local pos = inst:GetPosition()
		local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,15,{"player"}, {"playerghost" })
		for i, v in ipairs(ents) do
            local pe = 1-v.components.sanity:GetPenaltyPercent()  - 0.01
			if v.components.hunger:GetPercent() > 0.1 and v.components.sanity:GetPercent() < pe then
				local n = calcdest(inst,v)
				v.components.hunger:DoDelta(-3*n)
				v.components.sanity:DoDelta(3*n)
			end
		end
	end,
	greenstaff = function(inst)
		local pos = inst:GetPosition()
		local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,15,{"player"}, {"playerghost" })
		for i, v in ipairs(ents) do
            local pe = 1-v.components.health:GetPenaltyPercent() - 0.01
			if v.components.hunger:GetPercent() > 0.1 and v.components.health:GetPercent() < pe then
				local n = calcdest(inst,v)
				v.components.hunger:DoDelta(-3*n)
				v.components.health:DoDelta(3*n)
			end
		end
	end,
	
	yellowstaff = function(inst)
		local pos = inst:GetPosition()
		local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,15,{"player"}, {"playerghost" })
		for i, v in ipairs(ents) do
			local temp = v.components.temperature.current 			
			v.components.temperature:SetTemperature(temp+calcdest(inst,v) * (65-temp)/5)
			if v.components.freezable then
				v.components.freezable:AddColdness(-5,15)
			end
		end
		local enta = TheSim:FindEntities(pos.x, pos.y, pos.z,15,{"heatrock"})
		for i, v in ipairs(enta) do
			if v.components.temperature then
				local temp = v.components.temperature.current 			
				v.components.temperature:DoDelta(calcdest(inst,v) * (65-temp)/3)
			end
		end
	end,
	opalstaff = function(inst)
		local pos = inst:GetPosition()
		local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,15,{"player"}, {"playerghost" })
		for i, v in ipairs(ents) do
			local temp = v.components.temperature.current 			
			v.components.temperature:SetTemperature(temp+calcdest(inst,v) * (5-temp)/5)
		end
		local enta = TheSim:FindEntities(pos.x, pos.y, pos.z,15,{"heatrock"})
		for i, v in ipairs(enta) do
			if v.components.temperature then
				local temp = v.components.temperature.current 			
				v.components.temperature:DoDelta(calcdest(inst,v) * (5-temp)/3 )
			end
		end
	end,
}

local function OnStaffGiven(inst, item)
    inst.SoundEmitter:PlaySound("dontstarve/common/together/moonbase/moonstaff_place")
	CancelStaffBuffer(inst)
	if slight[item] and  stafftask[item]then
		if inst._staffstar ~= nil then
			inst._staffstar:Remove()
			inst._staffstar= nil
		end
        --inst.AnimState:PlayAnimation("full_"..item)
        inst._staffstar = SpawnPrefab("sorastafflight")
        inst._staffstar.entity:SetParent(inst.entity)
        inst._staffstar.sl:set(inst.showlight and item or 0)
        slight[item](inst._staffstar)
        inst._staffstar.Light:Enable(inst.showlight)
        if not inst.Light:IsEnabled() then
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        end
		if inst._staffstar then
		inst._staffstar:DoPeriodicTask(item == "firestaff" and 3 or 1,stafftask[item])
		end
	end
end

local function OnStaffTaken(inst)
    CancelStaffBuffer(inst)
	--inst.AnimState:PlayAnimation("full")
end

local function onhit(inst, worker)
    inst.components.container:DropEverything()
    inst.components.container:Close()
end

local function onclose(inst)
    local container = inst.components.container
	local item = container:GetItemInSlot(1)
    local item2 = container:GetItemInSlot(2)
    inst.showlight = true
    if item2 and item2.prefab == "nightmarefuel" then  inst.showlight=false end
	if item and stafftask[item.prefab] then
        OnStaffGiven(inst,item.prefab)
        return true
	end	
        
    OnStaffTaken(inst)
end
local function onhammered(inst, worker)
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddSoundEmitter()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
    inst:AddTag("sora2base")
	inst:AddTag("nosteal")
    inst.AnimState:SetBank("sora2base")
    inst.AnimState:SetBuild("sora2base")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetFinalOffset(1)

    inst.MiniMapEntity:SetPriority(4)
    inst.MiniMapEntity:SetIcon("sora2base.tex")

    MakeObstaclePhysics(inst, 1)

    --trader (from trader component) added to pristine state for optimization
    --inst:AddTag("trader")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sorabase")
        end
        return inst
    end
    inst.showlight = true
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription(
    [[插上不同的法杖可发光并获得不同效果
    冰魔杖->灭火      火魔杖->攻击
    传送魔杖->回城点  分解法杖->回血
    瞬移魔杖->回SAN
    唤星者->升温      唤月者->降温 
	]])
    
    
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sorabase")
    inst.components.container.onclosefn = onclose
    inst:AddComponent("workable")
    --avoid pick & mine action priority conflict
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit) 
    
    inst:DoTaskInTime(0.1,onclose)
    return inst
end
local function makestafflight(name)
    local assets =
    {
        Asset("ANIM", "anim/star_cold.zip"),
    }
	local idles = { "idle_loop", "idle_loop2", "idle_loop3" }
    local PlayRandomStarIdle = #idles > 1 and function(inst)
        --Don't if we're extinguished
        if not inst._killed then
            inst.AnimState:PlayAnimation(idles[math.random(#idles)])
        end
    end or nil

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()
        inst.entity:AddNetwork()

        inst._ismastersim = TheWorld.ismastersim

        --inst.Light:SetColour(223 / 255, 208 / 255, 69 / 255)
		inst.sl = net_string(inst.GUID,"sora_sl","sldirty")
	
		inst.Light:SetFalloff(0.8)
		inst.Light:SetIntensity(0.8)
		inst.Light:SetRadius(20)
		
		inst.Light:EnableClientModulation(true)
        inst.AnimState:SetBank("star_cold")
        inst.AnimState:SetBuild("star_cold")
        inst.AnimState:PlayAnimation("appear")
        inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

        --HASHEATER (from heater component) added to pristine state for optimization
        inst.Transform:SetScale(.92, .92, .92)
        inst.AnimState:Hide("shadow")
        inst.AnimState:SetFinalOffset(1)
		inst:AddTag("daylight")
        inst.SoundEmitter:PlaySound("dontstarve/common/staff_coldlight_LP", "staff_star_loop")
        inst.entity:SetPristine()
		inst:ListenForEvent("sldirty",function(inst,data)     	 
			if slight[inst.sl:value()] then 
				slight[inst.sl:value()](inst)
				inst.Light:Enable(true)
			else
                inst.Light:Enable(false)
            end
			end )
        if not inst._ismastersim then
			
            return inst
        end
        inst.persists = false
        if #idles > 1 then
            inst:ListenForEvent("animover", PlayRandomStarIdle)
        end

        return inst
    end

    return Prefab(name, fn, assets)
end

local function IsNearDanger(traveller)
	local hounded = TheWorld.components.hounded
	if hounded ~= nil and (hounded:GetWarning() or hounded:GetAttacking()) then
		return true
	end
	local burnable = traveller.components.burnable
	if burnable ~= nil and (burnable:IsBurning() or burnable:IsSmoldering()) then
		return true
	end
	if traveller:HasTag("spiderwhisperer") then
		return FindEntity(
			traveller,
			10,
			function(target)
				return (target.components.combat ~= nil and target.components.combat.target == traveller) or (not (target:HasTag("player") or target:HasTag("spider")) and (target:HasTag("monster") or target:HasTag("pig")))
			end,
			nil,
			nil,
			{"monster", "pig", "_combat"}
		) ~= nil
	end
	return FindEntity(
		traveller,
		10,
		function(target)
			return (target.components.combat ~= nil and target.components.combat.target == traveller) or (target:HasTag("monster") and not target:HasTag("player"))
		end,
		nil,
		nil,
		{"monster", "_combat"}
	) ~= nil
end

local function CanTele(inst,doer,closed)
	if  closed == nil or not closed:IsValid() then
		return false,"目标地点不可达！"
	end
	if inst and inst:IsValid() and doer and doer:IsValid() then
		if IsNearDanger(doer) then
			return false,"现在太危险了！"
		end
		if doer.components.health and doer.components.health:IsDead() then
			return false,"你已经死了！"
		end
		return true
	end
	return false,"现在无法传送！"
end
local function CancelTele(inst,doer,closed)
	if inst.teletask ~= nil then
		inst.teletask:Cancel()
		inst.teletask = nil
	end
	if inst.teletask1 ~= nil then
		inst.teletask1:Cancel()
		inst.teletask1 = nil
	end
	if inst.teletask2 ~= nil then
		inst.teletask2:Cancel()
		inst.teletask2 = nil
	end
	if inst.teletask3 ~= nil then
		inst.teletask3:Cancel()
		inst.teletask3 = nil
	end
end

local function StartTele(inst,doer,closed) 
	local can,err = CanTele(inst,doer,closed) 
	if not can then
		doer.components.talker:Say(err)
	else
	inst.teletask = inst:DoTaskInTime(4,function(inst,doer,closed) 
			local can,err = CanTele(inst,doer,closed) 
			if not can then
				doer.components.talker:Say(err)
				CancelTele(inst,doer,closed)
				return
			end
			local xf, yf, zf = closed.Transform:GetWorldPosition()
			if doer.Physics ~= nil then
					doer.Physics:Teleport(xf - 1, 0, zf)
			else
					doer.Transform:SetPosition(xf - 1, 0, zf)
			end

			if doer.components.leader and doer.components.leader.followers then
				for kf, vf in pairs(doer.components.leader.followers) do
					if kf.Physics ~= nil then
						kf.Physics:Teleport(xf + 1, 0, zf)
					else
						kf.Transform:SetPosition(xf + 1, 0, zf)
					end
				end
			end
	
			local inventory = doer.components.inventory
			if inventory then
				for ki, vi in pairs(inventory.itemslots) do
					if vi.components.leader and vi.components.leader.followers then
						for kif, vif in pairs(vi.components.leader.followers) do
							if kif.Physics ~= nil then
								kif.Physics:Teleport(xf, 0, zf + 1)
							else
								kif.Transform:SetPosition(xf, 0, zf + 1)
							end
						end
					end
				end
			end

			local container = inventory:GetOverflowContainer()
			if container then
				for kb, vb in pairs(container.slots) do
					if vb.components.leader and vb.components.leader.followers then
						for kbf, vbf in pairs(vb.components.leader.followers) do
							if kbf.Physics ~= nil then
								kbf.Physics:Teleport(xf, 0, zf - 1)
							else
								kbf.Transform:SetPosition(xf, 0, zf - 1)
							end
						end
					end
				end
			end
			inst.components.stackable:Get():Remove()
		end,doer,closed)
		
	inst.teletask1 = inst:DoTaskInTime(1,function(inst,doer,closed) 
			local can,err = CanTele(inst,doer,closed) 
			if not can then
				doer.components.talker:Say(err)
				CancelTele(inst,doer,closed)
				return
			end
			doer.components.talker:Say("3秒后开始传送！")
		end,doer,closed)
	inst.teletask2 = inst:DoTaskInTime(2,function(inst,doer,closed) 
			local can,err = CanTele(inst,doer,closed) 
			if not can then
				doer.components.talker:Say(err)
				CancelTele(inst,doer,closed)
				return
			end
			doer.components.talker:Say("2秒后开始传送！")
		end,doer,closed)
	inst.teletask3 = inst:DoTaskInTime(3,function(inst,doer,closed) 
			local can,err = CanTele(inst,doer,closed) 
			if not can then
				doer.components.talker:Say(err)
				CancelTele(inst,doer,closed)
				return
			end
			doer.components.talker:Say("1秒后开始传送！")
		end,doer,closed)
	end
end

local function onuse(inst,doer)
	CancelTele(inst,doer)
	if not doer:HasTag("player") then  inst.components.sorauseable:StopUsingItem() return true  end 
	if IsNearDanger(doer) then doer.components.talker:Say("太危险了") 
		 inst.components.sorauseable:StopUsingItem() 
		return false
	end
	local x, y, z = inst.Transform:GetWorldPosition()
	local dests = TheSim:FindEntities(x, y, z, 3000, {"sora2base_tele"})
	local closed 
	local closedsq = 99999999
	for k, v in pairs(dests) do
		local vsq = inst:GetDistanceSqToInst(v)
		if vsq <closedsq and vsq > 900 then 
			closedsq = vsq 
			closed = v 
		end
	end
	if not closed then 
		doer.components.talker:Say("我需要一个秘法祭坛(传送魔杖)")
		inst.components.sorauseable:StopUsingItem()
		return false
	end
	StartTele(inst,doer,closed)
	inst.components.sorauseable:StopUsingItem()
	return false
end

local function stonefn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
	inst:AddTag("flute")
    inst:AddTag("sora2base")
    inst.AnimState:SetBank("sora2stone")
    inst.AnimState:SetBuild("sora2stone")
    inst.AnimState:PlayAnimation("idle")
    inst.entity:SetPristine()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sora2stone.tex")
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[
	快速回到传送点
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname="images/inventoryimages/sora2stone.xml"
	inst.components.inventoryitem.imagename="sora2stone"
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	inst:AddComponent("sorauseable")
	inst.components.sorauseable:SetOnUseFn(onuse)
    --inst.components.instrument:SetOnHeardFn(HearHorn)
    return inst
end


return Prefab("sora2base", fn, assets, prefabs),
	Prefab("sora2stone", stonefn, stoneassets),
    MakePlacer("sora2base_placer", "sora2base", "sora2base", "full"),
	makestafflight("sorastafflight") -- , { 223 / 255, 208 / 255, 69 / 255 } 
	--makestafflight("stafflight_opal",  { 64 / 255, 64 / 255, 208 / 255 })
