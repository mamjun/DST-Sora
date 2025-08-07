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
]] -- 多层制作栏
-- 支持多层物品栏 写的贼菜
-- 食用说明
-- version 0.3
-- datatime 2022/03/23-14:50
-- fix 0.2 : 修复多实例共存时的bug
-- tip 0.2 : 可能有重做的想法 不保证与现在版本兼容 到时候请自行更新
-- fix 0.3 : 适用新版本
local key = "sora" -- 抄代码的 记得改一下这儿 防止冲突 
-- 注意images/ui/里有个图要用的

-- 提供的API
-- MakeRecipeTabMul(tab,master)  将tab挂到master下面
-- 注册的时候 必须先挂第一层 然后第二层第三层 以此类推 要问为什么 就是因为懒
-- 文件结构
-- 文件说明
-- 提供的API
-- API实现代码
-- 相关UI组件代码

-- 需要做的 新加一层物品栏 
-- 隐藏原有配方
-- recipepopup  弹出的配方栏
-- MouseCrafting 鼠标制作栏 --继承Crafting
-- ControllerCrafting 手柄制作栏  --继承Crafting
-- CraftTabs  左侧制作栏
local ui_multab_ver = 1 -- 默认版本1  R20开始的新制作栏为版本2
if CurrentRelease.GreaterOrEqualTo("R20_QOL_CRAFTING4LIFE") then
    function MakeRecipeTabMul()  end
    return   --已弃用
else
    ui_multab_ver = 1
end
if ui_multab_ver == 2 then
    --从原版列表里

