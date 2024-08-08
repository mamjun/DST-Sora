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
]] -- local foods = require "preparefdoods_sora"
local cooking = require "cooking"

local sorafoods = require "preparedfoods_sora"
local spicedfoods = require "spicedfoods_sora"
for k, v in pairs(sorafoods) do
    if not v.notaddtopot then
        AddCookerRecipe("portablecookpot", v)
    end
    RegisterInventoryItemAtlas("images/inventoryimages/" .. k .. ".xml", k .. ".tex")
end
-- mod加载完之后 修复丢失的食物配方（主要是调料）
local oldRegisterPrefabs = GLOBAL.ModManager.RegisterPrefabs

GLOBAL.ModManager.RegisterPrefabs = function(self, ...)
    -- 这个时候 PrefanFiles文件还没有被加载
    -- 在这里读取所有的锅的菜谱并开始修复调味品
    if cooking.recipes.portablespicer then
        for name, recipe in pairs(cooking.recipes.portablespicer) do
            SoraNoRepairSpicedFood(recipe)
        end
    end

    for k, v in pairs(cooking.recipes) do
        if k and v then
            for name, recipe in pairs(v) do
                if name and recipe then
                    SoraRepairSpicedFood(recipe)
                end
            end
        end
    end
    for k, v in pairs(SoraGetNewRecipes()) do
        AddCookerRecipe("portablespicer", v)
    end
    oldRegisterPrefabs(self, ...)
end

AddSimPostInit(function()
    if TheCookbook then
        for k, v in pairs(sorafoods) do
            for i, t in pairs(v.cooktp or {}) do
                TheCookbook:AddRecipe(k, t)
            end
        end
    end
end)
