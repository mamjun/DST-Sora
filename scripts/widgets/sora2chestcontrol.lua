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
SoraEnv()
local RPC

local ui = Class(Widget, function(self, owner,container, name)
    Widget._ctor(self, "sora2chestcontrol")
    if not RPC then
        RPC = SoraAPI.SoraRPC
    end
    self.owner = owner
    self.container = container or nil
    -- self.bg = self:AddChild(Image("images/bg_redux_wardrobe_bg.xml", "wardrobe_bg.tex"))
    self.bg = self:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_bg.tex"))
    self.bg:SetScale(0.25, 0.25)
    self.bg:SetPosition(80, 40)
    self:SetPosition(0, 0)
    self.text = self:AddChild(Text(CHATFONT, 40, "收集控制面板", UICOLOURS.BLACK))
    self.text:SetPosition(70, 100, 0)
    --SoraMakeWidgetMovable(self, "sora2chestcontrol", Vector3(100, 200))
    local btn = self:AddChild(ImageButton())
    btn:SetText("暂停收集")
    btn:SetPosition(10, -5, 0)
    btn:ForceImageSize(125, 70)
    btn:SetOnClick(function ()
        RPC:PushEvent("Sora2ChestControl",{cmd="Pause"})
    end)

    local btn = self:AddChild(ImageButton())
    btn:SetText("恢复收集")
    btn:SetPosition(10, 50, 0)
    btn:ForceImageSize(125, 70)
    btn:SetOnClick(function ()
        RPC:PushEvent("Sora2ChestControl",{cmd="UnPause"})
    end)

    local btn = self:AddChild(ImageButton())
    btn:SetText("暂停一天")
    btn:SetPosition(140, 50, 0)
    btn:ForceImageSize(125, 70)
    btn:SetOnClick(function ()
        RPC:PushEvent("Sora2ChestControl",{cmd="PauseDay"})
    end)

    local btn = self:AddChild(ImageButton())
    btn:SetText("暂停十天")
    btn:SetPosition(140, -5, 0)
    btn:ForceImageSize(125, 70)
    btn:SetOnClick(function ()
        RPC:PushEvent("Sora2ChestControl",{cmd="PauseTenDays"})
    end)
    RPC:PushEvent("Sora2ChestControl",{cmd="Show"})
end)

function ui:ShowTime(control, down)
    RPC:PushEvent("Sora2ChestControl",{cmd="Show"})
end
function ui:OnControl(control, down)
    if control == CONTROL_CANCEL then
        self.inst:DoTaskInTime(0, function()
            self:Kill()
        end)
        return true
    else
        return Widget.OnControl(self, control, down)
    end
end

function ui:OnUpdate()
    --print(self.owner:GetDistanceSqToInst(self.container))
    if self.owner  and self.container  and self.container:IsValid() and self.owner:IsValid() then
        if self.owner:GetDistanceSqToInst(self.container) > 16 then
            self:Kill()
        end
    end
end
return ui
