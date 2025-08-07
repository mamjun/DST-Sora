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
]]
local function canshrink(target)
    if target then
        if TUNING.SORAADD2 then
            return true
        else
            return not target.components.combat or
                       target.components.combat.defaultdamage == 0
        end
    end
end
-- require "config/debug"
local sorapacker = Class(function(self, inst)
    self.inst = inst
    self.canpackfn = canshrink
    self.item = nil
end)

function sorapacker:HasPackage() return self.item ~= nil end

function sorapacker:SetCanPackFn(fn) self.canpackfn = fn end
local cantpack = {}
function sorapacker:DefaultCanPackTest(target) -- 目标待改
   
    if target and target:HasTag("soracantpack") then return false end
    if target and target:HasTag("cantpack") then return false end
    if cantpack[target.prefab] then return false end
    if target.prefab:match("_bell$") then return false end
    if TUNING.SORAADD then
        return target and
                   not (target:HasTag("teleportato") -- or target:HasTag("irreplaceable")
            or target:HasTag("player") or target:HasTag("nonpackable") or
                       target:HasTag("companion") -- or target.prefab == "wormhole"--虫洞
            -- or target.prefab == "beequeenhivegrown"--蜂王窝-底座
            -- or target.prefab =="beequeenhive"--蜂王窝
            -- or target.prefab =="cave_entrance"--虫洞入口
            -- or target.prefab =="cave_entrance_ruins"
            -- or target.prefab =="cave_entrance_open"
            -- or target.prefab == "multiplayer_portal"
            -- or target.prefab == "tentacle_pillar_hole"
            -- or target.prefab == "tentacle_pillar"
            )
    else
        return target and target:IsValid() and
                   not (target:HasTag("teleportato") or target:HasTag("player") or
                       target:HasTag("nonpackable") or
                       target:HasTag("companion")  -- or target.prefab == "wormhole"--虫洞
            -- or target.prefab == "beequeenhivegrown"--蜂王窝-底座
            or target.prefab == "beequeenhive" -- 蜂王窝
            or target.prefab == "cave_entrance" -- 虫洞入口
            or target.prefab == "cave_entrance_ruins" or target.prefab ==
                       "cave_entrance_open" or target.prefab ==
                       "multiplayer_portal" -- or target.prefab == "tentacle_pillar_hole"
            -- or target.prefab == "tentacle_pillar"
            )
    end

end

function sorapacker:CanPack(target)
    if SoraAPI.TESTPACK then return true end
    return self.inst:IsValid() and not self:HasPackage() and
               self:DefaultCanPackTest(target) and
               (not self.canpackfn or self.canpackfn(target, self.inst)) and
               not (target.components.container and
                   target.components.container.openner)
end

local function get_name(target)
    local name = target:GetDisplayName() or
                     (target.components.named and target.components.named.name)
    if not name or name == "MISSING NAME" then return "空的打包盒" end

    local adj = target:GetAdjective()
    if adj then name = adj .. " " .. name end

    if target.components.stackable then
        local size = target.components.stackable:StackSize()
        if size > 1 then name = name .. " x" .. tostring(size) end
    end

    return "打包的" .. name
end

function sorapacker:Pack(target, doer, MustPack)
    if not MustPack and not self:CanPack(target) then
        if doer and doer.components and doer.components.talker then
            doer.components.talker:Say("这个不能打包")
        end
        return false
    end
    if target and target.ownerlist and target.ownerlist.master and
        target.ownerlist.master ~= doer.userid then
        if doer and doer.components and doer.components.talker then
            doer.components.talker:Say("不能打包别人的东西")
        end
        return false
    end
    local debugstring = target.entity:GetDebugString()

    local bank, build, anim = debugstring:match(
                                  "bank: (.+) build: (.+) anim: .+:(.+) Frame")
    if (not bank) or (bank:find("FROMNUM")) then
        bank = target.prefab -- 抢救一下吧
    end
    if (not build) or (build:find("FROMNUM")) then
        build = target.prefab -- 抢救一下吧
    end
    if target.skinname and not Prefabs[target.prefab .. "_placer"] then
        local debuginst = SpawnPrefab(target.prefab)
        debugstring = debuginst.entity:GetDebugString()
        bank, build, anim = debugstring:match(
                                "bank: (.+) build: (.+) anim: .+:(.+) Frame")
        debuginst:Remove()
    end
    if target and target.components.container and target.components.container:IsOpen() then
        target.components.container:Close()
    end
    self.item = {
        item = target:GetSaveRecord(),
        irreplaceable = target:HasTag("irreplaceable"),
        origin = TheWorld.meta.session_identifier,
        bank = bank or "",
        build = build or "",
        anim = anim or "",
        -- scale = target:GetScale(),        --取不到 先不管了
        name = get_name(target)
    }
    self.inst.replica.sorapacker:SetPlacer(target.prefab, bank, build, anim) -- 丢给客机
    if target.components.teleporter and
        target.components.teleporter.targetTeleporter then
        self.item.item2 =
            target.components.teleporter.targetTeleporter:GetSaveRecord()
        target.components.teleporter.targetTeleporter:Remove()
    end
    -- self.item.data, self.item.refs = target:GetPersistData()
    if not self.inst.components.named then self.inst:AddComponent("named") end
    self.inst.components.named:SetName(self.item.name)
    self.inst.components.inspectable:SetDescription("这是" .. self.item.name)
    target:Remove()
    self.inst:AddTag("sorapacker_full")

    return true
end

function sorapacker:GetName() return self.item and self.item.name end

function sorapacker:Unpack(pos)
    inGamePlay = false -- 骗过系统 告诉他我们还在读档
    if self.item and self.item.item then
        local v = self.item.item
        local item = SpawnSaveRecord(v) -- , v.skin_id, creator
        -- item:SetPersistData(v.data)
        if item ~= nil and item:IsValid() then
            if item.Physics ~= nil then
                item.Physics:Teleport(pos:Get())
            else
                item.Transform:SetPosition(pos:Get())
            end
            if item.components.inventoryitem ~= nil then
                item.components.inventoryitem:OnDropped(true, .5)
            end
        end
        if self.item.item2 then
            local item2 = SpawnSaveRecord(self.item.item2)
            if item2 and item.components.teleporter and
                item2.components.teleporter then
                item2.components.teleporter:Target(item)
                item.components.teleporter:Target(item2)
            end
        end
    end
    inGamePlay = true -- 结束了 不用骗了
end

function sorapacker:Unpackbuild(pos)
    -- local creator = self.item.origin ~= nil and TheWorld.meta.session_identifier ~= self.item.origin and { sessionid = self.item.origin } or nil
    self:Unpack(pos)
end

function sorapacker:OnSave()
    return self.item ~= nil and {item = self.item} or nil
end

function sorapacker:OnLoad(data)
    if data and data.item then
        self.item = data.item
        if not self.inst.components.named then
            self.inst:AddComponent("named")
        end
        self.inst.components.named:SetName(self.item.name)
        self.inst.components.inspectable:SetDescription(
            "这是" .. self.item.name)
        self.inst:AddTag("sorapacker_full")
        self.inst.replica.sorapacker:SetPlacer(self.item.item.prefab,
                                               self.item.bank, self.item.build,
                                               self.item.anim)
    end
end

return sorapacker
