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
                local fix = Config:Get("VisitURL", true)
                VisitURL("http://wiki.flapi.cn/url.php?id=sora", fix)
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
    self.recui = AddButton(self, "切换制作栏优化", function()
        Config:Set("recipe", not Config:Get("recipe", true))
        self.recui:SetText(Config:Get("recipe", true) and "关闭制作栏优化" or "开启制作栏优化")
    end, {
        size = {240, 45},
        pos = {-250, -50}
    })
    self.recui:SetText(Config:Get("recipe", true) and "关闭制作栏优化" or "开启制作栏优化")

    self.visitui = AddButton(self, "wiki使用内置浏览器", function()
        Config:Set("VisitURL", not Config:Get("VisitURL", true))
        self.visitui:SetText(Config:Get("VisitURL", true) and "wiki使用内置浏览器" or "wiki使用外置浏览器")
    end, {
        size = {240, 45},
        pos = {-250, -100}
    })
    self.visitui:SetText(Config:Get("VisitURL", true) and "wiki使用内置浏览器" or "wiki使用外置浏览器")



    AddButton(self, "重置所有UI位置", function()
        Config:Set("chestui", not Config:Get("chestui", false))
    end, {
        size = {260, 45},
        pos = {20, 200}
    })

    AddButton(self, "重置所有设置", function()
        Config.config = {}
        Config:Save()
        SoraPushPopupDialog(nil,
            "已经重置所有客户端设置\n建议重启或者重新进档以保证全部生效")
    end, {
        size = {260, 45},
        pos = {20, 150}
    })

    AddButton(self, "测试制作栏速度", function()
        if TestRebuildRecipes then
            TestRebuildRecipes()
        end
    end, {
        size = {260, 45},
        pos = {290, 200}
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
           
            pos = {80, -32}
        })
        s.sora_ui_skinicon = AddImgButton(s.open_menu_button, "sora_ui_skinicon", function()
            local scr = PushItemScr()
            if scr then
                scr:SetFilter(IsSkin)
            end
        end, {
           
            pos = {80, 32}
        })
        if Config:Get("skinui", false) then
            s.sora_ui_itemicon:Hide()
            s.sora_ui_skinicon:Hide()
        end
        iconui = LeakTableKV({s.sora_ui_itemicon, s.sora_ui_skinicon})
    end
end)
local TechTree = require("techtree")
local function HasRecipe(builder, recipe)
    if not builder then
        return false
    end

    if builder.inst.components.builder then
        local b = builder.inst.components.builder
        if b.station_recipes[recipe.name] or table.contains(b.recipes, recipe.name) then
            return true
        end
    elseif builder.classified ~= nil then
        if builder.classified.recipes[recipe.name] and builder.classified.recipes[recipe.name]:value() then
            return true
        end
    end
    return false
end
local function CanPrototypeRecipe(need, has, cached)
    if cached[need] ~= nil then
        return cached[need]
    end
    for i, v in ipairs(TechTree.AVAILABLE_TECH) do
        local needs = need[v] or 0
        local hass = has[v] or 0
        if hass < needs then
            cached[need] = false
            return false
        end
    end
    cached[need] = true
    return true
end
local function ShouldHintRecipe(need, has, cached)
    if Profile:GetCraftingHintAllRecipesEnabled() then
        return true;
    end
    if cached[need] ~= nil then
        return cached[need]
    end

    for k, v in pairs(need) do
        local v1 = has[tostring(k)]
        if v ~= nil and v1 ~= nil and v > v1 + 1 then
            cached[need] = false
            return false
        end
    end
    cached[need] = true
    return true
end

local function HasIngredients(builder, recipe, cache, mod)
    for i, v in ipairs(recipe.character_ingredients) do
        if not builder:HasCharacterIngredient(v) then
            return false
        end
    end
    for i, v in ipairs(recipe.tech_ingredients) do
        if not builder:HasTechIngredient(v) then
            return false
        end
    end

    for i, v in ipairs(recipe.ingredients) do
        local t = v.type
        local num = math.max(1, RoundBiasedUp(v.amount * mod))
        if not cache[t] then
            local find, findnum = builder.inst.replica.inventory:Has(t, num, true)
            cache[t] = findnum
        end
        if cache[t] < num then -- 不够
            return false
        end

    end
    return true
end

