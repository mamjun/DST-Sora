-- 暖金星光尾迹与静止星光。皮肤只需挂载 sora_foot_star；不在此注册或修改皮肤。
-- 同一文件同时注册网络控制器与非网络粒子载体。
local TEXTURE = "fx/sora_foot_star.tex" -- 粒子贴图路径；当前按横向四格图集随机选取星星/月牙。
local SHADER = "shaders/vfx_particle_add.ksh" -- 粒子着色器路径；与下方 Additive 混合模式配套使用。
local PREFIX = "sora_foot_star" -- 颜色、缩放包络的注册名前缀，用于避免与其他特效重名。

-- 调参入口：距离/高度为游戏世界单位，时间为秒，比例为无量纲。
-- fall/drift 的速度与加速度传给原生 VFX，不直接按世界单位/秒理解。
-- 成对的 min/max 应满足 0 <= min <= max；另有正值要求的字段见各项注释。
local CONFIG = {
    -- 移动尾迹：粒子沿人物行进方向的后方生成。
    spacing = 0.10,          -- 每移动多少距离生成一颗；必须 > 0，越小尾迹越密。
    behind = 0.25,           -- 出生点相对采样位置的后移距离；越大越靠人物身后。
    half_width = 0.50,       -- 身后椭圆出生区的横向半宽；越大越散，减少画面上下移动时挤成细线。
    trail_half_length = 0.60, -- 椭圆出生区的前后半长；越大越错落，设为 <= behind 可保持出生点在采样位置后方。

    -- 出生高度随机范围和寿命：两种发射方式共用；静止额外叠加 idle_base_height。
    min_height = 1.05,       -- 出生高度随机范围下限，相对世界地面 y=0；越小越贴地。
    max_height = 2.40,       -- 出生高度随机范围上限；越大越可能在人物较高处出现。
    min_lifetime = 1.20,     -- 随机寿命下限（秒）；近地预测可将实际寿命截得更短。
    max_lifetime = 1.70,     -- 随机寿命上限（秒，必须 > 0）；也用于原生粒子池预分配。

    -- 外观：两组共用贴图，区别在固定大小和是否开启泛光。
    star_chance = 0.30,      -- 生成大星点的概率，范围 0~1；0.30 即约 30%，其余为小星点。
    dot_scale = 0.35,        -- 小星点固定缩放值；越大显示越大，不随寿命缩小。
    star_scale = 0.54,       -- 大星点固定缩放值；越大显示越大，不随寿命缩小。
    star_bloom = true,       -- true 开启大星点 Bloom 泛光，false 关闭；小星点始终关闭。

    -- 下落和近地回收：速度/加速度取非负值，代码自动施加负 Y 方向。
    min_fall_speed = 0.002,  -- 向下初速度随机范围下限（原生 VFX 单位）；越大起步下落越快。
    max_fall_speed = 0.004,  -- 向下初速度随机范围上限（原生 VFX 单位）；越大最快初速越高。
    fall_acceleration = 0.04, -- 向下加速度大小（原生 VFX 单位）；越大后段下落越快，0 为匀速。
    ground_kill_height = 0.10, -- 粒子中心相对 y=0 的近地预测阈值；越大越早回收，实机高度待确认。

    -- 水平飘动：每颗独立初速度，叠加两组各自的周期风场。
    drift_speed = 0.003,     -- X/Z 初速度分别在 ±此值内随机（原生 VFX 单位）；越大初始散开越快。
    drift_acceleration = 0.008, -- 水平风加速度幅度（原生 VFX 单位）；越大摆动越强，0 关闭风力。
    drift_period = 2.4,      -- X 风力周期（秒，必须 > 0）；Z 周期为此值/0.83，越大换向越舒缓。

    -- 渐隐：以近地截短后的实际寿命为基准。
    fade_start = 0.15,       -- 开始渐隐的寿命比例，建议 0 < 值 < 1；越大保持亮度越久。

    -- 静止发射：各轨独立抽取间隔，共用环带、基础高度、寿命和外观。
    idle_base_height = 1.00, -- 静止粒子的额外基础高度（世界单位）；实际高度为此值 + min_height~max_height，0 保持原高度。
    idle_delay = 0.20,       -- 检测到静止后的等待秒数；首次发射还会加上各轨随机间隔。
    idle_tracks = 3,         -- 并行轨道数（非负整数）；越多总体越密，0 关闭静止发射。
    idle_min_interval = 0.080, -- 各轨随机发射间隔下限（秒，必须 > 0）；越小越可能连续密集出现。
    idle_max_interval = 0.120, -- 各轨随机发射间隔上限（秒）；越大单轨可能等待越久。
    idle_min_radius = 1.00,  -- 静止出生环带的内半径；越大越远离人物中心，0 允许从中心生成。
    idle_max_radius = 1.50,  -- 静止出生环带的外半径；越大分布范围越广。

    -- 位移采样：部分过滤已在下方注释；此处只说明现状，不重新启用过滤。
    max_sample_gap = 0.25,   -- 预留的最大采样间隔（秒）；对应异常采样过滤已注释，当前不生效。
    max_segment = 3.0,       -- 预留的单次位移上限；过滤已注释，但仍用于粒子池预分配，越大容量越大。
    max_speed = 45,          -- 预留的异常移动速度阈值（世界单位/秒）；对应过滤已注释，当前不生效。
    min_step = 0.005,        -- 单次采样位移小于此值视为静止；必须 > 0，越大越容易进入静止模式。
    max_ground_height = 0.15, -- 预留的人物离地高度容差 ±此值；对应过滤已注释，与粒子近地回收无关。
}

