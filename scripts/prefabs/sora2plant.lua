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
]] local assets = {Asset("ANIM", "anim/sora2plant.zip"), Asset("ATLAS", "images/inventoryimages/sora2plant.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sora2plant.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sora2plant.tex"),
                   Asset("ATLAS", "images/ui/sora2plantspell.xml"), Asset("IMAGE", "images/ui/sora2plantspell.tex"),
                   Asset("ATLAS", "images/ui/soraseeds.xml"), Asset("IMAGE", "images/ui/soraseeds.tex")}

local prefabs = {}

local Setreticule
local function onequip(inst, owner)
    inst.owner = owner
    inst:AddTag("sora2plantequiped")
    owner.AnimState:OverrideSymbol("swap_object", "sora2plant", "swap_weapon")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    if not owner:HasTag("sora") then
        inst.isbig:set(false)
    end
end

local function onunequip(inst, owner)
    inst.owner = nil
    inst:RemoveTag("sora2plantequiped")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    Setreticule(inst)
end
local function StartAOETargeting(inst)
    local playercontroller = ThePlayer.components.playercontroller
    if playercontroller ~= nil then
        playercontroller:StartAOETargetingUsing(inst)
    end
end
local function ReticuleTargetAllowWaterFn()
    local player = ThePlayer
    local ground = TheWorld.Map
    local pos = Vector3()
    -- Cast range is 8, leave room for error
    -- 4 is the aoe range
    for r = 7, 0, -.25 do
        pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
        if ground:IsPassableAtPoint(pos.x, 0, pos.z, true) and not ground:IsGroundTargetBlocked(pos) then
            return pos
        end
    end
    return pos
end
function Setreticule(inst)
    -- body
    local re, ping = "reticuleaoesmall", "reticuleaoesmallping"
    if inst.isbig:value() then
        re, ping = "reticuleaoe_1_6", "reticuleaoeping_1_6"
    end
    inst.components.aoetargeting.reticule.reticuleprefab = re
    inst.components.aoetargeting.reticule.pingprefab = ping
end
local function GetTileCenter(inst, pos)
    if pos then
        pos.x, pos.y, pos.z = TheWorld.Map:GetTileCenterPoint(pos.x, pos.y, pos.z)
    end
    return pos
end

local function cd(inst, time)
    if inst and inst.components.rechargeable then
        inst.components.rechargeable:Discharge(time or 2)
    end
end

local function incd(inst, doer,time)
    if not inst and doer then
        return false
    end
    if not inst.components.rechargeable:IsCharged() then
        local t = math.floor(inst.components.rechargeable:GetTimeToCharge())
        Say(doer, "冷却中" .. t .. "S")
        return true
    end
    cd(inst,time)
    return false
end
local names = require "utils/soragjrnames"
local namesdes = {}
for k, v in pairs(names) do
    if v[1] and v[2] and v[2] ~= "" then
        namesdes[v[1]] = v[2]
    end
end
local function GetDes(name)
    return namesdes[name]
    -- body
end
local names_tmp = {}
local function CacheNames(doer)
    local name = doer:GetDisplayName() or doer.name or ""
    for k, v in pairs(names) do
        if v[1] and v[1] ~= "" then
            if v[1] ~= name and v[1] ~= "MySora" and v[1] ~= "风铃草" and v[1] ~= "☆风铃草☆" then
                table.insert(names_tmp, v[1])
            end
        end
    end
    local t = TheNet:GetClientTable() or {}
    for k, v in pairs(t) do
        if v and v.name ~= name and v.name ~= "MySora" and v.name ~= "风铃草" and v.name ~= "☆风铃草☆" then
            table.insert(names_tmp, v.name)
        end
    end
