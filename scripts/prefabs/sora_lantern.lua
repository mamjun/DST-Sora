local assets = {
    -- Asset("ANIM", "anim/sora_lantern.zip"),
    -- Asset("ANIM", "anim/sora_lantern_water.zip"),
    -- Asset("ANIM", "anim/swap_sora_lantern.zip"),
    -- Asset("INV_IMAGE", "sora_lantern_lit"),
}
local name = "sora_lantern"
SoraAPI.MakeAssetTable(name, assets)

local prefabs = {"sora_lanternlight", "sora_lanternbody"}

local LIGHT_RADIUS = 2.5
local LIGHT_COLOUR = Vector3(200 / 255, 100 / 255, 100 / 255)
local LIGHT_INTENSITY = .8
local LIGHT_FALLOFF = .5

local function OnUpdateFlicker(inst, starttime)
    local time = starttime ~= nil and (GetTime() - starttime) * 15 or 0
    local flicker = (math.sin(time) + math.sin(time + 2) + math.sin(time + 0.7777)) * .5 -- range = [-1 , 1]
    flicker = (1 + flicker) * .5 -- range = 0:1
    inst.Light:SetRadius(LIGHT_RADIUS + .1 * flicker)
    flicker = flicker * 2 / 255
    inst.Light:SetColour(LIGHT_COLOUR.x + flicker, LIGHT_COLOUR.y + flicker, LIGHT_COLOUR.z + flicker)
end

local function onremovelight(light)
    light._lantern._light = nil
end

local function stoptrackingowner(inst)
    if inst._owner ~= nil then
        inst:RemoveEventCallback("equip", inst._onownerequip, inst._owner)
        inst._owner = nil
    end
end

local function starttrackingowner(inst, owner)
    if owner ~= inst._owner then
        stoptrackingowner(inst)
        if owner ~= nil and owner.components.inventory ~= nil then
            inst._owner = owner
            inst:ListenForEvent("equip", inst._onownerequip, owner)
        end
    end
end

local function turnon(inst)
    
    if inst._light == nil then
        inst._light = SpawnPrefab("sora_lanternlight")
        inst._light._lantern = inst
        inst:ListenForEvent("onremove", onremovelight, inst._light)
    end
    inst._light.entity:SetParent((inst.components.inventoryitem.owner or inst._body or inst).entity)

    inst.AnimState:Show("LIGHT")

    if inst._body ~= nil then
        inst._body.AnimState:Show("LIGHT")
    end

    if not (inst._body ~= nil and inst._body.entity:IsVisible()) and inst.components.equippable:IsEquipped() and
        inst.components.inventoryitem.owner ~= nil then
        inst.components.inventoryitem.owner.AnimState:Show("LANTERN_OVERLAY")
    end

end

local function turnoff(inst)
    stoptrackingowner(inst)
    if inst._light ~= nil then
        inst._light:Remove()
    end

    inst.AnimState:Hide("LIGHT")

    if inst._body ~= nil then
        inst._body.AnimState:Hide("LIGHT")
    end

    if inst.components.equippable:IsEquipped() then
        inst.components.inventoryitem.owner.AnimState:Hide("LANTERN_OVERLAY")
    end

    -- inst.components.inventoryitem:ChangeImageName("sora_lantern")
end

local function OnRemove(inst)
    if inst._light ~= nil then
        inst._light:Remove()
    end
    if inst._body ~= nil then
        inst._body:Remove()
    end
end

local function ondropped(inst)
    turnoff(inst)
    turnon(inst)
end

