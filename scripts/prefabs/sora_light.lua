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
]] local assets = {Asset("ANIM", "anim/sora_light/sora_light_white.zip"), Asset("ANIM", "anim/ui_lamp_1x4.zip"),
                   Asset("ATLAS", "images/inventoryimages/sora_light.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_light.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora_light.xml", 256),

                   Asset("ATLAS", "images/inventoryimages/sora_gem_bg.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_gem_bg.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora_gem_bg.xml", 256),

                   Asset("ATLAS", "images/inventoryimages/sora_light_bg.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_light_bg.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora_light_bg.xml", 256)}

local TechTree = require("techtree")
local prefabs = {}
local color = {"blue", "green", "orange", "pink", "rainbow", "red", "silvery", "violet", "yellow"}
local sound = {
    toggle = "dontstarve/common/together/mushroom_lamp/lantern_2_on",
    colour = "dontstarve/common/together/mushroom_lamp/change_colour",
    craft = "dontstarve/common/together/mushroom_lamp/craft_2"
}
local light_str = {{
    radius = 4.5,
    falloff = .88,
    intensity = 0.8
}, {
    radius = 5.25,
    falloff = .88,
    intensity = 0.8
}, {
    radius = 7.25,
    falloff = .88,
    intensity = 0.8
}, {
    radius = 9.5,
    falloff = .88,
    intensity = 0.8
}}

local colour_tint = {0.4, 0.3, 0.25, 0.2, 0.1}
local mult_tint = {0.7, 0.6, 0.55, 0.5, 0.45}

local function IsLightOn(inst)
    return inst.Light:IsEnabled()
end
local function ClearSoundQueue(inst)
    if inst._soundtask ~= nil then
        inst._soundtask:Cancel()
        inst._soundtask = nil
    end
end
local function OnQueuedSound(inst, soundname)
    inst._soundtask = nil
    inst.SoundEmitter:PlaySound(soundname)
end
local function QueueSound(inst, delay, soundname)
    if inst._soundtask ~= nil then
        inst._soundtask:Cancel()
    end
    inst._soundtask = inst:DoTaskInTime(delay, OnQueuedSound, soundname)
end
local treemap = {
    blue = {
        MAGIC = 5, -- 魔法本
        BOOKCRAFT = 5
    }, -- 书架
    green = {
        FISHING = 5, -- 钓鱼
        HERMITCRABSHOP = 7
    }, -- 奶奶
    orange = {
        CARTOGRAPHY = 5,
        FOODPROCESSING = 5 -- 香料站
    }, -- 制图桌
    pink = {
        PERDOFFERING = 5, -- 活动科技
        WARGOFFERING = 5,
        PIGOFFERING = 5,
        CARRATOFFERING = 5,
        BEEFOFFERING = 5,
        CATCOONOFFERING = 5,
        RABBITOFFERING = 5,
        MADSCIENCE = 5,
        CARNIVAL_PRIZESHOP = 5,
        CARNIVAL_HOSTSHOP = 5,

        WINTERSFEASTCOOKING = 5
    },
    red = {
        SCIENCE = 5
    }, -- 科技本
    silvery = {
        CELESTIAL = 5
    }, -- 月亮
    violet = {
        ANCIENT = 5,
        TURFCRAFTING = 5,
        MASHTURFCRAFTING = 5
    }, -- 远古
    yellow = {
        SEAFARING = 5
    } -- 航海
}
treemap.rainbow = {}
for k, v in pairs(treemap) do
    for ik, iv in pairs(v) do
        treemap.rainbow[ik] = math.max(treemap.rainbow[ik] or 0, iv)
    end
