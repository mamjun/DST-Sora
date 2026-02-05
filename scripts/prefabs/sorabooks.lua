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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]] local function trygrowth(inst, doer)
    if inst:IsInLimbo() then
        return
    end

    if inst.components.pickable ~= nil then
        if inst:HasTag("sunflower") and TUNING.SUNFLOWER_REGROW_TIME then
            inst.time = GetTime() - TUNING.SUNFLOWER_REGROW_TIME
        end
        if inst.components.pickable:CanBePicked() and inst.components.pickable.caninteractwith then
            return
        end
        local nomagic = nil
        local OldCanRegenFruits
        if inst:HasTag("ancienttree") then 
            OldCanRegenFruits = inst.CanRegenFruits
            inst.CanRegenFruits = function()
                return true
            end
        end
        if inst.components.pickable.nomagic then
            inst.components.pickable.nomagic = nil
            nomagic = true
        end
        inst.components.pickable:FinishGrowing()
        inst.components.pickable.nomagic = nomagic
        if inst:HasTag("ancienttree") then 
            inst.CanRegenFruits = function()
                return true
            end
            inst.CanRegenFruits = OldCanRegenFruits
        end
    end

    if inst.components.crop ~= nil then
        inst.components.crop:DoGrow(TUNING.TOTAL_DAY_TIME * 6, true)
    end
    if inst.components.timer ~= nil and inst.components.timer:TimerExists("grow") then
        inst.components.timer:StopTimer("grow")
        inst:PushEvent("timerdone", {
            name = "grow"
        })
    end
    if inst.components.timer ~= nil and inst.components.timer:TimerExists("growth") then
        inst.components.timer:StopTimer("growth")
        inst:PushEvent("timerdone", {
            name = "growth"
        })
    end
    if inst.components.timer ~= nil and inst.components.timer:TimerExists("growup") then
        inst.components.timer:StopTimer("growup")
        inst:PushEvent("timerdone", {
            name = "growup"
        })
    end

    if inst.components.worldsettingstimer and inst.components.worldsettingstimer:TimerExists("grow") then
        inst.components.worldsettingstimer:StopTimer("grow")
        inst:PushEvent("timerdone", {
            name = "grow"
        })
    end
    if inst.components.worldsettingstimer and inst.components.worldsettingstimer:TimerExists("growth") then
        inst.components.worldsettingstimer:StopTimer("growth")
        inst:PushEvent("timerdone", {
            name = "growth"
        })
    end
    if inst.components.crop_legion ~= nil then
        inst.components.crop_legion:DoGrow(TUNING.TOTAL_DAY_TIME * 6, true) -- 增加3天生长时间
    end
    if inst.components.perennialcrop ~= nil then
        inst.components.perennialcrop:DoMagicGrowth(doer, TUNING.TOTAL_DAY_TIME * 3) -- 增加3天生长时间
    end
    if inst.components.perennialcrop2 ~= nil then
        inst.components.perennialcrop2:DoMagicGrowth(doer, TUNING.TOTAL_DAY_TIME * 3) -- 增加3天生长时间
    end
    if inst.components.growable ~= nil and
        (inst:HasTag("tree") or inst:HasTag("peachtree") or inst:HasTag("plant") or inst:HasTag("winter_tree") or
            inst:HasTag("boulder") or inst:HasTag("siving_derivant") or inst.components.growable.magicgrowable) then
        local stage = inst.components.growable.stage
        local maxstage = #inst.components.growable.stages
        if inst:HasTag("evergreens") then
            maxstage = maxstage - 1
        end
        if inst:HasTag("siving_derivant") then
            inst.components.growable:DoGrowth()
            inst.components.growable:DoMagicGrowth()
            inst.components.growable:DoMagicGrowth()
            inst.components.growable:DoMagicGrowth()
        else
            if stage == maxstage then
                inst.components.growable:Pause()
            elseif stage == maxstage - 1 then
                inst.components.growable:DoGrowth()
                inst.components.growable:Pause()
            else
                inst.components.growable:DoGrowth()
            end
        end
    end

    if inst.components.harvestable ~= nil and (inst:HasTag("mushroom_farm")) then -- or inst:HasTag("beebox") 不再能催熟蜂箱
        if inst.components.harvestable.task then
            inst.components.harvestable:Grow()
            inst.components.harvestable:Grow()
            inst.components.harvestable:Grow()
            inst.components.harvestable:Grow()
            inst.components.harvestable:Grow()
            inst.components.harvestable:Grow()
        end
    end