end
local function GetName()
    if #names_tmp < 1 then
        return ""
    end
    local name = names_tmp[math.random(1, #names_tmp)]
    RemoveByValue(names_tmp, name)
    return name
end
local function Say(doer, str)
    if doer and doer.components.talker then
        doer.components.talker:Say(str, nil, true)
    end
end
local tillpos = {
    M3x3 = {{-1.25, -1.25}, {0, -1.25}, {1.25, -1.25}, {-1.25, 0}, {0, 0}, {1.25, 0}, {-1.25, 1.25}, {0, 1.25},
            {1.25, 1.25}},
    M4x4 = {{-1.5, -1.5}, {-0.5, -1.5}, {0.5, -1.5}, {1.5, -1.5}, {-1.5, -0.5}, {-0.5, -0.5}, {0.5, -0.5}, {1.5, -0.5},
            {-1.5, 0.5}, {-0.5, 0.5}, {0.5, 0.5}, {1.5, 0.5}, {-1.5, 1.5}, {-0.5, 1.5}, {0.5, 1.5}, {1.5, 1.5}},
    M10A = {{-1.5, -1.6}, {0.5, -1.6}, {-0.5, -0.8}, {1.5, -0.8}, {-1.5, 0}, {0.5, 0}, {-0.5, 0.8}, {1.5, 0.8},
            {-1.5, 1.6}, {0.5, 1.6}},
    M10B = {{-0.5, -1.6}, {1.5, -1.6}, {-1.5, -0.8}, {0.5, -0.8}, {-0.5, 0}, {1.5, 0}, {-1.5, 0.8}, {0.5, 0.8},
            {-0.5, 1.6}, {1.5, 1.6}}
}
local range = 2
local function isNear(inst, pos)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ax = pos.x - x
    local az = pos.z - z
    return ax <= range and ax >= -range and az <= range and az >= -range
end
local function FarmFn(inst, doer, pos, poss)
    if not TheWorld.Map:IsFarmableSoilAtPoint(pos.x, pos.y, pos.z) then
        return false, "只能在农田里使用"
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3,nil,nil, {"soil","sora2plant_fx"})
    for k, v in pairs(ents) do
        if isNear(v, pos) then
            v:Remove()
        end
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, nil,
        {"soil", "FX", "DECOR", "NOCLICK", "NOBLOCK", "player", "companion", "smallcreature", "INLIMBO",
         "_inventoryitem", "catchable"})
    if next(ents) then
        for k, v in pairs(ents) do
            if isNear(v, pos) then
                return false, "杂物太多了"
            end
        end
    end
    if poss == "M10" then
        local tilex, tiley = TheWorld.Map:GetTileCoordsAtPoint(pos.x, pos.y, pos.z)
        if 0 == (tiley % 2) then
            poss = tillpos.M10A
        else
            poss = tillpos.M10B
        end

    end
    for k, v in pairs(poss) do
        local newpos = pos + Point(v[1], 0, v[2])
        local a = SpawnAt("sora2plant_fx", newpos)
        a:Bind(GetName())
    end
end
local function IfChangeClearSeeds(inst, mode, doer)
    -- body
    if inst.seeds and next(inst.seeds) then
        if #inst.seeds ~= mode then
            Say(doer, "刨坑模式已变更，种子模板清空")
            inst.seeds = nil
        end
    end
end
local function DoBig(fn, inst, doer, pos, ...)
    -- 1格还是9格

    local rr = {}
    local tosay
    if inst.isbig:value() and doer:HasTag("sora") then
        for x = 0, 2, 1 do
            for y = 0, 2, 1 do
                local newpos = Point(pos.x + 4 * x - 4, 0, pos.z + 4 * y - 4)
                local r, msg = fn(inst, doer, newpos, ...)
                table.insert(rr, r)
                table.insert(rr, msg)
                if not r and type(msg) == "string" then
                    tosay = (tosay or "") .. (x * 3 + y + 1) .. "号位" .. msg .. "\n"
                end
            end
        end
        if tosay then
            Say(doer, tosay)
        end
    else
        local r, str = fn(inst, doer, pos, ...)
        if not r then
            Say(doer, str)
        end
        table.insert(rr, r)
        table.insert(rr, str)
    end
    names_tmp = {}
    return rr
end

local function On3x3Fn(inst, doer, pos)
    -- 刨坑
    if incd(inst, doer) then
        return
    end
    CacheNames(doer)
    IfChangeClearSeeds(inst, 9, doer)
    DoBig(FarmFn, inst, doer, pos, tillpos.M3x3)
end
local function On4x4Fn(inst, doer, pos)
    -- 刨坑
    if incd(inst, doer) then
        return
    end
    CacheNames(doer)
    IfChangeClearSeeds(inst, 16, doer)
    DoBig(FarmFn, inst, doer, pos, tillpos.M4x4)
end
local function On10Fn(inst, doer, pos)
    -- 刨坑
    if incd(inst, doer) then
        return
    end
    CacheNames(doer)
    IfChangeClearSeeds(inst, 10, doer)
    DoBig(FarmFn, inst, doer, pos, "M10")
end
local crops = {
    asparagus = 1,
    garlic = 1,
    pumpkin = 1,
    corn = 1,
    onion = 1,
    potato = 1,
    dragonfruit = 1,
    pomegranate = 1,
    eggplant = 1,
    tomato = 1,
    watermelon = 1,
    pepper = 1,
    durian = 1,
    carrot = 1,
    pineananas = 1,
    gourd = 1,
    immortal_fruit = 1
}
local seedcrops = {}
local bigcrops = {}
for k, v in pairs(crops) do
    bigcrops[k .. "_oversized"] = 1
    seedcrops[k .. "_seeds"] = 1
