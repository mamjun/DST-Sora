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
]]
-- 穹妹重生保留经验相关
local function Onsoradespawn(userid, soraexp)
    TheWorld.components.soraexpsave:SetExp(userid, soraexp)
end
local function Onplayerdespawnanddelete(world, data)
    local player = data.player or data
    if player:HasTag("sora") then
        if TheWorld.ismastershard then
            Onsoradespawn(player.userid, player.soraexp:value())
        else
            TheWorld.components.soraworldevent:PushEvent("soradespawn", {
                userid = player.userid,
                soraexp = player.soraexp:value()
            }, 0, true)
        end
    end
end

AddPrefabPostInit("world", function(inst)
    if inst.ismastersim then
        inst:AddComponent("soraworldevent")
        inst.components.soraworldevent.debug =
            (inst.components.soraworldevent.namespace ~= "1935" and
                inst.components.soraworldevent.namespace ~= "2423" and
                inst.components.soraworldevent.namespace ~= "4507")
        inst:AddComponent("soraexpsave")
        inst.components.soraworldevent:SetNameSpace("sora")
        inst.components.soraworldevent:SetTimer(5)
        inst:ListenForEvent("ms_playerdespawn", Onplayerdespawnanddelete)
        inst:ListenForEvent("ms_playerdespawnandmigrate",
                            Onplayerdespawnanddelete)
        inst:ListenForEvent("ms_playerdespawnanddelete",
                            Onplayerdespawnanddelete)
        if inst.ismastershard then
            inst.components.soraworldevent:ListenForEvent("soradespawn",
                                                          function(inst, data)
                Onsoradespawn(data.userid, data.soraexp)
            end)
        end
    end
end)

-- 交易组件相关（穹妹的升级/修复支持一次一组）
AddComponentPostInit("trader", function(Trader)
    local oldAcceptGift = Trader.AcceptGift
    function Trader:AcceptGift(giver, item, count)
        if self.inst:HasTag("soratrader") and item.components.stackable and
            count == nil then
            if self.inst.cantrader then
                count = self.inst:cantrader(giver, item)
            else
                count = item.components.stackable.stacksize
            end
            if count < 1 then count = 1 end
        end
        return oldAcceptGift(self, giver, item, count)
    end
end)

