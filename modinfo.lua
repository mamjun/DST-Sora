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
]] author = "FL"
version = "13.15" -- 版本
name = "小穹 v" .. version
huaversion = 20220204 -- 花花的版本
forumthread = ""
priority = -100000
description = '当前版本：' .. version .. [[\n
恨穹不是妹，恨妹不成穹！
初始属性很差，但随着等级上升可以获得大量属性。
交流群号： 777150028
wiki地址: https://wiki.flapi.cn
这是一个很不适合单人游玩的人物，建议拉上自己的小伙伴一起玩。
如果你对这个人物足够了解的话，也可以尝试挑战独自游玩。
码师：Fl 		画师：魔法少女唐间竹子（人物贴图）

Copyright 2022 [FL]。此产品仅授权发布在 Steam 和WeGame平台指定账户下，
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
]]

-- API版本
api_version = 10
-- 是否支持联机版

dst_compatible = true
local plat = folder_name and
                 ((folder_name:match("19351") and 1) or (folder_name:match("24235") and 2) or
                     (folder_name:match("45075") and 3) or (folder_name:match("^sorav") and -1) or
                     (folder_name:match("^sora%-dev") and -1)) or 0
if plat == 1 then
    mod_dependencies = {{
        workshop = "workshop-2199027653598529357"
    }}
elseif plat == 2 then
    mod_dependencies = {{
        workshop = "workshop-2384660166"
    }}
elseif plat == 3 then
    name = name .. " Beta"
    mod_dependencies = {{
        workshop = "workshop-2384660166"
    }}
elseif plat == -1 then
    name = name .. " Dev"
    version = version .. "-dev"
    description = '当前版本：' .. version
elseif plat == 0 then
    -- 给爷爬
    mod_dependencies = {{
        workshop = "workshop-238466016611"
    }}
end

dont_starve_compatible = false
reign_of_giants_compatible = false

-- 所有客户端需要此MOD(人物mod必须开启)
all_clients_require_mod = true
-- 贴图
icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- MOD标签
server_filter_tags = {"character", "sora", "Sora", "qiong", "xiaoqiong", "穹", "小穹", "春日野穹", "Kasugano",
                      "KasuganoSora"}
string = string or ""
local pre_name
local pre_lable
local function maketitle(name, label)
    pre_name = name
    pre_lable = label
    return {
        name = name,
        label = label .. "设置",
        options = {{
            description = "",
            data = ""
        }},
        default = ""
    }
end
local allnum = 0
local function makeconfig(name, label, des, default, min, step, num, ispercent)
    local t = {}
    t.name = pre_name .. name
    t.label = pre_lable .. label
    t.options = {}
    for i = 0, num, 1 do
        local da = min + i * step
        local desc = string.format(des, ispercent and (da - ispercent) * 100 or da)
        t.options[i + 1] = {
            description = desc,
            data = string.format("%s", da)
        }
    end
    allnum = allnum + num
    t.default = string.format("%s", default)
    return t
