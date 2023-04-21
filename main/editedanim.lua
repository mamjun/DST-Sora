--[[
授权级别:开放级
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
-- modimport引用这个文件 可以自动处理和 EditedAnim的依赖关系
-- 请自己拷贝走然后修改
-- 专服不需要
if GLOBAL.TheNet:IsDedicated() then return end

local PopupDialogScreen = require "screens/redux/popupdialog"
local mod_name = IsRail() and 'workshop-2199027653598529357' or
                     'workshop-2384660166'
local function PushSubscribeDialog()
    TheSim:SubscribeToMod(mod_name)
    local function doclose() TheFrontEnd:PopScreen(screen) end
    local screen = PopupDialogScreen(modinfo.name .. ":提示",
                                     '已尝试自动订阅 :EditedAnims \n请稍后到mods列表里查看并勾选\n请订阅mod后,不要忘记开启mod!!!\n如果是服务器请联系服主开启mod\n如果订阅失败可到工坊手动订阅',
                                     {
        {text = '确定并退出', cb = function() GLOBAL.DoRestart(true) end}
    })
    TheFrontEnd:PushScreen(screen)
end
local function PushPopupDialog()
    local function doclose() TheFrontEnd:PopScreen(screen) end
    local screen = PopupDialogScreen(modinfo.name .. ":提示",
                                     '本模组需要依赖mods :EditedAnims \n请订阅mod并到mod界面开启后再试\n请订阅mod后,不要忘记开启mod!!!',
                                     {
        {
            text = '自动订阅',
            cb = function()
                doclose()
                PushSubscribeDialog()
            end
        },
        {text = '确认并退出', cb = function() GLOBAL.DoRestart(true) end}

    })
    TheFrontEnd:PushScreen(screen)
end

--

AddClassPostConstruct("widgets/controls",function()
    if GLOBAL.TUNING.EDITED_ANIM then -- 存在则不处理
        return
    end
    TheWorld:DoTaskInTime(0.1, PushPopupDialog)
end)
