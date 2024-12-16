AllSwap = {
    grass = 1,
    swap_dried = 1,
    bush_berry_build = 1,
    bc_flower_petal = 1,
    swap_staffs = 1,
    wire_red = 1,
    shadow_hands = 1,
    wire = 1,
    icon = 1,
    column1 = 1,
    wire_blue = 1,
    soil = 1,
    swap_hat = 1,
    fx_wipe = 1,
    swap_garnish = 1,
    FX_fishing = 1,
    bc_face = 1,
    soil01 = 1,
    smallghost_hair = 1,
    column3 = 1,
    fx_liquid = 1,
    swap_body_tall = 1,
    water_ripple = 1,
    bc_bud = 1,
    swap_body_backback = 1,
    column4 = 1,
    Symbol_1 = 1,
    light_shimmer = 1,
    frame_circle = 1,
    plain1 = 1,
    column2 = 1,
    meter = 1,
    swap_spear = 1,
    swap_object = 1,
    swap_item_bg = 1,
    swap_statue = 1,
    fx = 1,
    stagehand_fingers = 1,
    snap_fx = 1,
    swap_item = 1,
    pig_belt = 1,
    swap_food = 1,
    dark_spew = 1,
    snow = 1,
    plug = 1,
    frame = 1,
    fishingline = 1,
    m2 = 1
}
-- local oldCanEntitySeeTarget = CanEntitySeeTarget
-- GLOBAL.CanEntitySeeTarget = function(inst, target, ...)
--     if inst:HasTag("player") and target and target:HasTag("sora_photo") then
--         local useitem = inst.replica.inventory:GetActiveItem()
--         if useitem and useitem:HasTag("sora_photo") then
--             return false
--         end
--     end
--     return oldCanEntitySeeTarget(inst, target, ...)
-- end
if not GLOBAL.TUNING.SORAMOREANIMDATA then
    return
end
local AnimState_OverrideSymbol = AnimState.OverrideSymbol
AnimState.OverrideSymbol = function(i, swap, ...)
    if not AllSwap[swap] then
        AllSwap[swap] = 1
    end
    return AnimState_OverrideSymbol(i, swap, ...)
end
local animmap = {}
local Entity_AddAnimState = Entity.AddAnimState
Entity.AddAnimState = function(entity, ...)
    local guid = entity:GetGUID()
    local x = {Entity_AddAnimState(entity, ...)}
    if x[1] and Ents[guid] then
        animmap[x[1]] = Ents[guid]
        Ents[guid].soramoreanimdata = {}
    end
    return unpack(x)
end

local oldOnRemoveEntity = OnRemoveEntity
GLOBAL.OnRemoveEntity = function(guid, ...)
    local inst = Ents[guid]
    if inst and inst.AnimState then
        animmap[inst.AnimState] = nil
    end
    local x = {oldOnRemoveEntity(guid, ...)}
    return unpack(x)
end

function HookAnim(name, key, fn)
    local oldfn = AnimState[name]
    AnimState[name] = function(anim, ...)
        if animmap[anim] and animmap[anim].soramoreanimdata then
            fn(animmap[anim], key, animmap[anim].soramoreanimdata, ...)
        end
        -- print(anim,name,animmap[anim])
        return oldfn(anim, ...)
    end
end
local function Showfn(inst, key, data, value, ...)
    if not data[key] then
        data[key] = {}
    end
    data[key][value] = true
end
local function Hidefn(inst, key, data, value, ...)
    if not data[key] then
        data[key] = {}
    end
    data[key][value] = false
end
local function SaveLast(inst, key, data, ...)
    data[key] = {...}
end
HookAnim("Show", "layer", Showfn)
HookAnim("Hide", "layer", Hidefn)

HookAnim("ShowSymbol", "symbol", Showfn)
HookAnim("HideSymbol", "symbol", Hidefn)
HookAnim("AddOverrideBuild", "overbuild", Showfn)
HookAnim("ClearOverrideBuild", "overbuild", Hidefn)
HookAnim("SetOrientation", "orientation", SaveLast)
HookAnim("SetScale", "animscale", SaveLast)
HookAnim("SetFinalOffset", "finaloffset", SaveLast)
HookAnim("SetSortOrder", "sortorder", SaveLast)
-- HookAnim("SetSortOrder","sortorder",SaveLast)

