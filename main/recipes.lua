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
]] -- 添加物品栏
local TechTree = require("techtree")
local InvImg = {}
rec_back = "_build_sora"
local AllSoraRec = {}
local recmode = GetModConfigData("recmode") > 0 and GetModConfigData("recmode") or mode
function AddInvImg(key, xml, tex)
    InvImg[key] = {"images/" .. xml .. ".xml", (tex or key) .. ".tex"}
end
function AddInvImg2(key, xml, tex)
    InvImg[key] = {xml, tex or (key .. "tex")}
end
local san = CHARACTER_INGREDIENT.SANITY

local smart = require "utils/sorasmartfilter"
function RecTab(name, des, img, sxml, stex)
    local xml = sxml or "images/inventoryimages/" .. img .. ".xml"
    local tex = stex or img .. ".tex"
    AddRecipeFilter({
        name = name,
        atlas = xml,
        image = tex
    })
    STRINGS.UI.CRAFTING_FILTERS[name:upper()] = des
    smart(name, "sora")
    return name:upper()
end
local prefabhas = {}
function Rec(prefab, name, des, tab, tag, ings, data) -- 添加配方
    name = name or ""
    local build = prefab:lower() .. rec_back
    if prefabhas[prefab] then
        prefabhas[prefab] = prefabhas[prefab] + 1
        build = build .."_" .. tostring(prefabhas[prefab])
    else
        prefabhas[prefab] = 1
    end
    des = des or ""

    local BUILD = build:upper()
    local PREFAB = prefab:upper()
    local recings = {}
    if #ings > 0 then -- 是数组 则区分难度
        ings = ings[recmode]
    end
    for k, v in pairs(ings) do
        table.insert(recings, Ingredient(k, v))
    end
    local config = {}
    config.min_spacing = 1
    config.product = prefab
    config.builder_tag = tag
    tab = type(tab) == "table" and tab or {tab}
    local rec = AddRecipe2(build, recings, TECH.NONE, config, tab)
    if InvImg[prefab] then
        rec.image = InvImg[prefab][2]
        rec.atlas = softresolvefilepath(InvImg[prefab][1])
    else
        rec.image = prefab .. ".tex"
        rec.atlas = softresolvefilepath("images/inventoryimages/" .. prefab .. ".xml")
    end

    STRINGS.NAMES[PREFAB] = STRINGS.NAMES[PREFAB] or name
    STRINGS.NAMES[BUILD] = STRINGS.NAMES[BUILD] or STRINGS.NAMES[PREFAB] or name
    STRINGS.CHARACTERS.GENERIC.DESCRIBE[PREFAB] = STRINGS.CHARACTERS.GENERIC.DESCRIBE[PREFAB] or des
    STRINGS.RECIPE_DESC[PREFAB] = STRINGS.RECIPE_DESC[PREFAB] or des

    -- rec.description = des or STRINGS.RECIPE_DESC[PREFAB]
    AllSoraRec[prefab] = rec
    return rec
end
AddSimPostInit(function()
    for k, v in pairs(AllSoraRec) do
        if v and v.ingredients then
            for ik, iv in pairs(v.ingredients) do
                local ingxml = SoraGetImage(iv.type)
                if ingxml and ingxml:match("images/inventoryimages/") then
                    iv.atlas = softresolvefilepath(ingxml)
                end
            end
        end
        if v.placer == "no" then
            v.placer = nil
        elseif GLOBAL.Prefabs[v.product .. "_helper_placer"] then
            v.placer = v.product .. "_helper_placer"
        elseif GLOBAL.Prefabs[v.product .. "_placer"] then
            v.placer = v.product .. "_placer"
        end
    end
end)
-- root = RecTab("SoraRootTab","小穹","soratab")
skill = RecTab("SoraSkillTab", "魔法", "sora_magics")
equip = RecTab("SoraEquipTab", "装备", "soraclothes")
equip2 = RecTab("SoraEquip2Tab", "工具人套装", "sora_tab_tools")
item = RecTab("SoraItemTab", "道具", "sora_tab_items")
build = RecTab("SoraBuildTab", "建筑", "sora_tab_build")
soralight = RecTab("SoraLightTab", "玫瑰", nil, "images/inventoryimages/sora_light/sora_light_rainbow.xml",
    "sora_light_rainbow.tex")
