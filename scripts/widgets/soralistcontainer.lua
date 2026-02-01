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
local ui = Class(Widget, function(self)
    Widget._ctor(self, "soralistcontainer_widget")
    self.inv_ext = {}
end)
function ui:Rpc(cmd, data)
    data = data or {}
    SoraAPI.SoraRPC:PushEvent("SoraList", {
        cmd=cmd,
        data = data
    }, nil, self.container)
end
function ui:Init(widget, read_only)
    self.read_only = read_only or false
    self.inv_ext = {}
    self.container = widget.container

    for k, v in pairs(widget.inv) do
        self.inv_ext[k] = self:MakeExtend(v)
    end
    local root = widget:AddChild(Widget("root"))
    if not self.read_only then
        AddButton(root, "存入全部", function()
            self:Rpc("CollectSelf")
        end, {
            size = {150, 60},
            pos = {130, 150}
        })
        AddButton(root, "收集附近", function()
            self:Rpc("CollectAll")
        end, {
            size = {150, 60},
            pos = {130, 90}
        })
        AddButton(root, "全部取回", function()
            self:Rpc("DropAll")
        end, {
            size = {150, 60},
            pos = {130, 30}
        })
        -- AddButton(root, "全部销毁", function()
        --     self:Rpc("ClearAll")
        -- end, {
        --     size = {150, 60},
        --     pos = {130, -150}
        -- })
    end
    local listener = SoraAPI.SoraRPC:ListenForEvent("Sora2ListData", function(from, data, event)
        self.lastdata = data
    end)
    self.UpdateDatafn = function(inst, data) self:UpdateData(data) end
    self.inst:ListenForEvent("itemlose", self.UpdateDatafn, widget.container)
    self.inst:ListenForEvent("itemget", self.UpdateDatafn, widget.container)
    self.inst:ListenForEvent("refresh", self.UpdateDatafn, widget.container)
    
    local oldClose = widget.Close
    function widget.Close(s)
        SoraAPI.SoraRPC:RemoveEvent(listener)
        root:Kill()
        widget.Close = oldClose
        oldClose(s)
    end
    for k, v in pairs(widget.inv) do
        self.inv_ext[k]:MoveToFront()
    end
    self:Rpc("Refresh")
end
function ui:UpdateData(data)
    local data = data or self.lastdata
    if not (data and data.slots) then return end
    
    for slot, itemdata in pairs(data.slots or {}) do
        local ext = self.inv_ext[slot]
        if ext then
            if itemdata.num then
                ext:SetQuantity(itemdata.num)
            else
                ext.num:Hide()
            end
            if ext.inv.tile then
                ext.inv_image:Hide()
                ext.inv_image_bg:Hide()
            elseif itemdata.last then
                if itemdata.last.inv then
                    ext.inv_image:Show()
                    ext.inv_image:SetTexture(itemdata.last.inv.atlas, itemdata.last.inv.image)
                else
                    ext.inv_image:Hide()
                end
                if itemdata.last.bg then
                    ext.inv_image_bg:Show()
                    ext.inv_image_bg:SetTexture(itemdata.last.bg.atlas, itemdata.last.bg.image)
                else
                    ext.inv_image_bg:Hide()
                end
            end
        end
    end
end
function ui:MakeExtend(widget)
    local root = widget:AddChild(Widget("root"))
    widget.soraextroot = root
    root.inv = widget
    root.num = widget:AddChild(Text(NUMBERFONT, 36))
    root.SetQuantity = function(s, num)
        if num > 1 then
            s.num:Show()
        else
            s.num:Hide()
            return
        end
        root.num:MoveToFront()
        if num > 999 then
            s.num:SetSize(36)
            s.num:SetPosition(3.5, 16, 0)
            s.num:SetString("999+")
        else
            s.num:SetSize(42)
            s.num:SetPosition(2, 16, 0)
            s.num:SetString(tostring(num))
        end
    end
    root.num:MoveToFront()
    root.num:Hide()

    root.inv_image_bg = widget:AddChild(Image(GetInventoryItemAtlas("log.tex"), "log.tex", "default.tex"))
    root.inv_image_bg:SetClickable(false)
    root.inv_image_bg:SetTint(1, 1, 1, 0.4)
    root.inv_image_bg:Hide()

    root.inv_image = widget:AddChild(Image(GetInventoryItemAtlas("log.tex"), "log.tex", "default.tex"))
    root.inv_image:SetClickable(false)
    root.inv_image:SetTint(1, 1, 1, 0.4)
    root.inv_image:Hide()
    local oldSetTile = widget.SetTile
    widget.SetTile = function(...)
        local x,y,z = oldSetTile(...)
        root.num:MoveToFront()
    end
    -- root.inv_image:SetClickable(false)
    AddButton(root, "取", function()
        self:Rpc("GetOne", {
            slot = widget.num
        })
    end, {
        size = {70, 50},
        pos = {0, -45}
    })
    return root
end
return ui
