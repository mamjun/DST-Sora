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
    self.lastwork = -300
    self.lasteat = -300
    self.starttime = 0
    self.maxbird = 3 -- 最大三只鸟同时工作
    self.range = 15 -- 捡取半径
    self.dq = self.range * self.range
    self.birds = {} -- 这儿存放召唤出来的鸟
    self.nameuse = {0, 0, 0, 0, 0} -- 已经用掉的名字
    self.picking = {}
end)

function com:HasWork()
    local t = GetTime()
    return (t - self.lastwork < 30)
end
local whitelist = {
    grass = 1,
    sapling = 1,
    spider = 1,
    butterfly = 1,
    fireflies = 1,
    moonbutterfly = 1,
    mole = 1,
    bee = 1,
    killerbee = 1
}
local blacklist = {
    sora_pickhat = 1
}
local function cancatch(inst)

    if blacklist[inst.prefab] then
        return false
    end

    if inst.components.inventoryitem then
        if inst.components.inventoryitem.cangoincontainer and inst.components.inventoryitem.canbepickedup then
            return true
        end
    end
    if inst.components.oceanfishable then
        return true
    end
    if whitelist[inst.prefab] then
        return true
    end
end
local fishes = {
    oceanfish_small_8_inv = 1,
    oceanfish_medium_8_inv = 1,
    oceanfish_medium_6_inv = 1,
    oceanfish_medium_7_inv = 1,
    oceanfish_small_7_inv = 1,
    oceanfish_small_6_inv = 1
}
function com:DoTask()
    local t = GetTime()
    if (t - self.starttime) < 5 then
        return
    end -- 开局5秒不捡
    if not (self.inst.components.container and self.inst.components.container:IsOpen()) then
        return
    end

    if math.random() < 0.02 and (t - self.lasteat) > 180 and self.inst.components.fueled:GetPercent() < 0.5 then
        if not (self.inst.fx and self.inst.fx.sg and not self.inst.fx.sg:HasStateTag("busy") and
            self.inst.fx.components.sleeper and not self.inst.fx.components.sleeper.isasleep) then
            return -- 睡着了 等会吧 
        end
        if self.inst.owner then
            local item = self.inst.owner.components.inventory:FindItem(function(inst)
                return inst:HasTag("catfood")
            end)
            if item then
                local per = 0.2
                if fishes[item.prefab] then
                    per = 1
                end
                per = per + self.inst.components.fueled:GetPercent()
                per = math.min(per, 1)
                local it = self.inst.owner.components.inventory:RemoveItem(item, false,true)
                if it then
                    self.inst.components.fueled:SetPercent(per)
                    self.inst.fx:PushEvent("soratoeat")
                    self.lasteat = t
                    self.starttime = t - 2
                    it:Remove()
                    return
                end
            end
        end
    end

    local pos = self.inst:GetPosition()
    local ents = TheSim:FindEntities(pos.x, 0, pos.z, self.range, nil,
        {"decorationitem", "FX",  "NOCLICK","player", "INLIMBO", "sora_fl"}, {"_inventoryitem", "pickable", "oceanfishable"})

    if next(ents) then
        self.lastwork = GetTime() -- 来活了 别睡了
        if not (self.inst.fx and self.inst.fx.sg and not self.inst.fx.sg:HasStateTag("busy") and
            self.inst.fx.components.sleeper and not self.inst.fx.components.sleeper.isasleep) then
            return -- 睡着了 等会吧 
        end

        for k, v in pairs(ents) do
            if v and not (v.sorapickhatskip and (t - v.sorapickhatskip) < 120) then
                if not self.picking[v] and v:IsValid() and cancatch(v) then
                    if not self:TryToPick(v) then
                        break
                    end
                end
            end
        end
    end
end
function com:GetBirdCount() -- 获取鸟数量
    local i = 0
    for k, v in pairs(self.birds) do
        if k and k:IsValid() then
            i = i + 1
        end
    end
    return i