DST = RecTab("SoraDSTTab", "知识", "sora_tab_knows")
maker = RecTab("SoraMakerTab", "奇怪的知识", "sora_tab_knows2")
itembuff = RecTab("SoraItemBuffTab", "药剂", "sora2ry")
-- DSTlight = RecTab("SoraDSTlightTab","圣诞彩灯",nil,"images/inventoryimages.xml","winter_ornament_light1.tex")

if IsMythEnable() then
    AddInvImg("myth_flyskill_sora", "inventoryimages/mk_cloudfxsora", "mk_cloudfxsora")
    Rec("myth_flyskill_sora", "七彩祥云", "待我脚踏七彩祥云", skill, "sora", {
        [san] = 15
    }).level = TechTree.Create(TECH.LOST)
    Rec("myth_flyskill", nil, nil, {CRAFTING_FILTERS.CHARACTER.name}, "soraflyer", {
        [san] = 15
    }).level = TechTree.Create(TECH.LOST)
end

Rec("sorapocky", "百奇", "看起来很好吃", item, "sora", {{
    berries = 6
}, {
    berries = 4,
    honey = 1,
    bird_egg = 1
}, {
    berries = 4,
    bird_egg = 2,
    honey = 4
}})

Rec("sorarepairer", "穹の缝纫包", "缝缝补补又三年", item, "sora", {{
    silk = 4,
    goldnugget = 1
}, {
    silk = 6,
    goldnugget = 2
}, {
    silk = 10,
    goldnugget = 3
}}).numtogive = 4

Rec("sorarepairer", "穹の缝纫包", "缝缝补补又三年", item, "sora", {{
    spider = 1,
    goldnugget = 1
}, {
    spider = 2,
    goldnugget = 2
}, {
    spider = 3,
    goldnugget = 3
}}).numtogive = 4


Rec("sorabag", "穹の包", "小穹的四次元背包", equip, "soraself", {{
    goose_feather = 5,
    beefalowool = 6,
    silk = 8
}, {
    goose_feather = 10,
    beefalowool = 20,
    silk = 20
}, {
    goose_feather = 40,
    feather_crow = 20,
    feather_robin = 20,
    purplegem = 4
}})

Rec("soraclothes", "穹の护", "小穹的贴身守护", equip, "soraself", {{
    goose_feather = 5,
    dragon_scales = 1,
    sorarepairer = 20
}, {
    goose_feather = 10,
    dragon_scales = 2,
    sorarepairer = 40
}, {
    goose_feather = 40,
    feather_canary = 40,
    sorarepairer = 160
}})

Rec("sorahat", "穹の冠", "小穹的王冠", equip, "soraself", {{
    feather_canary = 5,
    feather_robin = 10,
    feather_robin_winter = 10,
    sorarepairer = 20
}, {
    feather_canary = 10,
    feather_robin = 20,
    feather_robin_winter = 20,
    sorarepairer = 40
}, {
    goose_feather = 80,
    feather_canary = 80,
    feather_robin = 80,
    feather_robin_winter = 80
}})

Rec("soramagic", "穹の空", "毁灭吧！世界！", equip, "soraself", {{
    firestaff = 1,
    goldnugget = 10,
    redgem = 3,
    dragon_scales = 1
}, {
    firestaff = 2,
    goldnugget = 20,
    redgem = 6,
    dragon_scales = 2
}, {
    firestaff = 4,
    transistor = 40,
    redgem = 10,
    dragon_scales = 4
}})