end
local function UpdateLightState(inst)

    ClearSoundQueue(inst)
    local num_batteries = 0
    local trees = {}
    for i = 151, 154 do
        local item = inst.components.container:GetItemInSlot(i)
        if item and item:HasTag("sora_light_batteries") then
            num_batteries = num_batteries + 1
            if item and item.type and treemap[item.type] then
                for k, v in pairs(treemap[item.type]) do
                    trees[k] = math.max(trees[k] or 0, v)
                end
            end
        end
    end
    local was_on = IsLightOn(inst)

    inst.components.prototyper.trees = TechTree.Create(trees)
    if num_batteries > 0 then
        inst.Light:SetRadius(light_str[num_batteries].radius)
        inst.Light:SetFalloff(light_str[num_batteries].falloff)
        inst.Light:SetIntensity(light_str[num_batteries].intensity)
        for i = 1, 4 do
            local item = inst.components.container:GetItemInSlot(i)
            if item then
                inst.AnimState:OverrideSymbol("flower" .. i, item.prefab, "flower" .. i)
            else
                inst.AnimState:ClearOverrideSymbol("flower" .. i)
            end
        end
        if not was_on then
            inst.Light:Enable(true)
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        end

        if POPULATING then
            inst.AnimState:PlayAnimation("idle_on")
        elseif not was_on then
            inst.AnimState:PlayAnimation("turn_on")
            inst.AnimState:PushAnimation("idle_on", false)
            inst.SoundEmitter:PlaySound(sound.toggle)
        else
            inst.AnimState:PlayAnimation("colour_change")
            inst.AnimState:PushAnimation("idle_on", false)
            inst.SoundEmitter:PlaySound(sound.toggle)
            QueueSound(inst, 13 * FRAMES, sound.colour)
        end
    else
        inst.Light:Enable(false)
        inst.AnimState:ClearBloomEffectHandle()
        inst.AnimState:SetMultColour(.7, .7, .7, 1)
        if POPULATING then
            inst.AnimState:PlayAnimation("idle")
        elseif was_on then
            inst.AnimState:PlayAnimation("turn_off")
            inst.AnimState:PushAnimation("idle", false)
            inst.SoundEmitter:PlaySound(sound.toggle)
        end
    end
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("pot")
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    inst:Remove()
end
local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle", true)
end
local function onhit(inst, worker, workleft)
    if workleft > 0 and not inst:HasTag("burnt") then
        ClearSoundQueue(inst)
        inst.AnimState:PlayAnimation(IsLightOn(inst) and "hit_on" or "hit")
        inst.AnimState:PushAnimation(IsLightOn(inst) and "idle_on" or "idle", false)
        if inst.components.container ~= nil then
            inst.components.container:DropEverything()
            inst.components.container:Close()
        end
    end

end

local function getstatus(inst)
    return (IsLightOn(inst) and "ON") or "OFF"
end
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddLight()
    inst.entity:AddNetwork()
    MakeObstaclePhysics(inst, 0.4)

    anim:SetBank("sora_light_white")
    anim:SetBuild("sora_light_white")
    inst.AnimState:SetMultColour(.7, .7, .7, 1)
    anim:PlayAnimation("idle", true)

    inst.Light:SetColour(.65, .65, .5)
    inst.Light:Enable(false)
    inst:AddTag("structure")
    inst:AddTag("prototyper")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("prototyper")
    -- inst.components.prototyper.onturnon = SoraAPI.NilFn
    -- inst.components.prototyper.onturnoff = SoraAPI.NilFn
    inst.components.prototyper.trees = {}
    -- inst.components.prototyper.onactivate = SoraAPI.NilFn

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora_light")

    inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("itemget", UpdateLightState)
    inst:ListenForEvent("itemlose", UpdateLightState)

    return inst
end

table.insert(prefabs, Prefab("sora_light", fn, assets))
table.insert(prefabs, MakePlacer("sora_light_placer", "sora_light_white", "sora_light_white", "idle"))
local function MakeLight(str, istrue)
    local name = "sora_light_" .. str
    local assets = {Asset("ANIM", "anim/sora_light/" .. name .. ".zip"),
                    Asset("ATLAS", "images/inventoryimages/sora_light/" .. name .. ".xml"),
                    Asset("IMAGE", "images/inventoryimages/sora_light/" .. name .. ".tex"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora_light/" .. name .. ".xml", 256)}
    local function fn()
        local inst = CreateEntity()
        local trans = inst.entity:AddTransform()
        local anim = inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        inst.entity:AddLight()
        inst.Light:SetFalloff(0.7)
        inst.Light:SetIntensity(.5)
        inst.Light:SetRadius(0.5)
        inst.Light:SetColour(237 / 255, 237 / 255, 209 / 255)
        inst.Light:Enable(true)

        anim:SetBank(name)
        anim:SetBuild(name)
        anim:PlayAnimation("idle", true)
        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddTag("sora_light_batteries")
        inst.type = (istrue and str or "")
        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/sora_light/" .. name .. ".xml"
        inst.components.inventoryitem.imagename = name
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
        return inst
    end
    return Prefab(name .. (istrue and "_new" or ""), fn, assets)
end

for k, v in pairs(color) do
    table.insert(prefabs, MakeLight(v))
    table.insert(prefabs, MakeLight(v, true))
end
return unpack(prefabs)
