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
]] --
-----打包
local SORAPACK = GLOBAL.Action({
    priority = 99,
    distance = 3
})
SORAPACK.id = "SORAPACK"
SORAPACK.str = "打包"
local exp = {5000, 2000, 1000}

SORAPACK.fn = function(act)
    local target = act.target
    local invobject = act.invobject
    local doer = act.doer
    if not invobject then
        invobject = doer.components.inventory:GetEquippedItem(EQUIPSLOTS.NECK or EQUIPSLOTS.HEAD)
        if not (invobject and invobject:HasTag("sorabowknot")) then
            return true
        end
    end
    if not invobject then
        return true
    end
    if not TUNING.SORAPACK then
        if doer then
            doer.components.talker:Say("现在不能打包")
        end
        return true
    end
    if invobject.prefab == "sorabowknot" then
        if not doer:HasTag("Sora") then
            doer.components.talker:Say("这是sora的蝴蝶结")
            return true
        end
        if invobject.exp < 1000 then
            doer.components.talker:Say("经验不足！打包需要1000\r\n当前经验:" .. invobject.exp)
            return true
        end
        invobject.exp = invobject.exp - 1000
    end

    if invobject.prefab == "sora2pack" and target.prefab == "sorabowknot" then
        local num = invobject.components.stackable.stacksize * exp[GLOBAL.TUNING.SORAMODE]
        target.exp = target.exp + num
        if doer and doer.components.talker then
            doer.components.talker:Say("EXP + " .. num .. "\r\n当前经验：" .. target.exp)
        end
        invobject:Remove()
        return true
    end

    if target ~= nil then
        local targetpos = target:GetPosition()
        local skin = invobject and invobject.prefab == "sora2pack" and invobject.link_skin or nil
        local pack = GLOBAL.SpawnPrefab("sorapacker", skin)
        if pack then
            if pack.components.sorapacker:Pack(target, doer) then
                pack.Transform:SetPosition(targetpos:Get())
                if doer and doer.SoundEmitter then
                    doer.SoundEmitter:PlaySound("dontstarve/common/staff_dissassemble")
                end
                pack.components.inspectable:SetDescription(pack.components.sorapacker.item.name)
                if invobject.prefab == "sora2pack" then
                    invobject.components.stackable:Get(1):Remove()
                end
            else
                pack:Remove()
            end
        end
        return true
    end
end

AddAction(SORAPACK)
AddComponentAction("USEITEM", "sorapacker", function(inst, doer, target, actions)
    if inst:HasTag("sorabowknot") and not target:HasTag("player") then
        table.insert(actions, ACTIONS.SORAPACK)
    end
end)
-- --辅助打包
AddComponentAction("SCENE", "inspectable", function(inst, doer, actions, right)
    if right and doer and doer:HasTag("player") and doer.replica.inventory:EquipHasTag("sorabowknot") and
        doer.components.playercontroller and doer.components.playercontroller:IsControlPressed(CONTROL_FORCE_INSPECT) then
        table.insert(actions, ACTIONS.SORAPACK)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORAPACK, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORAPACK, "doshortaction"))

-- 打包盒拆包
local SORAUNPACK = GLOBAL.Action({
    rmb = true,
    priority = 2
})
SORAUNPACK.id = "SORAUNPACK"
SORAUNPACK.str = "拆包"
SORAUNPACK.fn = function(act)
    local target = act.target or act.invobject
    local doer = act.doer
    if target ~= nil and target.components.sorapacker ~= nil and not target:HasTag("sorabowknot") then
        local pos = target:GetPosition()
        target.components.sorapacker:Unpack(pos)
        target:Remove()
        return true
    end
end

AddAction(SORAUNPACK)
AddComponentAction("SCENE", "sorapacker", function(inst, doer, actions, right)
    if right and inst:HasTag("sorapacker") then
        table.insert(actions, ACTIONS.SORAUNPACK)
    end
end)
AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORAUNPACK, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORAUNPACK, "doshortaction"))

-- 圣诞树领取礼物
local SORAGIFT = GLOBAL.Action({
    priority = 999
})
SORAGIFT.id = "SORAGIFT"
SORAGIFT.str = "领取礼物"
SORAGIFT.fn = function(act)
    if act.doer and act.target ~= nil and act.target.components.soragift ~= nil then
        act.target.components.soragift:GiveGift(act.doer)
    end
    return true
end

AddAction(SORAGIFT)
AddComponentAction("SCENE", "soragift", function(inst, doer, actions, right)
    if right and inst and inst:HasTag("sora2tree") then
        table.insert(actions, ACTIONS.SORAGIFT)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORAGIFT, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORAGIFT, "dolongaction"))

