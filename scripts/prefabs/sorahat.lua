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
]] local assets = {Asset("ANIM", "anim/sorahat.zip"), Asset("ATLAS", "images/inventoryimages/sorahat.xml"),
                   Asset("IMAGE", "images/inventoryimages/sorahat.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorahat.xml", 256),

                   Asset("ANIM", "anim/sorahat_sd.zip"), Asset("ATLAS", "images/inventoryimages/sorahat_sd.xml"),
                   Asset("IMAGE", "images/inventoryimages/sorahat_sd.tex"),
                   Asset("ATLAS_BUILD", "images/inventoryimages/sorahat_sd.xml", 256)}
local arm1 = getsora("sorahatarmor1") / 100
local arm2 = getsora("sorahatarmor2")
local arm3 = getsora("sorahatarmor3")
local arm4 = getsora("sorahatarmor4")
local arm5 = getsora("sorahatarmor5")

local water1 = getsora("sorahatwater1")
local water2 = getsora("sorahatwater2")

local function upgrade(inst)
    -- inst.yqlevel = math.min(math.floor(inst.yqnum / inst.need),inst.maxlevel)
    inst.yqlevel = math.min(math.floor(inst.yqnum * 2 / inst.need), inst.maxlevel)
    inst.lllevel = math.min(math.floor(inst.llnum / inst.need), inst.maxlevel)
    -- 保暖
    -- inst.components.insulator:SetInsulation(24*inst.yqlevel)
    -- 防水
    inst.components.waterproofer:SetEffectiveness(water1 + water2 * inst.yqlevel)
    if inst.yqlevel > 7 then
        inst.components.equippable.insulated = true
    else
        inst.components.equippable.insulated = false
    end
    -- 护甲
    inst.abs = math.min(arm1 + arm2 * inst.lllevel, 0.99)
    local old = inst.components.armor:GetPercent()
    inst.components.armor.maxcondition = arm3 + arm4 * inst.lllevel
    inst.components.armor:SetAbsorption(inst.abs)
    inst.components.armor:SetPercent(old)
end

local function OnRefuseItem(inst, giver, item)
    if item then
        local refusesay = "\t\t穹の冠\n物\t数\t级\t属"
        refusesay = refusesay ..
                        string.format("\n雨(眼):\t%d/" .. inst.need * inst.maxlevel / 2 .. "\t%d\t%d", inst.yqnum,
                inst.yqlevel, (water1 + water2 * inst.yqlevel) * 100)
        refusesay = refusesay ..
                        string.format("\n甲(鳞):\t%d/" .. inst.need * inst.maxlevel .. "\t%d\t%d%%", inst.llnum,
                inst.lllevel, math.min(arm1 + arm2 * inst.lllevel, 0.99) * 100)
        giver.components.talker:Say(refusesay)
    end
end
local l = SoraAPI.sorarepairer
local function AcceptTest(inst, item)
    if l[item.prefab] then
        return inst.components.armor:GetPercent() < 1
    elseif (item.prefab == "deerclops_eyeball" or item.prefab == "tigereye") then
        return inst.yqnum * 2 < inst.need * inst.maxlevel, "GENERIC"
    elseif (item.prefab == "dragon_scales" or item.prefab == "shark_gills") then
        return inst.llnum < inst.need * inst.maxlevel, "GENERIC"
    end
    return false, "WRONGTYPE"
end

local function TraderCount(inst, giver, item)
    local arm = 1 - inst.components.armor:GetPercent()
    if l[item.prefab] then
        return math.floor(arm / l[item.prefab])
    elseif (item.prefab == "deerclops_eyeball" or item.prefab == "tigereye") then
        return math.floor((inst.need * inst.maxlevel - inst.yqnum * 2) / 2)
    elseif (item.prefab == "dragon_scales" or item.prefab == "shark_gills") then
        return inst.need * inst.maxlevel - inst.llnum
    end
    return 1
end
local function OnGetItemFromPlayer(inst, giver, item)
    local num = 1
    if item.components.stackable then
        num = item.components.stackable.stacksize
    end
    if l[item.prefab] then
        inst.components.armor:SetPercent(inst.components.armor:GetPercent() + l[item.prefab] * num)
    elseif (item.prefab == "deerclops_eyeball" or item.prefab == "tigereye") then
        inst.yqnum = inst.yqnum + num
        inst.yqlevel = math.min(math.floor(inst.yqnum * 2 / inst.need), inst.maxlevel)
        if inst.yqlevel < inst.maxlevel then
            giver.components.talker:Say(
                "眼球数量:" .. inst.yqnum .. "/" .. inst.need * inst.maxlevel / 2 .. "\tLV:" .. inst.yqlevel ..
                    "\n防水：" .. ((water1 + water2 * inst.yqlevel) * 100) .. "%")
        else
            giver.components.talker:Say("眼球已满\tLV:10\n防水：" .. ((water1 + water2 * inst.yqlevel) * 100) ..
                                            "%")
        end
    elseif (item.prefab == "dragon_scales" or item.prefab == "shark_gills") then
        inst.llnum = inst.llnum + num
        inst.lllevel = math.min(math.floor(inst.llnum / inst.need), inst.maxlevel)
        if inst.lllevel < inst.maxlevel then
            giver.components.talker:Say("龙鳞数量:" .. inst.llnum .. "/" .. inst.need * inst.maxlevel .. "\tLV:" ..
                                            inst.lllevel .. "\n护甲：" ..
                                            (math.min(arm1 + arm2 * inst.lllevel, 0.99) * 100) .. "%")
        else
            giver.components.talker:Say("龙鳞已满\tLV:10\n护甲：" ..
                                            (math.min(arm1 + arm2 * inst.lllevel, 0.99) * 100) .. "%")
        end
    end
    upgrade(inst)
