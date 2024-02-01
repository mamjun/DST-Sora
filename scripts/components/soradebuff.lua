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
SoraEnv()
local AllBuffs = {}
local CleanTag = {}
local com = Class(function(self, inst)
    self.inst = inst
    self.buffs = {}
    self.task = nil
end)
function com:RegBuff(name, data)
    AllBuffs[name] = data
    if data.Tag then
        for k, v in pairs(data.Tag) do
            if not CleanTag[v] then
                CleanTag[v] = {}
            end
            table.insert(CleanTag[v], name)
        end
    end
    --[[
        {
            defaulttime = 360,  --默认时间
            tag = {}
            cleantag = {}       --清除同tag的buff
            resetwhenset = false    --新buff重置时间
            init = fn
            update = fn
            settime = fn
            uninit = fn
        }


    ]]
end
function com:SetupBuff(name, time)
    if not AllBuffs[name] then
        return
    end
    local buff = AllBuffs[name]
    time = time or buff.defaulttime or 60
    if buff.CleanTag then -- 清除相关tag的buff
        for k, v in pairs(buff.CleanTag) do
            for ik, iv in pairs(CleanTag[v] or {}) do
                if iv ~= name then
                    self:UnsetBuff(name)
                end
            end
        end
    end
    if self.buffs[name] then
        if buff.resetwhenset then
            self:UnsetBuff(name)
            if buff.init then
                buff.init(inst)
            end
        else
            if buff.settime then
                buff.settime(inst)
            end
        end
    else
        if buff.init then
            buff.init(inst)
        end
    end
    if not self.task then
        self.task = self.inst:DoPeriodicTask(1, function()
            self:OnTask()
        end)
    end
end
function com:OnTask()
    for k,v in pairs(self.buffs) do
        local buff = AllBuffs[k]
        if buff and buff.update then
            buff.update(self.inst,k,v)
        end
    end
end
function com:UnsetBuff(name)
    if AllBuffs[name] then
        local buff = AllBuffs[name]
        if buff.uninit then
            buff.uninit(self.inst)
        end
        self.buffs[name] = nil
    end
    if self.task and not (next(self.buffs)) then
        self.task:Cancel()
        self.task = nil
    end
end
function com:HasBuff()
    local has = false
    for k, v in pairs(self.buffs) do
        if v > 0 then
            has = true
            break
        end
    end
    return has
end
function com:OnSave()
    return {
        buffs = self.buffs,
        add_component_if_missing_sora = self:HasBuff() and 1 or nil
    }
end

function com:OnLoad(data)
    if not (data and data.buffs) then
        return
    end
    for k, v in pairs(data.buffs) do
        self:SetupBuff(k, v)
    end
end

function com:GetDebugString()
    return "buffs: " .. SoraAPI.json.encode(self.buffs)
end

return com
