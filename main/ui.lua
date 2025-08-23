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
]] SoraEnv()
local uianimbutton = require("widgets/uianimbutton")
local widget = require("widgets/widget")
local Image = require "widgets/image"
local Text = require "widgets/text"
local TEMPLATES = require "widgets/redux/templates"
-- 去除沙漠目镜的显示效果
local function sorahat_Goggles_Disable(self, owner)
    local ToggleGoggles_old = self.ToggleGoggles
    self.ToggleGoggles = function(self, show, ...)
        ToggleGoggles_old(self, show, ...)
        if self.owner and self.owner.replica.inventory:EquipHasTag("soragoggles") then
            self.inst.entity:Hide(false)
        end
    end
end
AddClassPostConstruct("widgets/gogglesover", sorahat_Goggles_Disable)

-- 左下角的经验的UI
local SoraExp = require("widgets/soraexp")

local function AddControls(self)
    if self.owner:HasTag("sora") then
        self.SoraExp = self:AddChild(SoraExp(self.owner))
        SoraMakeWidgetMovable(self.SoraExp.expstr, "soraexp", Vector3(100, 30, 0))

        if Config:Get("expui", false) then
            self.SoraExp:Hide()
        end

        self.wikiroot = self:AddChild(widget("root"))
        self.SoraWiki = self.wikiroot:AddChild(uianimbutton("sorawiki", "sorawiki", "close", "open", "close", "close",
            "open"))
        self.SoraWiki:SetTooltip("\t\t\t\t左键查看攻略\n\t\t\t\t右键拖动位置")
        self.SoraWiki:SetTooltipPos(70, 0, 0)
        self.SoraWiki:SetScale(0.4, 0.4, 0.4)
        self.SoraWiki.cd = SoraCD(0.5)
        self.SoraWiki:SetOnClick(function()
            if not self.SoraWiki.cd() then
                VisitURL("http://wiki.flapi.cn/url.php?id=sora", false)
            end
        end)
        self.SoraWiki:SetOnDown(function()
            self.SoraWiki.cd()
        end) -- 按下
        SoraMakeWidgetMovable(self.wikiroot, "sorawiki", Vector3(600, 500, 0))
        if Config:Get("wikiui", false) then
            self.SoraWiki:Hide()
        end
    end
end
AddClassPostConstruct("widgets/controls", AddControls)

local TextButton = require "widgets/textbutton"

local function AddControls(self)
    self.soratimeroot = self:AddChild(widget("root"))
    self.soratime = self:AddChild(TextButton())
    self.soratime:SetFont(BODYTEXTFONT)
    self.soratime:SetTextSize(50)
    self.soratime:SetTextColour({1, 1, 1, .8})
    self.soratime:SetTextFocusColour({1, 1, 1, .8})
    self.soratime:SetTooltip("右键拖动\n关闭请用小穹去配置")
    self.soratime:SetTooltipPos(70, 0, 0)
    self.soratime.inst:DoPeriodicTask(1, function()
        self.soratime:SetText(os.date("%H:%M:%S"))
    end)
    SoraMakeWidgetMovable(self.soratime, "soratime", Vector3(85, 1050, 0), {})
    if Config:Get("timeui", true) then
        self.soratime:Hide()
    end
end
AddClassPostConstruct("widgets/controls", AddControls)

-- 给容器组件添加一些事件
local function containerwidgetapi(self)
    local oldOpen = self.Open
    self.soraautoclosewidgets = {}
    self.SoraAutoClose = function(self, widget)
        table.insert(self.soraautoclosewidgets, widget)
    end
    self.Open = function(self, ...)
        oldOpen(self, ...)
        if self.container and self.container.replica.container then
            local widget = self.container.replica.container:GetWidget()
            if widget and widget.SoraOnOpenFn then
                widget.SoraOnOpenFn(self, ...)
            end
        end
    end
    local oldClose = self.Close
    self.Close = function(self, ...)
        if self.container and self.container.replica.container then
            local widget = self.container.replica.container:GetWidget()
            if widget and widget.SoraOnCloseFn then
                widget.SoraOnCloseFn(self, ...)
            end
        end
        for k, v in pairs(self.soraautoclosewidgets) do
            v:Kill()
        end
        oldClose(self, ...)
    end
    local oldRefresh = self.Refresh
    self.Refresh = function(self, ...)
        oldRefresh(self, ...)
        if self.container and self.container.replica.container then
            local widget = self.container.replica.container:GetWidget()
            if widget and widget.SoraOnRefreshFn then
                widget.SoraOnRefreshFn(self, ...)
            end
        end
    end
end
AddClassPostConstruct("widgets/containerwidget", containerwidgetapi)

