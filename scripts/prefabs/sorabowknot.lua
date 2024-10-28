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
]] local assets = {Asset("ANIM", "anim/sorabowknot.zip"), Asset("ATLAS", "images/inventoryimages/sorabowknot.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabowknot.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabowknot.tex"), Asset("ANIM", "anim/sorabowknot_sora.zip"),
                   Asset("ATLAS", "images/inventoryimages/sorabowknot_sora.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabowknot_sora.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabowknot_sora.tex"),
                   Asset("ANIM", "anim/sorabowknot_ld.zip"),
                   Asset("ATLAS", "images/inventoryimages/sorabowknot_ld.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabowknot_ld.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabowknot_ld.tex"),
                   Asset("ANIM", "anim/sorabowknot_sby.zip"),
                   Asset("ATLAS", "images/inventoryimages/sorabowknot_sby.xml"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorabowknot_sby.xml", 256),
                   Asset("IMAGE", "images/inventoryimages/sorabowknot_sby.tex")}

local packassets = {Asset("ANIM", "anim/sora2pack.zip"), Asset("ATLAS", "images/inventoryimages/sora2pack.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora2pack.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora2pack.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora2pack_1.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora2pack_1.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora2pack_1.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora2pack_2.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora2pack_2.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora2pack_2.tex"), Asset("ANIM", "anim/sora3pack.zip"),
                    Asset("ANIM", "anim/sora3pack_ld.zip"),Asset("ANIM", "anim/sora3pack_wsqy.zip"), Asset("ANIM", "anim/sora3pack_sby.zip"),
                    Asset("ATLAS", "images/inventoryimages/sora3pack.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora3pack.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora3pack.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora3pack_1.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora3pack_1.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora3pack_1.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora3pack_ld.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora3pack_ld.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora3pack_ld.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora3pack_2.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora3pack_2.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora3pack_2.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora3pack_sby.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora3pack_sby.xml", 256),
                    Asset("IMAGE", "images/inventoryimages/sora3pack_sby.tex"),
                    Asset("IMAGE", "images/inventoryimages/sora3pack_wsqy.tex"),
                    Asset("ATLAS", "images/inventoryimages/sora3pack_wsqy.xml"),
                    Asset("ATLAS_BUILD", "images/inventoryimages/sora3pack_wsqy.xml", 256),
                }
local function onremovelight(light)
    light._lantern._light = nil
end
local function turnon(inst)
    local owner = inst.components.inventoryitem.owner
    local isactive = owner and owner.components.inventory and owner.components.inventory.activeitem == inst
    local radius = getsora("sorabowknotlight1") + getsora("sorabowknotlight2") * inst.llevel
    if radius > 0 and (inst.components.equippable:IsEquipped() or isactive) then
        if inst._light == nil then
            inst._light = SpawnPrefab("soralight")
            inst._light._lantern = inst
            inst:ListenForEvent("onremove", onremovelight, inst._light)
        end
        inst._light.entity:SetParent((owner or inst).entity)
        inst._light.Light:SetRadius(radius)
    elseif inst._light ~= nil then
        inst._light:Remove()
    end
end

local function turnoff(inst)
    if inst._light ~= nil then
        inst._light:Remove()
    end
end
local skinfn = {
    sorabowknot_ld = {
        equip = function(inst, owner)
            if inst.vfx_fx and inst.vfx_fx:IsValid() then
                inst.vfx_fx:Remove()
                inst.vfx_fx = nil
            end
            if inst.sfx then
                inst.sfx:Cancel()
                inst.sfx = nil
            end
            inst.vfx_fx = SpawnPrefab("cane_candy_fx")
            inst.vfx_fx.entity:AddFollower()
            inst.vfx_fx.entity:SetParent(owner.entity)
            inst.vfx_fx.Follower:FollowSymbol(owner.GUID, "hair", 0, 0, 0)

            inst.sfx = inst:DoPeriodicTask(1, function(inst)
                local find = false
                for k, v in pairs(AllPlayers) do
                    if v ~= owner and v:GetDistanceSqToInst(inst) < 400 then
                        find = true
                        break
                    end
                end
                if find then
                    inst.foleysound = "dontstarve/creatures/together/deer/chain"
                else
                    inst.foleysound = nil
                end
            end)

        end,
        unequip = function(inst, owner)
            if inst.vfx_fx and inst.vfx_fx:IsValid() then
                inst.vfx_fx:Remove()
                inst.vfx_fx = nil
            end
            if inst.sfx then
                inst.sfx:Cancel()
                inst.sfx = nil
                inst.foleysound = nil
            end
        end
    }

}

local function onequip(inst, owner)
    if owner ~= nil and not owner:HasTag("sora") then
        owner:DoTaskInTime(0, function()
            if owner.components.inventory then
                owner.components.inventory:GiveItem(inst)
            end
            if owner.components.talker then
                owner.components.talker:Say("这是Sora的蝴蝶结")
            end
        end)
        return
    end
    -- owner.AnimState:OverrideSymbol("swap_body", "sorabowknot", "swap_body")
    -- owner.AnimState:OverrideSymbol("swap_body", "sorabowknot", "swap_sorabowknot")
    -- inst.components.container:Open(owner)
    owner.components.combat.externaldamagemultipliers:SetModifier("sora2amulet", getsora("sorabowknotatt"))
    owner.components.combat.externaldamagetakenmultipliers:SetModifier("sora2amulet", 2 - getsora("sorabowknotarm"))
    turnoff(inst)
    turnon(inst)
    if inst.skinname and skinfn[inst.skinname] and skinfn[inst.skinname].equip then
        skinfn[inst.skinname].equip(inst, owner)
    end
end

local function onunequip(inst, owner)
    -- owner.AnimState:ClearOverrideSymbol("swap_body")
    -- owner.AnimState:ClearOverrideSymbol("backpack")
    turnoff(inst)
    owner.components.combat.externaldamagemultipliers:SetModifier("sora2amulet")
    owner.components.combat.externaldamagetakenmultipliers:SetModifier("sora2amulet")
    -- inst:RemoveEventCallback("armorbroke",onbreak,owner)
    if inst.skinname and skinfn[inst.skinname] and skinfn[inst.skinname].unequip then
        skinfn[inst.skinname].unequip(inst, owner)
    end
end

local function upgrade(inst)
    inst.llevel = math.min(math.floor(inst.lexp / inst.need / 10), inst.maxlevel * 5)
    -- 发光
    turnon(inst)
end

local function OnRefuseItem(inst, giver, item)
    if item then
        local refusesay = "\t\t穹の二次元蝴蝶结\n物\t数\t级\t属"
        refusesay = refusesay ..
                        string.format("\n光(萤):\t%d/" .. inst.need * inst.maxlevel * 50 .. "\t%d\t%d", inst.lexp,
                inst.llevel, 0.1 * inst.llevel)
        refusesay = refusesay .. "\n当前经验:\t" .. inst.exp
        giver.components.talker:Say(refusesay)
    end
end
local lexpget = {
    butterflywings = {100, 50, 20},
    butter = {1000, 500, 200},
    sora2pack = {5000, 2000, 1000}
}
local lexpget2 = {
    lightbulb = 1,
    fireflies = 3,
    wormlight = 10,
    wormlight_lesser = 5
}
local function AcceptTest(inst, item)
    if lexpget2[item.prefab] then
        return inst.lexp < inst.need * inst.maxlevel * 50, "GENERIC"
    elseif lexpget[item.prefab] then
        return true
    end
    return false, "WRONGTYPE"
end
local function TraderCount(inst, giver, item)
    if lexpget2[item.prefab] then
        return math.ceil((inst.need * inst.maxlevel * 50 - inst.lexp) / lexpget2[item.prefab])
    elseif lexpget[item.prefab] then
        return 999999
    end
    return 1
end

local function OnGetItemFromPlayer(inst, giver, item, player)
    local num = 1
    if item.components.stackable then
        num = item.components.stackable.stacksize
    end

    if lexpget[item.prefab] then
        inst.exp = inst.exp + lexpget[item.prefab][TUNING.SORAMODE] * num
        giver.components.talker:Say("EXP + " .. lexpget[item.prefab][TUNING.SORAMODE] * num .. "\r\n当前经验：" ..
                                        inst.exp)
        return true
    end
    local lexp = lexpget2[item.prefab]
    if lexp > 0 then
        inst.lexp = math.min(inst.lexp + lexp * num, inst.need * 10 * 50)
        inst.llevel = math.min(math.floor(inst.lexp / inst.need / 10), inst.maxlevel * 5)
        if inst.llevel < inst.maxlevel * 5 then
            giver.components.talker:Say(
                "发光数量:" .. inst.lexp .. "/" .. inst.need * inst.maxlevel * 50 .. "\tLV:" .. inst.llevel ..
                    "\n范围：" .. (getsora("sorabowknotlight1") + getsora("sorabowknotlight2") * inst.llevel))
        else
            giver.components.talker:Say("发光已满\tLV:50\n发光：" ..
                                            (getsora("sorabowknotlight1") + getsora("sorabowknotlight2") * 50))
        end
        upgrade(inst)
    end
end

local function onpreload(inst, data)
    if data then
        inst.exp = data.exp or 0
        inst.lexp = data.lexp or 0
        upgrade(inst)
    end
end

local function onsave(inst, data)
    data.exp = inst.exp
    data.lexp = inst.lexp
end
RegisterInventoryItemAtlas("images/inventoryimages/sorabowknot.xml", "sorabowknot.tex")
local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.MiniMapEntity:SetIcon("sorabowknot.tex")

    inst.AnimState:SetBank("sorabowknot")
    inst.AnimState:SetBuild("sorabowknot")
    inst.AnimState:PlayAnimation("idle", true)
    inst:AddTag("aquatic")
    inst:AddTag("waterproofer")
    inst:AddTag("sorabowknot")
    inst:AddTag("soratrader")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        -- inst.OnEntityReplicated = function(inst)
        -- inst.replica.container:WidgetSetup("krampus_sack")
        -- end
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[
	这是sora的蝴蝶结
	可以消耗经验打包物品
	可以通过荧光果、萤火虫、微光浆果、发光蓝莓升级发光
	可以通过蝴蝶翅膀和黄油增加经验
	缓慢回复经验
	]])
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(getsora("sorabowknotwater"))
    inst.maxlevel = 10
    inst.need = TUNING.SORAMODE / 2
    inst.llevel = 0
    inst.lexp = 0
    inst.exp = 0
    inst:DoPeriodicTask(100, function(inst)
        inst.exp = inst.exp + lexpget["butterflywings"][TUNING.SORAMODE]
    end)
    inst:AddComponent("bundlemaker")
    inst.components.bundlemaker:SetBundlingPrefabs("sorapack_container", "sora3packer")
    inst.components.bundlemaker:SetOnStartBundlingFn(function(inst, doer)
        if doer and doer.components.bundler then
            doer.components.bundler.itemprefab = nil
            if inst.skinname == "sorabowknot_ld" then
                doer.components.bundler.preskinname = "sorapacker_ld"
            elseif inst.skinname == "sorabowknot_wsqy" or inst.skinname == "sorabowknot_wsqy_r" then
                doer.components.bundler.preskinname = "sorapacker_wsqy"
            elseif inst.skinname == "sorabowknot_sby" then
                doer.components.bundler.preskinname = "sorapacker_sby"
            elseif inst.skinname == "sorabowknot_dw" then
                doer.components.bundler.preskinname = "sorapacker_dw"
            elseif inst.skinname == "sorabowknot_dw_tmp" then
                doer.components.bundler.preskinname = "sorapacker_dw_tmp"
            else
                doer.components.bundler.preskinname = nil
            end
        end
    end)
    inst:AddComponent("sorapacker")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/marblearmour"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sorabowknot.xml"
    inst.components.inventoryitem.imagename = "sorabowknot"
    inst.components.inventoryitem.onactiveitemfn = turnon
    inst.components.inventoryitem.onpickupfn = turnoff
    inst.components.inventoryitem.onputininventoryfn = turnoff
    inst.components.inventoryitem.ondropfn = turnoff
    inst:AddComponent("planardefense")
    inst.components.planardefense:SetBaseDefense(5)
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.NECK or EQUIPSLOTS.HEAD
    -- 回脑残
    inst.components.equippable.dapperness = getsora("sorabowknotsan") / 60
    -- 移速
    inst.components.equippable.walkspeedmult = getsora("sorabowknotspe")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst:AddComponent("trader")
    inst.cantrader = TraderCount
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
    inst:AddComponent("soraitem")
    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    return inst
