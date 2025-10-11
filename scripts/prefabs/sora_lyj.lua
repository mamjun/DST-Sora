local Say = SoraAPI.Say
local assets = {}

function SoraAPI.TryPhoto(inst, doer, lyj, must)
    local srcinst = inst
    if inst.highlightforward then
        inst = inst.highlightforward
    end
    if not inst.AnimState then
        return
    end
    if not (doer and doer:HasTag("player")) then
        Say(doer, "玩家才能使用留影机")
        return
    end
    if not SoraAPI.IsSuperAdmin(doer.userid) then
        if inst:HasTag("player") then
            Say(doer, "这个暂时不能留影")
            return
        end
        if inst:HasTag("sora_photo") or inst:HasTag("cantphoto") then
            Say(doer, "这个暂时不能留影")
            return
        end
        if inst.components.skinedlegion then
            Say(doer, "这个皮肤暂时不能留影")
            return
        end
        if inst.skinname and not TheInventory:CheckClientOwnership(doer.userid, inst.skinname) then
            Say(doer, "你还没有拥有这个皮肤")
            return
        end
    end
    if inst == doer and SoraAPI.IsSuperAdmin(doer.userid) and not must then
        if lyj and lyj.components.rechargeable then
            lyj.components.rechargeable:Discharge(3)
        end
        inst:StartThread(function()
            Sleep(3)
            local data = SoraAPI.TryPhoto(inst, doer, lyj, true)
            if not data then
                Say(doer, "拍照失败咯", true)
                return true
            end
            local item = SpawnPrefab("sora_photo_item")
            if not item then
                return
            end
            item:SetData(data)
            doer.components.inventory:GiveItem(item, nil, doer:GetPosition())
        end)
        return
    end
    local skinbuild = inst.AnimState:GetSkinBuild()
    if skinbuild and skinbuild ~= "" then
        Say(doer, "这个皮肤暂时不能留影")
        return
    end
    local bank = inst.AnimState:GetCurrentBankName()
    if bank == "FROMNUM" then
        bank = inst.AnimState:GetBankHash()
    end
    local build = inst.AnimState:GetBuild()

    local debugstring = inst.entity:GetDebugString()

    local dbank, dbuild, anim = debugstring:match("bank: (.+) build: (.+) anim: .+:(.+) Frame")
    -- print(bank,build,dbank, dbuild, anim)
    if not (bank and build and anim) then
        Say(doer, "这个暂时不能留影")
        return
    end

    local name = srcinst:GetDisplayName()
    local swaps = {}
    for k, v in pairs(SoraAPI.AllSwap) do
        local build, symbol = inst.AnimState:GetSymbolOverride(k)
        if build and symbol then
            swaps[k] = {build, symbol}
        end
    end
    local xs, ys, zs = inst.Transform:GetScale()
    local data = {
        prefab = inst.prefab,
        bank = bank,
        build = build,
        anim = anim,
        animloop = false,
        scale = {xs, ys, zs},
        swaps = swaps,
        name = name,
        snow = TheWorld.state.issnowcovered,
        animlayer = inst.AnimState:GetLayer()
    }

    if inst.soramoreanimdata then
        local newdata = deepcopy(inst.soramoreanimdata)
        for k, v in pairs(newdata) do
            data[k] = v
        end
    end
    return data
end
local laterfn = {}
local function AddLaterFn(name, fn)
    if not laterfn[name] then
        laterfn[name] = {}
    end
    table.insert(laterfn[name], fn)
end
local function SetOrientation(inst, data)
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
end

for k, v in pairs({
    animal_track = 1,
    antlion_sinkhole = 1,
    archive_orchestrina_main = 1,
    archive_orchestrina_small = 1,
    archive_orchestrina_base = 1,
    cave_hole = 1,
    charlie_hand = 1,
    slow_farmplot = 1,
    fast_farmplot = 1,
    lava_pond = 1,
    pond = 1,
    pond_mos = 1,
    pond_cave = 1,
    oasislake = 1

}) do
    AddLaterFn(k, SetOrientation)
end