-- 烹饪经验
AddComponentPostInit("cooker", function(cooker, inst)
    local SoraOldCookItem = cooker.CookItem
    cooker.CookItem = function(self, item, chef)
        if self:CanCook(item, chef) and chef then
            chef:PushEvent("cookitem", {cookitem = item})
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
                if picker and picker:HasTag("sora") and picker.soralevel:value() >
                    14 then
                    local num = self.produce
                    if self.product ~= nil then
                        for i = 1, num, 1 do
                            local loot = GLOBAL.SpawnPrefab(self.product)
                            if loot ~= nil then
                                if loot.components.inventoryitem ~= nil then
                                    loot.components.inventoryitem:InheritMoisture(
                                        GLOBAL.TheWorld.state.wetness,
                                        GLOBAL.TheWorld.state.iswet)
                                end
                                if picker ~= nil and picker.components.inventory ~=
                                    nil then
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
        if not self:IsDone() or picker == nil or picker.components.inventory ==
            nil then return false end
        if picker:HasTag("sora") and picker.GetExp then
            picker.GetExp(picker, 10, "dryer")
        end
        if not getsora("sbcj") then
            if picker:HasTag("sora") and picker.soralevel:value() > 14 then
                local loot = GLOBAL.SpawnPrefab(self.product)
                if loot ~= nil then
                    picker.components.inventory:GiveItem(loot, nil,
                                                         self.inst:GetPosition())
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
        if not picker then return SoraOldHarvest(self, picker, ...) end
        if self.cropdata then -- Legion 多年生的加一年 
            if picker:HasTag("sora") and picker.GetExp and
                not self.inst:HasTag("withered") then
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
            if picker:HasTag("sora") and picker.GetExp and
                not self.inst:HasTag("withered") then
                picker.GetExp(picker, 10, "crop")
                if self.product_prefab ~= nil then
                    picker.GetExp(picker, 20, self.product_prefab, nil, true)
                end
            end
            if not getsora("sbcj") then
                if picker:HasTag("sora") and picker.soralevel:value() > 14 then
                    local product = nil
                    if self.grower ~= nil and
                        (self.grower.components.burnable ~= nil and
                            self.grower.components.burnable:IsBurning()) or
                        (self.inst.components.burnable ~= nil and
                            self.inst.components.burnable:IsBurning()) then
                        local temp = GLOBAL.SpawnPrefab(self.product_prefab)
                        product = GLOBAL.SpawnPrefab(
                                      temp.components.cookable ~= nil and
                                          temp.components.cookable.product or
                                          "seeds_cooked")
                        temp:Remove()
                    else
                        product = GLOBAL.SpawnPrefab(self.product_prefab)
                    end
                    if product ~= nil then
                        if picker ~= nil then
                            picker.components.inventory:GiveItem(product, nil,
                                                                 self.inst:GetPosition())
                        else
                            product.Transform:SetPosition(
                                self.inst.Transform:GetWorldPosition())
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
        if not picker then return SoraOldHarvest(self, picker, ...) end
        local rec = cooking.GetRecipe(self.inst.prefab, self.product)
        local sta = rec and rec.stacksize or 1
        if picker:HasTag("sora") and picker.GetExp then
            picker.GetExp(picker, 10 * sta, "stewer")
            if self.product ~= nil then
                picker.GetExp(picker, 20, self.product, nil, true)
            end
        end
        if not getsora("sbsg") then
            if self.done and picker:HasTag("sora") and picker.soralevel:value() >
                24 then
                if self.product ~= nil then
                    local loot = GLOBAL.SpawnPrefab(self.product)
                    if loot ~= nil then
                        if sta > 1 then
                            loot.components.stackable:SetStackSize(sta)
                        end
                        if picker ~= nil and picker.components.inventory ~= nil then
                            picker.components.inventory:GiveItem(loot, nil,
                                                                 self.inst:GetPosition())
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
        if not picker then return SoraOldHarvest(self, picker, ...) end
        local sta = 1
        if picker:HasTag("sora") and picker.GetExp then
            picker.GetExp(picker, 10 * sta, "stewer")
            if self.product ~= nil then
                picker.GetExp(picker, 20, self.product, nil, true)
            end
        end
        if not getsora("sbcj") then
            if self.done and picker:HasTag("sora") and picker.soralevel:value() >
                14 then
                if self.product ~= nil then
                    local loot = GLOBAL.SpawnPrefab(self.product)
                    if loot ~= nil then
                        if sta > 1 then
                            loot.components.stackable:SetStackSize(sta)
                        end
                        if picker ~= nil and picker.components.inventory ~= nil then
                            picker.components.inventory:GiveItem(loot, nil,
                                                                 self.inst:GetPosition())
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
local canlevelup = {
    "petals", -- 花瓣
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
    "houndstooth", "manrabbit_tail", "stinger"
}
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
    local old = up.Get(EntityScript.CollectActions, 'COMPONENT_ACTIONS',
                       "componentactions.lua")
    if old and old.SCENE and old.INVENTORY then
        local oldSCENEfn = old.SCENE.bundlemaker
        old.SCENE.bundlemaker = function(inst, doer, ...)
            if inst and inst:HasTag("sorabowknot") and
                not (doer and doer:HasTag("sora")) then return end
            return oldSCENEfn(inst, doer, ...)
        end
        local oldINVENTORYfn = old.INVENTORY.bundlemaker
        old.INVENTORY.bundlemaker = function(inst, doer, ...)
            if inst and inst:HasTag("sorabowknot") and
                not (doer and doer:HasTag("sora")) then return end
            return oldINVENTORYfn(inst, doer, ...)
        end
    end
end)

local oldbunldefn = ACTIONS.BUNDLE.fn
ACTIONS.BUNDLE.fn = function(act, ...)
    local target = act.invobject or act.target
    if target ~= nil and target:HasTag("sorabowknot") and act.doer and
        not act.doer:HasTag("sora") then return true end
    return oldbunldefn(act, ...)
end
AddReplicableComponent("sorapacker")

-- 能力标签
GLOBAL.SoraTags = {
    "fastbuilder", -- 修理工快速制作
    "fastpicker", -- 蜘蛛快采
    "fastpick", -- 成就快采
    "woodcutter2", -- 新的快砍 不再能白嫖路西和树精
    "quagmire_fasthands", -- 修理工快手
    "masterchef", -- 大厨
    "professionalchef", -- 调味
    "expertchef", -- 做饭动作快点
    "swampwhisperer", -- 未知标签 但是不会吓跑颤栗花
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
    if AllRecipes.portablecookpot_item and
        AllRecipes.portablecookpot_item.builder_tag and
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
end)

AddStategraphPostInit("wilson_client", function(self)
    if self.states.chop_start then
        ehook(self.states.chop_start, "onenter", function(inst)
            if inst:HasTag("woodcutter2") then
                inst.AnimState:PlayAnimation("woodie_chop_pre")
            end
        end)
    end
end)

