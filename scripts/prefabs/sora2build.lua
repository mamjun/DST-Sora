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

local assets = {}
local allprefab = {}
local name_pre = "sora2build_"
local function onhammered(inst, worker)
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    if worker and worker:HasTag("player") then
        local skin = nil
        if inst.skinname then
            skin = inst.skinname .. "_item"
        end
        local item = SpawnPrefab(inst.prefab .. "_item", skin)
        if worker.components.inventory:IsFull() then
            item.Transform:SetPosition(inst:GetPosition():Get())
            item.components.inventoryitem:OnDropped()
        else
            worker.components.inventory:GiveItem(item)
        end

    end

    inst:Remove()

end
local function onhit(inst, worker)

end
local function commonfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst:AddTag("structure")
    inst.entity:SetPristine()
    inst:AddComponent("soratwoface")
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
    return inst
end
local function OnDeploy(inst, pt, deployer)
    local skin = nil
    if inst.skinname then
        skin = inst.skinname:sub(1, -6)
    end
    local flower = SpawnPrefab(inst.linkprefab, skin)
    if flower then
        flower.Transform:SetPosition(pt:Get())
        inst.components.stackable:Get():Remove()
    end
end

local function commonitemfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst:AddTag("structure")
    inst.entity:SetPristine()
    MakeInventoryPhysics(inst)
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = OnDeploy
    inst.components.deployable.spacing = DEPLOYSPACING.MEDIUM
    inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
    -- inst.components.inventoryitem.atlasname = "images/inventoryimages/sora2stone.xml"
    -- inst.components.inventoryitem.imagename = "sora2stone"
    return inst
end

local function OnIsPathFindingDirty(inst)
    if inst._ispathfinding:value() then
        if inst._pfpos == nil and inst:GetCurrentPlatform() == nil then
            inst._pfpos = inst:GetPosition()
            TheWorld.Pathfinder:AddWall(inst._pfpos:Get())
        end
    elseif inst._pfpos ~= nil then
        TheWorld.Pathfinder:RemoveWall(inst._pfpos:Get())
        inst._pfpos = nil
    end
end

local function InitializePathFinding(inst)
    inst:ListenForEvent("onispathfindingdirty", OnIsPathFindingDirty)
    OnIsPathFindingDirty(inst)
end

local function MakeBuild(bname, fn, NAMES, DES)
    local buildname = name_pre .. bname
    fn = fn or function()
    end
    STRINGS.NAMES[buildname:upper()] = NAMES or ""
    STRINGS.CHARACTERS.GENERIC.DESCRIBE[buildname:upper()] = DES or ""
    local function prefn()
        local inst = commonfn()
        inst.AnimState:SetBank(buildname)
        inst.AnimState:SetBuild(buildname)
        inst.AnimState:PlayAnimation("idle", true)
        fn(inst)
        return inst
    end
    local function preitemfn()
        local inst = commonitemfn()
        inst.AnimState:SetBank(buildname)
        inst.AnimState:SetBuild(buildname)
        inst.AnimState:PlayAnimation("idle", true)
        inst.linkprefab = buildname
        if not TheWorld.soraismastersim then
            return inst
        end
        inst.components.inventoryitem.atlasname = "images/inventoryimages/" .. buildname .. ".xml"
        inst.components.inventoryitem.imagename = buildname
        return inst
    end

    RegisterInventoryItemAtlas("images/inventoryimages/" .. buildname .. ".xml", buildname .. ".tex")
    RegisterInventoryItemAtlas("images/inventoryimages/" .. buildname .. "_item.xml", buildname .. "_item.tex")
    SoraAPI.MakeItemSkinDefaultData(buildname, {}, {nil, nil, "idle", true})
    SoraAPI.MakeItemSkinDefaultData(buildname .. "_item", {}, {buildname, buildname, "idle", true})
    SoraAPI.MakeAssetTable(buildname, assets)
    SoraAPI.MakeAssetTable(buildname .. "_item", assets)
    table.insert(allprefab, Prefab(buildname, prefn, assets))
    table.insert(allprefab, MakePlacer(buildname .. "_placer", buildname, buildname, "idle"))
    table.insert(allprefab, Prefab(buildname .. "_item", preitemfn, assets))
    table.insert(allprefab, MakePlacer(buildname .. "_item_placer", buildname, buildname, "idle"))
    local function MakeBuildSkin(name, cnname, baseskin, bank, build)
        local tname = buildname .. "_" .. name
        SoraAPI.MakeItemSkin(buildname, tname, {
            name = cnname,
            atlas = "images/inventoryimages/" .. (build or bank or tname) .. ".xml",
            image = (build or bank or tname),
            build = build or bank or tname,
            bank = bank or tname,
            clear_fn = function(inst)
            end,
            checkfn = SoraAPI.SoraSkinCheckFn,
            checkclientfn = SoraAPI.SoraSkinCheckClientFn
        })
        SoraAPI.MakeItemSkin(buildname .. "_item", tname .. "_item", {
            name = cnname,
            atlas = "images/inventoryimages/" .. (build or bank or tname) .. ".xml",
            image = (build or bank or tname),
            build = build or bank or tname,
            bank = bank or tname,
            clear_fn = function(inst)
            end,
            checkfn = SoraAPI.SoraSkinCheckFn,
            checkclientfn = SoraAPI.SoraSkinCheckClientFn
        })

        if baseskin then
            SoraAPI.MakeSkinNameMap(baseskin, tname)
            SoraAPI.MakeSkinNameMap(baseskin, tname .. "_item")
        else
            SoraAPI.MakeSkinNameMap(tname, tname .. "_item")
        end
        if not bank and not build then
            SoraAPI.MakeAssetTable(tname, assets)
        end
        return MakeBuildSkin
    end

    return MakeBuildSkin
end

MakeBuild("pile", function(inst)
    MakeObstaclePhysics(inst, .5)
end, "穹の小木桩", "远看近看都是桩")("soratele_wsqy", "荒野", "soratele_wsqy", "soratele_wsqy")(
    "soramagic_wsqy", "赴约", "soramagic_wsqy", "soramagic_wsqy")("sorabowknot_wsqy", "纪念", "sorabowknot_wsqy",
    "sorabowknot_wsqy")("sorabowknot_wsqy_r", "纪念☆", "sorabowknot_wsqy_r", "sorabowknot_wsqy_r")("lantern",
    "莲叶东", "sora_lantern", "sora_lantern")("sora_lantern_yh", "春迟", "sora_lantern_yh", "sora_lantern_yh")
MakeBuild("decor", function(inst)

end, "穹の绿植", "这个撞不上")("small", "中杯")("medium", "大杯")("jss", "橘伞伞")("soratele_wsqy",
    "荒野", "soratele_wsqy", "soratele_wsqy")("soramagic_wsqy", "赴约", "soramagic_wsqy", "soramagic_wsqy")(
    "sorabowknot_wsqy", "纪念", "sorabowknot_wsqy", "sorabowknot_wsqy")("sorabowknot_wsqy_r", "纪念☆",
    "sorabowknot_wsqy_r", "sorabowknot_wsqy_r")("mls", "猫老师", "sora2chest_mls")("lantern", "莲叶东",
    "sora_lantern", "sora_lantern")("sora_lantern_yh", "春迟", "sora_lantern_yh", "sora_lantern_yh")

-- MakeBuild("gate", function(inst)end, "穹の大门", "出门记得锁好")

return unpack(allprefab)

