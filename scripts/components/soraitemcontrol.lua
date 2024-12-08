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
]] --[[关联物品
]] --
local com = Class(function(self, inst)
    self.inst = inst
    self.inst:DoTaskInTime(0, self.MustByControl)
end)
function com.MustByControl(inst)
    local self = inst.components.soraitemcontrol
    if self.items then
        return
    end
    if not self.controlby then
        inst:Remove()
    end
end
function com:InitPlayer()
    self.items = {}
    self.inst:ListenForEvent("onremove", self.OnPlayerRemove)
    self.itemremovefn = nil
    self.controlchestfn = self.inst:DoPeriodicTask(1, self.ControlCheck)
end
function com.ControlCheck(inst)
    local self = inst.components.soraitemcontrol
    if self.items and next(self.items) then
        local toremove = {}
        for k, v in pairs(self.items) do
            if v and v.sq then
                local sq = self.inst:GetDistanceSqToInst(k)
                if sq > v.sq then
                    table.insert(toremove, k)
                end
            end
        end
        for k, v in pairs(toremove) do
            self:ItemRemove(v)
            v:Remove()
        end
    end
end
-- 玩家离开移除所有相关物品
function com.OnPlayerRemove(inst)
    local self = inst.components.soraitemcontrol
    if self.items and next(self.items) then
        for k, v in pairs(self.items) do
            local s = k.components.soraitemcontrol
            if not (self.itemremovefn and not self.itemremovefn(self, s)) then
                s.controlby = false
                k:Remove()
            end
        end
    end
    self.items = {}
end
function com:CreateItem(prefab,skin)
    local item = SpawnPrefab(prefab,skin)
    if not item then
        return
    end
    if not item.components.soraitemcontrol then
        item:Remove()
        return
    end
    local itemc = item.components.soraitemcontrol
    if itemc.tags then
        for k, tag in pairs(itemc.tags) do
            self:RemoveByTag(tag)
            self.items[item] = self.items[item] or {}
            self.items[item].tags = itemc.tags
        end
    end
    if itemc.range then
        self:AddRangeControl(item, itemc.range)
    end
    itemc:InitItem(self.inst, self)
    if item.components.soraitem and item.components.soraitem.bind then
        item.components.soraitem:Bind(self.inst)
    end
    local pos = self.inst:GetPosition()
    if item.components.inventoryitem then 
        self.inst.components.inventory:GiveItem(item,nil,pos)
    elseif item.Transform then 
        item.Transform:SetPosition(pos:Get())
    end

end
function com:RemoveByTag(tag)
    local toremove = {}
    for k, v in pairs(self.items) do
        if v and v.tags and table.contains(v.tags, tag) then
            table.insert(toremove, k)
        end
    end
    for k, v in pairs(toremove) do
        self:ItemRemove(v)
        v:Remove()
    end
end
function com:AddTagControl(item, tag)
    self:RemoveByTag(tag)
    local con = self.items[item] or {}
    local tags = con.tags or {}
    table.insert(tags, tag)
end
function com:AddRangeControl(item, range)
    local con = self.items[item] or {}
    con.sq = range * range
end
function com:UnControl(item)
    self.items[item] = nil
    item.components.soraitemcontrol:UnInitItem()
end
function com:ItemRemove(item)
    self.items[item] = nil
    item.components.soraitemcontrol.controlby = false
end
function com:UnInitItem()
    self.owner = nil
    self.control = nil
    self.controlby = false
    self.itemremovefn = nil
    self.inst:RemoveEventCallback("onremove", self.OnItemRemove)
    self.inst.persists = true -- 不保存
end

function com:InitItem(doer, control)
    self.owner = doer
    self.control = control
    self.controlby = true
    -- self.itemremovefn = nil
    -- self.tags = nil 
    -- self.range = nil 
    self.inst:ListenForEvent("onremove", self.OnItemRemove)
    self.inst.persists = false -- 不保存
end
-- 物品被移除出
function com.OnItemRemove(inst)
    local self = inst.components.soraitemcontrol
    if self.controlby and self.control then
        if self.itemremovefn and not self.itemremovefn(self.control, self) then
            return
        end
        self.control:ItemRemove(inst, self)
    end
end

return com
