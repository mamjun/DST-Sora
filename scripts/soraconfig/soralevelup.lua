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
]] -- 等级和经验计算关系
-- 现在前期升级更快了 后期升级更慢了 死亡惩罚也更大了
local expneed = {}
local expdead = {}
local maxlevel = 30

local function exptolev(a)
    for i = maxlevel, 1, -1 do
        if a >= expneed[i] then
            return i
        end
    end
    return 0
end

local function expfornextlev(a)
    if a >= 30 then
        return 0
    elseif a < 1 then
        return expneed[1]
    else
        return expneed[a + 1]
    end
end

local function expper( exp)
    local level = exptolev(exp)
    if level > 29 then
        return 100
    end
    local has = exp - (expneed[level ] or 0 ) 
    local next = expneed[level+1] - ( expneed[level] or 0 )
    local per = math.floor( has / next *20) *5
    return per
end

local function DeathExp(a)
    if a < 1 then
        return expdead[1]
    elseif a >= 30 then
        return expdead[30]
    else
        return expdead[a]
    end
end
local function ListExp()
    local a = ""
    local b = ""
    for i = 1, 30, 1 do
        a = a .. i .. "=" .. expneed[i] .. ","
        b = b .. i .. "=" .. expdead[i] .. ","
    end
end
if mode == 1 then
    -- 1-10级 经验 = 300 * 等级  
    -- 11-20级 经验  = 3000+500*等级
    -- 21-30级 经验 = 1000*等级
    for i = 1, 10, 1 do
        expneed[i] = 300 * i
        expdead[i] = 0
    end
    for i = 11, 20, 1 do
        expneed[i] = 500 * i - 2000
        expdead[i] = -100
    end
    for i = 21, 30, 1 do
        expneed[i] = 1000 * i - 12000
        expdead[i] = -500
    end

elseif mode == 2 then
    for i = 1, 10, 1 do
        expneed[i] = 500 * i
        expdead[i] = i > 1 and -200 or 0
    end
    for i = 11, 20, 1 do
        expneed[i] = 1500 * i - 10000
        expdead[i] = -500
    end
    for i = 21, 30, 1 do
        expneed[i] = 3000 * i - 40000
        expdead[i] = -3000
    end
elseif mode == 3 then
    for i = 1, 10, 1 do
        expneed[i] = 1000 * i
        expdead[i] = -2000
    end
    for i = 11, 20, 1 do
        expneed[i] = 3000 * i - 20000
        expdead[i] = -5000
    end
    for i = 21, 30, 1 do
        expneed[i] = 6000 * i - 80000
        expdead[i] = -10000
    end
end

-- ListExp()
-- exptolev(5000)
-- expfornextlev(10)
-- DeathExp(10)
-- exptolev(20000)
-- expfornextlev(15)
-- DeathExp(15)
-- exptolev(50000)
-- expfornextlev(20)
-- DeathExp(20)
return {
    exptolev = exptolev,
    expfornextlev = expfornextlev,
    expper = expper,
    DeathExp = DeathExp,
    ListExp = ListExp

}
