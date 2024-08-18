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
]] -- 穹妹重生保留经验相关
local function Onsoradespawn(userid, soraexp)
    TheWorld.components.soraexpsave:SetExp(userid, soraexp)
end
local function Onplayerdespawnanddelete(world, data)
    local player = data.player or data
    if player:HasTag("sora") then
        if TheWorld.ismastershard then
            Onsoradespawn(player.userid, player.soraexp:value())
        else
            GLOBALDB:PushEvent("soradespawn", {
                userid = player.userid,
                soraexp = player.soraexp:value()
            }, GetMID())
        end
    end
end

AddPrefabPostInit("world", function(inst)
    if inst.ismastersim then
        inst.soraismastersim = true
        inst:AddComponent("sorachestmanager")
        inst:AddComponent("soraenttrack")
        -- inst:AddComponent("soraworldevent")
        -- inst.components.soraworldevent.debug = (inst.components.soraworldevent.namespace ~= "1935" and
        --                                            inst.components.soraworldevent.namespace ~= "2423" and
        --                                            inst.components.soraworldevent.namespace ~= "4507" and
        --                                            inst.components.soraworldevent.namespace ~= "a-de")
        inst:AddComponent("soraexpsave")
        -- inst.components.soraworldevent:SetNameSpace("sora")
        -- inst.components.soraworldevent:SetTimer(5)
        inst:ListenForEvent("ms_playerdespawn", Onplayerdespawnanddelete)
        inst:ListenForEvent("ms_playerdespawnandmigrate", Onplayerdespawnanddelete)
        inst:ListenForEvent("ms_playerdespawnanddelete", Onplayerdespawnanddelete)
        if inst.ismastershard then
            GLOBALDB:ListenForEvent("soradespawn", function(inst, data)
                Onsoradespawn(data.userid, data.soraexp)
            end)
        end
    end
end)

-- 交易组件相关（穹妹的升级/修复支持一次一组）
AddComponentPostInit("trader", function(Trader)
    local oldAcceptGift = Trader.AcceptGift
    function Trader:AcceptGift(giver, item, count)
        if self.inst:HasTag("soratrader") and item.components.stackable and count == nil then
            if self.inst.cantrader then
                count = self.inst:cantrader(giver, item)
            else
                count = item.components.stackable.stacksize
            end
            if count < 1 then
                count = 1
            end
        end
        return oldAcceptGift(self, giver, item, count)
    end
end)

-- 烹饪经验
AddComponentPostInit("cooker", function(cooker, inst)
    local SoraOldCookItem = cooker.CookItem
    cooker.CookItem = function(self, item, chef)
        if self:CanCook(item, chef) and chef then
            chef:PushEvent("cookitem", {
                cookitem = item
            })
            return SoraOldCookItem(self, item, chef)
        end
    end
end)

-- 双倍收集蜂箱/蘑菇机
AddComponentPostInit("harvestable", function(hav, inst)
    local SoraOldHarvest = hav.Harvest
    hav.Harvest = function(self, picker)
        if self:CanBeHarvested() then
            if picker and picker:HasTag("sora") and picker.GetExp then
                picker.GetExp(picker, 3 * self.produce, "harvestable")
            end
            if not getsora("sbcj") then
                if picker and picker:HasTag("sora") and picker.soralevel:value() > 14 then
                    local num = self.produce
                    if self.product ~= nil then
                        for i = 1, num, 1 do
                            local loot = GLOBAL.SpawnPrefab(self.product)
                            if loot ~= nil then
                                if loot.components.inventoryitem ~= nil then
                                    loot.components.inventoryitem:InheritMoisture(GLOBAL.TheWorld.state.wetness,
                                        GLOBAL.TheWorld.state.iswet)
                                end
                                if picker ~= nil and picker.components.inventory ~= nil then
                                    picker.components.inventory:GiveItem(loot)
                                else
                                    GLOBAL.LaunchAt(loot, self.inst, nil, 1, 1)
                                end
                            end
                        end
                    end
                end
            end
        end
        return SoraOldHarvest(self, picker)
    end
end)

-- 双倍肉干
AddComponentPostInit("dryer", function(hav, inst)
    local SoraOldHarvest = hav.Harvest
    hav.Harvest = function(self, picker)
        if not self:IsDone() or picker == nil or picker.components.inventory == nil then
            return false
        end
        if picker:HasTag("sora") and picker.GetExp then
            picker.GetExp(picker, 10, "dryer")
        end
        if not getsora("sbcj") then
            if picker:HasTag("sora") and picker.soralevel:value() > 14 then
                local loot = GLOBAL.SpawnPrefab(self.product)
                if loot ~= nil then
                    picker.components.inventory:GiveItem(loot, nil, self.inst:GetPosition())
                end
            end
        end
        return SoraOldHarvest(self, picker)
    end
end)

-- 双倍农作物
AddComponentPostInit("crop", function(hav, inst)
    local SoraOldHarvest = hav.Harvest
    hav.Harvest = function(self, picker, ...)
        if not picker then
            return SoraOldHarvest(self, picker, ...)
        end
        if self.cropdata then -- Legion 多年生的加一年 
            if picker:HasTag("sora") and picker.GetExp and not self.inst:HasTag("withered") then
                picker.GetExp(picker, 10, "crop")
                if self.product_prefab ~= nil then
                    picker.GetExp(picker, 20, self.product_prefab, nil, true)
                end
            end
            if picker:HasTag("sora") and picker.soralevel:value() > 14 then
                self.numfruit = (self.numfruit or 1) * 2 -- 双倍采集
            end
            return SoraOldHarvest(self, picker)
        end
        if self.matured or self.inst:HasTag("withered") then
            if picker:HasTag("sora") and picker.GetExp and not self.inst:HasTag("withered") then
                picker.GetExp(picker, 10, "crop")
                if self.product_prefab ~= nil then
                    picker.GetExp(picker, 20, self.product_prefab, nil, true)
                end
            end
            if not getsora("sbcj") then
                if picker:HasTag("sora") and picker.soralevel:value() > 14 then
                    local product = nil
                    if self.grower ~= nil and
                        (self.grower.components.burnable ~= nil and self.grower.components.burnable:IsBurning()) or
                        (self.inst.components.burnable ~= nil and self.inst.components.burnable:IsBurning()) then
                        local temp = GLOBAL.SpawnPrefab(self.product_prefab)
                        product = GLOBAL.SpawnPrefab(temp.components.cookable ~= nil and
                                                         temp.components.cookable.product or "seeds_cooked")
                        temp:Remove()
                    else
                        product = GLOBAL.SpawnPrefab(self.product_prefab)
                    end
                    if product ~= nil then
                        if picker ~= nil then
                            picker.components.inventory:GiveItem(product, nil, self.inst:GetPosition())
                        else
                            product.Transform:SetPosition(self.inst.Transform:GetWorldPosition())
                        end
                    end
                end
            end
            return SoraOldHarvest(self, picker)
        end
    end
end)

