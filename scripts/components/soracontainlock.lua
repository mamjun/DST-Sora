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
]] --[[专属交互
]] --
local Say = SoraAPI.Say
local GetPlayerOnline = SoraAPI.GetPlayerOnline
local com = Class(function(self, inst)
    self.inst = inst
    self.lockername = ""
    self.lockeruserid = ""
    self.pass = ""
    self.hooks = {}
    self.openpass = {}
end)
local tohook = {
    container = {
        Open = 1,
        DropEverything = 1
    },
    workable = {
        WorkedBy = 1,
        WorkedBy_Internal = 1
    },
    burnable = {}
}

local function passtest(str)
    str = tostring(str)
    if str:len() == 6 and str:match("^%d+$")  then
        return true
    else
        return false
    end   
end 


local function nilfn()
    -- body
    return true
end
function com:Init(doer, pass, name, id)
    if not self.inst.components.container then
        return
    end
    if self.pass ~= "" then
        return
    end
    if TUNING.SORALOCK1 then
        return
    end
    local cmp = self.inst.components
    local container = self.inst.components.container
    for k, v in pairs(tohook) do

        if cmp[k] then
            if not self.hooks[k] then
                self.hooks[k] = {}
            end
            for ik, iv in pairs(v) do
                self.hooks[k][ik] = cmp[k][ik]
                cmp[k][ik] = nilfn
            end
        end

    end
    container.Open = function(s, doer, ...)
        if not (doer and doer:HasTag("player")) then return end
        local last = GetTick() - (self.openpass[doer.userid or "nil"] or 0 )
        if last < 60 * 30  then
            self:Open(doer)
        else 
        SoraAPI.r_event(doer, "OpenLockUI", {
            name = self.lockername
        }, s.inst)
        end
    end
    self.inst:AddTag("nosteal")
    self.inst:AddTag("soracontainlocked")
    self.lockername = doer and doer.name or name
    self.lockeruserid = doer and doer.userid or id
    self.pass = pass
end

function com:Uninit(doer)
    if not self.inst.components.container then
        return
    end
    if self.pass == "" then
        return
    end
    local container = self.inst.components.container
    local cmp = self.inst.components

    if doer and doer:HasTag("player") then
        if not (self.lockeruserid == doer.userid or TUNING.SORALOCK2 and doer.Network:IsServerAdmin() or TUNING.SORALOCK3 > 0 and
        GetPlayerOnline(self.lockeruserid) < (TheWorld.state.cycles- TUNING.SORALOCK3))  then
            self:Close()
            return Say(doer, "这不是你的箱子")
        end
        for k, v in pairs(tohook) do
            if cmp[k] and self.hooks[k] then
                for ik, iv in pairs(v) do
                    cmp[k][ik] = self.hooks[k][ik]
                end
            end
        end
        self.pass = ""
        self.lockername = ""
        self.lockeruserid = ""
        self.inst:RemoveTag("soracontainlocked")
        SoraAPI.r_event(doer, "OpenLockUI", {
            name = self.lockername,
            cmd = "close"
        }, self.inst)
        return Say(doer, "成功解锁")
    end

    return true
end

function com:Close()
    if self.inst and self.inst and self.inst.components and self.inst.components.container then
        self.inst.components.container:Close()
    end
end

function com:Open(doer,pass)
    SoraAPI.r_event(doer, "OpenLockUI", {
        name = self.lockername,
        cmd = "close",
        pass = pass
    }, self.inst)
    self.openpass[doer.userid or "unknow"] = GetTick()
    self.hooks.container.Open(self.inst.components.container, doer)
    return true
end

function com:TryPass(doer, pass)
    if doer and doer:HasTag("player") then
        if pass ~= self.pass then
            -- self:Close()
            return Say(doer, "密码错误")
        end
        self:Open(doer,pass)
        return true
    end
    return true
end

function com:OpenByUser(doer)
    if doer and doer:HasTag("player") then
        if not (self.lockeruserid == doer.userid or TUNING.SORALOCK2 and doer.Network:IsServerAdmin() or TUNING.SORALOCK3 > 0 and
            GetPlayerOnline(self.lockeruserid)  < (TheWorld.state.cycles- TUNING.SORALOCK3))  then
            self:Close()
            return Say(doer, "这不是你的箱子")
        end
        self:Open(doer)
        return true
    end
    return true
end

function com:ChangePass(doer, pass)
    if doer and doer:HasTag("player") then
        if self.lockeruserid ~= doer.userid then
            self:Close()
            return Say(doer, "这不是你的箱子")
        end
        if not passtest(pass) then
            return Say(doer, "密码格式不正确")
        end
        self.pass = pass
        self.openpass = {}
        self:Close()
        return Say(doer, "密码修改成功")
    end
    return true
end
function com:OnSave()
    return {
        lockername = self.lockername,
        lockeruserid = self.lockeruserid,
        pass = self.pass,
        add_component_if_missing = (self.pass ~= "") and 1 or nil
    }
end

function com:OnLoad(data)
    if not data then
        return
    end
    if data.pass ~= "" then
        self:Init(nil, data.pass, data.lockername, data.lockeruserid)
    end
end

function com:GetDebugString()
    return "name: " .. self.lockername .. " id: " .. self.lockeruserid .. " pass:" .. self.pass
end

return com
