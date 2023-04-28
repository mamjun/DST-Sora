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
]] local assets = {Asset("ANIM", "anim/sora2plant.zip"), Asset("ATLAS", "images/inventoryimages/sora2plant.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora2plant.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sora2plant.tex"),
                   Asset("ATLAS", "images/ui/sora2plantspell.xml"), Asset("IMAGE", "images/ui/sora2plantspell.tex")}

local prefabs = {}

local Setreticule
local function onequip(inst, owner)
    inst.owner = owner
    inst:AddTag("sora2plantequiped")
    owner.AnimState:OverrideSymbol("swap_object", "sora2plant", "swap_weapon")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    inst.owner = nil
    inst:RemoveTag("sora2plantequiped")
    inst.isbig:set(false)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    Setreticule(inst)
end
local function StartAOETargeting(inst)
    local playercontroller = ThePlayer.components.playercontroller
    if playercontroller ~= nil then
        playercontroller:StartAOETargetingUsing(inst)
    end
end
local function ReticuleTargetAllowWaterFn()
    local player = ThePlayer
    local ground = TheWorld.Map
    local pos = Vector3()
    -- Cast range is 8, leave room for error
    -- 4 is the aoe range
    for r = 7, 0, -.25 do
        pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
        if ground:IsPassableAtPoint(pos.x, 0, pos.z, true) and not ground:IsGroundTargetBlocked(pos) then
            return pos
        end
    end
    return pos
end
function Setreticule(inst)
    -- body
    local re, ping = "reticuleaoesmall", "reticuleaoesmallping"
    if inst.isbig:value() then
        re, ping = "reticuleaoe_1_6", "reticuleaoeping_1_6"
    end
    inst.components.aoetargeting.reticule.reticuleprefab = re
    inst.components.aoetargeting.reticule.pingprefab = ping
end
local function GetTileCenter(inst, pos)
    if pos then
        pos.x, pos.y, pos.z = TheWorld.Map:GetTileCenterPoint(pos.x, pos.y, pos.z)
    end
    return pos
end

local function cd(inst, time)
    if inst and inst.components.rechargeable then
        inst.components.rechargeable:Discharge(time or 10)
    end
end

local function incd(inst, doer)
    if not inst and doer then
        return false
    end
    if not inst.components.rechargeable:IsCharged() then
        local t = math.floor(inst.components.rechargeable:GetTimeToCharge())
        Say(doer, "冷却中" .. t .. "S")
        return true
    end
    cd(inst)
    return false
end
local names = require "utils/soragjrnames"
local names_tmp = {}
local function CacheNames(doer)
    local name = doer:GetDisplayName() or doer.name or ""
    for k, v in pairs(names) do
        if v ~= name and v ~= "MySora" and v ~= "风铃草" and v ~= "☆风铃草☆" then
            table.insert(names_tmp, v)
        end
    end
    local t = TheNet:GetClientTable() or {}
    for k, v in pairs(t) do
        if v and v.name ~= name and v.name ~= "MySora" and v.name ~= "风铃草" and v.name ~= "☆风铃草☆" then
            table.insert(names_tmp, v.name)
        end
    end