-- 双倍烹饪锅
local cooking = require("cooking")
AddComponentPostInit("stewer", function(hav, inst)
    local SoraOldHarvest = hav.Harvest
    hav.Harvest = function(self, picker, ...)
        if not picker then
            return SoraOldHarvest(self, picker, ...)
        end
        local rec = cooking.GetRecipe(self.inst.prefab, self.product)
        local sta = rec and rec.stacksize or 1
        if picker:HasTag("sora") and picker.GetExp then
            picker.GetExp(picker, 10 * sta, "stewer")
            if self.product ~= nil then
                picker.GetExp(picker, 20, self.product, nil, true)
            end
        end
        if not getsora("sbsg") then
            if self.done and picker:HasTag("sora") and picker.soralevel:value() > 24 then
                if self.product ~= nil then
                    local loot = GLOBAL.SpawnPrefab(self.product)
                    if loot ~= nil then
                        if sta > 1 then
                            loot.components.stackable:SetStackSize(sta)
                        end
                        if picker ~= nil and picker.components.inventory ~= nil then
                            picker.components.inventory:GiveItem(loot, nil, self.inst:GetPosition())
                        else
                            GLOBAL.LaunchAt(loot, self.inst, nil, 1, 1)
                        end
                    end
                end
            end
        end
        return SoraOldHarvest(self, picker)
    end
end)

-- 双倍炼丹--神话书说
AddComponentPostInit("stewer_fur", function(hav, inst)
    local SoraOldHarvest = hav.Harvest
    hav.Harvest = function(self, picker, ...)
        if not picker then
            return SoraOldHarvest(self, picker, ...)
        end
        local sta = 1
        if picker:HasTag("sora") and picker.GetExp then
            picker.GetExp(picker, 10 * sta, "stewer")
            if self.product ~= nil then
                picker.GetExp(picker, 20, self.product, nil, true)
            end
        end
        if not getsora("sbcj") then
            if self.done and picker:HasTag("sora") and picker.soralevel:value() > 14 then
                if self.product ~= nil then
                    local loot = GLOBAL.SpawnPrefab(self.product)
                    if loot ~= nil then
                        if sta > 1 then
                            loot.components.stackable:SetStackSize(sta)
                        end
                        if picker ~= nil and picker.components.inventory ~= nil then
                            picker.components.inventory:GiveItem(loot, nil, self.inst:GetPosition())
                        else
                            GLOBAL.LaunchAt(loot, self.inst, nil, 1, 1)
                        end
                    end
                end
            end
        end
        return SoraOldHarvest(self, picker)
    end
end)

-- 允许交易
local canlevelup = {"petals", -- 花瓣
"dragon_scales", -- 龙鳞
"goose_feather", -- 羽绒
"deerclops_eyeball", -- 眼球
"bearger_fur", -- 厚重皮毛
"shroom_skin", -- 蘑蛤皮
"log", -- 木头
"marble", -- 大理石
"butterflywings", -- 蝴蝶翅膀
"butter", -- 黄油
"fireflies", -- 萤火虫
"lightbulb", -- 荧光果
"wormlight_lesser", -- 微光浆果
"wormlight", -- 发光浆果
"nightmarefuel", -- 发光浆果
"houndstooth", "manrabbit_tail", "stinger"}
for k, v in pairs(canlevelup) do
    AddPrefabPostInit(v, function(inst)
        if GLOBAL.TheWorld.ismastersim and not inst.components.tradable then
            inst:AddComponent("tradable")
        end
    end)
end

AddPlayerPostInit(function(inst)
    if inst and inst.AnimState then
        inst.AnimState:AddOverrideBuild("pockybuild")
    end
end)

AddLaterFn(function()
    local old = up.Get(EntityScript.CollectActions, 'COMPONENT_ACTIONS', "componentactions.lua")
    if not old then
        return
    end
    if old.SCENE and old.INVENTORY then
        local oldSCENEfn = old.SCENE.prototyper
        if oldSCENEfn then
            old.SCENE.prototyper = function(inst, doer, ...)
                if inst and inst:HasTag("sora_light") then
                    return
                end
                if inst and inst:HasTag("soranoprototyper") then
                    return
                end
                return oldSCENEfn(inst, doer, ...)
            end
        end

        local oldSCENEfn = old.SCENE.bundlemaker
        old.SCENE.bundlemaker = function(inst, doer, ...)
            if inst and inst:HasTag("sorabowknot") and not (doer and doer:HasTag("sora")) then
                return
            end
            return oldSCENEfn(inst, doer, ...)
        end
        local oldINVENTORYfn = old.INVENTORY.bundlemaker
        old.INVENTORY.bundlemaker = function(inst, doer, ...)
            if inst and inst:HasTag("sorabowknot") and not (doer and doer:HasTag("sora")) then
                return
            end
            return oldINVENTORYfn(inst, doer, ...)
        end
    end
end)

local oldbunldefn = ACTIONS.BUNDLE.fn
ACTIONS.BUNDLE.fn = function(act, ...)
    local target = act.invobject or act.target
    if target ~= nil and target:HasTag("sorabowknot") and act.doer and not act.doer:HasTag("sora") then
        return true
    end
    return oldbunldefn(act, ...)
end
AddReplicableComponent("sorapacker")

-- 能力标签
GLOBAL.SoraTags = {"fastbuilder", -- 修理工快速制作
"fastpicker", -- 蜘蛛快采
"fastpick", -- 成就快采
"woodcutter2", -- 新的快砍 不再能白嫖路西和树精
"quagmire_fasthands", -- 修理工快手
"masterchef", -- 大厨
"professionalchef", -- 调味
"expertchef", -- 做饭动作快点
"soraflyer" -- 白云飞行术
}

RegTag("fastbuilder") -- 修理工快速制作
RegTag("fastpicker") -- 蜘蛛快采
RegTag("fastpick") -- 成就快采
RegTag("woodcutter2") -- 新的快砍 不再能白嫖路西和树精
RegTag("quagmire_fasthands") -- 修理工快手
-- RegTag("masterchef" )          --大厨
-- RegTag("professionalchef")     --调味
RegTag("expertchef") -- 做饭动作快点

