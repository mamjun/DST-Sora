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
local ItemSlot = require "widgets/itemslot"

local seedinfo = Class(Button, function(self, seeddata)
    Button._ctor(self, "sora_seed_info")
    local btn = self:AddChild(ItemSlot("images/hud.xml", "inv_slot.tex"))
    self.btn = btn

    if seeddata then
        self.seedname = seeddata.name
        self.seednum = seeddata.num
        if seeddata.data and seeddata.data.atlas then
            self.image = self.btn:AddChild(Image(seeddata.data.atlas, seeddata.data.image))
            self.image:SetClickable(false)
            self.image:ScaleToSize(64,64)
            self.image:SetScale(0.8, 0.8)
            self.image2 = self.btn:AddChild(Image("images/ui/soraseeds.xml", "soraseeds.tex"))
            self.image2:SetClickable(false)
            self.image2:SetPosition(-13, -13, 0)
            self.image2:SetScale(0.8, 0.8)
            local str = tostring(seeddata.num)
            self.text2 = self.btn:AddChild(Text(NUMBERFONT, 36, str))
            self.text2:SetPosition(2, 16, 0)
        end
    end

    -- self.seedimage = self.btn:AddChild(Image(GetInventoryItemAtlas("seeds.tex"), "seeds.tex"))
    -- self.seedimage:SetClickable(false)
    -- self.seedimage:SetScale(0.4,0.4)
    -- self.seedimage:SetPosition(-10,-10,0)

    self.imagebg = self.btn:AddChild(Image())
    self.imagebg:SetClickable(false)

    self:SetScale(0.7, 0.7)
    -- btn:AddChild(Image())   --背景新鲜度
end)
local DB = SoraAPI.SeedCDB
local ui = Class(Widget, function(self, owner)
    Widget._ctor(self, "sora_seed_ui")
    self.owner = owner
    self.inst:DoPeriodicTask(0.1,function ()
        if not (owner and owner.replica.inventory:EquipHasTag("soraseedui")) then 
            if self.parent and self.parent.soraseedui then
                self.parent.soraseedui = nil
            end
            self:Kill()
        end
    end)
    self.seedinfos = {}
    self.staff = nil
    self.cd = SoraAPI.SoraCD(0.1)
    self.inst:AddComponent("soraseedcontainer")
    self.inst.owner = owner
    self.cmp = self.inst.components.soraseedcontainer
    self.inst:ListenForEvent("ClientDBSet", function()
        self:Refresh()
    end, TheWorld)
    self.inst:ListenForEvent("ClientDBRootSync", function()
        self:Refresh()
    end, TheWorld)
    -- self.bg = self:AddChild(Image("images/bg_redux_wardrobe_bg.xml", "wardrobe_bg.tex"))
    self.seedroot = self:AddChild(Widget("sora_seed_root"))
    self.seedbg = self.seedroot:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_bg.tex"))
    self.seedbg:SetScale(0.4, 0.4)
    self.seedbg:SetPosition(80, 40)
    self.seedroot:SetPosition(300, 0)
    SoraMakeWidgetMovable(self.seedroot, "sora_seed_uiroot", Vector3(300, 0))

    local data = self.cmp:GetAllSeeds()
    for x = 1, 5 do
        for y = 1, 5 do
            local i = x + y * 5 - 5
            local info = seedinfo(data[i])
            if info.seedname then
                info:SetOnClick(function()
                    self.cmp:GetSeeds(info.seedname)
                end)
            end
            table.insert(self.seedinfos, info)
            self.seedroot:AddChild(info)
            info:SetPosition(x * 55 - 170, y * -55 + 200, 0)
        end
    end
    self.text = self.seedroot:AddChild(Text(CHATFONT, 60, "种子空间", UICOLOURS.BLACK))
    self.text:SetPosition(220, 120, 0)
    self.text2 = self.seedroot:AddChild(Text(CHATFONT, 40, "取出\n←←←", UICOLOURS.BLACK))
    self.text2:SetPosition(180, 00, 0)
    self.btn = self.seedroot:AddChild(ImageButton())
    self.btn:SetText("存入全部种子")
    self.btn:SetOnClick(function()
        self.cmp:CollectAllSeeds()
    end)
    self.btn:ForceImageSize(170, 50)
    self.btn:SetPosition(220, -70, 0)

    self.closebtn = self.seedroot:AddChild(TextButton())
    self.closebtn:SetFont(CHATFONT)
    self.closebtn:SetTextSize(50)
    self.closebtn:SetTextColour({1, 0, 0, 1})
    self.closebtn:SetTextFocusColour({1, 0, 0, 1})
    self.closebtn:SetText("X")
    self.closebtn:SetPosition(300, 170, 0)
    self.closebtn:SetOnClick(function()
        if self.parent and self.parent.soraseedui then
            self.parent.soraseedui = nil
        end
        self:Kill()
    end)

    -- self.btn2 = self.seedroot:AddChild(ImageButton())
    -- self.btn2:SetText("关闭\n本页")
    -- self.btn2:SetOnClick(function()
    --     if self.parent and self.parent.soraseedui then
    --         self.parent.soraseedui = nil
    --     end
    --     self:Kill()
    -- end)
    -- self.btn2:ForceImageSize(100, 100)
    -- self.btn2:SetPosition(280, 00, 0)
    -- CHATFONT, 40, "存入身上全部种子",UICOLOURS.BLACK
    -- self.text:SetPosition(180,-70,0)  
    -- local info = seedinfo()
    -- self.seedroot:AddChild(info)
    -- info:SetPosition(250,-70,0)  
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
    if control == CONTROL_CANCEL then
        self.inst:DoTaskInTime(0, function()
            if self.parent and self.parent.soraseedui then
                self.parent.soraseedui = nil
            end
        
            self:Kill()
        end)
        return true
    else
        return Widget.OnControl(self, control, down)
    end
end

function ui:Refresh()
    -- if not self.cd() then return end
    local data = self.cmp:GetAllSeeds()
    local tmp = {}
    for k, v in pairs(data) do
        if v.name and v.num then
            tmp[v.name] = v.num
        end
    end

    for k, v in pairs(self.seedinfos) do
        if v.seedname and v.seednum then
            if tmp[v.seedname] ~= v.seednum then
                v.seednum = tmp[v.seedname] or 0
                v.text2:SetString(tostring(v.seednum))
            end
        end
    end
end

function ui:Open(inst)
    if inst.components.soraseedcontainer then
        self.staff = inst
    end
end
function ui:Close()
    if self.staff then
        self.staff = nil
    end
end
return ui