end
local function GetName()
    if #names_tmp < 1 then
        return ""
    end
    local name = names_tmp[math.random(1, #names_tmp)]
    RemoveByValue(names_tmp, name)
    return name
end
local function Say(doer, str)
    if doer and doer.components.talker then
        doer.components.talker:Say(str, nil, true)
    end
end
local tillpos = {
    M3x3 = {{-1.333, -1.333}, {0, -1.333}, {1.333, -1.333}, {-1.333, 0}, {0, 0}, {1.333, 0}, {-1.333, 1.333},
            {0, 1.333}, {1.333, 1.333}},
    M4x4 = {{-1.5, -1.5}, {-0.5, -1.5}, {0.5, -1.5}, {1.5, -1.5}, {-1.5, -0.5}, {-0.5, -0.5}, {0.5, -0.5}, {1.5, -0.5},
            {-1.5, 0.5}, {-0.5, 0.5}, {0.5, 0.5}, {1.5, 0.5}, {-1.5, 1.5}, {-0.5, 1.5}, {0.5, 1.5}, {1.5, 1.5}},
    M10A = {{-1.5, -1.6}, {0.5, -1.6}, {-0.5, -0.8}, {1.5, -0.8}, {-1.5, 0}, {0.5, 0}, {-0.5, 0.8}, {1.5, 0.8},
            {-1.5, 1.6}, {0.5, 1.6}},
    M10B = {{-0.5, -1.6}, {1.5, -1.6}, {-1.5, -0.8}, {0.5, -0.8}, {-0.5, 0}, {1.5, 0}, {-1.5, 0.8}, {0.5, 0.8},
            {-0.5, 1.6}, {1.5, 1.6}}
}
local range = 2
local function isNear(inst, pos)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ax = pos.x - x
    local az = pos.z - z
    return ax <= range and ax >= -range and az <= range and az >= -range
end
local function FarmFn(inst, doer, pos, poss)
    if not TheWorld.Map:IsFarmableSoilAtPoint(pos.x, pos.y, pos.z) then
        return false, "只能在农田里使用"
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"soil"})
    for k, v in pairs(ents) do
        if isNear(v, pos) then
            v:Remove()
        end
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, nil,
        {"soil", "FX", "DECOR", "NOCLICK", "NOBLOCK", "player", "companion", "smallcreature", "INLIMBO",
         "_inventoryitem", "catchable"})
    if next(ents) then
        for k, v in pairs(ents) do
            if isNear(v, pos) then
                return false, "杂物太多了"
            end
        end
    end
    if poss == "M10" then
        local tilex, tiley = TheWorld.Map:GetTileCoordsAtPoint(pos.x, pos.y, pos.z)
        if 0 == (tiley % 2) then
            poss = tillpos.M10A
        else
            poss = tillpos.M10B
        end

    end
    for k, v in pairs(poss) do
        local newpos = pos + Point(v[1], 0, v[2])
        local a = SpawnAt("sora2plant_fx", newpos)
        a:Bind(GetName())
    end
end
local function DoBig(fn, inst, doer, pos, ...)
    -- 1格还是9格
    CacheNames(doer)
    if inst.isbig:value() and doer:HasTag("sora") then
        for x = -4, 4, 4 do
            for y = -4, 4, 4 do
                local newpos = Point(pos.x + x, 0, pos.z + y)
                fn(inst, doer, newpos, ...)
            end
        end
    else
        local r, str = fn(inst, doer, pos, ...)
        if not r then
            Say(doer, str)
        end
    end
    names_tmp = {}
end

local function On3x3Fn(inst, doer, pos)
    -- 刨坑
    if incd(inst, doer) then
        return
    end
    DoBig(FarmFn, inst, doer, pos, tillpos.M3x3)
end
local function On4x4Fn(inst, doer, pos)
    -- 刨坑
    if incd(inst, doer) then
        return
    end
    DoBig(FarmFn, inst, doer, pos, tillpos.M4x4)
end
local function On10Fn(inst, doer, pos)
    -- 刨坑
    if incd(inst, doer) then
        return
    end
    DoBig(FarmFn, inst, doer, pos, "M10")
end
local function OnPickFn(inst, doer, pos)
    if incd(inst, doer) then
        return
    end
    -- 采摘大作物
    Say(doer, "还没做呢")
end

local function OnSeedFn(inst, doer, pos)
    -- 种种子
    if incd(inst, doer) then
        return
    end
    Say(doer, "还没做呢")
end
local function fixCostController(self)
    self.donemoisture = true
	self.donenutrient = true
	self.donetendable = true