RegTag("soraflyer") -- 白云飞行术
RegTag("sorabuilder")
RegTag("soraself")
RegTag("soraother")
RegTag("sorabook")
RegTag("soranotlink") -- 风铃契约

AddLaterFn(function()
    if AllRecipes.portablecookpot_item and AllRecipes.portablecookpot_item.builder_tag and
        AllRecipes.portablecookpot_item.builder_tag ~= "masterchef" then
        table.insert(SoraTags, AllRecipes.portablecookpot_item.builder_tag)
    end
    local sg = require "stategraphs/SGwilson"
    if sg and sg.events and sg.events.armorbroke then
        local old = sg.events.armorbroke.fn
        sg.events.armorbroke.fn = function(inst, ...)
            if inst and inst.sg:HasStateTag("dead") then
                return
            else
                old(inst, ...)
            end
        end
    end
end)

-- local RETARGET_MUST_TAGS = {"_combat", "_health"}
-- local RETARGET_CANT_TAGS = {"prey", "sora", "senior_tentaclemedal"}
-- local function newretargetfn(inst)
-- return FindEntity(inst, TUNING.TENTACLE_ATTACK_DIST, function(guy)
-- return guy.prefab ~= inst.prefab and guy.entity:IsVisible() and
-- not guy.components.health:IsDead() and
-- (guy.components.combat.target == inst or
-- guy:HasTag("character") or guy:HasTag("monster") or
-- guy:HasTag("animal"))
-- end, RETARGET_MUST_TAGS, RETARGET_CANT_TAGS)
-- end

-- AddPrefabPostInit("tentacle", function(inst)
-- if not TheWorld.ismastersim then return end
-- inst:DoTaskInTime(0, function(i)
-- local retargetfn = inst.components.combat.targetfn
-- if retargetfn then
-- inst.components.combat.targetfn =
-- function(inst, ...)
-- local target = retargetfn(inst, ...)
-- if target and target:HasTag("sora") then -- 重新找个目标给你
-- target = newretargetfn(inst, ...)
-- end
-- return target
-- end
-- end
-- end)
-- end)
local function Fixsoraveryquick(inst, action, sg)
    local sg = sg or "doshortaction"
    if inst and inst.actionhandlers and inst.actionhandlers[action] then
        local old = inst.actionhandlers[action].deststate
        inst.actionhandlers[action].deststate = function(inst, action, ...)
            if action and action.doer and action.doer:HasTag("sora") then
                return sg
            end
            if type(old) == "string" then
                return old
            end
            return old(inst, action, ...)
        end
    end
end
local function Fixsoraquickeat(inst, action, sg)
    local sg = sg or "doshortaction"
    if inst and inst.actionhandlers and inst.actionhandlers[action] then
        local old = inst.actionhandlers[action].deststate
        inst.actionhandlers[action].deststate = function(inst, action, ...)
            if action and action.doer and action.doer:HasTag("sora") then
                if type(old) == "string" then
                    return sg
                end
                local oldsg = old(inst, action, ...)
                return (oldsg == "eat" and sg) or oldsg
            end
            if type(old) == "string" then
                return old
            end
            return old(inst, action, ...)
        end
    end
end

local function Fixsoraveryquickcast(inst, action)
    if inst and inst.actionhandlers and inst.actionhandlers[action] then
        local old = inst.actionhandlers[action].deststate
        inst.actionhandlers[action].deststate = function(inst, action, ...)
            if action and action.invobject and action.invobject:HasTag("soraveryquickcast") then
                return "veryquickcastspell"
            end
            if type(old) == "string" then
                return old
            end
            return old(inst, action, ...)
        end
    end
end
local function Fixsoraveryquickbuild(inst, action, sg)
    local sg = sg or "doshortaction"
    if inst and inst.actionhandlers and inst.actionhandlers[action] then
        local old = inst.actionhandlers[action].deststate
        inst.actionhandlers[action].deststate = function(inst, action, ...)
            if action and action.doer and action.doer:HasTag("sora") then
                if action.recipe and action.recipe == "myth_flyskill_sora_build_sora" then
                    if type(old) == "string" then
                        return old
                    end
                    return old(inst, action, ...)
                end
                return sg
            end
            if type(old) == "string" then
                return old
            end
            return old(inst, action, ...)
        end
    end
end
local function FixSora(self)
    Fixsoraveryquickcast(self, ACTIONS.CASTAOE)
    Fixsoraveryquickbuild(self, ACTIONS.BUILD)
    Fixsoraveryquick(self, ACTIONS.HARVEST)
    Fixsoraveryquick(self, ACTIONS.MURDER)
    Fixsoraveryquick(self, ACTIONS.FEED)
    Fixsoraveryquick(self, ACTIONS.COOK)
    Fixsoraveryquick(self, ACTIONS.PLANTSOIL)
    Fixsoraquickeat(self, ACTIONS.EAT, "quickeat")
end
AddStategraphPostInit("wilson", function(self)
    if self.states.chop then
        ehook(self.states.chop, "onenter", function(inst)
            if inst:HasTag("woodcutter2") then
                inst.sg.statemem.iswoodcutter = true
                inst.AnimState:PlayAnimation("woodie_chop_loop")
            end
        end)
    end
    if self.states.chop_start then
        ehook(self.states.chop_start, "onenter", function(inst)
            if inst:HasTag("woodcutter2") then
                inst.AnimState:PlayAnimation("woodie_chop_pre")
            end
        end)
    end
    FixSora(self)
end)

AddStategraphPostInit("wilson_client", function(self)
    if self.states.chop_start then
        ehook(self.states.chop_start, "onenter", function(inst)
            if inst:HasTag("woodcutter2") then
                inst.AnimState:PlayAnimation("woodie_chop_pre")
            end
        end)
    end
    FixSora(self)
end)

