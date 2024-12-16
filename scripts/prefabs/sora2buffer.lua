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
]] local function onremove(light)
    if light and light._lantern then
        light._lantern.sorabufferlight = nil
    end
end
local onDead = nil
local function CancerBuffer(target)
    if target and target.sorabuffer then
        if target.sorabuffercancer then
            target:sorabuffercancer()
        end
        target.sorabuffer:Cancel()
        target.sorabuffertime = 0
        target:RemoveEventCallback("death", onDead)
        target.sorabuffer = nil
        target.sorabuffercancer = nil
    end
end
onDead = function(target)
    CancerBuffer(target)
end
local function qb(inst, target)
    if target and target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 300
        if target.components.health then
            target.components.health:DoDelta(40)
        end
        target.sorabuffer = target:DoPeriodicTask(1, function(inst)
            inst.sorabuffertime = inst.sorabuffertime - 1
            if inst.components.health then
                target.components.health:DoDelta(5)
            end
            if inst.sorabuffertime < 1 then
                CancerBuffer(inst)
            end
        end)
        return true
    end
    return false
end
local function lh(inst, target)
    if target and target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 300
        if target.components.sanity then
            target.components.sanity:DoDelta(40)
        end
        target.sorabuffer = target:DoPeriodicTask(1, function(inst)
            inst.sorabuffertime = inst.sorabuffertime - 1
            if inst.components.sanity then
                target.components.sanity:DoDelta(5)
            end
            if inst.sorabuffertime < 1 then
                CancerBuffer(inst)
            end
        end)
        return true
    end
    return false
end
local function cs(inst, target)
    if target and target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 900
        if target.sorabufferlight ~= nil then
            target.sorabufferlight:Remove()
        end
        target.sorabufferlight = SpawnPrefab("sorabufferlight")
        target.sorabufferlight._lantern = target
        target:ListenForEvent("onremove", onremove)
        target.sorabufferlight.entity:SetParent(target.entity)
        target.sorabuffercancer = function(inst)
            if inst.sorabufferlight ~= nil then
                inst.sorabufferlight:Remove()
                inst:RemoveEventCallback("onremove", onremove)
            end
        end
        target.sorabuffer = target:DoPeriodicTask(10, function(inst)
            inst.sorabuffertime = inst.sorabuffertime - 10
            if inst.sorabuffertime < 1 then
                CancerBuffer(inst)
            end
        end)
        return true
    end
    return false
end
local function lm(inst, target)
    if target and not target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 180
        target:AddTag("sora2lm")
        target.sorabuffer = target:DoPeriodicTask(1, function(inst)
            if inst.components.health then
                inst.components.health:DoDelta(500)
                inst.sorabuffertime = inst.sorabuffertime - 1
                if inst.sorabuffertime < 1 then
                    CancerBuffer(inst)
                end
            end
        end)
        return true
    end
    return false
end

local function gz(inst, target)
    if target and target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 900
        target.sorabuffer = target:DoPeriodicTask(1, function(inst)
            if inst.components.temperature then
                inst.components.temperature:SetTemperature(30)
                inst.sorabuffertime = inst.sorabuffertime - 1
                target.components.freezable:AddColdness(-100)
                if inst.sorabuffertime < 1 then
                    CancerBuffer(inst)
                end
            end
        end)
        return true
    end
    return false
end

local function yy(inst, target)
    if target and target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 300
        if target.components.combat then
            target.components.combat.externaldamagemultipliers:SetModifier("sora2buffer", 1.5)
        end
        target.sorabuffercancer = function(inst)
            if target.components.combat and target.components.combat.externaldamagemultipliers then
                target.components.combat.externaldamagemultipliers:SetModifier("sora2buffer")
            end
        end
        target.sorabuffer = target:DoPeriodicTask(10, function(inst)
            inst.sorabuffertime = inst.sorabuffertime - 10
            if inst.sorabuffertime < 1 then
                CancerBuffer(inst)
            end
        end)
        return true
    end
    return false
end
local function ReadyToDie(inst)
    if not (inst and not inst:HasTag("sora") and inst.components.health and not inst.components.health:IsDead()) then
        return
    end
    local target =
        inst.soraxstarget and not inst.soraxstarget:HasTag("sora") and inst.soraxstarget.components.health and
            not inst.soraxstarget.components.health:IsDead() and inst.soraxstarget or nil

    local attacker = target or inst
    local amount = 10000 + attacker.components.health.currenthealth + attacker.components.health.maxhealth +
                       inst.components.health.currenthealth + inst.components.health.maxhealth
    -- print("大伤害！",amount,inst,attacker)
    for i = 1, 10 do
        inst.components.health:DoDelta(-amount, nil, attacker.prefab, true, attacker, true)
    end
    if not inst.components.health:IsDead() then
        inst.components.health:Kill()
    end
    if inst.components.health:IsDead() then
        attacker:PushEvent("killed", {
            victim = inst,
            attacker = attacker
        })
    end

    if target then
        local attacker = inst
        for i = 1, 10 do
            target.components.health:DoDelta(-amount, nil, attacker.prefab, true, attacker, true)
        end
        if not target.components.health:IsDead() then
            target.components.health:Kill()
        end
        if target.components.health:IsDead() then
            attacker:PushEvent("killed", {
                victim = target,
                attacker = attacker
            })
        end
    end
    -- body
    inst.soraxstarget = nil
    inst.soraxstask = nil