end

local function onfullload(inst)
    inst.components.inspectable:SetDescription(inst.components.sorapacker.item.name)
end
-- 打包纸

local function packfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.MiniMapEntity:SetIcon("giftwarp.tex")

    inst.AnimState:SetBank("sora2pack_1")
    inst.AnimState:SetBuild("sora2pack")
    inst.AnimState:PlayAnimation("anim", true)
    inst:AddTag("aquatic")
    inst:AddTag("sorapacker")
    inst:AddTag("sorabowknot")
    inst:AddTag("nonpackable")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        -- inst.OnEntityReplicated = function(inst)
        -- inst.replica.container:WidgetSetup("krampus_sack")
        -- end
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("一次性的打包纸，拿来打包什么好呢？")
    inst:AddComponent("tradable")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("sorapacker")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/marblearmour"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2pack_1.xml"
    inst.components.inventoryitem.imagename = "sora2pack_1"

    return inst
end
SoraAPI.MakeItemSkinDefaultData("sora2pack", {}, {"sora2pack","sora2pack_1"})
SoraAPI.MakeItemSkin("sora2pack", "sora2pack_2", {
    name = "穹の打包纸",
    atlas = "images/inventoryimages/sora2pack_2.xml",
    image = "sora2pack_2",
    build = "sora2pack",
    bank = "sora2pack_2",
    init_fn = function(inst)
        inst.link_skin = "sorapacker_2"
    end,
    clear_fn = function(inst)
        inst.link_skin = nil
    end
})