local OverrideSymbolHook = userdata.MakeHook("AnimState", "OverrideSymbol", function(inst, symbol, build, newsymbol)
    if not inst.SoraLastSymbols[symbol] then
        inst.SoraLastSymbols[symbol] = {}
    end
    inst.SoraLastSymbols[symbol].build = build
    inst.SoraLastSymbols[symbol].symbol = newsymbol
    if inst.SoraLockSymbols[symbol] and next(inst.SoraLockSymbols[symbol]) then
        return true
    else
        return false
    end
end)
local ClearOverrideSymbolHook = userdata.MakeHook("AnimState", "ClearOverrideSymbol", function(inst, symbol)
    if inst.SoraLastSymbols[symbol] then
        inst.SoraLastSymbols[symbol] = nil
    end
    if inst.SoraLockSymbols[symbol] and next(inst.SoraLockSymbols[symbol]) then
        return true
    else
        return false
    end
end)
local function SoraLockSymbol(inst, symbol, key, build, newsymbol)
    if not inst.SoraLockSymbols then
        return false
    end
    if not inst.SoraLockSymbols[symbol] then
        inst.SoraLockSymbols[symbol] = {}
    end
    for k, v in pairs(inst.SoraLockSymbols[symbol]) do
        if v and v.key == key then
            table.remove(inst.SoraLockSymbols[symbol], k)
        end
    end
    table.insert(inst.SoraLockSymbols[symbol], {
        key = key,
        build = build,
        symbol = newsymbol
    })
    userdata.Call(inst, OverrideSymbolHook, symbol, build, newsymbol)
end
local function SoraUnlockSymbol(inst, symbol, key)
    if not inst.SoraLockSymbols then
        return false
    end
    if not inst.SoraLockSymbols[symbol] then
        return false
    end
    for k, v in pairs(inst.SoraLockSymbols[symbol]) do
        if v and v.key == key then
            table.remove(inst.SoraLockSymbols[symbol], k)
        end
    end
    if next(inst.SoraLockSymbols[symbol]) then

        local tb = inst.SoraLockSymbols[symbol]
        local nn = #tb
        for n = nn, 1, -1 do
            if tb[n].build and tb[n].symbol then
                userdata.Call(inst, OverrideSymbolHook, symbol, tb[n].build, tb[n].symbol)
                return
            end
        end
        userdata.Call(inst, ClearOverrideSymbolHook, symbol)
    else
        userdata.Call(inst, ClearOverrideSymbolHook, symbol)
    end
end

AddPlayerPostInit(function(inst)
    if not TheWorld.ismastersim then
        return
    end
    userdata.Hook(inst, OverrideSymbolHook)
    userdata.Hook(inst, ClearOverrideSymbolHook)
    inst.SoraLockSymbols = {}
    inst.SoraLastSymbols = {}
    inst.SoraLockSymbol = SoraLockSymbol
    inst.SoraUnlockSymbol = SoraUnlockSymbol
    inst:ListenForEvent("trade", function(inst, data)
        if not inst:HasTag("sora") and data and data.giver and data.giver:HasTag("sora") and data.item and
            data.item.prefab == "sora2armor" and data.item.skinname == "sora2armorskin" then
            data.giver.components.talker:Say("给大佬递女装")
            inst.components.inventory:Equip(data.item)
            local hands = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

            if not (hands and hands.skinname == "sora3swordskin") then
                local i = inst.components.inventory:FindItem(function(it)
                    return it.skinname == "sora3swordskin"
                end)
                if i then
                    inst.components.inventory:Equip(i)
                end
            end
            local head = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
            if not (head and head.skinname == "sora2hatskin") then
                local i = inst.components.inventory:FindItem(function(it)
                    return it.skinname == "sora2hatskin"
                end)
                if i then
                    inst.components.inventory:Equip(i)
                end

            end
        end
    end)
end)

AddComponentPostInit("wateryprotection", function(self)
    bhook(self, "SpreadProtectionAtPoint", function(s, ...)
        if s.inst and s.inst.components.inventoryitem then
            local doer = s.inst.components.inventoryitem:GetGrandOwner()
            if doer and doer.GetExp and doer:HasTag("sora") then
                doer:GetExp(5, "pour_water", 30)
            end
        end
    end)
end)

-- AddComponentPostInit("farmtiller", function(self)
--     bhook(self, "Till", function(s, pt, doer, ...)
--         if doer and doer.GetExp and doer:HasTag("sora") then
--             doer:GetExp(10, "till", 50)
--         end
--     end)
-- end)

AddComponentPostInit("farmplanttendable", function(self)
    bhook(self, "TendTo", function(s, doer, ...)
        if doer and doer.GetExp and doer:HasTag("sora") then
            doer:GetExp(5, "tendto", 30)
        end
    end)
end)
-- TUNING.SORAHAIRMAP = {
-- sora_none = {"sorahair","sorahair2"},
-- sora_uniforms = {"sorahair","sorahair2"},
-- sora_dress = {"sorahair","sorahair2"},
-- sora_gete = {"sorahair","sorahair2"},
-- sora_zhizheng = {"sorahair3","sorahair4"},
-- sora_amly = {"sorahair3","sorahair4"},
-- }

-- local AnimStateHook = {}
-- for k,v in pairs(AnimState) do
-- if k == "AddOverrideBuild" or k=="OverrideSymbol" then
-- else
-- AnimStateHook[k] = userdata.MakeHook("AnimState",k,function(inst,symbol,...)
-- if inst and inst.hairreplica and inst.hairreplica.AnimState then
-- if k == "SetBuild" or k == "SetSkin" then
-- inst.lastbuild = symbol
-- if  TUNING.SORAHAIRMAP[symbol] then
-- if inst.components.soraanimreplica and not inst.components.soraanimreplica.shown then
-- inst.components.soraanimreplica:Hide()
-- end
-- inst.hairreplica.AnimState["SetBuild"](inst.hairreplica.AnimState,TUNING.SORAHAIRMAP[symbol][1],...)
-- return false
-- end
-- end

-- inst.hairreplica.AnimState[k](inst.hairreplica.AnimState,symbol,...)
-- end
-- return false
-- end)
-- end
-- end

-- AddPrefabPostInit("sora",function(inst)
-- for k,v in pairs(AnimStateHook) do
-- userdata.Hook(inst,v)
-- end
-- if TheWorld.ismastersim then
-- inst.hairreplica = inst:SpawnChild("sorahair")
-- inst:DoTaskInTime(0,function()
-- if inst.components.soraanimreplica and not inst.components.soraanimreplica.shown then
-- inst.components.soraanimreplica:Hide()
-- end
-- end)
-- end
-- end)

AddComponentPostInit("wardrobe", function(self)
    local old = self.ApplySkins
    self.ApplySkins = function(s, doer, diff, ...)
        if doer and doer:HasTag("player") then
            if PREFAB_SKINS and PREFAB_SKINS[doer.prefab] and diff.base and
                not table.contains(PREFAB_SKINS[doer.prefab], diff.base) then
                return
            end
        end
        return old(s, doer, diff, ...)
    end
end)