STRINGS.NAMES.SORAHEALSTAR = "治愈之星"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SORAHEALSTAR = "治愈之星！"
Rec("sorahealing", "穹の愈", "复苏吧！朋友！", equip, "soraself", {{
    greenstaff = 1,
    bandage = 10,
    greengem = 3,
    petals = 40
}, {
    greenstaff = 2,
    bandage = 20,
    greengem = 6,
    petals = 80
}, {
    greenstaff = 4,
    bandage = 40,
    greengem = 10,
    petals = 400
}})

Rec("sorapick", "穹の采", "欢呼吧！丰收！", equip, "soraself", {{
    orangeamulet = 1,
    livinglog = 10,
    orangegem = 3,
    flint = 100
}, {
    orangeamulet = 2,
    livinglog = 20,
    orangegem = 6,
    flint = 200
}, {
    orangeamulet = 4,
    livinglog = 40,
    orangegem = 10,
    flint = 1000
}})

Rec("soratele", "穹の瞬", "扭曲吧！空间！", equip, "soraself", {{
    orangestaff = 1,
    moonrocknugget = 10,
    purplegem = 3,
    feather_canary = 10
}, {
    orangestaff = 2,
    moonrocknugget = 20,
    purplegem = 6,
    feather_canary = 20
}, {
    orangestaff = 4,
    moonrocknugget = 40,
    purplegem = 10,
    feather_canary = 100
}})

Rec("sorabowknot", "穹の二次元蝴蝶结", "装下全世界！", equip, "soraself", {{
    butterfly = 10,
    glommerwings = 3,
    opalpreciousgem = 1
}, {
    butterfly = 20,
    glommerwings = 5,
    opalpreciousgem = 3
}, {
    butterfly = 40,
    glommerwings = 10,
    opalpreciousgem = 5
}})

STRINGS.NAMES.SORA3PACKER = "穹の礼物"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SORA3PACKER = [[来自Sora的礼物]]
AddInvImg("sora2pack", "inventoryimages/sora2pack_1", "sora2pack_1")
Rec("sora2pack", "穹の打包纸", "打包什么好呢！", item, "soraother", {{
    papyrus = 4,
    purplegem = 1,
    petals = 10
}, {
    papyrus = 6,
    purplegem = 1,
    petals = 20
}, {
    papyrus = 10,
    purplegem = 1,
    petals = 60
}}).numtogive = 2 + mode * 2

Rec("sora2plant", "扶光", "又要迫害X了对吧", equip2, "sorabook", {{
    bee = 5,
    petals = 20,
    mole = 2,
    mandrake = 1
}, {
    bee = 10,
    petals = 80,
    mole = 3,
    mandrake = 1
}, {
    bee = 40,
    petals = 200,
    mole = 5,
    mandrake = 2
}})

Rec("sora2sword", "奇妙法杖", "一个奇妙法杖！", equip2, "soraother", {{
    goldenshovel = 2,
    hammer = 2,
    purplegem = 1
}, {
    goldenshovel = 4,
    hammer = 4,
    purplegem = 1
}, {
    goldenshovel = 6,
    hammer = 6,
    purplegem = 2
}})

Rec("sora2prop", "神奇法杖", "打飞你的医保卡！", equip2, "soraother", {{
    livinglog = 20,
    hammer = 2
}, {
    livinglog = 40,
    hammer = 4
}, {
    livinglog = 60,
    hammer = 6
}})

Rec("sora3sword", "银白の锋", "银白骑士团の制式长剑", equip2, "soraother", {{
    nightsword = 1,
    tentaclespike = 2,
    batbat = 1
}, {
    nightsword = 3,
    tentaclespike = 4,
    batbat = 1
}, {
    nightsword = 5,
    tentaclespike = 6,
    batbat = 3
}})

Rec("sora2bag", "银白の翼", "银白骑士团の制式羽翼", equip2, "soraother", {{
    ice = 80,
    transistor = 10,
    bluegem = 1
}, {
    ice = 200,
    transistor = 20,
    bluegem = 3
}, {
    ice = 400,
    transistor = 40,
    bluegem = 5
}})

