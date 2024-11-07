--[[
授权级别:参考级
Copyright 1011 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638714135
WeGame平台: 穹の空 模组ID：workshop-1199017653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
1, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
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
1,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]] local assets = {Asset("ATLAS", "images/inventoryimages/sora_pickhat.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_pickhat.tex"), Asset("ANIM", "anim/crow.zip"),
                   Asset("ANIM", "anim/kitcoon_basic.zip"), Asset("ANIM", "anim/kitcoon_emotes.zip"),
                   Asset("ANIM", "anim/kitcoon_traits.zip"), Asset("ANIM", "anim/kitcoon_jump.zip")}
local function OnOpen(inst)
    inst.components.fueled:StartConsuming()
end
local function OnClose(inst)
    inst.components.fueled:StopConsuming()
end
local function turnoff(inst, owner)
    if inst.components.container ~= nil and not inst.notdrop then
        inst.components.container:Close(owner)
        if (owner.components.health and not owner.components.health:IsDead()) then
            local items = inst.components.container:RemoveAllItems()
            for k, item in pairs(items) do
                owner.components.inventory:GiveItem(item, nil, owner:GetPosition())
            end
        else
            inst.components.container:DropEverything()
        end
    end
    inst.components.container.canbeopened = false
    -- inst.components.fueled:StopConsuming()
    inst.components.sorapickhat:TurnOff()
end
local function turnon(inst, owner)
    if inst.components.fueled.currentfuel < 1 then
        turnoff(inst, owner)
        return
    end
    -- inst.components.fueled:StartConsuming()
    if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end
    inst.components.container.canbeopened = true
    inst.components.sorapickhat:TurnOn()
end

local function onDepleted(inst)
    if inst.owner then
        turnoff(inst, inst.owner)
    end
end

local function onTakeFuel(inst)
    if inst.owner then
        turnon(inst, inst.owner)
    end
end
local function ReFx(inst, owner, build)
    if inst.fx then
        inst.fx:Remove()
        inst.fx = nil
    end
    if build then
        inst.fx = SpawnPrefab(inst.fxprefab)
        inst.fx:bind(owner, inst)
    end
end
local function onplayerdespawn(inst) -- 玩家移除
    local hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if hat and hat.prefab == "sora_pickhat" then
        hat.notdrop = true
        turnoff(hat, inst)
    end
end
local function onequip(inst, owner)
    inst.owner = owner
    if not (owner and owner:HasTag("player")) then
        return
    end
    turnon(inst, owner)
    ReFx(inst, owner, true)
    inst:ListenForEvent("player_despawn", onplayerdespawn, owner)
    -- owner.AnimState:OverrideSymbol("swap_hat", GetInventoryItemAtlas("fish.tex"),"fish.tex")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
end

local function onunequip(inst, owner)
    inst.owner = nil
    if not (owner and owner:HasTag("player")) then
        return
    end
    turnoff(inst, owner)
    ReFx(inst, owner, false)
    inst:RemoveEventCallback("player_despawn", onplayerdespawn, owner)
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
end

local function ShouldWakeUp(inst)
    return DefaultWakeTest(inst) or
               (inst.hat and inst.hat.components.sorapickhat and inst.hat.components.sorapickhat:HasWork())
end

local function ShouldSleep(inst)
    return DefaultSleepTest(inst) and
               not (inst.hat and inst.hat.components.sorapickhat and inst.hat.components.sorapickhat:HasWork())
end