end

local function onpreload(inst, data)
    if data then
        inst.yqnum = data.yqnum or 0
        inst.llnum = data.llnum or 0
        upgrade(inst)
    end
end

local function onsave(inst, data)
    data.yqnum = inst.yqnum
    data.llnum = inst.llnum
end

local function onSetCondition(self, amount)
    self.condition = math.min(amount, self.maxcondition)
    self.inst:PushEvent("percentusedchange", {
        percent = self:GetPercent()
    })
    if self.condition <= 0 then
        self.condition = 0
        ProfileStatsSet("armor_broke_" .. self.inst.prefab, true)
        ProfileStatsSet("armor", self.inst.prefab)

        if self.onfinished ~= nil then
            self.onfinished()
        end
    end
end

local function onequip(inst, owner)
    if owner ~= nil and not owner:HasTag("sora") then
        owner:DoTaskInTime(0, function()
            if owner.components.inventory then
                owner.components.inventory:GiveItem(inst)
            end
            if owner.components.talker then
                owner.components.talker:Say("这是Sora的衣服")
            end
        end)
    end
    if inst.skinname == "sorahat_no" then
        owner.AnimState:OverrideSymbol("swap_hat", inst.skinname or "sorahat", "swap_hat")
    else
        owner.AnimState:ClearOverrideSymbol("swap_hat")
    end
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
    -- owner.AnimState:ClearOverrideSymbol("swap_body")
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
end

local function onrepair(inst)
    if inst.components.armor then
        inst.components.armor:SetPercent(inst.components.armor:GetPercent() + 0.01)
    end
end

local function onAbsorption(self)
    return self:GetPercent() > 0 and self.inst.abs or nil
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    inst:AddTag("aquatic")
    inst.AnimState:SetBank("sorahat")
    inst.AnimState:SetBuild("sorahat")
    inst.AnimState:PlayAnimation("anim")
    inst.AnimState:SetScale(2, 2, 2)
    -- inst:AddTag("Infinite")
    inst:AddTag("waterproofer")
    inst:AddTag("soratrader")
    inst:AddTag("goggles")
    inst:AddTag("soragoggles")
    inst:AddTag("gestaltprotection")
    -- inst:AddTag("Infinite")
    inst.entity:SetPristine()
    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("sorahat.tex")
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription([[
	这是sora的帽子
	通过眼球升级防水
	通过龙鳞升级护甲和耐久
	每10秒回复1%耐久
	]])
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sorahat.xml"
    inst.components.inventoryitem.imagename = "sorahat"
    -- 保温
    -- inst:AddComponent("insulator")
    -- inst.components.insulator:SetInsulation(0)
    -- 防水
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    -- 护甲
    inst:AddComponent("planardefense")
    inst.components.planardefense:SetBaseDefense(5)
    inst:AddComponent("armor")
    -- inst:AddTag("hide_percentage")
    inst.abs = arm1
    inst.components.armor:InitCondition(arm3, inst.abs)
    inst.components.armor.GetAbsorption = onAbsorption
    inst:DoPeriodicTask(arm5, onrepair)
    inst.components.armor.SetCondition = onSetCondition

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    -- 回脑残
    inst.components.equippable.dapperness = getsora("sorahatsan") / 60
    -- 移速
    inst.components.equippable.walkspeedmult = math.min(getsora("sorahatspe"), 2.5)

    inst.need = TUNING.SORAMODE / 2
    inst.maxlevel = 10
    inst.yqnum = 0
    inst.llnum = 0
    inst.yqlevel = 0
    inst.lllevel = 0

    inst:AddComponent("trader")
    inst.cantrader = TraderCount
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
    inst:AddComponent("soraitem")
    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    -- MakeHauntableLaunch(inst)

    return inst
end
RegisterInventoryItemAtlas("images/inventoryimages/sorahat.xml", "sorahat.tex")
SoraAPI.MakeItemSkinDefaultData("sorahat", {}, {})
local tname = "sorahat_no"
SoraAPI.MakeItemSkin("sorahat", tname, {
    name = "幻影",
    atlas = "images/inventoryimages/sorahat.xml",
    image = "sorahat",
    build = "sorahat",
    bank = "sorahat"
})
SoraAPI.MakeItemSkin("sorahat", "sorahat_sd", {
    name = "圣诞发卡",
    atlas = "images/inventoryimages/sorahat_sd.xml",
    image = "sorahat_sd",
    build = "sorahat_sd",
    bank = "sorahat_sd",
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})

local tname = "sorahat_sby"
SoraAPI.MakeItemSkin("sorahat", tname, {
    name = "永恒水兵月",
    atlas = "images/inventoryimages/" .. tname .. ".xml",
    image = tname,
    build = tname,
    bank = tname,
    checkfn = SoraAPI.SoraSkinCheckFn,
    checkclientfn = SoraAPI.SoraSkinCheckClientFn
})
SoraAPI.MakeAssetTable(tname, assets)

return Prefab("sorahat", fn, assets)
