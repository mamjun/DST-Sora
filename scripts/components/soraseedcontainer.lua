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
]] local seedinfo = {}
local allseeds = {}
local function AddSeed(name, data)
    if not Prefabs[name] then
        name = nil
        data = nil
    end
    if not name then
        table.insert(seedinfo, {})
        return
    end
    allseeds[name] = 1
    local data = data or {}
    if not data.atlas then
        if not data.image then
            if name:find("_seeds") then
                data.image = name:sub(1, -7) .. ".tex"
            elseif name:find("_seed") then
                data.image = name:sub(1, -6) .. ".tex"
            elseif name == "seeds" then
                data.image = "seeds.tex"
            else
                data.image = "seeds.tex"
            end
        end
        data.atlas = SoraGetImage(data.image)
        if data.image:sub(-4):lower() ~= ".tex" then
            data.image = data.image .. ".tex"
        end
    end
    table.insert(seedinfo, {
        name = name,
        data = data
    })
end
AddSeed("carrot_seeds") -- 胡萝卜种子	
AddSeed("corn_seeds") -- 玉米种子	
AddSeed("eggplant_seeds") -- 茄子种子	
AddSeed("pumpkin_seeds") -- 南瓜种子	
AddSeed()

AddSeed("potato_seeds") -- 土豆种子	
AddSeed("tomato_seeds", {
    image = "quagmire_tomato.tex"
}) -- 番茄种子	
AddSeed("asparagus_seeds") -- 芦笋种子	
AddSeed("gourd_seeds") -- 葫芦种子	
AddSeed()

AddSeed("dragonfruit_seeds") -- 火龙果种子	
AddSeed("watermelon_seeds") -- 西瓜种子	
AddSeed("durian_seeds") -- 榴莲种子	
AddSeed("pomegranate_seeds") -- 石榴种子	
AddSeed()

AddSeed("garlic_seeds") -- 蒜种子	
AddSeed("pepper_seeds") -- 辣椒种子	
AddSeed("onion_seeds", {
    image = "quagmire_onion.tex"
}) -- 洋葱种子	
AddSeed()
AddSeed("pineananas_seeds") -- 松萝种子	

AddSeed("mandrake_seeds") -- 曼德拉种子	
AddSeed("medal_weed_seeds", {
    image = "medal_weed_seeds"
}) -- 杂草种子	
AddSeed("medal_gift_fruit_seed", {
    image = "medal_gift_fruit"
}) -- 包果种子	
AddSeed("immortal_fruit_seed", {
    image = "immortal_fruit"
}) -- 不朽种子	
AddSeed("seeds") -- 种子	

local c = Class(function(self, inst)
    self.inst = inst
end)
function c:GetDB()
    if TheWorld.ismastersim then
        local db = nil
        if self.inst and self.inst.owner and self.inst.owner.userid then
            db = SoraAPI.GetClientDB("seeds", self.inst.owner.userid, true)
        end
        return db or SoraAPI.SeedDB
    else
        return SoraAPI.SeedCDB
    end
end

function c:AddSeed(name, num)
    local db = self:GetDB()
    local old = db:Get("seeds", name, 0)
    old = math.max(old + num, 0)
    db:Set("seeds", name, old)
    return old
end
function c:GetAllName()
    return allseeds
end

function c:GetAllSeeds()
    local db = self:GetDB()
    for k, v in pairs(seedinfo) do
        v.num = db:Get("seeds", v.name, 0)
    end
    return seedinfo
end
function c:CollectAllSeeds()
    if TheWorld.ismastersim then
        self:HandleCollectAllSeeds(ThePlayer)
    else
        local db = self:GetDB()
        db:PushEvent("CollectAllSeeds")
    end
end
function c:GetSeeds(name)
    if TheWorld.ismastersim then
        self:HandleGetSeeds(ThePlayer, name)
    else
        local db = self:GetDB()
        db:PushEvent("GetSeeds", {
            name = name
        })
    end
end
function c:HandleGetSeeds(player, name)
    local db = self:GetDB()
    if player and player.components.health and not player.components.health:IsDead() and type(name) == "string" then
        local num = db:Get("seeds", name, 0)

        if num > 0 then
            local inst = SpawnPrefab(name)
            local getnum = 1
            if inst.components.stackable then
                getnum = math.min(inst.components.stackable.maxsize, num)
                inst.components.stackable:SetStackSize(getnum)
            end
            db:Set("seeds", name, num - getnum)
            player.components.inventory:GiveItem(inst, nil, player:GetPosition())
        end
    end

end
local function TestSeeds(inst)
    return inst and inst.prefab and allseeds[inst.prefab]
    -- body
end
function c:HandleCollectAllSeeds(player)
    local db = self:GetDB()
    if player and player.components.health and not player.components.health:IsDead() then
        local all = {}
        local ents = player.components.inventory:FindItems(TestSeeds)
        for k, v in pairs(ents or {}) do
            if v and v:IsValid() then
                all[v.prefab] = (all[v.prefab] or 0) +
                                    (v.components.stackable and v.components.stackable.stacksize or 1)
                player.components.inventory:RemoveItem(v, true, true)
                v:Remove()
            end
        end
        local containers = player.components.inventory.opencontainers
        for container_inst in pairs(containers) do
            local container = container_inst.components.container
            local ents = container:FindItems(TestSeeds)
            for k, v in pairs(ents or {}) do
                if v and v:IsValid() then
                    all[v.prefab] = (all[v.prefab] or 0) +
                                        (v.components.stackable and v.components.stackable.stacksize or 1)
                    container:RemoveItem(v, true, true)
                    v:Remove()
                end
            end
        end
        local pos = player:GetPosition()
        local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 4, {"_inventoryitem"}, {"INLIMBO"})
        for k, v in pairs(ents or {}) do
            if v and v:IsValid() and allseeds[v.prefab] then
                all[v.prefab] = (all[v.prefab] or 0) +
                                    (v.components.stackable and v.components.stackable.stacksize or 1)
                v:Remove()
            end
        end

        for k, v in pairs(all) do
            self:AddSeed(k, v)
        end
    end
end

function c:GetDebugString()
    local db = self:GetDB()
    local strs = {}
    table.insert(strs, "SeedSave:")
    for k, v in pairs(seedinfo) do
        if v.name then
            local str =
                (STRINGS.NAMES["KNOWN_" .. v.name:upper()] or STRINGS.NAMES[v.name:upper()] or "未知") .. "|" ..
                    tostring(v.name) .. ":" .. db:Get("seeds", v.name, 0)
            table.insert(strs, str)
        end
    end
    return table.concat(strs, "\n")
end
return c
