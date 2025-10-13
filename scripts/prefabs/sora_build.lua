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
]] local name = "sora_build"
local assets = {}
SoraAPI.MakeAssetTable(name, assets)
local prefabs = {}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", name, "swap_weapon")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    inst:AddTag("equipped")
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
    inst:RemoveTag("equipped")
    if inst.magicfx ~= nil then
        inst.magicfx:Remove()
        inst.magicfx = nil
    end
end
local function CanFixBuild(staff, target)
    
    if not (target and target:IsValid()) then 
        return false
    end
    if target.components.locomotor then 
        return false
    end
    if target.components.inventoryitem then 
        return false
    end
    if target:HasTag("epic") then 
        return false
    end
    if target:HasTag("monster") then 
        return false
    end
    if target:HasTag("structure") then 
        return true
    end
    
    if target:HasTag("CanFixBuild") then 
        return true
    end
    if target:HasTag("CantFixBuild") then 
        return false
    end
    if target:HasTag("sora_photo") then 
        return true
    end
    
    if target.entity:GetParent() ~= nil then 
        return false
    end
    if target.components.combat then 
        return false
    end
    if target.components.health then 
        return false
    end
    
    return true
end
local function ClearTarget(staff, target)
    if not staff.targets then
        staff.targets = {}
    end
    if staff.targets[target] then
        staff.targets[target] = nil
    end
    if target.sorabuikdfx then
        if target.sorabuikdfx:IsValid() then
            target.sorabuikdfx:Remove()
        end
        target.sorabuikdfx = nil
    end
end
local function soramagicfn(staff, target, pos)
    --print(staff, target, pos, staff.targets)
    if not staff.targets then
        staff.targets = {}
    end
    if staff.targets[target] then
        -- 释放
        if target.sorabuikdfx then
            if target.sorabuikdfx:IsValid() then
                target.sorabuikdfx:Remove()
            end
            target.sorabuikdfx = nil
        end
        target.sorabuildstaff = nil
        staff.targets[target] = nil
    elseif not staff.targets[target] and staff:CanFixBuild(target) then
        -- 清理旧数据
        if target.sorabuildstaff and target.sorabuildstaff:IsValid() then
            target.sorabuildstaff:ClearTarget(target)
        end
        if target.sorabuikdfx then
            if target.sorabuikdfx:IsValid() then
                target.sorabuikdfx:Remove()
            end
            target.sorabuikdfx = nil
        end
        target.sorabuildstaff = staff
        staff.targets[target] = 1
        local fx = SpawnPrefab("sora_build_fx")
        fx:Bind(target)
        target.sorabuikdfx = fx
    end
    return true
end
local function ClearUnValid(staff)
    local toclear = {}
    if not staff.targets then 
        staff.targets = {}
    end
    for k, v in pairs(staff.targets) do
        if not (k and k:IsValid()) then
            toclear[k] = 1
        end
    end
    for k, v in pairs(toclear) do
        staff.targets[k] = nil
    end
end
local function FixBuild(staff, doer, pos, scale)
    ClearUnValid(staff)
    if staff.targets then
        for k, v in pairs(staff.targets) do
            if not k.components.sorabuildfix then
                k:AddComponent("sorabuildfix")
            end
            k.components.sorabuildfix:AddPosOffset(pos)
            k.components.sorabuildfix:AddScale(scale)
        end
    end
end
local function ResetBuild(staff, doer)
    ClearUnValid(staff)
    if staff.targets then
        for k, v in pairs(staff.targets) do
            if not k.components.sorabuildfix then
                k:AddComponent("sorabuildfix")
            end
            k.components.sorabuildfix:Reset()
        end
    end
end
local function ClearAllTarget(staff, doer)
    ClearUnValid(staff)
    if staff.targets then
        local targets = staff.targets
        staff.targets = {}
        for target, v in pairs(targets) do
            if target.sorabuikdfx then
                if target.sorabuikdfx:IsValid() then
                    target.sorabuikdfx:Remove()
                end
                target.sorabuikdfx = nil
            end
            target.sorabuildstaff = nil
        end
    end
end
local ui = require "widgets/sorabuildui"
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst:AddTag("aquatic")
    anim:SetBank(name)
    anim:SetBuild(name)
    anim:PlayAnimation("idle", true)
    inst:AddTag("nopunch")
    inst:AddTag("allow_action_on_impassable")
    inst:AddComponent("soratwoface")
    inst:AddComponent("soraopenui")
    inst.components.soraopenui.canopenfn = function(i, doer)
        return i:HasTag("equipped")
    end
    inst.components.soraopenui.strfn = function(i, doer)
        return "开始调整"
    end
    inst.components.soraopenui.OpenOrCloseUIFn = function(i, doer)
        if doer and doer.HUD and doer.HUD.controls and doer.HUD.controls.containerroot then 
            if doer.HUD.controls.containerroot.SoraBuildUi and doer.HUD.controls.containerroot.SoraBuildUi.inst:IsValid() then 
                doer.HUD.controls.containerroot.SoraBuildUi:Kill() 
                doer.HUD.controls.containerroot.SoraBuildUi = nil
                return true
            end
            doer.HUD.controls.containerroot.SoraBuildUi = nil
            doer.HUD.controls.containerroot.SoraBuildUi = ui(doer)
            doer.HUD.controls.containerroot:AddChild(doer.HUD.controls.containerroot.SoraBuildUi)
        end
        return true
    end
    if not TheWorld.ismastersim then
        return inst
    end
    inst.ClearTarget = ClearTarget
    inst.CanFixBuild = CanFixBuild
    inst.FixBuild = FixBuild
    inst.ClearAllTarget = ClearAllTarget
    inst.ResetBuild = ResetBuild
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[可以用他来调整建筑]])
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. name .. ".xml"
    inst.components.inventoryitem.imagename = name
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = 1.25
    inst:AddComponent("spellcaster")
    inst.components.spellcaster.CanCast = function()
        return true
    end
    inst.components.spellcaster.canuseontargets = true
    inst.components.spellcaster.quickcast = true
    inst.components.spellcaster:SetSpellFn(soramagicfn)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(17)
    return inst
end

local function Bind(inst, target)
    inst.entity:SetParent(target.entity)
end
local function fxfn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.AnimState:SetBank("sora_item_fx")
    inst.AnimState:SetBuild("sora_item_fx")
    inst.AnimState:PlayAnimation("pre")
    inst.AnimState:PushAnimation("loop", true)
    inst.AnimState:SetFinalOffset(1)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.Bind = Bind
    inst.entity:SetPristine()
    inst.persists = false
    return inst
end

SoraAPI.MakeItemSkinDefaultData(name, {}, {})
RegisterInventoryItemAtlas("images/inventoryimages/" .. name .. ".xml", name .. ".tex")
STRINGS.NAMES[name:upper()] = "华章"
STRINGS.CHARACTERS.GENERIC.DESCRIBE[name:upper()] = "可以用他来调整建筑"

return Prefab(name, fn, assets), Prefab(name .. "_fx", fxfn, assets)
