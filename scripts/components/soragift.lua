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
]] local function oncycles(inst)
    inst.components.soragift.giftplayer = {}
    local self = inst.components.soragift
    for k,v in pairs(self.items) do
        local vv = math.ceil(v*0.1)
        if vv == 1  and math.random() >0.2 then
            vv = 0
        end
        self.items[k] = v - vv
        if self.items[k] < 1 then
            self.items[k] = nil
        end
    end
end
local WList = require("util/weighted_list")
-- require "config/debug"
local soragift = Class(function(self, inst)
    self.inst = inst
    self.giftexp = 0
    self.giftlevel = 0
    self.giftplayer = {}
    self.data = {}
    self.items = {}
    self.levelchangefn = nil
    self.item = nil
    
end)

function soragift:CanGift(doer)
    local user = doer.userid
    if user == "" then
        user = "offline"
    end
    return self.giftlevel > 0 and not self.giftplayer[user]
end
function soragift:CalcLevel()
    self.giftlevel = 0
    for k, v in ipairs(self.data.level) do
        if self.giftexp > v then
            self.giftlevel = k
        end
    end
    self.itemlevel = math.ceil(self.giftlevel / 2)

    if self.levelchangefn then
        self.levelchangefn(self.inst, self.giftlevel)
    end

    self.inst.components.talker:Say("当前等级：" .. self.giftlevel .. "\r\n当前经验：" .. self.giftexp ..
                                        "\r\n奖励珍惜度：" .. (self.data.itemname[self.itemlevel] or "无"))
end
local sales = {1,2,5,20,100,500,1000,10000}
local saless = {2,1,0.9,0.8,0.5,0.3,0.2,0.1}
function soragift:GetItem()
    local container = self.inst.components.container
    local pos = Vector3(self.inst.Transform:GetWorldPosition())

    for i = 1, container:GetNumSlots() do
        local item = container:GetItemInSlot(i)
        if item then
            local prefab, expget = self.data.toprefabfn(item)
            -- if self.data.sale[item.prefab] then
            if (item:HasTag("irreplaceable") or item.components.unwrappable or (item.components.sorapacker and item.components.sorapacker.item and item.components.sorapacker.item.irreplaceable )) and not self.data.sales[prefab] then

            else
                self.inst.components.container:RemoveItem(item, true) -- 否则会内存泄露
                item:Remove()
                self.items[prefab] = (self.items[prefab] or 0 ) + ( item.components.stackable and  item.components.stackable.stacksize or 1)
                local s = 1 
                for k,v in ipairs(sales) do
                    if self.items[prefab] >= v then
                        s = saless[k]
                    end
                end
                expget = math.ceil(expget * s) 
                self.giftexp = self.giftexp + expget
            
            end
        end
    end
    self:CalcLevel()

    return true
end

function soragift:GiveGift(doer)
    local user = doer.userid
    if user == "" then
        user = "offline"
    end
    if self.giftplayer[user] then
        self.inst.components.talker:Say("今天你已经领取过礼物了，明天再来吧")
        return true
    end
    if self.giftlevel < 1 then
        self.inst.components.talker:Say("我需要更多的献祭！")
        return true
    end
    self.giftplayer[user] = user
    local ran = math.random()
    if ran > 0.33 then
        self.giftexp = self.giftexp + math.random(100, 300)
        self.inst.components.talker:Say("今天没有礼物哦！明天再来吧!")
        return true
    end
    local big = ran > 0.03 -- 大货还是小货  小货常用资源 大货是珍惜资源
    -- 开始抽取礼物
    local giftpool = WList()
    for k, v in pairs(self.data.gift) do
        if v and v.level <= self.giftlevel and (v.level > self.giftlevel - 2) and v.exp <= self.giftexp and
            (v.testfn and v.testfn(self, doer, v) or v.testfn == nil) then
            giftpool:addChoice(v, v.weight)
        end
    end

    local giftconfig
    if giftpool:getCount() > 0 then
        giftconfig = giftpool:getChoice(math.random() * giftpool:getTotalWeight())
    end
    if giftconfig then
        -- givegigt
        local gifts = type(giftconfig.gifts) == "function" and giftconfig.gifts(self, doer, giftconfig.gifts) or
                          giftconfig.gifts
        local packer = SoraAPI.Gift(gifts, giftconfig, doer)
        if packer then
            doer.components.inventory:GiveItem(packer, nil, self.inst:GetPosition())
            self.giftexp = self.giftexp - giftconfig.exp
            if giftconfig.givefn then
               giftconfig.givefn(self.inst, doer, packer, giftconfig)
            end
        end
        self.inst.SoundEmitter:PlaySound("dontstarve/creatures/together/deer/chain")
    end
    self:CalcLevel()
    return true
end

function soragift:SetConfig(data)
    self.data = data
    self.inst:WatchWorldState("cycles", oncycles)
end

function soragift:OnSave()
    return {
        giftexp = self.giftexp,
        giftplayer = self.giftplayer,
        items = self.items
    }

end

function soragift:OnLoad(data)
    if data then
        if data.giftexp then
            self.giftexp = data.giftexp or nil
            self.giftplayer = data.giftplayer or {}
            self.items = data.items or {}
            self:CalcLevel()
        end
    end
end

return soragift