local function ToggleOverrideSymbols(inst, owner)
    if owner.sg ~= nil and (owner.sg:HasStateTag("nodangle") or
        (owner.components.rider ~= nil and owner.components.rider:IsRiding() and not owner.sg:HasStateTag("forcedangle"))) then
        owner.AnimState:OverrideSymbol("swap_object", inst.skinname or "sora_lantern", "swap_sora_lantern")
        owner.AnimState:Show("LANTERN_OVERLAY")
        inst._body:Hide()
    else
        owner.AnimState:OverrideSymbol("swap_object", inst.skinname or "sora_lantern", "swap_sora_lantern_stick")
        owner.AnimState:Hide("LANTERN_OVERLAY")
        inst._body:Show()
    end
end

local function onremovebody(body)
    body._lantern._body = nil
end

local function onequip(inst, owner)
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    owner.AnimState:OverrideSymbol("lantern_overlay",inst.skinname or  "sora_lantern", "sora_lantern_overlay")

    if inst._body ~= nil then
        inst._body:Remove()
    end
    local skin = nil
    if inst.skinname then 
        if inst.skinname == "sora_lantern_yh" then 
            skin = "sora_lanternbody_yh"
        end
    end
    inst._body = SpawnPrefab("sora_lanternbody",skin)
    inst._body._lantern = inst
    inst:ListenForEvent("onremove", onremovebody, inst._body)

    inst._body.entity:SetParent(owner.entity)
    inst._body.entity:AddFollower()
    inst._body.Follower:FollowSymbol(owner.GUID, "swap_object", 78, -91, 0)
    inst._body:ListenForEvent("newstate", function(owner, data)
        ToggleOverrideSymbols(inst, owner)
    end, owner)

    ToggleOverrideSymbols(inst, owner)

    if owner.components.bloomer ~= nil then
        owner.components.bloomer:AttachChild(inst._body)
    end
    if owner.components.colouradder ~= nil then
        owner.components.colouradder:AttachChild(inst._body)
    end

    if inst._body.entity:IsVisible() then
        owner.AnimState:Hide("LANTERN_OVERLAY")
    else
        owner.AnimState:Show("LANTERN_OVERLAY")
    end
    turnon(inst)

end

local function onunequip(inst, owner)
    if inst._body ~= nil then
        if inst._body.entity:IsVisible() then
            -- need to see the lantern when animating putting away the object
            owner.AnimState:OverrideSymbol("swap_object", inst.skinname or "sora_lantern", "swap_sora_lantern")
        end
        if inst._light ~= nil then
            inst._light.entity:SetParent((inst.components.inventoryitem.owner or inst).entity)
        end
        inst._body:Remove()
    end

    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    owner.AnimState:ClearOverrideSymbol("lantern_overlay")
    owner.AnimState:Hide("LANTERN_OVERLAY")
    starttrackingowner(inst, owner)

end

local function onequiptomodel(inst, owner, from_ground)
    if inst._body ~= nil then
        if inst._body.entity:IsVisible() then
            -- need to see the lantern when animating putting away the object
            owner.AnimState:OverrideSymbol("swap_object",inst.skinname or  "sora_lantern", "swap_sora_lantern")
        end
        if inst._light ~= nil then
            inst._light.entity:SetParent((inst.components.inventoryitem.owner or inst).entity)
        end
        inst._body:Remove()
    end
    starttrackingowner(inst, owner)
    turnoff(inst)
end

local function nofuel(inst)
    if inst.components.equippable:IsEquipped() and inst.components.inventoryitem.owner ~= nil then
        local data = {
            prefab = inst.prefab,
            equipslot = inst.components.equippable.equipslot
        }
        turnoff(inst)
        inst.components.inventoryitem.owner:PushEvent("torchranout", data)
    else
        turnoff(inst)
    end
end

local function OnLoad(inst, data)
end