-- 参考能力勋章的 感谢恒子的思路

AddClassPostConstruct("widgets/redux/cookbookpage_crockpot", function(self)
    local base_size = 128
    local cell_size = 73
    local icon_size = 20 / (cell_size / base_size)
    if self.recipe_grid then
        -- 添加标记
        local allrec = self.recipe_grid:GetListWidgets()
        local hasuse = InfoDB:Get("cook", "use", {})
        if allrec and #allrec > 0 then
            for k, v in pairs(allrec) do
                v.sora_foodrecimg = v.recipie_root:AddChild(Image("images/inventoryimages/sora_yaojing.xml",
                    "sora_yaojing.tex"))
                v.sora_foodrecimg:ScaleToSize(48, 48)
                v.sora_foodrecimg:SetPosition(-base_size / 2 + 95, base_size / 2 - 95)

                if hasuse[v.data and v.data.prefab or "no"] then
                    v.sora_foodrecimg:Show()
                else
                    v.sora_foodrecimg:Hide()
                end
                v.sora_foodrecstr = v.cell_root:AddChild(Text(CHATFONT, 30, "", UICOLOURS.WHITE))
                v.sora_foodrecstr:SetHAlign(ANCHOR_MIDDLE)
                v.sora_foodrecstr:SetVAlign(ANCHOR_MIDDLE)
                -- v.sora_foodrecstr:SetPosition(-base_size / 2 + 95, base_size / 2 - 95)
                if v.data and v.data.prefab then

                    local recname = STRINGS.NAMES[v.data.prefab:upper()] or v.data.prefab or "未知食物"
                    v.sora_foodrecstr:SetString(recname)
                    if recname:utf8len() < 4 then
                        v.sora_foodrecstr:SetSize(30)
                    else
                        v.sora_foodrecstr:SetSize(20)
                    end
                end
                if v.data and not v.data.unlocked then
                    v.sora_foodrecstr:Show()
                else
                    v.sora_foodrecstr:Hide()
                end
            end
        end
        -- hook数据应用函数
        local oldupdate_fn = self.recipe_grid.update_fn
        self.recipe_grid.update_fn = function(context, widget, data, ...)
            if oldupdate_fn then
                oldupdate_fn(context, widget, data, ...)
            end
            local hasuse = InfoDB:Get("cook", "use", {})

            if widget and widget.sora_foodrecimg then
                if hasuse[widget.data and widget.data.prefab or "no"] then
                    widget.sora_foodrecimg:Show()
                else
                    widget.sora_foodrecimg:Hide()
                end
            end
            if widget and widget.sora_foodrecstr then
                if widget.data and widget.data.prefab then

                    local recname = STRINGS.NAMES[widget.data.prefab:upper()] or widget.data.prefab or "未知食物"
                    widget.sora_foodrecstr:SetString(recname)
                    if recname:utf8len() < 4 then
                        widget.sora_foodrecstr:SetSize(30)
                    else
                        widget.sora_foodrecstr:SetSize(20)
                    end
                end

                if widget.data and not widget.data.unlocked then
                    widget.sora_foodrecstr:Show()
                else
                    widget.sora_foodrecstr:Hide()
                end
            end
        end
        -- 打开的时候更新一下数据
        InfoDB:Sync("cook")
    end
end)
PushConfigScr = function(str)
    local scr = ConfigScreen()
    TheFrontEnd:PushScreen(scr)
    return scr
