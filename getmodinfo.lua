modinfo = require "./modinfo_src"
local toio = "--[[" .. [[
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
]].."]]\n\n"
for k,v in pairs({"author","version","name"}) do 
    toio = toio ..string.format('%s = "%s"\n',v,_G[v])
end
toio = toio .."description = [[" .. description .."]]\n"
toio = toio ..[[ 
forumthread = ""
priority = -100000
-- API版本
api_version = 10
-- 是否支持联机版

dst_compatible = true
local plat = folder_name and
                 ((folder_name:match("19351") and 1) or
                     (folder_name:match("24235") and 2) or
                     (folder_name:match("45075") and 3) or
                     (folder_name:match("^sorav") and -1) or
                     (folder_name:match("^sora%-dev") and -1)) or 0
if plat == 1 then
    mod_dependencies = {{workshop = "workshop-2199027653598529357"}}
elseif plat == 2 then
    mod_dependencies = {{workshop = "workshop-2384660166"}}
elseif plat == 3 then
    name = name .. " Beta"
    mod_dependencies = {{workshop = "workshop-2384660166"}}
elseif plat == -1 then
    name = name .. " Dev"
    version = version .. "-dev"
    description = '当前版本：' .. version
elseif plat == 0 then
    -- 给爷爬
    mod_dependencies = {{workshop = "workshop-238466016611"}}
end

dont_starve_compatible = false
reign_of_giants_compatible = false

-- 所有客户端需要此MOD(人物mod必须开启)
all_clients_require_mod = true
-- 贴图
icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- MOD标签
server_filter_tags = {
    "character", "sora", "Sora", "qiong", "xiaoqiong", "穹", "小穹",
    "春日野穹", "Kasugano", "KasuganoSora"
}
string = string or ""
]].."\n  configuration_options = {\n"

for k, v in ipairs(configuration_options) do
    toio = toio .. "    {\n"
    if v.name then toio = toio .. string.format('    name = "%s",\n', v.name) end
    if v.label then
        v.label = v.label:gsub("\n", "\\n")
        toio = toio .. string.format('    label = "%s",\n', v.label)
    end
    if v.options then
        toio = toio .. '    options = { \n'
        for ik, iv in ipairs(v.options or {}) do
            toio = toio .. '        { '
            if iv.hover then
                toio = toio .. string.format('hover = "%s",', iv.hover)
            end
            if iv.description then
                toio = toio ..
                           string.format('description = "%s",', iv.description)
            end
            if iv.data ~= nil then
                if type(iv.data) == "boolean" then
                    toio = toio ..
                               string.format('data = %s,',
                                             iv.data and "true" or "false")
                elseif type(iv.data) == "string" then
                    toio = toio .. string.format('data = "%s",', iv.data)
                elseif type(iv.data) == "number" then
                    toio = toio .. string.format('data = "%.3s",', iv.data)
                end
            end
            toio = toio .. '}, \n'

        end
        toio = toio .. '    }, \n'
    end
    if v.default  ~= nil then
        if type(v.default) == "boolean" then
            toio = toio ..
                       string.format('    default = %s},\n',
                                     v.default and "true" or "false")
        elseif type(v.default) == "string" then
            toio = toio .. string.format('    default = "%s"},\n', v.default)
        elseif type(v.default) == "number" then
            toio = toio .. string.format('    default = "%.3s"},\n', v.default)
        else
            print(type(v.default))
        end
    end
end

toio = toio .. "}"

local f = io.open("modinfo.lua", "w")
f:write(toio)
f:close()
