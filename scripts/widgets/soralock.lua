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
local json = SoraAPI.json
local RPC = SoraAPI.SoraRPC
local passlock = Class(Widget, function(self)
    Widget._ctor(self, "sora_lock_lock")
    self.num = 0
    self.bg = self:AddChild(Image("images/hud.xml", "inv_slot.tex"))
    self.bg:SetScale(0.5, 0.8)
    self.text = self:AddChild(Text(CODEFONT, 60, "0", UICOLOURS.BLACK))
    self.cd = SoraCD(0.1)
    self.cdrpc = SoraCD(0.5)
end)

function passlock:OnControl(control, down)
    if control == CONTROL_SCROLLFWD and self.cd() then
        self.num = (self.num - 1) % 10
        self.text:SetString(tostring(self.num))
        return true
    elseif control == CONTROL_SCROLLBACK  and self.cd() then
        self.num = (self.num + 1) % 10
        self.text:SetString(tostring(self.num))
        return true
    else
        return Widget.OnControl(self, control, down)
    end
end

local ui = Class(Widget, function(self, owner,container, name)
    Widget._ctor(self, "sora_lock_ui")
    self.owner = owner
    -- self.is_screen = true
    self.seedinfos = {}
    self.staff = nil
    self.container = container or nil
    -- self.bg = self:AddChild(Image("images/bg_redux_wardrobe_bg.xml", "wardrobe_bg.tex"))
    self.bg = self:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_bg.tex"))
    self.bg:SetScale(0.6, 0.4)
    self.bg:SetPosition(80, 40)
    self:SetPosition(0, 0)
    SoraMakeWidgetMovable(self, "sora_lock_ui", Vector3(0, 0))
    self.text = self:AddChild(Text(CHATFONT, 60, "密码锁", UICOLOURS.BLACK))
    self.text:SetPosition(-60, 160, 0)
    self.text2 = self:AddChild(Text(CHATFONT, 45, "该容器已经被[".. (name or "桃子姐姐" ).."]上锁\n请输入密码解锁",
        UICOLOURS.BLACK))
    self.text2:SetPosition(-70, 80, 0)

    self.text3 = self:AddChild(Text(CHATFONT, 60, "功能区", UICOLOURS.BLACK))
    self.text3:SetPosition(280, 160, 0)

    self.btn4 = self.text3:AddChild(ImageButton())
    self.btn4:SetText("修改密码")
    self.btn4:SetPosition(-75, -45, 0)
    self.btn4:ForceImageSize(125, 50)
    self.btn4:SetOnClick(function ()
        local pass = self:GetPass()
        self:SavePass(pass)
        self:LoadPass()
        RPC:PushEvent("SoraLock",{cmd="ChangePass",pass=pass},nil,self.container)
    end)
    self.btn5 = self.text3:AddChild(ImageButton())
    self.btn5:SetText("解除密码")
    self.btn5:SetPosition(55, -45, 0)
    self.btn5:ForceImageSize(125, 50)
    self.btn5:SetOnClick(function ()
        RPC:PushEvent("SoraLock",{cmd="UndoPass"},nil,self.container)
    end)

    self.closebtn = self:AddChild(TextButton())
    self.closebtn:SetFont(CHATFONT)
    self.closebtn:SetTextSize(50)
    self.closebtn:SetTextColour({1, 0, 0, 1})
    self.closebtn:SetTextFocusColour({1, 0, 0, 1})
    self.closebtn:SetText("X")
    self.closebtn:SetPosition(400, 170, 0)
    self.closebtn:SetOnClick(function()
        self:Kill()
    end)

    self.text4 = self:AddChild(Text(CHATFONT, 60, "历史密码", UICOLOURS.BLACK))
    self.text4:SetPosition(280, 60, 0)

    -- self.edit = self:AddChild(TEMPLATES.StandardSingleLineTextEntry("CDE123", 360, 50, CHATFONT, 45))
    -- self.edit:SetPosition(-70, 00, 0)

    self.line = self:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex"))
    self.line:SetPosition(130, 40, 0)
    self.line:SetScale(1, 0.7)
    self.line2 = self:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_scroll_bar.tex"))
    self.line2:SetPosition(280, 80, 0)
    self.line2:SetScale(0.7, 0.6)
    self.line2:SetRotation(90)

    self.btn1 = self:AddChild(ImageButton())
    self.btn1:SetText("密码解锁")
    self.btn1:SetPosition(-195, -55, 0)
    self.btn1:ForceImageSize(125, 50)
    self.btn1:SetOnClick(function ()
        local pass = self:GetPass()
        self:LoadPass()
        RPC:PushEvent("SoraLock",{cmd="UnLockByPass",pass=pass},nil,self.container)
    end)

    self.btn2 = self:AddChild(ImageButton())
    self.btn2:SetText("指纹解锁")
    self.btn2:SetPosition(-70, -55, 0)
    self.btn2:ForceImageSize(125, 50)
    self.btn2:SetOnClick(function()
        RPC:PushEvent("SoraLock",{cmd="UnLockByUser"},nil,self.container)   
    end)
    self.btn3 = self:AddChild(ImageButton())
    self.btn3:SetText("暴力开锁")
    self.btn3:SetPosition(55, -55, 0)
    self.btn3:ForceImageSize(125, 50)
    self.btn3:SetOnClick(function()
        RPC:PushEvent("SoraLock",{cmd="UnLockByClick"},nil,self.container)      
    end)
    self.passes = {}
    self.pass = {}
    self.locks = {}
    for i = 1, 6 do
        local lock = self:AddChild(passlock())
        lock:SetPosition(i * 40 - 200, 5)
        table.insert(self.locks, lock)
    end
    -- 
    -- self.text:SetPosition(220, 120, 0)
    -- self.text2 = self.seedroot:AddChild(Text(CHATFONT, 40, "取出\n←←←", UICOLOURS.BLACK))
    -- self.text2:SetPosition(180, 00, 0)
    -- self.btn = self.seedroot:AddChild(ImageButton())
    -- self.btn:SetText("存入全部种子")
    -- self.btn:SetOnClick(function()
    --     self.cmp:CollectAllSeeds()
    -- end)
    -- self.btn:ForceImageSize(170, 50)
    -- self.btn:SetPosition(220, -70, 0)

    -- self.closebtn = self.seedroot:AddChild(TextButton())
    -- self.closebtn:SetFont(CHATFONT)
    -- self.closebtn:SetTextSize(50)
    -- self.closebtn:SetTextColour({1, 0, 0, 1})
    -- self.closebtn:SetTextFocusColour({1, 0, 0, 1})
    -- self.closebtn:SetText("X")
    -- self.closebtn:SetPosition(300, 170, 0)
    -- self.closebtn:SetOnClick(function()
    --     if self.parent and self.parent.soraseedui then
    --         self.parent.soraseedui = nil
    --     end
    --     self:Kill()
    -- end)
    self:LoadPass()
end)
local maxpass = 8
function ui:NewRPC(rpcname, data,cb)
    self.inst:StartThread(function ()
        local t,res = RPC:RPC(nil,rpcname,data,self.container)
        if t then 
            cb(res)
        else
            print(rpcname,t,res,type(data) == "table" and fastdump(data) or data)
        end
    end)
