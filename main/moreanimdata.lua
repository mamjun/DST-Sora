--[[
授权级别:开放级
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
]] AllSwap = {
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
local animmap = LeakTableKV()
AnimMap = animmap
local transmap = LeakTableKV()
TransMap = transmap
local Entity_AddAnimState = Entity.AddAnimState
Entity.AddAnimState = function(entity, ...)
    local guid = entity:GetGUID()
    local x = {Entity_AddAnimState(entity, ...)}
    if x[1] and Ents[guid] then
        animmap[x[1]] = Ents[guid]
        if not Ents[guid].soramoreanimdata then
            Ents[guid].soramoreanimdata = {}
        end
    end
    return unpack(x)
end

local Entity_AddTransform = Entity.AddTransform
Entity.AddTransform = function(entity, ...)
    local guid = entity:GetGUID()
    local x = {Entity_AddTransform(entity, ...)}
    if x[1] and Ents[guid] then
        transmap[x[1]] = Ents[guid]
        if not Ents[guid].soramoreanimdata then
            Ents[guid].soramoreanimdata = {}
        end
    end
    return unpack(x)
end

-- local oldOnRemoveEntity = OnRemoveEntity
-- GLOBAL.OnRemoveEntity = function(guid, ...)
--     local inst = Ents[guid]
--     if inst and inst.AnimState then
--         animmap[inst.AnimState] = nil
--     end
--     local x = {oldOnRemoveEntity(guid, ...)}
--     return unpack(x)
-- end

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
HookAnim("SetSortWorldOffset", "worldoffset", SaveLast)
HookAnim("SetMultColour", "multcolour", SaveLast)
-- HookAnim("SetLayer", "setlayer", SaveLast)

function HookTransform(name, key, fn)
    local oldfn = Transform[name]
    Transform[name] = function(anim, ...)
        if transmap[anim] and transmap[anim].soramoreanimdata then
            fn(transmap[anim], key, transmap[anim].soramoreanimdata, ...)
        end
        --print(anim,name,transmap[anim],unpack({...}))
        return oldfn(anim, ...)
    end
end
HookTransform("SetRotation", "rota", SaveLast)
local function SaveFace(num)
    return function(inst, key, data, ...)
        data[key] = num
    end
end
HookTransform("SetEightFaced", "face", SaveFace(8))
HookTransform("SetSixFaced", "face", SaveFace(6))
HookTransform("SetFourFaced", "face", SaveFace(4))
HookTransform("SetTwoFaced", "face", SaveFace(2))
HookTransform("SetNoFaced", "face", SaveFace(1))