local function lanternlightfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.Light:SetIntensity(LIGHT_INTENSITY)
    -- inst.Light:SetColour(LIGHT_COLOUR.x, LIGHT_COLOUR.y, LIGHT_COLOUR.z)
    inst.Light:SetFalloff(LIGHT_FALLOFF)
    inst.Light:SetRadius(LIGHT_RADIUS)
    
    inst.Light:EnableClientModulation(true)

    inst:DoPeriodicTask(.1, OnUpdateFlicker, nil, GetTime())
    OnUpdateFlicker(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sora_lantern")
    inst.AnimState:SetBuild("sora_lantern")
    inst.AnimState:PlayAnimation("idle_loop", true)

    inst:AddTag("light")

    MakeInventoryFloatable(inst, "med", nil, {0.775, 0.5, 0.775})

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetFrame(math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(turnoff)

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable:SetOnEquipToModel(onequiptomodel)
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("soraitemcontrol")
    inst.components.soraitemcontrol.tags = {"sora_lantern"}

    inst:ListenForEvent("floater_startfloating", function(inst)
        inst.AnimState:PlayAnimation("idle_loop", true)
    end)
    inst:ListenForEvent("floater_stopfloating", function(inst)
        inst.AnimState:PlayAnimation("idle_loop", true)
    end)

    MakeSmallBurnable(inst, TUNING.TINY_BURNTIME)
    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    inst.components.burnable.ignorefuel = true -- igniting/extinguishing should not start/stop fuel consumption

    inst.OnRemoveEntity = OnRemove
    inst.OnLoad = OnLoad

    inst._light = nil
    turnon(inst)

    inst._onownerequip = function(owner, data)
        if data.item ~= inst and
            (data.eslot == EQUIPSLOTS.HANDS or (data.eslot == EQUIPSLOTS.BODY and data.item:HasTag("heavy"))) then
            turnoff(inst)
        end
    end

    return inst
end

local function lanternbodyfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.AnimState:SetBank("sora_lantern")
    inst.AnimState:SetBuild("sora_lantern")
    inst.AnimState:PlayAnimation("idle_body_loop", true)
    --inst.AnimState:SetSortOrder(3)
    --inst.AnimState:SetLayer(3)
    inst:AddTag("FX")
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    inst.AnimState:SetFrame(math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1)
    inst.persists = false
    return inst
end

local skin  = SoraAPI.MakeItemSkin(name, name, {
    name = "归途",
    atlas = "images/inventoryimages/"..name..".xml",
    image = name,
    build = name,
    bank = name,
    checkfn =  SoraAPI.SoraSkinCheckFn,
    dontload=true,
    checkclientfn =  SoraAPI.SoraSkinCheckClientFn 
})
skin.fn = fn 
skin.is_skin = false
skin.assets = assets
SoraAPI.MakeItemSkinDefaultImage(name, "images/inventoryimages/"..name..".xml", name)
RegisterInventoryItemAtlas("images/inventoryimages/"..name..".xml", name..".tex")
STRINGS.NAMES[name:upper()] ="莲叶东"
STRINGS.CHARACTERS.GENERIC.DESCRIBE[name:upper()] = "让它带你找到回家的路"
local skinname  = "sora_lantern_yh"
SoraAPI.MakeItemSkin(name, skinname, {
    name = "春迟",
    atlas = "images/inventoryimages/"..skinname..".xml",
    image = skinname,
    build = skinname,
    bank = skinname,
    checkfn =  SoraAPI.SoraSkinCheckFn,
    checkclientfn =  SoraAPI.SoraSkinCheckClientFn 
})
SoraAPI.MakeAssetTable(skinname,assets)

SoraAPI.MakeItemSkin("sora_lanternbody", "sora_lanternbody_yh", {
    name = "春迟",
    atlas = "images/inventoryimages/"..skinname..".xml",
    image = skinname,
    build = skinname,
    bank = skinname,
    checkfn =  SoraAPI.SoraSkinCheckFn,
    checkclientfn =  SoraAPI.SoraSkinCheckClientFn 
})
SoraAPI.MakeSkinNameMap("sora_lantern_yh","sora_lanternbody_yh")

return skin, Prefab("sora_lanternlight", lanternlightfn),
    Prefab("sora_lanternbody", lanternbodyfn)