-- 打包盒
local function ondeploy(inst, pt, deployer)
    if inst.components.sorapacker then
        inst.components.sorapacker:Unpackbuild(pt)
        inst:Remove()
    end
end

local function fullfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    -- inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sora3pack_1")
    inst.AnimState:SetBuild("sora3pack")
    inst.AnimState:PlayAnimation("anim", true)
    inst:AddTag("sorapacker")
    inst:AddTag("nonpackable")
    inst:AddTag("_named")
    -- inst.displaynamefn = get_name
    inst.entity:SetPristine()
    inst:DoTaskInTime(0, function(i)
        if i.replica.inventoryitem then
            i.replica.inventoryitem.CanDeploy = function()
                return true
            end
        end
        if i.components.deployable then
            i.components.deployable.CanDeploy = function()
                return true
            end
        end
    end)
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable")

    inst:AddComponent("sorapacker")
    inst:AddComponent("deployable")

    inst.components.deployable.ondeploy = ondeploy
    inst.components.deployable:SetDeploySpacing(1)
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "sora3pack_1"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora3pack_1.xml"
    inst.onLoad = onfullload
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/sorapacker.xml"
    return inst
end


SoraAPI.MakeItemSkinDefaultData("sorapacker", {"images/inventoryimages/sora3pack.xml", "sora3pack"}, {"sora3pack_1","sora3pack","anim",true})
SoraAPI.MakeItemSkin("sorapacker", "sorapacker_2", {
    name = "打包的礼物",
    atlas = "images/inventoryimages/sora3pack_2.xml",
    image = "sora3pack_2",
    build = "sora3pack",
    bank = "sora3pack_2",
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sorapacker", "sorapacker_ld", {
    name = "叮叮当",
    atlas = "images/inventoryimages/sora3pack_ld.xml",
    image = "sora3pack_ld",
    build = "sora3pack_ld",
    bank = "sora3pack_ld",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})