local allfx = {}
local allfxi = {}
local KITTEN_SCALE = 0.7
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst:AddTag("aquatic")
    inst:AddTag("waterproofer")
    anim:SetBank("kitcoon")
    inst.Transform:SetScale(KITTEN_SCALE, KITTEN_SCALE, KITTEN_SCALE)
    -- anim:SetBuild("kitcoon_yot_build")
    anim:PlayAnimation("sleep_loop", true)
    inst.Transform:SetSixFaced()
    inst:AddTag("NOBLOCK")
    inst:AddTag("cantpack")
    inst:AddTag("nonpackable")
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora_pickhat")
        end
        return inst
    end
    inst:SetStateGraph("SGsoracat")
    inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(999)
    inst.components.sleeper.testperiod = GetRandomWithVariance(3, 2)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("一群咸鱼罢了")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora_pickhat.xml"
    inst.components.inventoryitem.imagename = "sora_pickhat"
    inst:AddComponent('container')
    inst.components.container.canbeopened = false
    inst.components.container:WidgetSetup("sora_pickhat")
    inst.components.container.onclosefn = OnClose
    inst.components.container.onopenfn = OnOpen
    inst:AddComponent("sorapickhat")
    -- inst.components.container.onopenfn = onopen
    -- inst.components.container.onclosefn = onclose
    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.NIGHTMARE
    inst.components.fueled:InitializeFuelLevel(1440)
    inst.components.fueled:SetDepletedFn(onDepleted)
    inst.components.fueled:SetTakeFuelFn(onTakeFuel)
    -- inst.components.fueled:SetTakeFuelFn(onTakeFuel)
    -- inst.components.fueled:SetFirstPeriod(TUNING.TURNON_FUELED_CONSUMPTION, TUNING.TURNON_FULL_FUELED_CONSUMPTION)
    inst.components.fueled.accepting = true

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst:AddComponent("sorasavecmp")
    inst.components.sorasavecmp:AddLoad("fxprefab", function(inst, data)
        if data and data.fxprefab and allfx[data.fxprefab] then
            inst.fxprefab = data.fxprefab
            -- inst.AnimState:SetBuild(allfx[data.fxprefab] .. "_build")
        end
    end)
    -- inst:DoTaskInTime(0,function ()
    --     inst.AnimState:SetBuild(allfx[inst.fxprefab] .. "_build")
    -- end)
    inst.components.sorasavecmp:AddSave("fxprefab", function(inst)
        return {
            fxprefab = inst.fxprefab
        }
    end)
    inst.fxprefab = allfxi[math.random(1, 9)]
    -- inst.AnimState:SetBuild(allfx[inst.fxprefab] .. "_build")
    inst:DoTaskInTime(0, function()
        inst.AnimState:SetBuild(allfx[inst.fxprefab] .. "_build")
    end)
    return inst
end
local function bind(inst, owner, hat)
    inst.entity:SetParent(owner.entity)
    inst.Follower:FollowSymbol(owner.GUID, "swap_hat", -10, -148, 0, true, nil)
    inst.owner = owner
    inst.hat = hat
end
local function MakeFX(name)
    local fxname = "sora_fx_" .. name
    table.insert(assets, Asset("ANIM", "anim/" .. name .. "_build.zip"))
    local function fxfn()
        local inst = CreateEntity()
        local trans = inst.entity:AddTransform()
        local anim = inst.entity:AddAnimState()
        inst.Transform:SetSixFaced()
        inst.AnimState:SetBank("kitcoon")
        inst.AnimState:SetBuild(name .. "_build")
        inst.AnimState:PlayAnimation("idle_loop", true)
        inst.entity:AddFollower()
        inst.entity:SetCanSleep(false)
        inst.entity:AddNetwork()
        inst:AddTag("FX")
        inst:AddTag("NOCLICK")
        inst:AddTag("NOBLOCK")
        inst.persists = false
        inst.bind = bind
        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddComponent("sleeper")
        inst.components.sleeper:SetResistance(999)
        inst.components.sleeper.testperiod = GetRandomWithVariance(3, 2)
        inst.components.sleeper:SetSleepTest(ShouldSleep)
        inst.components.sleeper:SetWakeTest(ShouldWakeUp)
        inst:SetStateGraph("SGsoracat")
        return inst
    end
    allfx[fxname] = name
    table.insert(allfxi, fxname)
    return Prefab(fxname, fxfn)
end
local fxprefabs = {}
for k, v in pairs({
    kitcoon_forest = 1,
    kitcoon_savanna = 1,
    kitcoon_deciduous = 1,
    kitcoon_marsh = 1,
    kitcoon_grass = 1,
    kitcoon_rocky = 1,
    kitcoon_desert = 1,
    kitcoon_moon = 1,
    kitcoon_yot = 1
}) do

    table.insert(fxprefabs, MakeFX(k))