local OverrideSymbolHook = userdata.MakeHook("AnimState", "OverrideSymbol",
                                             function(inst, symbol, build,
                                                      newsymbol)
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
local ClearOverrideSymbolHook = userdata.MakeHook("AnimState",
                                                  "ClearOverrideSymbol",
                                                  function(inst, symbol)
    if inst.SoraLastSymbols[symbol] then inst.SoraLastSymbols[symbol] = nil end
    if inst.SoraLockSymbols[symbol] and next(inst.SoraLockSymbols[symbol]) then
        return true
    else
        return false
    end
end)
local function SoraLockSymbol(inst, symbol, key, build, newsymbol)
    if not inst.SoraLockSymbols then return false end
    if not inst.SoraLockSymbols[symbol] then
        inst.SoraLockSymbols[symbol] = {}
    end
    for k, v in pairs(inst.SoraLockSymbols[symbol]) do
        if v and v.key == key then
            table.remove(inst.SoraLockSymbols[symbol], k)
        end
    end
    table.insert(inst.SoraLockSymbols[symbol],
                 {key = key, build = build, symbol = newsymbol})
    userdata.Call(inst, OverrideSymbolHook, symbol, build, newsymbol)
end
local function SoraUnlockSymbol(inst, symbol, key)
    if not inst.SoraLockSymbols then return false end
    if not inst.SoraLockSymbols[symbol] then return false end
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
                userdata.Call(inst, OverrideSymbolHook, symbol, tb[n].build,
                              tb[n].symbol)
                return
            end
        end
        userdata.Call(inst, ClearOverrideSymbolHook, symbol)
    else
        userdata.Call(inst, ClearOverrideSymbolHook, symbol)
    end
end

AddPlayerPostInit(function(inst)
    if not TheWorld.ismastersim then return end
    userdata.Hook(inst, OverrideSymbolHook)
    userdata.Hook(inst, ClearOverrideSymbolHook)
    inst.SoraLockSymbols = {}
    inst.SoraLastSymbols = {}
    inst.SoraLockSymbol = SoraLockSymbol
    inst.SoraUnlockSymbol = SoraUnlockSymbol
    inst:ListenForEvent("trade", function(inst, data)
        if not inst:HasTag("sora") and data and data.giver and
            data.giver:HasTag("sora") and data.item and data.item.prefab ==
            "sora2armor" and data.item.skinname == "sora2armorskin" then
            data.giver.components.talker:Say("给大佬递女装")
            inst.components.inventory:Equip(data.item)
            local hands = inst.components.inventory:GetEquippedItem(
                              EQUIPSLOTS.HANDS)

            if not (hands and hands.skinname == "sora3swordskin") then
                local i = inst.components.inventory:FindItem(
                              function(it)
                        return it.skinname == "sora3swordskin"
                    end)
                if i then inst.components.inventory:Equip(i) end
            end
            local head = inst.components.inventory:GetEquippedItem(
                             EQUIPSLOTS.HEAD)
            if not (head and head.skinname == "sora2hatskin") then
                local i = inst.components.inventory:FindItem(
                              function(it)
                        return it.skinname == "sora2hatskin"
                    end)
                if i then inst.components.inventory:Equip(i) end

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

AddComponentPostInit("farmtiller", function(self)
    bhook(self, "Till", function(s, pt, doer, ...)
        if doer and doer.GetExp and doer:HasTag("sora") then
            doer:GetExp(10, "till", 50)
        end
    end)
end)

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
        if not (inst:HasTag("sora") and inst.userid and
            target:HasTag(inst.userid) or inst.Network:IsServerAdmin()) then
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
                        jv.components.perishable.perishremainingtime =
                            jv.components.perishable.perishtime
                    end
                end
            end
        end
    end
end
local function ContainerPreseverFix(inst)
    if TheWorld.ismastersim then inst:DoPeriodicTask(10, RefreshContainer) end
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
    inst:DoTaskInTime(0, function() SoraUpdate:TryToUpdate() end)

end)
AddComponentPostInit("combat",function (self)
    local oldGetAttacked = self.GetAttacked
    self.GetAttacked = function(s,attacker, damage, weapon, stimuli,...)
        local olddamagetobreak 
        if weapon and weapon:HasTag("soraiceweapon") and s.inst.components.freezable then
            olddamagetobreak = s.inst.components.freezable.damagetobreak
            s.inst.components.freezable.damagetobreak = damage * 100000
        end
        local x,y,z = oldGetAttacked(s,attacker, damage, weapon, stimuli,...)
        if olddamagetobreak  and weapon and weapon:HasTag("soraiceweapon") and s.inst.components.freezable then
             s.inst.components.freezable.damagetobreak =olddamagetobreak
        end
        return x,y,z
    end
    
end)

AddComponentPostInit("locomotor",function (self)
    local oldGoToEntity = self.GoToEntity
    self.GoToEntity = function(s,target,...)
        if target and target.components.sorafollewer then
            target.components.sorafollewer.stoptime = 3
        end
        return oldGoToEntity(s,target,...)
    end
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
