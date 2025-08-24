local assets = {}
local name = "sora_tqy"
local boxname = "sora_tqy_box"
SoraAPI.MakeAssetTable(name, assets)
SoraAPI.MakeAssetTable(boxname, assets)
local function ForceReturnToOwner(inst, catcher)
    if not (catcher and catcher.components.inventory) then
        return
    end
    local data = inst:GetSaveRecord()
    local instb = SpawnSaveRecord(data)
    inst:Remove()
    if catcher.components.inventory.isopen then
        local equip = catcher.components.inventory:GetEquippedItem(inst.components.equippable.equipslot)
        if not equip then
            catcher.components.inventory:GiveItem(instb)
            catcher.components.inventory:Equip(instb)
        elseif equip and equip:HasTag("sora_tqy_box") and not equip.components.container:IsFull() then
            equip.components.container:GiveItem(instb)
        else
            local box = catcher.components.inventory:FindItem(function(i)
                return i:HasTag("sora_tqy_box") and not i.components.container:IsFull()
            end)
            if box then
                box.components.container:GiveItem(instb)
            else
                catcher.components.inventory:GiveItem(instb)
            end
        end
        catcher:PushEvent("catch")
    end
end
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

local function OnDropped(inst)
    inst.AnimState:PlayAnimation("idle", true)
    -- inst.Physics:Stop()
    inst.components.inventoryitem.pushlandedevents = true
    inst:PushEvent("on_landed")
end
local ApplyCheckFn
local function TryGiveSelfToOwner(inst)
    if inst and inst.delayowner and inst.delayowner:IsValid() then
        local owner = inst.components.inventoryitem:GetGrandOwner()
        local powner = inst.entity:GetParent()
        if not owner and powner then
            inst.components.projectile:Catch(inst.delayowner)
            return true
        elseif owner == inst.delayowner then
            ApplyCheckFn(inst, true)
            return true
        elseif owner ~= inst.delayowner then
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
        inst.CheckGoToTask = inst:DoPeriodicTask(10, TryGiveSelfToOwner)
    else
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

local MUST_TAGS = {"_combat", "_health"}
local CANT_TAGS = {"player", "INLIMBO", "structure", "wall", "companion"}
local function GetNextTarget(inst, target, try)
    if not (inst.delayowner and inst.delayowner:IsValid()) then
        -- 没有主人 掉落地上
        OnDropped(inst)
        return
    end
    if inst.delayowner:HasTag("playerghost") then
        OnDropped(inst)
        return
    end
    if not inst.delayowner.soratqys then
        inst.delayowner.soratqys = {}
        inst.delayowner.soratqysCD = SoraCD(30)
    end
    if inst.delayowner.soratqysCD() then
        inst.delayowner.soratqys = {}
    end
    local allwork = 0
    local toclean = {}
    for k, v in pairs(inst.delayowner.soratqys) do
        if k.delayowner == inst.delayowner and k.components.projectile and k.components.projectile.target then
            allwork = allwork + 1
        end
    end
    if allwork > 4 then
        inst.delayowner.soratqys[inst] = nil
        if target == inst.delayowner then
            inst.components.projectile:Catch(inst.delayowner)
        else
            inst.components.projectile:Throw(inst.delayowner, inst.delayowner)
        end
        return
    end
    inst.delayowner.soratqys[inst] = 1
    if inst:GetDistanceSqToInst(inst.delayowner) > 1600 then
        -- 太远了 回去
        inst.canhitwork = false
        inst.components.projectile:Throw(inst.delayowner, inst.delayowner)
        return
    end
    try = try or 1
    if try > 10 then
        OnDropped(inst)
        return
    end

    if not inst.targetCD then
        inst.targetCD = SoraCD(5)
        inst.alltarget = {}
        inst.index = 0
        inst.over = false
    end
    if inst.targetCD() or inst.over then
        inst.over = false
        inst.index = 0
        inst.alltarget = {}
        local x, y, z = inst:GetPosition():Get()
        local ents = TheSim:FindEntities(x, y, z, 15, MUST_TAGS, CANT_TAGS)
        for k, v in pairs(ents) do
            if v ~= target and v:IsValid() and not v.components.health:IsDead() and v.components.combat and
                v.components.combat:CanBeAttacked(inst.delayowner) then
                table.insert(inst.alltarget, v)
            end
        end
        if inst.canhitwork then
            local ents = TheSim:FindEntities(x, y, z, 15, nil, CANT_TAGS, {"CHOP_workable", "MINE_workable"})
            for k, v in pairs(ents) do
                if v ~= target and v:IsValid() and v.components.workable:CanBeWorked() then
                    table.insert(inst.alltarget, v)
                end
            end
        end
        shuffleArray(inst.alltarget)
    end
    local all = #inst.alltarget
    while inst.index < all do
        inst.index = inst.index + 1
        local can = inst.alltarget[inst.index]
        if can then
            if can:IsValid() and
                ((can.components.health and not can.components.health:IsDead() and can.components.combat and
                    can.components.combat:CanBeAttacked(inst.delayowner)) or
                    (inst.canhitwork and can.components.workable and can.components.workable:CanBeWorked())) then
                -- 有不重复模板就丢出去
                inst.components.projectile:Throw(inst.delayowner, can)
                return true
            end
        end
    end
    if all > 3 then
        -- 大于四个目标就继续弹射
        inst.over = true
        return GetNextTarget(inst, target, try + 1)
    end
    -- 否则弹回玩家 
    if inst.delayowner.SoundEmitter then
        inst.delayowner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_return")
    end
    inst.over = true
    if all == 0 and target == inst.delayowner then
        -- 没目标了 且弹回自己了 
        inst.components.projectile:Catch(inst.delayowner)
        return true
    end
    inst.components.projectile:Throw(inst.delayowner, inst.delayowner)
    return true
