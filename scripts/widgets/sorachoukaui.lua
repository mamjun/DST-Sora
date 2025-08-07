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
]] 
SoraEnv()

local ui = Class(Widget, function(self, owner)
    Widget._ctor(self, "fldbg")

    self.root = self:AddChild(Widget("fldbgbg"))
    self.bg = self.root:AddChild(Image("images/quagmire_recipebook.xml","quagmire_recipe_menu_bg.tex"))
    --self.bg:SetScale(0.35, 0.25)
    self.bg:SetPosition(0, 0)
    --AddText(self,"抽卡规则",{pos={220,120},size=40})
    
    local root = self.root
    

    local choukajilu_root = root:AddChild(Widget("details_root"))
	choukajilu_root:SetPosition(400, 0)
    choukajilu_root:SetScale(1,1.4,1)
    AddText(root,"穹之缘:",{pos={125,320},size=50})
    self.ynum = AddText(root,"83",{pos={195,317},size=45})
    AddText(root,"抽卡记录",{pos={405,320},size=50})

	local details_decor = choukajilu_root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_block.tex"))
    details_decor:ScaleToSize(360, 500)
	details_decor = choukajilu_root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_corner_decoration.tex"))
    details_decor:ScaleToSize(100, 100)
	details_decor:SetPosition(-120, -190)
	details_decor = choukajilu_root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_corner_decoration.tex"))
    details_decor:ScaleToSize(-100, 100)
	details_decor:SetPosition(120, -190)

    details_decor = choukajilu_root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_line_break.tex"))
    details_decor:SetScale(0.5,0.5)
    details_decor:SetPosition(0, 210)
    AddButton(choukajilu_root,"领取剩余奖品",NilFn,{size={185,50},pos={0,-220}})
	--value_title_line:SetScale(scale, scale)
	--details_decor:SetPosition(x, y)
    
    AddButton(root,"祈愿一次",NilFn,{size={145,50},pos={0,-320}})
    AddButton(root,"祈愿十次",NilFn,{size={145,50},pos={140,-320}})
    self.closebtn = self.root:AddChild(TextButton())
    self.closebtn:SetFont(CHATFONT)
    self.closebtn:SetTextSize(80)
    self.closebtn:SetTextColour({1, 0, 0, 1})
    self.closebtn:SetTextFocusColour({1, 0, 0, 1})
    self.closebtn:SetText("X")
    self.closebtn:SetPosition(550, 340, 0)
    self.closebtn:SetOnClick(function ()
        self:Kill()
    end)
    AddText(root,"本期UP!",{pos={-85,120},size=80}):SetRotation(-15)
end)

function ui:OnGainFocus()
    SoraAPI.SetModHUDFocus("sora_seedui",true) 
end
function ui:OnLoseFocus()
    SoraAPI.SetModHUDFocus("sora_seedui",false) 
end
function ui:OnHide()
    SoraAPI.SetModHUDFocus("sora_seedui",false) 
end
function ui:StopFollowMouse()
    ui._base.StopFollowMouse(self)
    SoraAPI.SetModHUDFocus("sora_seedui",false) 
end

function ui:OnControl(control, down)
    if ui._base.OnControl(self,control, down) then return true end
    if control == CONTROL_CANCEL then
        self.inst:DoTaskInTime(0, function()
            self:Kill()
        end)
        return true
    elseif control == CONTROL_ACCEPT then
		return true
	end
end

return ui