SoraAPI.MakeItemSkin("sorapacker", "sorapacker_dw", {
    name = "碎玉粽",
    atlas = "images/inventoryimages/sora3pack_dw.xml",
    image = "sora3pack_dw",
    build = "sora3pack_dw",
    bank = "sora3pack_dw",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sorapacker", "sorapacker_wsqy", {
    name = "万圣前夜",
    atlas = "images/inventoryimages/sora3pack_wsqy.xml",
    image = "sora3pack_wsqy",
    build = "sora3pack_wsqy",
    bank = "sora3pack_wsqy",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sorapacker", "sorapacker_dw_tmp", {
    name = "碎玉粽(限时)",
    atlas = "images/inventoryimages/sora3pack_dw.xml",
    image = "sora3pack_dw",
    build = "sora3pack_dw",
    bank = "sora3pack_dw",
    rarity = "限时体验",
    rarityorder = 80,
    raritycorlor = {0.957, 0.769, 0.188, 1},
    FrameSymbol = "heirloom",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sorapacker", "sorapacker_sby", {
    name = "永恒水兵月",
    atlas = "images/inventoryimages/sora3pack_sby.xml",
    image = "sora3pack_sby",
    build = "sora3pack_sby",
    bank = "sora3pack_sby",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})

local function soralightfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()
    inst:AddTag("FX")
    inst.Light:SetFalloff(0.7)
    inst.Light:SetIntensity(.8)
    inst.Light:SetRadius(0)
    inst.Light:SetColour(180 / 255, 195 / 255, 150 / 255)
    inst.entity:AddLightWatcher()
    inst.lastblink = GetTime()
    inst:DoPeriodicTask(0.3, function(i)
        local t = GetTime()
        local x, y, z = i.Transform:GetWorldPosition()
        local cansee = TheSim:GetLightAtPoint(x, y, z) + TheSim:GetLightAtPoint(x + 8, y, z) +
                           TheSim:GetLightAtPoint(x - 8, y, z) + TheSim:GetLightAtPoint(x, y, z + 8) +
                           TheSim:GetLightAtPoint(x, y, z - 8)
        cansee = cansee / 5 - (i.Light:IsEnabled() and 0.7 or 0)
        if cansee > 0.3 then
            if (t - i.lastblink > 20) then
                i.Light:Enable(false)
                i.lastblink = t
            end
        else
            i.Light:Enable(true)
        end
    end)

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    inst.persists = false
    return inst