end

local changelist = {
    ice = "charcoal",
    charcoal = "ice",
    -- 岩石->燧石->硝石
    rocks = "flint",
    flint = "nitre",
    nitre = "rocks",
    -- 宝石
    redgem = "bluegem",
    bluegem = "redgem",
    orangegem = "yellowgem",
    yellowgem = "orangegem",
    purplegem = "greengem",
    greengem = "purplegem",
    -- 金子->元宝
    goldnugget = "lucky_goldnugget",
    lucky_goldnugget = "goldnugget",
    -- 蘑菇系列
    -- 孢子
    spore_small = "spore_medium",
    spore_medium = "spore_tall",
    spore_tall = "spore_small",
    -- 蘑菇
    red_mushroom = "green_mushroom",
    green_mushroom = "blue_mushroom",
    blue_mushroom = "red_mushroom",
    -- 蘑菇树
    mushtree_small = "mushtree_medium",
    mushtree_medium = "mushtree_tall",
    mushtree_tall = "mushtree_small",
    mushtree_small_stump = "mushtree_medium_stump",
    mushtree_medium_stump = "mushtree_tall_stump",
    mushtree_tall_stump = "mushtree_small_stump",
    -- 采下的蘑菇
    red_cap = "green_cap",
    green_cap = "blue_cap",
    blue_cap = "moon_cap",
    moon_cap = "red_cap",
    -- 烤蘑菇
    red_cap_cooked = "green_cap_cooked",
    green_cap_cooked = "blue_cap_cooked",
    blue_cap_cooked = "red_cap_cooked",
    -- 荧光花
    flower_cave = "flower_cave_double",
    flower_cave_double = "flower_cave_triple",
    flower_cave_triple = "flower_cave",

    -- 花
    flower = "flower_evil",
    flower_evil = "flower",
    petals = "petals_evil",
    petals_evil = "petals",
    -- 浆果丛
    -- berrybush="berrybush2",
    -- berrybush2="berrybush_juicy",
    -- berrybush_juicy="berrybush",
    -- 树苗 月树苗
    dug_sapling = "dug_sapling_moon",
    dug_sapling_moon = "dug_sapling",
    dug_berrybush = "dug_berrybush2",
    dug_berrybush2 = "dug_berrybush_juicy",
    dug_berrybush_juicy = "dug_berrybush",
    -- 浆果
    berries = "berries_juicy",
    berries_juicy = "berries",
    berries_cooked = "berries_juicy_cooked",
    berries_juicy_cooked = "berries_cooked",
    -- 蛙腿鸡腿
    froglegs = "drumstick",
    drumstick = "froglegs",
    -- 牛角电羊角海象牙
    horn = "walrus_tusk",
    walrus_tusk = "lightninggoathorn",
    lightninggoathorn = "horn",
    -- 羽毛
    feather_crow = "feather_robin",
    feather_robin = "feather_robin_winter",
    feather_robin_winter = "feather_crow",
    -- 蜂刺狗牙
    stinger = "houndstooth",
    houndstooth = "stinger",
    -- 牛毛蜘蛛丝
    silk = "beefalowool",
    beefalowool = "beardhair",
    beardhair = "silk",
    -- 蜘蛛腺 蚊子血囊
    spidergland = "mosquitosack",
    mosquitosack = "spidergland",
    -- 猪皮兔毛触手皮
    tentaclespots = "manrabbit_tail",
    manrabbit_tail = "pigskin",
    pigskin = "tentaclespots",
    -- 冰狗火狗
    firehound = "icehound",
    icehound = "firehound",
    -- 龙鳞魔蛤皮
    shroom_skin = "dragon_scales",
    dragon_scales = "shroom_skin",
    -- 粪便-鸟粪
    poop = "guano",
    guano = "poop",
    -- 骨片-化石碎片
    boneshard = "fossil_piece",
    fossil_piece = "boneshard",
    -- 玻璃 月亮石
    moonglass = "moonrocknugget",
    moonrocknugget = "moonglass",
    -- 蝴蝶-月娥
    butterfly = "moonbutterfly",
    moonbutterfly = "butterfly",
    -- 翅膀-黄油
    butterflywings = "butter",
    moonbutterflywings = "butter",

    -- 蒜粉 辣椒 糖

    spice_chili = "spice_garlic",

    spice_garlic = "spice_chili",
    spice_sugar = "spice_salt",
    spice_salt = "spice_sugar",
    -- 大蒜->洋葱->辣椒
    garlic = "onion",
    onion = "pepper",
    pepper = "garlic",

    evergreen = "evergreen_sparse_tall",
    evergreen_sparse = "rock_petrified_tree_tall",
    rock_petrified_tree = "evergreen_tall",

    -- 大理石--玄武岩
    marbleshrub = "marbletree",
    marbletree = "basalt",
    basalt = "basalt_pillar",
    basalt_pillar = "marblepillar",
    marblepillar = "statueharp",
    statueharp = "statue_marble",
    statue_marble_pawn = "statue_marble",
    statue_marble = "statuemaxwell",
    statuemaxwell = "marbleshrub",

    moonbase = "moondial",
    moondial = "moonbase",
    -- 胡萝卜-胡萝卜鼠-曼德拉草
    carrot_planted = "carrat_planted",
    carrat_planted = "mandrake_planted",
    carrat = "mandrake_planted",
    mandrake_planted = "carrot_planted",
    -- 地毯-贝壳
    turf_carpetfloor = "turf_shellbeach",
    turf_shellbeach = "turf_carpetfloor",
    -- 邪天翁羽毛-鹅毛
    malbatross_feather = "goose_feather",
    goose_feather = "malbatross_feather",
    -- 蜂巢 杀人蜂巢
    wasphive = "beehive",
    beehive = "wasphive",
    -- 壳碎片 饼干切割机壳
    slurtle_shellpieces = "cookiecuttershell",
    cookiecuttershell = "slurtle_shellpieces",
    -- 棋盘-卵石路
    turf_road = "turf_checkerfloor",
    turf_checkerfloor = "turf_road",
    dug_rosebush = "dug_orchidbush",
    dug_orchidbush = "dug_lilybush",
    dug_lilybush = "dug_rosebush",
    cutted_rosebush = "dug_orchidbush",
    cutted_orchidbush = "dug_lilybush",
    cutted_lilybush = "dug_rosebush",
    monkeytail = "reeds",
    reeds = "monkeytail",
    ccs_sakura1 = "ccs_sakura2",
    ccs_sakura2 = "ccs_sakura3",
    ccs_sakura3 = "ccs_sakura1",
    -- 纯粹辉煌 纯粹恐惧
    horrorfuel = 'purebrilliance',
    purebrilliance = 'horrorfuel'

}