end
configuration_options = {{
    name = "ClientProxy",
    label = "允许客户端协助服务器连接服务器,需要客户端启用SoraProxy",
    options = {{
        description = "允许,不安全,但是只需要客户端启用SoraProxy",
        data = "1",
        hover = "允许,不安全,但是只需要客户端启用SoraProxy"
    }, {
        description = "不允许,更安全,需要专服启用SoraProxy",
        data = "0",
        hover = "不允许,更安全,需要专服启用SoraProxy"
    }},
    default = "0"
}, {
    name = "reset_ui",
    label = "启动时重置UI位置(玩家自己在mod设置里设置)\n也可以使用sora_reset_ui()命令",
    options = {{
        description = "重置所有UI",
        data = true,
        hover = "重置所有UI"
    }, {
        description = "无影响",
        data = false,
        hover = "无影响"
    }},
    default = false
}, maketitle("jichu", "基础设置"), {
    name = "mode",
    label = "难度",
    options = {{
        description = "简单",
        data = 1,
        hover = "人物容易升级"
    }, {
        description = "一般",
        data = 2,
        hover = "人物较难升级"
    }, {
        description = "困难",
        data = 3,
        hover = "人物很难升级"
    }},
    default = 2
}, {
    name = "recmode",
    label = "配方难度",
    options = {{
        description = "简单",
        data = 1,
        hover = "物品和装备容易制作"
    }, {
        description = "一般",
        data = 2,
        hover = "物品和装备较难制作"
    }, {
        description = "困难",
        data = 3,
        hover = "物品和装备很难制作"
    }, {
        description = "默认",
        data = 0,
        hover = "跟随人物难度"
    }},
    default = 0
}, {
    name = "healthfix",
    label = "三维兼容模式",
    options = {{
        description = "兼容",
        data = 1,
        hover = "尝试兼容成就等提升三维的手段，如果数值混乱请关闭兼容"
    }, {
        description = "默认",
        data = 0,
        hover = "不进行额外兼容尝试"
    }},
    default = 1
}, {
    name = "moreanimdata",
    label = "留影机兼容模式",
    options = {{
        description = "兼容",
        data = 1,
        hover = "不进行更多尝试"
    }, {
        description = "激进",
        data = 0,
        hover = "建议打开，如果崩了就关闭试试"
    }},
    default = 0
}, {
    name = "foodmemory",
    label = "食物记录",
    options = {{
        description = "开启",
        data = true,
        hover = "小穹非常挑食，不喜欢吃同样的东西"
    }, {
        description = "关闭",
        data = false,
        hover = "小穹现在可以接受同样的口味"
    }},
    default = true
}, {
    name = "disableui_multab",
    label = "禁用物品栏相关扩展",
    options = {{
        description = "不禁用",
        data = false,
        hover = "不禁用,使用物品栏相关扩展"
    }, {
        description = "禁用,不物品栏相关扩展",
        data = true,
        hover = "禁用,不物品栏相关扩展"
    }},
    default = false
}, {
    name = "disableui_globalbuild",
    label = "禁用全局制作",
    options = {{
        description = "不禁用",
        data = false,
        hover = "不禁用,允许使用全局制作"
    }, {
        description = "禁用,禁止使用全局制作",
        data = true,
        hover = "禁用,禁止使用全局制作"
    }},
    default = false
}, {
    name = "pack",
    label = "允许使用打包纸相关吗",
    options = {{
        description = "允许",
        data = true,
        hover = "允许打包"
    }, {
        description = "不允许",
        data = false,
        hover = "不允许打包新物品(原有的打包好的仍然有效)"
    }},
    default = true
}, {
    name = "wiki",
    label = "是否默认显示wiki图标(需要玩家自己在mod设置里设置)",
    options = {{
        description = "默认显示",
        data = true,
        hover = "可以长按等级按钮隐藏"
    }, {
        description = "默认不显示",
        data = false,
        hover = "可以长按等级按钮显示"
    }},
    default = true
}, {
    name = "time",
    label = "是否默认显示时间图标(需要玩家自己在mod设置里设置)",
    options = {{
        description = "默认显示",
        data = true,
        hover = "显示"
    }, {
        description = "不显示",
        data = false,
        hover = "不显示"
    }},
    default = false
}, {
    name = "chestui",
    label = "是否显示强迫症箱子介绍(需要玩家自己在mod设置里设置)",
    options = {{
        description = "显示",
        data = true,
        hover = "显示强迫症箱子介绍"
    }, {
        description = "隐藏",
        data = false,
        hover = "隐藏强迫症箱子介绍"
    }},
    default = true
}, {
    name = "add",
    label = "扩展打包纸，允许打包落水洞等物品，\n但是请不要带这些东西跳世界，会出问题",
    options = {{
        description = "允许",
        data = true,
        hover = "允许打包更多物品"
    }, {
        description = "不允许",
        data = false,
        hover = "只能打包部分物品"
    }},
    default = false
}, {
    name = "add2",
    label = "扩展打包纸，允许打包怪物、boss等，\n极度影响平衡，仅供娱乐",
    options = {{
        description = "允许",
        data = true,
        hover = "允许打包怪物、boss"
    }, {
        description = "不允许",
        data = false,
        hover = "只能打包部分生物"
    }},
    default = false
}, {
    name = "qbwh",
    label = "禁用空白永不败北",
    options = {{
        description = "禁用",
        data = true,
        hover = "禁用空白永不败北"
    }, {
        description = "不禁用",
        data = false,
        hover = "不禁用空白永不败北"
    }},
    default = false
}, {
    name = "tochest",
    label = "禁止上强迫症(开启此选项会使已上强迫症失效)",
    options = {{
        description = "禁止",
        data = true,
        hover = "不允许上强迫症"
    }, {
        description = "允许",
        data = false,
        hover = "允许上强迫症"
    }},
    default = false
}, {
    name = "tochestgem",
    label = "禁止强迫症紫宝石打包",
    options = {{
        description = "禁止",
        data = true,
        hover = "不允许强迫症紫宝石打包"
    }, {
        description = "允许",
        data = false,
        hover = "允许强迫症紫宝石打包"
    }},
    default = false
}, {
    name = "chestgreen",
    label = "禁止强迫症绿宝石种植",
    options = {{
        description = "禁止",
        data = true,
        hover = "不允许强迫症绿宝石种植"
    }, {
        description = "允许",
        data = false,
        hover = "允许强迫症绿宝石种植"
    }},
    default = false
}, {
    name = "fixyzhou",
    label = "修复飞行状态下距离判定",
    options = {{
        description = "修复",
        data = true,
        hover = "修复"
    }, {
        description = "不修复",
        data = false,
        hover = "不修复"
    }},
    default = true
}, {
    name = "lock2",
    label = "允许管理员开锁",
    options = {{
        description = "禁止",
        data = false,
        hover = "禁止管理员开锁"
    }, {
        description = "允许",
        data = true,
        hover = "允许管理员开锁"
    }},
    default = false
}, {
    name = "lock3",
    label = "下线多少天后锁失效",
    options = {{
        description = "0",
        data = 0,
        hover = "永不失效"
    }, {
        description = "1天",
        data = 1,
        hover = "下线1天后锁失效"
    }, {
        description = "10天",
        data = 10,
        hover = "下线10天后锁失效"
    }, {
        description = "30天",
        data = 30,
        hover = "下线30天后锁失效"
    }, {
        description = "80天",
        data = 80,
        hover = "下线80天后锁失效"
    }, {
        description = "365天",
        data = 365,
        hover = "下线365天后锁失效"
    }},
    default = 0
}, {
    name = "zzjb",
    label = "禁用25级制作减半",
    options = {{
        description = "禁用",
        data = true,
        hover = "禁用25级制作减半"
    }, {
        description = "不禁用",
        data = false,
        hover = "不禁用25级制作减半"
    }},
    default = false
}, {
    name = "sbdl",
    label = "禁用30级掉落翻倍",
    options = {{
        description = "禁用",
        data = true,
        hover = "禁用30级掉落翻倍"
    }, {
        description = "不禁用",
        data = false,
        hover = "不禁用30级掉落翻倍"
    }},
    default = false
}, {
    name = "sbsg",
    label = "禁用25级双倍收锅",
    options = {{
        description = "禁用",
        data = true,
        hover = "禁用25级双倍收锅"
    }, {
        description = "不禁用",
        data = false,
        hover = "不禁用25级双倍收锅"
    }},
    default = false
}, {
    name = "sbcj",
    label = "禁用15级双倍采集",
    options = {{
        description = "禁用",
        data = true,
        hover = "禁用15级双倍采集"
    }, {
        description = "不禁用",
        data = false,
        hover = "不禁用15级双倍采集"
    }},
    default = false
}, {
    name = "mid",
    label = "MID设置",
    options = {{
        description = "不懂请勿修改-1",
        data = "1",
        hover = "不懂请勿修改-1"
    }, {
        description = "不懂请勿修改-2",
        data = "2",
        hover = "不懂请勿修改-2"
    }},
    default = "1"
}, {
    name = "fgmode",
    label = "扶光权限模式",
    options = {{
        description = "全局共享",
        data = 0,
        hover = "全局共享"
    }, {
        description = "个人独立",
        data = 1,
        hover = "个人独立"
    }, {
        description = "队伍共享/无队共享-需开启组队系统",
        data = 2,
        hover = "队伍共享/无队共享-需开启组队系统"
    }, {
        description = "队伍共享/无队独立-需开启组队系统",
        data = 3,
        hover = "队伍共享/无队独立-需开启组队系统"
    }},
    default = 0
}, {
    name = "chest",
    label = "强迫症箱子范围",
    options = {{
        description = "30",
        data = 30,
        hover = "30"
    }, {
        description = "60",
        data = 60,
        hover = "60"
    }, {
        description = "90",
        data = 90,
        hover = "90"
    }, {
        description = "120",
        data = 120,
        hover = "120"
    }, {
        description = "300",
        data = 300,
        hover = "300"
    }, {
        description = "1000",
        data = 1000,
        hover = "1000"
    }, {
        description = "3000",
        data = 3000,
        hover = "3000"
    }},
    default = 60
}, maketitle("tongyong", "通用装备设置"), maketitle("sora3sword", "银白の锋"),
                         makeconfig("att", "攻击力", "%s", 59.5, 17, 8.5, 10),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.8, 0.05, 14, 1),
                         makeconfig("att2", "攻击距离", "%s", 1.25, 0, 0.25, 12),
                         makeconfig("att3", "回血", "%s", 0.5, -1, 0.5, 12), maketitle("sora2hat", "银白の盔"),
                         makeconfig("arm1", "护甲", "%s%%", 0.85, 0.5, 0.025, 19, 0),
                         makeconfig("arm2", "耐久", "%s", 2000, 500, 500, 9),
                         makeconfig("wat", "防水", "%s%%", 0.3, 0, 0.05, 10, 0),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.8, 0.05, 14, 1),
                         makeconfig("san", "回SAN", "%s", 1, -5, 0.5, 20), maketitle("sora2armor", "银白の甲"),
                         makeconfig("arm1", "护甲", "%s%%", 0.85, 0.5, 0.025, 19, 0),
                         makeconfig("arm2", "耐久", "%s", 2000, 500, 500, 9),
                         makeconfig("wat", "防水", "%s%%", 0.3, 0, 0.05, 10, 0),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.8, 0.05, 14, 1),
                         makeconfig("san", "回SAN", "%s", 1, -5, 0.5, 20), maketitle("sora2sword", "奇妙法杖"),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.7, 0.05, 16, 1),
                         makeconfig("att", "攻击", "%s", 10, 0, 5, 10),
                         makeconfig("att2", "攻击距离", "%s", 8, 0, 1, 10), maketitle("sora2prop", "神奇法杖"),
                         makeconfig("spe", "移速", "%s%%", 1.5, 1, 0.1, 10, 1),
                         maketitle("sora2amulet", "荣誉勋章"),
                         makeconfig("wat", "防水", "%s%%", 0.3, 0, 0.05, 10, 0),
                         makeconfig("spe", "移速", "%s%%", 1.2, 0.7, 0.05, 16, 1),
                         makeconfig("att", "伤害加成", "%s%%", 1.2, 0.7, 0.05, 16, 1),
                         makeconfig("arm", "防御加成", "%s%%", 1.2, 0.7, 0.05, 16, 1),
                         makeconfig("san", "回SAN", "%s", 1, -5, 0.5, 20), maketitle("sora2bag", "银白の翼"),
                         makeconfig("spe", "移速加成", "%s%%", 1.1, 0.7, 0.05, 16, 1),
                         makeconfig("san", "回SAN", "%s", 2, -5, 0.5, 20), maketitle("zhaunshu", "专属装备设置"),
                         maketitle("soramagic", "穹の空"),
                         makeconfig("att1", "基础攻击力", "%s", 20, 10, 5, 20),
                         makeconfig("att2", "升级攻击力", "%s", 0.5, 0, 0.1, 10),
                         makeconfig("range1", "基础攻击范围", "%s", 5, 0, 0.5, 20),
                         makeconfig("range2", "升级攻击范围", "%s", 0.1, 0, 0.01, 20),
                         makeconfig("skill1", "基础技能伤害", "%s", 20, 0, 5, 10),
                         makeconfig("skill2", "升级技能伤害", "%s", 2, 0, 1, 20),
                         makeconfig("skillcd", "技能冷却", "%ss", 30, 0, 5, 40),
                         makeconfig("spe", "移速", "%s%%", 1.25, 0.7, 0.05, 16, 1),
                         maketitle("sorapick", "穹の采"), makeconfig("att", "基础攻击力", "%s", 10, 0, 2, 20),
                         makeconfig("range", "基础攻击范围", "%s", 8, 0, 1, 10),
                         makeconfig("ice1", "基础灭火范围", "%s", 4, 0, 1, 10),
                         makeconfig("ice2", "升级灭火范围", "%s", 0.3, 0, 0.05, 20),
                         makeconfig("pick1", "基础收集范围", "%s", 4, 0, 1, 10),
                         makeconfig("pick2", "升级收集范围", "%s", 0.3, 0, 0.05, 20),
                         makeconfig("cd1", "基础技能冷却", "%ss", 50, 0, 5, 40),
                         makeconfig("cd2", "升级降低技能冷却", "%ss", 5, 0, 1, 20),
                         makeconfig("spe", "移速", "%s%%", 1.25, 0.7, 0.05, 16, 1),
                         maketitle("soratele", "穹の瞬"),
                         makeconfig("cd1", "基础技能冷却", "%ss", 20, 0, 2, 30),
                         makeconfig("cd2", "升级降低技能冷却", "%ss", 2, 0, 1, 20),
                         makeconfig("san1", "基础技能消耗", "%s", 40, 0, 2, 60),
                         makeconfig("san2", "升级降低消耗", "%s", 2, 0, 1, 20),
                         makeconfig("spe", "移速", "%s%%", 1.5, 0.7, 0.05, 26, 1),
                         maketitle("sorahealing", "穹の愈"),
                         makeconfig("cd1", "基础技能冷却", "%ss", 60, 0, 2, 60),
                         makeconfig("cd2", "升级降低技能冷却", "%ss", 5, 0, 1, 20),
                         makeconfig("player1", "基础玩家回血", "%s", 30, 0, 2, 60),
                         makeconfig("player2", "升级玩家回血", "%s", 5, 0, 1, 20),
                         makeconfig("lm1", "基础怪物回血", "%s", 3000, 0, 100, 60),
                         makeconfig("lm2", "升级怪物回血", "%s", 500, 0, 100, 20),
                         makeconfig("att1", "基础攻击力", "%s", 15, 0, 5, 20),
                         makeconfig("att2", "升级攻击力", "%s", 2, 0, 1, 20),
                         makeconfig("range", "基础攻击范围", "%s", 8, 0, 1, 10),
                         makeconfig("spe", "移速", "%s%%", 1.25, 0.7, 0.05, 16, 1), maketitle("sorahat", "穹の冠"),
                         makeconfig("armor1", "基础护甲", "%s%%", 75, 50, 2.5, 19),
                         makeconfig("armor2", "升级护甲", "%s%%", 0.01, 0, 0.001, 50, 0),
                         makeconfig("armor3", "基础耐久", "%s", 500, 300, 100, 17),
                         makeconfig("armor4", "升级耐久", "%s", 150, 0, 10, 100),
                         makeconfig("armor5", "耐久回复间隔", "%ss", 10, 1, 1, 119),
                         makeconfig("water1", "基础防水", "%s%%", 0, 0, 0.1, 10, 0),
                         makeconfig("water2", "升级防水", "%s%%", 0.1, 0, 0.01, 20, 0),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.7, 0.05, 16, 1),
                         makeconfig("san", "回SAN", "%s", 2, -5, 0.5, 30), maketitle("soraclothes", "穹の护"),
                         makeconfig("armor1", "基础护甲", "%s%%", 75, 50, 2.5, 19),
                         makeconfig("armor2", "升级护甲", "%s%%", 0.01, 0, 0.001, 50, 0),
                         makeconfig("armor3", "基础耐久", "%s", 500, 300, 100, 17),
                         makeconfig("armor4", "升级耐久", "%s", 150, 0, 10, 100),
                         makeconfig("armor5", "耐久回复间隔", "%ss", 10, 1, 1, 119),
                         makeconfig("hot1", "基础保暖", "%s", 0, 0, 30, 20),
                         makeconfig("hot2", "升级保暖", "%s", 24, 0, 4, 30),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.7, 0.05, 16, 1),
                         makeconfig("san", "回SAN", "%s", 2, -5, 0.5, 30), maketitle("sorabag", "穹の包"),
                         makeconfig("ice1", "基础隔热", "%s", 0, 0, 30, 20),
                         makeconfig("ice2", "升级隔热", "%s", 4, 0, 4, 30),
                         makeconfig("san1", "基础回SAN", "%s", 0, -5, 0.5, 30),
                         makeconfig("san2", "升级回SAN", "%s", 0.2, 0, 0.1, 50),
                         makeconfig("san3", "特殊回SAN", "%s", 10, -5, 1, 55),
                         makeconfig("foodd1", "基础反鲜(负的才是返鲜,正的是腐烂)", "%s", 0.25, -1, 0.05,
    30), makeconfig("foodd2", "升级反鲜(负的才是返鲜,正的是腐烂)", "%s", -0.1, -0.5, 0.1, 20),
                         makeconfig("spe", "移速", "%s%%", 1.1, 0.7, 0.05, 16, 1),
                         makeconfig("water", "防水", "%s%%", 0, 0, 0.05, 20, 0),
                         maketitle("sorabowknot", "穹の蝴蝶结"),
                         makeconfig("light1", "基础发光", "%s", -2, -5, 1, 15),
                         makeconfig("light2", "升级发光", "%s", 0.16, 0, 0.01, 50),
                         makeconfig("san", "回SAN", "%s", 2, -5, 0.5, 30),
                         makeconfig("spe", "移速", "%s%%", 1.2, 0.7, 0.05, 16, 1),
                         makeconfig("water", "防水", "%s%%", 0.3, 0, 0.05, 20, 0),
                         makeconfig("att", "攻击加成", "%s%%", 1.2, 0.7, 0.05, 16, 1),
                         makeconfig("arm", "防御加成", "%s%%", 1.2, 0.7, 0.05, 16, 1)}