end
if ui_multab_ver == 1 then -- 版本1
    -- 将一个多层制作栏设置为多层物品栏
    -- API实现代码
    local multab = {}
    local maxlevel = 1
    -- 注意tabname 不要和现有配方重名了
    function MakeRecipeTabMul(tab, master) -- 注册的时候 必须先挂第一层 然后第二层第三层 以此类推 要问为什么 就是因为懒
        -- 当前栏，上层栏
        local tabname = tab.str
        local mastername = master.str
        tab.master = master
        -- 从总的配方表里剥离出去 就不会有自动的图标了
        CUSTOM_RECIPETABS[tabname] = nil
        multab[tabname] = tab
        -- 自动生成伪配方
        tab.mulrecipe = AddRecipe(tabname, {}, master, TECH.LOST, nil, nil, nil,
                                  nil, tab.owner_tag, tab.icon_atlas, tab.icon)
        tab.mulrecipe.multab = tab
        local level = (multab[mastername] and multab[mastername].level or 0) + 1
        multab[tabname].level = level
        multab[tabname].masters = {}
        if level > 1 then
            for k, v in pairs(multab[mastername].masters) do -- 原样复制
                table.insert(multab[tabname].masters, v)
            end
        end
        table.insert(multab[tabname].masters, mastername)
        maxlevel = math.max(maxlevel, level)
    end
    -- 屏蔽制作多层制作栏的配方
    local oldDoRecipeClick = DoRecipeClick
    GLOBAL.DoRecipeClick = function(owner, rec, skin)
        if rec and rec.name and multab[rec.name] then return false end
        return oldDoRecipeClick(owner, rec, skin)
    end

    -- 鼠标制作栏UI
    local mousecrafting = require("widgets/mousecrafting")
    local controllercrafting = require("widgets/controllercrafting")
    local widget = require("widgets/widget")
    local Image = require "widgets/image"
    local ImageButton = require "widgets/imagebutton"
    local CraftSlots = require "widgets/craftslots"
    local crafttabs
    -- 初始化制作栏
    local closing = 0
    local function ChangeToRecipe(self, recipe)
        -- print("changetorec",recipe)
        local t = GetTick()
        local s = self[key]
        if (not recipe and s.mulopen) or not self.crafting.open then -- 没配方关闭 -- 或者主栏关闭了
            for i = 1, maxlevel do
                if s.mulmousecrafting[i] then
                    s.mulmousecrafting[i]:Close()
                    s.mulmousecrafting[i].subtab = nil
                end
            end
            s.mulopen = nil
            s.recipe = nil
            closing = GetTick()
            return
        end
        local tab = multab[recipe] or
                        (AllRecipes[recipe] and AllRecipes[recipe].tab and
                            AllRecipes[recipe].tab.master and
                            AllRecipes[recipe].tab)
        if tab then -- 本身是多层或者是多层栏里的配方
            if not self.owner.replica.builder:KnowsRecipe(tab.str) then -- 没解锁配方 就不显示详细内容了 并且关闭已经打开的更高层的
                local level = tab.level - 1
                s.recipe = recipe
                for i = 1, maxlevel do
                    if s.mulmousecrafting[i] and s.mulmousecrafting[i].open then
                        if level < i then
                            s.mulmousecrafting[i]:Close()
                            s.mulmousecrafting[i].subtab = nil
                        else
                            s.mulopen = true
                        end
                    end
                end
                return
            end
            s.recipe = recipe
            s.mulopen = true
            for i = 1, maxlevel do
                if s.mulmousecrafting[i] then
                    if tab.level < i then -- 多余的关闭
                        if s.mulmousecrafting[i].open then
                            s.mulmousecrafting[i]:Close()
                            s.mulmousecrafting[i].subtab = nil
                        end
                    else
                        local tabb = multab[tab.masters[i + 1]] or
                                         CUSTOM_RECIPETABS[tab.masters[i + 1]] or
                                         tab
                        if not (s.mulmousecrafting[i].open and
                            s.mulmousecrafting[i].subtab == tabb) then
                            s.mulmousecrafting[i]:Close()
                            s.mulmousecrafting[i]:SetFilter(
                                function(recname)
                                    local recipe = GetValidRecipe(recname)
                                    return
                                        recipe ~= nil and recipe.tab == tabb and
                                            (self.owner.replica.builder == nil or
                                                self.owner.replica.builder:CanLearn(
                                                    recname))
                                end)
                            s.mulmousecrafting[i].subtab = tabb
                            s.mulmousecrafting[i]:Open()
                        end
                    end
                end
            end
        else
            for i = 1, maxlevel do
                if s.mulmousecrafting[i] then
                    s.mulmousecrafting[i]:Close()
                    s.mulmousecrafting[i].subtab = nil
                end
            end
            s.mulopen = nil
            s.recipe = nil
            closing = GetTick()
        end
    end
    local function craftslotGainFocus(self, source)
        local t = GetTick()
        -- if (t - closing) <45 then return end
        local s = self[key]
        if s.source and s.source ~= source then -- 切换源了 通知旧的处理
            s.source[key].mul = nil
            s.source:OnLoseFocus()
            s.source = s.source
        end
        local oldrecipe = s.recipe
        if source[key].mul and not (multab[source[key].mul]) then return end -- 不是自己的多层 不处理
        local newrecipe = source[key].mul or source.recipe and
                              source.recipe.name
        if not newrecipe then return end -- 旧配方不存在 不处理
        if oldrecipe == newrecipe then return end -- 配方一致 不处理
        if source.recipe and source.recipe.tab and source.recipe.tab.str and
            not multab[source.recipe.tab.str] then return end -- 不是自己的多层下的配方 不处理
        ChangeToRecipe(self, newrecipe)
    end
    AddClassPostConstruct("components/builder_replica", function(self)
        local oldKnowsRecipe = self.KnowsRecipe
        self.KnowsRecipe = function(sss, rec, ...)
            if multab[rec] then
                for k, v in pairs(AllRecipes) do
                    if v and v.tab == multab[rec] then
                        if oldKnowsRecipe(sss, k, ...) then
                            return true
                        end
                    end
                end
                return false
            else
                return oldKnowsRecipe(sss, rec, ...)
            end
        end

        local oldCanLearn = self.CanLearn
        self.CanLearn = function(sss, rec, ...)
            if multab[rec] then
                for k, v in pairs(AllRecipes) do
                    if v and v.tab == multab[rec] then
                        if oldCanLearn(sss, k, ...) then
                            return true
                        end
                    end
                end
                return false
            else
                return oldCanLearn(sss, rec, ...)
            end
        end

        local oldCanBuild = self.CanBuild
        self.CanBuild = function(sss, rec, ...)
            if multab[rec] then
                for k, v in pairs(AllRecipes) do
                    if v and v.tab == multab[rec] then
                        if oldCanBuild(sss, k, ...) then
                            return true
                        end
                    end
                end
                return false
            else
                return oldCanBuild(sss, rec, ...)
            end
        end
        local oldIsBuildBuffered = self.IsBuildBuffered
        self.IsBuildBuffered = function(sss, rec, ...)
            if multab[rec] then
                -- print("canbuild",rec)
                for k, v in pairs(AllRecipes) do
                    if v and v.tab == multab[rec] then
                        if oldIsBuildBuffered(sss, k, ...) then
                            -- print("oldKnowsRecipe",k)
                            return true
                        end
                    end
                end
                return false
            else
                return oldIsBuildBuffered(sss, rec, ...)
            end
        end
    end)
    AddClassPostConstruct("widgets/crafttabs", function(self)
        self[key] = {}
        local s = self[key]
        crafttabs = self -- 只有客机有UI对吧 ? 不会出现多个 crafttabs的对吧
        s.mulmousecrafting = {}
        for i = maxlevel, 1, -1 do
            local base = self -- s.mulmousecrafting[i-1] or self.crafting
            local root = base:AddChild(widget())
            root:SetPosition(145 * i, 0, 0)
            s.mulmousecrafting[i] = root:AddChild(mousecrafting(self.owner))
            s.mulmousecrafting[i].root = root
            s.mulmousecrafting[i]:SetScale(0.95)
            s.mulmousecrafting[i]:Hide()
        end
        self.MouseShowMul = MouseShowMul
        s.craftslotGainFocus = craftslotGainFocus
        s.CraftingClosing = self.crafting.Close
        self.crafting.Close = function(sss, ...)
            if s.source then
                s.source[key].mul = nil
                s.source:OnLoseFocus()
            end
            ChangeToRecipe(self, nil)
            return s.CraftingClosing(sss, ...)
        end
        s.OnUpdate = self.OnUpdate
        self.OnUpdate = function(sss, ...)
            local level = 0
            local open = sss.crafting.open
            if open then
                for k, v in pairs(s.mulmousecrafting) do
                    if v and v.open then level = level + 1 end
                end
                if level > 0 then -- hook掉
                    sss.preventautoclose = true -- 让他不要自动关闭
                end
            end
            s.OnUpdate(sss, ...)
            if open and level > 0 then
                sss.preventautoclose = nil
                local x = TheInput:GetScreenPosition().x
                local w, h = TheSim:GetScreenSize()
                local res_scale = math.min(w / 1280, h / 720, MAX_HUD_SCALE)
                local max_x = (465 + level * 110) * res_scale *
                                  TheFrontEnd:GetHUDScale()
                -- 465 based on 1280x720
                if x > max_x then
                    sss.crafting:Close()
                    sss.tabs:DeselectAll()
                end
            end
        end

        self.crafting:MoveToFront()

    end)
    -- 把多层配方格的点击效果改成显示配方栏

    -- 频繁调用的类 还是少用闭包吧
    local function SetRecipe(self, recepiname, ...)
        if multab[recepiname] then
            self[key].mul = recepiname
            self:SetTooltip(STRINGS.TABS[recepiname])
            local r = self[key].SetRecipe(self, recepiname, ...)
            self.recipe = nil
            return r
        else
            self[key].mul = nil
            return self[key].SetRecipe(self, recepiname, ...)
        end
    end
    local function Clear(self, ...)
        self[key].mul = nil
        self:SetTooltip(nil)
        return self[key].Clear(self, ...)
    end
    local function OnGainFocus(self, ...)
        crafttabs[key].craftslotGainFocus(crafttabs, self) -- 通知打开多层栏
        if self[key].mul then
            return true
        else
            return self[key].OnGainFocus(self, ...)
        end
    end
    local function OnLoseFocus(self, ...)
        if self[key].mul then -- 有的话由对面接管

        else
            return self[key].OnLoseFocus(self, ...)
        end
    end
    local function Refresh(self, recipename, ...)
        self[key].Refresh(self, recipename, ...)
        local rec = recipename or self.recipename
        if rec and multab[rec] then
            if self.recipepopup then self.recipepopup:Hide() end
        end
    end
    AddClassPostConstruct("widgets/craftslot", function(self)
        self[key] = {}
        local s = self[key]
        s.SetRecipe = self.SetRecipe
        self.SetRecipe = SetRecipe
        s.Clear = self.Clear
        self.Clear = Clear
        s.OnGainFocus = self.OnGainFocus
        self.OnGainFocus = OnGainFocus
        s.Refresh = self.Refresh
        self.Refresh = Refresh
    end)
    if true then return end
    -- 手柄模式兼容

    local Image = require "widgets/image"
    local Text = require "widgets/text"
    local ExtendSlot -- 定义在文件尾部
    local MulControllerTab -- 定义在文件尾部
    AddClassPostConstruct("widgets/crafttabs", function(self)
        local s = self[key]
        s.mulcontrollercrafting = {}
        for i = maxlevel, 1, -1 do
            local base = s.mulcontrollercrafting[i - 1] or
                             self.controllercrafting
            local root = base:AddChild(widget())
            root:SetPosition(-550, -250 - 120 * i, 0)
            s.mulcontrollercrafting[i] =
                root:AddChild(MulControllerTab(self.owner, 8))
            s.mulcontrollercrafting[i].root = root
            s.mulcontrollercrafting[i]:SetScale(1, 1, 1)
            s.mulcontrollercrafting[i]:Hide()
            s.mulcontrollercrafting[i].GetTabs =
                function() return self end
        end
    end)

    local function SelectRecipe(self, rec)
        local name
        if rec and rec.name then
            name = rec.name
        elseif not rec and #self.valid_recipes > 0 then
            name = self.valid_recipes[1] and self.valid_recipes[1].name
        end
        if not self.recipepopup.shown and not multab[name] then
            self.recipepopup:Show()
        end
        local r = self[key].SelectRecipe(self, rec)
        if r and name and multab[name] and self[key].extendslot then
            if self.recipepopup and self.recipepopup.shown then
                local x, y = self.recipepopup:GetPosition():Get()
                self[key].extendslot:Open(x + 300, y + 200)
            end
        elseif self[key].extendslot and self[key].extendslot.shown then
            self[key].extendslot:Close()
        end
        return r
    end
    local function OpenSubRecipeTab(self, subtab)
        local tab = self:GetTabs():OpenTab(1)
        if tab ~= nil then
            self.tabidx = 1
            self.groupname:SetString(subtab.name)

            -- self.groupimg1:SetTexture(tab.icon_atlas, tab.icon)
            -- self.groupimg2:SetTexture(tab.icon_atlas, tab.icon)

            -- self.idx = self.slot_idx_by_tab_idx[self.tabidx] or 1			
            self:SetFilter(function(recname)
                local recipe = GetValidRecipe(recname)
                return recipe ~= nil and recipe.tab == subtab and
                           (self.owner.replica.builder == nil or
                               self.owner.replica.builder:CanLearn(recname))
            end)
            -- if not self:SelectRecipe(self.selected_recipe_by_tab_idx[self.tabidx]) then
            -- self:SelectRecipe()
            -- end
            return tab
        end
    end
    local function OpenMulRecipeTab(self, recipe)
        local s = self.parent[key]
        local name = recipe and recipe.name
        if name and multab[name] then -- 展开
            local tab = multab[name]
            if not self.owner.replica.builder:KnowsRecipe(tab.str) then
                -- 没解锁配方 就不显示详细内容了 并且关闭已经打开的更高层的
                local level = tab.level - 1
                s.recipe = name
                for i = 1, maxlevel do
                    if s.mulcontrollercrafting and
                        s.mulcontrollercrafting[i].open then
                        if level < i then
                            s.mulcontrollercrafting[i]:Close()
                            s.mulcontrollercrafting[i].subtab = nil
                        else
                            s.mulopen = true
                        end
                    end
                end
                return
            end
            s.recipe = name
            s.mulopen = true
            for i = 1, maxlevel do
                if s.mulcontrollercrafting[i] then
                    if tab.level < i then
                        if s.mulcontrollercrafting[i].open then
                            s.mulcontrollercrafting[i]:Close()
                            s.mulcontrollercrafting[i].subtab = nil
                        end
                    else
                        local tabb = multab[tab.masters[i + 1]] or
                                         CUSTOM_RECIPETABS[tab.masters[i + 1]] or
                                         tab
                        if not (s.mulcontrollercrafting[i].open and
                            s.mulcontrollercrafting[i].subtab == tabb) then
                            s.mulcontrollercrafting[i]:Close()
                            s.mulcontrollercrafting[i].subtab = tabb
                            s.mulcontrollercrafting[i]:Open()
                            OpenSubRecipeTab(s.mulcontrollercrafting[i], tabb)
                        end
                    end
                end
                if i < tab.level then
                    s.mulcontrollercrafting[i].locked = true
                else
                    s.mulcontrollercrafting[i].locked = nil
                end
            end
        else
            for i = 1, maxlevel do
                if s.mulcontrollercrafting[i] then
                    s.mulcontrollercrafting[i]:Close()
                    s.mulcontrollercrafting[i].subtab = nil
                end
            end
            s.mulopen = nil
            s.recipe = nil
        end
    end
    local function OnControl(self, control, down)
        local s = self[key]
        if self.locked then
            if self.shown then
                -- print("locked")
                return true
            else
                self[key].locked = nil
            end
        end
        if s.extendslot and s.extendslot.shown and
            (control == CONTROL_ACCEPT or control == CONTROL_ACTION) then
            return true
        end
        if control == CONTROL_ROTATE_LEFT then
            -- 上一级
            local recipe = self.selected_recipe_by_tab_idx[self.tabidx]
            local name = recipe and recipe.name
            if multab[name] then
                recipe = multab[name].master.str
                recipe = AllRecipes[recipe]
            else -- 全部关闭
                recipe = nil
            end
            OpenMulRecipeTab(self, recipe)
        elseif control == CONTROL_ROTATE_RIGHT then
            -- 下一级
            local recipe = self.selected_recipe_by_tab_idx[self.tabidx]
            OpenMulRecipeTab(self, recipe)
        end
        return self[key].OnControl(self, control, down)
    end
    local function OnUpdate(self, dt)
        if self.locked then
            if self.shown then
                -- print("locked")
                return true
            else
                self[key].locked = nil
            end
        end
        return self[key].OnUpdate(self, dt)
    end
    local function Close(self, fn)
        self.locked = nil
        return self[key].Close(self, fn)
    end
    AddClassPostConstruct("widgets/controllercrafting", function(self)
        self[key] = {}
        local s = self[key]
        s.extendslot = self:AddChild(ExtendSlot())
        s.SelectRecipe = self.SelectRecipe
        self.SelectRecipe = SelectRecipe
        s.OnControl = self.OnControl
        self.OnControl = OnControl
        s.OnUpdate = self.OnUpdate
        self.OnUpdate = OnUpdate
        s.Close = self.Close
        self.Close = Close
    end)

    -- 相关UI组件代码.

    ExtendSlot = Class(widget, function(self)
        widget._ctor(self, "ExtendSlot")
        self.bg = self:AddChild(Image("images/ui/" .. key .. "extendslot.xml",
                                      key .. "extendslot.tex"))
        self.tips = self:AddChild(Text(UIFONT, 60))
        self.tips:SetPosition(0, -20, 0)
        self:Close()
    end)
    function ExtendSlot:OnControl(control, down)
        print("extend", control, down)
    end
    function ExtendSlot:Open(x, y)
        if self.parent.recipepopup and self.parent.recipepopup.shown then
            self.parent.recipepopup:Hide()
        end
        self:SetPosition(x, y)
        if TheInput:ControllerAttached() then
            self.tips:SetString(TheInput:GetLocalizedControl(1,
                                                             CONTROL_ROTATE_LEFT,
                                                             true) ..
                                    "键收起      \n      " ..
                                    TheInput:GetLocalizedControl(1,
                                                                 CONTROL_ROTATE_RIGHT,
                                                                 true) ..
                                    "键展开")
        else
            self.tips:SetString(TheInput:GetLocalizedControl(0,
                                                             CONTROL_ROTATE_LEFT,
                                                             true) ..
                                    "键收起      \n      " ..
                                    TheInput:GetLocalizedControl(0,
                                                                 CONTROL_ROTATE_RIGHT,
                                                                 true) ..
                                    "键展开")
        end
        self:Show()
    end
    function ExtendSlot:Close() self:Hide() end

    local REPEAT_TIME = .15
    local POPUPOFFSET = Vector3(-300, -360, 0)

    local selected_scale = .9
    local CRAFTING_ATLAS = nil
    local TileBG = require("widgets/tilebg")

    MulControllerTab = Class(widget, function(self, owner)
        widget._ctor(self, "MulControllerTab")
        self.owner = owner
        CRAFTING_ATLAS = GetGameModeProperty("hud_atlas") or HUD_ATLAS

        self.bg = self:AddChild(TileBG(CRAFTING_ATLAS, "craft_slotbg.tex"))
        self.craftslots = CraftSlots(8, owner)
        self:AddChild(self.craftslots)
        self.extendslot = self:AddChild(ExtendSlot())
        self.groupname = self:AddChild(Text(TITLEFONT, 100))
        -- self.groupname:SetPosition(-400, 90, 0)
        self.groupname:SetPosition(-410, 115, 0)
        self.groupname:SetHAlign(ANCHOR_LEFT)
        self.groupname:SetRegionSize(400, 120)
        self.in_pos = Vector3(550, 250, 0)
        self.out_pos = Vector3(-2000, 250, 0)
        self.locked = false
        self.valid_recipes = {}
        self.last_recipe = 1
        self.idx = 1
        self.filter = nil
        self:UpdateRecipes()
    end)
    function MulControllerTab:SetFilter(fn)
        local new_filter = filter ~= self.filter
        self.filter = filter
        if new_filter then self:UpdateRecipes() end
    end
    local function SortByKey(a, b) return a.sortkey < b.sortkey end

    function MulControllerTab:UpdateRecipes()
        if self.owner ~= nil and self.owner.replica.builder ~= nil then
            self.valid_recipes = {}
            for k, v in pairs(AllRecipes) do
                if IsRecipeValid(v.name) and
                    (self.filter == nil or self.filter(v.name)) -- Has no filter or passes the filter in place
                and
                    (self.owner.replica.builder:KnowsRecipe(v.name) --[[Knows the recipe]] or
                        ShouldHintRecipe(v.level,
                                         self.owner.replica.builder:GetTechTrees())) --[[ Knows enough to see it]] then
                    table.insert(self.valid_recipes, v)
                end
            end
            table.sort(self.valid_recipes, SortByKey)
        end
    end
    function MulControllerTab:Close()
        self.open = false
        self:Disable()
        self.craftslots:CloseAll()
        self:MoveTo(self.in_pos, self.out_pos, .33, function()
            self:Hide()
            if fn ~= nil then fn() end
        end)
        self.locked = false
        self.last_recipe = 1
        self.idx = 1
        self:StopUpdating()
        TheFrontEnd:LockFocus(false)
        TheFrontEnd:ClearFocus()
    end

    function MulControllerTab:Open(tab)
        self.open = true
        self:Enable()
        self:MoveTo(self.out_pos, self.in_pos, .33, fn)
        self:Show()
        self:UpdateScrollButtons()

        self:GetTabs():ScaleTo(self:GetTabs().base_scale, selected_scale, .15)
        self:StartUpdating()

        self.control_held = TheInput:IsControlPressed(CONTROL_OPEN_CRAFTING)
        self.accept_down = TheInput:IsControlPressed(CONTROL_PRIMARY)

        if self.oldslot ~= nil then
            self.oldslot:SetScale(1, 1, 1)
            self.oldslot = nil
        end

        if not self:OpenRecipeTab(self.tabidx) then self:OpenRecipeTab(1) end
        self.craftslots:Open(1)
        if not self:SelectRecipe(self.selected_recipe_by_tab_idx[self.tabidx]) then
            self:SelectRecipe()
        end
        self:SetFocus()
        TheFrontEnd:LockFocus(true)
    end
    function MulControllerTab:SelectRecipe(idx)
        local recipe = self.valid_recipes[idx or 1] or self.valid_recipes[1]
        if not recipe then return false end
        local slot_idx = idx - self.idx
        if slot_idx <= 1 then
            self.idx = idx - 2
        elseif slot_idx >= self.max_slots then
            self.idx = self.idx + slot_idx - self.max_slots + 1
        end
        self:UpdateRecipes()
        self.craftslots:CloseAll()
        self.craftslots:LockOpen(k - self.idx)
        local slot = self.craftslots.slots[k - self.idx]
        if slot then
            local str = recipe.name
            if multab[str] then

            else

            end

            if self.recipepopup.shown then

            else

            end
            if self.oldslot then self.oldslot:ScaleTo(1.4, 1, .1) end
            slot:ScaleTo(1, 1.4, .2)
            self.oldslot = slot
        end
        return true
    end

    function MulControllerTab:OnControl(control, down)
        if self.locked then return end
        if control == CONTROL_NEXTVALUE or control == CONTROL_PREVVALUE then
            if self.recipepopup then
                self.recipepopup:OnControl(control, down)
            end
        end
        if down or not self.open then
            return
        elseif control == CONTROL_ACCEPT or control == CONTROL_ACTION then
            if self.accept_down then
                self.accept_down = false -- this was held down when we were opened, so we want to ignore it
            else
                local skin = (self.recipepopup.skins_spinner and
                                 self.recipepopup.skins_spinner.GetItem()) or
                                 nil
                if skin ~= nil then
                    Profile:SetLastUsedSkinForItem(self.last_recipe.name, skin)
                    Profile:SetRecipeTimestamp(self.last_recipe.name,
                                               self.recipepopup.timestamp)
                end
                if not DoRecipeClick(self.owner, self.last_recipe, skin) then
                    self.owner.HUD:CloseControllerCrafting()
                end
            end
            return true
        end
    end

    function MulControllerTab:OnUpdate(dt)
        if self.locked then return end
        if not self.open or not self.owner.HUD.shown or
            TheFrontEnd:GetActiveScreen() ~= self.owner.HUD then return end
        if TheInput:IsControlPressed(CONTROL_MOVE_LEFT) then
            if elf:SelectRecipe(self.last_recipe - 1) then
                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
            end
        elseif TheInput:IsControlPressed(CONTROL_MOVE_RIGHT) then
            if self:SelectRecipe(self.last_recipe + 1) then
                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
            end
        end
    end

end
