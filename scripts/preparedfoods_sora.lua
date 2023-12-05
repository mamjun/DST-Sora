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
]] local foods = {
    -- 阿瓶酱 是调料！也可以生吃 番茄>2.5 不能树枝 不能肉
    sora_aping = {
        str = "阿瓶酱",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return
                (((names.tomato and names.tomato or 0) + (names.tomato_cooked and names.tomato_cooked or 0)) > 2.5) and
                    not tags.meat and not tags.inedible
        end,
        priority = 100,
        foodtype = FOODTYPE.GOODIES,
        health = 10,
        hunger = 15,
        perishtime = 40, -- 40天
        sanity = 10,
        cooktime = 0.25,
        stacksize = 4,
        oneatenfn = function(inst, eater)
            if eater and eater.components.talker then
                eater.components.talker:Say("酸酸甜甜,身轻体柔.")
            end
        end,
        oneat_desc = "身娇体柔易推倒",
        -- tags = 
        -- { "spice"},
        floater = {"med", nil, 0.65},
        cook_need = "番茄/烤番茄 ≥ 3 ",
        cook_cant = "肉类 不可食用类",
        cooktp = {{"tomato", "tomato", "tomato", "red_cap"}, {"tomato", "tomato", "tomato", "tomato"}}
    },

    -- 花花沙拉 40血 40san 20饥饿 降温 仙人掌花>2.5 不能肉
    sora_banhua = {
        str = "花花沙拉",
        des = "恰花花,学仙术",
        test = function(cooker, names, tags)
            return (names.cactus_flower and names.cactus_flower > 2.5) and not tags.meat
        end,
        priority = 100,
        foodtype = FOODTYPE.GOODIES,
        health = 40,
        hunger = 40,
        perishtime = 3,
        sanity = 40,
        cooktime = 0.5,
        temperature = -30,
        temperatureduration = 480,
        floater = {"med", nil, 0.65},
        oneat_desc = "恰花花,学仙术",
        cook_need = "仙人掌花 ≥ 3 ",
        cook_cant = "肉类",
        cooktp = {{"cactus_flower", "cactus_flower", "cactus_flower", "cactus_meat"},
                  {"cactus_flower", "cactus_flower", "cactus_flower", "cactus_flower"}}
    },

    -- 糖煎竹子 蔬菜>1.5 蜂蜜>1.5 生芦笋 > 0.5 饥饿+37.5 san+150 生命+40 不能肉  --未完成
    sora_tangjianzhuzi = {
        str = "糖煎竹子",
        des = "听说马猴烧酒们很喜欢吃这个",
        test = function(cooker, names, tags)
            return ((tags.veggie and tags.veggie or 0) + (names.myth_bamboo and names.myth_bamboo or 0) +
                       (names.myth_bamboo_shoots and names.myth_bamboo_shoots or 0) +
                       (names.myth_bamboo_shoots_cooked and names.myth_bamboo_shoots_cooked or 0)) >= 1.5 and
                       (names.asparagus or names.asparagus_cooked or names.myth_bamboo or names.myth_bamboo_shoots or
                           names.myth_bamboo_shoots_cooked) and names.honey and not tags.meat
        end,
        priority = 100,
        foodtype = FOODTYPE.GOODIES,
        health = 40,
        hunger = 50,
        perishtime = 10,
        sanity = 150,
        cooktime = 2,
        oneatenfn = function(inst, eater)

        end, -- 未完成 持续回SAN 2/s 60秒 
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "马猴烧酒的最爱",
        cook_need = "芦笋 蜂蜜 菜",
        cook_cant = "肉类",
        cooktp = {{"asparagus", "red_cap", "honey", "honey"}, {"asparagus", "asparagus", "honey", "honey"}}
    },

    -- 奶沐鸽子 250饥饿 150 生命 -20san 生鸟腿+小肉+羊奶  肉度大于等于1 --未完成
    sora_naimugezi = {
        str = "奶沐鸽子",
        des = "是UP主的香气",
        test = function(cooker, names, tags)
            return tags.meat and tags.meat >= 1 and names.drumstick and names.goatmilk
        end,
        priority = 100,
        foodtype = FOODTYPE.GOODIES,
        health = 150,
        hunger = 150,
        perishtime = 8,
        sanity = -20,
        cooktime = 0.5,
        oneatenfn = function(inst, eater)
            if eater and eater.components.talker then
                eater.components.talker:Say("咕,咕咕,咕咕咕.")
            end
        end,
        tags = {},
        oneat_desc = "咕是不可能咕的\n这辈子都不可能咕的\n咕,咕咕?",
        floater = {"med", nil, 0.65},
        cook_need = "生鸡腿 羊奶 肉",
        cook_cant = "无",
        cooktp = {{"drumstick", "goatmilk", "meat", "red_cap"}, {"drumstick", "goatmilk", "smallmeat", "carrot"}}
    },

    -- 布丁 零食   37.5饥饿 10生命 15san  水果>=1.5 不能肉 不能树枝  不能蔬菜 零食 回san
    sora_buding = {
        str = "水果布丁",
        des = "果香满满",
        test = function(cooker, names, tags)
            return (tags.fruit and tags.fruit >= 1.5) and not tags.veggie and not tags.meat and not tags.inedible
        end,
        priority = 0.5,
        foodtype = FOODTYPE.VEGGIE,
        health = 5,
        hunger = 30,
        perishtime = 2,
        sanity = 10,
        cooktime = 0.25,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "水果 ≥ 1.5",
        cook_cant = "肉类 不可食用类",
        cooktp = {{"berries", "berries", "berries", "berries"}}
    },

    -- 蛋包饭 蛋>0.5 蔬菜>1.5 肉>0.5 强力饺子 75/10/40
    sora_danbaofan = {
        str = "喷香蛋包饭",
        des = "",
        test = function(cooker, names, tags)
            return tags.egg and tags.meat and tags.veggie and not tags.inedible
        end,
        priority = 50,
        foodtype = FOODTYPE.MEAT,
        health = 40,
        hunger = 80,
        sanity = 10,
        perishtime = 15,
        cooktime = 1,
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "肉类 蛋类 菜类",
        cook_cant = "不可食用类",
        cooktp = {{"smallmeat", "smallmeat", "red_cap", "bird_egg"},
                  {"monstermeat", "monstermeat", "red_cap", "bird_egg"}}
    },
    -- 方格饼干 蜂蜜1 蔬菜>1 不能水果 不能树枝 不能冰 零食 15/30/10
    sora_fangge = {
        str = "方格饼干",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return names.honey and names.honey == 1 and tags.veggie and tags.veggie > 1 and not tags.fruit and
                       not tags.inedible and not tags.frozen and not tags.egg
        end,
        priority = 10,
        foodtype = FOODTYPE.VEGGIE,
        health = 10,
        hunger = 20,
        sanity = 30,
        temperature = TUNING.HOT_FOOD_BONUS_TEMP,
        temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
        nochill = true,
        perishtime = 10,
        cooktime = 1,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "蜂蜜=1 菜≥1 ",
        cook_cant = "水果 冰 不可食用类",
        cooktp = {{"honey", "carrot", "red_cap", "red_cap"}, {"honey", "red_cap", "red_cap", "red_cap"}}
    },
    -- 蝴蝶酥 水果>1 蝴蝶翅膀>1 不能肉 不能蔬菜 不能肉 --吃完480s内小动物不再惧怕你（未完成） 25/10/10
    sora_hudiesu = {
        str = "蝴蝶酥",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return (tags.fruit and tags.fruit >= 1) and names.butterflywings and not tags.meat and not tags.veggie
        end,
        priority = 10,
        foodtype = FOODTYPE.VEGGIE,
        health = 10,
        hunger = 30,
        sanity = 20,
        perishtime = 10,
        cooktime = 0.5,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "咕,咕咕,咕咕咕?",
        cook_need = "蝴蝶翅膀 水果≥1",
        cook_cant = "冰 肉类 不可食用类",
        cooktp = {{"butterflywings", "berries", "berries", "berries"}}
    },

    -- 夹心饼干 蜂蜜 蔬菜>1 水果 不能树枝 不能冰 零食 30/30/15
    sora_jiaxin = {
        str = "酥脆夹心",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return
                names.honey and tags.veggie and tags.veggie > 1 and tags.fruit and not tags.egg and not tags.inedible and
                    not tags.frozen
        end,
        priority = 9,
        foodtype = FOODTYPE.VEGGIE,
        health = 15,
        hunger = 30,
        perishtime = 8,
        sanity = 30,
        cooktime = 1,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "蜂蜜 水果 菜≥1 ",
        cook_cant = "冰 不可食用类",
        cooktp = {{"honey", "carrot", "red_cap", "berries"}}
    },

    -- 巧克力饼干 回san 蜂蜜 蔬菜>1 蛋 不能树枝 不能冰  50/40/20
    sora_qiaokeli = {
        str = "甜心巧克力",
        des = "听说巧克力和牛奶很配哟",
        test = function(cooker, names, tags)
            return names.honey and tags.veggie and tags.veggie > 1 and tags.egg and not tags.inedible and
                       not tags.frozen
        end,
        priority = 12,
        foodtype = FOODTYPE.VEGGIE,
        health = 10,
        hunger = 40,
        perishtime = 15,
        sanity = 30,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "蜂蜜 菜＞1 蛋类 ",
        cook_cant = "冰 不可食用类",
        cooktp = {{"honey", "bird_egg", "carrot", "carrot"}}
    },
    -- 曲奇饼干  蜂蜜>1 蔬菜>1 不能水果 不能树枝 不能冰 66/66/66
    sora_quqi = {
        str = "爱心曲奇",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return names.honey and names.honey > 1 and tags.veggie and tags.veggie > 1 and not tags.fruit and
                       not tags.inedible and not tags.frozen and not tags.egg and
                       (names.pumpkin or names.pumpkin_cooked)
        end,
        priority = 900,
        foodtype = FOODTYPE.VEGGIE,
        health = 66,
        hunger = 66,
        perishtime = 10,
        sanity = 66,
        cooktime = 2,
        hungertrue = true,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "蜂蜜 蜂蜜 南瓜 +菜 ",
        cook_cant = "水果 冰 不可食用类",
        cooktp = {{"honey", "honey", "carrot", "red_cap"}}
    },

    -- 小熊饼干 蔬菜+ 水果>=1.5 没有蜂蜜  没有树枝 没有冰 召唤一只熊大（算了算了）
    sora_xiaoxiong = {
        str = "小熊饼干",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return not names.honey and tags.veggie and tags.fruit and tags.fruit >= 1.5 and not tags.inedible and
                       not tags.frozen
        end,
        priority = 7,
        foodtype = FOODTYPE.VEGGIE,
        health = 20,
        hunger = 40,
        perishtime = 10,
        sanity = 20,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "咕,咕咕,咕咕咕?",
        cook_need = "水果≥1.5 蔬菜",
        cook_cant = "蜂蜜 冰 不可食用类",
        cooktp = {{"red_cap", "berries", "berries", "berries"}}
    },
    -- 兔子饼干 胡萝卜>1.5 蜂蜜 不能肉 37.5/10/10 吃完召唤一只兔子作为队友
    sora_tuzi = {
        str = "兔子饼干",
        des = "兔子先生，你好阿",
        test = function(cooker, names, tags)
            return
                (((names.carrot and names.carrot or 0) + (names.carrot_cooked and names.carrot_cooked or 0)) > 1.5) and
                    names.honey and not tags.meat and not tags.egg
        end,
        priority = 15,
        foodtype = FOODTYPE.VEGGIE,
        health = 10,
        hunger = 40,
        perishtime = 10,
        sanity = 25,
        oneatenfn = function(inst, eater)
            -- local pt = eater:GetPosition()
            -- local theta = math.random() * 2 * PI
            -- local radius = 30
            -- local offset = FindWalkableOffset(pt, theta, radius, 12, true)
            -- if offset then
            -- pt = pt+offset
            -- local bunnyman = SpawnPrefab("bunnyman")
            -- if bunnyman then

            -- end
            -- end
        end,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "咕,咕咕,咕咕咕?",
        cook_need = "胡萝卜≥1.5 蜂蜜",
        cook_cant = "肉类 蛋类",
        cooktp = {{"honey", "honey", "carrot", "carrot"}}
    },

    -- 味增汤   --持续升温 冰>1 鱼 蔬菜 不能树枝 37.5/30/50
    sora_weizengtang = {
        str = "味增汤",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return tags.frozen and tags.frozen > 1 and tags.fish and tags.veggie and not tags.inedible
        end,
        priority = 60,
        foodtype = FOODTYPE.MEAT,
        health = 50,
        hunger = 40,
        perishtime = 6,
        sanity = 30,
        cooktime = 2,
        temperature = 50,
        temperatureduration = 480,
        nochill = true,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "非常暖身的一碗汤",
        cook_need = "冰块 冰块 鱼类 蔬菜",
        cook_cant = "无",
        cooktp = {{"ice", "ice", "fishmeat_small", "red_cap"}}
    },

    -- 桶面    肉+菜 > 2 不能树枝 200/10/-5
    sora_tongmian = {
        str = "速食拉面",
        des = "没什么营养,勉强充饥而已",
        test = function(cooker, names, tags)
            return tags.meat and tags.veggie and ((tags.meat + tags.veggie) > 2) and not tags.inedible
        end,
        priority = 0,
        foodtype = FOODTYPE.MEAT,
        health = -5,
        hunger = 100,
        perishtime = 20,
        sanity = 10,
        cooktime = 0.1,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "能填饱肚子就行,管那么多干嘛",
        cook_need = "(蔬菜+肉类)≥2.5",
        cook_cant = "不可食用类",
        cooktp = {{"meat", "red_cap", "red_cap", "red_cap"}, {"smallmeat", "cactus_meat", "cactus_meat", "cactus_meat"}}
    },

    -- 蟹味棒   鱼>1 蔬菜<1 蜂蜜 不能冰 不能树枝 30/30/80
    sora_xieweibang = {
        str = "蟹味棒",
        des = "美味的蟹肉,等等,哪来的螃蟹",
        test = function(cooker, names, tags)
            return
                tags.fish and tags.fish > 1 and tags.veggie and tags.veggie < 1 and names.honey and not tags.frozen and
                    not tags.inedible
        end,
        priority = 60,
        foodtype = FOODTYPE.MEAT,
        health = 80,
        hunger = 50,
        perishtime = 6,
        sanity = 30,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "鱼类≥1.5 蜂蜜 小菜 ",
        cook_cant = "冰 不可食用类",
        cooktp = {{"fishmeat", "fishmeat_small", "honey", "red_cap"}}
    },

    -- 铜锣烧   蜂蜜+奶+黄油+蛋    150/100/100  --吃下之后出现一个5*5的容器UI 持续960S 可以放东西 到期后自动变成一个打包的包裹（未完成）
    sora_tongluoshao = {
        str = "铜锣烧",
        des = "多啦A梦,来一起阿",
        test = function(cooker, names, tags)
            return names.butter and names.honey and names.goatmilk and tags.egg and not tags.meat
        end,
        priority = 60,
        foodtype = FOODTYPE.VEGGIE,
        health = 100,
        hunger = 150,
        perishtime = 10,
        sanity = 100,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "咕,咕咕,咕咕咕?",
        cook_need = "蜂蜜 羊奶 黄油 蛋类",
        cook_cant = "肉类",
        cooktp = {{"honey", "butter", "goatmilk", "bird_egg"}}
    },
    -- 天妇罗 土豆 蛋 肉>1 不能树枝   75/30/50
    sora_tianfuluo = {
        str = "天妇罗",
        des = "炸的脆脆的",
        test = function(cooker, names, tags)
            return
                tags.veggie and (names.potato or names.potato_cooked) and tags.egg and tags.meat and tags.meat > 1 and
                    not tags.inedible
        end,
        priority = 60,
        foodtype = FOODTYPE.MEAT,
        health = 50,
        hunger = 80,
        perishtime = 10,
        sanity = 30,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "土豆 蛋类 肉类≥1.5 ",
        cook_cant = "不可食用类",
        cooktp = {{"potato", "bird_egg", "smallmeat", "meat"}, {"potato", "bird_egg", "meat", "monstermeat"}}
    },

    -- 芝士玉米  生玉米 >0.5 糖>1.5 树枝>0.5 45/20/30
    sora_zhishiyumi = {
        str = "芝士玉米",
        des = "甜到腻牙",
        test = function(cooker, names, tags)
            return names.corn and names.twigs and names.honey and names.honey >= 2
        end,
        priority = 30,
        foodtype = FOODTYPE.VEGGIE,
        health = 20,
        hunger = 40,
        perishtime = 20,
        sanity = 30,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "生玉米 蜂蜜 蜂蜜 树枝",
        cook_cant = "无",
        cooktp = {{"honey", "twigs", "corn", "honey"}}
    },

    -- 普通寿司 75饥饿 10san 25血 蔬菜>1+肉 不能蜂蜜 不能树枝 鱼
    sora_shousi = {
        str = "寿司",
        des = "人间美味！",
        test = function(cooker, names, tags)
            return tags.fish and tags.veggie and tags.veggie > 1 and not names.honey and not tags.inedible
        end,
        priority = 10,
        foodtype = FOODTYPE.MEAT,
        health = 25,
        hunger = 60,
        perishtime = 3,
        sanity = 20,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        cook_need = "鱼 菜≥1.5",
        cook_cant = "蜂蜜 不可食用类",
        oneat_desc = "无",
        cooktp = {{"fishmeat_small", "red_cap", "red_cap", "red_cap"}, {"fishmeat_small", "carrot", "carrot", "carrot"}}
    },
    -- 鳗鱼刺身  66饥饿 66san 66血  鱼>0.5+蔬菜>1  必须鱼  不能蜂蜜不能树枝
    sora_yupianshousi = {
        str = "鳗鱼刺身",
        des = "丑陋的鳗鱼变成了餐桌上的美食",
        test = function(cooker, names, tags)
            return (names.pondeel or names.eel) and tags.veggie and tags.veggie > 1 and not names.honey and
                       not tags.inedible
        end,
        priority = 25,
        foodtype = FOODTYPE.MEAT,
        health = 66,
        hunger = 66,
        hungertrue = true,
        perishtime = 2,
        sanity = 66,
        cooktime = 2,
        tags = {},
        floater = {"med", nil, 0.65},
        oneat_desc = "无",
        cook_need = "鳗鱼 菜≥1.5",
        cook_cant = "蜂蜜 不可食用类",
        cooktp = {{"pondeel", "cutlichen", "cutlichen", "cutlichen"}, {"pondeel", "carrot", "carrot", "carrot"}}
    }

}
local sorafoodui = require "widgets/sorafoodui"
for k, v in pairs(foods) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
    v.perishtime = v.perishtime * 480
    if not v.hungertrue then
        v.hunger = (v.hunger or 0) * (1.3 - 0.3 * TUNING.SORAMODE)
    end
    if v.str then
        STRINGS.NAMES[k:upper()] = v.str
        v.str = nil
    end
    if not v.tags then
        v.tags = {}
    end
    v.sorafood = true
    table.insert(v.tags, "sorafood")
    if v.des then
        STRINGS.CHARACTERS.GENERIC.DESCRIBE[k:upper()] = v.des
        v.des = nil
    end
    v.custom_cookbook_details_fn = function(data, self, top, left)
        local root = sorafoodui(data, self, top, left)
        return root
    end

end

return foods