local name = "sora_photo"
SoraAPI.MakeAssetTable(name, assets)
local function SetData(inst, data)
    if data and data.prefab and Prefabs[data.prefab] then
        inst.AnimState:SetBank(data.bank)
        inst.AnimState:SetBuild(data.build)
        inst.AnimState:PlayAnimation(data.anim or "", data.animloop)
        for k, v in pairs(data.swaps) do
            inst.AnimState:OverrideSymbol(k, v[1], v[2])
        end
        inst.Transform:SetScale(data.scale[1], data.scale[2], data.scale[3])
        if inst.components.named then
            inst.components.named:SetName("留影:" .. (data.name or ""))
        end
        if data.orientation then
            inst.AnimState:SetOrientation(unpack(data.orientation))
        end
        if data.animscale then
            inst.AnimState:SetScale(unpack(data.animscale))
        end
        if data.layer then
            for k, v in pairs(data.layer) do
                if v then
                    inst.AnimState:Show(k)
                else
                    inst.AnimState:Hide(k)
                end
            end
        end
        if data.symbol then
            for k, v in pairs(data.symbol) do
                if v then
                    inst.AnimState:ShowSymbol(k)
                else
                    inst.AnimState:HideSymbol(k)
                end
            end
        end
        if data.animlayer then
            inst.AnimState:SetLayer(data.animlayer)
        end
        if data.finaloffset then
            inst.AnimState:SetFinalOffset(unpack(data.finaloffset))
        end
        if data.sortorder then
            inst.AnimState:SetSortOrder(unpack(data.sortorder))
        end
        if data.snow then
            inst.AnimState:Show("snow")
        else
            inst.AnimState:Hide("snow")
        end
        if data.worldoffset then
            inst.AnimState:SetSortWorldOffset(unpack(data.worldoffset))
        end

        if data.multcolour then
            inst.AnimState:SetMultColour(unpack(data.multcolour))
        end
        if data.face then
            if data.face == 1 then
                inst.Transform:SetNoFaced()
            elseif data.face == 2 then
                inst.Transform:SetTwoFaced()
            elseif data.face == 4 then
                inst.Transform:SetFourFaced()
            elseif data.face == 6 then
                inst.Transform:SetSixFaced()
            elseif data.face == 8 then
                inst.Transform:SetEightFaced()
            end
        end
        if data.rota then
            inst.Transform:SetRotation(data.rota)
        end
        if data.overbuild then
            for k, v in pairs(data.overbuild) do
                if v then
                    inst.AnimState:AddOverrideBuild(k)
                else
                    inst.AnimState:ClearOverrideBuild(k)
                end
            end
        end
        inst.data = data
        if laterfn[data.prefab] then
            for k, v in pairs(laterfn[data.prefab]) do
                v(inst, data)
            end
        end
        return
    else
        inst:DoTaskInTime(0, inst.Remove)
        return
    end
end

local function SetItemData(inst, data)
    if data and data.prefab and Prefabs[data.prefab] then
        inst.components.named:SetName("留影:" .. (data.name or ""))
        inst.data = data
        return
    else
        inst:DoTaskInTime(0, inst.Remove)
        return
    end
end

local function onhammered(inst, worker)
    -- inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local PhotoFn = {
    goldnugget = function(inst, doer)
        inst.data.animloop = not inst.data.animloop
        inst:SetData(inst.data)
        SoraAPI.Say(doer, "留影" .. (inst.data.animloop and "循环" or "单次") .. "播放")
    end
}
local function PhotoOnGet(inst, item, doer)
    if not item then
        return true
    end
    if not (doer and doer:HasTag("player")) then
        return true
    end
    local prefab = item.prefab
    if PhotoFn[prefab] then
        PhotoFn[prefab](inst, doer)
    elseif PhotoFn.Default then
        PhotoFn.Default(inst, doer)
    end

    return true
end

local function photofn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.SetData = SetData
    inst:AddComponent("soratwoface")
    inst:AddTag("sora_photo")
    inst:AddTag("cantphoto")
    inst:AddTag("walkableperipheral")
    inst:AddTag("meteor_protection")
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("sorasavecmp")
    inst.components.sorasavecmp:AddSave("data", function(i, data)
        return inst.data
    end)
    inst.components.sorasavecmp:AddLoad("data", function(i, data)
        if data.data then
            inst.data = data.data
        end
        inst:SetData(data)
        return data.data
    end)
    inst:AddComponent("named")
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("这是一张不完美的留影")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst:AddComponent("trader")
    inst.components.trader:SetAbleToAcceptTest(PhotoOnGet)
    inst.components.trader.AcceptGift = SoraAPI.NilFn

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(1)
    return inst
end
local itemname = "sora_photo_item"
SoraAPI.MakeAssetTable(itemname, assets)

local function OnDeploy(inst, pt, deployer)
    if not inst.data then
        if deployer then
            Say(deployer, "这个留影是空的")
        end
        inst:Remove()
        return
    end
    local photo = SpawnPrefab("sora_photo")
    if photo then
        photo.Transform:SetPosition(pt:Get())
        photo:SetData(inst.data)
        inst:Remove()
    end