Rec("sora2armor", "银白の甲", "银白骑士团の制式战甲！", equip2, "soraother", {{
    marble = 5,
    sorarepairer = 5,
    purplegem = 1
}, {
    marble = 10,
    sorarepairer = 10,
    purplegem = 1
}, {
    marble = 20,
    sorarepairer = 20,
    purplegem = 1
}})

Rec("sora2hat", "银白の盔", "银白骑士团の制式战盔！", equip2, "soraother", {{
    goldnugget = 5,
    sorarepairer = 5,
    purplegem = 1
}, {
    goldnugget = 10,
    sorarepairer = 10,
    purplegem = 1
}, {
    goldnugget = 20,
    sorarepairer = 20,
    purplegem = 1
}})

Rec("sora2amulet", "荣誉勋章", "银白骑士团の荣耀勋章！", equip2, "soraother", {{
    amulet = 1,
    blueamulet = 1,
    purpleamulet = 1
}, {
    amulet = 2,
    blueamulet = 2,
    purpleamulet = 2
}, {
    amulet = 3,
    blueamulet = 3,
    purpleamulet = 3
}})

Rec("sora2ice", "寒冰の箱子", "嘎嘣脆，鸡肉味！", build, "soraother", {{
    boards = 10,
    cutstone = 10,
    ice = 80
}, {
    boards = 20,
    cutstone = 20,
    bluegem = 6
}, {
    boards = 40,
    cutstone = 40,
    bluegem = 20
}})

Rec("sora2fire", "烈焰の箱子", "外焦里嫩！", build, "soraother", {{
    boards = 10,
    cutstone = 10,
    charcoal = 80
}, {
    boards = 20,
    cutstone = 20,
    redgem = 6
}, {
    boards = 40,
    cutstone = 40,
    redgem = 20
}})
AddInvImg("sora2chest", "inventoryimages/sora2fire", "sora2fire")
Rec("sora2chest", "强迫の箱子", "一个有着强迫症的箱子", build, "soraother", {{
    boards = 2,
    cutstone = 2
}, {
    boards = 3,
    cutstone = 3
}, {
    boards = 10,
    cutstone = 10
}})

Rec("sora2tree", "穹の圣诞树", "献祭换取礼物！", build, "sora", {{
    boards = 1,
    pinecone = 1,
    acorn = 1
}, {
    boards = 5,
    pinecone = 10,
    acorn = 10
}, {
    boards = 20,
    pinecone = 40,
    acorn = 40
}})

Rec("sora2base", "秘法祭坛", "放根魔杖吧", build, "soraother", {{
    redmooneye = 1,
    bluemooneye = 1,
    moonrocknugget = 6
}, {
    purplemooneye = 2,
    yellowmooneye = 2,
    moonrocknugget = 20
}, {
    greenmooneye = 3,
    orangemooneye = 3,
    moonrocknugget = 40
}})

Rec("sora_huapen", "穹の花盆", "世界有你更美好", build, "soraother", {{
    moonrocknugget = 2,
    livinglog = 2,
    petals = 10,
    butterfly = 1
}, {
    moonrocknugget = 3,
    livinglog = 3,
    petals = 20,
    butterfly = 5
}, {
    moonrocknugget = 5,
    livinglog = 10,
    petals = 80,
    butterfly = 20
}})

Rec("sora_light", "穹の玫瑰灯", "装饰你的灯吧", build, "soraother", {{
    livinglog = 3,
    cutstone = 3,
    goldnugget = 10
}, {
    livinglog = 10,
    cutstone = 5,
    goldnugget = 20
}, {
    livinglog = 40,
    cutstone = 20,
    goldnugget = 50
}})

for k, v in pairs({"blue", "green", "orange", "pink", "rainbow", "red", "silvery", "violet", "yellow"}) do
    local lightname = "sora_light_" .. v
    AddInvImg(lightname, "inventoryimages/sora_light/" .. lightname)
    Rec(lightname, "穹の玫瑰", "用来装饰你的灯", soralight, "soraother", {
        lightbulb = 10
    })
