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
]]
local assets =
{
    Asset("ANIM", "anim/cook_pot_food.zip"),
}

local prefabs =
{
    "spoiled_food",
}

local function MakePreparedFood(data)
     local realname = data.basename or data.name
     local foodassets = {}
     if data.sorafood then
     foodassets = {
        Asset("ANIM", "anim/"..realname..".zip"),
        Asset("ATLAS", "images/inventoryimages/"..realname..".xml"),
        Asset("IMAGE", "images/inventoryimages/"..realname..".tex"),
        Asset("ATLAS_BUILD", "images/inventoryimages/"..realname..".xml", 256),
    }
    else
        
    end
    local spicename = data.spice ~= nil and string.lower(data.spice) or nil
    if spicename ~= nil then
        foodassets = shallowcopy(assets)
        table.insert(foodassets, Asset("ANIM", "anim/spices.zip"))
        table.insert(foodassets, Asset("ANIM", "anim/plate_food.zip"))
        table.insert(foodassets, Asset("INV_IMAGE", spicename.."_over"))
    end

    local foodprefabs = prefabs
    if data.prefabs ~= nil then
        foodprefabs = shallowcopy(prefabs)
        for i, v in ipairs(data.prefabs) do
            if not table.contains(foodprefabs, v) then
                table.insert(foodprefabs, v)
            end
        end
    end

    local function DisplayNameFn(inst)
        return subfmt(STRINGS.NAMES[data.spice.."_FOOD"], { food = STRINGS.NAMES[string.upper(data.basename)] })
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        if spicename ~= nil then
            inst.AnimState:SetBuild("plate_food")
            inst.AnimState:SetBank("plate_food")
            inst.AnimState:OverrideSymbol("swap_garnish", "spices", spicename)

            inst:AddTag("spicedfood")

            -- inst.inv_image_bg = { image = (data.basename or data.name)..".tex" }
            -- inst.inv_image_bg.atlas = GetInventoryItemAtlas(inst.inv_image_bg.image)
            local atlas,image = SoraGetImage(realname)
            if atlas and image then
                inst.inv_image_bg = { atlas = atlas, image = image }
            end
        else
        inst.AnimState:SetBuild(data.name)
        inst.AnimState:SetBank(data.name)
        end
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap_food", data.basename or "cook_pot_food", realname)

        
        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end
        if not inst:HasTag("spice") then
            inst:AddTag("preparedfood")
        end
        if data.basename ~= nil then
            inst:SetPrefabNameOverride(data.basename)
            if data.spice ~= nil then
                inst.displaynamefn = DisplayNameFn
            end
        end

        if data.floater ~= nil then
            MakeInventoryFloatable(inst, data.floater[1], data.floater[2], data.floater[3])
        else
            MakeInventoryFloatable(inst)
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = data.health or 0
        --inst.components.edible.healthvalue = inst.components.edible.healthvalue +10000
        inst.components.edible.hungervalue = data.hunger or 0
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GENERIC
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible.spice = data.spice
        inst.components.edible:SetOnEatenFn(data.oneatenfn)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        inst:AddComponent("inventoryitem")
        
        if spicename ~= nil then
            inst.components.inventoryitem:ChangeImageName(spicename.."_over")
        elseif data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName(data.basename)
        else
            inst.components.inventoryitem.atlasname="images/inventoryimages/"..realname..".xml"
            inst.components.inventoryitem.imagename=realname
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        if data.perishtime ~= nil and data.perishtime > 0 then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "spoiled_food"
        end
        inst:AddComponent("bait")
        inst:AddComponent("tradable")

        return inst
    end

    return Prefab(data.name, fn, foodassets, foodprefabs)
end

local prefs = {}

for k, v in pairs(require("preparedfoods_sora")) do
    table.insert(prefs, MakePreparedFood(v))
end

-- for k, v in pairs(require("preparedfoods_warly")) do
    -- table.insert(prefs, MakePreparedFood(v))
-- end

for k, v in pairs(require("spicedfoods_sora")) do
    table.insert(prefs, MakePreparedFood(v))
end

return unpack(prefs)