end
crops = bigcrops
local function PickPickFn(inst, doer, pos)
    -- 刨树根
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"stump", "DIG_workable"})
    for k, v in pairs(ents) do
        if isNear(v, pos) and v.components.workable then
            v.components.workable:WorkedBy(doer, 10)
        end
    end

    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"molebait", "MINE_workable"}, {"INLIMBO"})
    for k, v in pairs(ents) do
        if v.prefab == "rock_avocado_fruit" and isNear(v, pos) and v.components.workable and v.components.stackable then
            local mm = v.components.stackable.stacksize
            local rocks = SpawnPrefab("rocks")
            if rocks and rocks.components.stackable then
                rocks.components.stackable.stacksize = math.min(rocks.components.stackable.maxsize, mm)
                v:Remove()
                doer.components.inventory:GiveItem(rocks, nil, doer:GetPosition())
            else
                rocks:Remove()
            end
        end
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"farm_plant", "pickable"})
    for k, v in pairs(ents) do
        if v.components.pickable and v:IsValid() then
            v.components.pickable:Pick(doer)
        end
    end
end
local function PickFn(inst, doer, pos)
    -- 大作物 
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, nil, {"stale", "spoiled"},
        {"weighable_OVERSIZEDVEGGIES", "oversized_veggie"})
    local prefabs = {}
    local items = {}

    for k, v in pairs(ents) do
        if isNear(v, pos) then
            if crops[v.prefab] then
                if not prefabs[v.prefab] then
                    if v.components.lootdropper then
                        local t = {}
                        prefabs[v.prefab] = t
                        t.items = {}
                        t.num = 0
                        local is = v.components.lootdropper:GenerateLoot()
                        for k, v in pairs(is) do
                            t.items[v] = (t.items[v] or 0) + 1
                        end
                    end
                end
                prefabs[v.prefab].num = prefabs[v.prefab].num + 1
                v:Remove()
            elseif v.prefab == "medal_gift_fruit_oversized" then
                if v.components.workable then
                    v.components.workable:WorkedBy_Internal(doer, 10)
                end
            elseif v.components.workable then
                v.components.workable:WorkedBy_Internal(doer, 10)
            end
        end
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"_inventoryitem"}, {"INLIMBO"})
    for k, v in pairs(ents) do
        if isNear(v, pos) and seedcrops[v.prefab] then
            items["seeds"] = (items["seeds"] or 0) + (v.components.stackable and v.components.stackable.stacksize or 1)
            v:Remove()
        end
    end

    for k, v in pairs(prefabs) do
        for ik, iv in pairs(v.items) do
            items[ik] = (items[ik] or 0) + iv * v.num
        end
    end
    return items
end
local function makepacker(inst, doer, items)
    return SoraAPI.Gift(items)
end
local function OnPickFn(inst, doer, pos)
    if incd(inst, doer) then
        return
    end
    local old = TUNING.FARM_PLANT_DEFENDER_SEARCH_DIST
    TUNING.FARM_PLANT_DEFENDER_SEARCH_DIST = 0
    DoBig(PickPickFn, inst, doer, pos)
    inst.components.soraseedcontainer:HandleCollectAllSeeds(doer)
    local rr = DoBig(PickFn, inst, doer, pos)
    TUNING.FARM_PLANT_DEFENDER_SEARCH_DIST = old
    local items = {}
    local seeditems = {}
    for k, v in pairs(rr) do
        for ik, iv in pairs(v) do
            local t = ik:match("seeds$") and seeditems or items
            t[ik] = (t[ik] or 0) + iv
        end
    end

    local pro = makepacker(inst, doer, items)
    if pro then
        pro.components.named:SetName("打包的作物")
        pro.components.inspectable:SetDescription("这是打包的作物")
        doer.components.inventory:GiveItem(pro, nil, inst:GetPosition())
    end
    for k, v in pairs(seeditems) do
        inst.components.soraseedcontainer:AddSeed(k, v)
    end
end
local allseeds = nil
-- OnPickFn = SoraAPI.Pfn(OnPickFn, true)
local function planttoseed(prefab)
    if not allseeds then
        return
    end
    if not prefab then
        return
    end
    if prefab:match("^weed_") then
        return allseeds['medal_weed_seeds'] and 'medal_weed_seeds' or "seeds"
    end
    if not prefab:match("^farm_plant_") then
        return
    end
    prefab = prefab:sub(12, -1)
    if prefab == "randomseed" then
        return "seeds"
    end
    local name = prefab .. "_seeds"
    if allseeds[name] then
        return name
    end
    name = prefab .. "_seed"
    if allseeds[name] then
        return name
    end
    return
end
local function issame(a, b)
    local r = a - b
    return r < 0.01 and r > -0.01
end
local function compareseeds(src, dest)
    if #src ~= #dest then
        return false
    end
    local len = #src
    local found = 0
    local founds = {}
    for k, v in pairs(src) do
        for ik, iv in pairs(dest) do
            if issame(v[1], iv[1]) and issame(v[2], iv[2]) and not founds[ik] then
                founds[ik] = 1
                found = found + 1
            end
        end
    end
    return found == len
