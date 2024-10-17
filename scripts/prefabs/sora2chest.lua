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
]] require "prefabutil"
--[[
▶红 → 快速腐败效果
  ▶蓝 → 些许返鲜效果
  ▶紫 → 溢出物品自动打包
  ▶绿 → 自动种植箱子里的种子
  ▶橙 → 每隔一段时间收集物品
  ▶黄 → 自动丢物品到最近的圣诞树
  ▶彩 → 缓慢恢复耐久
多重效果可以叠加
重复可提升效果(紫黄除外)
]] --

local assets = {Asset("ANIM", "anim/sorachest.zip"), Asset("ANIM", "anim/sora2chest.zip"),
                Asset("ATLAS", "images/inventoryimages/sora2chest.xml"),
                Asset("IMAGE", "images/inventoryimages/sora2chest.tex"),
                Asset("ATLAS_BUILD", "images/inventoryimages/sora2chest.xml", 256),
                Asset("ANIM", "anim/sora2chest_pkq.zip"), Asset("ATLAS", "images/inventoryimages/sora2chest_pkq.xml"),
                Asset("IMAGE", "images/inventoryimages/sora2chest_pkq.tex"),
                Asset("ATLAS_BUILD", "images/inventoryimages/sora2chest_pkq.xml", 256),
                Asset("ANIM", "anim/sora2chest_sns.zip"), Asset("ATLAS", "images/inventoryimages/sora2chest_sns.xml"),
                Asset("IMAGE", "images/inventoryimages/sora2chest_sns.tex"),
                Asset("ATLAS_BUILD", "images/inventoryimages/sora2chest_sns.xml", 256),

                Asset("ANIM", "anim/sora2chest_jng.zip"), Asset("ATLAS", "images/inventoryimages/sora2chest_jng.xml"),
                Asset("IMAGE", "images/inventoryimages/sora2chest_jng.tex"),
                Asset("ATLAS_BUILD", "images/inventoryimages/sora2chest_jng.xml", 256)}

local prefabs = {"collapse_small"}

local function onopen(inst)
    if inst.skinname == 'sora2chest_sns' then
        inst.AnimState:PlayAnimation("open")
    else
        inst.AnimState:PlayAnimation("idle",true)
    end
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst, doer)
    -- TheWorld.components.sorachestmanager:OnClose(inst, doer)
    -- inst.AnimState:PlayAnimation("close")
    inst.AnimState:PlayAnimation("idle",true)
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
end

local function onhammered(inst, worker)
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end
local function updatesign(inst)
    if not TheWorld.ismastersim then
        return
    end
    if not inst.components.container then
        return
    end
    local sign = nil
    for k = 1, 25 do
        local v = inst.components.container:GetItemInSlot(k)
        if v and v.prefab and v.components.inventoryitem then
            sign = {
                name = v.prefab
            }
            sign.image = v.replica.inventoryitem:GetImage() -- v.components.inventoryitem.imagename and (v.components.inventoryitem.imagename ..".tex") or 
            sign.atlas = v.replica.inventoryitem:GetAtlas() -- v.components.inventoryitem.atlasname or 
            if v.inv_image_bg and v.inv_image_bg.image then
                sign.bgimage = v.inv_image_bg.image
                sign.bgatlas = v.inv_image_bg.atlas
            end
            break
        end
    end
    sign = sign or inst.sorasign
    if sign then
        inst.AnimState:Show("chestitem_bg")
        inst.AnimState:Show("swap_item")
        inst.AnimState:OverrideSymbol("swap_item", SoraAPI.sorapath(sign.atlas), sign.image)
        if sign.bgimage then
            inst.AnimState:Show("swap_item_bg")
            inst.AnimState:OverrideSymbol("swap_item_bg", SoraAPI.sorapath(sign.bgatlas), sign.bgimage)
        else
            inst.AnimState:Hide("swap_item_bg")
        end
        if (inst.skinname == "sora2chest_sns" or inst.skinname == "sora2chest_sns_tmp") then
            inst.AnimState:Hide("chest")
        else
            inst.AnimState:Show("chest")
        end
    else
        if not inst.skinname then
            inst.AnimState:Show("chest")
            inst.AnimState:Hide("chestitem_bg")
            inst.AnimState:Hide("swap_item_bg")
            inst.AnimState:Hide("swap_item")
        else
            inst.AnimState:Show("chest")
            inst.AnimState:Hide("chestitem_bg")
            inst.AnimState:Hide("swap_item_bg")
            inst.AnimState:Hide("swap_item")
        end
    end
    if (inst.skinname == "sora2chest_sns" or inst.skinname == "sora2chest_sns_tmp") and
        inst.components.container:IsOpen() then
        inst.AnimState:PlayAnimation("open")
    elseif (inst.skinname == "sora2chest_zzb") then
        if sign then 
            inst.AnimState:PlayAnimation("idle",true)
        else
            inst.AnimState:PlayAnimation("idle_close",true)
        end
    else
        inst.AnimState:PlayAnimation("idle",true)
    end
    inst.sorasign = sign
