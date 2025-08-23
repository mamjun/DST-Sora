
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
]]
soraenv = {} 
GLOBAL.setmetatable(soraenv, {
    __index = function(t, k)
        return  GLOBAL.rawget(env, k) or GLOBAL.rawget(GLOBAL, k)
    end
})
function  GLOBAL.SoraEnv()
    setfenv(2,soraenv)
end

function InitSoraEnv()
    SoraEnv()
    Screen = require "widgets/screen"
    Widget = require "widgets/widget"
    Image = require "widgets/image"
    Text = require "widgets/text"
    UIAnim = require "widgets/uianim"
    Button = require "widgets/button"
    TextButton = require "widgets/textbutton"
    ImageButton = require "widgets/imagebutton"
    function  AddText(inst,str,data)
        data = data or {}
        data.font = data.font or CHATFONT
        data.size= data.size or 30
        data.corlour = data.corlour or UICOLOURS.BLACK
        data.pos = data.pos or {0,0}
        local t = Text(data.font,data.size,str,data.corlour)
        local root = inst.root or inst 
        root:AddChild(t)
        t:SetPosition(data.pos[1],data.pos[2])
        return t 
    end
    function AddButton(inst,str,fn,data)
        data = data or {}
        data.font = data.font or CHATFONT
        data.size= data.size or {125,50}
        data.corlour = data.corlour or UICOLOURS.BLACK
        data.pos = data.pos or {0,0}
        local btn = ImageButton()
        local root = inst.root or inst 
        root:AddChild(btn)
        btn:SetPosition(data.pos[1],data.pos[2])
        btn:SetOnClick(fn)
        btn:SetText(str)
        if data.size then
            btn:ForceImageSize(data.size[1], data.size[2])
        end
        return btn 
    end
    function AddImgButton(inst,img,fn,data)
        data = data or {}
        data.pos = data.pos or {0,0}
        local xml,tex = SoraGetImage(img)
        local btn = ImageButton(xml,tex)
        local root = inst.root or inst 
        root:AddChild(btn)
        btn:SetPosition(data.pos[1],data.pos[2])
        btn:SetOnClick(fn)
        btn:SetText("")
        return btn 
    end
    function AddLine(inst,w,h,rot,data)
        data = data or {}
        data.pos = data.pos or {0,0}
        local line = Image("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex")
        line:SetRotation(rot and 90 or 0)
        line:ScaleToSize(w or 4, h or 300)
        inst:AddChild(line)
        line:SetPosition(data.pos[1],data.pos[2])
        return line
    end
    require "widgets/sorastdui"
end


InitSoraEnv()