end
local tempseedold = {}
local seedneed = {}
local needonce = {}
local function loadseed(inst)
    tempseedold = {}
    seedneed = {}
    needonce = {}

    for k, v in pairs(inst.seeds) do
        needonce[v[3]] = (needonce[v[3]] or 0) + 1
    end

    local allseedsinfo = inst.components.soraseedcontainer:GetAllSeeds()
    for k, v in pairs(allseedsinfo) do
        if v.name and needonce[v.name] then
            tempseedold[v.name] = v.num
        end
    end
    -- body
end
local function needseed(inst)
    local req = true
    for k, v in pairs(needonce) do
        if ((seedneed[k] or 0) + v) > tempseedold[k] then
            req = false
        end
    end
    if req then
        for k, v in pairs(needonce) do
            seedneed[k] = (seedneed[k] or 0) + v
        end
        return true
    else
        return false
    end
    -- body
end
local function saveseed(inst)
    for k, v in pairs(seedneed) do
        inst.components.soraseedcontainer:AddSeed(k, -v)
    end
    tempseedold = {}
    seedneed = {}
    needonce = {}
end
local function CanDeployAnyWhere()
    return true
end

local function SeedFn(inst, doer, pos)
    if not TheWorld.Map:IsFarmableSoilAtPoint(pos.x, pos.y, pos.z) then
        return false, "只能在农田里使用"
    end
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"soil"}, {"NOCLICK", "NOBLOCK"})
    local newents = {}
    for k, v in pairs(ents) do
        if isNear(v, pos) then
            table.insert(newents, v)
        end
    end

    if #newents ~= #inst.seeds then
        return false, "农田数量与模板不匹配"
    end
    if not needseed(inst) then
        return false, "种子数量不足"
    end
    for k, v in pairs(newents) do -- 数量对了就OK 坑不坑的无所谓
        v:Remove()
    end
    local xs = 1
    if #newents == 10 then
        local tilex, tiley = TheWorld.Map:GetTileCoordsAtPoint(pos.x, pos.y, pos.z)
        if (inst.seedsy ~= (tiley % 2)) then
            xs = -1
        end
    end
    local seeds = inst.seeds
    if #seeds == 10 and xs == -1 then -- 翻转植物
        local oldseeds = deepcopy(inst.seeds)
        table.sort(oldseeds, function(a, b)
            if a[1] == b[1] then
                return a[2] < b[2]
            else
                return a[1] < b[1]
            end
        end)
        local count = 0
        for k, v in pairs(needonce) do
            count = count + 1
        end
        local map = count == 2 and {9, 9, 10, 6, 7, 4, 4, 5, 1, 2} or {6, 7, 8, 9, 10, 1, 2, 3, 4, 5}
        seeds = {}
        for k, v in ipairs(oldseeds) do
            if map[k] and oldseeds[map[k]] and oldseeds[map[k]][3] then
                table.insert(seeds, {v[1] * -1, v[2], oldseeds[map[k]][3]})
            end
        end
        if #seeds ~= 10 then
            return false, "种子错误"
        end
        -- print(fastdump(seeds))
        -- print(fastdump(oldseeds))

    end
    local oldCollapseSoilAtPoint = Map.CollapseSoilAtPoint
    Map.CollapseSoilAtPoint = function()
    end
    for k, v in pairs(seeds) do
        local one = SpawnPrefab(v[3])
        if one then
            local seedpos = Point(pos.x + v[1], 0, pos.z + v[2])
            one.components.deployable.CanDeploy = CanDeployAnyWhere
            one.components.deployable.spacing = DEPLOYSPACING.NONE
            local oldondeploy = one.components.deployable.ondeploy
            one.components.deployable.ondeploy = function(s,pos,doer,...)
                return oldondeploy(s,seedpos,doer,...)
            end
            one.components.deployable:Deploy(seedpos, doer or inst)
        end
    end
    Map.CollapseSoilAtPoint = oldCollapseSoilAtPoint
    return true

    -- body
end

