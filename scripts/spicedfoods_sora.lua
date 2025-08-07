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
]]

require("tuning")

local spicedfoods = require("spicedfoods")
local newspicedfoods  = 
	{}
local function oneaten_garlic(inst, eater)
    if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
        not (eater.components.health ~= nil and eater.components.health:IsDead()) and
        not eater:HasTag("playerghost") then
        eater.components.debuffable:AddDebuff("buff_playerabsorption", "buff_playerabsorption")
    end
end

local function oneaten_sugar(inst, eater)
    if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
        not (eater.components.health ~= nil and eater.components.health:IsDead()) and
        not eater:HasTag("playerghost") then
        eater.components.debuffable:AddDebuff("buff_workeffectiveness", "buff_workeffectiveness")
    end
end

local function oneaten_chili(inst, eater)
    if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
        not (eater.components.health ~= nil and eater.components.health:IsDead()) and
        not eater:HasTag("playerghost") then
        eater.components.debuffable:AddDebuff("buff_attack", "buff_attack")
    end
end

local function oneaten_aping(inst, eater)
    if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
        not (eater.components.health ~= nil and eater.components.health:IsDead()) and
        not eater:HasTag("playerghost") then
        eater.components.debuffable:AddDebuff("buff_attack", "buff_attack")
    end
end

local function oneaten_yaojing(inst, eater)
    if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
        not (eater.components.health ~= nil and eater.components.health:IsDead()) and
        not eater:HasTag("playerghost") then
        eater.components.debuffable:AddDebuff("buff_attack", "buff_attack")
    end
end
STRINGS.NAMES.SORA_APING_FOOD = "酱香{food}"
STRINGS.NAMES.SORA_YAOJING_FOOD = "秘制{food}"
local SPICES =
{
    SPICE_GARLIC = 
	{ oneatenfn = oneaten_garlic, prefabs = 
	{ "buff_playerabsorption" } },
    SPICE_SUGAR  = 
	{ oneatenfn = oneaten_sugar, prefabs = 
	{ "buff_workeffectiveness" } },
    SPICE_CHILI  = 
	{ oneatenfn = oneaten_chili, prefabs = 
	{ "buff_attack" } },
    SPICE_SALT   = 
	{},
    -- SORA_APING   = 
	-- {oneatenfn = oneaten_aping, prefabs = 
	-- { "buff_attack" } },
    -- -- SORA_YAOJING   = 
	-- {oneatenfn = oneaten_yaojing, prefabs = 
	-- { "buff_attack" } },
}
function SoraGetNewRecipes()
    return newspicedfoods
end
local skipfood = 
	{}
function SoraNoRepairSpicedFood(food)
    if food and food.name then
        skipfood[food.name] = 1
    end
end
function SoraRepairSpicedFood(food)
    if not food then return end
    if food.spice then return end   --已经调味过了，跳过！
    for spicenameupper, spicedata in pairs(SPICES) do
        local foodname = food.name
        if spicedfoods[foodname] then return  end   --本身就是调味过的食物 就不需要再加了
        local spicename = string.lower(spicenameupper)
        local newname = foodname.."_"..spicename
        if not spicedfoods[newname] and not skipfood[newname] then        --不存在则添加 已经有调味版了，跳过！
            local newdata = shallowcopy(food)
            if food.name == "wetgoop" then
                newdata.test = function(cooker, names, tags) return names[spicename] end
                newdata.priority = -10
            else
                newdata.test = function(cooker, names, tags) return names[foodname] and names[spicename] end
                newdata.priority = 100
            end
            newdata.cooktime = .12
            newdata.stacksize = nil
            newdata.spice = spicenameupper
            newdata.basename = foodname
            newdata.name = newname
            newdata.floater = 
	{"med", nil, {0.85, 0.7, 0.85}}
            spicedfoods[newname] = newdata
            newspicedfoods[newname] = newdata
            if spicename == "spice_chili" then
                if newdata.temperature == nil then
                    --Add permanent "heat" to regular food
                    newdata.temperature = TUNING.HOT_FOOD_BONUS_TEMP
                    newdata.temperatureduration = TUNING.FOOD_TEMP_LONG
                    newdata.nochill = true
                elseif newdata.temperature > 0 then
                    --Upgarde "hot" food to permanent heat
                    newdata.temperatureduration = math.max(newdata.temperatureduration, TUNING.FOOD_TEMP_LONG)
                    newdata.nochill = true
                end
            end
    
            if spicedata.prefabs ~= nil then
                --make a copy (via ArrayUnion) if there are dependencies from the original food
                newdata.prefabs = newdata.prefabs ~= nil and ArrayUnion(newdata.prefabs, spicedata.prefabs) or spicedata.prefabs
            end
    
            if spicedata.oneatenfn ~= nil then
                if newdata.oneatenfn ~= nil then
                    local oneatenfn_old = newdata.oneatenfn
                    newdata.oneatenfn = function(inst, eater)
                        spicedata.oneatenfn(inst, eater)
                        oneatenfn_old(inst, eater)
                    end
                else
                    newdata.oneatenfn = spicedata.oneatenfn
                end
            end
        end
    end
end

return newspicedfoods