-- 装备栏使用（勋章的切换）
local SORAUSE = GLOBAL.Action({
    priority = 99
})
SORAUSE.id = "SORAUSE"
SORAUSE.str = "使用"
SORAUSE.fn = function(act)
    if act.invobject ~= nil and act.invobject.components.sorauseable ~= nil and
        act.invobject.components.sorauseable:CanInteract() and act.doer.components.inventory ~= nil and
        act.doer.components.inventory:IsOpenedBy(act.doer) then
        act.invobject.components.sorauseable:StartUsingItem(act.doer)
        return true
    end
end

AddAction(SORAUSE)
AddComponentAction("INVENTORY", "sorauseable", function(inst, doer, actions, right)
    if not inst:HasTag("sorainuse") and doer.replica.inventory ~= nil and doer.replica.inventory:IsOpenedBy(doer) then
        table.insert(actions, ACTIONS.SORAUSE)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORAUSE, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORAUSE, "doshortaction"))

-- 缝纫包修复
local SORAREPAIR = GLOBAL.Action({
    priority = 999
})
SORAREPAIR.id = "SORAREPAIR"
SORAREPAIR.str = "修复"
SORAREPAIR.fn = function(act)
    if act.target ~= nil and act.doer ~= nil then
        local num = act.invobject.components.sorarepairer:DoRepair(act.invobject, act.target, act.doer)
        if num > 0 then
            act.doer.components.talker:Say("跟新的一样")
            if act.invobject.components.stackable then
                for i = 1, num do
                    act.invobject.components.stackable:Get():Remove()
                end
            else
                act.invobject:Remove()
            end
        elseif num == -2 then
            act.doer.components.talker:Say("需要更多的缝纫包才能修好")
        else
            act.doer.components.talker:Say("这个不需要修复")
        end
        -- act.target.components.soragift:GiveGift(act.doer)
    end
    return true
end

AddAction(SORAREPAIR)
AddComponentAction("USEITEM", "sorarepairer", function(inst, doer, target, actions, right)
    if right and inst and target and target.replica.inventoryitem and target.replica.inventoryitem.classified and
        ((target.replica.inventoryitem.classified.percentused:value() ~= 255) or
            (target.replica.inventoryitem.classified.perish:value() ~= 63)) then
        table.insert(actions, ACTIONS.SORAREPAIR)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORAREPAIR, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORAREPAIR, "dolongaction"))

local SORALINK = GLOBAL.Action({
    priority = 999
})
SORALINK.id = "SORALINK"
SORALINK.str = "契约"
SORALINK.fn = function(act)
    if act.doer and act.target and act.target.components.sorafllink then
        act.target.components.sorafllink:Link(act.doer)
    end
    return true
end

AddAction(SORALINK)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORALINK, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORALINK, "dolongaction"))

local SORABIND = GLOBAL.Action({
    priority = 999999
})
SORABIND.id = "SORABIND"
SORABIND.str = "查看"
SORABIND.fn = function(act)
    return true
end
local function UnBind(inst, doer, target, actions, ...)
    if inst:HasTag("sorabind") then
        act = type(actions) == "table" and actions or target
        if type(act) ~= "table" and type(doer) == "table" and not doer.IsValid then
            table.insert(doer, ACTIONS.SORABIND)
            return
        end
        if inst and doer and
            not (doer.userid and inst:HasTag(doer.userid) or doer and doer.Network and doer.Network:IsServerAdmin()) then
            table.insert(act, ACTIONS.SORABIND)
        end
        if inst and doer and doer:HasTag("sora") and inst:HasTag("soranotlink") and doer.userid and
            inst:HasTag(doer.userid) then
            table.insert(act, ACTIONS.SORALINK)
        end
    end
end
AddAction(SORABIND)
-- SCENE, USEITEM, POINT, EQUIPPED, INVENTORY
AddComponentAction("SCENE", "sorabind", UnBind)
AddComponentAction("USEITEM", "sorabind", UnBind)
AddComponentAction("POINT", "sorabind", UnBind)
AddComponentAction("EQUIPPED", "sorabind", UnBind)
AddComponentAction("INVENTORY", "sorabind", UnBind)
AddComponentAction("ISVALID", "sorabind", UnBind)
-- AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(
--                              ACTIONS.SORABIND, "dolongaction"))
-- AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(
--                            ACTIONS.SORABIND, "dolongaction"))

-- 圣诞树领取礼物
local SORAWQLEVELUP = GLOBAL.Action({
    priority = 999
})
SORAWQLEVELUP.id = "SORAWQLEVELUP"
SORAWQLEVELUP.str = "精炼"
SORAWQLEVELUP.fn = function(act)
    if act.target ~= nil and act.target.components.sorawq ~= nil then
        return act.target.components.sorawq:LevelUp(act.doer, act.invobject)
    end
    return true
