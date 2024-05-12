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
local com = Class(function(self, inst)
    self.inst = inst
    self.san = 1000 -- 心情1000
    self.sanmax = 1000 -- 最大心情1000
    self.inst:WatchWorldState("phase", function()
        if TheWorld.state.phase ~= "night" then
            return
        end
        if TheWorld.state.moonphase == "new" then
            self.inst.components.talker:Say("暗影在接近")
            self:SetSan(0)
        end
        if TheWorld.state.moonphase == "full" then
            self.inst.components.talker:Say("月色宜人")
            self:SetSan(1000)
        end
    end)
    self.inst:WatchWorldState("cycles", function()
        self.inst.components.talker:Say("新的一天开始了~")
        self:GetSan(100)
    end)
end)
function com:SetSan(num)
    self.san = math.clamp(num, 0, self.sanmax)
    local scl = self:GetPerBySan()
    self.inst.AnimState:SetMultColour(1, 1, 1, scl)
    self.inst.AnimState:SetScale(scl, scl, scl)
end

function com:GetSan(num)
    self:SetSan(self.san + num)
end

function com:GetPerBySan()
    if self.san > 800 then
        return 1
    elseif self.san > 600 then
        return 0.9
    elseif self.san > 400 then
        return 0.8
    elseif self.san > 200 then
        return 0.6
    else
        return 0.4
    end
end

local SanMap = {
    sora_yez = 100
}
function com:GetItemSan(item)
    -- 料理类大量补充san
    -- 食物类(肉/作物)少量降低san
    -- 玩具类中量补充san
    -- 其他类根据价值降低san
    if not (item and item:IsValid()) then
        return 0
    end
    local base = 0
    if SanMap[item.prefab] then
        base = SanMap[item.prefab]
    elseif item:HasTag("preparedfood") then
        base = 20
    elseif item.prefab:find("trinket") then
        base = 10
    elseif item.components.tradable and item.components.tradable.goldvalue > 0 then
        base = -(item.components.tradable.goldvalue or 0)
    elseif item.components.edible then
        base = -1
    else
        base = -2
    end
    if item.components.stackable then
        base = base * item.components.stackable.stacksize
    end
    return base
end
local ItemMap = {}
function com:GetItemPro(item)
    if not (item and item:IsValid()) then
        return nil
    end
    local base = nil -- 默认不吃
    if ItemMap[item.prefab] then
        base = ItemMap[item.prefab]
    elseif item:HasTag("preparedfood") then
        base = {}
    elseif item.prefab == "bird_egg" then
        base = {
            [TheWorld.state.isnight and "townportaltalisman" or "goldnugget"] = 1
        }
    elseif item.components.edible and item.components.edible.foodtype == FOODTYPE.MEAT then
        base = {
            bird_egg = 1
        }
    elseif item.components.edible and Prefabs[string.lower(item.prefab .. "_seeds")] then
        base = {
            [string.lower(item.prefab .. "_seeds")] = 1
        }
    elseif item.components.tradable and item.components.tradable.goldvalue > 0 then
        base = {
            [TheWorld.state.isnight and "townportaltalisman" or "goldnugget"] = item.components.tradable.goldvalue
        }
    end
    if item.components.stackable and base then
        for k, v in pairs(base) do
            base[k] = v * item.components.stackable.stacksize
        end
    end
    return base
end

function com:GetItem()
    local sancost = 0
    local allitem = {}
    local container = self.inst.components.container
    local has = false
    for i = 1, container:GetNumSlots() do
        local item = container:GetItemInSlot(i)
        if item then
            local toget = self:GetItemPro(item)
            if toget then
                sancost = sancost + self:GetItemSan(item)
                for k, v in pairs(toget) do
                    allitem[k] = (allitem[k] or 0) + v
                end
                self.inst.components.container:RemoveItem(item, true)
                item:Remove()
                has = true
            end
        end
    end
    if not has then
        return
    end
    self.inst.components.container:Close()
    self.inst.components.container.canbeopened = false
    self.inst:DoTaskInTime(3, function()
        self.inst.components.container.canbeopened = true
    end)
    self.inst.components.talker:Say(sancost > 0 and "感谢投喂~~" or '哦买噶,又要工作了')
    self.inst.AnimState:PlayAnimation("eat")
    self.inst.AnimState:PushAnimation("idle", true)
    self:GetSan(sancost)
    local p = self:GetPerBySan()
    for k, v in pairs(allitem) do
        allitem[k] = math.floor(v * p)
    end
    local pos = self.inst:GetPosition()
    for k, v in pairs(allitem) do
        local item = SpawnPrefab(k)
        if item then
            if item.components.stackable then
                item.components.stackable:SetStackSize(v)
            else
                local n = v - 1
                for i = 1, n do
                    local it = SpawnPrefab(k)
                    self.inst.components.container:GiveItem(it, nil, pos)
                end
            end
            self.inst.components.container:GiveItem(item, nil, pos)
        end
    end
end
function com:OnSave()
    return {
        san = self.san
        -- add_component_if_missing_sora = (self.pass ~= "") and 1 or nil
    }
end

function com:OnLoad(data)
    if not data then
        return
    end
    self:SetSan(data.san or 0)
    -- self.mode = data.mode == 1 and 1 or 0
end

function com:GetDebugString()
    return string.format("%d / %d", self.san, self.sanmax)
end

return com