end
local function onhit(inst, worker)
    inst.sorasign = nil
    updatesign(inst)
    if inst.hitcount and inst.hitcount > 0 then
        inst.components.container:DropEverything()
        TheWorld.components.sorachestmanager:OnClose(inst, worker)
    end
    -- inst.AnimState:PushAnimation("closed", false)
    inst.components.container:Close()
end

local function onbuilt(inst)
    -- inst.AnimState:PlayAnimation("place")
    -- inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_craft")
end
local cmp = require "components/sorachestmanager"
local data = {
    containers = {{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}},
    controls = {26, 27, 28, 29, 30},
    pri = 50,
    overfull = 1
}
cmp:RegType("sora2chest", data)

local cmp2 = require "components/sorapatch"
local tocopy = {
    onopenfn = 1,
    onclosefn = 1,
    skipclosesnd = 1,
    skipopensnd = 1
}
local data2 = {
    patch = function(self)
        local inst = self.inst
        if inst.components.container then
            local items = inst.components.container:RemoveAllItems()
            inst.components.container:Close()
            local copy = {}
            for k, v in pairs(tocopy) do
                copy[k] = inst.components.container[k]
            end
            inst:RemoveComponent("container")
            inst:AddComponent("container")
            if not inst.components.preserver then
                inst:AddComponent("preserver")
            end
            inst:AddTag("soracontainerfix")
            inst.components.preserver:SetPerishRateMultiplier(1)
            for k, v in pairs(copy) do
                inst.components.container[k] = copy[k]
            end
            inst.components.container:WidgetSetup("sora2chest")
            for k, v in pairs(items) do
                inst.components.container:GiveItem(v)
            end
            inst.sora2chest:set_local(false)
            inst.sora2chest:set(true)
            inst.components.container:EnableInfiniteStackSize(true)
            if not inst.prefab then
                inst.prefab = "treasurechest"
            end
            TheWorld.components.sorachestmanager:RegByType(inst, "sora2chest")
            inst:AddTag("sora2chest")

        end
    end,
    data = {},
    unpatch = function(self)
        -- 不给卸载 老子没写 嚣张
    end
}
if not TUNING.SORATOCHEST then
    cmp2:RegPatch("sora2chest", data2)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("sora2chest.tex")
    inst:AddTag("structure")
    inst:AddTag("nosteal")
    inst:AddTag("soracontainerfix")
    inst.AnimState:SetBank("sora2chest")
    inst.AnimState:SetBuild("sora2chest")
    inst.AnimState:PlayAnimation("idle",true)
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    inst.entity:SetPristine()
    inst.AnimState:Hide("chestitem_bg")
    inst.AnimState:Hide("swap_item_bg")
    inst.AnimState:Hide("swap_item")

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora2chest")
        end
        return inst
    end
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("好奇怪的箱子")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora2chest")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst:ListenForEvent("onclose", updatesign)
    inst:AddComponent("sorasavecmp")
    inst.components.sorasavecmp:AddSave("sign", function(inst)
        return inst.sorasign and {
            sign = inst.sorasign
        }
    end)
    inst.components.sorasavecmp:AddLoad("sign", function(inst, data)
        if data and data.sign then
            if Prefabs[data.sign.name] then
                inst.sorasign = data.sign
            end
        end
    end)
    inst:DoTaskInTime(0, updatesign)
    inst.prefab = "sora2chest"
    TheWorld.components.sorachestmanager:RegByType(inst, "sora2chest")

    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(0)
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
    inst:ListenForEvent("onbuilt", onbuilt)
    -- if TUNING.SMART_SIGN_DRAW_ENABLE then
    --     SMART_SIGN_DRAW(inst)
    -- end
    return inst
