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
]] local assets = {Asset("ANIM", "anim/sora_wq.zip"), Asset("ATLAS", "images/inventoryimages/sora_wq.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_wq.tex"),
                   Asset("ATLAS", "images/inventoryimages/sorawqlevel.xml"),
                   Asset("IMAGE", "images/inventoryimages/sorawqlevel.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora_wq.xml", 256)}

local function onattack(inst, attacker, target)

end
local function onequip(inst, owner)

    owner.AnimState:OverrideSymbol("swap_object", "sora_wq", "swap_wq")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst:AddTag("aquatic")
    inst:AddTag("waterproofer")
    anim:SetBank("sora_wq")
    anim:SetBuild("sora_wq")
    anim:PlayAnimation("idle")
    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("sora_wq.tex")
    inst.inv_image_bg = {
        image = "1.tex"
    }
    inst.inv_image_bg.atlas = softresolvefilepath("images/inventoryimages/sorawqlevel.xml")
    inst.invbg = net_int(inst.GUID, "invbg", "invbgdirty")
    if not TheNet:IsDedicated() then

        inst:ListenForEvent("invbgdirty", function(i)
            inst.inv_image_bg.image = math.min(math.max(inst.invbg:value(), 1), 5) .. ".tex"
            inst:PushEvent("imagechange")
        end)
        
    end
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("sorawq")
    inst:ListenForEvent("sorawqlevelchange", function(i)

        inst.components.inspectable:SetDescription("精炼等级:" .. inst.components.sorawq.level .. [[ 
闪烁着凄烈紫光的太刀。
名之为「回光」是因为一度破碎的过去。]])
        inst.invbg:set(inst.components.sorawq.level)
    end)

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora_wq.xml"
    inst.components.inventoryitem.imagename = "sora_wq"

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst.components.equippable.walkspeedmult = 1.25

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(68)
    inst.components.weapon:SetRange(2)
    inst.components.weapon:SetOnAttack(onattack)

    return inst
end
RegisterInventoryItemAtlas("images/inventoryimages/sora_wq.xml", "sora_wq.tex")
return Prefab("sora_wq", fn, assets)
