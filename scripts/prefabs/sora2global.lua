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

local assets = {}
SoraAPI.MakeAssetTable("sora2global", assets)
local prefabs = {"collapse_small"}

local function onopen(inst)
    -- inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst)
    -- inst.AnimState:PlayAnimation("close")
    -- inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
    if inst.ResetTaskTask then
        inst.ResetTaskTask:Cancel()
        inst.ResetTaskTask = nil
    end
end
local function ResetTask(inst)
    if not (inst.components.container and next(inst.components.container.openlist)) then
        return
    end
    inst:Reset()
    inst.ResetTaskTask = nil
end
local function tryupdatechest(inst)
    if not (inst.components.container and next(inst.components.container.openlist)) then
        return
    end
    local doer = next(inst.components.container.openlist)
    SoraAPI.TryUpdateGlobalChest(doer, inst)
    if inst.ResetTaskTask then
        inst.ResetTaskTask:Cancel()
        inst.ResetTaskTask = nil
    end
    inst.ResetTaskTask = inst:DoTaskInTime(inst.CloseTime, ResetTask)
end
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst:AddTag("nosteal")
    inst:AddTag("soraglobalchest")
    inst:AddTag('soranorummage')
    inst:AddComponent("soracantpack")
    inst:AddComponent("soratwoface")
    inst.AnimState:SetBank("sora2global")
    inst.AnimState:SetBuild("sora2global")
    inst.AnimState:PlayAnimation("idle", true)
    -- MakeSnowCoveredPristine(inst)
    MakeInventoryPhysics(inst)
    inst.entity:SetPristine()

    if not TheWorld.soraismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora2global")
        end
        return inst
    end
    TheWorld.components.soraenttrack:Track(inst, "sora2global")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2global.xml"
    inst.components.inventoryitem.imagename = "sora2global"

    inst:AddComponent("inspectable")
    inst.components.inspectable:SetDescription("妈妈我要去旅行~")
    inst:AddComponent("soraonlyone")
    inst.components.soraonlyone.tag = "soraglobalchest"
    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(0)

    inst:AddComponent("rechargeable")
    inst.components.rechargeable:SetMaxCharge(999999)
    inst.components.rechargeable.OnSave = function()
        return {}
    end
    inst.ResetTask = ResetTask
    inst.components.rechargeable.OnLoad = function()
        return {}
    end
    inst.CloseTime = 50
    inst:AddComponent("named")
    inst.Reset = function()
        if inst.components.container:IsOpen() then
            inst.components.container:Close()
        end
        inst.components.named:SetName("穹の末影箱")
        inst.components.rechargeable:Discharge(0)
    end
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora2global")
    inst.components.container:EnableInfiniteStackSize(true)
    inst.components.container.canbeopened = false
    inst.components.inventoryitem.canonlygoinpocket = true
    inst:ListenForEvent("onpickup", function(i, data)
        local owner = data and data.owner or inst.components.inventoryitem:GetGrandOwner()
        if owner and owner:HasTag("player") and inst.components.container then
            inst.components.container.canbeopened = true
            inst.OwnerKey = SoraAPI.GetChestKey(owner.userid)
        end
    end)
    inst:DoPeriodicTask(1, function()
        local owner = inst.components.inventoryitem:GetGrandOwner()
        if inst.OwnerKey and owner and owner:HasTag("player") then
            local OwnerKey = SoraAPI.GetChestKey(owner.userid)
            if OwnerKey ~= inst.OwnerKey then
                inst:Reset()
                inst.OwnerKey = OwnerKey
            end
        end
    end)
    inst:ListenForEvent("ondropped", function()
        if inst.components.container then
            inst.components.container.canbeopened = false
            inst:Reset()
            inst.OwnerKey = nil
        end
    end)

    inst.ChestOpen = inst.components.container.Open
    inst.components.container.SoraStartOpen = false
    inst.components.container.Open = function(s, doer, ...)
        if not (doer and doer:HasTag("player")) then
            return false
        end
        if not inst.components.rechargeable:IsCharged() then
            SoraAPI.Say(doer, "现在无法打开")
            return
        end
        if not inst.components.container:IsOpenedBy(doer) then
            inst.components.container.SoraStartOpen = true
            SoraAPI.TryOpenGlobalChest(doer, inst)
        end
        return false
    end
    inst.ChestClose = inst.components.container.Close
    inst.components.container.Close = function(s, doer, ...)
        inst.components.container.SoraStartOpen = false
        if (doer and doer:HasTag("player")) then
            if inst.components.container:IsOpenedBy(doer) then
                SoraAPI.TryCloseGlobalChest(doer, inst)
            end
        end
        inst.ChestClose(s, doer, ...)
    end
    inst.components.container.OnSave = function()
        return {
            items = {}
        }, {}
    end

    inst:ListenForEvent("itemget", tryupdatechest)
    inst:ListenForEvent("itemlose", tryupdatechest)
    inst:ListenForEvent("stacksizechange", tryupdatechest)
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    return inst
end

return Prefab("sora2global", fn, assets, prefabs)
