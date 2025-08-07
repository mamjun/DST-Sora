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
local assets =
{
    Asset("ANIM", "anim/soraclothes.zip"),
	Asset("ATLAS", "images/inventoryimages/soraclothes.xml"),
	Asset("IMAGE", "images/inventoryimages/soraclothes.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/soraclothes.xml", 256),
}
local arm1 = getsora("soraclothesarmor1")/100
local arm2 = getsora("soraclothesarmor2")
local arm3 = getsora("soraclothesarmor3")
local arm4 = getsora("soraclothesarmor4")
local arm5 = getsora("soraclothesarmor5")

local hot1 = getsora("soraclotheshot1")
local hot2 = getsora("soraclotheshot2")
local function upgrade(inst)
	inst.mplevel = math.min(math.floor(inst.mpnum / inst.need),inst.maxlevel)
	--inst.yqlevel = math.min(math.floor(inst.yqnum / inst.need),inst.maxlevel)
	inst.lllevel = math.min(math.floor(inst.llnum / inst.need),inst.maxlevel)
	--保暖
	 inst.components.insulator:SetInsulation(hot1 + hot2*inst.mplevel)
	--防水
   -- inst.components.waterproofer:SetEffectiveness(0.1*inst.yqlevel)
	--if inst.yqlevel > 9 then
	--inst.components.equippable.insulated = true
	--else
	--inst.components.equippable.insulated = false
	--end
	--护甲
	inst.abs = arm1+arm2*inst.lllevel
	local old = inst.components.armor:GetPercent()
	inst.components.armor.maxcondition = arm3+arm4*inst.lllevel
    inst.components.armor:SetAbsorption(math.min(inst.abs,0.99))
	inst.components.armor:SetPercent(old)
end

local function OnRefuseItem(inst, giver, item)
	if item then
	local refusesay = "\t\t穹の护\n物\t数\t级\t属"
			refusesay = refusesay..string.format("\n暖(皮):\t%d/"..inst.need * inst.maxlevel.."\t%d\t%d",inst.mpnum,inst.mplevel,hot1+hot2*inst.mplevel)
			refusesay = refusesay..string.format("\n甲(鳞):\t%d/"..inst.need * inst.maxlevel.."\t%d\t%d%%",inst.llnum,inst.lllevel,(arm1+arm2*inst.lllevel) *100)
		giver.components.talker:Say(refusesay)
	end
end
local l = SoraAPI.sorarepairer
local function AcceptTest(inst, item)
	if l[item.prefab] then
	return inst.components.armor:GetPercent()<1
	elseif (item.prefab == "bearger_fur" ) then
		return 	inst.mpnum < inst.need * inst.maxlevel ,"GENERIC"
	elseif (item.prefab == "dragon_scales" or item.prefab == "shark_gills") then
		return 	inst.llnum < inst.need * inst.maxlevel,"GENERIC"
	end
	return false,"WRONGTYPE" 
end
local function TraderCount(inst,giver,item)
	local arm = 1-inst.components.armor:GetPercent()
	if l[item.prefab]  then
		return math.floor(arm/l[item.prefab])
	elseif (item.prefab == "bearger_fur" ) then
		return  inst.need * inst.maxlevel  - inst.mpnum 
	elseif (item.prefab == "dragon_scales" or item.prefab == "shark_gills") then
		return  inst.need * inst.maxlevel - inst.llnum 
	end
	return 1
end
local function OnGetItemFromPlayer(inst, giver, item)
		local num = 1
		if item.components.stackable then
		num = item.components.stackable.stacksize
		end
		if l[item.prefab]  then
		inst.components.armor:SetPercent(inst.components.armor:GetPercent()+l[item.prefab]*num)
		elseif (item.prefab == "bearger_fur")then
			inst.mpnum = inst.mpnum + num
			inst.mplevel = math.min(math.floor(inst.mpnum / inst.need),inst.maxlevel)
			if inst.mplevel < inst.maxlevel then 
				giver.components.talker:Say("毛皮数量:"..inst.mpnum.."/"..inst.need * inst.maxlevel.."\tLV:"..inst.mplevel .."\n护温："..(hot1+hot2*inst.mplevel))
				else
				giver.components.talker:Say("毛皮已满\tLV:10\n护温："..(hot1+hot2*inst.mplevel))
			end
		elseif (item.prefab == "dragon_scales" or item.prefab == "shark_gills") 
			then
			inst.llnum = inst.llnum + num
			inst.lllevel = math.min(math.floor(inst.llnum / inst.need),inst.maxlevel)
			if inst.lllevel < inst.maxlevel then 
				giver.components.talker:Say("龙鳞数量:"..inst.llnum.."/"..inst.need * inst.maxlevel.."\tLV:"..inst.lllevel.."\n护甲："..((arm1+arm2*inst.lllevel)*100).."%")
				else
				giver.components.talker:Say("龙鳞已满\tLV:10\n护甲："..((arm1+arm2*inst.lllevel)*100).."%")
			end	
		end
	upgrade(inst)
