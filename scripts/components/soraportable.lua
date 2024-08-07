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
]] --[[便携组件
]] --
local Say = SoraAPI.Say
local com = Class(function(self, inst)
    self.inst = inst
    self.isitem = true -- 默认是物品
    self.ownertags = {"sora"} -- 允许操作人的tag    --默认只能小穹
    self.ontoitem = nil
    self.onnoitem = nil
    self.givetime = 1
    self.toitemanim = "pick"
    self.tonoitemanim = "place"
    self.inst:DoTaskInTime(0, function()
        self:Init()
    end)
    inst:AddComponent("deployable")
    inst:AddTag("usedeploystring")
    inst.components.deployable.Deploy = function(s, pos, doer, rot)
        if not self:ChangToNoItem(doer, pos) then
            if pos then
                inst.Transform:SetPosition(pos:Get())
            end
        end
        return true
    end
    inst.components.deployable:SetDeploySpacing(1)
end)
function com:Init()
    if self.isitem and not self.inst.components.inventoryitem.canbepickedup then
        self:ChangToItem()
    elseif not self.isitem and self.inst.components.inventoryitem.canbepickedup then
        self:ChangToNoItem()
    end
end
function com:AddOwnerTags(tags)
    for k, v in pairs(type(tags) == "table" and tags or {tags}) do
        RemoveByValue(self.ownertags, v)
        table.insert(self.ownertags, v)
    end
end
function com:RemoveOwnerTags(tags)
    for k, v in pairs(type(tags) == "table" and tags or {tags}) do
        RemoveByValue(self.ownertags, v)
    end
end
function com:IsOwner(doer)
    for k, v in pairs(self.ownertags) do
        if doer:HasTag(v) then
            return true
        end
    end
    return false
end
function com:ChangToItem(doer)
    if doer then
        if not self:IsOwner(doer) then
            return Say(doer, "我无法操作这个")
        end
        if self.isitem then
            return Say(doer, "这个已经收起来了")
        end
    end
    self.isitem = true
    local inst = self.inst

    inst:PushEvent("soratoitem", {
        doer = doer
    })
    if inst.components.container then
        inst.components.container:Close()
        inst.components.container.canbeopened = false
    end
    inst.AnimState:PlayAnimation(self.toitemanim)
    inst:DoTaskInTime(self.givetime, function()
        if inst:IsValid() then
            inst.components.inventoryitem.canbepickedup = true
            if inst.components.container then
                inst.components.container.canbeopened = true
            end
            if doer and doer:IsValid() then
                doer.components.inventory:GiveItem(inst)
            end
        end
    end)
    if self.onitem then
        self.onitem(inst, doer)
    end
end
function com:ChangToNoItem(doer, pos)
    if doer then
        if not self:IsOwner(doer) then
            return Say(doer, "我无法操作这个")
        end
        if not self.isitem then
            return Say(doer, "这个需要先收起来")
        end
    end
    self.isitem = false
    local inst = self.inst
    inst.components.inventoryitem:OnDropped()
    inst.components.inventoryitem.canbepickedup = false
    if inst.components.container then
        inst.components.container:Close()
    end
    if (pos and doer) then
        inst.Transform:SetPosition(pos:Get())
        inst:PushEvent("soratonoitem", {
            doer = doer
        })
    end
    inst.AnimState:PlayAnimation(self.tonoitemanim)
    if self.onnoitem then
        self.onnoitem(inst, doer, pos)
    end
end
function com:OnSave()
    return {
        isitem = self.isitem
    }
end

function com:OnLoad(data)
    if not data then
        return
    end
    self.isitem = data.isitem and true or false
end

function com:GetDebugString()
    return ""
end

return com
