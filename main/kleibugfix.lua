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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]] -- 用于修复klei明知但是不愿意修的一些bug
local newmeta = {
    __index = function()
        return 0
    end
}
local function TryToFixAllRecipes()
    for k, v in pairs(AllRecipes) do
        local old = getmetatable(v.level)
        if not old then
            setmetatable(v.level, newmeta)
        end
    end
end

AddLaterFn(TryToFixAllRecipes)
AddSimPostInit(TryToFixAllRecipes)

-- AddComponentPostInit("container",function (s)
--     local Close = s.Close
--     s.Close = function(ss,...)
--         CheckChestValid(ss.inst)
--         return Close(ss,...)
--     end
-- end)
-- local function onowner(self, owner)
--     -- body
--     if not self.inst.replica.inventoryitem then
--         return
--     end
--     self.inst.replica.inventoryitem:SetOwner(owner)
-- end

AddComponentPostInit("inventoryitem", function(self, inst)
    -- addsetter(self, "owner", onowner)
    inst:ListenForEvent("onremove", function(i)
        if i.components.inventoryitem and i.components.inventoryitem.owner then
            local owner = i.components.inventoryitem.owner
            if owner.components.container and owner.components.container:GetItemSlot(i) then
                owner.components.container:RemoveItem(owner, true)
            end
        end
    end)
end)

if getsora("fixyzhou") then
    function GLOBAL.distsq(v1, v2, v3, v4)
        if v3 then
            local dx = v1 - v3
            local dy = v2 - v4
            return dx * dx + dy * dy
        end
        local dx = (v1.x or v1[1]) - (v2.x or v2[1])
        local dz = (v1.z or v1[3]) - (v2.z or v2[3])
        return dx * dx + dz * dz
    end
end

AddComponentPostInit("workable", function(self)
    local oldWorkedBy_Internal = self.WorkedBy_Internal
    self.WorkedBy_Internal = function(s, ...)
        return (s.workleft or 0) > 0 and oldWorkedBy_Internal(s, ...) or true
    end
end)

AddComponentPostInit("moonbeastspawner", function(self)
    self.OnEntitySleep = self.Stop
    local oldStart = self.Start
    self.Start = function(s, ...)
        if self.inst:IsAsleep() then
            self:Stop()
            return
        end
        return oldStart(s, ...)
    end
end)

AddLaterFn(function()
    local t = up.Get(HandleClientRPC, "CLIENT_RPC_HANDLERS", "networkclientrpc.lua")
    if t then
        for k, v in pairs({"PostActivateHandshake", "AddSkillXP", "SetSkillActivatedState", "LearnBuilderRecipe",
                           "TakeOversizedPicture", "ShowPopup"}) do
            if t[v] then
                local old = t[v]
                v[v] = function(...)
                    if not ThePlayer then
                        return
                    end
                    return old(...)
                end
            end
        end
    end
end)

local cmp = require "components/container"
local GetSpecificSlotForItem = cmp.GetSpecificSlotForItem
cmp.GetSpecificSlotForItem = function(self, item, ...)
    if self.inst and self.inst:HasTag("soracontainerfix") then
        for k = 1, self.numslots do
            local other_item = self.slots[k]
            if other_item and other_item.components.stackable and other_item.prefab == item.prefab and other_item.skinname == item.skinname and
                not other_item.components.stackable:IsFull() then
                return k
            end
        end
    end
    return GetSpecificSlotForItem(self, item, ...)
end

local cmp_rep = require "components/container_replica"
local GetSpecificSlotForItem = cmp_rep.GetSpecificSlotForItem
cmp_rep.GetSpecificSlotForItem = function(self, item, ...)
    if self.inst and self.inst:HasTag("soracontainerfix") then
        for k = 1, self._numslots do
            local other_item = self:GetItemInSlot(k)
            if other_item and  other_item.replica.stackable and other_item.prefab == item.prefab and other_item:StackableSkinHack(item)  and
                not other_item.replica.stackable:IsFull() then
                return k
            end
        end
    end
    return GetSpecificSlotForItem(self, item, ...)
end
--继续干牛牛
AddPrefabPostInit("babybeefalo",function (inst)
    if not inst.ShouldKeepCorpse then 
        inst.ShouldKeepCorpse = function()
            return false
        end
    end
end)
