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
    --初始化
    --配置读取
    GLOBAL.TUNING.SORAMODE = GetModConfigData("mode")
    mode = GLOBAL.TUNING.SORAMODE
    GLOBAL.TUNING.SORAADD = GetModConfigData("add")
    GLOBAL.TUNING.SORAWIKI = GetModConfigData("wiki",true)
    GLOBAL.TUNING.SORAPACK = GetModConfigData("pack")
    GLOBAL.TUNING.SORAADD2 = GetModConfigData("add2")
    GLOBAL.TUNING.SORACHESTRANGE = GetModConfigData("chest") or 60
    GLOBAL.TUNING.SORAMODNAME = modname
    GLOBAL.TUNING.SORAVERSION = modinfo.version
    --加载模块
    function mi(str) modimport("scripts/soramain/"..str) end
    --日志上传
    mi("logupload")
    --相关API 提供给mod使用
    mi("api")
    --导入maindb
    mi("soramaindb")
    --导入皮肤api
    mi("skins")
    mi("soraskin")
    --资源加载
    mi("assets")
    --修改过的动画包
    mi("editedanim")
    --制作配方
    mi("recipes")
    --食物
    mi("food")
    --容器
    mi("containers")
    --字符
    mi("strings")
    --UI
    if GetModConfigData("disableui_multab") then
        function MakeRecipeTabMul () end
    else
        mi("ui_multab") --多层制作栏
    end
    mi("ui")
    --动作
    mi("action")
    --钩子相关 修改部分原有机制
    mi("hook")
    --兼容、联动
    mi("link")
    --平衡
    mi("ban")
    --修复klei的bug
    mi("kleibugfix")
    --自动更新
    modimport("scripts/soraupdate/main")
    --注册全局API
    GLOBAL.SoraAPI = env
    GLOBAL.SORAAPI = env
    -- 添加角色
    AddModCharacter("sora", "FEMALE")
