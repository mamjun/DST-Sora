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
]] --[[标准组件
]] --
local com = Class(function(self, inst)
    self.inst = inst
    self.scale = 1
    self.offset = Point(0, 0, 0)
end)

function com:SetPosOffset(offset)
    local pos = self.inst:GetPosition()
    offset.x = math.clamp(offset.x, -20, 20)
    offset.y = math.clamp(offset.y, -7, 7)
    offset.z = math.clamp(offset.z, -20, 20)
    local newoffet = offset - self.offset
    self.offset = offset
    pos = pos + newoffet
    self.inst.Transform:SetPosition(pos:Get())
end
function com:AddPosOffset(offset)
    local newoff = self.offset + offset
    self:SetPosOffset(newoff)
end
function com:SetScale(scale)
    scale = math.clamp(scale, 0.05, 50)
    local xs, ys, zs = self.inst.Transform:GetScale()
    xs = xs / self.scale * scale
    ys = ys / self.scale * scale
    zs = zs / self.scale * scale
    self.inst.Transform:SetScale(xs, ys, zs)
    self.scale = scale
end
function com:AddScale(scale)
    local newscale = scale + self.scale
    self:SetScale(newscale)
end
function com:Reset()
    self:SetPosOffset(Point(0, 0, 0))
    self:SetScale(1)
end
function com:OnSave()
    local x, y, z = self.offset:Get()
    if (x == 0 and y == 0 and z == 0 and self.scale == 0) then return nil end
    return {
        scale = self.scale,
        x = x,
        y = y,
        z = z,
        add_component_if_missing_sora =  true
    }
end

function com:OnLoad(data)
    if not data then
        return
    end
    if data.scale then
        self:SetScale(data.scale)
    end
    if data.x and data.y and data.z then
        self.offset = Point(data.x, data.y, data.z)
    end
end

-- function com:OnSoraSave()
--     return {
--         --add_component_if_missing_sora = (self.pass ~= "") and 1 or nil
--     }
-- end

-- function com:OnSoraLoad(data)
--     if not data then
--         return
--     end

-- end

function com:GetDebugString()
    return string.format("pos:%s scale:%s", tostring(self.offset) or "no", tostring(self.scale) or "no")
end

return com
