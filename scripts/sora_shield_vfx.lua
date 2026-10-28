-- sora_shield_fx 的金色棱面护罩与彩虹星辉；不处理护盾回复、消耗或伤害抵挡。
local M = {}
local TEXTURE = "fx/sora_shield_palette.tex"
local SHADER = "shaders/vfx_particle_add.ksh"
local PREFIX = "sora_shield_shader_"
M.assets = { Asset("IMAGE", TEXTURE), Asset("SHADER", SHADER) }
-- Mod 图集必须用资源注册后的真实路径；着色器直接复用游戏内置资源。
TEXTURE = resolvefilepath(TEXTURE)
M.prefabs = { "sora_shield_dome_localfx", "sora_shield_orbit_localfx" }

-- 两档仅控制外围星辉轨道；中间共用围住身体的金色棱面护罩。
local DEFAULT_STYLE = "overhead"
local STYLES = {
    overhead = {
        orbit_radius = 1.782,   -- 星辉中心绕行半径，在当前基础上增加 10%。
        orbit_height = 2.35,    -- 星辉中心高度。
        shield_width = 0.46,   -- 星芒宽度；保留原参数名。
        shield_height = 0.58,  -- 星芒高度。
    },
    upper_body = {
        orbit_radius = 2.442,   -- 在当前基础上增加 10%。
        orbit_height = 1.35,
        shield_width = 0.56,
        shield_height = 0.72,
    },
}
local CONFIG = {
    shell_radius = 1.512,  -- 六角棱面外接圆半径，在 1.26 基础上再放大 20%。
    shell_base = 0.35,     -- 相对脚底的下缘高度。
    shell_height = 3.24,   -- 护罩高度，在 2.70 基础上再放大 20%；上下开口。
    shell_period = 10.0,   -- 中间护罩绕人物竖轴转一圈的秒数，必须大于 0。
    orbit_period = 5.0,     -- 绕一圈的秒数，必须大于 0。
    rainbow_period = 14.0,  -- 七彩渐变循环秒数；每枚星辉起始色独立随机。
    orbit_bob = 0.06,       -- 绕行时上下浮动幅度。
    refresh_interval = 1 / 15, -- 重绘粒子轮廓的间隔；移动载体仍每 tick 跟随人物。
    particle_lifetime = 0.14, -- 与重绘批次重叠，恢复此前明亮的连续轮廓。
    edge_scale = 0.36,      -- 已知效果良好的星芒轮廓点尺寸。
    surface_scale = 0.48,   -- 已知效果良好的星芒内部柔光尺寸。
    shell_edge_scale = 0.24,
    shell_surface_scale = 0.85,
    shell_rune_scale = 0.32,
    bloom = true,           -- 星芒及护罩线条恢复此前泛光；护罩面单独关闭。
    summer_no_bloom = true, -- 夏季暖色滤镜下关闭泛光，避免低分辨率 Bloom 进一步发糊。
}

-- 固定图集保存预乘的颜色及透明度，原生着色器直接采样，不增加颜色包络。
-- 每段 256 档，共 1792 档；图集 64 列，边缘/填充各一组，末尾三格为护罩。
local RAINBOW_STEPS = 256
local RAINBOW_COUNT = 7 * RAINBOW_STEPS
local ATLAS_COLUMNS = 64
local ATLAS_FRAME = 1 / ATLAS_COLUMNS
local STAR_SCALES = { PREFIX .. "scale_star_edge", PREFIX .. "scale_star_surface" }
local SHELL_SCALES = {
    PREFIX .. "scale_shell_edge",
    PREFIX .. "scale_shell_surface",
    PREFIX .. "scale_shell_rune",
}

