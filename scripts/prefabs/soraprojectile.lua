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
]]
local assets_fireballhit =
{
    Asset("ANIM", "anim/fireball_2_fx.zip"),
    Asset("ANIM", "anim/deer_fire_charge.zip"),
}

--------------------------------------------------------------------------
local function OnHit_Fire(inst, owner, target)
	SpawnPrefab("sorafireball_hit_fx").Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst:Remove()
end
--------------------------------------------------------------------------
local function OnThrown(inst, owner, target)
	SpawnPrefab("fireball_cast_fx").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

--------------------------------------------------------------------------

local function CreateTail(bank, build, lightoverride, addcolour, multcolour)
    local inst = CreateEntity()

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    inst.Physics:ClearCollisionMask()

    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation("disappear")
    if addcolour ~= nil then
        inst.AnimState:SetAddColour(unpack(addcolour))
    end
    if multcolour ~= nil then
        inst.AnimState:SetMultColour(unpack(multcolour))
    end
    if lightoverride > 0 then
        inst.AnimState:SetLightOverride(lightoverride)
    end
    inst.AnimState:SetFinalOffset(-1)

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

local function OnUpdateProjectileTail(inst, bank, build, speed, lightoverride, addcolour, multcolour, hitfx, tails)
    local x, y, z = inst.Transform:GetWorldPosition()
    for tail, _ in pairs(tails) do
        tail:ForceFacePoint(x, y, z)
    end
    if inst.entity:IsVisible() then
        local tail = CreateTail(bank, build, lightoverride, addcolour, multcolour)
        local rot = inst.Transform:GetRotation()
        tail.Transform:SetRotation(rot)
        rot = rot * DEGREES
        local offsangle = math.random() * 2 * PI
        local offsradius = math.random() * .2 + .2
        local hoffset = math.cos(offsangle) * offsradius
        local voffset = math.sin(offsangle) * offsradius
        tail.Transform:SetPosition(x + math.sin(rot) * hoffset, y + voffset, z + math.cos(rot) * hoffset)
        tail.Physics:SetMotorVel(speed * (.2 + math.random() * .3), 0, 0)
        tails[tail] = true
        inst:ListenForEvent("onremove", function(tail) tails[tail] = nil end, tail)
        tail:ListenForEvent("onremove", function(inst)
            tail.Transform:SetRotation(tail.Transform:GetRotation() + math.random() * 30 - 15)
        end, inst)
    end
end

local function MakeProjectile(name, bank, build, speed, lightoverride, addcolour, multcolour, hitfx)
    local assets =
    {
        Asset("ANIM", "anim/"..build..".zip"),
    }

    local prefabs = hitfx ~= nil and { hitfx } or nil

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)
        RemovePhysicsColliders(inst)

        inst.AnimState:SetBank(bank)
        inst.AnimState:SetBuild(build)
        inst.AnimState:PlayAnimation("idle_loop", true)
        if addcolour ~= nil then
            inst.AnimState:SetMultColour(unpack(addcolour))
        end
        if multcolour ~= nil then
            inst.AnimState:SetMultColour(unpack(multcolour))
        end
        if lightoverride > 0 then
            inst.AnimState:SetLightOverride(lightoverride)
        end
        inst.AnimState:SetFinalOffset(-1)

        --projectile (from projectile component) added to pristine state for optimization
        inst:AddTag("projectile")

        if not TheNet:IsDedicated() then
            inst:DoPeriodicTask(0, OnUpdateProjectileTail, nil, bank, build, speed, lightoverride, addcolour, multcolour, hitfx, {})
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end
		
		inst.persists = false

        inst:AddComponent("projectile")
		inst.components.projectile:SetSpeed(speed)
		inst.components.projectile:SetHoming(true)
		inst.components.projectile:SetHitDist(0.5) --Leo: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		inst.components.projectile.onhit = function(inst, owner, target)
			SpawnPrefab(hitfx).Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst:Remove()
		end
		inst.components.projectile:SetOnMissFn(inst.Remove)
		inst.components.projectile:SetStimuli("fire")
		--inst.components.projectile:SetOnThrownFn(OnThrown)

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

--------------------------------------------------------------------------

local function fireballhit_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("fireball_fx")
    inst.AnimState:SetBuild("deer_fire_charge")
    inst.AnimState:PlayAnimation("blast")
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetLightOverride(1)
    inst.AnimState:SetFinalOffset(-1)

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.entity:SetPristine()
	
	inst.persists = false
	
	inst:ListenForEvent("animover", inst.Remove)

    return inst
end


--------------------------------------------------------------------------

return MakeProjectile("sorafireball_projectile", "fireball_fx", "fireball_2_fx", 30, 0,nil , nil, "sorafireball_hit_fx"),
    MakeProjectile("sorahealing_projectile", "fireball_fx", "fireball_2_fx", 15, 0, { 0,  255/255, 0/255, 150/255}, nil, "sorahealing_hit_fx"),
	MakeProjectile("sorapick_projectile", "fireball_fx", "fireball_2_fx", 7, 0, { 0, 0/255, 100/255, 0/255}, nil, "sorapick_hit_fx"),
	MakeProjectile("soratele_projectile", "fireball_fx", "fireball_2_fx", 10, 0, { 0, 0/255, 255/255, 0/255 }, nil, "soratele_hit_fx"),
	MakeProjectile("sora2sword_projectile", "fireball_fx", "fireball_2_fx", 15, 0, { 0, 120/255, 230/255, 0/255 }, nil, "sora2sword_hit_fx"),
    Prefab("sorafireball_hit_fx", fireballhit_fn, assets_fireballhit),
    Prefab("sorahealing_hit_fx", fireballhit_fn, assets_fireballhit),
	Prefab("sorapick_hit_fx", fireballhit_fn, assets_fireballhit),
	Prefab("soratele_hit_fx", fireballhit_fn, assets_fireballhit),
	Prefab("sora2sword_hit_fx", fireballhit_fn, assets_fireballhit)