local function OnSeedFn(inst, doer, pos)
    -- 种种子
    if incd(inst, doer) then
        return
    end
    if not inst.seeds then
        if not TheWorld.Map:IsFarmableSoilAtPoint(pos.x, pos.y, pos.z) then
            return Say(doer, "请先选择一块农田作为模板")
        end
        local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"farm_plant"})
        local seeds = {}
        local x1, y1, z1 = pos:Get()
        for k, v in pairs(ents) do
            if isNear(v, pos) then
                local x, y, z = v:GetPosition():Get()
                -- allseeds = {}
                local name = planttoseed(v.prefab)
                if not name then
                    if STRINGS.NAMES[v.prefab:upper()] then
                        Say(doer, "暂不支持[" .. STRINGS.NAMES[v.prefab:upper()] .. "],请铲除后再试")
                    else
                        Say(doer, "存在无法识别的作物请铲除后再试")
                    end
                    return
                end
                table.insert(seeds, {x - x1, z - z1, name})
            end
        end
        if #seeds == 9 then
            if compareseeds(tillpos.M3x3, seeds) then
                inst.seeds = seeds
                return Say(doer, "种子模板设定成功,当前为3x3模式")
            else
                return Say(doer,
                    "请先选择一块农田作为模板\n当前农田植物无法识别\n请使用扶光附带的刨坑进行刨坑\n然后种满种子")
            end
        elseif #seeds == 10 then
            if compareseeds(tillpos.M10A, seeds) or compareseeds(tillpos.M10B, seeds) then
                inst.seeds = seeds
                local tilex, tiley = TheWorld.Map:GetTileCoordsAtPoint(pos.x, pos.y, pos.z)
                inst.seedsy = (tiley % 2)
                return Say(doer,
                    "种子模板设定成功,当前为10格模式\n注意10格模式种的位置可能和预期不一致")
            else
                return Say(doer,
                    "请先选择一块农田作为模板\n当前农田植物无法识别\n请使用扶光附带的刨坑进行刨坑\n然后种满种子")
            end
        elseif #seeds == 16 then
            if compareseeds(tillpos.M4x4, seeds) then
                inst.seeds = seeds
                return Say(doer, "种子模板设定成功,当前为4x4模式")
            else
                return Say(doer,
                    "请先选择一块农田作为模板\n当前农田植物无法识别\n请使用扶光附带的刨坑进行刨坑\n然后种满种子")
            end
        else
            return Say(doer,
                "请先选择一块农田作为模板\n当前农田植物无法识别\n请使用扶光附带的刨坑进行刨坑\n然后种满种子")
        end

        Say(doer,
            "请先选择一块农田作为模板\n当前农田植物无法识别\n请使用扶光附带的刨坑进行刨坑\n然后种满种子")
        return
    end
    loadseed(inst)
    DoBig(SeedFn, inst, doer, pos)
    saveseed(inst)
end
local function fixCostController(self)
    self.donemoisture = true
    self.donenutrient = true
    self.donetendable = true
end

local function FeiFn(inst, doer, pos)
    -- body
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, nil,
        {"soil", "FX", "DECOR", "NOCLICK", "NOBLOCK", "player", "companion", "smallcreature", "INLIMBO",
         "_inventoryitem", "catchable"})
    if next(ents) then
        for k, v in pairs(ents) do

            if isNear(v, pos) then
                if doer:HasTag("sora") and doer.soralevel:value() > 14 then -- 需要施肥的变野生！
                    local fix = nil
                    if v.components.pickable and( v.components.pickable.transplanted or v.components.pickable:IsBarren() )then
                        v.components.pickable.transplanted = false
                        if v.components.pickable:IsBarren() then
                            v.components.pickable:MakeEmpty()
                        end
                        v.components.pickable.cycles_left = v.components.pickable.max_cycles
                        fix = v
                    end
                    if v.components.perennialcrop2 and
                        (v.components.perennialcrop2.pollinated_max > -1 or v.components.perennialcrop2.infested_max <
                            100 or v.components.perennialcrop2.getsickchance > 0) then
                        v.components.perennialcrop2.pollinated_max = -1
                        v.components.perennialcrop2.infested_max = 100
                        v.components.perennialcrop2.getsickchance = 0
                        v.components.perennialcrop2.CostController = fixCostController
                        v.components.perennialcrop2:CostController()
                        fix = v
                    end

                    if v.components.perennialcrop and not v.components.perennialcrop.sorafix then
                        local cmp = v.components.perennialcrop
                        cmp.sorafix = 1
                        cmp.moisture = 999 -- 当前水量
                        cmp.nutrient = 999 -- 当前肥量（生长必需）
                        cmp.nutrientgrow = 999 -- 当前肥量（生长加速）
                        cmp.nutrientsick = 999 -- 当前肥量（预防疾病）
                        cmp.sickness = 0 -- 当前病害程度
                        cmp.infested = 0 -- 被骚扰次数

                        cmp.moisture_max = 999 -- 最大蓄水量
                        cmp.nutrient_max = 999 -- 最大蓄肥量（生长必需）
                        cmp.nutrientgrow_max = 999 -- 最大蓄肥量（生长加速）
                        cmp.nutrientsick_max = 999 -- 最大蓄肥量（预防疾病）
                        cmp.pollinated_max = 0 -- 被授粉次数大于等于该值就能增加产量
                        cmp.infested_max = 1000 -- 被骚扰次数大于等于该值就会立即进入腐烂/枯萎阶段

                        cmp.cost_moisture = 0 -- 需水量
                        cmp.cost_nutrient = 0 -- 需肥类型(这里只需要一个量即可，不需要关注肥料类型)
                        cmp.can_getsick = false -- 是否能产生病虫害（原创）
                        cmp.killjoystolerance = 3 -- 扫兴容忍度：一般都为0
                        fix = v
                    end
                    if fix then
                        local fx = SpawnPrefab("sora_item_fx")
                        fx:Bind(fix, 3)
                    end
                else
                    if v.components.pickable then
                        if v.components.pickable:IsBarren() then
                            v.components.pickable:MakeEmpty()
                        end
                        v.components.pickable.cycles_left = v.components.pickable.max_cycles
                    end
                end
            end
        end
    end

    if TheWorld.Map:IsFarmableSoilAtPoint(pos.x, pos.y, pos.z) then
        local x, y = TheWorld.Map:GetTileCoordsAtPoint(pos.x, pos.y, pos.z)
        TheWorld.components.farming_manager:AddTileNutrients(x, y, 100, 100, 100) -- 加满 蟹蟹
        TheWorld.components.farming_manager:AddSoilMoistureAtPoint(pos.x, pos.y, pos.z, 200)
        if doer and doer:HasTag("sora") and doer.GetExp then
            doer:GetExp(5, "pour_water", 30)
            doer:GetExp(5, "tendto", 30)
        end
    end
    return
