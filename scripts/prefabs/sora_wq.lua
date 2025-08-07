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
]] local assets = {Asset("ANIM", "anim/sora_wq.zip"), Asset("ATLAS", "images/inventoryimages/sora_wq.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_wq.tex"),
                   Asset("ATLAS", "images/inventoryimages/sorawqlevel.xml"),
                   Asset("IMAGE", "images/inventoryimages/sorawqlevel.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora_wq.xml", 256)}

local function OnLevelChange(inst,data)
    -- body
    local level = data and data.level or inst.components.sorawq and inst.components.sorawq.level or 1
    inst.areaattack = 1 + 0.2*level 
    inst.heal  = 1+0.2 * level
    inst.ice = 1+0.2 * level
    inst.damageup = 1.3 + 0.1 *level
    if inst.owner then
        local owner = inst.owner
        owner.components.combat.externaldamagemultipliers:SetModifier("sora_wq",inst.damageup)
        if owner.components.combat.external_critical_damage_multipliers then
            owner.components.combat.external_critical_damage_multipliers:SetModifier(inst, 0.442, "sora_wq")
            owner.components.combat.external_pyro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
            owner.components.combat.external_cryo_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
            owner.components.combat.external_hydro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
            owner.components.combat.external_electro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
            owner.components.combat.external_anemo_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
            owner.components.combat.external_geo_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
            owner.components.combat.external_dendro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        end
    end

   
end
local function attackfn(target,player)
    if not player.sorawqattack then return true end
    if target.components.freezable ~= nil then
        target.components.freezable:AddColdness(player.sorawqattack.ice)
        target.components.freezable:SpawnShatterFX()
    end
    if  player.components.health then
        player.components.health:DoDelta(player.sorawqattack.heal)
    end
    return true
end
local function onattack(inst, attacker, target)
    attacker.sorawqattack = {heal = inst.heal,ice=inst.ice}
    attackfn(target,attacker)
    attacker.components.combat:DoAreaAttack(target,inst.areaattack,inst,attackfn,"cryo",{"player", "companion","wall","sora2lm"})
end
local function onequip(inst, owner)
    inst.owner = owner
    
    owner.AnimState:OverrideSymbol("swap_object", inst.skinname or  "sora_wq", "swap_wq")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    if not owner:HasTag("sora") then return end
    owner.components.combat.externaldamagemultipliers:SetModifier("sora_wq",inst.damageup)
    if owner.components.combat.external_critical_damage_multipliers then
        owner.components.combat.external_critical_damage_multipliers:SetModifier(inst, 0.442, "sora_wq")
        owner.components.combat.external_pyro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        owner.components.combat.external_cryo_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        owner.components.combat.external_hydro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        owner.components.combat.external_electro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        owner.components.combat.external_anemo_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        owner.components.combat.external_geo_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
        owner.components.combat.external_dendro_multipliers:SetModifier(inst, 0.3+0.1*inst.components.sorawq.level, "sora_wq")
    end
end

local function onunequip(inst, owner)
    inst.owner = nil
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    if not owner:HasTag("sora") then return end
    owner.components.combat.externaldamagemultipliers:SetModifier("sora_wq")
    if owner.components.combat.external_critical_damage_multipliers then
        owner.components.combat.external_critical_damage_multipliers:RemoveModifier(inst)
        owner.components.combat.external_pyro_multipliers:RemoveModifier(inst, "sora_wq")
        owner.components.combat.external_cryo_multipliers:RemoveModifier(inst, "sora_wq")
        owner.components.combat.external_hydro_multipliers:RemoveModifier(inst, "sora_wq")
        owner.components.combat.external_electro_multipliers:RemoveModifier(inst, "sora_wq")
        owner.components.combat.external_anemo_multipliers:RemoveModifier(inst, "sora_wq")
        owner.components.combat.external_geo_multipliers:RemoveModifier(inst, "sora_wq")
        owner.components.combat.external_dendro_multipliers:RemoveModifier(inst, "sora_wq")
    end
end
local function OnBuiltFn(inst,builder)
    if not (builder and builder:HasTag("sora")) then 
        return 
    end
    if not (builder.soralevel and builder.soralevel:value() > 19) then 
        return
    end
    if builder.components.builder and builder.components.builder.freebuildmode then 
        return 
    end
    inst.components.sorawq.str = builder.userid .. "|BUILDER|" .. tostring(GetTick())
    inst.components.soraitem.user = builder.userid
