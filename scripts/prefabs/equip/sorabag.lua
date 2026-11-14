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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]] local assets = {Asset("ANIM", "anim/sorabag.zip"), Asset("ANIM", "anim/sorabag_sd.zip"),
                   Asset("ANIM", "anim/sorabag_sdl.zip"), Asset("ANIM", "anim/sora2bag.zip"),
                   Asset("ANIM", "anim/sora_jrxy.zip"),
                    Asset("ATLAS", "images/inventoryimages/sorabag.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabag.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabag.tex"),
                   Asset("ATLAS", "images/inventoryimages/sorabag_jrxy.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabag_jrxy.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabag_jrxy.tex"),
                   Asset("ATLAS", "images/inventoryimages/sorabag_sd.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabag_sd.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabag_sd.tex"),
                   Asset("ATLAS", "images/inventoryimages/sorabag_sdl.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabag_sdl.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabag_sdl.tex")}
local san1 = getsora("sorabagsan1")
local san2 = getsora("sorabagsan2")
local san3 = getsora("sorabagsan3")
local ice1 = getsora("sorabagice1")
local ice2 = getsora("sorabagice2")
local food1 = getsora("sorabagfoodd1")
local food2 = getsora("sorabagfoodd2") * 2
local function upgrade(inst)
    inst.grlevel = math.min(math.floor(inst.grnum / inst.need / 10), inst.maxlevel * 6)
    inst.sanlevel = math.min(math.floor(inst.sannum / inst.need / 10), inst.maxlevel * 2)
    inst.bxlevel = math.min(math.floor(inst.bxnum / inst.need / 10), inst.maxlevel * 5)
    -- 隔热
    inst.components.insulator:SetInsulation(ice1 + ice2 * inst.grlevel)
    -- 回脑
    inst.components.equippable.dapperness = (san1 + inst.sanlevel * san2) / 60

    inst.components.preserver:SetPerishRateMultiplier(food1 + food2 * inst.bxlevel)
    -- 发光
    -- turnoff(inst)
    -- turnon(inst)
end

local function OnRefuseItem(inst, giver, item)
    if item then
        local refusesay = "\t\t穹の包\n物\t数\t级\t属"
        refusesay = refusesay ..
                        string.format("\n冷(冰):\t%d/" .. inst.need * inst.maxlevel * 60 .. "\t%d\t%d", inst.grnum,
                inst.grlevel, ice1 + ice2 * inst.grlevel)
        refusesay = refusesay ..
                        string.format("\n智(蜜):\t%d/" .. inst.need * inst.maxlevel * 20 .. "\t%d\t%d", inst.sannum,
                inst.sanlevel, san1 + inst.sanlevel * san2)
        refusesay = refusesay ..
                        string.format("\n保(金):\t%d/" .. inst.need * inst.maxlevel * 50 .. "\t%d\t%d", inst.bxnum,
                inst.bxlevel * 5, (food1 + food2 * inst.bxlevel))
        giver.components.talker:Say(refusesay)
    end
end

local function AcceptTest(inst, item)
    if (item.prefab == "ice") then
        return inst.grnum < inst.need * inst.maxlevel * 60, "GENERIC"
    elseif (item.prefab == "honey") then
        return inst.sannum < inst.need * inst.maxlevel * 20, "GENERIC"
    elseif (item.prefab == "goldnugget") then
        return inst.bxnum < inst.need * inst.maxlevel * 50, "GENERIC"
    end
    return false, "WRONGTYPE"
end
local function TraderCount(inst, giver, item)
    if item.prefab == "ice" then
        return inst.need * inst.maxlevel * 60 - inst.grnum
    elseif item.prefab == "honey" then
        return inst.need * inst.maxlevel * 20 - inst.sannum
    elseif item.prefab == "goldnugget" then
        return inst.need * inst.maxlevel * 50 - inst.bxnum
    end
    return 1
