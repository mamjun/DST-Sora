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
]] local MakePlayerCharacter = require "prefabs/player_common"
local soraconfig = require "soraconfig/config"
local fix = require "utils/soraplayerextend"
require "debugtools"
local assets = {Asset("SOUND", "sound/sora.fsb"), -- Asset( "ANIM", "anim/sora.zip" ),
Asset("ANIM", "anim/sora_dress.zip"), Asset("ANIM", "anim/sora_uniforms.zip"), Asset("ANIM", "anim/sora_sllh.zip"),
                Asset("ANIM", "anim/sora_zhizheng.zip"), Asset("ANIM", "anim/sora_hf.zip"),
                Asset("ANIM", "anim/sora_amly.zip"), Asset("ANIM", "anim/sora_gete.zip"),
                Asset("ANIM", "anim/sora_llan.zip"), Asset("ANIM", "anim/sora_mysora.zip"),
                Asset("ANIM", "anim/sora_mysora_r.zip"), Asset("ANIM", "anim/sorahair.zip"),
                Asset("ANIM", "anim/sorahair2.zip"), Asset("ANIM", "anim/sorahair3.zip"),
                Asset("ANIM", "anim/sorahair4.zip"), Asset("ANIM", "anim/ghost_sora_build.zip")}
-- 追加新版本选人提示
if TUNING.GAMEMODE_STARTING_ITEMS then
    if TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT then
        TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.SORA = {"cane_candycane", "cane_ancient", "cane_victorian", "cane_sharp",
                                                       "sorabag", "sora2food"}
    end
    TUNING.STARTING_ITEM_IMAGE_OVERRIDE.sorabag = {
        atlas = "images/inventoryimages/sorabag.xml",
        image = "sorabag.tex"
    }
    TUNING.STARTING_ITEM_IMAGE_OVERRIDE.sora2food = {
        atlas = "images/lavaarena_unlocks.xml",
        image = "locked_creature_details.tex"
    }
    TUNING.SORA_HEALTH = 50
    TUNING.SORA_HUNGER = 75
    TUNING.SORA_SANITY = 100
    STRINGS.CHARACTER_SURVIVABILITY.sora = "迫害队友就完事了"
end

local prefabs = {}
local start_inv = {}
local start_inv_skin = {}
local wlist = require "util/weighted_list"
local soradancingsanity = 20
local testwlist = wlist({
    talk1 = 1,
    talk2 = 2,
    talk3 = 3
})
local function CalcSanityAura(inst)
    return inst.soraindancing * soradancingsanity / 60
end
local function SoraSound(inst, talk, time, tag)
    if inst._soratalk ~= nil then
        inst._soratalk:Cancel()
        inst._soratalk = nil
    end
    inst.SoundEmitter:KillSound("soratalk")
    if tag then
        inst.SoundEmitter:KillSound(tag)
    end
    local name = ""
    if type(talk) == "table" then
        name = talk:getChoice(math.random() * talk:getTotalWeight())
    elseif type(talk) == "string" then
        name = talk
    end
    if name ~= nil then
        inst.SoundEmitter:PlaySound("sora/sound/" .. name, tag or "soratalk")
    end

    if time ~= nil then
        inst._soratalk = inst:DoTaskInTime(time, function()
            inst.SoundEmitter:KillSound(tag or "soratalk")
            inst._soratalk:Cancel()
            inst._soratalk = nil
        end)
    end
end

local foods = require("preparedfoods_sora")
local sorafoods = {}

for k, v in pairs(foods) do
    if v and v.name then
        table.insert(sorafoods, v.name)
    end