end
local function attack(inst, data)
    if inst and data and data.target and not data.target:HasTag("sora") then
        if math.random(0, 100) < 10 then
            if inst.soraxstask then
                inst.soraxstask:Cancel()
                inst.soraxstask = nil
                inst.soraxstarget = nil
            end
            local a = math.random(1, 60)
            inst.soraxstask = inst:DoTaskInTime(a, ReadyToDie)
            inst.soraxstarget = data.target
            -- print("准备去死",a,inst,data.target)
        end
    end
end
local function xs(inst, target)
    if target and target:HasTag("Player") and not target:HasTag("sora") then
        CancerBuffer(target)
        target.sorabuffertime = 300
        if target.components.combat then
            target.components.combat.externaldamagemultipliers:SetModifier("sora2buffer", 4)
            target:ListenForEvent("onhitother", attack)
            -- target.components.combat.externaldamagetakenmultipliers:SetModifier("sora2buffer",4)
        end
        target.sorabuffercancer = function(inst)
            if target.components.combat then
                target.components.combat.externaldamagemultipliers:SetModifier("sora2buffer")
                target:RemoveEventCallback("onhitother", attack)
                -- target.components.combat.externaldamagetakenmultipliers:SetModifier("sora2buffer")
            end
        end
        target.sorabuffer = target:DoPeriodicTask(1, function(inst)
            inst.sorabuffertime = inst.sorabuffertime - 1
            if inst.sorabuffertime < 1 then
                CancerBuffer(inst)
            end
        end)
        return true
    end
    return false
end
local function ry(inst, target)
    if target and target:HasTag("Player") then
        CancerBuffer(target)
        target.sorabuffertime = 900
        if target.components.locomotor then
            target.components.locomotor:SetExternalSpeedMultiplier(target, "sora2buffer", 1.75)
        end
        target.sorabuffercancer = function(inst)
            if inst.components.locomotor then
                inst.components.locomotor:SetExternalSpeedMultiplier(target, "sora2buffer")
            end
        end
        target.sorabuffer = target:DoPeriodicTask(10, function(inst)
            inst.sorabuffertime = inst.sorabuffertime - 10
            if inst.sorabuffertime < 1 then
                CancerBuffer(inst)
            end
        end)
        return true
    end
    return false
end
local function buffer_commonfn(inst, target)
    if target ~= nil then
        if inst.bufferfn(inst, target) then
            target:ListenForEvent("death", onDead)
            if inst.inst.components.stackable ~= nil and inst.inst.components.stackable:IsStack() then
                inst.inst.components.stackable:Get():Remove()
            else
                inst.inst:Remove()
            end
        end
        return true
    end
end

local function MakeBuffer(name, des, bufferfn)
    local assets = {Asset("ANIM", "anim/sora2buffers.zip"), Asset("IMAGE", "images/inventoryimages/" .. name .. ".tex"),
                    Asset("ATLAS", "images/inventoryimages/" .. name .. ".xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/" .. name .. ".xml", 256)}
    local prefabs = {}

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("sora2buffers")
        inst.AnimState:SetBuild("sora2buffers")
        inst.AnimState:PlayAnimation(name)
        inst:AddComponent("soratwoface")
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        inst:AddComponent("inspectable")

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. name .. ".xml"
        inst.components.inventoryitem.imagename = name
        inst:AddComponent("healer")
        inst.components.healer.bufferfn = bufferfn
        inst.components.healer.health = 0
        inst.components.healer.Heal = buffer_commonfn
        if name == "sora2xs" then
            inst:AddComponent("soraaction")
        end
        return inst

    end
    return Prefab(name, fn, assets, prefabs)
end
local function sorabufferlightfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()
    inst:AddTag("FX")
    inst.Light:SetFalloff(0.7)
    inst.Light:SetIntensity(.8)
    inst.Light:SetRadius(5)
    inst.Light:SetColour(180 / 255, 195 / 255, 150 / 255)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.persists = false
    return inst
end
return MakeBuffer("sora2qb", "谦卑\r\n活力四射！", qb), MakeBuffer("sora2lh", "灵魂\r\n精神焕发！", lh),
    MakeBuffer("sora2cs", "诚实\r\n无惧黑暗！", cs), MakeBuffer("sora2lm", "怜悯\r\n怜悯对手！", lm),
    MakeBuffer("sora2gz", "公正\r\n远离寒暑！", gz), MakeBuffer("sora2yy", "英勇\r\n英勇善战！", yy),
    MakeBuffer("sora2xs", "牺牲\r\n向死而生！", xs), MakeBuffer("sora2ry", "荣誉\r\n一往无前！", ry),
    Prefab("sorabufferlight", sorabufferlightfn)