local function FixRebuildRecipes(self)
    -- print("FixRebuildRecipes", os.clock())
    local builder = self.owner.replica.builder
    local skill = self.owner.components.skilltreeupdater
    local freecrafting = builder:IsFreeBuildMode()
    local tech_trees = builder:GetTechTrees()
    local tech_trees_no_temp = builder:GetTechTreesNoTemp()
    local cached_tech_trees = {}
    local cached_tech_trees2 = {}
    local cached_tech_trees_temp = {}
    local cached_should_hint_trees = {}
    local craftinglimits = builder:GetAllRecipeCraftingLimits()
    local mod = builder:IngredientMod()
    local globalenable = self.owner.player_classified and self.owner.player_classified.soraglobalbuildenable
    local cachedtag = {}
    local cachedskill = {}
    local cacheing = {}
    local cached_can = {}
    -- tag和技能只判断一次
    for k, v in pairs(self.SoraAllSkillAndTag.t) do
        cachedtag[k] = self.owner:HasTag(k)
    end
    for k, v in pairs(self.SoraAllSkillAndTag.s) do
        cachedskill[k] = skill and skill:IsActivated(k) or false
    end

    for k, recipe in pairs(self.SoraAllValidRecipes) do

        -- 直接内联 省去重复判断
        local is_build_tag_restricted = false
        if recipe.builder_tag and not cachedtag[recipe.builder_tag] then
            is_build_tag_restricted = true
        end
        if recipe.no_builder_tag and cachedtag[recipe.no_builder_tag] then
            is_build_tag_restricted = true
        end
        if recipe.builder_skill and not cachedskill[recipe.builder_skill] then
            is_build_tag_restricted = true
        end
        if recipe.no_builder_skill and cachedskill[recipe.no_builder_skill] then
            is_build_tag_restricted = true
        end

        local knows_recipe = not is_build_tag_restricted
        local CanPrototype = nil
        if freecrafting then
            knows_recipe = true
        elseif not is_build_tag_restricted then
            knows_recipe = HasRecipe(builder, recipe)
            if not knows_recipe then
                if CanPrototypeRecipe(recipe.level, tech_trees_no_temp, cached_tech_trees) then
                    knows_recipe = true
                else
                    CanPrototype = CanPrototypeRecipe(recipe.level, tech_trees, cached_tech_trees2)
                end

            end
        end
        local should_hint_recipe
        if cached_should_hint_trees[recipe.level] == nil then
            should_hint_recipe = ShouldHintRecipe(recipe.level, tech_trees, cached_can)
            cached_should_hint_trees[recipe.level] = should_hint_recipe
        else
            should_hint_recipe = cached_should_hint_trees[recipe.level]
        end

        local meta = self.valid_recipes[recipe.name].meta
        -- meta.can_build = true/false
        -- meta.build_state = string
        -- meta.limitedamount = # or nil

        meta.limitedamount = craftinglimits[recipe.name]

        if knows_recipe or CanPrototype or should_hint_recipe or recipe.force_hint or freecrafting then -- Knows enough to see it
            -- and (self.filter == nil or self.filter(recipe.name, builder, nil)) -- Has no filter or passes the filter in place

            if builder:IsBuildBuffered(recipe.name) and not is_build_tag_restricted then
                meta.can_build = true
                meta.build_state = "buffered"
            elseif freecrafting then
                meta.can_build = true
                meta.build_state = "freecrafting"
            elseif is_build_tag_restricted then
                meta.can_build = false
                meta.build_state = "hide"
            elseif (knows_recipe or CanPrototype) then
                meta.can_build = freecrafting or globalenable or HasIngredients(builder, recipe, cacheing, mod)
                if not recipe.nounlock and not knows_recipe and
                    CanPrototypeRecipe(recipe.level, tech_trees_no_temp, cached_tech_trees_temp) then
                    -- V2C: for recipes known through temp bonus buff,
                    --     but can be prototyped without consuming it
                    meta.build_state = "prototype"
                else
                    meta.build_state = meta.can_build and "has_ingredients" or "no_ingredients"
                end
            elseif CanPrototype then
                meta.can_build = freecrafting or globalenable or HasIngredients(builder, recipe, cacheing, mod)
                meta.build_state = recipe.nounlock and (meta.can_build and "has_ingredients" or "no_ingredients") or
                                       "prototype"
            elseif recipe.force_hint then
                meta.can_build = false
                meta.build_state = "hint"
            elseif recipe.nounlock then
                meta.can_build = false
                meta.build_state = "hide"
            elseif should_hint_recipe then
                meta.can_build = false
                meta.build_state = "hint"
            else
                meta.can_build = false
                meta.build_state = "hide"
            end
        else
            meta.can_build = false
            meta.build_state = "hide"
        end
    end
end