AddStategraphPostInit("wilson", function(self)
    if self.states and self.states['bow'] then
        local sg = self.states['bow']
        local onenter = sg.onenter
        sg.onenter = function(inst, target, ...)
            if inst:HasTag("sora") then
                if inst.components.talker then
                    inst.components.talker:Say("你可不是我的君王")
                end
                inst.sg:GoToState("talk")
            else
                return onenter(inst, target, ...)
            end
        end
    end
end)

sorarepairer = {
    rope = 0.02,
    log = 0.01,
    pigskin = 0.1,
    marble = 0.1,
    nightmarefuel = 0.05,
    flint = 0.02,
    rocks = 0.02,
    houndstooth = 0.03,
    stinger = 0.03,
    silk = 0.03,
    spidergland = 0.03,
    manrabbit_tail = 0.1,
    crystal_abysmal_sea = 0.01,
    pinecone = 0.01,
    feather_robin_winter = 0.02,
    feather_robin = 0.02,
    feather_crow = 0.02,
    feather_canary = 0.02,
    goose_feather = 0.05,
    malbatrosss_feather = 0.05

}

-- 禁止覆盖perishable
oldrequire = GLOBAL.require
package = GLOBAL.package
GLOBAL.require = function(name, ...)

    if name == "components/perishable" then
        oldpath = package.path
        package.path = "scripts\\?.lua"
        local a, b, c = oldrequire(name, ...)
        package.path = oldpath
        return a, b, c
    end
    return oldrequire(name, ...)
end
require("components/perishable")
GLOBAL.require = oldrequire

oldCanEntitySeeTarget = CanEntitySeeTarget
GLOBAL.CanEntitySeeTarget = function(inst, target, ...)
    if inst and target and target:HasTag("sorabind") then
        if not (inst:HasTag("sora") and inst.userid and target:HasTag(inst.userid) or inst.Network:IsServerAdmin()) then
            return false
        end
    end
    return oldCanEntitySeeTarget(inst, target, ...)
end
local function RefreshContainer(inst)
    if inst.components.container then
        for i, j in pairs(inst.components.container.slots) do
            if j and j.components.container then
                for k, jv in pairs(j.components.container.slots) do
                    if jv and jv.components.perishable then
                        jv.components.perishable.perishremainingtime = jv.components.perishable.perishtime
                    end
                end
            end
        end
    end
end
local function ContainerPreseverFix(inst)
    if TheWorld.ismastersim then
        inst:DoPeriodicTask(10, RefreshContainer)
    end
end
AddPrefabPostInit("sora2bag", ContainerPreseverFix)
AddPrefabPostInit("sorabag", ContainerPreseverFix)
local initrecipe
AddSimPostInit(function()
    for k, v in pairs(TUNING.SORAUNLOCKRECIPES) do
        if AllRecipes[v] then
            local xml = AllRecipes[v].atlas
            local tex = AllRecipes[v].image
            if not xml or not tex or not TheSim:AtlasContains(xml, tex) then
                local x, t = SoraGetImage(AllRecipes[v].product)
                if x and t then
                    AllRecipes[v].atlas = x and resolvefilepath(x)
                    AllRecipes[v].image = t
                end
            end
        end
    end
end)
AddPlayerPostInit(function(inst)
    inst:DoTaskInTime(0, function()
        SoraUpdate:TryToUpdate()
    end)

end)
AddComponentPostInit("combat", function(self)
    local oldGetAttacked = self.GetAttacked
    self.GetAttacked = function(s, attacker, damage, weapon, stimuli, ...)
        local olddamagetobreak
        if weapon and weapon:HasTag("soraiceweapon") and s.inst.components.freezable then
            olddamagetobreak = s.inst.components.freezable.damagetobreak
            s.inst.components.freezable.damagetobreak = damage * 100000
        end
        local x, y, z = oldGetAttacked(s, attacker, damage, weapon, stimuli, ...)
        if olddamagetobreak and weapon and weapon:HasTag("soraiceweapon") and s.inst.components.freezable then
            s.inst.components.freezable.damagetobreak = olddamagetobreak
        end
        return x, y, z
    end
    local DoAttack = self.DoAttack
    self.DoAttack = function(self,targ, weapon,...)
        if weapon and weapon:HasTag("sora_tqy") then 
            if weapon.delayowner == targ then 
                return 
            end
            if not targ.sora_tqyattackcd then 
                targ.sora_tqyattackcd = SoraCD(0.3)
            end
            if not targ.sora_tqyattackcd() then 
                return 
            end
        end
        return DoAttack(self,targ, weapon,...)
    end
end)

AddComponentPostInit("locomotor", function(self)
    local oldGoToEntity = self.GoToEntity
    self.GoToEntity = function(s, target, ...)
        if target and target.components.sorafollewer then
            target.components.sorafollewer.stoptime = 3
        end
        return oldGoToEntity(s, target, ...)
    end
end)
local function tryDestroyReticule(inst, data)
    if data.eslot == EQUIPSLOTS.HANDS then
        local self = inst.components.playercontroller
        if self and self.reticule ~= nil then
            if self.reticule.inst.components.spellbook ~= nil and self.reticule.inst.prefab == "sora2plant" then
                self.reticule:DestroyReticule()
                return
            end
        end
    end
end

AddPlayerPostInit(function(inst)
    inst:ListenForEvent("unequip", tryDestroyReticule)
end)
-- local hook1
-- hook1 = userdata.MakeHook("AnimState","SetBuild",function(x,y,z)
-- local args = hook1.args
-- if args and args[1] == "wilsonhook" then
-- args[1] = "wilson"
-- end
-- return false
-- end)
-- AddPlayerPostInit(function(inst)
-- userdata.Hook(inst,hook1)
-- end)

AddComponentPostInit("thief", function(i)
    local StealItem = i.StealItem
    i.StealItem = function(s, vim, ...)
        if vim and (vim.components.soracontainlock or vim:HasTag("nosteal")) then
            return false
        end
        return StealItem(s, vim, ...)
    end
end)

local fixlunarthrall = function(self, target)
    if target and target:IsValid() then
        if FindEntity(target, 60, nil, {"sora2base"}) then
            return true
        end
    end
    return false
end

AddComponentPostInit("lunarthrall_plantspawner", function(i)
    local SpawnGestalt = i.SpawnGestalt
    i.SpawnGestalt = function(s, target, ...)
        if fixlunarthrall(s, target) then
            return false
        end
        return SpawnGestalt(s, target, ...)
    end

    local SpawnPlant = i.SpawnPlant
    i.SpawnPlant = function(s, target, ...)
        if fixlunarthrall(s, target) then
            return false
        end
        return SpawnPlant(s, target, ...)
    end

end)