end
local function GetPackLevel(data)
    local level = 1
    if data.data and data.data.sorapacklevel then
        level = data.data.sorapacklevel
    elseif data.data and data.data.unwrappable and data.data.unwrappable.itemdata then
        for k, v in pairs(data.data.unwrappable.itemdata) do
            level = math.max(level, GetPackLevel(v) + 1)
        end

    end

    return level
end

local function OnWrapped(inst, num, doer)
    if doer and doer.components.bundler and doer.components.bundler.preskinname then
        inst.preskinname = doer.components.bundler.preskinname
    end
    inst.AnimState:PlayAnimation("anim", true)
    if inst.preskinname then
        TheSim:ReskinEntity(inst.GUID, inst.skinname, inst.preskinname, nil)
    elseif math.random() > 0.5 then
        TheSim:ReskinEntity(inst.GUID, inst.skinname, "sora3packer_2", nil)
    end
    if doer ~= nil and doer.SoundEmitter ~= nil then
        doer.SoundEmitter:PlaySound("dontstarve/common/together/packaged")
    end
    local items = inst.components.unwrappable.itemdata
    local level = 1
    if items then
        for k, v in pairs(items) do
            level = math.max(level, GetPackLevel(v))
        end
    end
    level = level + 1
    inst.sorapacklevel = level
    if inst.sorapacklevel >= 30 then
        inst:AddTag("nobundling")
        inst:AddTag("soranobundling")
        inst:AddTag("soracantpack")
        inst.components.inventoryitem.canonlygoinpocket = true
    end