end
local function OnFeiFn(inst, doer, pos)
    if incd(inst, doer) then
        return
    end
    -- 施肥
    DoBig(FeiFn, inst, doer, pos)
end
local function PlantFn(inst, doer, pos)
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 3, {"farmplantstress"})
    for k, v in pairs(ents) do
        if v and v.components.farmplantstress then
            if v.components.farmplanttendable then
                v.components.farmplanttendable:TendTo(doer)
            end
            local reducemax = math.min(v.components.farmplantstress.stress_points, 3)
            if reducemax > 0 then
                local hasreduce = v.components.farmplantstress.sorareduce or 0
                local reduce = math.min(3 - hasreduce, reducemax)
                if reduce > 0 then
                    v.components.farmplantstress.sorareduce = hasreduce + reduce
                    v.components.farmplantstress.stress_points = v.components.farmplantstress.stress_points - reduce
                end
            end
        end
    end
    -- body
end
local function OnPlantFn(inst, doer, pos)
    if incd(inst, doer) then
        return
    end
    -- 照顾
    DoBig(PlantFn, inst, doer, pos)
end

local function OnDefaultFn(inst, doer, pos)
    local str = ""
    if inst and doer and doer:HasTag("sora") then
        str = "当前范围:" .. (inst.isbig:value() and "大" or "小") .. "\n"
    end
    inst.seeds = nil
    Say(doer, str .. "种子模板已清空\n请选择功能")
    return true
end

local function OnRangeFn(inst, doer, pos)
    if doer and doer:HasTag("sora") then
        if inst.isbig:value() then
            inst.isbig:set(false)
        else
            inst.isbig:set(true)
        end

    elseif inst.owner then
        inst.isbig:set(false)
    end
    inst.seeds = nil
    OnDefaultFn(inst, doer, pos)
end