-- ControlContainers = {
--     sora2chest = 20,
--     sora_light = 150,
-- }
-- local function TryFixContainer(inst)
--     --print("inst",inst)
--     if inst.components.container then
--         local PutAllOfActiveItemInSlot = inst.components.container.PutAllOfActiveItemInSlot
--         inst.components.container.PutAllOfActiveItemInSlot = function(s,slot,...)
--             --print(1,s,s.inst,slot,...)
--             return slot and ControlContainers[inst.prefab] and slot > ControlContainers[inst.prefab]
--                  and inst.components.container.PutOneOfActiveItemInSlot(s,slot,...) or  PutAllOfActiveItemInSlot(s,slot,...)
--         end
--     end

--     if inst.replica.container then
--         local PutAllOfActiveItemInSlot = inst.replica.container.PutAllOfActiveItemInSlot
--         inst.replica.container.PutAllOfActiveItemInSlot = function(s,slot,...)
--             --print(2,s,s.inst,slot,...)
--             return slot and ControlContainers[inst.prefab] and slot > ControlContainers[inst.prefab]
--                  and inst.replica.container.PutOneOfActiveItemInSlot(s,slot,...) or  PutAllOfActiveItemInSlot(s,slot,...)
--         end
--     end

-- end
-- for k,v in pairs(ControlContainers) do
--     AddPrefabPostInit(k,function (inst)
--         inst:DoTaskInTime(0,TryFixContainer)
--     end)

-- end

AddPrefabPostInit("treasurechest", function(inst)
    inst.sora2chest = net_bool(inst.GUID, "sora2chest", "sora2chestdirty")
    if not TheWorld.ismastersim then
        inst:ListenForEvent("sora2chestdirty", function(inst)
            if inst.sora2chest:value() and inst.replica and inst.replica.container then
                inst.replica.container:WidgetSetup("sora2chest")
            end
        end)
    end
end)
local oldSetPersistData = EntityScript.SetPersistData
EntityScript.SetPersistData = function(self, data, newents, ...)
    if data then
        for k, v in pairs(data) do
            if v and type(v) == "table" and v.add_component_if_missing_sora then
                v.add_component_if_missing = true
            end
        end
    end
    return oldSetPersistData(self, data, newents, ...)
end

-- AddLaterFn(function ()
--     if GLOBAL.BT then
--         local old = GLOBAL.BT.GetSleepTime
--         GLOBAL.BT.GetSleepTime = function(self,...)
--             if self.inst and self.inst.components.combat then
--                 local cmp = self.inst.components.combat
--                 if cmp.target and cmp.target:HasTag("sorastopbrain") then
--                     return 3
--                 end
--             end
--             return old(self,...)
--         end
--     end
-- end)

AddComponentPostInit("freezable", function(self)
    for k, v in pairs({"AddColdness", "Freeze"}) do
        local old = self[v]
        self[v] = function(s, ...)
            local inst = s.inst
            if inst and inst:HasTag("player") and inst.components.inventory and
                inst.components.inventory:HasItemWithTag("sora_unfreeze", 1) then
                return
            end
            return old(s, ...)
        end
    end
end)

AddComponentPostInit("grogginess", function(self)
    for k, v in pairs({"AddGrogginess", "GoToSleep"}) do
        local old = self[v]
        self[v] = function(s, ...)
            local inst = s.inst
            if inst and inst:HasTag("player") and inst.components.inventory and
                inst.components.inventory:HasItemWithTag("sora_unsleep", 1) then
                return
            end
            return old(s, ...)
        end
    end
end)

AddStategraphPostInit("wilson", function(sg)
    if sg.events and sg.events['yawn'] then
        local old = sg.events['yawn'].fn
        sg.events['yawn'].fn = function(inst, ...)
            if inst and inst:HasTag("player") and inst.components.inventory and
                inst.components.inventory:HasItemWithTag("sora_unsleep", 1) then
                return true
            end
            return old(inst, ...)
        end
    end
end)

AddComponentPostInit("playercontroller", function(self)
    self.remote_authority = false
end)
-- 开扶光不关箱子！
AddClassPostConstruct("screens/playerhud", function(self)
    local oldOpenSpellWheel = self.OpenSpellWheel
    if not oldOpenSpellWheel then
        return
    end
    local oldCloseAllChestContainerWidgets = up.Get(oldOpenSpellWheel, "CloseAllChestContainerWidgets", "playerhud")
    if not oldCloseAllChestContainerWidgets then
        return
    end
    local function CloseAllChestContainerWidgets(self, ...)
        if self.soraspellbook then
            return
        end
        return oldCloseAllChestContainerWidgets(self, ...)
    end
    up.Set(oldOpenSpellWheel, "CloseAllChestContainerWidgets", CloseAllChestContainerWidgets, "playerhud")
    self.OpenSpellWheel = function(s, item, ...)
        if item and item:HasTag("soraspellbook") then
            s.soraspellbook = true
        else
            s.soraspellbook = nil
        end
        return oldOpenSpellWheel(s, item, ...)
    end
end)

AddComponentPostInit("inventory", function(self)
    local CloseAllChestContainers = self.CloseAllChestContainers
    function self.CloseAllChestContainers(s, ...)
        if s:EquipHasTag("soraspellbook") then
            return
        end
        return CloseAllChestContainers(s, ...)
    end
end)

local oldRegisterPrefabs = ModManager.RegisterPrefabs

