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

local assets = {}

local prefabs = {}

local function onopen(inst, data)
    if data.doer and data.doer:HasTag("player") then
        inst.components.soralistcontainer:FixSlotLast()
        inst.components.soralistcontainer:GetAllItemInSlot()
    end
end

local function onclose(inst, doer)
    if doer and doer:HasTag("player") then
        inst.components.soralistcontainer:FixSlotLast()
    end
end
local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst:AddTag("nosteal")
    inst:AddTag("sora2list")
    inst:AddTag("soracontainerfix")
    inst:AddTag("meteor_protection")
    inst.AnimState:SetBank("sora2list")
    inst.AnimState:SetBuild("sora2list")
    inst.AnimState:PlayAnimation("idle", true)
    MakeInventoryPhysics(inst)
    inst.entity:SetPristine()
    
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora2list")
        end
        return inst
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2list.xml"
    inst.components.inventoryitem.imagename = "sora2list"
    inst.components.inventoryitem.canonlygoinpocket = true
    inst:AddComponent("soraonlyone")
    inst.components.soraonlyone.tag = "sora2list"
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora2list")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst:AddComponent("soralistcontainer")
    inst.components.soralistcontainer:Init()
    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(0)
    return inst
end

local function fn3()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst:AddTag("nosteal")
    inst:AddTag("soracontainerfix")
    inst.AnimState:SetBank("sora3list")
    inst.AnimState:SetBuild("sora3list")
    inst.AnimState:PlayAnimation("idle", true)
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sora3list")
        end
        return inst
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sora3list.xml"
    inst.components.inventoryitem.imagename = "sora3list"
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sora3list")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst:AddComponent("soralistcontainer")
    inst.components.soralistcontainer:Init()
    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(0)
    return inst
end
SoraAPI.MakeItemSkinDefaultData("sora2chest", {}, {})
SoraAPI.MakeAssetTable("sora2list", assets)
SoraAPI.MakeAssetTable("sora3list", assets)

return Prefab("sora2list", fn, assets, prefabs), Prefab("sora3list", fn3, assets, prefabs)