end
local function OnGetItemFromPlayer(inst, giver, item)
    local num = 1
    if item.components.stackable then
        num = item.components.stackable.stacksize
    end
    if (item.prefab == "ice") then
        inst.grnum = inst.grnum + num
        inst.grlevel = math.min(math.floor(inst.grnum / inst.need / 10), inst.maxlevel * 6)
        if inst.grlevel < inst.maxlevel * 6 then
            giver.components.talker:Say(
                "冰数量:" .. inst.grnum .. "/" .. inst.need * inst.maxlevel * 60 .. "\tLV:" .. inst.grlevel ..
                    "\n护温：" .. (ice1 + ice2 * inst.grlevel))
        else
            giver.components.talker:Say("冰已满\tLV:60\n护温：" .. (ice1 + ice2 * inst.grlevel))
        end

    elseif (item.prefab == "honey") then
        inst.sannum = inst.sannum + num
        inst.sanlevel = math.min(math.floor(inst.sannum / inst.need / 10), inst.maxlevel * 2)
        if inst.sanlevel < inst.maxlevel * 2 then
            giver.components.talker:Say("蜂蜜数量:" .. inst.sannum .. "/" .. inst.need * inst.maxlevel * 20 ..
                                            "\tLV:" .. inst.sanlevel .. "\n回脑：" .. (san1 + san2 * inst.sanlevel))
        else
            giver.components.talker:Say("蜂蜜已满\tLV:20\n回脑：" .. (san1 + san2 * inst.sanlevel))
        end
    elseif (item.prefab == "goldnugget") then
        inst.bxnum = inst.bxnum + num
        inst.bxlevel = math.min(math.floor(inst.bxnum / inst.need / 10), inst.maxlevel * 5)
        if inst.bxlevel < inst.maxlevel * 5 then
            giver.components.talker:Say("金子数量:" .. inst.bxnum .. "/" .. inst.need * inst.maxlevel * 50 ..
                                            "\tLV:" .. inst.bxlevel .. "\n保鲜：" .. (food1 + food2 * inst.bxlevel) ..
                                            "")
        else
            giver.components.talker:Say("金子已满\tLV:50\n保鲜：" .. (food1 + food2 * inst.bxlevel) .. "")
        end
    end
    upgrade(inst)
end

local function onpreload(inst, data)
    if data then
        inst.grnum = data.grnum or 0
        inst.sannum = data.sannum or 0
        inst.bxnum = data.bxnum or 0
        upgrade(inst)
    end
end

local function onsave(inst, data)
    data.grnum = inst.grnum
    data.sannum = inst.sannum
    data.bxnum = inst.bxnum
end

local WINGMESH_SKIN = "sorabag_jrxy"
local WING_FX_PREFABS = {
    "sora_wingbag_draft_front_fx",
    "sora_wingbag_draft_side_fx",
    "sora_wingbag_draft_back_fx",
    "sora_wingbag_draft_back_alt2_fx"
}

local function IsWingMeshSkin(inst)
    if inst._sorabag_wingmesh_skin ~= nil then
        return inst._sorabag_wingmesh_skin
    end
    return inst.skinname == WINGMESH_SKIN
end

local function GetWingMeshOwner(inst)
    local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
    if owner ~= nil
        and owner:HasTag("player")
        and inst.components.equippable ~= nil
        and inst.components.equippable:IsEquipped()
    then
        return owner
    end
end

local function DeactivateWingMesh(inst)
    local owner = inst._sorabag_wingmesh_owner
    if owner ~= nil and owner:IsValid() then
        local colouradder = owner.components.colouradder
        if colouradder ~= nil and inst._sorabag_wing_fx ~= nil then
            for _, fx in ipairs(inst._sorabag_wing_fx) do
                if fx:IsValid() then
                    colouradder:DetachChild(fx)
                    fx.Follower:StopFollowing()
                end
            end
        end
        owner.AnimState:ClearOverrideSymbol("swap_body_backback")
        owner.AnimState:Show("swap_body_backback")
    end

    if inst._sorabag_wing_fx ~= nil then
        for _, fx in ipairs(inst._sorabag_wing_fx) do
            if fx:IsValid() then
                fx:Remove()
            end
        end
    end

    inst._sorabag_wing_fx = nil
    inst._sorabag_wingmesh_owner = nil