end
local pickfn = {}
local map = {
    grass = "cutgrass",
    sapling = "twigs"
}
function com:TryToPick(item)
    if not item then
        return true
    end -- 没东西捡啥
    if self:GetBirdCount() >= self.maxbird then
        return true
    end -- 没鸟了！
    local t = GetTime()
    if item.sorapickhatskip and (t - item.sorapickhatskip) < 120 then
        return true
    end -- 你怎么进来的 滚
    if self.inst.components.container:IsFull() then
        local is = self.inst.components.container:FindItems(function(i)
            return (i.prefab == item.prefab or i.prefab == map[item.prefab]) and i.components.stackable and
                       not i.components.stackable:IsFull()
        end)
        if not next(is) then
            return true
        end -- 箱子满了 别捡了
    end
    self.picking[item] = 1
    self.inst.fx:PushEvent("soratowork")
    local bird = SpawnPrefab("sora_fx_bird")
    bird:pick(item, self.inst)
    self.birds[bird] = 1
    local ind = math.random(5)
    local count = 0
    while true do -- 避免名字重复出现
        if self.nameuse[ind] < 0.5 or count > 50 then
            break
        end
        ind = math.random(5)
        count = count + 1
    end
    bird:Set(ind)
    bird.ind = ind
    self.nameuse[ind] = self.nameuse[ind] + 1
    if item.components.inventoryitem then
        item.sorapickhatskip = t
        item:DoTaskInTime(120, function()
            item.sorapickhatskip = nil
        end)
    end
    bird.unbind = function()
        self.birds[bird] = nil
        self.nameuse[ind] = self.nameuse[ind] - 1
        self.picking[item] = nil
    end

    bird.pickitem = function(bird, hat, item)
        if bird and hat and hat.owner and item then
            if item.components.inventoryitem then
                bird.components.inventory:GiveItem(item, nil, item:GetPosition())

            elseif item.components.pickable then
                item.components.pickable:Pick(bird)
            elseif item.components.oceanfishable and Prefabs[item.prefab .. "_inv"] then
                if item.components.weighable then
                    item.components.weighable:SetPlayerAsOwner(hat.owner)
                end

                local fish = SpawnPrefab(item.prefab .. "_inv")
                local pos = hat:GetPosition()
                fish.Transform:SetPosition(pos.x, pos.y, pos.z)
                -- fish.components.inventoryitem:SetLanded(true, false)
                if fish.flop_task then
                    fish.flop_task:Cancel()
                end
                if item.components.oceanfishable ~= nil and fish.components.weighable ~= nil then
                    fish.components.weighable:CopyWeighable(item.components.weighable)
                    item.components.weighable:SetPlayerAsOwner(nil)
                end
                item:Remove()
                bird.components.inventory:GiveItem(fish, nil, item:GetPosition())
            elseif item.components.oceanfishable and Prefabs[item.prefab .. "_land"] then
                if item.components.weighable then
                    item.components.weighable:SetPlayerAsOwner(hat.owner)
                end

                local fish = SpawnPrefab(item.prefab .. "_land")
                local pos = hat:GetPosition()
                fish.Transform:SetPosition(pos.x, pos.y, pos.z)
                -- fish.components.inventoryitem:SetLanded(true, false)
                if fish.flop_task then
                    fish.flop_task:Cancel()
                end
                if item.components.oceanfishable ~= nil and fish.components.weighable ~= nil then
                    fish.components.weighable:CopyWeighable(item.components.weighable)
                    item.components.weighable:SetPlayerAsOwner(nil)
                end
                item:Remove()
                bird.components.inventory:GiveItem(fish, nil, item:GetPosition())
            end
            bird:DoTaskInTime(0.5, function()
                if hat then
                    for k = 1, bird.components.inventory.maxslots do
                        local it = bird.components.inventory:RemoveItemBySlot(k)
                        if it then
                            hat.components.container:GiveItem(it, nil, hat:GetPosition(), true)
                        end
                    end
                end
            end)

        end
    end
end
function com:TurnOn()
    self:TurnOff()
    self.starttime = GetTime()
    self.task = self.inst:DoPeriodicTask(0.5, function()
        self:DoTask()
    end)
end
function com:TurnOff()
    if self.task then
        self.task:Cancel()
        self.task = nil
    end
end

return com
