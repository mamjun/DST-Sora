require "prefabutil"
local assets = {Asset("ANIM", "anim/sign_mini.zip"), Asset("ANIM", "anim/sign_mini.zip"),
                Asset("ATLAS_BUILD", "images/inventoryimages1.xml", 256),
                Asset("ATLAS_BUILD", "images/inventoryimages2.xml", 256),
                Asset("ATLAS_BUILD", "images/inventoryimages3.xml", 256)}

local function ondeploy(inst, pt, deployer)
    local ent = SpawnPrefab("sora_gemsign")
    ent.components.pickable:MakeEmpty()

    inst.components.stackable:Get():Remove()
    ent.Transform:SetPosition(pt:Get())
    ent.SoundEmitter:PlaySound("dontstarve/common/sign_craft")
end

local function dig_up(inst, worker)
    local item = SpawnPrefab("sora_gemsign_item")
    if worker and worker:HasTag("player") then
        worker.components.inventory:GiveItem(item)
    else
        item.Transform:SetPosition(inst:GetPosition():Get())
    end
    inst:Remove()
end

local function GetGem()

    return weighted_random_choice({
        redgem=0.25,
        bluegem=0.25,
        yellowgem=0.15,
        orangegem=0.15,
        purplegem=0.03,
        greengem=0.15,
        opalpreciousgem = 0.02;
    })
end


local function makeemptyfn(inst)
    inst.product = GetGem()
    inst.AnimState:ClearOverrideSymbol("SWAP_SIGN")
    inst.AnimState:ClearOverrideSymbol("SWAP_SIGN_BG")
end

local function makefullfn(inst)
    
    local image = inst.product or  GetGem()
    inst.AnimState:OverrideSymbol("SWAP_SIGN", GetInventoryItemAtlas(image .. ".tex"), image .. ".tex")
    inst.components.pickable:ChangeProduct(image)
    
end

local function onsave(inst, data)
    data.product = inst.product
end
local function onpreload(inst, data)
    inst.product = data.product or GetGem()
end
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.AnimState:SetBank("sign_mini")
    inst.AnimState:SetBuild("sign_mini")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetFinalOffset(1)
    inst:SetDeploySmartRadius(0) -- item has special NONE spacing
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    inst.product = GetGem()
    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_up)
    inst.components.workable:SetWorkLeft(1)
    inst:AddComponent("pickable")
    inst.components.pickable:SetUp("redgem", 480 * 5)
    inst.components.pickable.makefullfn = makefullfn
    inst.components.pickable.onpickedfn = makeemptyfn
    inst.components.pickable.makeemptyfn = makeemptyfn
    inst.components.pickable.MakeBarren = SoraAPI.NilFn
    inst.components.pickable.Fertilize = SoraAPI.NilFn
    inst.components.pickable.max_cycles = 100
    inst.components.pickable.cycles_left = inst.components.pickable.max_cycles
    inst:AddComponent("sorasavecmp")
    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    return inst
end

local function MakeItem(name, drawn)
    local function item_fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("sign_mini")
        inst.AnimState:SetBuild("sign_mini")
        inst.AnimState:PlayAnimation("item_drawn")

        MakeInventoryFloatable(inst, "med", 0.05, 0.65)
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = GetInventoryItemAtlas("minisign_drawn.tex")
        inst.components.inventoryitem.imagename = "minisign_drawn"

        inst:AddComponent("deployable")
        inst.components.deployable.ondeploy = ondeploy
        inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.NONE)

        return inst
    end

    return Prefab(name, item_fn)
end

return Prefab("sora_gemsign", fn, assets), MakeItem("sora_gemsign_item", false),
    MakePlacer("sora_gemsign_item_placer", "sign_mini", "sign_mini", "idle")
