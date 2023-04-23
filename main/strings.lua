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
    local strings = {CHARACTER_TITLES={},CHARACTER_NAMES={},CHARACTER_DESCRIPTIONS={},CHARACTER_QUOTES={},CHARACTERS={GENERIC={DESCRIBE={}}},TABS={}}
    STRINGS.NAMES.sora = "Sora"
    -- 角色选择界面
	strings.CHARACTER_TITLES.sora = "穹"
	strings.CHARACTER_NAMES.sora = "春日野穹"
	strings.CHARACTER_DESCRIPTIONS.sora = "悠远的天空\n在苍穹的尽头"
	strings.CHARACTER_QUOTES.sora = "悠远的天空\n在苍穹的尽头"
    -- 角色台词
    mi("speech")
    mi("speech_extend")
	strings.CHARACTERS.SORA = SORA_SPEECH
    local extend = SORA_SPEECH_EXTEND
	copytotable(strings.CHARACTERS.SORA,extend)
    -- 人物语言反馈
    strings.CHARACTERS.GENERIC.DESCRIBE.SORA = 
    {
        GENERIC = "穹酱!",
        ATTACKER = "穹酱!",
        MURDERER = "谋杀啊!",
        REVIVER = "穹酱!.",
        GHOST = "小穹，你怎么了",
    }
    strings.SORASTRING = {NAMES={},DESCRIBE={},RECIPE_DESC={},ACTIONFAIL={}}
    local SORASTRING = strings.SORASTRING
    local NAMES = SORASTRING.NAMES
    local DESCRIBE = SORASTRING.DESCRIBE
    local RECIPE_DESC = SORASTRING.RECIPE_DESC
    local ACTIONFAIL = SORASTRING.ACTIONFAIL
    NAMES.SORA_WQ = "雾切之回光"
    ACTIONFAIL.SORAWQLEVELUP  = {
        ERRLEVEL = "武器不正确",
        ERRWQ = "不能用这个精炼",
        MAXLEVEL = "这个已经满精炼了",
        TARGETMAXLEVEL ="目标已经满精炼了",
        SAME  ="这是同一把",
    }
    NAMES.SORA_LIGHTFLIER_CAT = "拟造-萤火"
    STRINGS.CHARACTERS.GENERIC.DESCRIBE.SORA_LIGHTFLIER_CAT = "这是什么呀"
    copytotable(STRINGS,strings)
    local function toupper(str)
        if str and type(str) == "string" then return str:upper() end
    end
    
    function GLOBAL.SoraString(key, firsttype, secondtype, thirdtype)
        key = toupper(key) or "[BAD KEY]"
        firsttype = toupper(firsttype)
        secondtype = toupper(secondtype)
        thirdtype = toupper(thirdtype)
        local strings = firsttype and secondtype and thirdtype and
                            STRINGS.SORASTRING[firsttype] and
                            STRINGS.SORASTRING[firsttype][secondtype] and
                            STRINGS.SORASTRING[firsttype][secondtype][thirdtype] or
                            firsttype and secondtype and
                            STRINGS.SORASTRING[firsttype] and
                            STRINGS.SORASTRING[firsttype][secondtype] or firsttype and
                            STRINGS.SORASTRING[firsttype] or STRINGS.SORASTRING
        local str = strings[key] or strings['GENERIC']
        if type(str) == "table" then
            str = str[math.random(#str)]
        elseif type(str) == "function" then -- 基本没啥用 后期谁用谁改吧
            str = str()
        end
        if not str then
            str = string.format('[MISS STRING->%s.%s.%s.%s]', firsttype or "", secondtype or "", thirdtype or "", key or "")
        print(str)
        end
        return str
    end
    
    -- 复制到全局
    
    for k, v in pairs(STRINGS.SORASTRING.NAMES) do STRINGS.NAMES[k] = v end
    
    for k, v in pairs(STRINGS.SORASTRING.DESCRIBE) do
        STRINGS.CHARACTERS.GENERIC.DESCRIBE[k] = v
        STRINGS.CHARACTERS.SORA.DESCRIBE[k] = v
    end
    
    for k, v in pairs(STRINGS.SORASTRING.RECIPE_DESC) do STRINGS.RECIPE_DESC[k] = v end
    for k, v in pairs(STRINGS.SORASTRING.ACTIONFAIL) do
        STRINGS.CHARACTERS.SORA.ACTIONFAIL[k] = v
        STRINGS.CHARACTERS.GENERIC.ACTIONFAIL[k] = v
    end