end
local function FeiFn(inst, doer, pos)
    -- body
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, nil,
        {"soil", "FX", "DECOR", "NOCLICK", "NOBLOCK", "player", "companion", "smallcreature", "INLIMBO",
         "_inventoryitem", "catchable"})
    if next(ents) then
        for k, v in pairs(ents) do

            if isNear(v, pos) then
                if doer:HasTag("sora") and doer.soralevel:value() > 14 then -- 需要施肥的变野生！
                    local fix = nil
                    if v.components.pickable and v.components.pickable.transplanted then
                        v.components.pickable.transplanted = false
                        if v.components.pickable:IsBarren() then
                            v.components.pickable:MakeEmpty()
                            v.components.pickable.cycles_left = v.components.pickable.max_cycles
                        end
                        fix = v
                    end
                    if v.components.perennialcrop2 and
                        (v.components.perennialcrop2.pollinated_max > -1 or v.components.perennialcrop2.infested_max <
                            100 or v.components.perennialcrop2.getsickchance > 0) then
                        v.components.perennialcrop2.pollinated_max = -1
                        v.components.perennialcrop2.infested_max = 100
                        v.components.perennialcrop2.getsickchance = 0
                        v.components.perennialcrop2.CostController = fixCostController
                        fix = v
                    end

                    if v.components.perennialcrop and not v.components.perennialcrop.sorafix then
                        local cmp = v.components.perennialcrop
                        cmp.sorafix = 1
                        cmp.moisture = 999 -- 当前水量
                        cmp.nutrient = 999 -- 当前肥量（生长必需）
                        cmp.nutrientgrow = 999 -- 当前肥量（生长加速）
                        cmp.nutrientsick = 999 -- 当前肥量（预防疾病）
                        cmp.sickness = 0 -- 当前病害程度
                        cmp.infested = 0 -- 被骚扰次数

                        cmp.moisture_max = 999 -- 最大蓄水量
                        cmp.nutrient_max = 999 -- 最大蓄肥量（生长必需）
                        cmp.nutrientgrow_max = 999 -- 最大蓄肥量（生长加速）
                        cmp.nutrientsick_max = 999 -- 最大蓄肥量（预防疾病）
                        cmp.pollinated_max = 0 -- 被授粉次数大于等于该值就能增加产量
                        cmp.infested_max = 1000 -- 被骚扰次数大于等于该值就会立即进入腐烂/枯萎阶段

                        cmp.cost_moisture = 0 -- 需水量
                        cmp.cost_nutrient = 0 -- 需肥类型(这里只需要一个量即可，不需要关注肥料类型)
                        cmp.can_getsick = false -- 是否能产生病虫害（原创）
                        cmp.killjoystolerance = 3 -- 扫兴容忍度：一般都为0
                        fix = v
                    end
                    if fix then
                        local fx = SpawnPrefab("sora_item_fx")
                        fx:Bind(fix, 3)
                    end
                else
                    if v.components.pickable and v.components.pickable:IsBarren() then
                        v.components.pickable:MakeEmpty()
                        v.components.pickable.cycles_left = v.components.pickable.max_cycles
                    end
                end
            end
        end
    end
    local x, y = TheWorld.Map:GetTileCoordsAtPoint(pos.x, pos.y, pos.z)
    TheWorld.components.farming_manager:AddTileNutrients(x, y, 100, 100, 100) -- 加满 蟹蟹
    TheWorld.components.farming_manager:AddSoilMoistureAtPoint(pos.x, pos.y, pos.z, 200)
    if doer and doer:HasTag("sora") and doer.GetExp then
        doer:GetExp(5, "pour_water", 30)
        doer:GetExp(5, "tendto", 30)
    end
end
local function OnFeiFn(inst, doer, pos)
    if incd(inst, doer) then
        return
    end
    -- 施肥
    DoBig(FeiFn, inst, doer, pos)
end
local function PlantFn(inst, doer, pos)
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"farmplantstress"})
    for k, v in pairs(ents) do
        if v and v.components.farmplantstress then
            if v.components.farmplanttendable then
                v.components.farmplanttendable:TendTo(doer)
            end
            local reducemax = math.min(v.components.farmplantstress.stress_points, 2)
            if reducemax > 0 then
                local hasreduce = v.components.farmplantstress.sorareduce or 0
                local reduce = math.min(2 - hasreduce, reducemax)
                if reduce > 0 then
                    v.components.farmplantstress.sorareduce = hasreduce + reduce
                    v.components.farmplantstress.stress_points = v.components.farmplantstress.stress_points - reduce
                end
            end
        end
    end
    -- body
end
local function OnPlantFn(inst, doer, pos)
    if incd(inst, doer) then
        return
    end
    -- 照顾
    DoBig(PlantFn, inst, doer, pos)