local laterfn = {
    beehive = function(inst)
        if inst.components.childspawner then 
            inst.components.childspawner.childreninside = 0
            inst.components.childspawner.mergencychildreninside = 0
        end
    end,
    wasphive = function(inst)
        if inst.components.childspawner then 
            inst.components.childspawner.childreninside = 0
            inst.components.childspawner.mergencychildreninside = 0
        end
    end,
}
local crops = {
    asparagus = 1,
    garlic = 1,
    pumpkin = 1,
    corn = 1,
    onion = 1,
    potato = 1,
    dragonfruit = 1,
    pomegranate = 1,
    eggplant = 1,
    tomato = 1,
    watermelon = 1,
    pepper = 1,
    durian = 1,
    carrot = 1
}
for k, v in pairs(crops) do
    changelist[k .. "_seeds"] = "seeds"
end
SORAAPI.LISTCONFIG.CHANGELIST = changelist
local function fixCostController(self)
    self.donemoisture = true
    self.donenutrient = true
    self.donetendable = true
end
local RETARGET_MUST_TAGS = {"_combat", "_health"}
local RETARGET_CANT_TAGS = {}
local function retargetfn(inst)
    return FindEntity(inst, TUNING.TENTACLE_ATTACK_DIST, function(guy)
        if guy.prefab == inst.prefab then
            return false
        end
        if not guy.entity:IsVisible() then
            return false
        end
        if guy.components.health:IsDead() then
            return false
        end
        if guy:HasTag("companion") then
            return false
        end
        if guy:HasTag("character") or guy:HasTag("epic") or guy:HasTag("monster") or guy:HasTag("animal") then
            return true
        end
        if guy.components.combat.target then
            if guy.components.combat.target:HasTag("player") then
                return true
            end
            if guy.components.combat.target:HasTag("soratargetthis") then
                return true
            end
            if guy.components.combat.target:HasTag("companion") then
                return true
            end
            return false
        end

        return false
    end, RETARGET_MUST_TAGS, RETARGET_CANT_TAGS)