end

local function CreateWingFx(inst)
    local fx_list = {}
    for _, prefab_name in ipairs(WING_FX_PREFABS) do
        local fx = SpawnPrefab(prefab_name)
        if fx ~= nil then
            table.insert(fx_list, fx)
        end
    end
    return fx_list
end

local function ActivateWingMesh(inst, owner)
    if owner == nil then
        return
    end

    if inst._sorabag_wingmesh_owner == owner and inst._sorabag_wing_fx ~= nil then
        owner.AnimState:ClearOverrideSymbol("swap_body_backback")
        owner.AnimState:Hide("swap_body_backback")
        return
    end

    if inst._sorabag_wingmesh_owner ~= nil then
        DeactivateWingMesh(inst)
    end

    owner.AnimState:ClearOverrideSymbol("swap_body_backback")
    owner.AnimState:Hide("swap_body_backback")
    inst._sorabag_wingmesh_owner = owner

    if not TheWorld.ismastersim then
        return
    end

    if inst._sorabag_wing_fx == nil then
        inst._sorabag_wing_fx = CreateWingFx(inst)
    end

    for _, fx in ipairs(inst._sorabag_wing_fx) do
        if fx:IsValid() then
            fx.entity:SetParent(owner.entity)
            fx.Follower:FollowSymbol(
                owner.GUID,
                "swap_body",
                nil, nil, nil,
                true,
                nil,
                fx.wing_source_frame,
                fx.wing_source_frame_end
            )
            fx:Show()
            if fx.components.highlightchild ~= nil then
                fx.components.highlightchild:SetOwner(owner)
            end
            if owner.components.colouradder ~= nil then
                owner.components.colouradder:AttachChild(fx)
            end
        end
    end
end

local function OnWingMeshSkinInit(inst)
    inst._sorabag_wingmesh_skin = true
    local owner = GetWingMeshOwner(inst)
    if owner ~= nil then
        ActivateWingMesh(inst, owner)
    end
end

local function OnWingMeshSkinClear(inst)
    inst._sorabag_wingmesh_skin = false
    DeactivateWingMesh(inst)
end

local function onfind(inst, owner)
    local pos = inst:GetPosition()
    local x, y, z = pos:Get()
    local ents = TheSim:FindEntities(x, y, z, 16, {"Sora2Bag"})
    local linked_bag
    for _, v in ipairs(ents) do
        if v.components.equippable ~= nil
            and v.components.equippable:IsEquipped()
        then
            linked_bag = v
            break
        end
    end

    if linked_bag == nil then
        inst.sora2bag = true
        if IsWingMeshSkin(inst) then
            ActivateWingMesh(inst, owner)
        elseif inst.skinname then
            DeactivateWingMesh(inst)
            local skin = SoraAPI.GetSkin(inst.skinname)
            local build = skin and skin.build or inst.skinname
            owner.AnimState:OverrideSymbol("swap_body_backback", build, "swap_body")
        else
            DeactivateWingMesh(inst)
            owner.AnimState:OverrideSymbol("swap_body_backback", "sorabag", "swap_body")
        end
        inst.components.equippable.dapperness = (san1 + san2 * inst.sanlevel) / 60
        return
    end

    ActivateWingMesh(inst, owner)
    inst.components.equippable.dapperness = (san1 + san2 * inst.sanlevel + san3) / 60
    if inst.sora2bag then
        if owner.SoraSound then
            local t = TheWorld.state.cycles
            if inst.thankplay[linked_bag.GUID] and inst.thankplay[linked_bag.GUID] == t then
            else
                inst.thankplay[linked_bag.GUID] = t
                owner:SoraSound(owner.wlist({
                    thanks1 = 1,
                    thanks2 = 1,
                    thanks3 = 1,
                    thanks4 = 1
                }))
            end
        end
        inst.sora2bag = false
    end
