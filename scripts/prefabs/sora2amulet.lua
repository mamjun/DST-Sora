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
    Asset("ANIM", "anim/sora2amulet.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2amulet.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2amulet.xml",256),
	Asset("IMAGE", "images/inventoryimages/sora2amulet.tex"),
}
local names = {
"荣耀勋章(关闭)",
"荣耀勋章(微光)",
"荣耀勋章(弱光)",
"荣耀勋章(强光)",
"荣耀勋章(超强)",
"荣耀勋章(夜视)",
}
local function onremovelight(light)
    light._lantern._light = nil
end
local function getname(inst)
inst.components.named:SetName(names[inst.state+1] )
end

local fuelerate = {-0.1,0.1,0.5,1,5,5}
local range = {0.5,2.5,5,10}

local function tostate(inst,state)
	local owner = inst.components.inventoryitem.owner
	if state == 0 then
		if inst._light ~= nil then
        inst._light:Remove()
		end
		inst:RemoveTag("nightvision")
		inst.nv:set(false)
	elseif state == 5 then
		if inst._light ~= nil then
				inst._light:Remove()
		end
		inst:AddTag("nightvision")
		inst.nv:set(true)
	else
		if inst.components.equippable:IsEquipped() then
			if inst._light ~= nil then
				inst._light:Remove()
			end
			inst.nv:set(false)
			inst:RemoveTag("nightvision")
			inst._light = SpawnPrefab("soralight")
			inst._light._lantern = inst
			inst:ListenForEvent("onremove", onremovelight, inst._light)
			inst._light.entity:SetParent((owner or inst).entity)
			inst._light.Light:SetRadius(range[state])
		end
	end
	inst.components.fueled.rate = fuelerate[state+1]
	inst.state=state
	getname(inst)
	inst.components.fueled:StartConsuming()
	owner:PushEvent("equip",{ item = inst, eslot = EQUIPSLOTS.NECK or EQUIPSLOTS.HEAD })
end

local function onequip(inst,owner)
     if owner and owner:HasTag("seele") and not (owner.components.seelebase.personality == "childish" or owner:HasTag("childish"))then
         owner:DoTaskInTime(0,function() owner.components.inventory:GiveItem(inst) end)
         return
     end
     owner.soratasgs ={}
     for k,v in pairs(SoraTags) do
        owner.soratasgs[v] = owner:HasTag(v)
        owner:AddTag(v)
     end

     if not owner:HasTag("sora") then 
     owner.components.combat.externaldamagemultipliers:SetModifier("sora2amulet",getsora("sora2amuletatt"))
     owner.components.combat.externaldamagetakenmultipliers:SetModifier("sora2amulet",2-getsora("sora2amuletarm"))
     end
     tostate(inst,0)
end

local function onunequip(inst, owner) 
    if owner.soratasgs then
        for k,v in pairs(owner.soratasgs) do
            if not v then
                owner:RemoveTag(k)
            end
        end
    end
	tostate(inst,0)
	if not owner:HasTag("sora") then 
	owner.components.combat.externaldamagemultipliers:SetModifier("sora2amulet")
	owner.components.combat.externaldamagetakenmultipliers:SetModifier("sora2amulet")
	end
	--inst.components.fueled:StopConsuming()
end
local onusesay = {
"已关闭发光！开始充能！\r\n充能速率：0.2/s",
"微弱发光！停止充能！消耗速率：0.1/s",
"普通发光！微弱耗能！消耗速率：0.5/s",
"强化发光！快速耗能！消耗速率：1/s",
"超强发光！飞速耗能！消耗速率：5/s",
"夜视！飞速耗能！消耗速率：5/s",
}
local function onuse(inst)
	if inst.components.fueled.currentfuel < 48 then
	inst.state = 0
	else 
	inst.state = (inst.state +1 )%6
	end
	tostate(inst,inst.state)
	if inst.components.inventoryitem.owner then
	inst.components.inventoryitem.owner.components.talker:Say(onusesay[inst.state+1])
	end
	inst.lastblink = GetTime()
    return false