end

Rec("sora2stone", "穹の传送石", "带你回到传送点", item, "soraother", {{
    goldnugget = 2
}, {
    goldnugget = 2,
    townportaltalisman = 1
}, {
    goldnugget = 2,
    townportaltalisman = 1,
    moonrocknugget = 2
}})

-- 魔法
Rec("sora_birds", "鸽子还没到", "一定来,一定来\n不会咕,不会咕", skill, "sorabook", {
    [san] = 10 + 10 * mode
})
Rec("sora_gardening", "未闻花名", "樱花满地集于我心\n蝶舞纷飞祈愿相随", skill, "sorabook", {
    [san] = 10 + 10 * mode
})
Rec("sora_sleep", "提醒睡觉小助手", "今天没什么干劲了\n明天开始努力吧", skill, "sorabook", {
    [san] = 30 + 10 * mode
})
Rec("sora_raining", "都是时辰的错", "今天天气真不好！\n都是时臣的错！", skill, "sorabook", {
    [san] = 50 + 20 * mode
})
if not getsora("qbwh") then
    Rec("sora_magics", "空白永不败北", "鱼,好大的鱼\n虎纹鲨鱼！", skill, "sorabook", {
        [san] = 100 + 20 * mode
    })
end
Rec("sora_lighting", "超电磁炮永世长存",
    "你指尖跃动的电光\n是我此生不灭的信仰\n唯我超电磁炮永世长存", skill, "sorabook", {
        [san] = 20 + 10 * mode
    })
Rec("sora_tentacles", "伪典-弑君者", "向全体机凯种\n致以最崇高的敬意！", skill, "sorabook", {
    [san] = 30 + 20 * mode
})

-- 药水
Rec("sora2qb", "谦卑", "活力四射！", itembuff, "soraother", {
    spidergland = 40
}).numtogive = 10
Rec("sora2lh", "灵魂", "精神焕发！", itembuff, "soraother", {
    ash = 40,
    goldnugget = 20,
    papyrus = 10
}).numtogive = 10
Rec("sora2cs", "诚实", "无惧黑暗！", itembuff, "soraother", {
    lightbulb = 40,
    cutgrass = 40,
    twigs = 40
}).numtogive = 10
Rec("sora2lm", "怜悯", "怜悯对手！", itembuff, "soraother", {
    healingsalve = 10,
    bandage = 10,
    lifeinjector = 5
}).numtogive = 10
Rec("sora2gz", "公正", "无惧寒暑！", itembuff, "soraother", {
    heatrock = 4,
    ash = 40
}).numtogive = 10
Rec("sora2yy", "英勇", "英勇善战！", itembuff, "soraother", {
    stinger = 40,
    flint = 40
}).numtogive = 10
Rec("sora2ry", "荣誉", "一往无前！", itembuff, "soraother", {
    silk = 10,
    feather_crow = 3,
    feather_robin = 3
}).numtogive = 10
Rec("sora2xs", "牺牲", "向死而生！", itembuff, "soraother", {
    houndstooth = 40,
    charcoal = 20,
    glommerfuel = 5
}).numtogive = 10

Rec("winona_catapult", nil, nil, DST, "sora", {
    sorarepairer = 2,
    twigs = 3,
    cutstone = 3
})
Rec("winona_spotlight", nil, nil, DST, "sora", {
    sorarepairer = 2,
    goldnugget = 2
})
Rec("winona_battery_low", nil, nil, DST, "sora", {
    sorarepairer = 2,
    log = 2,
    nitre = 2
})
Rec("winona_battery_high", nil, nil, DST, "sora", {
    sorarepairer = 2,
    boards = 2,
    transistor = 2
})
Rec("portabletent_item", nil, nil, DST, "sora", {
    bedroll_straw = 1,
    twigs = 4,
    rope = 2
}).placer = "no"

