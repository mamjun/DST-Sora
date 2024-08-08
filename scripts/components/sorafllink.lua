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
local allfl = {}
SoraAPI.AllFL = allfl
local com = Class(function(self, inst)
    self.inst = inst
    allfl[inst]=1
    self.link = false
    self.name = nil 
    local items = {"sora_pot"}
    --self.item = items[math.random(1, #items)]
    self.item = "sora_pot"
    inst:DoTaskInTime(0, function()
        self:Init()
    end)
end)
function com:OnRemoveEntity()
    allfl[self.inst]=nil
end
function com:Init()
    if not self.link then
        self.inst:AddTag("soranotlink")
    end
    if not self.name then 
        if not self.inst.components.sorabind.bind then 
            self.inst:DoTaskInTime(0,self.inst.Remove)  
            return 
        end
        self.name = self.inst.components.sorabind.bind .. "|" .. tostring(math.random(100*100,100*100*10-1))
        allfl[self.inst]=self.name
    else
        for k,v in pairs(allfl) do 
            if v == self.name then  --重复的花 移除！
                self.inst:DoTaskInTime(0,self.inst.Remove)  
                return 
            end
        end
        allfl[self.inst]=self.name
    end
end

function com:Link(doer)
    -- local doer = self.inst
    if not (doer:HasTag("sora") and not self.link) then
        return
    end

    local e = 500
    if TheWorld.state.cycles then
        e = e + TheWorld.state.cycles * 10
    end
    if doer.components.age then
        e = e + doer.components.age:GetAgeInDays() * 20
    end
    doer:GetExp(e, "sorabind", nil, true)
    local item = SpawnPrefab(self.item)

    if item.components.soraitem and item.components.soraitem.bind then
        item.components.soraitem.user = doer.userid
    end
    local pos = doer:GetPosition()
    if item.components.inventoryitem then
        doer.components.inventory:GiveItem(item)
    elseif item.Transform then
        item.Transform:SetPosition(pos:Get())
    else
        item:Remove()
    end
    self.inst:RemoveTag("soranotlink")
    self.link = true
end

function com:OnSave()
    return {
        link = self.link,
        item = self.item,
        name = self.name 
    }
end

function com:OnLoad(data)
    if data then
        if data.link then
            self.link = data.link
        end
        if data.item then
            self.item = data.item
        end
        if  data.name then 
            self.name = data.name 
        end
    end
    self.item = "sora_pot"
end

return com