end

local function onDepleted (inst)
	inst.components.fueled:DoDelta(1)
	tostate(inst,0)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	inst:AddTag("aquatic")
    inst.AnimState:SetBank("sora2amulet")
    inst.AnimState:SetBuild("sora2amulet")
    inst.AnimState:PlayAnimation("anim")
    inst:AddTag("waterproofer")
	inst:AddTag("soratrader")
	inst:AddTag("goggles")
	inst:AddTag("soragoggles")
	inst:AddTag("sora2amulet")
    inst:AddTag("firemoths")
    --inst:AddTag("seele_uniform")
    inst.entity:SetPristine()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sora2amulet.tex")
	inst.nv = net_bool(inst.GUID,"sora2amulet.nv","sora2amuletnvdirty")
    if not TheWorld.ismastersim then
		inst:ListenForEvent("sora2amuletnvdirty",function(inst) 
			if inst.nv:value() then
			inst:AddTag("nightvision")
			else
			inst:RemoveTag("nightvision")
			end
			if inst.replica.inventoryitem:IsGrandOwner(ThePlayer) then  
				ThePlayer:PushEvent("equip",{ item = inst, eslot = EQUIPSLOTS.NECK or EQUIPSLOTS.HEAD }) 
			end 
		end)
        return inst
    end
    inst.entity:AddLightWatcher()
    inst.lastblink = GetTime()
    inst:DoPeriodicTask(0.3,function(i) 
    if not i.components.equippable:IsEquipped() then return end
     local t = GetTime()
    local x,y,z  = i.Transform:GetWorldPosition()
    local cansee = TheSim:GetLightAtPoint(x, y, z)+ TheSim:GetLightAtPoint(x+8, y, z)+ TheSim:GetLightAtPoint(x-8, y, z)+ TheSim:GetLightAtPoint(x, y, z+8)+ TheSim:GetLightAtPoint(x, y, z-8)
	cansee = cansee / 5 - (i.state ~= 0 and 0.7 or 0)
        if cansee < 0.3 and i.state == 0 and i.components.fueled.currentfuel > 5 then
            tostate(i,1)
            i.lastblink = t
        elseif cansee > 0.3 and i.state ~= 0 then
            if (t-i.lastblink > 5) then
                tostate(i,0)
                i.lastblink = t
            end
        elseif cansee < 0.2 and i.nextstate ~= 0 then
            i.lastblink = t
        end
    end
    )
    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[
	银白骑士团の荣耀勋章
	可以切换发光范围，
	消耗速度随范围增加而增加
	可以加强战斗力(对穹妹无效)
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname="images/inventoryimages/sora2amulet.xml"
	inst.components.inventoryitem.imagename="sora2amulet"

	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(getsora("sora2amuletwat"))
	--护甲

	
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.NECK or EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	--回脑残
	inst.components.equippable.dapperness = getsora("sora2amuletsan")/60
	--移速
	inst.components.equippable.walkspeedmult = getsora("sora2amuletspe")
	
	inst:AddComponent("useableitem")
	inst.components.useableitem:SetOnUseFn(onuse)
	inst.state = 0
	-- 0 = 无光
	-- 1 = 微光
	-- 2 = 弱光
	-- 3 = 强光
	-- 4 = 夜视
	-- 5 = 超强光
	inst:AddComponent("named")
	getname(inst)
	
	inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.CAVE
	inst.components.fueled.secondaryfueltype = FUELTYPE.WORMLIGHT
    inst.components.fueled:InitializeFuelLevel(960)
    inst.components.fueled:SetDepletedFn(onDepleted)
    --inst.components.fueled:SetTakeFuelFn(onTakeFuel)
    --inst.components.fueled:SetFirstPeriod(TUNING.TURNON_FUELED_CONSUMPTION, TUNING.TURNON_FULL_FUELED_CONSUMPTION)
    inst.components.fueled.accepting = true

	--MakeHauntableLaunch(inst)

    return inst
end

return Prefab("sora2amulet", fn, assets)