local assets = { Asset("IMAGE", TEXTURE), Asset("SHADER", SHADER) }
local prefabs = { "sora_foot_star_fx" }
local sqrt, floor, ceil, random = math.sqrt, math.floor, math.ceil, math.random
TEXTURE = softresolvefilepath(TEXTURE)

local function Colour(r, g, b, a)
    return { r / 255, g / 255, b / 255, a / 255 }
end

local function InitEnvelopes()
    EnvelopeManager:AddColourEnvelope(PREFIX .. "colour", {
        -- 固定色调，仅让透明度随寿命降低，不再反复闪亮。
        { 0,                 Colour(255, 248, 220, 255) },
        { CONFIG.fade_start, Colour(255, 248, 220, 255) },
        { 1,                 Colour(255, 248, 220, 0) },
    })

    for index = 0, 1 do
        local scale = index == 0 and CONFIG.dot_scale or CONFIG.star_scale
        EnvelopeManager:AddVector2Envelope(PREFIX .. "scale" .. index, {
            { 0, { scale, scale } },
            { 1, { scale, scale } },
        })
    end
    InitEnvelopes = nil
end

local function OnParticleFXRemoved(inst)
    local controller = inst._controller
    if controller ~= nil and controller._localfx == inst then
        controller._localfx = nil
    end
    inst._controller = nil
end

local function HasState(owner, tag)
    return owner:HasTag(tag)
        or (owner.sg ~= nil and owner.sg:HasStateTag(tag))
end

local BLOCKED_STATES = {
    "playerghost", "dead", "invisible", "jumping", "falling",
    "teleporting", "knockback", "drowning", "sleeping",
}

local function CanEmit(owner)
    -- if owner:IsInLimbo() or owner:IsAsleep() or not owner.entity:IsVisible() then
    --     print("sora_foot_star: owner is limbo, asleep, or invisible")
    --     return false
    -- end
    -- for _, tag in ipairs(BLOCKED_STATES) do
    --     if HasState(owner, tag) then
    --         print("sora_foot_star: owner is in blocked state " .. tag)
    --         return false
    --     end
    -- end
    -- if not HasState(owner, "moving") then
    --     print("sora_foot_star: owner is not moving")
    --     return false
    -- end

    -- local replica = owner.replica
    -- if replica ~= nil then
    --     if replica.health ~= nil and replica.health:IsDead() then
    --         print("sora_foot_star: owner is dead")
    --         return false
    --     end
    --     if replica.rider ~= nil and replica.rider:IsRiding() then
    --         print("sora_foot_star: owner is riding")
    --         return false
    --     end
    -- end

    -- -- 首版不在移动平台上发射，避免船体位移产生假尾迹。
    -- if owner:GetCurrentPlatform() ~= nil then
    --     print("sora_foot_star: owner is on a platform")
    --     return false
    -- end
    return true