end
local function OnSoraSpawn(inst)

    local first = true
    if TheWorld.components.soraexpsave then
        local saveexp = TheWorld.components.soraexpsave:GetExp(inst.userid)
        first = saveexp == -1
        if saveexp > 0 then
            inst:GetExp(saveexp)
        end
    end
    if not first then
        inst.components.sorafl.has = true
    end
    if first and inst.components.inventory ~= nil and inst.components.inventory:GetNumSlots() > 0 then
        local gift = SpawnPrefab("sora3packer")
        if gift then
            local gifts = {}
            -- 给背包
            if TheNet:GetServerGameMode() ~= "quagmire" then
                table.insert(gifts, SpawnPrefab("sorabag"))
            end

            local cane = 0
            -- 手杖 没皮肤给1把 有皮肤给2把
            if ValidateRecipeSkinRequest(inst.userid, "cane", "cane_victorian") then
                table.insert(gifts, SpawnPrefab("cane", "cane_victorian", nil, inst.userid))
                cane = cane + 1
            end
            if ValidateRecipeSkinRequest(inst.userid, "cane", "cane_ancient") then
                table.insert(gifts, SpawnPrefab("cane", "cane_ancient", nil, inst.userid))
                cane = cane + 1
            end
            if ValidateRecipeSkinRequest(inst.userid, "cane", "cane_candycane") then
                table.insert(gifts, SpawnPrefab("cane", "cane_candycane", nil, inst.userid))
                cane = cane + 1
            end
            if ValidateRecipeSkinRequest(inst.userid, "cane", "cane_sharp") then
                table.insert(gifts, SpawnPrefab("cane", "cane_sharp", nil, inst.userid))
                cane = cane + 1
            end
            if ValidateRecipeSkinRequest(inst.userid, "cane", "cane_harlequin") then
                table.insert(gifts, SpawnPrefab("cane", "cane_harlequin", nil, inst.userid))
                cane = cane + 1
            end
            if cane < 2 then
                table.insert(gifts, SpawnPrefab("cane"))
            end
            if TheNet:GetServerGameMode() ~= "quagmire" then
                table.insert(gifts, SpawnPrefab("sora_shousi"))
                for i = 1, 3 do
                    table.insert(gifts, SpawnPrefab(sorafoods[math.random(1, #sorafoods)]))
                end
            end
            -- table.insert(gifts,SpawnPrefab("sora_banhua"))
            gift.components.unwrappable:WrapItems(gifts, inst)
            for k, v in pairs(gifts) do
                if v then
                    v:Remove()
                end
            end
            inst.components.inventory.ignoresound = true
            inst.components.inventory:GiveItem(gift)
            inst.components.inventory.ignoresound = false
        end
    end
    inst.components.builder:AddRecipe("giftwrap")
    inst.components.builder:AddRecipe("mushroom_light")
    inst.components.builder:AddRecipe("mushroom_light2")
    inst.components.builder:AddRecipe("wargshrine")
    inst.components.builder:AddRecipe("perdshrine")
    inst.components.builder:AddRecipe("pigshrine")
    inst.components.builder:AddRecipe("winter_treestand")
    inst.components.builder:AddRecipe("red_mushroomhat")
    inst.components.builder:AddRecipe("blue_mushroomhat")
    inst.components.builder:AddRecipe("green_mushroomhat")
    inst.components.builder:AddRecipe("yotc_carratshrine")
    inst.components.builder:AddRecipe("yotb_beefaloshrine")
    inst.components.builder:AddRecipe("yotr_rabbitshrine")
    -- local session = TheWorld.components.shard or "main"
end

local function applyupgrades(inst, nosay)
    inst.soralevel:set(soraconfig.level.exptolev(inst.soraexp:value()))
    inst.soraexpmax:set(soraconfig.level.expfornextlev(inst.soralevel:value()))
    local hunger_percent = inst.components.hunger:GetPercent()
    local health_percent = inst.components.health:GetPercent()
    local sanity_percent = inst.components.sanity:GetPercent()
    if health_percent <= 0 then
        return
    end
    if inst.SoraSetExtend then
        local up = inst.soralevel:value() * 3
        inst:SoraSetExtend(75 + up, 100 + up, 50 + up)
    else
        -- 饥饿
        inst.components.hunger.max = math.ceil(75 + inst.soralevel:value() * 3) -- 75  + 3*30 = 165
        -- 生命
        inst.components.health.maxhealth = math.ceil(50 + inst.soralevel:value() * 3) -- 50 + 3*30 =140
        -- 精神
        inst.components.sanity.max = math.ceil(100 + inst.soralevel:value() * 3) -- 100 +3 *30 =190
        -- 伤害系数
    end
    inst.components.combat.damagemultiplier = 0.7 + (inst.soralevel:value() * 0.02)
    -- 防御系数
    inst.components.health.absorb = -0.3 + (inst.soralevel:value() * 0.02)
    -- 书籍阅读

    if inst.soralevel:value() > 4 then
        inst:AddTag("sorabook")
    else
        inst:RemoveTag("sorabook")
    end

    -- 通用制作
    if inst.soralevel:value() > 9 then
        inst:AddTag("soraother")
    else
        inst:RemoveTag("soraother")
    end
    -- 专属制作
    if inst.soralevel:value() > 19 then
        inst:AddTag("soraself")
    else
        inst:RemoveTag("soraself")
    end

    -- 制作减半
    if not getsora("zzjb") then
        if inst.soralevel:value() > 24 then
            inst.components.builder.ingredientmod = .5
        else
            inst.components.builder.ingredientmod = 1
            for k, v in pairs(inst.components.inventory.equipslots) do
                if v and v.prefab == "greenamulet" then
                    inst.components.builder.ingredientmod = .5
                end
            end

        end

        if inst.components.allachivcoin then
            if inst.components.allachivcoin.buildmaster then
                inst.components.builder.ingredientmod = .5
            end

        end
        if inst.components.achievementability then
            if inst.components.achievementability.buildmaster then
                inst.components.builder.ingredientmod = .5
            end
        end
    end
    -- 保持百分比不变
    if not inst.soraloading then
        inst.components.hunger:SetPercent(hunger_percent)
        inst.components.health:SetPercent(health_percent)
        inst.components.sanity:SetPercent(sanity_percent)
    end
    for k, v in ipairs(SoraTags) do
        if not inst:HasTag(v) then
            inst:AddTag(v)
        end
    end
    if not inst:HasTag("reader") then
        inst:AddTag("reader")
    end
    if not inst.components.reader then
        inst:AddComponent("reader")
    end
    inst:RemoveTag("scarytoprey")
end
local function ReFreshExp(inst)
    local per = soraconfig.level.expper(inst.soraexp:value())
    inst.soraexpper:set(per)
    inst.ReFreshExpTask = inst:DoTaskInTime(math.random(30, 60), ReFreshExp)
    -- body
end

local function GetExp(inst, num, code, dmaxexp, once)
    -- 获得经验
    if once then
        if not inst.soraonceexp[code] then
            inst.soraonceexp[code] = num
        else
            num = 0
        end
    else
        local maxexp = dmaxexp or 120
        local t = TheWorld.state.cycles
        if (t ~= inst.soraday) then
            local olddayexp = inst.soradayexp -- getexppatch
            inst.soradayexp = {}
            for k, v in pairs(olddayexp) do
                if k and v and v >= (maxexp * 0.9) then
                    inst.soradayexp[k] = math.random(maxexp * 0.6, maxexp * 0.8)
                else
                    inst.soradayexp[k] = math.random(0, maxexp * 0.2)
                end
            end
            inst.soraday = t
        end
        if code then
            if not inst.soradayexp[code] then
                inst.soradayexp[code] = 0
            end
            if (inst.soradayexp[code] + num > maxexp) then
                num = math.min(math.max(0, maxexp - inst.soradayexp[code]), num)
            end
            inst.soradayexp[code] = inst.soradayexp[code] + num
        end

    end
    if num == 0 then
        return
    end
    inst.soraexp:set(math.max(0, inst.soraexp:value() + num))
    if inst.soralevel:value() < 30 and inst.soraexp:value() >= soraconfig.level.expfornextlev(inst.soralevel:value()) or
        num <= 0 then
        applyupgrades(inst, true)
        ReFreshExp(inst)
    end
    inst.soraexpget = inst.soraexpget + num
    if inst.soraexpget > 1000 then
        inst.soraexpget = 0
        applyupgrades(inst, true)
        ReFreshExp(inst)
    end
    TheWorld.components.soraexpsave:SetExp(inst.userid, inst.soraexp:value())
end

local function onbecamehuman(inst)
    -- 复活时恢复属性
    applyupgrades(inst)
end
local deathlist = wlist({
    death1 = 1,
    death2 = 1,
    death3 = 1
})
local function onbecameghost(inst)
    -- 死亡损失当前等级30%经验
    if inGamePlay then
        GetExp(inst, soraconfig.level.DeathExp(inst.soralevel:value()))
        SoraSound(inst, deathlist)
    end
end
local function onunequip(inst)
    -- 复活时恢复属性
    applyupgrades(inst, true)
end
local function onload(inst, data)
    if data and inst.components.sorasave then
        inst.components.sorasave:OnLoad(data)
    end
    if data and data.health and data.health.base_health then
        inst.components.health.base_health = 50

    end
end

local function soracaneat(inst, food)
    if food ~= nil then
        if food.components.perishable and
            (food.components.perishable:IsStale() or food.components.perishable:IsSpoiled()) then
            return false
        end
        if soraconfig.cannoteat[string.lower(food.prefab)] then
            return false
        end
        if soraconfig.cannoteatfn and soraconfig.cannoteatfn(inst, food) then
            return false
        end
    end
    return true
end

local notpick = {
    statueglommer = 1,
    neverfadebush = 1,
    plant_certificate = 1,
    medal_wormwood_flower = 1
}
-- 双倍采集
local function onpick(inst, data)
    GetExp(inst, 2, "pick")
    if data.object.plant_def and data.object.components.plantresearchable and
        data.object.components.pickable.use_lootdropper_for_product then
        if data.object.is_oversized then
            inst:GetExp(20, data.object.plant_def.product_oversized, nil, true)
            inst:GetExp(20, "crop_big")
        else
            inst:GetExp(10, data.object.plant_def.product, nil, true)
            inst:GetExp(10, "crop")
        end

    end
    if not getsora("sbcj") then
        if inst.soralevel:value() > 14 and data.object and data.object.components.pickable and
            not data.object.components.trader then
            if data.object.plant_def and data.object.components.plantresearchable and
                data.object.components.pickable.use_lootdropper_for_product then
                local loot = {}
                for _, prefab in ipairs(data.object.components.lootdropper:GenerateLoot()) do
                    table.insert(loot, data.object.components.lootdropper:SpawnLootPrefab(prefab))
                end
                if not next(loot) and next(data.loot) then
                    for k, v in pairs(data.loot) do
                        if v and v.prefab then
                            table.insert(loot, data.object.components.lootdropper:SpawnLootPrefab(v.prefab))
                        end
                    end
                end
                for i, item in ipairs(loot) do
                    if item.components.inventoryitem ~= nil then
                        inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
                    end
                end
            elseif data.object.components.pickable.product ~= nil and not notpick[data.object.prefab] then
                local item = SpawnPrefab(data.object.components.pickable.product)
                if item.components.stackable then
                    item.components.stackable:SetStackSize(data.object.components.pickable.numtoharvest)
                end
                inst.components.inventory:GiveItem(item, nil, data.object:GetPosition())
                if (data.object.prefab == "cactus" or data.object.prefab == "oasis_cactus") and data.object.has_flower then
                    local item2 = SpawnPrefab("cactus_flower")
                    inst.components.inventory:GiveItem(item2, nil, data.object:GetPosition())
                end
            end
        end
    end
end

local function onkill(inst, data)
    GetExp(inst, 5, "kill", 50)
    GetExp(inst, 50, data.victim.prefab, nil, true)
    if not getsora("sbdl") then
        if inst.soralevel:value() > 29 and data.victim.components.lootdropper and not data.victim:HasTag("SoraKill") then
            if data.victim.components.freezable or data.victim:HasTag("monster") then
                data.victim.components.lootdropper:DropLoot()
                data.victim:AddTag("SoraKill")
            end
        end
    end
end
local function onattack(inst, data)
    GetExp(inst, 2, "attack", 50)
end
local function onmake(inst, data)
    if data and data.item then
        GetExp(inst, 3, "make")
        GetExp(inst, 20, data.item.prefab, nil, true)
    end
end
local function oncook(inst, data)
    GetExp(inst, 3, "cook")
    GetExp(inst, 20, data.cookitem.prefab, nil, true)
end
local function onbuild(inst, data)
    if data and data.item then
        GetExp(inst, 20, "build")
        GetExp(inst, 20, data.item.prefab, nil, true)
    end
end
local function onrepair(inst, data)
    GetExp(inst, 20, "repair")
end
local function onsorarepair(inst, data)
    GetExp(inst, 20, "sorarepair")
end
local function ondeployitem(inst, data)
    GetExp(inst, 3, "deployitem")
end

local function onfinishedwork(inst, data)
    if data.target and data.target.components.workable then
        if data.target.components.workable.action == ACTIONS.CHOP then
            GetExp(inst, 2, "chop")
        end
        if data.target.components.workable.action == ACTIONS.MINE then
            GetExp(inst, 3, "mine")
        end
        if data.target.components.workable.action == ACTIONS.DIG then
            GetExp(inst, 3, "dig")
        end
        if data.target.components.workable.action == ACTIONS.NET then
            GetExp(inst, 10, "net")
        end
    end
end
local function onfish(inst, data)
    GetExp(inst, 10, "fish")
    if inst.soralevel:value() > 14 and data.fish then
        local item = SpawnPrefab(data.fish.prefab)
        if item.components.weighable then
            item.components.weighable:SetPlayerAsOwner(inst)
        end
        local pos = inst:GetPosition()
        item.Transform:SetPosition(pos:Get())
    end
end

local function emoteplants(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 15, nil, nil, {"tendable_farmplant"})
    for k, v in pairs(ents) do
        if v.components.farmplanttendable ~= nil then
            v.components.farmplanttendable:TendTo(inst)
        end
    end
end
local emotesoundlist = {
    emote = "emote",
    emoteXL_waving1 = "wave", -- wave
    emoteXL_facepalm = "facepalm", -- facepalm
    research = "joy", -- joy
    emoteXL_sad = "cry", -- cry
    emoteXL_annoyed = "no", -- nosay
    emoteXL_waving4 = "rude", -- rude
    emote_pre_sit1 = "squat", -- squat
    emote_pre_sit2 = "sit", -- sit
    emoteXL_angry = "angry", -- angry
    emoteXL_happycheer = "happy", -- happy
    emoteXL_bonesaw = "bonesaw", -- bonesaw
    emoteXL_kiss = "kiss", -- kiss
    pose = wlist({
        pose1 = 1,
        pose2 = 1,
        pose3 = 1
    }), -- pose
    emote_fistshake = "fistshake", -- fistshake
    emote_flex = "flex", -- flex
    emoteXL_pre_dance7 = "step", -- step
    emoteXL_pre_dance0 = "dance", -- dance
    emoteXL_pre_dance8 = "robot", -- robot
    emoteXL_pre_dance6 = "chicken", -- chicken
    emote_swoon = "swoon", -- swoon
    carol = wlist({
        carol1 = 5,
        carol2 = 1,
        carol3 = 1,
        carol4 = 1,
        carol5 = 1
    }), -- carol
    emote_slowclap = "slowclap", -- slowclap
    emote_shrug = "shrug", -- shrug
    emote_laugh = "laugh", -- laugh
    emote_jumpcheer = "cheer", -- cheer
    emote_impatient = "impatient", -- impatient
    eye_rub_vo = "sleepy", -- sleepy
    emote_yawn = "yawn" -- yawn
}
local function onnewstate(inst, data)

    if inst.sg.currentstate.name ~= "emote" then
        if inst._soratalk ~= nil then
            inst._soratalk:Cancel()
            inst._soratalk = nil
        end
        if inst.emotefn then
            inst.emotefn:Cancel()
            inst.emotefn = nil
        end

        inst.SoundEmitter:KillSound("sorabgm")
        inst.components.sanity.dapperness = inst.components.sanity.dapperness - inst.soraindancing * soradancingsanity /
                                                60
        inst.soraindancing = 0
        inst:RemoveEventCallback("newstate", onnewstate)
    end
end
local function ontilling(inst, data)
    GetExp(inst, 10, "till", 100)
end
local function onemote(inst, data)
    GetExp(inst, 5, "emote", 20)
    local soundname = data.soundoverride or
                          (type(data.anim) == "table" and
                              (type(data.anim[1]) == "table" and data.anim[1][1] or data.anim[1])) or
                          (type(data.anim) == "string" and data.anim) or "emote"
    local loop = data.loop
    local sound = "emote"
    sound = emotesoundlist[soundname] or "emote"
    if soundname == "carol" or sound == "dance" or sound == "step" or sound == "robot" or sound == "chicken" then
        inst.components.sanity.dapperness = inst.components.sanity.dapperness - inst.soraindancing * soradancingsanity /
                                                60
        inst.soraindancing = (sound == "dance") and 1 or 1.5
        -- print(inst.components.sanity.dapperness)
        inst.components.sanity.dapperness = inst.components.sanity.dapperness + inst.soraindancing * soradancingsanity /
                                                60
        if not inst.components.sanityaura then
            inst:AddComponent("sanityaura") -- 回SAN光环
        end
        inst.components.sanityaura.aurafn = CalcSanityAura
        inst:ListenForEvent("newstate", onnewstate)
        if inst.emotefn then
            inst.emotefn:Cancel()
            inst.emotefn = nil
        end

        inst.emotefn = inst:DoTaskInTime(3, emoteplants)
        SoraSound(inst, sound, nil, "sorabgm")
    else
        SoraSound(inst, sound, nil)
    end
end
local talklist = wlist({
    talk1 = 50,
    talk2 = 5,
    talk3 = 5,
    talk4 = 50,
    talk5 = 5,
    talk6 = 50,
    talk7 = 5,
    talk8 = 5,
    talk9 = 50,
    talk10 = 2,
    talk11 = 5,
    talk12 = 50,
    talk13 = 5,
    talk14 = 2,
    talk15 = 5,
    talk16 = 5,
    talk17 = 2,
    talk18 = 3,
    talk19 = 2,
    talk20 = 5
})
local ghosttalklist = wlist({
    ghosttalk1 = 1,
    ghosttalk2 = 1,
    ghosttalk3 = 1
})
local function ontalk(inst, data)
    if not inst:HasTag("playerghost") then
        SoraSound(inst, talklist)
    else
        SoraSound(inst, ghosttalklist)
    end
end
-- 服务端和客户端都会执行
local common_postinit = function(inst)
    -- 选择声音
    inst:AddTag("reader")
    inst.soundsname = "sora"
    inst:AddTag("sora")
    inst:AddTag("sorabuilder")
    inst:AddTag("cryo")
    inst:RemoveTag("scarytoprey")
    if TheNet:GetServerGameMode() == "quagmire" then
        inst:AddTag("quagmire_cheapskate")
    end
    -- 小地图图标
    inst.MiniMapEntity:SetIcon("sora.tex")
    inst.soralevel = net_int(inst.GUID, "sora_level", "soraexpdirty")

    inst.soraexplocal = 0
    inst.soraexp = {
        value = function()
            return inst.soraexplocal
        end,
        set = function(a, b, v)
            inst.soraexplocal = b
        end,
        setlocal = function()
            inst.soraexplocal = b
        end
    }
    inst.soraexpmax = net_int(inst.GUID, "sora_expmax", "soraexpdirty")
    inst.soraexpper = net_int(inst.GUID, "sora_expper", "soraexpdirty")
    inst.AnimState:SetBuild("sora_uniforms")
    inst.AnimState:AddOverrideBuild("player_idles_wendy")
end
local function tokill(inst)
    if inst and inst.components.health and not inst.components.health:IsDead() then
        inst.components.health:Kill()
    end
end
local master_postinit = function(inst)
    inst.soundsname = "sora"
    inst.customidleanim = "idle_wendy"
    -- MDZZ了
    inst.soraexpget = 0
    inst.soraday = -100
    inst.soradayexp = {}
    inst.soraonceexp = {}
    inst.GetExp = GetExp
    inst.components.talker.ontalkfn = ontalk
    -- inst:ListenForEvent("ms_playerdespawnanddelete", ondespawn,TheWorld)
    inst:ListenForEvent("picksomething", onpick)
    inst:ListenForEvent("builditem", onmake)
    inst:ListenForEvent("buildstructure", onbuild)
    inst:ListenForEvent("killed", onkill)
    inst:ListenForEvent("emote", onemote)
    inst:ListenForEvent("onhitother", onattack)
    inst:ListenForEvent("tilling", ontilling)
    inst:ListenForEvent("working", onfinishedwork)
    inst:ListenForEvent("cookitem", oncook)
    inst:ListenForEvent("repair", onrepair)
    inst:ListenForEvent("sorarepair", onsorarepair)
    inst:ListenForEvent("deployitem", ondeployitem)
    inst:ListenForEvent("fishingcollect", onfish)
    -- inst:ListenForEvent("harvestsomething", onharvest)
    inst:ListenForEvent("unequip", onunequip)
    -- inst:AddComponent("soraanimreplica")

    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("death", onbecameghost)

    inst:ListenForEvent("death", function(inst, data)
        if data and data.afflicter and data.afflicter:IsValid() and data.afflicter.components.health and
            not data.afflicter.components.health:IsDead() then
            local killer = data.afflicter.components.follower and data.afflicter.components.follower:GetLeader() or
                               data.afflicter:HasTag("player") and data.afflicter or nil
            if killer and killer:HasTag("player") and killer ~= inst then
                killer.components.health:Kill() -- 要死一起死
            end
        end
    end)
    inst:ListenForEvent("healthdelta", function(inst, data)
        if data and data.afflicter and data.afflicter:IsValid() and data.afflicter.components.health and
            not data.afflicter.components.health:IsDead() then
            local killer = data.afflicter.components.follower and data.afflicter.components.follower:GetLeader() or
                               data.afflicter:HasTag("player") and data.afflicter or nil
            if killer and killer:HasTag("player") and not killer:HasTag("sora") and killer ~= inst then
                for k = 1, 30 do
                    killer.components.health:DoDelta(10 * data.amount, nil, nil, true, killer, true) -- 300倍反伤
                end
                if killer.components.oldager then
                    killer.components.oldager.damage_per_second = 3000
                end
            end
        end
    end)
    inst:AddComponent("reader")
    inst:DoTaskInTime(0.1, function()
        if inst.components.eater then
            inst.components.eater.PrefersToEat = soracaneat
        end
    end)
    -- 科技一本
    inst.components.builder.science_bonus = 1
    -- 魔法一本
    inst.components.builder.magic_bonus = 2
    -- inst:DoPeriodicTask(1,function(inst) inst.components.talker:Say("aaa") end)
    inst.components.health:SetMaxHealth(50)
    inst.components.hunger:SetMax(75)
    inst.components.sanity:SetMax(100)
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "sora", 1.25)
    -- inst.components.locomotor.walkspeed = 5
    -- inst.components.locomotor.runspeed = 7
    inst.components.combat.damagemultiplier = 0.7

    inst.components.combat.overrideattackkeyfn = function()
        return "cryo"
    end
    local oldhealthdodelta = inst.components.health.DoDelta
    inst.components.health.DoDelta = function(self,num,...)
        local oldclamp = math.clamp
        if num and num <-200 then    --致死伤害
            num = num <-20000 and  0  or -10 
        end
        math.clamp = function(v, min, max, ...)
            if v > 1 and min == 0 and max == 1 then
                max = 999
            end
            return oldclamp(v, min, max, ...)
        end
        oldhealthdodelta(self,num,...)
        math.clamp = oldclamp
    end
    -- 走路速度
    fix(inst, 75, 100, 50)
    applyupgrades(inst)
    -- 回复精神
    inst.soraindancing = 0
    -- inst:AddComponent("sanityaura") --回SAN光环
    -- inst.components.sanityaura.aurafn = CalcSanityAura
    local EquipHasTag = inst.components.inventory.EquipHasTag
    local moretag = {
        bramble_resistant = true
    }
    inst.components.inventory.EquipHasTag = function(self, tag)
        return moretag[tag] or EquipHasTag(self, tag)
    end

    inst.components.sanity.dapperness = -5 / 60
    inst.components.sanity:AddSanityAuraImmunity("tentacle")
    if GetModConfigData("foodmemory", TUNING.SORAMODNAME) and inst.components.eater then
        inst:AddComponent("sorafoodmemory")
        local oldEat = inst.components.eater.Eat
        inst.components.eater.Eat = function(eater, food, feeder, ...)
            local oldhungerabsorption = eater.hungerabsorption

            eater.hungerabsorption = eater.inst.components.sorafoodmemory:SoraGetFoodMultiplier(food)
            -- print(oldhungerabsorption,eater.hungerabsorption)
            local r = oldEat(eater, food, feeder, ...)
            eater.hungerabsorption = oldhungerabsorption

            if food then
                inst.components.sorafoodmemory:SoraRememberFood(food)
            end
            return r
        end
        inst.components.foodmemory = inst.components.sorafoodmemory
    end
    if inst.components.eater then
        -- fixeat
        local original_Eat = SoraUp.Get(inst.components.eater.Eat, "original_Eat")
        if type(original_Eat) == "function" then
            inst.components.eater.Eat = original_Eat
        end
    end
    inst:AddComponent("soraglobalsave")
    inst:AddComponent("sorafl")
    inst.SoraSound = SoraSound
    inst.wlist = wlist
    inst:AddComponent("sorasave")
    -- inst:RemoveComponent("cursable")        --谁爱变谁变去
    inst.components.cursable.ApplyCurse = function(s, it, cur, ...)
        if it and it:AddTag("applied_curse") then
            it:RemoveTag("applied_curse")
        end
        if it.components.curseditem then
            it.components.curseditem.target = nil
        end
        if it.findplayertask then
            it.findplayertask:Cancel()
            it.findplayertask = nil
        end
    end
    inst.components.cursable.RemoveCurse = function()
    end

    inst.components.cursable.IsCursable = function()
        return false
    end
    inst:DoTaskInTime(0, applyupgrades)
    inst.ReFreshExpTask = inst:DoTaskInTime(5, ReFreshExp)
    inst.components.combat.attackrange = 3
    inst.components.combat.hitrange = 4
    inst.OnLoad = onload
    inst.OnNewSpawn = OnSoraSpawn
    local PushEvent = inst.PushEvent
    inst.PushEvent = function(i, name, data, ...)
        if name == "death" then
            if data and data.cause == "elaina_snapping_finger" then -- 谁爱死谁死
                if SoraAPI.LastWB or data.afflicter then -- 你挖的宝是吧 
                    local wb = data.afflicter or SoraAPI.LastWB
                    if wb:HasTag("sora") then
                        return
                    end
                    local k = "elaina_snapping_finger"
                    if wb:HasTag("elaina") or wb:HasTag("ccs") then -- 魔女姐姐原来是你啊
                        if wb.components.locomotor then
                            wb.components.locomotor:SetExternalSpeedMultiplier(wb, k, 0.7)
                        end
                        if wb.components.combat then
                            wb.components.combat.externaldamagemultipliers:SetModifier(k, 0.5, k)
                            wb.components.combat.externaldamagetakenmultipliers:SetModifier(k, 2, k)
                        end
                    end
                    -- 其他自裁3次吧
                    wb:DoTaskInTime(60, tokill)
                    wb:DoTaskInTime(300, tokill)
                    wb:DoTaskInTime(600, tokill)
                end
                return
            end
        end
        return PushEvent(i, name, data, ...)
    end
end
-- 乱动皮肤的后果自负！！！

local function MakeSkin(name, data, notemp)
    local d = {}
    d.rarity = "总之就是非常可爱"
    d.rarityorder = 90
    d.raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1}
    d.release_group = -1001
    d.skin_tags = {"BASE", "sora", "CHARACTER"}
    d.skins = {
        normal_skin = name,
        ghost_skin = "ghost_sora_build"
    }
    d.checkfn = SoraAPI.SoraSkinCheckFn
    d.checkclientfn = SoraAPI.SoraSkinCheckClientFn
    d.share_bigportrait_name = "sora"
    d.FrameSymbol = "Reward"
    for k, v in pairs(data) do
        d[k] = v
    end
    SoraAPI.MakeCharacterSkin("sora", name, d)
    if not notemp then
        local d2 = shallowcopy(d)
        d2.rarity = "限时体验"
        d2.rarityorder = 80
        d2.raritycorlor = {0.957, 0.769, 0.188, 1}
        d2.FrameSymbol = "heirloom"
        d2.name = data.name .. "(限时)"
        SoraAPI.MakeCharacterSkin("sora", name .. "_tmp", d2)
    end
end
MakeSkin("sora_none", {
    name = "优等生",
    des = '我是好孩子吧\n对吧?\n我要奖励！',
    quotes = '我的名字是"春日野穹"',
    skins = {
        normal_skin = "sora_uniforms",
        ghost_skin = "ghost_sora_build"
    },
    build_name_override = "sora_uniforms"
}, true)

MakeSkin("sora_dress", {
    name = "连衣长裙",
    des = '悠!快出來...\n你在哪儿?\n  ----感谢赏玩',
    quotes = '悠......'
})
MakeSkin("sora_gete", {
    name = "哥特萝莉",
    des = '我.....绝对永远.....\n会和你在一起的.......\n  ----献给那些持续支持的人们',
    quotes = '最喜欢悠了'
})

MakeSkin("sora_llan", {
    name = "llan",
    des = "世间美好，不过松花酿酒，春水煎茶"
})

MakeSkin("sora_zhizheng", {
    name = "执政官",
    des = '愿我的世界总有你\n  ----献给那些热心奉献的人们',
    quotes = '请遵从我的指令'
})
MakeSkin("sora_sllh", {
    name = "神里 穹华",
    des = '「若知是梦何须醒，不比真如一相会。」',
    quotes = '神里穹华,参上!'
})
MakeSkin("sora_amly", {
    name = "艾米莉亚Cos",
    des = '我的名字是艾米莉亚\n只是艾米莉亚哦',
    quotes = '只是艾米莉亚哦'
})

MakeSkin("sora_hf", {
    name = "关雎",
    des = '关关雎鸠，在河之洲。\n窈窕淑女，君子好逑。',
    quotes = '悠...我在等你...'
})

return MakePlayerCharacter("sora", prefabs, assets, common_postinit, master_postinit, start_inv)