end
local function tochestfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
    anim:SetBank("sora2stone")
    anim:SetBuild("sora2stone")
    anim:PlayAnimation("idle",true)
    inst:AddTag("soracontainlock")

    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[原来你也有强迫症]])
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2stone.xml"
    inst.components.inventoryitem.imagename = "sora2stone"

    inst:AddComponent("sorapatch")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst.fx = SpawnPrefab("sora_tmp_fx")
    inst.fx:Bind(inst)
    return inst
end
local function placer_help(inst)
    inst.AnimState:Hide("chestitem_bg")
    inst.AnimState:Hide("swap_item_bg")
    inst.AnimState:Hide("swap_item")
    -- body
end
SoraAPI.MakeItemSkinDefaultData("sora2chest", {}, {})
local tname = "sora2chest_pkq"
SoraAPI.MakeItemSkin("sora2chest", tname, {
    name = "皮卡丘",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = updatesign,
    clear_fn = function(inst)
        inst:DoTaskInTime(0, updatesign)
    end,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
local tname = "sora2chest_sns"
SoraAPI.MakeItemSkin("sora2chest", tname, {
    name = "水凝兽",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = updatesign,
    clear_fn = function(inst)
        inst:DoTaskInTime(0, updatesign)
    end,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeItemSkin("sora2chest", tname .. "_tmp", {
    name = "水凝兽(限时)",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = updatesign,
    clear_fn = function(inst)
        inst:DoTaskInTime(0, updatesign)
    end,
    rarity = "限时体验",
    rarityorder = 80,
    raritycorlor = {0.957, 0.769, 0.188, 1},
    FrameSymbol = "heirloom",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
local tname = "sora2chest_jng"
SoraAPI.MakeItemSkin("sora2chest", tname, {

    name = "杰尼龟",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = updatesign,
    clear_fn = function(inst)
        inst:DoTaskInTime(0, updatesign)
    end,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
local tname = "sora2chest_yb"
SoraAPI.MakeItemSkin("sora2chest", tname, {
    name = "叶伊布",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = updatesign,
    clear_fn = function(inst)
        inst:DoTaskInTime(0, updatesign)
    end,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable("sora2chest_yb",assets)

local tname = "sora2chest_zzb"
SoraAPI.MakeItemSkin("sora2chest", tname, {
    name = "珍珠贝",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    init_fn = updatesign,
    clear_fn = function(inst)
        inst:DoTaskInTime(0, updatesign)
    end,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname,assets)

local function chestpt(inst)
    -- inst.AnimState:Hide("chestitem_bg")
    inst.AnimState:Hide("swap_item_bg")
    inst.AnimState:Hide("swap_item")
    -- body
end
return Prefab("sora2chest", fn, assets, prefabs),
    MakePlacer("sora2chest_placer", "sora2chest", "sora2chest", "idle", nil, nil, nil, nil, nil, nil, chestpt),
    Prefab("sora_tochest", tochestfn, assets, prefabs)