end

local function ResetMotion(inst, owner, x, z, now)
    inst._sample_owner = owner
    inst._last_x, inst._last_z, inst._last_time = x, z, now
    inst._distance = 0
    inst._idle_since, inst._idle_next_times = nil, nil
end

local function GetGroundLimitedLifetime(height, fall_speed, lifetime)
    local clearance = height - CONFIG.ground_kill_height
    if clearance <= 0 then
        return 0
    end

    -- 原生粒子不提供逐颗高度回调，在出生时预测接近地面的时刻。
    -- 按速度每 tick 位移、加速度每秒累加的模型估算；实际引擎积分需实机确认。
    local tick_time = TheSim:GetTickTime()
    local speed = math.max(0, fall_speed) / tick_time
    local acceleration = math.max(0, CONFIG.fall_acceleration) / tick_time
    local ground_time
    if acceleration > 0 then
        -- 稳定形式，避免 sqrt(...) - speed 在低加速度时的相消误差。
        ground_time = 2 * clearance
            / (speed + sqrt(speed * speed + 2 * acceleration * clearance))
    elseif speed > 0 then
        ground_time = clearance / speed
    else
        return lifetime
    end

    -- 向下取整后再提前一个 tick，预留离散积分/渲染步进的余量。
    local safe_time = math.max(0, floor(ground_time / tick_time) - 1) * tick_time
    return math.min(lifetime, safe_time)
end

local function EmitParticle(inst, px, pz, base_height)
    local py = (base_height or 0) + CONFIG.min_height
        + random() * (CONFIG.max_height - CONFIG.min_height)
    local ox, oy, oz = inst.Transform:GetWorldPosition()
    local lifetime = CONFIG.min_lifetime + random() * (CONFIG.max_lifetime - CONFIG.min_lifetime)
    local index = random() < CONFIG.star_chance and 1 or 0

    -- 发射点转为载体的相对坐标；SetFollowEmitter(false) 让旧粒子留在世界中。
    -- 每颗粒子的到期回收由原生 VFX 管理，不在 Lua 中保留粒子或过期队列。
    local fall_speed = CONFIG.min_fall_speed
        + random() * (CONFIG.max_fall_speed - CONFIG.min_fall_speed)
    lifetime = GetGroundLimitedLifetime(py, fall_speed, lifetime)
    if lifetime <= 0 then
        return -- 已在近地区间，或下一 tick 就会进入：不生成地面闪点。
    end
    inst.VFXEffect:AddParticleUV(
        index, lifetime,
        px - ox, py - oy, pz - oz,
        (random() * 2 - 1) * CONFIG.drift_speed,
        -fall_speed,
        (random() * 2 - 1) * CONFIG.drift_speed,
        random(0, 3) * 0.25, 0
    )
end

local function EmitTrailParticle(inst, x, z, dx, dz)
    -- 在地面 XZ 平面按面积均匀抽取椭圆内的位置，高度 Y 仍由 EmitParticle 独立随机。
    -- 加宽横向并打散前后位置，避免沿视线方向移动时只剩下一条很窄的竖线。
    local angle = random() * 2 * math.pi
    local radius = sqrt(random())
    local lateral = math.cos(angle) * radius * CONFIG.half_width
    local longitudinal = math.sin(angle) * radius * CONFIG.trail_half_length
    EmitParticle(inst,
        x - dx * CONFIG.behind + dx * longitudinal - dz * lateral,
        z - dz * CONFIG.behind + dz * longitudinal + dx * lateral)
end

