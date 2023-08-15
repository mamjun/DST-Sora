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
]] local assets = {Asset("ANIM", "anim/lavaarena_firestaff_meteor.zip")}

local assets_splash = {Asset("ANIM", "anim/lavaarena_fire_fx.zip")}

local prefabs = {"sorameteor_splash", "sorameteor_splashhit"}

local prefabs_splash = {"sorameteor_splashbase"}

local range = 4

--[[local function CalcDamage(centerpos, target)
	local perc = (range - distsq(centerpos, target:GetPosition()))/range
	local max_dmg = TUNING.FORGE.INFERNALSTAFF.ALT_DAMAGE.maximum
	local min_dmg = TUNING.FORGE.INFERNALSTAFF.ALT_DAMAGE.minimum
	return min_dmg + (max_dmg - min_dmg)*perc
end]]

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_firestaff_meteor")
    inst.AnimState:SetBuild("lavaarena_firestaff_meteor")
    -- inst.AnimState:SetAddColour(0,0,1,0)
    inst.AnimState:PlayAnimation("crash")
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("notarget")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- inst.range = 4
    inst.AttackArea = function(inst, attacker, weapon, pos, att)
        weapon.meteor = inst
        inst.attacker = attacker
        inst.att = att
        inst.owner = weapon
        inst.Transform:SetPosition(pos:Get())
    end

    inst:ListenForEvent("animover", function(inst)
        inst:DoTaskInTime(FRAMES * 3, function(inst)
            SpawnPrefab("sorameteor_splash"):SetPosition(inst:GetPosition())
            local found_mobs = {}
            local x, y, z = inst:GetPosition():Get()
            local ents = TheSim:FindEntities(x, y, z, range, nil, {"player", "companion", "wall", "sora2lm"})
            for _, ent in ipairs(ents) do
                if inst.attacker ~= nil and ent ~= inst.attacker and ent.entity:IsValid() and ent.entity:IsVisible() and
                    ent.components.health and not ent.components.health:IsDead() then
                    -- ent.components.combat:GetAttacked(inst.attacker,att,inst)
                    if ent.components.combat then

                        ent.components.combat:GetAttacked(inst.attacker, inst.att, inst.owner or inst)
                        -- ent.components.health:DoDelta(inst.att, nil, "NIL", nil, inst.attacker, true)
                    end
                end
            end

            local ents = TheSim:FindEntities(x, y, z, range + 2, {"murderable"},nil,{"weighable_fish","pondfish"})
            for _, ent in ipairs(ents) do
                if inst.attacker ~= nil and ent ~= inst.attacker and ent.entity:IsValid() and ent.entity:IsVisible() and
                    ent.components.lootdropper then
                    ent.components.lootdropper:DropLoot()
                    ent:Remove()
                end
            end

            inst:Remove()
        end)
    end)
    inst.persists = false
    return inst
end

local function splashfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_fire_fx")
    inst.AnimState:SetBuild("lavaarena_fire_fx")
    inst.AnimState:PlayAnimation("firestaff_ult")
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetFinalOffset(1)
    -- inst.AnimState:SetAddColour(0,0,1,0)
    -- inst.AnimState:SetMultColour(100/255,100/255,1,100/255)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.SetPosition = function(inst, pos)
        inst.SoundEmitter:PlaySound("dontstarve/impacts/lava_arena/meteor_strike")
        inst.Transform:SetPosition(pos:Get())
        SpawnPrefab("sorameteor_splashbase"):SetPosition(pos)
    end

    inst:ListenForEvent("animover", inst.Remove)
    inst.persists = false
    return inst
end

local function splashbasefn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_fire_fx")
    inst.AnimState:SetBuild("lavaarena_fire_fx")
    inst.AnimState:PlayAnimation("firestaff_ult_projection")
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
    -- inst.AnimState:SetAddColour(0,0,1,0)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.SetPosition = function(inst, pos)
        inst.Transform:SetPosition(pos:Get())
    end

    inst:ListenForEvent("animover", inst.Remove)
    inst.persists = false
    return inst
end

local function splashhitfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_fire_fx")
    inst.AnimState:SetBuild("lavaarena_fire_fx")
    inst.AnimState:PlayAnimation("firestaff_ult_hit")
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetFinalOffset(1)

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.SetTarget = function(inst, target)
        inst.Transform:SetPosition(target:GetPosition():Get())
        local scale = target:HasTag("minion") and .5 or (target:HasTag("largecreature") and 1.3 or .8)
        inst.AnimState:SetScale(scale, scale)
    end

    inst:ListenForEvent("animover", inst.Remove)
    inst.persists = false
    return inst
end

return Prefab("sorameteor", fn, assets, prefabs), Prefab("sorameteor_splash", splashfn, assets_splash, prefabs_splash),
    Prefab("sorameteor_splashbase", splashbasefn, assets_splash),
    Prefab("sorameteor_splashhit", splashhitfn, assets_splash)