AddClassPostConstruct("widgets/redux/craftingmenu_hud", function(self)
    local old = self.RebuildRecipes
    self.SoraRebuildRecipesCD = SoraCD(2)
    self.SoraRefreshRecipesCD = SoraCD(60)
    self.SoraRefreshRecipes = function(s)
        self.SoraAllValidRecipes = LeakTableKV()
        self.SoraAllSkillAndTag = {
            t = {},
            s = {}
        }
        for k, v in pairs(AllRecipes) do
            if IsRecipeValid(v.name) then
                self.SoraAllValidRecipes[k] = v
                if self.valid_recipes[v.name] == nil then
                    self.valid_recipes[v.name] = {
                        recipe = v,
                        meta = {}
                    }
                end
                if v.builder_tag then
                    self.SoraAllSkillAndTag.t[v.builder_tag] = true
                end
                if v.no_builder_tag then
                    self.SoraAllSkillAndTag.t[v.no_builder_tag] = true
                end
                if v.builder_skill then
                    self.SoraAllSkillAndTag.s[v.builder_skill] = true
                end
                if v.no_builder_skill then
                    self.SoraAllSkillAndTag.s[v.no_builder_skill] = true
                end
            end
        end
    end
    self:SoraRefreshRecipes()
    self.RebuildRecipes = function(s, ...)

                --防止快捷宣告的内存泄漏
        local hint = s.nav_hint:GetString()
        if #hint > 10000 then 
            s.nav_hint:SetString("提示过长，无法显示")
        end

        local fix = Config:Get("recipe", true)
        if fix then
            if not (self.owner and self.owner.replica.builder) then
                return
            end
            if self.SoraRefreshRecipesCD() then
                self:SoraRefreshRecipes()
            end
            return FixRebuildRecipes(s)
        else
            return old(s, ...)
        end
    end
    local last = -30
    local next = 0
    local OnUpdate = self.OnUpdate
    self.soradelayedneedtoupdate = false
    self.OnUpdate = function(s, dt)
        local fix = Config:Get("recipe", true)
        if fix then
            if not fix then
                return OnUpdate(s, dt)
            end
        end
        local t = os.clock()
        if s.soradelayedneedtoupdate and t > next then
            s.needtoupdate = true
            s.soradelayedneedtoupdate = false
            last = t
            -- next = os.clock() + 1
            return OnUpdate(s, dt)
        end
        if s.needtoupdate then
            if t > (last + 2) then -- 超过2秒没更新立刻更新
                last = t
                return OnUpdate(s, dt)
            end
            if t > next then -- 低于预期屏蔽更新 否则0.5秒只更新一次
                next = t + 0.5
            end
            s.soradelayedneedtoupdate = true
            s.needtoupdate = false
            return OnUpdate(s, dt)
        else
            -- s.needtoupdate = true
            -- OnUpdate(s, dt)
            return OnUpdate(s, dt)
            -- s.needtoupdate = true
        end
    end

    TestRebuildRecipes = function()
        local t = os.clock()
        for n = 1, 10 do
            for i = 1, 10 do
                self:RebuildRecipes()
            end
        end
        t = os.clock() - t
        SoraPushPopupDialog(nil, "测试刷新了100次制作栏,共耗时" .. string.format("%.4f", t or 0) .. "秒")

    end
    -- self.RebuildRecipes = TimeRecordCall(self.RebuildRecipes, "RebuildRecipes")
    -- self.OnUpdate = TimeRecordCall(self.OnUpdate, "OnUpdate")
end)

AddClassPostConstruct("widgets/redux/craftingmenu_details", function(self)
    local oldUpdateNameString = self.UpdateNameString
    self.UpdateNameString = function(s, ...)
        local ret = oldUpdateNameString(s, ...)
        if s.namestring and not s.namestring.sora_show_wiki then
            s.namestring.sora_show_wiki = AddImgButton(s.namestring, "sora", function()
                local fix = Config:Get("VisitURL", true)
                local recipe = s.data and s.data.recipe
                if recipe  and recipe.sora_show_wiki and recipe.product then 
                    VisitURL("https://wiki.flapi.cn/rurl.php?mod=sora&id="..recipe.product, fix)
                end
                
            end, {
                size = {40, 40},
                pos = {80, 0}
            })
        end
        if not s.namestring then
            return ret
        end
        local recipe = s.data and s.data.recipe
        if recipe and recipe.sora_show_wiki then
            s.namestring.sora_show_wiki:Show()
        else
            s.namestring.sora_show_wiki:Hide()
        end 

        return ret
    end
end)