end

local function OnDefaultFn(inst, doer, pos)
    local str = ""
    if inst and doer and doer:HasTag("sora") then
        str = "当前范围:" .. (inst.isbig:value() and "大" or "小") .. "\n"
    end
    Say(doer, str .. "请选择功能")
    return true
end

local function OnRangeFn(inst, doer, pos)
    if doer and doer:HasTag("sora") then
        if inst.isbig:value() then
            inst.isbig:set(false)
        else
            inst.isbig:set(true)
        end

    elseif inst.owner then
        inst.isbig:set(false)
    end
    OnDefaultFn(inst, doer, pos)
end

local ICON_SCALE = .5
local ICON_RADIUS = 55
local SPELLBOOK_RADIUS = 120
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2

local SPELLS = {{
    label = "收", -- 批量收取大作物的产出 仅限穹妹 且可以铲树根 
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("收大作物")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(OnPickFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "pick.tex"
}, {
    label = "育", -- 作物的压力值-2 仅限穹妹 15级以后 每个作物只能1次 
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("照料植物")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(OnPlantFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "plant.tex"
}, {
    label = "肥", -- 对普通作物进行施肥     穹妹10级以后 可以对农田进行施肥  15级以后 可以把普通作物转换为野生状态 参考空白
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("田地施肥")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(OnFeiFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "fei.tex"
}, {
    label = "10坑", -- 铲出3x3的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("刨地十格")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(On10Fn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "m10.tex"
}, {
    label = "4x4", -- 铲出4x4的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("刨坑4x4")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(On4x4Fn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "m4x4.tex"
}, {
    label = "3x3", -- 铲出3x3的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("刨地3x3")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(On3x3Fn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "m3x3.tex"
}, {
    label = "范", -- 扩大操作范围
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("改变范围")

        if TheWorld.ismastersim then

            inst.components.aoespell:SetSpellFn(OnRangeFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "fan.tex"
}, {
    label = "种", -- 铲出3x3的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("种植种子")
        Setreticule(inst)
        if TheWorld.ismastersim then
            inst.components.aoespell:SetSpellFn(OnSeedFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "seed.tex"
}}

for k, v in pairs(SPELLS) do
    v.widget_scale = ICON_SCALE
    v.hit_radius = ICON_RADIUS
    v.execute = StartAOETargeting
end
local function plantrecharge(inst, data)
    if data.percent >= 1 and not inst:HasTag("sorarecharge") then
        inst:AddTag("sorarecharge")
        inst.components.aoetargeting.enabled:set(true)
    elseif data.percent < 1 and inst:HasTag("sorarecharge") then
        inst:RemoveTag("sorarecharge")
        inst.components.aoetargeting.enabled:set(false)
    end
end
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst:AddTag("aquatic")
    anim:SetBank("sora2plant")
    anim:SetBuild("sora2plant")
    anim:PlayAnimation("anim")
    inst:AddTag("nopunch")
    inst:AddTag("sorarecharge")
    inst:AddTag("allow_action_on_impassable")
    inst:AddTag("rechargeable")
    inst.entity:AddMiniMapEntity()
    inst.isbig = net_bool(inst.GUID, "sora2plant.isbig", "sora2plant.isbig")
    inst.MiniMapEntity:SetIcon("sora2plant.tex")
    inst:ListenForEvent("sora2plant.isbig", Setreticule)
    inst:AddComponent("spellbook")
    inst.components.spellbook:SetRadius(SPELLBOOK_RADIUS)
    inst.components.spellbook:SetFocusRadius(SPELLBOOK_FOCUS_RADIUS)
    inst.components.spellbook:SetItems(SPELLS)

    inst.components.spellbook.opensound = "dontstarve/common/together/book_maxwell/use"
    inst.components.spellbook.closesound = "dontstarve/common/together/book_maxwell/close"
    inst.components.spellbook.CanBeUsedBy = function(s, doer)
        if inst and inst:HasTag("sorarecharge") and inst:HasTag("sora2plantequiped") and doer and doer:HasTag("player") then
            return true
        end
        return false
    end
    -- inst.components.spellbook.executesound = "dontstarve/common/together/book_maxwell/close"

    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting:SetAllowWater(false)
    inst.components.aoetargeting.reticule.targetfn = nil
    inst.components.aoetargeting.reticule.validcolour = {1, .75, 0, 1}
    inst.components.aoetargeting.reticule.invalidcolour = {.5, 0, 0, 1}
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true
    inst.components.aoetargeting.reticule.twinstickmode = 1
    inst.components.aoetargeting.reticule.twinstickrange = 8
    inst.components.aoetargeting:SetDeployRadius(0)
    inst.components.aoetargeting:SetShouldRepeatCastFn(nil)
    inst.components.aoetargeting.reticule.mousetargetfn = GetTileCenter
    local oldIsEnabled = inst.components.aoetargeting.IsEnabled
    inst.components.aoetargeting.IsEnabled = function(self,...)
        local can = true
        if ThePlayer and  ThePlayer.replica.inventory:GetActiveItem() then
            return false
        end
        return can and oldIsEnabled(self,...)
    end
    Setreticule(inst)

    if not TheWorld.ismastersim then
        inst.components.spellbook:SelectSpell(7)
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[桃源深处有...


	大规模手工业生产基地]])
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2plant.xml"
    inst.components.inventoryitem.imagename = "sora2plant"
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = math.min(getsora("sora2swordspe"), 2.5)
    -- inst:AddComponent("spellcaster")
    -- inst.components.spellcaster.CanCast = function() return true end
    -- inst.components.spellcaster.canuseontargets = true
    -- inst.components.spellcaster.quickcast = true
    -- inst.components.spellcaster.canuseonpoint = true
    -- inst.components.spellcaster.canuseonpoint_water = true
    -- inst.components.spellcaster:SetSpellFn(soramagicfn)
    inst:AddComponent("aoespell")
    inst.components.aoespell:SetSpellFn(OnDefaultFn)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
    inst.components.weapon:SetRange(8)
    inst.components.weapon:SetProjectile("sorapick_projectile")

    inst:AddComponent("rechargeable")
    inst.components.rechargeable:SetMaxCharge(10)
    inst:ListenForEvent("rechargechange", plantrecharge)
    inst.components.spellbook:SelectSpell(7)
    return inst
end

local function Bind(inst, name, isload)
    inst.components.named:SetName(name)
    inst.components.inspectable:SetDescription(name .. "\n别偷懒!\n赶紧干活")
    if not isload then
        inst:DoTaskInTime(FRAMES * 62, function()
            SpawnAt("farm_soil", inst)
        end)
        inst:DoTaskInTime(FRAMES * 87, inst.Remove)
        inst.components.scaler:SetScale(0.3)
    else
        inst.persists = true
        inst.components.scaler:SetScale(0.7)
    end
    inst.components.sorasavecmp:SetSave("name", {
        name = name
    })
end
local function fxfn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    local lab = inst.entity:AddLabel()
    lab:SetFontSize(14)
    lab:SetFont(BODYTEXTFONT)
    lab:SetWorldOffset(0, 0.7, 0)
    lab:SetColour(.8, .8, .8, .8)
    inst:DoTaskInTime(0, function()
        lab:SetText(inst:GetDisplayName())
    end)
    inst.AnimState:SetBank("mole")
    inst.AnimState:SetBuild("mole_build")
    inst.AnimState:PlayAnimation("enter")
    inst.AnimState:PushAnimation("exit")
    -- inst:AddTag("FX")
    inst:AddTag("NOBLOCK")
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("named")
    inst:AddComponent("scaler")
    inst.components.scaler.OnLoad = nil
    inst.components.scaler.OnSave = nil
    inst:AddComponent("inspectable")
    inst:AddComponent("sorasavecmp")
    inst.components.sorasavecmp:AddLoad("name", function(i, data)
        if data and data.name and type(data.name) == "string" then
            inst:DoTaskInTime(0, function()

                inst:Bind(data.name, true)
            end)
        end
        return data
    end)
    inst.Bind = Bind
    inst.persists = false

    return inst
end

return Prefab("sora2plant", fn, assets, prefabs), Prefab("sora2plant_fx", fxfn, assets, prefabs)