for i = 1, 8 do
    Rec("winter_ornament_light" .. i, "圣诞彩灯" .. i, "漂亮的彩灯！", DST, "sora", {
        transistor = 2
    })
end

Rec("chum", nil, nil, DST, "sora", {
    spoiled_food = 10
})

Rec("yotc_seedpacket", nil, nil, DST, "sora", {
    goldnugget = 2
})
Rec("yotc_seedpacket_rare", nil, nil, DST, "sora", {
    goldnugget = 5
})
AddInvImg2("sora_butterfly", GetInventoryItemAtlas("butterfly.tex"), "butterfly.tex")
Rec("sora_butterfly", "拟造-蝴蝶", "这也是蝴蝶吗?", DST, "sora", {
    butterfly = 1,
    [san] = 10
}).placer = "no"

AddInvImg2("sora_moonbutterfly", GetInventoryItemAtlas("moonbutterfly.tex"), "moonbutterfly.tex")
Rec("sora_moonbutterfly", "拟造-月蛾", "这也是月蛾吗?", DST, "sora", {
    butterfly = 1,
    [san] = 10
}).placer = "no"

AddInvImg2("sora_lightflier", GetInventoryItemAtlas("lightflier.tex"), "lightflier.tex")
Rec("sora_lightflier", "拟造-萤火", "这是什么呀?", DST, "sora", {
    moonrocknugget = 3,
    fireflies = 3,
    [san] = 30
})
if IsModEnable("Legion") or IsModEnable("棱镜") then

    Rec("petals", nil, "花花花花", maker, "sora", {
        petals_lily = 40
    }).numtogive = 40
    Rec("petals", nil, "花花花花", maker, "sora", {
        petals_orchid = 40
    }).numtogive = 40
    Rec("petals", nil, "花花花花", maker, "sora", {
        petals_rose = 40
    }).numtogive = 40
end

-- Rec("sora_butter", "拟造-黄油", "一份黄油蟹蟹!", DST, "sora", {
--     moonrocknugget = 3,
--     fireflies = 3,
--     [san]=30
-- })

TUNING.SORAUNLOCKRECIPES = {}
function UnlonkRecipes(name, ings, des)
    local recname = name .. rec_back
    table.insert(TUNING.SORAUNLOCKRECIPES, recname)
    local rec = Rec(name, nil, des, maker, "sora", ings or {})
    rec.level = TechTree.Create(TECH.LOST)
    if not ings and AllRecipes[name] then
        rec.ingredients = AllRecipes[name].ingredients
        rec.character_ingredients = AllRecipes[name].character_ingredients
        rec.tech_ingredients = AllRecipes[name].tech_ingredients
    end
    return rec
end

if IsModEnable("Legion") or IsModEnable("棱镜") then
    UnlonkRecipes("siving_derivant_item", {
        siving_rocks = 80
    }).placer = "no"
    Rec("livinglog", nil, nil, maker, "sora", {
        shyerrylog = 1
    })
end

if IsModEnable("seele") then
    AddInvImg("books_candy", "inventoryimages/seele")
    AddInvImg("books_wolfma", "inventoryimages/seele")
    AddInvImg("books_bunny", "inventoryimages/seele")
    AddInvImg("books_blice", "inventoryimages/seele")
    AddInvImg("books_ballightning", "inventoryimages/seele")
    AddInvImg("silence_winter_lamp", "inventoryimages/seele")
    AddInvImg("tear_abysmal_sea", "inventoryimages/seele")
    AddInvImg("crystal_abysmal_sea", "inventoryimages/seele")
    Rec("books_candy", nil, nil, maker, "sorabook", {
        papyrus = 3,
        honey = 15,
        pumpkin = 5,
        watermelon = 3
    })
    Rec("books_wolfma", nil, nil, maker, "sorabook", {
        papyrus = 3,
        houndstooth = 5,
        nightmarefuel = 5,
        bluegem = 3
    })
    Rec("books_bunny", nil, nil, maker, "sorabook", {
        papyrus = 3,
        drumstick = 5,
        livinglog = 3,
        redgem = 3
    })
    Rec("books_blice", nil, nil, maker, "sorabook", {
        papyrus = 4,
        purplegem = 3,
        manrabbit_tail = 3,
        tophat = 1
    })
    Rec("books_ballightning", nil, nil, maker, "sorabook", {
        papyrus = 3,
        feather_canary = 3,
        goldnugget = 4,
        wall_stone_item = 1
    })
    Rec("silence_winter_lamp", nil, nil, maker, "sora", {
        tear_abysmal_sea = 2
    })
