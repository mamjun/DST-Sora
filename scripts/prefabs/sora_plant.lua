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
]] local assets = {}
local data = {}
local all = {}
local function Plant(name, cnname, plantdata, product, num, time)
    local name = "sora_plant_" .. name
    local d = plantdata or {}
    d.name = name
    d.cnname = cnname
    d.product = d.product or product
    d.num = d.num or num
    d.time = d.time or time
    data[name] = d
    return d
end

Plant("bhh", "百合花", nil, nil, 5)
local NilFn = SoraAPI.NilFn
local FalseFn = SoraAPI.FalseFn
local function makeemptyfn(inst)
    inst.AnimState:PlayAnimation("idle_empty", true)
end

local function onpickedfn(inst, picker)
    inst.AnimState:PlayAnimation("onpick")
    inst.AnimState:PushAnimation("idle_empty")
end

local function makefullfn(inst)
    inst.AnimState:PlayAnimation("grow")
    inst.AnimState:PushAnimation("idle_flower", true)
end
local function onbuilt(inst)
    
    inst.components.pickable:MakeEmpty()
    inst.AnimState:PlayAnimation("plant")
    inst.AnimState:PushAnimation("idle_empty",true)
end

for k, v in pairs(data) do
    v.name = k
    local function fn()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddNetwork()
        -- MakeSmallObstaclePhysics(inst, .1)
        inst:AddTag("plant")
        inst.AnimState:SetBank(v.bank or v.name)
        inst.AnimState:SetBuild(v.build or v.name)
        inst.AnimState:PlayAnimation(v.anim or "idle_flower", true)
        inst:AddComponent("soratwoface")
        inst.entity:SetPristine()
        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddComponent("pickable")
        inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"
        inst.components.pickable.onpickedfn = onpickedfn
        inst.components.pickable.makeemptyfn = makeemptyfn
        inst.components.pickable.makebarrenfn = NilFn
        inst.components.pickable.makefullfn = makefullfn
        inst.components.pickable:SetUp(v.product or "petals", (v.time or 3) * 480, v.num or 1)
        inst.components.pickable.max_cycles = 99
        inst.components.pickable.cycles_left = 99
        inst.components.pickable.MakeBarren = NilFn
        inst.components.pickable.IsWildfireStarter = FalseFn
        if v.cantmagic then
            inst.components.pickable.FinishGrowing = NilFn
        end
        inst:ListenForEvent("onbuilt", onbuilt)
        inst:AddComponent("inspectable")
        return inst
    end
    table.insert(assets, Asset("ANIM", "anim/" .. (v.build or v.bank or v.name) .. ".zip"))
    table.insert(assets, Asset("ATLAS",
        "images/inventoryimages/" .. (v.atlas or v.image or v.build or v.bank or v.name) .. ".xml"))
    table.insert(assets, Asset("IMAGE", "images/inventoryimages/" .. (v.image or v.build or v.bank or v.name) .. ".tex"))
    table.insert(assets, Asset("ATLAS_BUILD", "images/inventoryimages/" ..
        (v.atlas or v.image or v.build or v.bank or v.name) .. ".xml", 256))
    STRINGS.NAMES[v.name:upper()] = STRINGS.NAMES[v.name:upper()] or v.cnname
    STRINGS.CHARACTERS.GENERIC.DESCRIBE[v.name:upper()] = STRINGS.CHARACTERS.GENERIC.DESCRIBE[v.name:upper()] or v.des or ("这是" .. v.cnname)
    table.insert(all, Prefab(v.name, fn, assets))
    table.insert(all, MakePlacer(v.name .. "_placer", v.bank or v.name, v.build or v.name, v.anim or "idle_flower"))
end

return unpack(all)
