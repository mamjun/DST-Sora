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
local xml = "images/ui/sora_std_ui.xml"
local ui = Class(Widget, function(self, owner)
    Widget._ctor(self, "SoraStdUI")
    self.owner = owner

end)
STDUI = ui
-- 用于扩展UI的方法 
local function SetPos(u, pos, y, z)
    if y then
        u:SetPosition(pos, y, z)
    else
        u:SetPosition(pos:Get())
    end
    return u
end
local function SetTest(u, pos)
    SoraMakeWidgetMovable(u, "test", pos, {
        ValidPos = {
            minx = -2000,
            miny = -2000,
            maxx = 2000,
            maxy = 2000
        }
    })
    return u
end

function ui:Extend(u)
    u.Pos = SetPos
    u.Test = SetTest
end
function ui:Bg(x, y,hasexit)
    
    local xs, ys = 1, 1
    local bg = self:AddChild(Widget("SoraStdBg"))
    bg.bgimg = bg:AddChild(Image(xml, "back_main.tex"))
    bg.bg_right = bg.bgimg:AddChild(Image(xml, "back_right.tex"))
    SetPos(bg.bg_right, 500*xs, 180*ys)
    bg.bg_left = bg.bgimg:AddChild(Image(xml, "back_left.tex"))
    SetPos(bg.bg_left, -500, 180)
    SetPos(bg.bg_right, 500, 180)
    
    if hasexit then 
        bg.exit = self:Exit(bg.bgimg)
        SetPos(bg.exit,-685,330)
    else
        bg.bg_flower = bg.bgimg:AddChild(Image(xml, "back_flower.tex"))
        SetPos(bg.bg_flower, -680, 280)
    end
    if x and y then 
        bg.bgimg:ScaleToSizeIgnoreParent(x,y)
    end
    self:Extend(bg)
    return bg
end
function ui:Btn(par,txt, style,fn)
    style = style or tostring(math.clamp(tonumber(style or 1),1,3))
    local u = (par or self):AddChild(ImageButton(xml,"button_"..style..".tex"))
    if txt then 
        u:SetText(txt)
    end
    u:SetOnClick(function ()
        if fn then
            fn()
        end
    end)
    self:Extend(u)
    return u 
end
function ui:Line(par,style,x,y)
    style = style or tostring(math.clamp(tonumber(style or 1),1,3))
    local u = (par or self):AddChild(Image(xml,"line_"..style..".tex"))
    self:Extend(u)
    if x and y then 
        u:ScaleToSizeIgnoreParent(x,y)
    end
    return u 
end
function ui:Group(x, y)

end
function ui:Next(left)

end
function ui:Arrow(left)

end
function ui:Exit(par)
    local u = (par or self):AddChild(ImageButton(xml,"button_exit.tex"))
    u:SetOnClick(function ()
        if self.onkillfn then 
            self.onkillfn(self)
        end
        self:Kill()
    end)
    self:Extend(u)
    return u 
end
return ui