local sin, cos, floor, ceil = math.sin, math.cos, math.floor, math.ceil
local PI2 = 2 * math.pi
local shield_points, shell_points
local function Point(points, x, y, z, emitter)
    points[#points + 1] = { x, y, z, emitter or 0 }
end

local function BuildPoints()
    shield_points = {}
    shell_points = {}

    -- 六片独立平面构成开口棱柱；软光点铺面，避免旧版半球网格外观。
    for face = 0, 5 do
        local a, b = PI2 * face / 6, PI2 * (face + 1) / 6
        local ax, az, bx, bz = cos(a), sin(a), cos(b), sin(b)
        local function PanelPoint(u, v, emitter)
            Point(shell_points, (ax + (bx - ax) * u) * CONFIG.shell_radius,
                CONFIG.shell_base + v * CONFIG.shell_height,
                (az + (bz - az) * u) * CONFIG.shell_radius, emitter)
        end
        local function Line(u1, v1, u2, v2, steps, emitter)
            for step = 0, steps do
                local t = step / steps
                PanelPoint(u1 + (u2 - u1) * t, v1 + (v2 - v1) * t, emitter)
            end
        end
        -- 淡色棱面，上下削角，留出人物轮廓；不是不透明金墙。
        for row = 1, 19 do
            local v = row / 20
            local inset = (v < 0.15 or v > 0.85) and 0.19 or 0.09
            for col = 0, 8 do
                PanelPoint(inset + (1 - 2 * inset) * col / 8, v, 1)
            end
        end
        -- 竖向断续亮边和上下短斜角，不封顶、不围成网格。
        for _, u in ipairs({ 0.09, 0.91 }) do
            Line(u, 0.17, u, 0.43, 12, 0)
            Line(u, 0.55, u, 0.83, 12, 0)
            local inner = u < 0.5 and 0.23 or 0.77
            Line(inner, 0.07, u, 0.17, 6, 2)
            Line(u, 0.83, inner, 0.93, 6, 2)
        end
        -- 中间菱形符纹与两段折线，借用参考图的金色几何语言。
        Line(0.5, 0.64, 0.65, 0.5, 8, 2)
        Line(0.65, 0.5, 0.5, 0.36, 8, 2)
        Line(0.5, 0.36, 0.35, 0.5, 8, 2)
        Line(0.35, 0.5, 0.5, 0.64, 8, 2)
        Line(0.32, 0.77, 0.43, 0.72, 5, 2)
        Line(0.57, 0.28, 0.68, 0.23, 5, 2)
    end

    -- 四角星芒：尖端收束，中心饱满，替代原盾牌轮廓和盾面十字。
    local vertices = {
        { 0, 0.5 }, { 0.11, 0.11 }, { 0.5, 0 }, { 0.11, -0.11 },
        { 0, -0.5 }, { -0.11, -0.11 }, { -0.5, 0 }, { -0.11, 0.11 },
    }
    for index, a in ipairs(vertices) do
        local b = vertices[index % #vertices + 1]
        for step = 0, 7 do
            local t = step / 8
            Point(shield_points, a[1] + (b[1] - a[1]) * t,
                a[2] + (b[2] - a[2]) * t, 0)
        end
    end
    -- 中央亮芯连接四束星光，避免只剩空心轮廓。
    for step = -5, 5 do
        Point(shield_points, 0, step * 0.06, 0)
        if step ~= 0 then Point(shield_points, step * 0.06, 0, 0) end
    end
    -- 内缩光晕连接星芒中心与外缘，恢复此前饱满的星形。
    for _, vertex in ipairs(vertices) do
        for step = 1, 3 do
            Point(shield_points, vertex[1] * step / 4, vertex[2] * step / 4, 0, 1)
        end
    end
end

local function InitEnvelopes()
    -- 所有人物和发射器共用六份包络：一份淡出、两组星芒尺度和三组护罩尺度。
    EnvelopeManager:AddColourEnvelope(PREFIX .. "fade", {
        { 0, { 1, 1, 1, 1 } }, { 0.85, { 1, 1, 1, 1 } }, { 1, { 1, 1, 1, 0 } },
    })
    local function AddScale(name, scale)
        EnvelopeManager:AddVector2Envelope(name, {
            { 0, { scale, scale } }, { 1, { scale, scale } },
        })
    end
    AddScale(STAR_SCALES[1], CONFIG.edge_scale)
    AddScale(STAR_SCALES[2], CONFIG.surface_scale)
    AddScale(SHELL_SCALES[1], CONFIG.shell_edge_scale)
    AddScale(SHELL_SCALES[2], CONFIG.shell_surface_scale)
    AddScale(SHELL_SCALES[3], CONFIG.shell_rune_scale)
    BuildPoints()
    print("[SoraShieldVFX] revision=native-palette-v10-orbit110; registered envelopes=6; shader=" .. SHADER .. "; texture=" .. TEXTURE)
    InitEnvelopes = nil
end

local function IsSummerNoBloom()
    return CONFIG.summer_no_bloom
        and TheWorld ~= nil
        and TheWorld.state ~= nil
        and TheWorld.state.issummer == true
end

-- 仅作为 Prefab 构造函数调用；返回后必须经过原生 SpawnPrefab 的初始化。
-- 不能在 UpdateLocal 中直接调用 CreateEntity + AddVFXEffect：原生渲染节点尚未建立。
local function CreateCarrier(kind)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:SetCanSleep(false)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.persists = false
    if TheNet:IsDedicated() then return inst end
    if InitEnvelopes ~= nil then InitEnvelopes() end
    local is_shell = kind == "dome" -- 沿用本地 prefab 名称，实际几何已改成六角棱面。
    local summer_no_bloom = IsSummerNoBloom()
    inst._shield_summer_no_bloom = summer_no_bloom
    if not is_shell then
        inst._rainbow_offset = (math.random(7) - 1) * RAINBOW_STEPS
        inst._rainbow_started = GetTime()
    end
    local points = is_shell and shell_points or shield_points
    local emitter_count = is_shell and 3 or 2
    local effect = inst.entity:AddVFXEffect()
    effect:InitEmitters(emitter_count)
    local batches = ceil(CONFIG.particle_lifetime / CONFIG.refresh_interval) + 1
    for emitter = 0, emitter_count - 1 do
        local scale = is_shell and SHELL_SCALES[emitter + 1] or STAR_SCALES[emitter + 1]
        effect:SetRenderResources(emitter, TEXTURE, SHADER)
        effect:SetUVFrameSize(emitter, ATLAS_FRAME, ATLAS_FRAME)
        effect:SetRotationStatus(emitter, false)
        local point_count = 0
        for _, point in ipairs(points) do
            if point[4] == emitter then point_count = point_count + 1 end
        end
        effect:SetMaxNumParticles(emitter, point_count * batches)
        effect:SetMaxLifetime(emitter, CONFIG.particle_lifetime)
        effect:SetColourEnvelope(emitter, PREFIX .. "fade")
        effect:SetScaleEnvelope(emitter, scale)
        -- 恢复此前用户认可的大号加色星芒和金色护罩；护罩面单独关闭 Bloom。
        effect:SetBlendMode(emitter, BLENDMODE.Additive)
        effect:EnableBloomPass(emitter,
            CONFIG.bloom and not summer_no_bloom and (not is_shell or emitter ~= 1))
        effect:SetSortOrder(emitter, 0)
        effect:SetSortOffset(emitter, 0)
        effect:SetFollowEmitter(emitter, true)
        effect:SetKillOnEntityDeath(emitter, true)
        effect:SetAcceleration(emitter, 0, 0, 0)
        effect:SetRadius(emitter, is_shell and 4.32 or 2)
    end
    return inst
end

function M.DomeFn()
    return CreateCarrier("dome")
end

function M.OrbitFn()
    return CreateCarrier("shield")
end

local function RemoveCarrier(carrier)
    if carrier ~= nil and carrier:IsValid() then carrier:Remove() end
end

local function ClearLocal(inst)
    local visual = inst._shield_visual
    inst._shield_visual = nil
    if visual ~= nil then
        for _, shield in pairs(visual.shields) do RemoveCarrier(shield) end
        RemoveCarrier(visual.dome)
    end
end

local function EmitShield(carrier, style, now)
    local elapsed = (now - carrier._rainbow_started) % CONFIG.rainbow_period
    local step = (carrier._rainbow_offset
        + floor(elapsed * RAINBOW_COUNT / CONFIG.rainbow_period)) % RAINBOW_COUNT
    -- 星辉中心在三维轨道上移动；星芒朝向镜头，绕到侧面也可辨认。
    local right = TheCamera:GetRightVec()
    for _, point in ipairs(shield_points) do
        local horizontal = point[1] * style.shield_width
        local tile = point[4] * RAINBOW_COUNT + step
        carrier.VFXEffect:AddParticleUV(point[4], CONFIG.particle_lifetime,
            right.x * horizontal, point[2] * style.shield_height,
            right.z * horizontal, 0, 0, 0,
            (tile % ATLAS_COLUMNS) * ATLAS_FRAME, floor(tile / ATLAS_COLUMNS) * ATLAS_FRAME)
    end
end

local function EmitShell(carrier, now)
    -- 各面及符纹使用同一旋转矩阵，保持棱面整体形状；高度不变。
    local angle = (now % CONFIG.shell_period) * PI2 / CONFIG.shell_period
    local c, s = cos(angle), sin(angle)
    for _, point in ipairs(shell_points) do
        local tile = RAINBOW_COUNT * 2 + point[4]
        carrier.VFXEffect:AddParticleUV(point[4], CONFIG.particle_lifetime,
            point[1] * c - point[3] * s, point[2],
            point[1] * s + point[3] * c, 0, 0, 0,
            (tile % ATLAS_COLUMNS) * ATLAS_FRAME, floor(tile / ATLAS_COLUMNS) * ATLAS_FRAME)
    end
end

local function UpdateLocal(inst)
    local state = inst._shield_state:value()
    local owner = inst.entity:GetParent()
    if state == 0 or owner == nil or not owner:IsValid()
        or owner:IsInLimbo() or not owner.entity:IsVisible() then
        ClearLocal(inst)
        return
    end
    if InitEnvelopes ~= nil then InitEnvelopes() end
    local style_name = inst._shield_upper_body:value() and "upper_body" or "overhead"
    local style = STYLES[style_name]
    local visual = inst._shield_visual
    local summer_no_bloom = IsSummerNoBloom()
    if visual ~= nil and visual.style_name ~= style_name then
        -- 切换前删除旧轮廓，避免大小两版在短寿命内重叠。
        ClearLocal(inst)
        visual = nil
    end
    if visual ~= nil and visual.summer_no_bloom ~= summer_no_bloom then
        -- 季节变化后重建本地载体，让 Bloom 设置立即切换；战斗状态和层数不受影响。
        ClearLocal(inst)
        visual = nil
    end
    if visual == nil then
        visual = { dome = SpawnPrefab("sora_shield_dome_localfx"), shields = {}, next_emit = 0,
            style_name = style_name, summer_no_bloom = summer_no_bloom }
        inst._shield_visual = visual
        -- 仅有画面的客户端创建本地载体；控制器/人物删除时立即清除全部粒子。
        EmitterManager:AddEmitter(visual.dome, nil, function() UpdateLocal(inst) end)
    end
    local count = state - 1
    local now = GetTime()
    local orbit_angle = (now % CONFIG.orbit_period) * PI2 / CONFIG.orbit_period
    local angle_step = count > 0 and PI2 / count or 0
    local x, y, z = owner.Transform:GetWorldPosition()
    visual.dome.Transform:SetPosition(x, y, z)
    for index = 1, 6 do
        if index > count then
            RemoveCarrier(visual.shields[index])
            visual.shields[index] = nil
        else
            if visual.shields[index] == nil then
                visual.shields[index] = SpawnPrefab("sora_shield_orbit_localfx")
                visual.next_emit = 0
            end
            -- N 枚按 360/N 度均分圆周，数量改变当次重排；零层不计算除法。
            local angle = orbit_angle + angle_step * (index - 1)
            visual.shields[index].Transform:SetPosition(
                x + cos(angle) * style.orbit_radius,
                y + style.orbit_height + sin(angle * 2) * CONFIG.orbit_bob,
                z + sin(angle) * style.orbit_radius)
        end
    end
    if now >= visual.next_emit then
        EmitShell(visual.dome, now)
        for _, shield in pairs(visual.shields) do EmitShield(shield, style, now) end
        visual.next_emit = now + CONFIG.refresh_interval
    end
end

-- 在控制器 SetPristine 前调用；一个 3 位状态同时同步激活和数量。
-- 0=隐藏，1=激活但没有小盾牌，2..7=激活且有 1..6 面小盾牌。
function M.Init(inst)
    inst._shield_state = net_tinybyte(inst.GUID, "sora_shield_fx.state", "sorashielddirty")
    inst._shield_upper_body = net_bool(inst.GUID, "sora_shield_fx.upper_body", "sorashieldstyledirty")
    inst._shield_count = 0
    inst._shield_shown = false
    if TheWorld.ismastersim then
        inst._shield_state:set(0)
        inst._shield_upper_body:set(DEFAULT_STYLE == "upper_body")
    end
    if not TheNet:IsDedicated() then
        inst:ListenForEvent("sorashielddirty", UpdateLocal)
        inst:ListenForEvent("sorashieldstyledirty", UpdateLocal)
        inst:ListenForEvent("onremove", ClearLocal)
        -- 等待晚到的父实体，也负责人物重新显示/离开 limbo 后重建。
        inst:DoPeriodicTask(0.1, UpdateLocal)
    end
    local function PublishState(self)
        self._shield_state:set(self._shield_shown and self._shield_count + 1 or 0)
        if not TheNet:IsDedicated() then UpdateLocal(self) end
    end
    local old_show, old_hide = inst.Show, inst.Hide
    function inst:Show()
        old_show(self)
        self._shield_shown = true
        PublishState(self)
    end
    function inst:Hide()
        old_hide(self)
        self._shield_shown = false
        PublishState(self)
    end
    function inst:SetShieldCount(count)
        self._shield_count = math.max(0, math.min(6, floor(count)))
        PublishState(self)
    end
    -- 服务端实时切换同一个角色的方案，同步到所有客户端；不修改层数/激活时间。
    function inst:SetShieldStyle(name)
        if not TheWorld.ismastersim then return false, "server only" end
        if STYLES[name] == nil then return false, "unknown shield style" end
        self._shield_upper_body:set(name == "upper_body")
        if not TheNet:IsDedicated() then UpdateLocal(self) end
        return true
    end
end

return M
