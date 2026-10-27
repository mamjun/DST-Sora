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
]] local assets = {Asset("IMAGE", "images/ui/sora_pot_ui.tex"), Asset("ATLAS", "images/ui/sora_pot_ui.xml"),
                   Asset("IMAGE", "images/inventoryimages/sora_pot_need.tex"),
                   Asset("ATLAS", "images/inventoryimages/sora_pot_need.xml"), Asset('ANIM', "anim/sora_pot_ui.zip"),
                   Asset('ANIM', "anim/sora_pot_ui_fire.zip"), Asset('ANIM', "anim/sora_pot_ui_rope.zip")}
local name = "sora_pot"
SoraAPI.MakeAssetTable(name, assets)

local function onhammered(inst, worker)
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end
local function onhit(inst, worker)

end
local function OnOpen(inst, data)
    if inst:IsAsleep() then
        return
    end
    if inst:IsInLimbo() then
        return
    end
    -- 不在收回
    if inst.components.soraportable.isitem then
        return
    end
    inst.AnimState:PlayAnimation('open')
    inst.AnimState:PushAnimation('idle_open')
end
local function OnClose(inst, data)
    if inst:IsAsleep() then
        return
    end
    if inst:IsInLimbo() then
        return
    end
    -- 不在收回
    if inst.components.soraportable.isitem then
        return
    end
    inst.AnimState:PlayAnimation('close')
    inst.AnimState:PushAnimation('idle_close')
end

local function OnDeployed(inst, item, deployer)

end

local function UpdateAnim(inst)
    if inst:IsAsleep() then
        return
    end
    if inst:IsInLimbo() then
        return
    end
    -- 不在收回
    if inst.components.soraportable.isitem then
        return
    end
    -- 不在部署
    if inst.AnimState:IsCurrentAnimation("place") then
        return
    end
    local con = inst.components.container
    -- 不在打开关闭
    if con:IsOpen() then
        return
    end
    if inst.AnimState:IsCurrentAnimation("close") then
        return
    end
    -- 动作中不重复处理
    if inst.AnimState:IsCurrentAnimation("cook_pst") then
        return
    end

    local potitem = con:GetItemInSlot(7)
    local spiitem = con:GetItemInSlot(8)
    -- 没有成品
    if not potitem and not spiitem then
        local loop = false
        for i = 1, 6 do
            if inst.sorapotui[i]:value() then
                loop = true
                break
            end
        end
        inst.AnimState:PlayAnimation(loop and 'cook_loop' or 'idle_close', true)
        inst.AnimState:Hide("swap_bg")
        inst.AnimState:Hide("swap_item")
    else
        -- 有成品
        local item = spiitem or potitem
        if not inst.AnimState:IsCurrentAnimation("idle_full") then
            inst.AnimState:PlayAnimation("cook_pst")
            inst.AnimState:PushAnimation("idle_full")
            local sign = {}
            sign.image = item.replica.inventoryitem:GetImage() -- v.components.inventoryitem.imagename and (v.components.inventoryitem.imagename ..".tex") or 
            sign.atlas = item.replica.inventoryitem:GetAtlas() -- v.components.inventoryitem.atlasname or 
            if item.inv_image_bg and item.inv_image_bg.image then
                sign.bgimage = item.inv_image_bg.image
                sign.bgatlas = item.inv_image_bg.atlas
            end
            inst.AnimState:OverrideSymbol("swap_item", SoraAPI.sorapath(sign.atlas), sign.image)
            if sign.bgatlas then
                inst.AnimState:OverrideSymbol("swap_bg", SoraAPI.sorapath( sign.bgatlas), sign.bgimage)
            end
            inst.AnimState:Show("swap_bg")
            inst.AnimState:Show("swap_item")
        end
    end

