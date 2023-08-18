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
local spicedfoods = require("spicedfoods")

local SoraFoodMemory = Class(function(self, inst)
    self.inst = inst
    self.duration = TUNING.TOTAL_DAY_TIME * 3
    self.foods = {}
    self.mults = {0.6,0.2,-0.2,-0.6,-1}
    self.mults2 = {0.6,0.2,0,0,0}
end)
local nothunger = {

}
function SoraFoodMemory:OnRemoveFromEntity()
    for k, v in pairs(self.foods) do
        v.task:Cancel()
    end
end
function SoraFoodMemory:SetDuration(duration)
end

function SoraFoodMemory:SetMultipliers(mults)
end
local function OnForgetFood(inst, self, prefab)
    self.foods[prefab] = nil
end
function SoraFoodMemory:RememberFood(inst)
end

function SoraFoodMemory:GetBaseFood(prefab)
    return prefab
end

function SoraFoodMemory:SoraRememberFood(inst)
    if inst:HasTag("sorafood") then return end
    if inst.components.edible and inst.components.edible.hungervalue < 5 then return end
    local prefab = inst.prefab
    local rec = self.foods[prefab]
    if rec ~= nil then
        rec.count = rec.count + 1
        rec.task:Cancel()
        rec.task = self.inst:DoTaskInTime(self.duration, OnForgetFood, self, prefab)
    else
        self.foods[prefab] =
        {
            count = 1,
            task = self.inst:DoTaskInTime(self.duration, OnForgetFood, self, prefab),
        }
    end
end

function SoraFoodMemory:Clear()
    self.foods = {}  
end

function SoraFoodMemory:GetMemoryCount(prefab)
    local rec = self.foods[prefab]
    return rec ~= nil and rec.count or 0
end

function SoraFoodMemory:GetFoodMultiplier(inst)
    return 1
end
function SoraFoodMemory:SoraGetFoodMultiplier(inst)
    local prefab = inst.prefab
    local count = self:GetMemoryCount(prefab)
    local mul = self.mults
    if inst.components.edible and inst.components.edible.healthvalue > 60 then
        mul =  self.mults2
    end
    
    return count > 0 and mul and mul[math.min(#mul, count)] or 1
end
function SoraFoodMemory:OnSave()
    if next(self.foods) ~= nil then
        local foods = {}
        for k, v in pairs(self.foods) do
            foods[k] = { count = v.count, t = GetTaskRemaining(v.task) }
        end
        return { foods = foods }
    end
end

function SoraFoodMemory:OnLoad(data)--, ents)
    if data.foods ~= nil then
        for k, v in pairs(data.foods) do
            local rec = self.foods[k]
            if rec ~= nil then
                rec.count = v.count or 1
                rec.task:Cancel()
                rec.task = self.inst:DoTaskInTime(v.t or self.duration, OnForgetFood, self, k)
            else
                self.foods[k] =
                {
                    count = v.count or 1,
                    task = self.inst:DoTaskInTime(v.t or self.duration, OnForgetFood, self, k)
                }
            end
        end
    end
end

return SoraFoodMemory