ModManager.RegisterPrefabs = function(self)
    oldRegisterPrefabs(self)
    if TUNING.SMART_SIGN_DRAW_ENABLE then
        return
    end -- 小木牌兼容
    enabledmods = ModManager.enabledmods
    local Assets = {}
    for i, modname in ipairs(enabledmods) do
        local mod = ModManager:GetMod(modname)
        -- 检索 modmain里注册的资源
        if mod.Assets then
            local modatlas = {}
            local modatlas_build = {}
            -- 检索所有的贴图
            for k, v in ipairs(mod.Assets) do
                if v.type == "ATLAS" then
                    table.insert(modatlas, v.file)
                elseif v.type == "ATLAS_BUILD" then
                    table.insert(modatlas_build, v.file)
                end
            end
            -- 判断是否有对应的ATLAS_BUILD
            for k, v in ipairs(modatlas) do
                local notfind = true
                for x, y in ipairs(modatlas_build) do
                    if v == y then
                        notfind = false
                        break
                    end
                end
                if notfind then
                    -- 没有就插入
                    -- 因为注册的时候会自动搜索路径，所以自己注册的时候要还原回原来的路径
                    v = string.gsub(v, "%.%./mods/[^/]+/", "", 1)
                    table.insert(Assets, Asset("ATLAS_BUILD", v, 256))
                end
            end
        end

        -- 检索 prefabs 里注册的资源
        if mod.Prefabs then
            for n, prefab in pairs(mod.Prefabs) do
                local modatlas = {}
                local modatlas_build = {}
                -- 检索所有的贴图
                if prefab.assets then
                    for k, v in pairs(prefab.assets) do
                        if v.type == "ATLAS" then
                            table.insert(modatlas, v.file)
                        elseif v.type == "ATLAS_BUILD" then
                            table.insert(modatlas_build, v.file)
                        end
                    end
                end
                -- 判断是否有对应的ATLAS_BUILD
                for k, v in ipairs(modatlas) do
                    local notfind = true
                    for x, y in ipairs(modatlas_build) do
                        if v == y then
                            notfind = false
                            break
                        end
                    end
                    if notfind then
                        -- 没有就插入
                        v = string.gsub(v, "%.%./mods/[^/]+/", "", 1)
                        table.insert(Assets, Asset("ATLAS_BUILD", v, 256))
                    end
                end
            end
        end
    end
    -- 注册资源
    RegisterPrefabs(Prefab("MOD_SORASIGNOTHER", nil, Assets, nil, true))
    TheSim:LoadPrefabs({"MOD_SORASIGNOTHER"})
    table.insert(self.loadedprefabs, "MOD_SORASIGNOTHER")
end

IsTradeIteming = false
AddClassPostConstruct("widgets/invslot", function(self)
    local old = self.TradeItem
    self.TradeItem = function(...)
        IsTradeIteming = true
        local x, y, z = old(...)
        IsTradeIteming = false
        return x, y, z
    end
end)
local function onpick(inst, data)
    inst.sorapickhatskip = GetTime()
end
AddComponentPostInit("inventoryitem", function(self)
    self.inst:ListenForEvent("ondropped", onpick)
end)

if not TUNING.SORADISABLEGLOBAL then
    AddPrefabPostInit("player_classified", function(inst)
        inst.soraglobalbuild = net_bool(inst.GUID, "soraglobalbuild", "ingredientmoddirty")
        inst.soraglobalbuildenable = false
        inst:DoPeriodicTask(1, function()
            local player = inst.entity:GetParent()
            local chest = inst.soraglobalbuild:value() and FindEntity(inst, 10, nil, {"sorasmartchest"}) and true or
                              false
            if not chest and inst.soraglobalbuild:value() and player and
                player.replica.inventory:HasItemWithTag("sorasmartchest", 1) then
                chest = true
            end
            if chest ~= inst.soraglobalbuildenable then
                inst.soraglobalbuildenable = chest
                inst:PushEvent("ingredientmoddirty")
            end
        end)
    end)

    local function invetoryhashook(self, fnname)
        local old = self[fnname]
        if old then
            self[fnname] = function(s, ...)
                local owner = s.owner
                if owner and owner.player_classified and owner.player_classified.soraglobalbuildenable then
                    local oldhas = owner.replica.inventory.Has
                    owner.replica.inventory.Has = function(ss, ...)
                        local a, b, c = oldhas(ss, ...)
                        return true, b, c
                    end
                    local oldHasIngredients = owner.replica.builder.HasIngredients
                    owner.replica.builder.HasIngredients = function()
                        return true
                    end
                    local x, y, z = old(s, ...)
                    owner.replica.inventory.Has = oldhas
                    owner.replica.builder.HasIngredients = oldHasIngredients
                    return x, y, z
                else
                    return old(s, ...)
                end

            end
        end
    end
    AddSimPostInit(function()
        local oldDoRecipeClick = _G.DoRecipeClick
        _G.DoRecipeClick = function(owner, recipe, skin, ...)
            if owner and owner.player_classified and owner.player_classified.soraglobalbuildenable then
                local oldhas = owner.replica.inventory.Has
                owner.replica.inventory.Has = function(ss, ...)
                    local a, b, c = oldhas(ss, ...)
                    return true, b, c
                end
                local oldHasIngredients = owner.replica.builder.HasIngredients
                owner.replica.builder.HasIngredients = function()
                    return true
                end
                local x, y, z = oldDoRecipeClick(owner, recipe, skin, ...)
                owner.replica.inventory.Has = oldhas
                owner.replica.builder.HasIngredients = oldHasIngredients
                return x, y, z
            else
                return oldDoRecipeClick(owner, recipe, skin, ...)
            end
        end
    end)
    for k, v in pairs({
        ["widgets/redux/craftingmenu_hud"] = "RebuildRecipes",
        ["widgets/redux/craftingmenu_ingredients"] = "SetRecipe",
        ["widgets/redux/craftingmenu_widget"] = "UpdateFilterButtons"
    }) do
        AddClassPostConstruct(k, function(s)
            invetoryhashook(s, v)
        end)
    end
    AddClassPostConstruct("widgets/redux/craftingmenu_hud", function(s)
        s.owner:DoTaskInTime(0.1, function()
            local CanBuild = s.owner.replica.builder.CanBuild
            local owner = s.owner
            s.owner.replica.builder.CanBuild = function(sss, ...)
                if owner and owner.player_classified and owner.player_classified.soraglobalbuildenable then
                    return true
                end
                return CanBuild(sss, ...)
            end
        end)
    end)
    AddComponentPostInit("builder", function(s)
        local oldHasIngredients = s.HasIngredients
        -- local oldRemoveIngredients = s.RemoveIngredients
        s.HasIngredients = function(ss, rec, ...)
            local inst = ss.inst
            if inst and inst.player_classified and inst.player_classified.soraglobalbuildenable then
                local oldhas = inst.components.inventory.Has
                inst.components.inventory.Has = function(sss, item, num, ...)
                    local x, y, z = oldhas(sss, item, num, ...)
                    if x then
                        return x, y, z
                    end
                    local x1, y1, z1 = TheWorld.components.sorachestmanager:HasItem(inst, item, num - y)
                    if not x1 then
                        if ss.soramakerecipecount then
                            ss.soramakerecipecount[item] = num - y - y1
                        end
                    end
                    if ss.sorajusttest then
                        x1 = true
                    end
                    return x1, y1, z1
                end
                local x, y, z = oldHasIngredients(ss, rec, ...)
                inst.components.inventory.Has = oldhas
                return x, y, z
            else
                return oldHasIngredients(ss, rec, ...)
            end
        end
        local oldGetIngredients = s.GetIngredients
        s.GetIngredients = function(ss, rec, ...)
            local inst = ss.inst
            if inst and inst.player_classified and inst.player_classified.soraglobalbuildenable then
                local oldGetCraftingIngredient = inst.components.inventory.GetCraftingIngredient
                inst.components.inventory.GetCraftingIngredient = function(sss, item, num, ...)
                    local finds = oldGetCraftingIngredient(sss, item, num, ...)
                    local need = num
                    for k, v in pairs(finds) do
                        need = need - v
                    end
                    if need < 1 then
                        return finds
                    end
                    local findss = TheWorld.components.sorachestmanager:GetIngredients(inst, item, need)
                    for ik, iv in pairs(findss) do
                        need = need - iv
                        finds[ik] = iv
                        if need < 1 then
                            return finds
                        end
                    end
                    return finds
                end
                local x, y, z = oldGetIngredients(ss, rec, ...)
                inst.components.inventory.GetCraftingIngredient = oldGetCraftingIngredient
                return x, y, z
            else
                return oldGetIngredients(ss, rec, ...)
            end
        end
        local oldMakeRecipe = s.MakeRecipe
        s.MakeRecipe = function(ss, ...)
            ss.soramakerecipe = true
            return oldMakeRecipe(ss, ...)
        end

        local oldMakeRecipeFromMenu = s.MakeRecipeFromMenu
        s.MakeRecipeFromMenu = function(ss, rec, ...)
            ss.soramakerecipe = false
            local x, y, z = oldMakeRecipeFromMenu(ss, rec, ...)
            if not ss.soramakerecipe then
                ss.soralastrecipe = rec.name
                ss.inst.components.locomotor:Stop()
                local buffaction = BufferedAction(ss.inst, nil, ACTIONS.BUILD, nil, s.inst:GetPosition(),
                    "sora_cantbuild", 0, nil, 0)
                ss.inst.components.locomotor:PushAction(buffaction, true)
                return true
            end
            return x, y, z
        end

        local oldBufferBuild = s.BufferBuild
        s.BufferBuild = function(ss, rec, ...)
            local x, y, z = oldBufferBuild(ss, rec, ...)
            if not ss.buffered_builds[rec] then
                ss.soralastrecipe = rec
                ss.inst.components.locomotor:Stop()
                local buffaction = BufferedAction(ss.inst, nil, ACTIONS.BUILD, nil, s.inst:GetPosition(),
                    "sora_cantbuild", 0, nil, 0)
                ss.inst.components.locomotor:PushAction(buffaction, true)
                return true
            end
            return x, y, z
        end
        local oldMakeRecipeAtPoint = s.MakeRecipeAtPoint
        s.MakeRecipeAtPoint = function(ss, rec, ...)
            ss.soramakerecipe = false
            local x, y, z = oldMakeRecipeAtPoint(ss, rec, ...)
            if not ss:IsBuildBuffered(rec.name) and not ss.soramakerecipe then
                ss.inst.components.locomotor:Stop()
                ss.soralastrecipe = rec.name
                local buffaction = BufferedAction(ss.inst, nil, ACTIONS.BUILD, nil, s.inst:GetPosition(),
                    "sora_cantbuild", 0, nil, 0)
                ss.inst.components.locomotor:PushAction(buffaction, true)
                return true
            end
            return x, y, z
        end
    end)
    local oldfn = ACTIONS.BUILD.fn
    ACTIONS.BUILD.fn = function(act, ...)
        if act.doer.components.builder ~= nil and act.recipe == "sora_cantbuild" then
            local builder = act.doer.components.builder
            if builder.soralastrecipe then
                builder.sorajusttest = true
                local tosay = "制作失败,至少还缺:\n"
                builder.soramakerecipecount = {}
                builder:HasIngredients(builder.soralastrecipe)
                for k, v in pairs(builder.soramakerecipecount) do
                    tosay = tosay .. (STRINGS.NAMES[k:upper()] or k) .. " * " .. tostring(v) .. "\n"
                end
                builder.sorajusttest = nil
                builder.soramakerecipecount = nil
                Say(act.doer, tosay)
            end
            return true
        end
        return oldfn(act, ...)
    end