end

local function trychange(inst)
    if not inst or inst:IsInLimbo() then
        return
    end
    local fix = nil
    -- PrintTable(inst,nil,2)
    if changelist[inst.prefab] then
        local newprefabs = changelist[inst.prefab]
        local newprefab = newprefabs
        local item = SpawnPrefab(newprefab)
        if item.OnStartRegrowth then
            RemoveFromRegrowthManager(item)
        end
        if not item then
            return
        end
        if laterfn[item.prefab] then 
            laterfn[item.prefab](item)
        end

        local x, y, z = inst.Transform:GetWorldPosition()
        if inst.components.stackable then
            if item.components.stackable then
                item.components.stackable:SetStackSize(inst.components.stackable:StackSize())
            else
                local num = inst.components.stackable:StackSize() - 1
                for i = 1, num, 1 do
                    local a = SpawnPrefab(changelist[inst.prefab])
                    a.Transform:SetPosition(x, y, z)
                    if a.OnStartRegrowth then
                        RemoveFromRegrowthManager(a)
                    end
                end
            end
        end
        item.Transform:SetPosition(x, y, z)
        fix = item
        if inst.OnStartRegrowth then
            RemoveFromRegrowthManager(inst)
        end
        inst:Remove()
    end 
    
    -- 需要施肥的变成不需要施肥
    if inst.components.pickable and (inst.components.pickable.transplanted or inst.components.pickable:IsBarren()) then
        inst.components.pickable.transplanted = false
        if inst.components.pickable:IsBarren() then
            inst.components.pickable:MakeEmpty()
        end
        inst.components.pickable.cycles_left = inst.components.pickable.max_cycles
        fix = inst
    end
    if inst.components.perennialcrop2 and
        (inst.components.perennialcrop2.pollinated_max > -1 or inst.components.perennialcrop2.infested_max < 100 or
            inst.components.perennialcrop2.getsickchance > 0) then
        inst.components.perennialcrop2.pollinated_max = -1
        inst.components.perennialcrop2.infested_max = 100
        inst.components.perennialcrop2.getsickchance = 0
        inst.components.perennialcrop2.CostController = fixCostController
        inst.components.perennialcrop2.CostNutrition = fixCostController
        inst.components.perennialcrop2:CostNutrition()
        inst.components.perennialcrop2:CostController()
        fix = inst
    end

    if inst.components.perennialcrop and not inst.components.perennialcrop.sorafix then
        local cmp = inst.components.perennialcrop
        cmp.sorafix = 1
        cmp.moisture = 999 -- 当前水量
        cmp.nutrient = 999 -- 当前肥量（生长必需）
        cmp.nutrientgrow = 999 -- 当前肥量（生长加速）
        cmp.nutrientsick = 999 -- 当前肥量（预防疾病）
        cmp.sickness = 0 -- 当前病害程度
        cmp.infested = 0 -- 被骚扰次数
        cmp.nosick = true -- 无虫害
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
        fix = inst
    end
    if inst.components.genetrans then
        inst.components.genetrans:LongUpdate(480)
        fix = inst
    end
    if fix then
        local fx = SpawnPrefab("sora_item_fx")
        fx:Bind(fix, 3)
    end
