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
]] --[[标准组件
]] --
local com = Class(function(self, inst)
    self.inst = inst
end)
function com:Use(doer)
    local inst = self.inst
    inst.components.inventoryitem:RemoveFromOwner(true)
    local pos = doer:GetPosition()
    inst.Transform:SetPosition(pos:Get())
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.persists = false
    inst.AnimState:PlayAnimation("fx")
    inst.AnimState:SetSortOrder(3)
    inst:StartThread(function()
        Sleep(2)
        if not (doer and doer:IsValid()) then
            inst:Remove()
            return 
        end
        if not doer.SoraRingCD then 
            doer.SoraRingCD = SoraCD(60)
        end
        if not doer.SoraRingCD() then 
            SoraAPI.Say(doer,"等一会再试试")
            inst:Remove()
            return 
        end
        local fls = TheWorld.components.soraenttrack:FindWith("sora_fl", function(inst)
            if inst and inst.components.sorabind and inst.components.sorabind.bind == doer.userid and
                inst.components.sorafllink and not inst.components.sorafllink.link then
                return true
            end
        end)
        if GetTableSize(fls) < 1 then
            SoraAPI.Say(doer,"没有找到未契约的风铃草")
        else
            for v, k in pairs(fls) do
                if v and v:IsValid() then
                    local x, y, z = inst:GetPosition():Get()
                    local flpos = v:GetPosition()
                    local sq = inst:GetDistanceSqToPoint(flpos:Get())
                    if sq >= 9 then
                        local angle = inst:GetAngleToPoint(flpos:Get())
                        local radius = 3
                        local theta = (angle) * DEGREES
                        local offset = Vector3(radius * math.cos(theta), 0, -radius * math.sin(theta))
                        local base = SpawnPrefab("archive_resonator_base")
                        base.Transform:SetPosition(x + offset.x, y, z + offset.z)
                        base.Transform:SetRotation(angle - 90)
                        base.AnimState:PlayAnimation("beam_marker")
                        base.AnimState:PushAnimation("idle_marker", true)
                        base.persists = false
                        base:DoTaskInTime(60, base.Remove)
                    end
                end
            end
        end
        inst:Remove()
    end)

end

return com