end

-- 太阳鱼
UnlonkRecipes("oceanfish_small_8_inv", {
    redgem = 3,
    charcoal = 20,
    fishmeat_small = 5
}, "烫烫烫烫烫")
-- 冰雕鱼
UnlonkRecipes("oceanfish_medium_8_inv", {
    bluegem = 3,
    ice = 20,
    fishmeat = 5
}, "冷冷冷冷冷")
-- 珍珠
UnlonkRecipes("hermit_pearl", {
    opalpreciousgem = 1
}, "比珍珠还珍")

-- 鱼池
AddInvImg2("pond", "minimap/minimap_data.xml", "pond.png")
UnlonkRecipes("pond", {
    shovel = 1,
    ice = 40,
    chum = 5
}, "挖出一个池塘来")
-- 鳗鱼池
AddInvImg2("pond_cave", "minimap/minimap_data.xml", "pond_cave.png")
UnlonkRecipes("pond_cave", {
    goldenshovel = 3,
    ice = 40,
    chum = 20
}, "挖出一个池塘来")
-- 岩浆池
AddInvImg2("lava_pond", "minimap/minimap_data.xml", "lava_pond.png")
UnlonkRecipes("lava_pond", {
    goldenshovel = 3,
    ice = 100,
    chum = 50
}, "挖?这玩意真是挖出来的?")
-- 远古配方
UnlonkRecipes("orangeamulet")
UnlonkRecipes("greenamulet")
UnlonkRecipes("orangestaff")
UnlonkRecipes("yellowstaff")
UnlonkRecipes("greenstaff")
UnlonkRecipes("nutrientsgoggleshat")
UnlonkRecipes("ruinshat")
UnlonkRecipes("armorruins")

if IsModEnable("taizhen") or IsModEnable("太真") or IsModEnable("2066838067") or IsModEnable("2199027653598516676") then
    UnlonkRecipes("tz_machine", {
        transistor = 4,
        goldnugget = 10,
        cutstone = 10
    })
    AddInvImg("tz_skillbooks", "QM_UI10", "item_fanta_blade")
    STRINGS.NAMES.TZ_SKILLBOOKS = "太真技能机"
    UnlonkRecipes("tz_skillbooks", {
        goldnugget = 99
    })
end

if IsMythEnable() then
    UnlonkRecipes("myth_bbn", {
        silk = 7,
        moon_tree_blossom = 16,
        opalpreciousgem = 1
    })
    UnlonkRecipes("myth_yylp", {
        moonglass = 20,
        opalpreciousgem = 1
    })
end

if IsModEnable("Functional Medal") or IsModEnable("能力勋章") or IsModEnable("workshop-1909182187") then
    UnlonkRecipes("medaldug_reeds", {
        cutreeds = 120
    }).placer = "no"
    UnlonkRecipes("medaldug_flower_cave_triple", {
        lightbulb = 120
    }).placer = "no"
    UnlonkRecipes("medaldug_cactus", {
        cactus_meat = 120
    }).placer = "no"
    UnlonkRecipes("medaldug_oasis_cactus", {
        cactus_meat = 120
    }).placer = "no"

    UnlonkRecipes("medaldug_fruit_tree_stump", {
        livinglog = 20
    }, "种出一片果园").placer = "no"

    UnlonkRecipes("blank_certificate", {
        goldnugget = 100,
        purplegem = 1
    })
    UnlonkRecipes("plant_certificate", {
        mandrake = 1,
        greengem = 1
    }, "和植物交朋友吧").placer = "no"
    UnlonkRecipes("inherit_certificate", {
        goldnugget = 100,
        yellowgem = 1
    })
    UnlonkRecipes("chef_certificate", {
        goldnugget = 100,
        portablecookpot_item = 5
    })
    UnlonkRecipes("multivariate_certificate", {
        goldnugget = 100,
        orangegem = 1
    })

    UnlonkRecipes("medal_treasure_map", {
        goldnugget = 100
    }, "开始寻宝")