local function RandomIdleInterval()
    return CONFIG.idle_min_interval
        + random() * (CONFIG.idle_max_interval - CONFIG.idle_min_interval)
end

local function UpdateIdleParticles(inst, x, z, now)
    local next_times = inst._idle_next_times
    if next_times == nil then
        inst._idle_since = now
        next_times = {}
        for track = 1, CONFIG.idle_tracks do
            -- 首次也各自随机，避免三条轨道在停步后同时起闪。
            next_times[track] = now + CONFIG.idle_delay + RandomIdleInterval()
        end
        inst._idle_next_times = next_times
    end

    for track = 1, CONFIG.idle_tracks do
        if now >= next_times[track] then
            -- 共用位置和外观参数，每颗仍独立随机，不给轨道分配固定方位。
            local angle = random() * 2 * math.pi
            local radius = sqrt(CONFIG.idle_min_radius ^ 2
                + random() * (CONFIG.idle_max_radius ^ 2 - CONFIG.idle_min_radius ^ 2))
            EmitParticle(inst, x + math.cos(angle) * radius, z + math.sin(angle) * radius,
                CONFIG.idle_base_height)
            -- 只更新当前轨道；卡顿后从当前时间重新排期，不集中补发积压。
            next_times[track] = now + RandomIdleInterval()
        end
    end
end

local function UpdateDrift(inst, now)
    -- 参考原版 pollen 的动态加速度；不移动载体来拖拽已经生成的星点。
    -- 两组各有随机相位，每颗还带独立水平初速度，避免整齐地一同摆动。
    local phase = now * 2 * math.pi / CONFIG.drift_period
    for index = 0, 1 do
        local t = phase + inst._drift_phases[index]
        inst.VFXEffect:SetAcceleration(index,
            math.sin(t) * CONFIG.drift_acceleration,
            -CONFIG.fall_acceleration,
            math.sin(t * 0.83 + 1.7) * CONFIG.drift_acceleration)
    end
end

local function UpdateParticles(inst)
    local now = GetTime()
    local controller = inst._controller
    if controller == nil or not controller:IsValid() then
        --print("sora_foot_star: controller is nil or invalid")
        inst:Remove()
        return
    end
    UpdateDrift(inst, now)

    -- owner 是服务端 Lua 字段，不能据此判断客户端的挂载目标。
    local owner = controller.entity:GetParent()
    if owner == nil or not owner:IsValid() then
        --print("sora_foot_star: owner is nil or invalid")
        ResetMotion(inst, nil, nil, nil, now)
        return
    end
    local x, y, z = owner.Transform:GetWorldPosition()
    inst.Transform:SetPosition(x, 0, z) -- 本地载体不设父对象，不继承人物旋转。

    -- if not CanEmit(owner) or y > CONFIG.max_ground_height or y < -CONFIG.max_ground_height then
    --     print("sora_foot_star: owner emit condition not met")
    --     ResetMotion(inst, nil, nil, nil, now)
    --     return
    -- end
    if inst._sample_owner ~= owner or inst._last_x == nil then
        --print("sora_foot_star: owner changed or last_x is nil")
        ResetMotion(inst, owner, x, z, now)
        return
    end

    local dt = now - inst._last_time
    local dx, dz = x - inst._last_x, z - inst._last_z
    local distance = sqrt(dx * dx + dz * dz)
    local previous_x, previous_z = inst._last_x, inst._last_z
    inst._last_x, inst._last_z, inst._last_time = x, z, now

    -- 不把传送、休眠恢复或卡顿后的大跨度位移补画成星线。
    -- if dt <= 0 or dt > CONFIG.max_sample_gap or distance > CONFIG.max_segment
    --     or distance > CONFIG.max_speed * dt + 0.15 then
    --         print("sora_foot_star: distance > max.max_segment or max_speed * dt + 0.15")
    --     ResetMotion(inst, owner, x, z, now)
    --     return
    -- end
    -- 按实际位移切换模式，静止时不归一化零向量，也不依赖 moving 标签。
    if distance < CONFIG.min_step then
        inst._distance = 0
        UpdateIdleParticles(inst, x, z, now)
        return
    end
    inst._idle_since, inst._idle_next_times = nil, nil

    local carry = inst._distance
    local count = floor((carry + distance) / CONFIG.spacing)
    inst._distance = (carry + distance) % CONFIG.spacing
    dx, dz = dx / distance, dz / distance

    for index = 1, count do
        local offset = CONFIG.spacing - carry + (index - 1) * CONFIG.spacing
        --print("sora_foot_star: offset = " .. offset)
        EmitTrailParticle(inst, previous_x + dx * offset, previous_z + dz * offset, dx, dz)
    end
