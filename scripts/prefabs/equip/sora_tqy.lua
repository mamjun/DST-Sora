local assets = {}
local name = "sora_tqy"
local boxname = "sora_tqy_box"
SoraAPI.MakeAssetTable(name, assets)
SoraAPI.MakeAssetTable(boxname, assets)
local MAX_RETURN_DISTANCE_SQ = 40 * 40
local CHAIN_MIN_TARGETS = 2
local MUST_TAGS = {"_combat", "_health"}
local CANT_TAGS = {"player", "INLIMBO", "structure", "wall", "companion"}
local AttackBlack = {
    ["crow"] = 1,
    ["robin"] = 2,
    ["lureplant"] = 2,
    ["robin_winter"] = 2,
    ["canary"] = 2,
    ["butterfly"] = 1,
    ["moonbutterfly"] = 1,
}
local function OnEquip(inst, owner)
    if inst.skinEquipFn then
        return
    end
    local skin = inst.skinname
    if skin ~= nil then
        owner.AnimState:OverrideSymbol("swap_object", skin, "swap")
    else
        owner.AnimState:OverrideSymbol("swap_object", name, "swap")
    end
    inst.delayowner = owner
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
local function OnUnequip(inst, owner)
    if inst.skinEquipFn then
        return
    end
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function ClearChainTargets(inst)
    inst.alltarget = nil
    inst.chainvisited = nil
    inst.chainvalidcount = nil
    inst.index = 0
    inst.targetCD = nil
    inst.over = nil
end
local function RemoveFlightRecord(inst)
    local owner = inst.delayowner
    if owner and owner.soratqys then
        owner.soratqys[inst] = nil
    end
end
local function OnDropped(inst)
    RemoveFlightRecord(inst)
    inst.components.inventoryitem.canbepickedup = true
    inst.force_return = nil
    ClearChainTargets(inst)
    if inst.CheckGoToTask then
        inst.CheckGoToTask:Cancel()
        inst.CheckGoToTask = nil
    end
    inst.AnimState:PlayAnimation("idle", true)
    -- inst.Physics:Stop()
    inst.components.inventoryitem.pushlandedevents = true
    inst:PushEvent("on_landed")
end
local function FinishForcedReturn(inst, owner)
    if not inst.force_return then
        return false
    end
    inst.force_return = nil
    inst.canhitwork = false
    if owner and owner:IsValid() then
        inst.components.projectile.cancatch = true
        inst.components.projectile:Catch(owner)
    else
        OnDropped(inst)
    end
    return true
