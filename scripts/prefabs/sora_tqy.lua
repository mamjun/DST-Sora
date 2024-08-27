local assets = {}
local name = "sora_tqy"
local boxname = "sora_tqy_box"
SoraAPI.MakeAssetTable(name, assets)
SoraAPI.MakeAssetTable(boxname, assets)

local function OnEquip(inst, owner)
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
            powner:RemoveChild(inst)
            inst.components.inventoryitem:OnRemoved()
            inst.components.projectile:Catch(inst.delayowner)
            return true
        elseif owner == inst.delayowner then
            ApplyCheckFn(inst, true)
        elseif owner ~= inst.delayowner then
            inst.components.inventoryitem:OnRemoved()
            inst.components.projectile:Catch(inst.delayowner)
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
    if data and data.owner and inst.delayowner and data.owner ~= inst.delayowner  then
        TryGiveSelfToOwner(inst)
    elseif data and data.owner and inst.delayowner and data.owner == inst.delayowner  then
        ApplyCheckFn(inst,true)
    end
end
local function OnCaught(inst, catcher)
    ApplyCheckFn(inst, true)
    inst.components.inventoryitem.canbepickedup = true
    if catcher ~= nil and catcher.components.inventory ~= nil and catcher.components.inventory.isopen then
        local equip = catcher.components.inventory:GetEquippedItem(inst.components.equippable.equipslot)
        if not equip then
            catcher.components.inventory:GiveItem(inst)
            catcher.components.inventory:Equip(inst)
        elseif equip and equip:HasTag("sora_tqy_box") and not equip.components.container:IsFull() then
            equip.components.container:GiveItem(inst)
        else
            catcher.components.inventory:GiveItem(inst)
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
        shuffleArray(inst.alltarget)
    end
    local all = #inst.alltarget

    while inst.index < all do
        inst.index = inst.index + 1
        local can = inst.alltarget[inst.index]
        if can then
            if can:IsValid() and can.components.health and not can.components.health:IsDead() and can.components.combat and
                can.components.combat:CanBeAttacked(inst.delayowner) then
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
        local impactfx = SpawnPrefab("impact")
        if impactfx ~= nil then
            local follower = impactfx.entity:AddFollower()
            follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0)
            impactfx:FacePoint(inst.Transform:GetWorldPosition())
        end

        local x, y, z = inst:GetPosition():Get()
        local ents = TheSim:FindEntities(x, y, z, 2, MUST_TAGS, CANT_TAGS)
        for k, v in pairs(ents) do
            if v ~= target and v:IsValid() and not v.components.health:IsDead() and v.components.combat and
                v.components.combat:CanBeAttacked(inst.delayowner) then
                inst.delayowner.components.combat:DoAttack(v, inst, inst, inst.components.projectile.stimuli)
            end
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
    MakeInventoryFloatable(inst, "small", 0.18, {0.8, 0.9, 0.8}, true, -6, swap_data)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst:ListenForEvent("onpickup", onPickUP)
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
    inst.components.weapon:SetRange(14, 16)

    inst:AddComponent("inspectable")

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
local function OnBoxEquip(inst, owner)
    inst.components.container:Open(owner)
    inst.last = {}
    inst.owner = owner
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
    inst.AnimState:PlayAnimation("idle_item")
    -- inst.AnimState:SetRayTestOnBB(true)
    inst:AddTag("sora_tqy_box")

    local swap_data = {
        sym_build = "box"
    }
    MakeInventoryFloatable(inst, "small", 0.18, {0.8, 0.9, 0.8}, true, -6, swap_data)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.CheckGoToTask = nil
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
SoraAPI.MakeItemSkinDefaultImage(name, "images/inventoryimages/" .. boxname .. ".xml", boxname)

local function MakeSkin(skinskin, skinname, free)
    local skin = name .. "_" .. skinskin
    SoraAPI.MakeAssetTable(skin, assets)
    SoraAPI.MakeItemSkin(name, skin, {
        name = skinname,
        atlas = "images/inventoryimages/" .. skin .. ".xml",
        image = skin,
        build = skin,
        bank = name,
        basebuild = name,
        basebank = name,
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
        basebuild = boxname,
        basebank = boxname,
        checkfn = not free and SoraAPI.SoraSkinCheckFn or nil,
        checkclientfn = not free and SoraAPI.SoraSkinCheckClientFn or nil
    })
    RegisterInventoryItemAtlas("images/inventoryimages/" .. skin .. ".xml", skin .. ".tex")
end

MakeSkin("cy", "翠羽")
MakeSkin("qy", "巧羽")
MakeSkin("qkyz", "钱坤一掷")
MakeSkin("qkyz_r", "钱坤一掷")
MakeBoxSkin("qy", "巧羽")
MakeBoxSkin("qkyz", "钱坤一掷")
SoraAPI.MakeSkinNameMap(name .. "_qy", boxname .. "_qy")
SoraAPI.MakeSkinNameMap(name .. "_qkyz", boxname .. "_qkyz")
SoraAPI.MakeSkinNameMap(name .. "_qkyz", name .. "_qkyz_r")
return Prefab("sora_tqy", fn, assets), Prefab("sora_tqy_box", boxfn, assets)