end
local function OnHit(inst, owner, target)
    inst.components.inventoryitem.canbepickedup = true
    inst.components.projectile:SetSpeed(12 + math.random() * 6)
    GetNextTarget(inst, target)
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
        local x, y, z = inst:GetPosition():Get()
        local ents = TheSim:FindEntities(x, y, z, 4, MUST_TAGS, CANT_TAGS)
        for k, v in pairs(ents) do
            if v ~= target and v:IsValid() and not v.components.health:IsDead() and v.components.combat and
                v.components.combat:CanBeAttacked(inst.delayowner) then
                inst.delayowner.components.combat:DoAttack(v, inst, inst, inst.components.projectile.stimuli)
            end
        end
        return
    end
    if inst.canhitwork and target and target.components.workable and target.components.workable:CanBeWorked() then
        if target:HasTag("MINE_workable") then
            target.components.workable:WorkedBy(inst.delayowner, 3)
        end
        if target:HasTag("CHOP_workable") then
            target.components.workable:WorkedBy(inst.delayowner, 3)
        end
    end
end

local function OnMiss(inst, owner, target)
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
    inst:AddTag("thrown")
    inst:AddTag("weapon")
    inst:AddTag("projectile")
    local swap_data = {
        sym_build = "base"
    }

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst:ListenForEvent("onpickup", onPickUP)
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
local function TryEquipTQY(item, owner)
    if not item.components.equippable.onequipfn then
        return
    end
    item.skinEquipFn = true
    item.components.equippable.onequipfn(item, owner, false)
    item.skinEquipFn = false
end

local function TryUnEquipTQY(item, owner)
    if not item.components.equippable.onunequipfn then
        return
    end
    item.skinEquipFn = true
    item.components.equippable.onunequipfn(item, owner, false)
    item.skinEquipFn = false
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

    -- for i=1,5 do 
    --     local item = inst.components.container:GetItemInSlot(i)
    --     if item and item:HasTag("sora_tqy") then 
    --         TryEquipTQY(item,owner)
    --     end
    -- end
end

local function OnBoxUnequip(inst, owner)
    inst.components.container:Close()
    inst:RemoveEventCallback("itemget", BoxUpdateAnim)
    inst:RemoveEventCallback("itemlose", BoxUpdateAnim)
    BoxUpdateAnim(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    inst.owner = nil
    -- for i=1,5 do 
    --     local item = inst.components.container:GetItemInSlot(i)
    --     if item and item:HasTag("sora_tqy") then 
    --         TryUnEquipTQY(item,owner)
    --     end
    -- end
end
local function OnItemGet(inst, data)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if not (owner and owner:HasTag("player")) then
        return
    end
    if not (data and data.item and data.item:HasTag("sora_tqy")) then
        return
    end
    TryEquipTQY(data.item, owner)
end
local function OnItemLose(inst, data)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if not (owner and owner:HasTag("player")) then
        return
    end
    if not (data and data.prev_item and data.prev_item:HasTag("sora_tqy")) then
        return
    end
    TryUnEquipTQY(data.prev_item, owner)
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
    -- inst.AnimState:SetRayTestOnBB(true)
    inst:AddTag("sora_tqy_box")
    inst:AddComponent("soratwoface")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.CheckGoToTask = nil
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("soraaction")
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
    inst.components.weapon:SetRange(14, 16)
    inst.components.weapon.CanRangedAttack = function()
        return true
    end
    -- inst:ListenForEvent("itemget", OnItemGet)
    -- inst:ListenForEvent("itemlose", OnItemLose)

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