end

local function OnUnwrapped(inst, pos, doer)
    if doer ~= nil and doer.SoundEmitter ~= nil then
        doer.SoundEmitter:PlaySound("dontstarve/common/together/packaged")
    end
    inst:Remove()
end
local function Onfull3Load(inst, data)
    if data.sorapacklevel then
        inst.sorapacklevel = data.sorapacklevel
    end
    if inst.sorapacklevel >= 30 then
        inst:AddTag("nobundling")
        inst:AddTag("soranobundling")
        inst:AddTag("soracantpack")
        inst.components.inventoryitem.canonlygoinpocket = true
    end
    if data.superdata then
        inst.superdata = data.superdata
    end
    -- inst.components.inspectable:SetDescription(inst.components.sorapacker.item.name)
end
local function Onfull3Save(inst, data)
    data.sorapacklevel = inst.sorapacklevel
    data.superdata = inst.superdata
end
local function full3fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sora3pack_1")
    inst.AnimState:SetBuild("sora3pack")
    inst.AnimState:PlayAnimation("anim", true)

    inst:AddTag("bundle")

    -- unwrappable (from unwrappable component) added to pristine state for optimization
    inst:AddTag("unwrappable")
    inst:AddTag("_named")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.sorapacklevel = 1
    inst:AddComponent("inspectable")
    inst:AddComponent("named")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "sora3pack_1"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora3pack_1.xml"
    inst:AddComponent("unwrappable")
    inst.components.unwrappable:SetOnWrappedFn(OnWrapped)
    inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)
    inst.super = function(i, data)
        if i.components.unwrappable.itemdata then
            i.superdata = i.components.unwrappable.itemdata
            i.components.unwrappable.itemdata = data
        end
    end
    local oldUnwrap = inst.components.unwrappable.Unwrap
    inst.components.unwrappable.Unwrap = function(s, ...)
        if inst.superdata then
            inst.components.unwrappable.itemdata = inst.superdata
        end
        return oldUnwrap(s, ...)
    end
    inst.OnLoad = Onfull3Load
    inst.OnSave = Onfull3Save
    return inst
end

SoraAPI.MakeItemSkinDefaultData("sora3packer", {"images/inventoryimages/sora3pack.xml", "sora3pack"},{"sora3pack_1","sora3pack","anim",true})

SoraAPI.MakeItemSkin("sora3packer", "sora3packer_2", {
    name = "穹の打包纸",
    atlas = "images/inventoryimages/sora3pack_2.xml",
    image = "sora3pack_2",
    build = "sora3pack",
    bank = "sora3pack_2",
    init_fn = function(inst)
    end
})

SoraAPI.MakeItemSkin("sora3packer", "sora3packer_ld", {
    name = "叮叮当",
    atlas = "images/inventoryimages/sora3pack_ld.xml",
    image = "sora3pack_ld",
    build = "sora3pack_ld",
    bank = "sora3pack_ld",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})

SoraAPI.MakeItemSkin("sora3packer", "sora3packer_dw", {
    name = "碎玉粽",
    atlas = "images/inventoryimages/sora3pack_dw.xml",
    image = "sora3pack_dw",
    build = "sora3pack_dw",
    bank = "sora3pack_dw",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sora3packer", "sora3packer_wsqy", {
    name = "万圣前夜",
    atlas = "images/inventoryimages/sora3pack_wsqy.xml",
    image = "sora3pack_wsqy",
    build = "sora3pack_wsqy",
    bank = "sora3pack_wsqy",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sora3packer", "sora3packer_dw_tmp", {
    name = "碎玉粽(限时)",
    atlas = "images/inventoryimages/sora3pack_dw.xml",
    image = "sora3pack_dw",
    build = "sora3pack_dw",
    bank = "sora3pack_dw",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    rarity = "限时体验",
    rarityorder = 80,
    raritycorlor = {0.957, 0.769, 0.188, 1},
    FrameSymbol = "heirloom",
    init_fn = function(inst)
    end
})
SoraAPI.MakeItemSkin("sora3packer", "sora3packer_sby", {
    name = "永恒水兵月",
    atlas = "images/inventoryimages/sora3pack_sby.xml",
    image = "sora3pack_sby",
    build = "sora3pack_sby",
    bank = "sora3pack_sby",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn,
    init_fn = function(inst)
    end
})