end

AddAction(SORAWQLEVELUP)
AddComponentAction("USEITEM", "sorawq", function(inst, doer, target, actions, right)
    if right and inst and inst:HasTag("sorawqlevelup") and target and target:HasTag("sorawqlevelup") then
        table.insert(actions, ACTIONS.SORAWQLEVELUP)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORAWQLEVELUP, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORAWQLEVELUP, "dolongaction"))

local SORAHEAL = GLOBAL.Action({
    priority = 99,
    mount_valid = true,
    canforce = true
}) -- , 
SORAHEAL.id = "SORAHEAL"
SORAHEAL.str = "治疗"
SORAHEAL.rangecheckfn = ACTIONS.FEEDPLAYER.rangecheckfn
SORAHEAL.fn = ACTIONS.HEAL.fn

AddAction(SORAHEAL)
AddComponentAction("USEITEM", "soraaction", function(inst, doer, target, actions, right)
    if right and inst and inst.prefab == "sora2xs" and doer and doer:HasTag("sora") and target and
        target:HasTag("player") and not target:HasTag("sora") then
        table.insert(actions, ACTIONS.SORAHEAL)
    end
end)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SORAHEAL, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.SORAHEAL, "dolongaction"))

local SORALOCK = GLOBAL.Action({
    priority = 99
})
SORALOCK.id = "SORALOCK"
SORALOCK.str = "上锁"

SORALOCK.fn = function(act)
    local target = act.target
    local invobject = act.invobject
    local doer = act.doer
    if not invobject then
        return true
    end
    if target ~= nil and target:IsValid() then
        if not target:HasTag("_container") and not target:HasTag("soracontainlocked") and not target:HasTag("fire") and
            not target:HasTag("burnt") then
            Say(doer, "这个容器现在不能上锁")
            return true
        end
        if not (target.components.container and not target.components.container:IsOpen()) then
            Say(doer, "容器打开时不能上锁")
            return true
        end
        if not target.components.soracontainlock then
            target:AddComponent("soracontainlock")
        end
        target.components.soracontainlock:Init(doer, "000000")
        if invobject.components.stackable then
            invobject.components.stackable:Get():Remove()
        else
            invobject:Remove()
        end
        target.components.container:Open(doer)
        Say(doer, "这个容器成功上锁,记得设置密码哦~")
        return true
    end
end

AddAction(SORALOCK)
AddComponentAction("USEITEM", "soracontainlock", function(inst, doer, target, actions)
    if inst:HasTag("soracontainlock") and target:HasTag("_container") and not target:HasTag("soracontainlocked") and
        not target:HasTag("fire") and not target:HasTag("burnt") then
        table.insert(actions, ACTIONS.SORALOCK)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORALOCK, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORALOCK, "dolongaction"))

local SORACHESTPATCH = GLOBAL.Action({
    priority = 99
})
SORACHESTPATCH.id = "SORACHESTPATCH"
SORACHESTPATCH.str = "上强迫"

SORACHESTPATCH.fn = function(act)
    local target = act.target
    local invobject = act.invobject
    local doer = act.doer
    if not invobject then
        return true
    end
    if TUNING.SORATOCHEST then
        Say(doer, "现在禁止上强迫")
        return true
    end
    if target ~= nil and target:IsValid() then
        if not target:HasTag("_container") and not target:HasTag("fire") and not target:HasTag("burnt") then
            Say(doer, "这个箱子现在不能上强迫")
            return true
        end
        if not (target.components.container and not target.components.container:IsOpen()) then
            Say(doer, "箱子打开时不能上强迫")
            return true
        end
        if target.components.soracontainlock and target.components.soracontainlock.lockeruserid ~= doer.userid then
            Say(doer, "箱子的主人不是你")
            return true
        end
        if not target.components.sorapatch then
            target:AddComponent("sorapatch")
        end
        target.components.sorapatch:ApplyPatch("sora2chest")
        if invobject.components.stackable then
            invobject.components.stackable:Get():Remove()
        else
            invobject:Remove()
        end
        Say(doer, "成功上强迫症")
        return true
    end
end

AddAction(SORACHESTPATCH)
AddComponentAction("USEITEM", "sorapatch", function(inst, doer, target, actions)
    if inst.prefab == "sora_tochest" and target.prefab == "treasurechest" and not target:HasTag("sora2chest") and
        not target:HasTag("fire") and not target:HasTag("burnt") then
        table.insert(actions, ACTIONS.SORACHESTPATCH)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(ACTIONS.SORACHESTPATCH, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(ACTIONS.SORACHESTPATCH, "dolongaction"))