end
local function RemoveAllTentacle(i)
    if i.tentacles then
        for k, v in pairs(i.tentacles) do
            if v and v:IsValid() and v.components.health and not v.components.health:IsDead() then
                v:Remove()
            end
        end
    end
end

local function TryToRemoveTentacle(doer, inst)
    local maxn = 20
    if not doer.tentacles then
        doer.tentacles = {}
        doer.tentaclesindex = 1
        doer:ListenForEvent("onremove", RemoveAllTentacle)
    end
    for i = 1, maxn, 1 do
        if not (doer.tentacles and doer.tentacles[i] and doer.tentacles[i].components.health and
            not doer.tentacles[i].components.health:IsDead()) then
            doer.tentacles[i] = inst
            doer.tentaclesindex = i
            return
        end
    end
    doer.tentacles[doer.tentaclesindex]:Remove()
    doer.tentacles[doer.tentaclesindex] = inst
    doer.tentaclesindex = (doer.tentaclesindex % 20) + 1
end
local function SpawnPrefabChooser(inst)
    return inst.cage == 1 and "seeds" or nil
end
local Magic_defs = {{
    name = "sora_magics",
    fn = function(inst, maker)
        local x, y, z = maker.Transform:GetWorldPosition()
        local range = 25
        local ents = TheSim:FindEntities(x, y, z, range, nil, {"player", "INLIMBO"})
        if #ents > 0 then
            trychange(table.remove(ents, math.random(#ents)))
            if #ents > 0 then
                local timevar = 1 - 1 / (#ents + 1)
                for i, v in ipairs(ents) do
                    v:DoTaskInTime(timevar * math.random() / 3, trychange)
                end
            end
        end
        inst:Remove()
        return true
    end
}, {
    name = "sora_birds",
    fn = function(inst, maker)
        local birdspawner = TheWorld.components.birdspawner
        if birdspawner == nil then
            return false
        end
        local pt = maker:GetPosition()

        -- we can actually run out of command buffer memory if we allow for infinite birds
        local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, 10, nil, {"INLIMBO"}, {"magicalbird"})
        if #ents > 100 then
            maker.components.talker:Say("周围鸟太多了")
            local san = AllRecipes and AllRecipes.sora_birds_build_sora and
                            AllRecipes.sora_birds_build_sora.character_ingredients[1] and
                            AllRecipes.sora_birds_build_sora.character_ingredients[1].amount or 50
            maker.components.sanity:DoDelta(san)
        else
            local num = math.random(30, 50)
            local cage = FindEntity(maker, 20, function(e)
                return e and e.prefab == "birdcage"
            end, {"cage"})
            maker:StartThread(function()
                for k = 1, num do
                    local pos = birdspawner:GetSpawnPoint(pt)
                    if pos ~= nil then
                        local bird = birdspawner:SpawnBird(pos, true)
                        if bird ~= nil then
                            bird:AddTag("magicalbird")
                            if bird.components.periodicspawner then
                                bird.cage = cage and 1 or 0
                                bird.components.periodicspawner:SetPrefab(SpawnPrefabChooser)
                                if cage then
                                    bird.components.periodicspawner:SetDensityInRange(3, 10)
                                    bird.components.periodicspawner:SetMinimumSpacing(0.1)
                                else
                                    bird.components.periodicspawner:SetDensityInRange(3, 0)
                                end
                            end
                        end
                    end
                    local m = k % 5
                    if m == 0 then
                        Sleep(0.01)
                    end
                end
            end)
        end
        inst:Remove()
        return true
    end
}, {
    name = "sora_raining",
    fn = function(inst, maker)
        if TheWorld.state.israining or TheWorld.state.issnowing then
            TheWorld:PushEvent("ms_forceprecipitation", false)
        else
            TheWorld:PushEvent("ms_forceprecipitation", true)
        end
        if TheWorld.state.islunarhailing and TheWorld.net.components.weather then
            local _lunarhaillevel = SoraUp.Get(TheWorld.net.components.weather.GetDebugString, "_lunarhaillevel")
            if _lunarhaillevel and _lunarhaillevel.set then
                _lunarhaillevel:set_local(0.01)
            end
        end
        inst:Remove()
        return true
    end
}, {
    name = "sora_sleep",
    fn = function(inst, maker)
        local x, y, z = maker.Transform:GetWorldPosition()
        local range = 30
        local ents = TheNet:GetPVPEnabled() and
                         TheSim:FindEntities(x, y, z, range, nil, {"playerghost"}, {"sleeper", "player"}) or
                         TheSim:FindEntities(x, y, z, range, {"sleeper"}, {"player"})
        for i, v in ipairs(ents) do
            if v ~= maker and not (v.components.freezable ~= nil and v.components.freezable:IsFrozen()) and
                not (v.components.pinnable ~= nil and v.components.pinnable:IsStuck()) then
                if v.components.sleeper ~= nil then
                    v.components.sleeper:AddSleepiness(10, 20)
                elseif v.components.grogginess ~= nil then
                    v.components.grogginess:AddGrogginess(10, 20)
                else
                    v:PushEvent("knockedout")
                end
            end
        end
        inst:Remove()
        return true
    end
}, {
    name = "sora_gardening",
    fn = function(inst, maker)
        local x, y, z = maker.Transform:GetWorldPosition()
        local range = 60
        local ents = TheSim:FindEntities(x, y, z, range, nil, {"pickable", "stump", "withered", "INLIMBO"})
        if #ents > 0 then
            trygrowth(table.remove(ents, math.random(#ents)), maker)
            if #ents > 0 then
                local timevar = 1 - 1 / (#ents + 1)
                for i, v in ipairs(ents) do
                    v:DoTaskInTime(timevar * math.random() / 3, trygrowth)
                end
            end
        end
        inst:Remove()
        return true
    end
}, {
    name = "sora_lighting",
    fn = function(inst, reader)
        local pt = reader:GetPosition()
        local num_lightnings = 16

        -- reader.components.sanity:DoDelta(-TUNING.SANITY_LARGE)

        reader:StartThread(function()
            for k = 0, num_lightnings do
                local rad = math.random(8, 15)
                local angle = k * 4 * PI / num_lightnings
                local pos = pt + Vector3(rad * math.cos(angle), 0, rad * math.sin(angle))
                TheWorld:PushEvent("ms_sendlightningstrike", pos)
                Sleep(.3 + math.random() * .2)
            end
        end)
        inst:Remove()
        return true
    end
}, {
    name = "sora_tentacles",
    fn = function(inst, reader)
        local pt = reader:GetPosition()
        local numtentacles = 5
        reader:StartThread(function()
            for k = 1, numtentacles do
                local theta = math.random() * 2 * PI
                local radius = math.random(3, 8)

                local result_offset = FindValidPositionByFan(theta, radius, 6, function(offset)
                    local pos = pt + offset
                    -- NOTE: The first search includes invisible entities
                    return #TheSim:FindEntities(pos.x, 0, pos.z, 1, nil, {"INLIMBO", "FX"}) <= 0 and
                               TheWorld.Map:IsPassableAtPoint(pos:Get()) and
                               TheWorld.Map:IsDeployPointClear(pos, nil, 1)
                end)

                if result_offset ~= nil then
                    local x, z = pt.x + result_offset.x, pt.z + result_offset.z
                    local tentacle = SpawnPrefab("tentacle")
                    tentacle.Transform:SetPosition(x, 0, z)
                    tentacle.sg:GoToState("attack_pre")
                    tentacle.persists = false -- 触手不保存
                    tentacle:AddTag("companion")
                    tentacle.components.combat.externaldamagemultipliers:SetModifier("sora", 3)
                    tentacle.components.combat.externaldamagetakenmultipliers:SetModifier("sora", 0.33)
                    tentacle.components.combat:SetRange(TUNING.TENTACLE_ATTACK_DIST * 1.5,
                        TUNING.TENTACLE_ATTACK_DIST * 2)
                    tentacle.components.combat:SetAttackPeriod(TUNING.TENTACLE_ATTACK_PERIOD / 0.7)

                    tentacle.components.combat:SetRetargetFunction(GetRandomWithVariance(2, 0.5), retargetfn)
                    tentacle.replica.combat.SoraOldIsValidTarget = tentacle.replica.combat.IsValidTarget
                    tentacle.replica.combat.IsValidTarget = function(s, t) -- 不攻击人类
                        if t and t:IsValid() and (t:HasTag("player") or t:HasTag("companion")) then
                            return false
                        end
                        return s:SoraOldIsValidTarget(t)
                    end
                    TryToRemoveTentacle(reader, tentacle)
                    -- need a better effect
                    SpawnPrefab("splash_ocean").Transform:SetPosition(x, 0, z)
                    ShakeAllCameras(CAMERASHAKE.FULL, .2, .02, .25, reader, 40)
                end

                Sleep(.1)
            end
        end)
        inst:Remove()
        return true
    end
}}

local function MakeMagic(def)
    local bookasses = {Asset("IMAGE", "images/inventoryimages/" .. def.name .. ".tex"),
                       Asset("ATLAS", "images/inventoryimages/" .. def.name .. ".xml")}
    local function fn()
        local inst = CreateEntity()
        -- inst.entity:AddNetwork()
        inst.entity:AddTransform()
        if not TheWorld.ismastersim then
            return inst
        end
        inst.OnBuiltFn = function(inst, doer, ...)
            if doer and doer.components.debuffable and doer.components.debuffable:HasDebuff("myth_mooncake_icebuff") then
                if not doer.mythicecd then
                    doer.mythicecd = {}
                end
                local t = GetTime()
                local cd = AllRecipes and AllRecipes[def.name] and AllRecipes[def.name].character_ingredients[1] and
                               AllRecipes[def.name].character_ingredients[1].amount or 50
                cd = cd / 10
                if doer.mythicecd[def.name] and (t - doer.mythicecd[def.name]) < cd then
                    doer.components.talker:Say("我需要休息一会")
                    return
                end
                doer.mythicecd[def.name] = t
            end
            if doer and doer.components.builder and doer.components.builder.freebuildmode then
                local san = AllRecipes and AllRecipes[def.name] and AllRecipes[def.name].character_ingredients[1] and
                                AllRecipes[def.name].character_ingredients[1].amount or 50
                doer.components.sanity:DoDelta(san)
            end
            def.fn(inst, doer, ...)
        end
        return inst
    end

    return Prefab(def.name, fn, bookasses)
end

local Magics = {}
for i, v in ipairs(Magic_defs) do
    table.insert(Magics, MakeMagic(v))
end
Magic_defs = nil
return unpack(Magics)