end

for k, v in pairs({"marble", "stone", "moonglass"}) do
    local ing = v == "stone" and "cutstone" or v
    local img = v == "stone" and "" or ("_" .. v)

    for ik, iv in pairs({"bishop", "rook", "knight"}) do
        local name = "chesspiece_" .. iv .. "_" .. v
        local rname = "chesspiece_" .. iv
        STRINGS.NAMES[name:upper()] = STRINGS.NAMES[rname:upper() .. "_BUILDER"]
        STRINGS.RECIPE_DESC[name:upper()] = STRINGS.RECIPE_DESC[rname:upper() .. "_BUILDER"]
        local r = UnlonkRecipes(name, {
            [ing] = 3
        })
        r.atlas = "images/inventoryimages1.xml"
        r.image = (v == "marble" and rname or name) .. ".tex"
    end
end
STRINGS.NAMES["GLASSSPIKE_SHORT"] = STRINGS.NAMES.GLASSSPIKE .. "_矮"
STRINGS.NAMES["GLASSSPIKE_MED"] = STRINGS.NAMES.GLASSSPIKE .. "_中"
STRINGS.NAMES["GLASSSPIKE_TALL"] = STRINGS.NAMES.GLASSSPIKE .. "_高"
for k, v in pairs({"short", "med", "tall"}) do
    local name = "glassspike_" .. v
    AddInvImg(name, "inventoryimages1", "glassspike")
    UnlonkRecipes(name, {
        cutstone = 3
    }, "你想被刺穿吗")
end
UnlonkRecipes("glassblock", {
    cutstone = 5
}, "玻璃城堡！！！")

AddInvImg2("beebox_hermit", "minimap/minimap_data.xml", "beebox_hermitcrab.png")
UnlonkRecipes("beebox_hermit", {
    boards = 2,
    honeycomb = 1,
    bee = 4
}, "嗡嗡嗡！")
AddInvImg2("meatrack_hermit", "minimap/minimap_data.xml", "meatrack_hermit.png")
UnlonkRecipes("meatrack_hermit", {
    twigs = 3,
    charcoal = 2,
    rope = 3
}, "漂亮架子！")
AddInvImg2("seastack", "minimap/minimap_data.xml", "seastack.png")
UnlonkRecipes("seastack", {
    rocks = 40
}, "别撞上了！")
AddInvImg2("saltstack", "minimap/minimap_data.xml", "saltstack.png")
UnlonkRecipes("saltstack", {
    saltrock = 40
}, "我喂自己袋盐")
UnlonkRecipes("waterplant_planter", {
    carrot = 20
}, "全是刺！！！").placer = "no"
UnlonkRecipes("bullkelp_root", {
    fishmeat_small = 20
}, "海带？海苔！").placer = "no"
UnlonkRecipes("rock_avocado_fruit_sprout", {
    rocks = 40
}, "石头也能发芽吗?").placer = "no"
AddInvImg("stagehand", "inventoryimages1", "endtable")
UnlonkRecipes("stagehand", {
    petals = 40,
    boards = 20
})
STRINGS.NAMES["WORMHOLE_HELP"] = STRINGS.NAMES["WORMHOLE"]
AddInvImg2("wormhole_help", "minimap/minimap_data.xml", "wormhole.png")
UnlonkRecipes("wormhole_help", {
    goldenshovel = 40,
    purplegem = 5
}, "一对虫洞")