end
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst:AddTag("aquatic")
    inst:AddTag("waterproofer")
    inst:AddTag("soraiceweapon")
    anim:SetBank("sora_wq")
    anim:SetBuild("sora_wq")
    anim:PlayAnimation("idle")
    inst:AddComponent("soratwoface")
    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("sora_wq.tex")
    inst.inv_image_bg = {
        image = "sorawqlevel_1.tex"
    }
    inst.inv_image_bg.atlas = softresolvefilepath("images/inventoryimages/sorawqlevel.xml")
    inst.invbg = net_int(inst.GUID, "invbg", "invbgdirty")

    inst:AddTag("subtextweapon")
    inst.subtext = "crit_dmg"
    inst.subnumber = "44.2%"
    --inst.description = "雾切御腰物\n·获得40%/50%/60%/70%/80%全元素伤害加成。\n获得40%/50%/60%/70%/80%伤害增加\n普攻附加冻元素\n普攻回复生命值\n普攻附加溅射伤害"
    inst.description = {
		"雾切御腰物\n·获得40%全元素伤害加成。\n获得40%伤害增加\n普攻附加冻元素\n普攻回复生命值\n普攻附加溅射伤害",
		"雾切御腰物\n·获得50%全元素伤害加成。\n获得50%伤害增加\n普攻附加冻元素\n普攻回复生命值\n普攻附加溅射伤害",
		"雾切御腰物\n·获得60%全元素伤害加成。\n获得60%伤害增加\n普攻附加冻元素\n普攻回复生命值\n普攻附加溅射伤害",
		"雾切御腰物\n·获得70%全元素伤害加成。\n获得70%伤害增加\n普攻附加冻元素\n普攻回复生命值\n普攻附加溅射伤害",
		"雾切御腰物\n·获得80%全元素伤害加成。\n获得80%伤害增加\n普攻附加冻元素\n普攻回复生命值\n普攻附加溅射伤害",
	}
    inst.weaponscreen_override = {
        build = "sora_wq",
        folder = "swap_wq",
    }
    inst.replica.refineable = {
        _current_level = 1,
        GetCurrentLevel = function(i) return i._current_level end,
        GetIngredient = function(i) return "sora_wq" end,
        GetImage = function(i) return "sora_wq" end,
        GetAtlas = function(i) return GetInventoryItemAtlas("sora_wq.tex") end,
        GetMaxLevel = function(i) return 5 end,
        Refine  = function(i,level) if inst.components.sorawq then
            inst.components.sorawq:Refine(level)
        end 
    end,
    }
 
    inst.components.refineable = inst.replica.refineable
    if not TheNet:IsDedicated() then

        inst:ListenForEvent("invbgdirty", function(i)
            inst.inv_image_bg.image = "sorawqlevel_"..math.clamp(inst.invbg:value(), 1, 5) .. ".tex"
            inst:PushEvent("imagechange")
            inst.replica.refineable._current_level = math.clamp(inst.invbg:value(), 1, 5)
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
    inst:AddComponent("soraitem")
    inst.components.soraitem:SetBind(true)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(68)
    inst.components.weapon:SetRange(2)
    inst.components.weapon:SetOnAttack(onattack)
    OnLevelChange(inst,{level=1})
    inst:ListenForEvent("sorawqlevelchange",OnLevelChange)
    inst.OnBuiltFn = OnBuiltFn
    return inst
end
RegisterInventoryItemAtlas("images/inventoryimages/sora_wq.xml", "sora_wq.tex")
SoraAPI.MakeItemSkinDefaultData("sora_wq", {}, {})

SoraAPI.MakeAssetTable("sora_wq_bbj",assets)
SoraAPI.MakeItemSkin("sora_wq","sora_wq_bbj",{
	name = "波乱月白经津",
	atlas = "images/inventoryimages/sora_wq_bbj.xml",
	image = "sora_wq_bbj",
	build = "sora_wq_bbj",
	bank = "sora_wq_bbj",
	checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
RegisterInventoryItemAtlas("images/inventoryimages/sora_wq_bbj.xml","sora_wq_bbj.tex")

return Prefab("sora_wq", fn, assets)