local ICON_SCALE = .5
local ICON_RADIUS = 55
local SPELLBOOK_RADIUS = 120
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2
local ui = require("widgets/soraseed")
local SPELLS = {{
    label = "收", -- 批量收取大作物的产出 仅限穹妹 且可以铲树根 
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("收农作物")
        Setreticule(inst)
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(OnPickFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "pick.tex"
}, {
    label = "育", -- 作物的压力值-2 仅限穹妹 15级以后 每个作物只能1次 
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("照料植物")
        Setreticule(inst)
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(OnPlantFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "plant.tex"
}, {
    label = "肥", -- 对普通作物进行施肥     穹妹10级以后 可以对农田进行施肥  15级以后 可以把普通作物转换为野生状态 参考空白
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("田地施肥")
        Setreticule(inst)
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(OnFeiFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "fei.tex"
}, {
    label = "10坑", -- 铲出3x3的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("刨地十格")
        Setreticule(inst)
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(On10Fn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "m10.tex"
}, {
    label = "4x4", -- 铲出4x4的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("刨坑4x4")
        Setreticule(inst)
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(On4x4Fn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "m4x4.tex"
}, {
    label = "3x3", -- 铲出3x3的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("刨地3x3")
        Setreticule(inst)
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(On3x3Fn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "m3x3.tex"
}, {
    label = "范", -- 扩大操作范围
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("改变范围")
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(OnRangeFn)
            inst.seeds = nil
            local doer = inst.components.inventoryitem:GetGrandOwner()
            if doer then
                Say(doer,  "种子模板已清空\n请选择功能")
            end
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "fan.tex"
}, {
    label = "种", -- 铲出3x3的坑
    onselect = function(inst)
        inst.components.spellbook:SetSpellName("先选择模板\n后种植种子")
        Setreticule(inst)
        if ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls and ThePlayer.HUD.controls.containerroot and
            not ThePlayer.HUD.controls.containerroot.soraseedui then
            ThePlayer.HUD.controls.containerroot.soraseedui =
                ThePlayer.HUD.controls.containerroot:AddChild(ui(ThePlayer))
        end
        if TheWorld.soraismastersim then
            inst.components.aoespell:SetSpellFn(OnSeedFn)
        end
    end,
    atlas = "images/ui/sora2plantspell.xml",
    normal = "seed.tex"
}}

for k, v in pairs(SPELLS) do
    local oldonselect = v.onselect
    v.onselect = function(inst, ...)
        -- print("onselect", k, TheWorld.soraismastersim, inst)
        if not TheWorld.soraismastersim then
            SoraAPI.SoraRPC:PushEvent("SelectBook", {
                id = k
            }, nil, inst)
        end
        return oldonselect(inst, ...)
    end
    v.widget_scale = ICON_SCALE
    v.hit_radius = ICON_RADIUS
    v.execute = StartAOETargeting
end
local function plantrecharge(inst, data)
    if data.percent >= 1 and not inst:HasTag("sorarecharge") then
        inst:AddTag("sorarecharge")
        inst.components.aoetargeting.enabled:set(true)
    elseif data.percent < 1 and inst:HasTag("sorarecharge") then
        inst:RemoveTag("sorarecharge")
        inst.components.aoetargeting.enabled:set(false)
    end
end
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst:AddTag("aquatic")
    anim:SetBank("sora2plant")
    anim:SetBuild("sora2plant")
    anim:PlayAnimation("anim")
    inst:AddTag("nopunch")
    inst:AddTag("soraspellbook")
    inst:AddTag("soraseedui")
    inst:AddTag("sorarecharge")
    inst:AddTag("allow_action_on_impassable")
    inst:AddTag("rechargeable")
    inst.entity:AddMiniMapEntity()
    inst.isbig = net_bool(inst.GUID, "sora2plant.isbig", "sora2plant.isbig")
    inst.MiniMapEntity:SetIcon("sora2plant.tex")
    inst:ListenForEvent("sora2plant.isbig", Setreticule)
    inst:AddTag("soraveryquickcast")
    inst:AddComponent("spellbook")
    inst.components.spellbook:SetRadius(SPELLBOOK_RADIUS)
    inst.components.spellbook:SetFocusRadius(SPELLBOOK_FOCUS_RADIUS)
    inst.components.spellbook:SetItems(SPELLS)

    inst.components.spellbook.opensound = "dontstarve/common/together/book_maxwell/use"
    inst.components.spellbook.closesound = "dontstarve/common/together/book_maxwell/close"
    inst.components.spellbook.CanBeUsedBy = function(s, doer)
        if inst and inst:HasTag("sorarecharge") and inst:HasTag("sora2plantequiped") and doer and doer:HasTag("player") then
            return true
        end
        return false
    end
    -- inst.components.spellbook.executesound = "dontstarve/common/together/book_maxwell/close"
    
    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting:SetAllowWater(false)
    inst.components.aoetargeting.reticule.targetfn = nil
    inst.components.aoetargeting.reticule.validcolour = {1, .75, 0, 1}
    inst.components.aoetargeting.reticule.invalidcolour = {.5, 0, 0, 1}
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true
    inst.components.aoetargeting.reticule.twinstickmode = 1
    inst.components.aoetargeting.reticule.twinstickrange = 8
    inst.components.aoetargeting:SetDeployRadius(0)
    inst.components.aoetargeting:SetShouldRepeatCastFn(nil)
    inst.components.aoetargeting.reticule.mousetargetfn = GetTileCenter
    local oldIsEnabled = inst.components.aoetargeting.IsEnabled
    inst.components.aoetargeting.IsEnabled = function(self, ...)
        local can = true
        if ThePlayer and ThePlayer.replica.inventory:GetActiveItem() then
            return false
        end
        return can and oldIsEnabled(self, ...)
    end
    Setreticule(inst)
    inst:AddComponent("soraseedcontainer")
    if not allseeds then
        allseeds = inst.components.soraseedcontainer:GetAllName()
    end
    if not TheWorld.soraismastersim then
        inst.components.spellbook:SelectSpell(7)
        return inst
    end
    
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[桃源深处有...


	大规模手工业生产基地]])
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2plant.xml"
    inst.components.inventoryitem.imagename = "sora2plant"
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = math.min(getsora("sora2swordspe"), 2.5)
    -- inst:AddComponent("spellcaster")
    -- inst.components.spellcaster.CanCast = function() return true end
    -- inst.components.spellcaster.canuseontargets = true
    -- inst.components.spellcaster.quickcast = true
    -- inst.components.spellcaster.canuseonpoint = true
    -- inst.components.spellcaster.canuseonpoint_water = true
    -- inst.components.spellcaster:SetSpellFn(soramagicfn)
    inst:AddComponent("soraaoespell")
    inst.components.aoespell = inst.components.soraaoespell
    inst:RegisterComponentActions("aoespell")
    assert(TheWorld.components.sorachestmanager,'小穹的温馨提示:本MOD已知与群鸟绘卷/蘑菇慕斯不兼容,请关闭后再试')
    if not inst.components.aoespell.SetSpellFn then
        inst.components.aoespell.SetSpellFn = function(self, fn, ...)
            self.aoe_cast = fn
            self.spellfn = fn
        end
    end
    inst.components.aoespell:SetSpellFn(OnDefaultFn)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
    inst.components.weapon:SetRange(8)
    inst.components.weapon:SetProjectile("sorapick_projectile")

    inst:AddComponent("rechargeable")
    inst.components.rechargeable:SetMaxCharge(10)
    inst:ListenForEvent("rechargechange", plantrecharge)
    inst.components.spellbook:SelectSpell(7)
    return inst
end

local function Bind(inst, name, isload, des)
    inst.components.named:SetName(name)
    inst.username = name
    if not isload then
        inst:DoTaskInTime(FRAMES * 123, function()
            SpawnAt("farm_soil", inst)
        end)
        inst:DoTaskInTime(FRAMES * 135, inst.Remove)
        inst.components.scaler:SetScale(0.3)
    else
        inst.persists = true
        inst.components.scaler:SetScale(0.7)
    end
    inst.components.sorasavecmp:SetSave("name", {
        name = name
    })
    inst.des = des or GetDes(name) or nil
    if isload then 
        inst:RemoveTag("sora2plant_fx")
    end
end
local function fxfn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    local lab = inst.entity:AddLabel()
    lab:SetFontSize(14)
    lab:SetFont(BODYTEXTFONT)
    lab:SetWorldOffset(0, 0.7, 0)
    lab:SetColour(.8, .8, .8, .8)
    inst:DoTaskInTime(0, function()
        lab:SetText(inst:GetDisplayName())
    end)
    inst.AnimState:SetBank("mole")
    inst.AnimState:SetBuild("mole_build")
    inst.AnimState:PlayAnimation("enter")
    inst.AnimState:PushAnimation("exit")
    inst.AnimState:PushAnimation("exit")
    inst.AnimState:SetRayTestOnBB(true)
    -- inst:AddTag("FX")
    inst:AddTag("NOBLOCK")
    inst:AddTag("sora2plant_fx")
    inst.entity:SetPristine()
    inst.wet_prefix = ""
    if not TheWorld.soraismastersim then
        return inst
    end
    inst:AddComponent("named")
    inst:AddComponent("scaler")
    inst.components.scaler.OnLoad = nil
    inst.components.scaler.OnSave = nil
    inst:AddComponent("inspectable")
    inst.components.inspectable.descriptionfn = function(inst, viewer)
        local name = inst.username or ""
        local view = viewer and ((viewer.userid == "KU_qE7e8wiS" or viewer.userid == "OU_76561198223179244") and "fl" or
                         (viewer.userid == "KU_3NiPQMhy" or viewer.userid == "RU_76561197984541489") and "fq") or "n"
        if name == "风铃" or name == "风铃草" or name == "MySora" or name == "凤栖老公" then
            if view == "fl" then
                return "大胆！竟敢迫害本大人"
            elseif view == "fq" then
                return "老公大人辛苦了~~"
            end
            return "这是凤栖大人的老公！"
        end
        if name == "凤栖" or name == "凤栖." or name == "緈." or name == "緈" or name == "风铃老婆" then
            if view == "fl" then
                return "老婆大人辛苦了~~"
            elseif view == "fq" then
                return "大小姐驾到，统统闪开！"
            end
            return "大小姐驾到，统统闪开！"
        end
        if name == "安安" or name == "安深余" then
            return "介娘们不像啥好人呐"
        end
        if name == "家妻二乃" or name == "家妻にの一生譲りません" or name ==
            "愛衣ちゃんの大勝利で" then
            return "噫~~~有hentai"
        end

        if inst.des then
            return inst.des
        end
        return name .. "\n别偷懒!\n赶紧干活"
    end
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)

    inst:AddComponent("sorasavecmp")

    inst.components.sorasavecmp:AddLoad("name", function(i, data)
        if data and data.name and type(data.name) == "string" then
            inst:DoTaskInTime(0, function()
                inst:Bind(data.name, true, data.des)
                
            end)
        end
        return data
    end)
    inst.Bind = Bind
    inst.persists = false

    return inst
end

return Prefab("sora2plant", fn, assets, prefabs), Prefab("sora2plant_fx", fxfn, assets, prefabs)