end

local function CalcSanityAura(inst)
    return inst.sora2bag and 0 or 20
end

local function onequip(inst, owner)
    -- inst.components.inventoryitem.cangoincontainer = false
    if owner == nil or not owner:HasTag("sora") then
        owner:DoTaskInTime(0, function()
            if owner.components.inventory then
                owner.components.inventory:GiveItem(inst)
            end
            if owner.components.talker then
                owner.components.talker:Say("这是Sora的背包")
            end
        end)
        return
    end
    if IsWingMeshSkin(inst) then
        ActivateWingMesh(inst, owner)
    elseif inst.skinname then
        DeactivateWingMesh(inst)
            local skin = SoraAPI.GetSkin(inst.skinname)
            local build = skin and skin.build or inst.skinname
            owner.AnimState:OverrideSymbol("swap_body_backback", build, "swap_body")
        --owner.AnimState:OverrideSymbol("swap_body_backback", inst.skinname, "swap_body")
    else
        DeactivateWingMesh(inst)
        owner.AnimState:OverrideSymbol("swap_body_backback", "sorabag", "swap_body")
    end
    -- turnon(inst)
    if inst._task ~= nil then
        inst._task:Cancel()
    end
    inst._task = inst:DoPeriodicTask(1, onfind, nil, owner)
    if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end
    -- inst.components.container:Open(owner)
    -- inst:ListenForEvent("armorbroke",onbreak,owner)
end

local function onunequip(inst, owner)
    --inst.components.inventoryitem.cangoincontainer = false
    DeactivateWingMesh(inst)
    if owner ~= nil then
        owner.AnimState:ClearOverrideSymbol("swap_body_backback")
    end
    -- owner.AnimState:ClearOverrideSymbol("backpack")
    -- turnoff(inst)
    if inst._task ~= nil then
        inst._task:Cancel()
    end
    inst.components.equippable.dapperness = (san1 + san2 * inst.sanlevel) / 60
    inst.sora2bag = true
    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.MiniMapEntity:SetIcon("sorabag.tex")

    inst.AnimState:SetBank("sorabag")
    inst.AnimState:SetBuild("sorabag")
    inst.AnimState:PlayAnimation("idle",true)
    inst:AddComponent("soratwoface")
    -- inst.foleysound = "dontstarve/movement/foley/krampuspack"
    inst:AddTag("backpack")
    inst:AddTag("SoraBag")
    inst:AddTag("fridge")
    inst:AddTag("nocool")
    inst:AddTag("aquatic")
    inst:AddTag("trader")
    inst:AddTag("soratrader")
    inst:AddTag("waterproofer")
    inst:AddTag("meteor_protection")
    -- waterproofer (from waterproofer component) added to pristine state for optimization

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("krampus_sack")
        end
        return inst
    end
    inst:ListenForEvent("onremove", DeactivateWingMesh)
    inst.need = TUNING.SORAMODE / 2
    inst.maxlevel = 10
    inst.grnum = 0
    inst.sannum = 0
    inst.bxnum = 0
    inst.grlevel = 0
    inst.sanlevel = 0
    inst.bxlevel = 0
    inst.sora2bag = true
    inst.thankplay = {}
    inst:AddComponent("trader")
    inst.cantrader = TraderCount
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[
	这是sora的背包
	可以通过冰块升级隔热
	可以通过蜂蜜升级回脑
	可以通过金块升级保鲜
	]])

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/marblearmour"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sorabag.xml"
    inst.components.inventoryitem.imagename = "sorabag"
    --inst.components.inventoryitem.cangoincontainer = false
    -- inst.components.inventoryitem.cangoincontainer = false
    -- 隔热
    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(ice1)
    inst:DoPeriodicTask(1, function()
        local owner = inst.components.inventoryitem:GetGrandOwner()
        if not owner then
            return
        end
        if owner.components.temperature then
            local temp = owner.components.temperature.current
            local wtemp = TheWorld.state.temperature or 0
            if wtemp > 50 then 
                inst.components.insulator:SetSummer()
            elseif wtemp < 20 then 
                inst.components.insulator:SetWinter()
            elseif (temp - wtemp > 5) then
                inst.components.insulator:SetSummer()
            elseif (temp - wtemp < -5) then
                inst.components.insulator:SetWinter()
            else
                inst.components.insulator:SetSummer()
            end
        end
    end)
    inst:AddComponent("planardefense")
    inst.components.planardefense:SetBaseDefense(5)
    
    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = CalcSanityAura
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(getsora("sorabagwater"))
    -- 背包
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("krampus_sack")
    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(food1)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BACK or EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    -- 回脑残
    inst.components.equippable.dapperness = (san1 + inst.sanlevel * san2) / 60
    -- 移速
    inst.components.equippable.walkspeedmult = getsora("sorabagspe")
    inst:AddComponent("soraitem")

    return inst
