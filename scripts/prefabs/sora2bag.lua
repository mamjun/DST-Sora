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
    Asset("ANIM", "anim/sora2bag.zip"),	
	Asset("ANIM", "anim/ui_krampusbag_2x5.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2bag.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2bag.xml",256),
	Asset("IMAGE", "images/inventoryimages/sora2bag.tex"),
}
local function onremovelight(light)
    light._lantern._light = nil
end
local function turnon(inst)
	local owner = inst.components.inventoryitem.owner
	if inst.components.equippable:IsEquipped() then
		if inst._light == nil then
            inst._light = SpawnPrefab("soralight")
            inst._light._lantern = inst
            inst:ListenForEvent("onremove", onremovelight, inst._light)
        end
        inst._light.entity:SetParent((owner or inst).entity)
		inst._light.Light:SetRadius(5)
	elseif inst._light ~= nil then
        inst._light:Remove()
	end
end

local function turnoff(inst)
    if inst._light ~= nil then
        inst._light:Remove()
    end
end

local function onfind(inst,owner)

	local neck = owner.components.inventory:EquipHasTag("sora2amulet")
	if neck then
        owner.AnimState:OverrideSymbol("swap_body_backback", "sora2bag", "swap_body2")
        inst.components.preserver:SetPerishRateMultiplier(-5)
	else
        owner.AnimState:OverrideSymbol("swap_body_backback", "sora2bag", "swap_body")
        inst.components.preserver:SetPerishRateMultiplier(0.25)
	end

	
	local pos  = inst:GetPosition() 
	local x, y, z = pos:Get()
	local ents = TheSim:FindEntities(x, y, z,16,{"SoraBag"})
	if #ents == 0 then
	inst.sorabag = true
	turnoff(inst)
	return
	end
	

	for i, v in ipairs(ents) do
		if v.components.equippable:IsEquipped() and inst.sorabag then 
		turnon(inst)
		inst.sorabag = false
		return
		end
    end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body_backback", "sora2bag", "swap_body")
	if inst._task ~= nil then
        inst._task:Cancel()
    end
	inst._task = inst:DoPeriodicTask(1,onfind,nil,owner)
	if inst.components.container ~= nil then
		inst.components.container:Open(owner)
	end
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body_backback")
    --owner.AnimState:ClearOverrideSymbol("backpack")
    if inst.components.container ~= nil then
		inst.components.container:Close(owner)
	end
	if inst._task ~= nil then
        inst._task:Cancel()
    end
	inst.sorabag = true
	turnoff(inst)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.MiniMapEntity:SetIcon("sora2bag.tex")

    inst.AnimState:SetBank("sora2bag")
    inst.AnimState:SetBuild("sora2bag")
    inst.AnimState:PlayAnimation("anim")
	inst:AddTag("Sora2Bag")
	inst:AddTag("backpack")
	inst:AddTag("fridge")
	inst:AddTag("nocool")
    --inst:AddTag("backpack")
	inst:AddTag("aquatic")
	inst:AddTag("waterproofer")

	inst.entity:SetPristine()
    if not TheWorld.ismastersim then
       inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("krampus_sack")
        end
        return inst
    end
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[银白骑士团の制式羽翼]])
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/marblearmour"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2bag.xml"
	inst.components.inventoryitem.imagename = "sora2bag"
    inst.components.inventoryitem.cangoincontainer = false
	--inst.components.inventoryitem.cangoincontainer = false
	inst.sorabag = true
	--背包
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("krampus_sack")
    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(0.25)
    
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BACK or EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.dapperness = getsora("sora2bagsan")/60
	--移速
	inst.components.equippable.walkspeedmult = getsora("sora2bagspe")
	
    return inst
end

return Prefab("sora2bag", fn, assets)
--,Prefab("soralight", soralightfn)


		