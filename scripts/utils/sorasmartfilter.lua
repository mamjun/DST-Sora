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

--食用说明  可以根据人物TAG 来决定是否显示某些过滤器   注意此处的tag 必须是人物生成的时候 就固有的tag，不支持 动态添加或者移除
--Filter 需要先使用 AddRecipeFilter 来创建

--示例  modmain里面 
--[[
    local name = "sorasmartfilter"
    local xml = "images/inventoryitems1.xml"
    local image = "log.tex"
    AddRecipeFilter({name=name,atlas=xml,image=tex})
    STRINGS.UI.CRAFTING_FILTERS[name:upper()] = "测试"
    local smart = require "utils/sorasmartfilter"
    smart(name,"sora")
]]--
local SmartFilterFixVersion = 1 
local function TryToFixUi(ui)
    if not ui.SmartFilterFix then       --没人初始化过
        ui.SmartOldMakeFilterPanel = ui.MakeFilterPanel --保存旧函数
        ui.SmartFilterFix = SmartFilterFixVersion   
    elseif ui.SmartFilterFix < SmartFilterFixVersion then   --有人初始化过就升级版本
        ui.SmartFilterFix = SmartFilterFixVersion
    else
        return  --其他情况不需要HOOK
    end
    --初始化 OR  升级版本
    ui.MakeFilterPanel = function(s,width,...)
        local OldCRAFTING_FILTER_DEFS = CRAFTING_FILTER_DEFS    --保存参数然后copy
        local NewDefs = {}
        CRAFTING_FILTER_DEFS = NewDefs
        for k,v in pairs(OldCRAFTING_FILTER_DEFS) do
            if v then
                if not v.OwnerTag then
                    table.insert(NewDefs,v)
                elseif v.OwnerTag and s.owner and s.owner:HasTag(v.OwnerTag) then
                    table.insert(NewDefs,v)
                end
            end
        end
        local r = ui.SmartOldMakeFilterPanel(s,width,...)
        CRAFTING_FILTER_DEFS = OldCRAFTING_FILTER_DEFS          --返回原值
        return r --返回原值
    end
end
local ui = require "widgets/redux/craftingmenu_widget"
TryToFixUi(ui)
local function MakeSmartFilter(filtername,ownertag)
    if CRAFTING_FILTERS[filtername:upper()] then        --因为 CRAFTING_FILTER_DEFS 和 CRAFTING_FILTERS 里面指向的内容是同一个表 所以修改 CRAFTING_FILTERS 也会影响 CRAFTING_FILTER_DEFS
        CRAFTING_FILTERS[filtername:upper()].OwnerTag = ownertag
    end
end

return MakeSmartFilter