end
local iconui
ConfigScreen = Class(Screen, function(self)
    Screen._ctor(self, "ConfigScreen")
    self.root = self:AddChild(Widget("root"))
    self.root:SetPosition(0, 0)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.bgimage = self.root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_bg.tex"))
    self.bgimage:ScaleToSize(850, 500)
    self.filterfn = nil
    AddLine(self.root, 4, 450, false, {
        pos = {30 - 150, 0}
    })
    AddLine(self.root, 4, 450, false, {
        pos = {30 + 135, 0}
    })
    local base_size = 128
    local cell_size = 73
    local row_w = cell_size
    local row_h = cell_size;
    local row_spacing = 3

    AddButton(self, "切换快捷皮肤UI", function()
        Config:Set("skinui", not Config:Get("skinui", false))
        if iconui and iconui[1] and iconui[2] then
            if Config:Get("skinui", false) == false then
                iconui[1]:Show()
                iconui[2]:Show()
            else
                iconui[1]:Hide()
                iconui[2]:Hide()
            end
        end
    end, {
        size = {240, 45},
        pos = {-250, 200}
    })

    AddButton(self, "切换WIKI图标", function()
        Config:Set("wikiui", not Config:Get("wikiui", false))
        if ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls and ThePlayer.HUD.controls.SoraWiki then
            if Config:Get("wikiui", false) == false then
                ThePlayer.HUD.controls.SoraWiki:Show()
            else
                ThePlayer.HUD.controls.SoraWiki:Hide()
            end
        end
    end, {
        size = {240, 45},
        pos = {-250, 150}
    })

    AddButton(self, "切换经验显示", function()
        Config:Set("expui", not Config:Get("expui", false))
        if iconui and iconui[1] and iconui[2] then
            if ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls and ThePlayer.HUD.controls.SoraExp then
                if Config:Get("expui", false) == false then
                    ThePlayer.HUD.controls.SoraExp:Show()
                else
                    ThePlayer.HUD.controls.SoraExp:Hide()
                end
            end
        end
    end, {
        size = {240, 45},
        pos = {-250, 100}
    })

    AddButton(self, "切换时间显示", function()
        Config:Set("timeui", not Config:Get("timeui", true))
        if ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls and ThePlayer.HUD.controls.soratime then
            if Config:Get("timeui", false) == false then
                ThePlayer.HUD.controls.soratime:Show()
            else
                ThePlayer.HUD.controls.soratime:Hide()
            end
        end
    end, {
        size = {240, 45},
        pos = {-250, 50}
    })

    AddButton(self, "切换强迫症箱子提示", function()
        Config:Set("chestui", not Config:Get("chestui", false))
    end, {
        size = {240, 45},
        pos = {-250, 0}
    })

    AddButton(self, "重置所有UI位置", function()
        Config:Set("chestui", not Config:Get("chestui", false))
    end, {
        size = {260, 45},
        pos = {20, 200}
    })

    AddButton(self, "重置所有设置", function()
        Config.config = {}
        Config:Save()
        SoraPushPopupDialog(nil,"已经重置所有客户端设置\n建议重启或者重新进档以保证全部生效")
    end, {
        size = {260, 45},
        pos = {20, 150}
    })

end)

function ConfigScreen:OnControl(control, down)
    if ConfigScreen._base.OnControl(self, control, down) then
        return true
    end
    if control == CONTROL_CANCEL and not down then
        -- self.buttons[#self.buttons].cb()
        self:Close()
        TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
        return true
    end
end

function ConfigScreen:Close()
    TheFrontEnd:PopScreen(self)
end

AddClassPostConstruct("screens/playerinfopopupscreen", function(self)

    self.sorabtnroot = self.root:AddChild(widget("sorabtnroot"))
    self.sorabtnroot:SetPosition(-155, -205)
    self.soraitembtn = self.sorabtnroot:AddChild(TEMPLATES.StandardButton(function()
        PushItemScr()
    end, "物品皮肤", {60, 30}))
    self.soraitembtn:SetPosition(0, 0)
    self.soracdkbtn = self.sorabtnroot:AddChild(TEMPLATES.StandardButton(function()
        PushCDKScr()
    end, "激活CDK", {60, 30}))

    self.soracdkbtn:SetPosition(-70, 0)

    self.soracfgbtn = self.sorabtnroot:AddChild(TEMPLATES.StandardButton(function()
        PushConfigScr()
    end, "穹妹配置", {60, 30}))
    self.soracfgbtn:SetPosition(70, 0)
    self.sorabtnroot:Hide()
    local old = self.MakeBG
    self.MakeBG = function(s, ...)
        if self.currentcharacter == "sora" then
            self.sorabtnroot:Show()
        else
            self.sorabtnroot:Hide()
        end
        return old(s, ...)
    end

    if self.currentcharacter == "sora" then
        self.sorabtnroot:Show()
    else
        self.sorabtnroot:Hide()
    end
end)

AddClassPostConstruct("widgets/redux/craftingmenu_pinbar", function(s)
    if s.owner and s.owner:HasTag("sora") and s.open_menu_button then
        s.sora_ui_itemicon = AddImgButton(s.open_menu_button, "sora_ui_itemicon", function()
            local scr = PushItemScr()
            if scr then
                scr:SetFilter(IsItem)
            end
        end, {
            size = {30, 30},
            pos = {80, -32}
        })
        s.sora_ui_skinicon = AddImgButton(s.open_menu_button, "sora_ui_skinicon", function()
            local scr = PushItemScr()
            if scr then
                scr:SetFilter(IsSkin)
            end
        end, {
            size = {30, 30},
            pos = {80, 32}
        })
        if Config:Get("skinui", false) then
            s.sora_ui_itemicon:Hide()
            s.sora_ui_skinicon:Hide()
        end
        iconui = LeakTableKV({s.sora_ui_itemicon, s.sora_ui_skinicon})
    end
end)