end

for k, v in pairs({"sora2chest", "sora2fire", "sora2ice", "sora_light", "sorabag", "sora2bag", "sora_lightflier_cat",
                   "sora2base", "sora_huapen", "sora_pickhat", "sora_pot"}) do
    AddPrefabPostInit(v, function(inst)
        if not TheWorld.ismastersim then
            return
        end
        if inst.components.container ~= nil then
            inst.components.container:Close()
            inst.components.container:EnableInfiniteStackSize(true)
        end
    end)
end

local function onitemchange(inst)
    if not (inst.components.inventoryitem and inst.components.container) then
        return
    end
    local IsEmpty = inst.components.container:IsEmpty()
    local cannotopen = (inst.components.container.openlimit or 1) < 0
    local cangotoinv = inst.components.inventoryitem.cangoincontainer == true
    if not cangotoinv and IsEmpty then -- 不能进物品栏且为空 则改成可以进物品栏
        inst.components.inventoryitem.cangoincontainer = true
    elseif cangotoinv and not IsEmpty then
        inst.components.inventoryitem.cangoincontainer = false
    end
end

AddMulPrefabPostInit({
    sorabag = 1,
    sora2bag = 1
}, function(inst)
    if TheWorld.ismastersim then
        inst:ListenForEvent("itemget", onitemchange)
        inst:ListenForEvent("itemlose", onitemchange)
        inst:DoTaskInTime(0, onitemchange)
        inst:ListenForEvent("equipped", function(inst, data)
            local owner = data and data.owner
            if not owner then
                return
            end
            inst.components.container.canbeopened = true
            if inst.components.container ~= nil then
                inst.components.container:Open(owner)
            end
        end)
        inst:ListenForEvent("unequipped", function(inst, data)
            local owner = data and data.owner
            if not owner then
                return
            end
            if inst.components.container ~= nil then
                inst.components.container:Close(owner)
            end
            inst.components.container.canbeopened = false
        end)
        if inst.components.container then
            inst.components.container.canbeopened = false
        end
    end
end)
if TheNet:GetIsServer() then
    AddPlayerPostInit(function(inst)
        inst:AddComponent("soraitemcontrol")
        inst.components.soraitemcontrol:InitPlayer()
    end)
end