end

local function ParticleFXFn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:SetCanSleep(false)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.persists = false

    -- 该 prefab 仅由有画面的客户端本地创建；误在专服生成时自动清理。
    if TheNet:IsDedicated() then
        inst:DoTaskInTime(0, inst.Remove)
        return inst
    end
    if InitEnvelopes ~= nil then
        InitEnvelopes()
    end

    local effect = inst.entity:AddVFXEffect()
    effect:InitEmitters(2)
    inst._drift_phases = { [0] = random() * 2 * math.pi, [1] = random() * 2 * math.pi }
    -- 引擎渲染池仍需有限容量；按有效采样跨度、粒子寿命和更新间隔预分配。
    -- 两个 emitter 各自按最坏分布准备，不作为角色配额或共享发射预算。
    local tick_time = TheSim:GetTickTime()
    local emitter_capacity = (ceil(CONFIG.max_segment / CONFIG.spacing) + 1)
        * (ceil(CONFIG.max_lifetime / tick_time) + 1)
        + CONFIG.idle_tracks * (ceil(CONFIG.max_lifetime / CONFIG.idle_min_interval) + 1)
    for index = 0, 1 do
        effect:SetRenderResources(index, TEXTURE, SHADER)
        effect:SetRotationStatus(index, false)
        effect:SetUVFrameSize(index, 0.25, 1)
        effect:SetMaxNumParticles(index, emitter_capacity)
        effect:SetMaxLifetime(index, CONFIG.max_lifetime)
        effect:SetColourEnvelope(index, PREFIX .. "colour")
        effect:SetScaleEnvelope(index, PREFIX .. "scale" .. index)
        effect:SetBlendMode(index, BLENDMODE.Additive)
        effect:EnableBloomPass(index, index == 1 and CONFIG.star_bloom)
        effect:SetSortOrder(index, 0)
        effect:SetSortOffset(index, 0)
        effect:SetGroundPhysics(index, true)
        effect:SetAcceleration(index, 0, -CONFIG.fall_acceleration, 0)
        effect:SetFollowEmitter(index, false)
        effect:SetKillOnEntityDeath(index, true)
    end
    UpdateDrift(inst, GetTime())
    effect:SetRadius(0, 3)
    inst._distance = 0
    inst:ListenForEvent("onremove", OnParticleFXRemoved)
    -- nil 表示发射器不定时结束；实体移除时 EmitterManager 自动注销回调。
    EmitterManager:AddEmitter(inst, nil, function() UpdateParticles(inst) end)
    return inst
end

local function RemoveLocalFX(inst)
    if inst._localfx ~= nil and inst._localfx:IsValid() then
        inst._localfx:Remove()
    end
    inst._localfx = nil
end

local function ControllerFn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.entity:SetPristine()
    inst.persists = false
    if not TheNet:IsDedicated() then
        inst:ListenForEvent("onremove", RemoveLocalFX)
        inst:DoTaskInTime(0, function()
            if inst:IsValid() then
                local fx = SpawnPrefab("sora_foot_star_fx")
                if fx ~= nil then
                    fx._controller = inst
                    inst._localfx = fx
                end
            end
        end)
    end
    return inst
end

return Prefab("sora_foot_star", ControllerFn, nil, prefabs),
    Prefab("sora_foot_star_fx", ParticleFXFn, assets)