end
local function FindChainTargetNearOwner(inst, excluded)
    local owner = inst.delayowner
    if not (owner and owner:IsValid()) then
        return
    end
    local x, y, z = owner:GetPosition():Get()
    local validtargets = {}
    local chaintargets = {}
    for k, v in pairs(TheSim:FindEntities(x, y, z, 15, MUST_TAGS, CANT_TAGS)) do
        if not AttackBlack[v.prefab] and v:IsValid() and not v.components.health:IsDead() and v.components.combat and
            v.components.combat:CanBeAttacked(owner) then
            table.insert(validtargets, v)
            if v ~= excluded then
                table.insert(chaintargets, v)
            end
        end
    end
    if inst.canhitwork then
        for k, v in pairs(TheSim:FindEntities(x, y, z, 15, nil, CANT_TAGS, {"CHOP_workable", "MINE_workable"})) do
            if v:IsValid() and v.components.workable:CanBeWorked() then
                table.insert(validtargets, v)
                if v ~= excluded then
                    table.insert(chaintargets, v)
                end
            end
        end
    end
    if #validtargets >= CHAIN_MIN_TARGETS and #chaintargets > 0 then
        return chaintargets[math.random(#chaintargets)]
    end
end
local ApplyCheckFn
local function TryGiveSelfToOwner(inst)
    if inst and inst.delayowner and inst.delayowner:IsValid() then
        local projectile = inst.components.projectile
        if projectile.target and projectile.target ~= inst.delayowner and
            inst:GetDistanceSqToInst(inst.delayowner) > MAX_RETURN_DISTANCE_SQ then
            local chaintarget = FindChainTargetNearOwner(inst, projectile.target)
            if chaintarget then
                inst.force_return = nil
                inst.alltarget = {}
                inst.index = 0
                inst.over = true
                inst.targetCD = nil
                projectile:Stop()
                projectile:Throw(inst.delayowner, chaintarget)
                return true
            end
            inst.force_return = true
            inst.canhitwork = false
            projectile:Stop()
            if inst.delayowner.SoundEmitter then
                inst.delayowner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_return")
            end
            projectile:Throw(inst.delayowner, inst.delayowner)
            return true
        end
        local owner = inst.components.inventoryitem:GetGrandOwner()
        local powner = inst.entity:GetParent()
        if owner then
            if owner == inst.delayowner then
                ApplyCheckFn(inst, true)
                return true
            end
            inst.components.projectile.cancatch = true
            inst.components.projectile:Catch(inst.delayowner)
            return true
        elseif powner and not projectile.target then
            inst.components.projectile.cancatch = true
            inst.components.projectile:Catch(inst.delayowner)
            return true
        end
    end
end
function ApplyCheckFn(inst, Cancel)
    if inst.CheckGoToTask then
        inst.CheckGoToTask:Cancel()
        inst.CheckGoToTask = nil
    end
    if not Cancel then
        inst.CheckGoToTask = inst:DoPeriodicTask(0.5, TryGiveSelfToOwner)
    else
        RemoveFlightRecord(inst)
        inst.delayowner = nil
    end
end
local function OnThrown(inst, owner, target)
    ApplyCheckFn(inst)
    inst.components.inventoryitem.canbepickedup = false
    if target ~= owner then
        owner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_throw")
    end
    inst.delayowner = owner
    inst.AnimState:PlayAnimation("spin_loop", true)
    inst.components.inventoryitem.pushlandedevents = false
    inst.components.projectile.cancatch = false
end
local function onPickUP(inst, data)
    inst.canhitwork = false
    if data and data.owner and inst.delayowner and data.owner ~= inst.delayowner then
        TryGiveSelfToOwner(inst)
    elseif data and data.owner and inst.delayowner and data.owner == inst.delayowner then
        ApplyCheckFn(inst, true)
    end
end
local function OnCaught(inst, catcher)
    inst.force_return = nil
    ClearChainTargets(inst)
    inst.canhitwork = false
    ApplyCheckFn(inst, true)
    inst.components.inventoryitem.canbepickedup = true
    inst.components.inventoryitem:RemoveFromOwner()
    inst.delayowner = nil
    if catcher ~= nil and catcher.components.inventory ~= nil and catcher.components.inventory.isopen then
        local equip = catcher.components.inventory:GetEquippedItem(inst.components.equippable.equipslot)
        if not equip then
            catcher.components.inventory:GiveItem(inst)
            catcher.components.inventory:Equip(inst)
        elseif equip and equip:HasTag("sora_tqy_box") and not equip.components.container:IsFull() then
            equip.components.container:GiveItem(inst)
        else
            local box = catcher.components.inventory:FindItem(function(i)
                return i:HasTag("sora_tqy_box") and not i.components.container:IsFull()
            end)
            if box then
                box.components.container:GiveItem(inst)
            else
                catcher.components.inventory:GiveItem(inst)
            end
        end
        catcher:PushEvent("catch")
    end
end
local function OnEntitySleep(inst)
    if not TryGiveSelfToOwner(inst) then
        if inst.components.projectile.target and inst.delayowner and inst.delayowner:IsValid() then
            inst.components.projectile.cancatch = true
            inst.components.projectile:Catch(inst.delayowner)
        end
    end
end
local function ReturnToOwner(inst, owner)
    if owner then
        if owner.SoundEmitter then
            owner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_return")
        end
        inst.canhitwork = false
        inst.components.projectile:Throw(owner, owner)
    end
end

local function RefreshChainTargets(inst, target)
    inst.over = false
    inst.index = 0
    inst.alltarget = {}
    local visited = inst.chainvisited or {}
    local validcount = 0
    local x, y, z = inst:GetPosition():Get()
    local ents = TheSim:FindEntities(x, y, z, 15, MUST_TAGS, CANT_TAGS)
    for k, v in pairs(ents) do
        if v ~= target and not AttackBlack[v.prefab] and v:IsValid() and not v.components.health:IsDead() and
            v.components.combat and v.components.combat:CanBeAttacked(inst.delayowner) then
            validcount = validcount + 1
            if not visited[v] then
                table.insert(inst.alltarget, v)
            end
        end
    end
    if inst.canhitwork then
        local workables = TheSim:FindEntities(x, y, z, 15, nil, CANT_TAGS, {"CHOP_workable", "MINE_workable"})
        for k, v in pairs(workables) do
            if v ~= target and v:IsValid() and v.components.workable:CanBeWorked() then
                validcount = validcount + 1
                if not visited[v] then
                    table.insert(inst.alltarget, v)
                end
            end
        end
    end
    inst.chainvalidcount = validcount
    shuffleArray(inst.alltarget)
end

local function GetNextTarget(inst, target)
    if not (inst.delayowner and inst.delayowner:IsValid()) then
        -- 没有主人 掉落地上
        OnDropped(inst)
        return
    end
    if inst.delayowner:HasTag("playerghost") then
        OnDropped(inst)
        return
    end
    inst.chainvisited = inst.chainvisited or {}
    if target and target ~= inst.delayowner then
        inst.chainvisited[target] = true
    end
    if not inst.delayowner.soratqys then
        inst.delayowner.soratqys = {}
        inst.delayowner.soratqysCD = SoraCD(30)
    end
    if inst.delayowner.soratqysCD() then
        inst.delayowner.soratqys = {}
    end
    local allwork = 0
    for k in pairs(inst.delayowner.soratqys) do
        if k:IsValid() and k.delayowner == inst.delayowner and
            k.components.projectile and k.components.projectile.target then
            allwork = allwork + 1
        else
            inst.delayowner.soratqys[k] = nil
        end
    end
    if allwork > 4 then
        inst.delayowner.soratqys[inst] = nil
        if target == inst.delayowner then
            inst.components.projectile.cancatch = true
            inst.components.projectile:Catch(inst.delayowner)
        else
            inst.components.projectile:Throw(inst.delayowner, inst.delayowner)
        end
        return
    end
    inst.delayowner.soratqys[inst] = 1
    if inst:GetDistanceSqToInst(inst.delayowner) > MAX_RETURN_DISTANCE_SQ then
        local chaintarget = FindChainTargetNearOwner(inst, target)
        if chaintarget then
            inst.force_return = nil
            inst.alltarget = {}
            inst.index = 0
            inst.over = true
            inst.targetCD = nil
            inst.components.projectile:Throw(inst.delayowner, chaintarget)
            return true
        end
        -- 主人附近没有足够的连弹目标，回去
        inst.force_return = true
        inst.canhitwork = false
        inst.components.projectile:Throw(inst.delayowner, inst.delayowner)
        return
    end
    for scan = 1, 2 do
        if not inst.targetCD then
            inst.targetCD = SoraCD(5)
            inst.alltarget = {}
            inst.index = 0
            inst.over = false
        end
        if inst.targetCD() or inst.over then
            RefreshChainTargets(inst, target)
        end
        local all = #inst.alltarget
        while inst.index < all do
            inst.index = inst.index + 1
            local can = inst.alltarget[inst.index]
            if can and not inst.chainvisited[can] and can:IsValid() and
                ((can.components.health and not can.components.health:IsDead() and can.components.combat and
                    can.components.combat:CanBeAttacked(inst.delayowner)) or
                    (inst.canhitwork and can.components.workable and can.components.workable:CanBeWorked())) then
                inst.chainvisited[can] = true
                inst.components.projectile:Throw(inst.delayowner, can)
                return true
            end
        end
        if (inst.chainvalidcount or all) < CHAIN_MIN_TARGETS then
            break
        end
        inst.chainvisited = {}
        inst.over = true
    end
    if inst.delayowner.SoundEmitter then
        inst.delayowner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_return")
    end
    inst.over = true
    local all = #inst.alltarget
    if all == 0 and target == inst.delayowner then
        -- 没目标了 且弹回自己了 
        inst.components.projectile.cancatch = true
        inst.components.projectile:Catch(inst.delayowner)
        return true
    end
    inst.components.projectile:Throw(inst.delayowner, inst.delayowner)
    return true
end
local function OnHit(inst, owner, target)
    if FinishForcedReturn(inst, owner) then
        return
    end
    inst.components.inventoryitem.canbepickedup = true
    inst.components.projectile:SetSpeed(8 + math.random() * 10)
    if target and not target:HasTag("player") and inst.delayowner ~= target and target:IsValid() and
        target.components.combat then
        if not target:HasTag("smallcreature") then
            local impactfx = SpawnPrefab("impact")
            if impactfx ~= nil then
                local follower = impactfx.entity:AddFollower()
                follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0)
                impactfx:FacePoint(inst.Transform:GetWorldPosition())
            end
        end
        local splashpos = inst:GetPosition()
        local x, y, z = splashpos:Get()
        local ents = TheSim:FindEntities(x, y, z, 4, MUST_TAGS, CANT_TAGS)
        for k, v in pairs(ents) do
            if v ~= target and v:IsValid() and not v.components.health:IsDead() and v.components.combat and
                v.components.combat:CanBeAttacked(inst.delayowner) then
                inst.delayowner.components.combat:DoAttack(v, inst, inst, inst.components.projectile.stimuli, nil, 4,
                    splashpos)
            end
        end
    elseif inst.canhitwork and target and target.components.workable and target.components.workable:CanBeWorked() then
        if target:HasTag("MINE_workable") then
            target.components.workable:WorkedBy(inst.delayowner, 3)
        end
        if target:HasTag("CHOP_workable") then
            target.components.workable:WorkedBy(inst.delayowner, 3)
        end
    end
    GetNextTarget(inst, target)
end

local function OnMiss(inst, owner, target)
    if FinishForcedReturn(inst, owner) then
        return
    end
    inst.components.inventoryitem.canbepickedup = true
    if owner == target then
        OnDropped(inst)
    else
        ReturnToOwner(inst, owner)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank(name)
    inst.AnimState:SetBuild(name)
    inst.AnimState:PlayAnimation("idle", true)
    -- inst.AnimState:SetRayTestOnBB(true)
    inst:AddTag("sora_tqy")
    inst:AddTag("followsthroughvirtualrooms") -- 虚拟房间切换时保留并随玩家传送
    inst:AddTag("thrown")
    inst:AddTag("weapon")
    inst:AddTag("projectile")
    inst:AddTag("meteor_protection")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst:ListenForEvent("onpickup", onPickUP)
    inst:ListenForEvent("onremove", RemoveFlightRecord)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
    inst.components.weapon:SetRange(14, 16)
    inst:AddComponent("soraaction")
    inst:AddComponent("inspectable")
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(15)
    inst.components.projectile:SetCanCatch(true)
    inst.components.projectile:SetKeepOnDeflect(true)
    inst.components.projectile:SetOnThrownFn(OnThrown)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(OnMiss)
    inst.components.projectile:SetOnCaughtFn(OnCaught)
    inst:ListenForEvent("entitysleep", OnEntitySleep)
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst:AddComponent("soraitem")
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
    MakeHauntableLaunch(inst)
    return inst
end
local function BoxUpdateAnim(inst)
    local owner = inst.owner
    if not owner then
        return
    end
    local con = inst.components.container
    local iitem
    for i = 1, 5 do
        local item = con:GetItemInSlot(i)
        if item then
            iitem = item
            break
        end
    end
    if iitem then
        if not next(inst.last) then
            owner.AnimState:Show("ARM_carry")
            owner.AnimState:Hide("ARM_normal")
        end
        inst.last.item = iitem
        local skin = iitem.skinname
        if skin ~= nil then
            owner.AnimState:OverrideSymbol("swap_object", skin, "swap")
        else
            owner.AnimState:OverrideSymbol("swap_object", name, "swap")
        end
    else
        if next(inst.last) then
            owner.AnimState:Hide("ARM_carry")
            owner.AnimState:Show("ARM_normal")
            inst.last = {}
        end
    end
end

local function OnBoxEquip(inst, owner)
    inst.components.container:Open(owner)
    inst.last = {}
    inst.owner = owner
    if not inst.components.container:IsFull() then
        local items = owner.components.inventory:FindItems(function(i)
            return i:HasTag("sora_tqy")
        end)
        local pos = owner:GetPosition()
        if next(items) then
            for k, v in pairs(items) do
                if not inst.components.container:IsFull() then
                    local it = owner.components.inventory:RemoveItem(v)
                    inst.components.container:GiveItem(it, nil, pos, true)
                end
            end
        end
    end
    BoxUpdateAnim(inst, owner)
    inst:ListenForEvent("itemget", BoxUpdateAnim)
    inst:ListenForEvent("itemlose", BoxUpdateAnim)
end

local function OnBoxUnequip(inst, owner)
    inst.components.container:Close()
    inst:RemoveEventCallback("itemget", BoxUpdateAnim)
    inst:RemoveEventCallback("itemlose", BoxUpdateAnim)
    BoxUpdateAnim(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    inst.owner = nil
end

local function boxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank(boxname)
    inst.AnimState:SetBuild(boxname)
    inst.AnimState:PlayAnimation("idle_item", true)
    inst:AddTag("sora_tqy_box")
    inst:AddComponent("soratwoface")
    inst:AddTag("meteor_protection")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("soraaction")
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
    inst.components.weapon:SetRange(14, 16)
    inst.components.weapon.CanRangedAttack = function()
        return true
    end

    inst.components.weapon.LaunchProjectile = function(s, attacker, target)
        if inst.components.container:IsEmpty() then
            return
        end
        if not inst.owner then
            return
        end
        local item
        for i = 1, 5 do
            item = inst.components.container:GetItemInSlot(i)
            if item and not item:IsValid() then
                inst.components.container.slots[i] = nil
                item = nil
            end
            if item then
                break
            end
        end
        if item then
            inst.components.container:RemoveItem(item)
            item.Transform:SetPosition(inst.owner:GetPosition():Get())
            item.owner = inst.owner
            item.components.projectile:Throw(inst.owner, target, attacker)
            if inst.canhitwork then
                item.canhitwork = true
            end
        end
    end

    -------
    inst:AddComponent("inspectable")
    inst:AddComponent("soraitem")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora_tqy_box")
    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem:SetOnDroppedFn(OnDropped)

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnBoxEquip)
    inst.components.equippable:SetOnUnequip(OnBoxUnequip)
    MakeHauntableLaunch(inst)
    return inst
end
SoraAPI.MakeItemSkinDefaultImage(name, "images/inventoryimages/" .. name .. ".xml", name)
SoraAPI.MakeItemSkinDefaultImage(boxname, "images/inventoryimages/" .. boxname .. ".xml", boxname)
SoraAPI.MakeItemSkinDefaultData(name, {"images/inventoryimages/" .. name .. ".xml", name}, {name, name, 'idle', true})
SoraAPI.MakeItemSkinDefaultData(boxname, {"images/inventoryimages/" .. boxname .. ".xml", boxname},
    {boxname, boxname, 'idle_item', true})
local function MakeSkin(skinskin, skinname, free)
    local skin = name .. "_" .. skinskin
    SoraAPI.MakeAssetTable(skin, assets)
    SoraAPI.MakeItemSkin(name, skin, {
        name = skinname,
        atlas = "images/inventoryimages/" .. skin .. ".xml",
        image = skin,
        build = skin,
        bank = name,
        checkfn = not free and SoraAPI.SoraSkinCheckFn or nil,
        checkclientfn = not free and SoraAPI.SoraSkinCheckClientFn or nil
    })
    RegisterInventoryItemAtlas("images/inventoryimages/" .. skin .. ".xml", skin .. ".tex")
end

local function MakeBoxSkin(skinskin, skinname, free)
    local skin = boxname .. "_" .. skinskin
    SoraAPI.MakeAssetTable(skin, assets)
    SoraAPI.MakeItemSkin(boxname, skin, {
        name = skinname,
        atlas = "images/inventoryimages/" .. skin .. ".xml",
        image = skin,
        build = skin,
        bank = boxname,
        checkfn = not free and SoraAPI.SoraSkinCheckFn or nil,
        checkclientfn = not free and SoraAPI.SoraSkinCheckClientFn or nil
    })
    RegisterInventoryItemAtlas("images/inventoryimages/" .. skin .. ".xml", skin .. ".tex")
end

MakeSkin("cy", "翠羽")
MakeSkin("qy", "巧羽")
MakeSkin("qkyz", "钱坤一掷")
MakeSkin("qkyz_r", "钱坤一掷")
MakeSkin("sby", "月之冕")
MakeSkin("xql", "小青龙")
MakeBoxSkin("qy", "巧羽")
MakeBoxSkin("qkyz", "钱坤一掷")
MakeBoxSkin("sby", "危月")
MakeBoxSkin("xql", "一盘小青龙")
SoraAPI.MakeSkinNameMap(name .. "_qy", boxname .. "_qy")
SoraAPI.MakeSkinNameMap(name .. "_qkyz", boxname .. "_qkyz")
SoraAPI.MakeSkinNameMap(name .. "_qkyz", name .. "_qkyz_r")
SoraAPI.MakeSkinNameMap(name .. "_sby", boxname .. "_sby")
SoraAPI.MakeSkinNameMap(name .. "_xql", boxname .. "_xql")
return Prefab("sora_tqy", fn, assets), Prefab("sora_tqy_box", boxfn, assets)
