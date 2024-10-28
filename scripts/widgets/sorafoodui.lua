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


local TEMPLATES = require "widgets/redux/templates"
local function MakeDetailsLine(self, x, y, scale, image_override)
	local value_title_line = self:AddChild(Image("images/quagmire_recipebook.xml", image_override or "quagmire_recipe_line.tex"))
	value_title_line:SetScale(scale, scale)
	value_title_line:SetPosition(x, y)
end

local ui = Class(Widget, function(self,data,parent,top,left)
    Widget._ctor(self, "details_root")
	local y = top - 11
	local image_size = 110
	local name_font_size = 34
	local title_font_size = 18 --22
	local body_font_size = 16 --18
	local value_title_font_size = 18
	local value_body_font_size = 16
	y = y - name_font_size/2
	local title = self:AddChild(Text(HEADERFONT, name_font_size, data.name, UICOLOURS.BROWN_DARK))
	title:SetPosition(0, y)
	y = y - name_font_size/2 - 4
	MakeDetailsLine(self, 0, y-10, -.55, "quagmire_recipe_line_break.tex")
	y = y - 30

	local icon_size = image_size - 20

	local frame = self:AddChild(Image("images/quagmire_recipebook.xml", "cookbook_known.tex"))
	frame:ScaleToSize(image_size, image_size)
	y = y - image_size/2
	frame:SetPosition(left + image_size/2 + 30, y)
	y = y - image_size/2

	local portrait_root = self:AddChild(Widget("portrait_root"))
	portrait_root:SetPosition(frame:GetPosition())

	local food_img = portrait_root:AddChild(Image("images/inventoryimages/"..data.recipe_def.name..".xml", data.recipe_def.name..".tex"))
	food_img:ScaleToSize(icon_size, icon_size)

	local details_x = 60
	local details_y = y + 85
    local status_scale = 0.7

	local health = data.recipe_def.health ~= nil and math.floor(10*data.recipe_def.health)/10 or nil
	self.health_status = self:AddChild(TEMPLATES.MakeUIStatusBadge((health ~= nil and health >= 0) and "health" or "health_bad"))
	self.health_status:SetPosition(details_x-60, details_y)
	self.health_status.status_value:SetString(health or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
	self.health_status:SetScale(status_scale)

	local hunger = data.recipe_def.hunger ~= nil and math.floor(10*data.recipe_def.hunger)/10 or nil
	self.hunger_status = self:AddChild(TEMPLATES.MakeUIStatusBadge((hunger ~= nil and hunger >= 0) and "hunger" or "hunger_bad"))
	self.hunger_status:SetPosition(details_x, details_y)
	self.hunger_status.status_value:SetString(hunger or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
	self.hunger_status:SetScale(status_scale)

	local sanity = data.recipe_def.sanity ~= nil and math.floor(10*data.recipe_def.sanity)/10 or nil
	self.sanity_status = self:AddChild(TEMPLATES.MakeUIStatusBadge((sanity ~= nil and sanity >= 0) and "sanity" or "sanity_bad"))
	self.sanity_status:SetPosition(details_x+60, details_y)
	self.sanity_status.status_value:SetString(sanity or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
	self.sanity_status:SetScale(status_scale)

	details_y = details_y - 42

	-- Side Effects
	local effects_str = parent:_GetSideEffectString(data.recipe_def)
	if effects_str then
		details_y = details_y - value_title_font_size/2+5
		title = self:AddChild(Text(HEADERFONT, value_title_font_size, "特殊作用", UICOLOURS.BROWN_DARK))
		title:SetPosition(details_x, details_y)
		details_y = details_y - value_title_font_size/2
		MakeDetailsLine(self, details_x, details_y - 2, .5, "quagmire_recipe_line_short.tex")
		details_y = details_y - 8
		details_y = details_y - value_body_font_size/2
		local effects = self:AddChild(Text(HEADERFONT, value_body_font_size, "", UICOLOURS.BROWN_DARK))
		effects:SetMultilineTruncatedString(effects_str, 1, 190, nil, "...")
		effects:SetPosition(details_x, details_y)
		details_y = details_y - value_body_font_size/2 - 4
	end

	y = y - 12
	local row_start_y = y
	local column_offset_x = -100

	-- Food Type
	y = y - title_font_size/2
	title = self:AddChild(Text(HEADERFONT, title_font_size, STRINGS.UI.COOKBOOK.FOOD_TYPE_TITLE, UICOLOURS.BROWN_DARK))
	title:SetPosition(column_offset_x, y)
	y = y - title_font_size/2
	MakeDetailsLine(self, column_offset_x, y - 2, .3, "quagmire_recipe_line_veryshort.tex")
	y = y - 8
	y = y - body_font_size/2
	local str = STRINGS.UI.FOOD_TYPES[data.recipe_def.foodtype or FOODTYPE.GENERIC]  or STRINGS.UI.COOKBOOK.FOOD_TYPE_UNKNOWN
	local tags = self:AddChild(Text(HEADERFONT, body_font_size, str, UICOLOURS.BROWN_DARK))
	tags:SetPosition(column_offset_x, y)
	y = y - body_font_size/2 - 4

    column_offset_x = 0
	y = row_start_y

	-- Perish Rate
	y = y - title_font_size/2
	title = self:AddChild(Text(HEADERFONT, title_font_size, STRINGS.UI.COOKBOOK.PERISH_RATE_TITLE, UICOLOURS.BROWN_DARK))
	title:SetPosition(column_offset_x, y)
	y = y - title_font_size/2
	MakeDetailsLine(self, column_offset_x, y - 2, .3, "quagmire_recipe_line_veryshort.tex")
	y = y - 8
	y = y - body_font_size/2
	local str = data.recipe_def.perishtime and string.format("%.f天",(data.recipe_def.perishtime/480)) or "永不过期"
	local tags = self:AddChild(Text(HEADERFONT, body_font_size, str, UICOLOURS.BROWN_DARK))
	tags:SetPosition(column_offset_x, y)
	y = y - body_font_size/2 - 4

	column_offset_x = 100
    y = row_start_y

    
	-- Cooking Time
	y = y - title_font_size/2
	title = self:AddChild(Text(HEADERFONT, title_font_size, STRINGS.UI.COOKBOOK.COOKINGTIME_TITLE, UICOLOURS.BROWN_DARK))
	title:SetPosition(column_offset_x, y)
	y = y - title_font_size/2
	MakeDetailsLine(self, column_offset_x, y - 2, .3, "quagmire_recipe_line_veryshort.tex")
	y = y - 8
	y = y - body_font_size/2 - 4
	local str = "未知"
    if data.recipe_def.cooktime then
        str = string.format("%.f秒",data.recipe_def.cooktime * 20 * 0.8)
    end
    
	local tags = self:AddChild(Text(HEADERFONT, body_font_size, str, UICOLOURS.BROWN_DARK))
	tags:SetPosition(column_offset_x, y)
	y = y - body_font_size/2 - 4

    y = y -10
    self:AddChild(Text(HEADERFONT, title_font_size,  (data.recipe_def.mustsorapot and "穹の料理" or "配方"), UICOLOURS.BROWN_DARK)):SetPosition(-80, y)
    self:AddChild(Text(HEADERFONT, title_font_size, "禁忌", UICOLOURS.BROWN_DARK)):SetPosition(80, y)
    MakeDetailsLine(self, -80, y - 7, .5, "quagmire_recipe_line_veryshort.tex")
    MakeDetailsLine(self, 80, y - 7, .5, "quagmire_recipe_line_veryshort.tex")
    self:AddChild(Text(HEADERFONT, body_font_size*1.2, data.recipe_def.cook_need or "未知", UICOLOURS.BROWN_DARK)):SetPosition(-80, y-20)
    self:AddChild(Text(HEADERFONT, body_font_size*1.2, data.recipe_def.cook_cant or "无" , UICOLOURS.BROWN_DARK)):SetPosition(80, y-20)
	
    y = y - 40
    -- INGREDIENTS
	y = y - title_font_size/2
	title = self:AddChild(Text(HEADERFONT, title_font_size, STRINGS.UI.RECIPE_BOOK.DETAILS_LABEL_RECIPES, UICOLOURS.BROWN_DARK))
	title:SetPosition(0, y)
	y = y - title_font_size/2
	MakeDetailsLine(self, 0, y - 2, .49)
	y = y - 10
    if data.recipes and #data.recipes > 0 then
        parent:_SetupRecipeIngredientDetails(data.recipes, self, y)
    end
end)


return ui