local function pack3fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    inst:AddTag("bundle")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sorapack_container")
        end
        return inst
    end

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sorapack_container")
    inst.components.container:EnableInfiniteStackSize(true)
    inst.persists = false
    return inst
end

SoraAPI.MakeItemSkinDefaultData("sorabowknot", {}, {})
SoraAPI.MakeItemSkin("sorabowknot", "sorabowknot_sora", {
    name = "穹の勋章",
    atlas = "images/inventoryimages/sorabowknot_sora.xml",
    image = "sorabowknot_sora",
    build = "sorabowknot_sora",
    bank = "sorabowknot_sora",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeItemSkin("sorabowknot", "sorabowknot_sby", {
    name = "永恒水兵月",
    atlas = "images/inventoryimages/sorabowknot_sby.xml",
    image = "sorabowknot_sby",
    build = "sorabowknot_sby",
    bank = "sorabowknot_sby",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeItemSkin("sorabowknot", "sorabowknot_ld", {
    name = "叮叮当",
    atlas = "images/inventoryimages/sorabowknot_ld.xml",
    image = "sorabowknot_ld",
    build = "sorabowknot_ld",
    bank = "sorabowknot_ld",
    init_fn = function(inst)
        if inst.vfx_fx then
            inst.vfx_fx:Remove()
        end
        if inst.sfx then
            inst.sfx:Cancel()
            inst.sfx = nil
        end
    end,
    clear_fn = function(inst)
        if inst.vfx_fx then
            inst.vfx_fx:Remove()
        end
        if inst.sfx then
            inst.sfx:Cancel()
            inst.sfx = nil
        end
    end,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})

SoraAPI.MakeItemSkin("sorabowknot", "sorabowknot_dw", {
    name = "蝴蝶结-碎玉斋",
    atlas = "images/inventoryimages/sorabowknot_dw.xml",
    image = "sorabowknot_dw",
    build = "sorabowknot_dw",
    bank = "sorabowknot_dw",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})


SoraAPI.MakeItemSkin("sorabowknot", "sorabowknot_dw_tmp", {
    name = "蝴蝶结-碎玉斋(限时)",
    atlas = "images/inventoryimages/sorabowknot_dw.xml",
    image = "sorabowknot_dw",
    build = "sorabowknot_dw",
    bank = "sorabowknot_dw",

    rarity = "限时体验",
    rarityorder = 80,
    raritycorlor = {0.957, 0.769, 0.188, 1},
    FrameSymbol = "heirloom",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})

SoraAPI.MakeAssetTable("sorabowknot_dw", assets)
SoraAPI.MakeAssetTable("sora3pack_dw", assets)

local tname = "sorabowknot_wsqy"
SoraAPI.MakeItemSkin("sorabowknot", tname, {
    name = "蝴蝶结-纪念",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank = tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)

local tname = "sorabowknot_wsqy_r"
SoraAPI.MakeItemSkin("sorabowknot", tname, {
    name = "蝴蝶结☆纪念",
    atlas = "images/inventoryimages/"..tname..".xml",
    image = tname,
    build = tname,
    bank = tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)

return Prefab("sorapack_container", pack3fn), Prefab("sorabowknot", fn, assets),
    Prefab("sorapacker", fullfn, packassets), Prefab("sora2pack", packfn, packassets),
    Prefab("sora3packer", full3fn, packassets), MakePlacer("sorapacker_placer", "sorapacker", "sorapacker", "place"),
    Prefab("soralight", soralightfn)
