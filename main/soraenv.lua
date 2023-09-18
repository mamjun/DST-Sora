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
    end



end


InitSoraEnv()