end
local lyjname = "sora_lyj"
SoraAPI.MakeAssetTable(lyjname, assets)

local function photo_itemfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    inst.SetData = SetItemData
    inst.AnimState:SetBank("sora_photo_item")
    inst.AnimState:SetBuild("sora_photo_item")
    inst.AnimState:PlayAnimation('idle', true)
    inst:AddComponent("soratwoface")
    inst:AddTag("sora_photo")
    inst:AddTag("cantphoto")
    inst._custom_candeploy_fn = function()
        return true
    end
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("sorasavecmp")
    inst.components.sorasavecmp:AddSave("data", function(i, data)

        return inst.data
    end)
    inst.components.sorasavecmp:AddLoad("data", function(i, data)
        if data.data then
            inst.data = data.data
        end
        inst:SetData(data)
        return data.data
    end)
    inst:AddComponent("named")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. itemname .. ".xml"
    inst.components.inventoryitem.imagename = itemname
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("这是一张不完美的留影")
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(1)
    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = OnDeploy
    inst.components.deployable.spacing = DEPLOYSPACING.NONE
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)

    return inst
end

local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst:AddTag("sora_lyj")
    inst.entity:AddNetwork()
    inst:AddComponent("soratwoface")
    inst.AnimState:SetBank("sora_lyj")
    inst.AnimState:SetBuild("sora_lyj")
    inst.AnimState:PlayAnimation('idle', true)
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("这是一个不完美的留影机")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. lyjname .. ".xml"
    inst.components.inventoryitem.imagename = lyjname
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("rechargeable")
    inst.components.rechargeable:SetMaxCharge(5)
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.NECK or EQUIPSLOTS.HEAD
    inst:AddComponent("soraitem")
    inst.components.soraitem:SetBind(true)
    inst:AddComponent("soraitemcontrol")
    inst.components.soraitemcontrol.tags = {"sora_lyj"}

    inst:AddComponent("sora_lyj")
    return inst
end

SoraAPI.MakeItemSkinDefaultImage(name, "images/inventoryimages/" .. name .. ".xml", name)
RegisterInventoryItemAtlas("images/inventoryimages/" .. name .. ".xml", name .. ".tex")
STRINGS.NAMES[name:upper()] = "穹の留影"
STRINGS.CHARACTERS.GENERIC.DESCRIBE[name:upper()] = "这是一张不完美的留影"

SoraAPI.MakeItemSkinDefaultImage(itemname, "images/inventoryimages/" .. itemname .. ".xml", itemname)
RegisterInventoryItemAtlas("images/inventoryimages/" .. itemname .. ".xml", itemname .. ".tex")
STRINGS.NAMES[itemname:upper()] = "穹の留影"
STRINGS.CHARACTERS.GENERIC.DESCRIBE[itemname:upper()] = "这是一张不完美的留影"

SoraAPI.MakeItemSkinDefaultImage(lyjname, "images/inventoryimages/" .. lyjname .. ".xml", lyjname)
RegisterInventoryItemAtlas("images/inventoryimages/" .. lyjname .. ".xml", lyjname .. ".tex")
STRINGS.NAMES[lyjname:upper()] = "穹の留影机"
STRINGS.CHARACTERS.GENERIC.DESCRIBE[lyjname:upper()] = "这是一个不完美的留影机"

local lyj = SoraAPI.MakeItemSkin(lyjname, lyjname, {
    name = "穹の留影机",
    atlas = "images/inventoryimages/" .. lyjname .. ".xml",
    image = lyjname,
    build = "sora_lyj",
    bank = "sora_lyj",
    checkfn = SoraAPI.SoraSkinCheckFn,
    dontload = true,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
lyj.fn = fn
lyj.is_skin = false
lyj.assets = assets
local function placer_fn(inst)
    inst.trytimes = (inst.trytimes or 0) + 1
    if SoraAPI.SoraRPC then
        local data = SoraAPI.SoraRPC:Get('data', 'photodata', {})
        if data and data.bank then
            SetData(inst, data)
        elseif inst.trytimes < 5 then
            inst:DoTaskInTime(0.3, placer_fn)
        end
    end
end
return Prefab(name, photofn, assets), Prefab(itemname, photo_itemfn, assets), lyj,
    MakePlacer(itemname .. "_placer", nil, nil, nil, nil, nil, nil, nil, nil, nil, placer_fn)