end

local function onpreload(inst, data)
	if data then
		inst.mpnum = data.mpnum or 0
		inst.llnum = data.llnum or 0
		upgrade(inst)
	end
end

local function onsave(inst, data)
	data.mpnum = inst.mpnum
	data.llnum = inst.llnum
end

local function onSetCondition(self,amount)
    self.condition = math.min(amount, self.maxcondition)
    self.inst:PushEvent("percentusedchange", { percent = self:GetPercent() })
    if self.condition <= 0 then
        self.condition = 0
        ProfileStatsSet("armor_broke_"..self.inst.prefab, true)
        ProfileStatsSet("armor", self.inst.prefab)

        if self.onfinished ~= nil then
            self.onfinished()
        end
    end
end


local function onequip(inst, owner) 
	if owner ~= nil and not owner:HasTag("sora") and not owner:HasTag("seele")  then 
	owner:DoTaskInTime(0, function()
            if owner.components.inventory  then owner.components.inventory:GiveItem(inst) end
            if  owner.components.talker then owner.components.talker:Say("这是Sora的衣服") end
			end)
	end
    if owner:HasTag("seele") then owner:AddTag("seele_uniform")  end
    owner.AnimState:ClearOverrideSymbol("swap_body")
	if owner.components.health ~= nil then   owner.components.health.externalfiredamagemultipliers:SetModifier(inst, 0)
    end
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    if owner:HasTag("seele") then owner:RemoveTag("seele_uniform") end
	if owner.components.health ~= nil then
        owner.components.health.externalfiredamagemultipliers:RemoveModifier(inst)
    end
end

local function onrepair(inst) 
	if inst.components.armor then 
		inst.components.armor:SetPercent(inst.components.armor:GetPercent()+0.01)
	end
end

local function onAbsorption(self) 
	return  self:GetPercent() > 0 and self.inst.abs or nil
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	inst:AddTag("aquatic")
    inst.AnimState:SetBank("soraclothes")
    inst.AnimState:SetBuild("soraclothes")
    inst.AnimState:PlayAnimation("anim")
	inst:AddComponent("soratwoface")
	inst:AddTag("soratrader")
    inst:AddTag("waterproofer")
    inst.entity:SetPristine()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("soraclothes.tex")
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[
	这是sora的衣服
	可以通过熊皮升级保暖
	可以通过龙鳞升级护甲和耐久
	每10秒回复1%耐久
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname="images/inventoryimages/soraclothes.xml"
	inst.components.inventoryitem.imagename="soraclothes"
	--保温
	inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(0)
	--防水

	inst:DoPeriodicTask(1, function()
        local owner = inst.components.inventoryitem:GetGrandOwner()
        if not owner then
            return
        end
        if owner.components.temperature then
            local temp = owner.components.temperature.current
            local wtemp = TheWorld.state.temperature or 0
            if wtemp > 50 then 
                inst.components.insulator:SetSummer()
            elseif wtemp < 20 then 
                inst.components.insulator:SetWinter()
            elseif (temp - wtemp > 5) then
                inst.components.insulator:SetSummer()
            elseif (temp - wtemp < -5) then
                inst.components.insulator:SetWinter()
            else
                inst.components.insulator:SetSummer()
            end
        end
    end)

	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
	--护甲
	inst:AddComponent("planardefense")
	inst.components.planardefense:SetBaseDefense(5)
    inst:AddComponent("armor")
	--inst:AddTag("hide_percentage")
	inst.abs=arm1
    inst.components.armor:InitCondition(arm3,inst.abs)
	inst.components.armor.GetAbsorption = onAbsorption 
	inst:DoPeriodicTask(arm5,onrepair)
	inst.components.armor.SetCondition = onSetCondition
	
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	--回脑残
	inst.components.equippable.dapperness = getsora("soraclothessan")/60
	--移速
	inst.components.equippable.walkspeedmult = math.min(getsora("soraclothesspe"),2.5)
	
	inst.need = TUNING.SORAMODE/2
	inst.maxlevel = 10
	inst.mpnum = 0
	inst.llnum = 0
	inst.mplevel = 0
	inst.lllevel = 0
	
	inst:AddComponent("trader")
	inst.cantrader = TraderCount
	inst.components.trader:SetAcceptTest(AcceptTest)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
    inst:AddComponent("soraitem")
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
	--MakeHauntableLaunch(inst)

    return inst
end

return Prefab("soraclothes", fn, assets)