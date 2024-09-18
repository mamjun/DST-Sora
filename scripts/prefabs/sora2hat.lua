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
    Asset("ANIM", "anim/sora2hat.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2hat.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2hat.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2hat.xml", 256),
    
    Asset("ANIM", "anim/sora2hatskin.zip"),
    Asset("ATLAS", "images/inventoryimages/sora2hatskin.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2hatskin.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2hatskin.xml", 256),
}

local armorassets =
{
    Asset("ANIM", "anim/sora2armor.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2armor.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2armor.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2armor.xml", 256),
    
    Asset("ANIM", "anim/sora2armorbuild.zip"),
    Asset("ANIM", "anim/sora2armorskin.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2armorskin.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2armorskin.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2armorskin.xml", 256),
    
}
local l = SoraAPI.sorarepairer
local function AcceptTest(inst, item)
	if l[item.prefab] then
	return inst.components.armor:GetPercent()<1
	else
	return false
	end
end
local function TraderCount(inst,giver,item)
	local arm = 1-inst.components.armor:GetPercent()
	if l[item.prefab]  then
		return math.floor(arm/l[item.prefab])
	else
	return 1
	end
end


local function OnGetItemFromPlayer(inst, giver, item, player) 
	local num = 1
	if item.components.stackable then
	num = item.components.stackable.stacksize
	end
	inst.components.armor:SetPercent(inst.components.armor:GetPercent()+l[item.prefab]*num)

end

local function onequip(inst, owner) 
    if owner:HasTag("sora")  then
        return
    end
    owner.AnimState:OverrideSymbol("swap_hat", inst.skinname or "sora2hat", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
end

local symbol = {"arm_lower","arm_upper","arm_upper_skin","foot","hand","leg","skirt","torso","torso_pelvis"}
local function onequiparmor(inst, owner) 
    if owner:HasTag("sora")  then
        return
    end
    if not inst.skinname or not owner.SoraLockSymbol then
        owner.AnimState:OverrideSymbol("swap_body", "sora2armor", "swap_body")
    else
        for k,v in pairs(symbol) do
            owner:SoraLockSymbol(v, "sora2armor", "sora2armorbuild",v)
        end
    end
end

local function onunequiparmor(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    if owner.SoraUnlockSymbol then
        for k,v in pairs(symbol) do
            owner:SoraUnlockSymbol(v,"sora2armor")
        end
    end
end
local function onhaunt (inst,doer)
	if not doer then
	return false
	end
	if  doer:HasTag("playerghost")  then
		doer:PushEvent("respawnfromghost", { source = inst })
		inst:Remove()
		return true
	end
end
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	inst:AddTag("aquatic")
    inst.AnimState:SetBank("sora2hat")
    inst.AnimState:SetBuild("sora2hat")
    inst.AnimState:PlayAnimation("anim")
    inst:AddTag("waterproofer")
	inst:AddTag("soratrader")
    inst.entity:SetPristine()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sora2hat.tex")
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[
	银白骑士团の制式盔甲，
	可以用绳子、木头、猪皮、石头、燧石
	兔尾巴、蜘蛛丝、蜘蛛腺体、狗牙
	大理石、噩梦燃料修复耐久
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname="images/inventoryimages/sora2hat.xml"
	inst.components.inventoryitem.imagename="sora2hat"
	--护甲
    inst:AddComponent("planardefense")
	inst.components.planardefense:SetBaseDefense(3)
    inst:AddComponent("armor")
	--inst:AddTag("hide_percentage")
    inst.components.armor:InitCondition(getsora("sora2hatarm2"),getsora("sora2hatarm1"))
	--inst.components.armor.GetAbsorption = onAbsorption 
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(getsora("sora2hatwat"))
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	--回脑残
	inst.components.equippable.dapperness = getsora("sora2hatsan")/60
	--移速
	inst.components.equippable.walkspeedmult = getsora("sora2hatspe")
	inst:AddComponent("trader")
	inst.cantrader = TraderCount
	inst.components.trader:SetAbleToAcceptTest(AcceptTest)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst:AddComponent("hauntable")
	inst.components.hauntable.onhaunt = onhaunt
    return inst
end
local function armorfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	inst:AddTag("aquatic")
    inst.AnimState:SetBank("sora2armor")
    inst.AnimState:SetBuild("sora2armor")
    inst.AnimState:PlayAnimation("anim")
    inst:AddTag("waterproofer")
	inst:AddTag("soratrader")
    inst.entity:SetPristine()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon("sora2armor.tex")
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[
	保护你的身体和脑子，
	可以用绳子、木头、猪皮、石头、燧石
	兔尾巴、蜘蛛丝、蜘蛛腺体、狗牙
	大理石、噩梦燃料修复耐久
	]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname="images/inventoryimages/sora2armor.xml"
	inst.components.inventoryitem.imagename="sora2armor"
	--护甲
    inst:AddComponent("planardefense")
	inst.components.planardefense:SetBaseDefense(3)
    inst:AddComponent("armor")
	--inst:AddTag("hide_percentage")
    inst.components.armor:InitCondition(getsora("sora2armorarm2"),getsora("sora2armorarm1"))
	--inst.components.armor.GetAbsorption = onAbsorption 
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(getsora("sora2armorwat"))
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequiparmor)
    inst.components.equippable:SetOnUnequip(onunequiparmor)
	--回脑残
	inst.components.equippable.dapperness = getsora("sora2armorsan")/60
	--移速
	inst.components.equippable.walkspeedmult = getsora("sora2armorspe")
	inst:AddComponent("trader")
	inst.cantrader = TraderCount
	inst.components.trader:SetAbleToAcceptTest(AcceptTest)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst:AddComponent("hauntable")
	inst.components.hauntable.onhaunt = onhaunt

    return inst
end
SoraAPI.MakeItemSkinDefaultData("sora2hat", {}, {})
SoraAPI.MakeItemSkinDefaultData("sora2armor", {}, {})
SoraAPI.MakeItemSkin("sora2hat","sora2hatskin",{
            name = "sdl,awsl",
            atlas = "images/inventoryimages/sora2hatskin.xml",
            image = "sora2hatskin",
            build = "sora2hatskin",
            bank =  "sora2hatskin",
        })
SoraAPI.MakeItemSkin("sora2armor","sora2armorskin",{
            name = "sdl,awsl",
            atlas = "images/inventoryimages/sora2armorskin.xml",
            image = "sora2armorskin",
            build = "sora2armorskin",
            bank =  "sora2armorskin",
        })

RegisterInventoryItemAtlas("images/inventoryimages/sora2hat.xml","sora2hat.tex")
RegisterInventoryItemAtlas("images/inventoryimages/sora2armor.xml","sora2armor.tex")

return Prefab("sora2hat", fn, assets),Prefab("sora2armor", armorfn, armorassets)