end

function ui:OnGainFocus()
    SoraAPI.SetModHUDFocus("sora_lock_lock", true)
end
function ui:OnLoseFocus()
    SoraAPI.SetModHUDFocus("sora_lock_lock", false)
end
function ui:OnHide()
    SoraAPI.SetModHUDFocus("sora_lock_lock", false)
end
function ui:StopFollowMouse()
    ui._base.StopFollowMouse(self)
    SoraAPI.SetModHUDFocus("sora_lock_lock", false)
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

local function passtest(str)
    str = tostring(str)
    if str:len() == 6 and str:match("^%d+$")  then
        return true
    else
        return false
    end   
end 
function ui:GetPass()
    local str = ""
    for i=1,6 do
        str =str .. tostring(self.locks[i].num)
    end
    --print("pass",str)
    return str
end
function ui:LoadPass()
    for k, v in pairs(self.passes) do
        v:Kill()
    end
    self.passes = {}
    self.pass = {}
    TheSim:GetPersistentString("sora_lock_pass", function(load_success, old_str)
        if load_success then
            local r, t = pcall(json.decode, old_str)
            if r and type(t) == "table" then
                for i = 1, maxpass do
                    if t[i] and passtest(t[i]) and t[i] ~= "000000" then
                        table.insert(self.pass, tostring(t[i]))
                    end
                end
                for k, v in pairs(self.pass) do
                    local pass = self:AddChild(ImageButton())
                    pass:SetText(v)
                    local x = (maxpass * 0.5 < k) and 1 or 0
                    local y = k - maxpass * 0.5 * x
                    pass:SetPosition(x * 140 + 210, y * -35 + 60)
                    pass:ForceImageSize(140, 40)
                    pass:SetOnClick(function ()
                        for i=1,6 do
                            self.locks[i].text:SetString(v:sub(i,i))
                            self.locks[i].num = tonumber(v:sub(i,i))
                        end
                    end)
                    table.insert(self.passes, pass)
                end
            end
        end
    end)

end
function ui:OnUpdate()
    --print(self.owner:GetDistanceSqToInst(self.container))
    if self.owner  and self.container  and self.container:IsValid() and self.owner:IsValid() then
        if self.owner:GetDistanceSqToInst(self.container) > 16 then
            self:Kill()
        end
    end
end
function ui:SavePass(str)
    str = tostring(str)
    if not passtest(str) then
        return false
    end
    if str == "000000" then
        return false
    end
    for k, v in pairs(self.pass) do
        if v == str then
            return
        end
    end
    local pass = {}
    table.insert(pass, str)
    for i = 1, maxpass - 1 do
        if self.pass[i] then
            table.insert(pass, self.pass[i])
        end
    end
    local r, str = pcall(json.encode, pass)
    if r then
        TheSim:SetPersistentString("sora_lock_pass", str, false)
        self.pass = pass
    end
    return r
end
return ui