end
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddLight()
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(0.5)
    inst.Light:SetRadius(1)
    inst.Light:SetColour(180 / 255, 195 / 255, 150 / 255)
    inst.Light:Enable(true)
    inst.Light:EnableClientModulation(true)
    inst:AddTag("soracontainerfix")
    inst:AddTag("structure")
    inst:AddTag("nosteal")
    inst:AddTag("soranoprototyper")
    inst:AddTag("meteor_protection")
    inst.AnimState:SetBank(name)
    inst.AnimState:SetBuild(name)
    inst.AnimState:PlayAnimation("item", true)
    inst:AddComponent("soratwoface")
    inst.entity:SetPristine()
    inst.sorapotper = net_int(inst.GUID, 'sorapotper', 'sorapotperdirty')

    inst.sorapotui = {}
    for k, v in pairs({1, 2, 3, 4, 5, 6, 9, 11, 13}) do
        inst.sorapotui[v] = net_bool(inst.GUID, 'sorapotui.' .. tostring(v))
    end
    inst.SetPotPer = function(inst, per)
        per = math.clamp(per, 0, 1)
        inst.sorapotper:set(math.floor(per * 100))
    end
    inst.SetPotWork = function(inst, index, num, enable)
        local set = {
            pot = {1, 2, 3, 4},
            spice = {5, 6},
            meat = {9},
            cook = {11},
            ice = {13}
        }
        if set[index] then
            for k, v in pairs(set[index]) do
                inst.sorapotui[v]:set(enable and true or false)
            end
        end
    end
    MakeInventoryPhysics(inst)
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora_pot")
        end
        return inst
    end
    inst.sorapotper:set(100)
    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("一定不会有人饿死的对吧")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. name .. ".xml"
    inst.components.inventoryitem.imagename = name
    inst:AddComponent("soraportable")
    inst:AddComponent("soraitem")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora_pot")
    inst:ListenForEvent("onopen", OnOpen)
    inst:ListenForEvent("onclose", OnClose)
    inst:AddComponent("prototyper")
    inst.components.prototyper.trees = {
        FOODPROCESSING = 5
    }

    inst:AddComponent("sorapot")
    inst.components.sorapot:RegSlot('sorapot', {1, 2, 3, 4, 5, 6}, {7}, 2)
    inst.components.sorapot:RegSlot('pot', {1, 2, 3, 4}, {7}, 2)
    inst.components.sorapot:RegSlot('spice', {5, 6}, {8}, 1)
    inst.components.sorapot:RegSlot('meat', {9}, {10}, 3)
    inst.components.sorapot:RegSlot('cook', {11}, {12}, 10)
    inst.components.sorapot:RegSlot('ice', {13}, {13}, 120)
    inst.components.sorapot:RegPower('charcoal', {14}, 240)
    inst.components.sorapot.UiFn = inst.SetPotWork
    -- inst.components.sorapot:SetRate(1)

    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(-1000)
    inst:ListenForEvent("onpickup", function()
        inst.components.container:Close()
    end)
    inst:ListenForEvent("ondropped", function()
        inst.AnimState:PlayAnimation("item", true)
        inst.components.container:Close()
    end)
    inst:DoPeriodicTask(1, UpdateAnim)
    return inst
end
--[[

p="sora_pot" s="images/inventoryimages" b = require "preparedfoods_sora" soft = softresolvefilepath pos=ThePlayer:GetPosition() bg = "swap_bg" c = require "preparedfoods" d = require "preparedfoods_warly" i = 0
function SpawnFood(name,spice) local a = SpawnPrefab(p) local xml,tex = SoraGetImage(name) a.AnimState:OverrideSymbol(bg,soft(xml),tex) if spice then  a.AnimState:OverrideSymbol("swap_item",soft(s.."2.xml"), "spice_sugar_over.tex") end a.Transform:SetPosition((pos+Point((i%10)*2,0,(math.floor(i/10))*2)):Get()) i=i+1 end

c_removeall(p) i=0 for k,v in pairs({b,c,d}) do for ik,iv in pairs(v) do SpawnFood(iv.name) SpawnFood(iv.name,true) end end

]]

PROTOTYPER_DEFS.sora_pot = {
    icon_atlas = CRAFTING_ICONS_ATLAS,
    icon_image = "filter_none.tex",
    is_crafting_station = true,
    filter_text = STRINGS.UI.CRAFTING_FILTERS.CRAFTING_STATION
}

RegisterInventoryItemAtlas("images/inventoryimages/" .. name .. ".xml", name .. ".tex")
RegisterInventoryItemAtlas("images/inventoryimages/" .. name .. "_need.xml", name .. "_need.tex")
STRINGS.NAMES[(name .. "_need"):upper()] = "需要穹の料理锅"
SoraAPI.MakeItemSkinDefaultData(name, {"images/inventoryimages/"..name..".xml", name},
    {name, name})

local function MakeSkin(skinskin, skinname, free)
    local skin = name .. "_" .. skinskin
    SoraAPI.MakeAssetTable(skin, assets)
    SoraAPI.MakeItemSkin(name, skin, {
        name = skinname,
        atlas = "images/inventoryimages/" .. skin .. ".xml",
        image = skin,
        build = skin,
        bank = skin,
        checkfn = not free and SoraAPI.SoraSkinCheckFn or nil,
        checkclientfn = not free and SoraAPI.SoraSkinCheckClientFn or nil
    })
    RegisterInventoryItemAtlas("images/inventoryimages/" .. skin .. ".xml", skin .. ".tex")
end
local function needfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst:DoTaskInTime(0, inst.Remove)
    return inst
end
AddIngredientValues({name .. "_need"}, {}, false, false)
return Prefab(name, fn, assets), MakePlacer(name .. "_placer", name, name, "idle"),
    Prefab(name .. "_need", needfn, assets), MakePlacer(name .. "_placer", name, name, "idle_close")