end

--[[local function soralightfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddLight()
	inst.entity:AddNetwork()
	inst:AddTag("FX")
	inst.Light:SetFalloff(0.7)
    inst.Light:SetIntensity(.8)
    inst.Light:SetRadius(0)
    inst.Light:SetColour(180/255, 195/255, 150/255)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.persists = false
	--inst.OnEntityWake = OnLightWake
	--inst.OnEntitySleep = OnLightSleep
	return inst
end
]] --

SoraAPI.MakeItemSkinDefaultData("sorabag", {}, {nil,nil,'idle',true})
SoraAPI.MakeItemSkin("sorabag", WINGMESH_SKIN, {
    name = "金蕊曦羽",
    atlas = "images/inventoryimages/sorabag_jrxy.xml",
    image = "sorabag_jrxy",
    build = "sorabag_jrxy",
    bank = "sorabag_jrxy",
    anim = "idle",
    animloop = true,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = OnWingMeshSkinInit,
    clear_fn = OnWingMeshSkinClear
})
SoraAPI.MakeItemSkin("sorabag", "sorabag_sd", {
    name = "圣诞双子",
    atlas = "images/inventoryimages/sorabag_sd.xml",
    image = "sorabag_sd",
    build = "sorabag_sd",
    bank = "sorabag_sd",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeItemSkin("sorabag", "sorabag_sdl", {
    name = "圣诞小鹿",
    atlas = "images/inventoryimages/sorabag_sdl.xml",
    image = "sorabag_sdl",
    build = "sorabag_sdl",
    bank = "sorabag_sdl",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})

SoraAPI.MakeItemSkin("sorabag", "sorabag_sd_tmp", {
    name = "圣诞双子(限时)",
    atlas = "images/inventoryimages/sorabag_sd.xml",
    image = "sorabag_sd",
    build = "sorabag_sd",
    bank = "sorabag_sd",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
local tname = "sorabag_sby"
SoraAPI.MakeItemSkin("sorabag", tname, {
    name = "永恒水兵月",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank = tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)

local tname = "sorabag_wsqy"
SoraAPI.MakeItemSkin("sorabag", tname, {
    name = "万圣前夜",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank = tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)

local tname = "sorabag_yhjd"
SoraAPI.MakeItemSkin("sorabag", tname, {
    name = "樱华绝代",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank = tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)
SoraAPI.MakeSkinNameMap("sora_yhjd","sorabag_yhjd")
return Prefab("sorabag", fn, assets)
-- ,Prefab("soralight", soralightfn)

