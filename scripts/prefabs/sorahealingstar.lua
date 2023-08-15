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
]] local PULSE_SYNC_PERIOD = 30

-- Needs to save/load time alive.
local player1 = getsora("sorahealingplayer1")
local player2 = getsora("sorahealingplayer2")
local lm1 = getsora("sorahealinglm1")
local lm2 = getsora("sorahealinglm2")

local function kill_sound(inst)
    inst.SoundEmitter:KillSound("staff_star_loop")
end

local function kill_light(inst)
    inst.AnimState:PlayAnimation("disappear")
    inst:ListenForEvent("animover", kill_sound)
    inst:DoTaskInTime(1, inst.Remove) -- originally 0.6, padded for network
    inst.persists = false
    inst._killed = true
end

local function ontimer(inst, data)
    if data.name == "extinguish" then
        kill_light(inst)
    end
end

local function onpulsetimedirty(inst)
    inst._pulseoffs = inst._pulsetime:value() - inst:GetTimeAlive()
end

local function pulse_light(inst)
    local timealive = inst:GetTimeAlive()

    if inst._ismastersim then
        if timealive - inst._lastpulsesync > PULSE_SYNC_PERIOD then
            inst._pulsetime:set(timealive)
            inst._lastpulsesync = timealive
        else
            inst._pulsetime:set_local(timealive)
        end

        inst.Light:Enable(true)
    end

    -- Client light modulation is enabled:

    -- local s = GetSineVal(0.05, true, inst)
    local s = math.abs(math.sin(PI * (timealive + inst._pulseoffs) * 0.05))
    local rad = Lerp(11, 12, s)
    local intentsity = Lerp(0.6, 0.4, s)
    local falloff = Lerp(0.6, 0.4, s)
    inst.Light:SetFalloff(falloff)
    inst.Light:SetIntensity(intentsity)
    inst.Light:SetRadius(rad)
end
local function heal(inst)
    -- 玩家治疗
    local pos = inst:GetPosition()
    local enta = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, nil, {"playerghost"}, {"player", "sora2lm"})
    local play = math.max(inst._level * player2 + player1, 0)
    local lm = math.max(inst._level * lm2 + lm1, 0)
    for i, v in ipairs(enta) do
        if not v.components.health:IsDead() then
            v.components.health:DoDelta(play / 20)
            if v:HasTag("soralm") then
                v.components.health:DoDelta(lm / 20)
            end
            if v.components.sanity then
                v.components.sanity:DoDelta(play / 40)
            end
            if v.components.hunger then
                v.components.hunger:DoDelta(30 / 40)
            end
            if v.components.freezable then
                v.components.freezable:AddColdness(-1 * inst._level / 2, 5 + inst._level)
            end
        end
    end
    -- 玩家复活
    if inst._level > 9 then
        local entb = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, {"playerghost"})
        for i, v in ipairs(entb) do
            v:PushEvent("respawnfromghost", {
                source = inst._doer
            })
        end
    end

    local enta = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, {"heatrock"})
    for i, v in ipairs(enta) do
        if v.components.temperature then
            local temp = v.components.temperature.current
            v.components.temperature:DoDelta((5 - temp) / 5)
        end
    end

    -- 怪物冰冻
    if inst._heal then
        local entc = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, nil, {"player", "sora2lm"})
        for i, v in ipairs(entc) do
            if v:IsValid() and v.entity:IsVisible() and not v:IsInLimbo() and v.components.health and
                not v.components.health:IsDead() then
                v.components.health:DoDelta(lm / 20)
            end
        end
    else
        if inst._level > 4 then
            local entc = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, nil, {"player", "sora2lm"})
            for i, v in ipairs(entc) do
                if v:IsValid() and v.entity:IsVisible() and not v:IsInLimbo() and v.components.freezable then
                    v.components.freezable:AddColdness(inst._level / 2, 5 + inst._level)
                end
            end
        end
    end

end

local function Start(inst, doer, staff, healorice)
    inst._doer = doer
    inst._staff = staff
    inst._level = staff.lbslevel
    inst._heal = healorice
    inst:DoPeriodicTask(0.5, heal)
end
local function makestafflight(name, is_hot, anim, colour, idles, is_fx)
    local assets = {Asset("ANIM", "anim/" .. anim .. ".zip")}

    local PlayRandomStarIdle = #idles > 1 and function(inst)
        -- Don't if we're extinguished
        if not inst._killed then
            inst.AnimState:PlayAnimation(idles[math.random(#idles)])
        end
    end or nil

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()
        inst.entity:AddNetwork()

        inst._ismastersim = TheWorld.ismastersim
        inst._pulseoffs = 0
        inst._pulsetime = net_float(inst.GUID, "_pulsetime", "pulsetimedirty")

        inst:DoPeriodicTask(.1, pulse_light)

        inst.Light:SetColour(unpack(colour))
        inst.Light:Enable(false)
        inst.Light:EnableClientModulation(true)

        inst.AnimState:SetBank(anim)
        inst.AnimState:SetAddColour(100 / 255, unpack(colour))
        inst.AnimState:SetBuild(anim)
        inst.AnimState:PlayAnimation("appear")
        if #idles == 1 then
            inst.AnimState:PushAnimation(idles[1], true)
        end
        inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

        MakeInventoryPhysics(inst)
        inst.no_wet_prefix = true
        inst.Start = Start
        inst.SoundEmitter:PlaySound("dontstarve/common/staff_star_LP", "staff_star_loop")

        inst.entity:SetPristine()

        if not inst._ismastersim then
            inst:ListenForEvent("pulsetimedirty", onpulsetimedirty)
            return inst
        end

        inst._pulsetime:set(inst:GetTimeAlive())
        inst._lastpulsesync = inst._pulsetime:value()

        inst:AddComponent("inspectable")
        inst.components.inspectable:SetDescription([[治愈你的身体和灵魂]])
        inst:AddComponent("timer")
        inst.components.timer:StartTimer("extinguish", 20)
        inst:ListenForEvent("timerdone", ontimer)

        inst.SoundEmitter:PlaySound("dontstarve/common/staff_star_create")

        if #idles > 1 then
            inst:ListenForEvent("animover", PlayRandomStarIdle)
        end
        inst.persists = false
        return inst
    end

    return Prefab(name, fn, assets)
end

return makestafflight("sorahealstar", true, "star_cold", {255 / 255, 0 / 255, 150 / 255}, {"idle_loop"}, false)