end
local function pick(inst, item, hat)
    -- body

    inst:ListenForEvent("onremove", function()
        if inst.unbind then
            inst:unbind(hat)
            inst.unbind = nil
        end
    end)
    local pos = item:GetPosition()
    inst.Physics:Teleport(pos.x, 25, pos.z)
    local speed = math.random() * 10 - 20
    inst.Physics:SetMotorVel(0, speed, 0)
    inst:StartThread(function()
        while true do
            local p = inst:GetPosition()
            if p.y < 0.1  or inst:IsAsleep() then
                inst.Physics:Stop()
                inst.Physics:Teleport(p.x, 0, p.z)
                inst.AnimState:PlayAnimation("peck")
                inst.AnimState:PushAnimation("peck")
                Sleep(1.2)
                if inst.pickitem and hat then
                    if item:IsValid() and not item:IsInLimbo() then
                        inst:pickitem(hat, item)
                    end
                end
                Sleep(0.8)
                local vert = math.random() < 0.5
                inst.AnimState:PlayAnimation(vert and "takeoff_vertical_pre" or "takeoff_diagonal_pre")
                if vert then
                    inst.AnimState:PushAnimation("takeoff_vertical_loop", true)
                    inst.Physics:SetMotorVel(math.random() * 4 - 2, math.random() * 5 + 15, math.random() * 4 - 2)
                else
                    inst.AnimState:PushAnimation("takeoff_diagonal_loop", true)
                    inst.Physics:SetMotorVel(math.random() * 8 + 8, math.random() * 5 + 15, math.random() * 4 - 2)
                end
                break
            elseif item:IsValid() and not item:IsInLimbo() then
                local ip = item:GetPosition()
                inst.Physics:SetMotorVel((ip.x - p.x) * 10, speed, (ip.z - p.z) * 10)
            end
            Sleep(0.01)
        end
        while true do
            local p = inst:GetPosition()
            inst.components.inventory:DropEverything()
            if p.y > 25   or inst:IsAsleep() then
                if inst.unbind and hat then
                    inst:unbind(hat)
                    inst.unbind = nil
                end
                inst:DoTaskInTime(0, inst.Remove)
                break
            end
            Sleep(0.01)
        end
    end)
end
local birdsname = {{"crow", "咸鱼"}, {"robin", "勤劳的羊姐"}, {"robin_winter", "欢猪"},
                   {"canary", "墨宝"}, {"quagmire_pigeon", "咕咕桃"}}
for k, v in pairs(birdsname) do
    table.insert(assets, Asset("ANIM", "anim/" .. v[1] .. "_build.zip"))
end
local function MakeBirds()

    local function fn()
        local inst = CreateEntity()
        local trans = inst.entity:AddTransform()
        local anim = inst.entity:AddAnimState()
        inst.Transform:SetTwoFaced()
        inst.AnimState:SetBank("crow")
        inst.AnimState:SetBuild("crow_build")
        inst.AnimState:PlayAnimation("glide", true)
        inst.entity:AddNetwork()
        inst.entity:AddPhysics()
        inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
        inst.Physics:ClearCollisionMask()
        inst.Physics:CollidesWith(COLLISION.WORLD)
        inst.Physics:SetMass(1)
        inst.Physics:SetSphere(1)
        inst:AddTag("FX")
        inst:AddTag("NOBLOCK")
        inst.persists = false
        inst.pick = pick
        local lab = inst.entity:AddLabel()
        lab:SetFontSize(17)
        lab:SetFont(BODYTEXTFONT)
        lab:SetWorldOffset(0, 1, 0)
        lab:SetColour(1, .3, .3, 1)
        inst:DoTaskInTime(0, function()
            lab:SetText(inst:GetDisplayName())
        end)

        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddComponent("inspectable")
        inst.components.inspectable:SetDescription("一群咸鱼罢了")
        inst:AddComponent("named")
        inst.Set = function(i, ind)
            local name = birdsname[ind]
            inst.AnimState:SetBuild(name[1] .. "_build")
            inst.components.named:SetName(name[2])
        end

        inst:AddComponent("inventory")
        inst:AddComponent("combat")
        inst:AddComponent("health")
        inst.components.health:SetMaxHealth(10000)
        inst.components.health.DoDelta = function()
            return 0
        end
        inst.components.health.SetVal = function()
            return 0
        end
        inst.components.health.Kill = function()
            return 0
        end

        return inst
    end
    return Prefab("sora_fx_bird", fn)
end
table.insert(fxprefabs, MakeBirds())

-- RegisterInventoryItemAtlas("images/inventoryimages/sora_wq.xml", "sora_wq.tex")
return Prefab("sora_pickhat", fn, assets), unpack(fxprefabs)
