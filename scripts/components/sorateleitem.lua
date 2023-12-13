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
]] --[[专属交互
]] --
local com = Class(function(self, inst)
    self.inst = inst
end)
local Say = SoraAPI.Say
local prefabmap = {
    deer_antler1 = "klaus_sack", -- 鹿角
    deer_antler2 = "klaus_sack", -- 鹿角
    deer_antler3 = "klaus_sack", -- 鹿角
    klaussackkey = "klaus_sack" -- 麋鹿茸

}
local prefabmaps = {
    kitcoon_forest = "kitcoon",
    kitcoon_savanna = "kitcoon",
    kitcoon_deciduous = "kitcoon",
    kitcoon_marsh = "kitcoon",
    kitcoon_grass = "kitcoon",
    kitcoon_rocky = "kitcoon",
    kitcoon_desert = "kitcoon",
    kitcoon_moon = "kitcoon",
    kitcoon_yot = "kitcoon"
}
local function toprefab(prefab)
    return prefabmaps[prefab] or prefab or "unprefab"
end
local itemfn = {
    medal_treasure_map = function(inst, doer, target)
        if target.getTreasurePoint then
            local data = target:getTreasurePoint()
            if data then
                local worldid = data.worldid
                if worldid ~= TheShard:GetShardId() then
                    return false, "目标地点不在当前世界\n无法传送"
                else
                    return true, {
                        x = data.x,
                        z = data.z
                    }
                end
            end
        end
        return false, "预言失败\n无法传送"
    end,
    treasure_paper_myth = function(inst, doer, target)
        local item = TheSim:FindFirstEntityWithTag("myth_treasure")
        if item then
            local it
            if item.prefab == "treasure_hide_myth" then
                it = ReplacePrefab(item, "treasure_show_myth")
                if it then
                    it.quality = 1
                end
            else
                it = item
            end
            if it then
                local pos = it:GetPosition()
                return true, pos
            else
                return false, "未找到宝藏\n无法传送"
            end
        else
            return false, "未找到宝藏\n无法传送"
        end
    end,
    elaina_treasure_map = function(inst, doer, target)
        if target and target.components.mapspotrevealer then
            local pos, reason = target.components.mapspotrevealer.gettargetfn(target, doer)
            if pos then
                target.components.mapspotrevealer.postreveal(target)
                return true, pos
            end
        end
        return false, "未找到宝藏\n无法传送"
    end
}
local postfn = {
    medal_treasure_map = function(inst, doer, target, pos)
        if target.spawnTreasure then
            local resonator = SpawnPrefab("medal_resonator")
            resonator.Transform:SetPosition(pos.x, 0, pos.z)
            target:spawnTreasure(resonator)
            resonator:Remove()
            target:Remove()
        end
    end
}
itemfn.medal_loss_treasure_map = itemfn.medal_treasure_map
postfn.medal_loss_treasure_map = postfn.medal_treasure_map
function com:TryTele(doer, target)
    if itemfn[target.prefab] then
        local res, pos = itemfn[target.prefab](self.inst, doer, target)
        if res then
            if not TheWorld.Map:IsAboveGroundAtPoint(pos.x, 0, pos.z, false) then
                return Say(doer, "目标地点不是陆地\n不支持传送")
            end
            doer.components.locomotor:Stop()
            local pp = doer:GetPosition()
            doer.Physics:Teleport(pos.x, pp.y, pos.z)
            if postfn[target.prefab] then
                postfn[target.prefab](self.inst, doer, target, pos)
            end
            self.inst.components.stackable:Get():Remove()
        else
            Say(doer, pos)
        end
    else
        local tofind = prefabmap[target.prefab] or prefabmaps[target.prefab] or target.prefab
        local allitems = {}
        local pos
        for k, v in pairs(Ents) do
            if toprefab(v.prefab) == tofind then
                local dpos = v:GetPosition()
                if TheWorld.Map:IsAboveGroundAtPoint(dpos.x, 0, dpos.z, false) then
                    table.insert(allitems, v)
                end
            end
        end
        if next(allitems) then
            local item
            doer.sorateleindex = (doer.sorateleindex or 0)
            local index = doer.sorateleindex % #allitems  +1 
            doer.sorateleindex = doer.sorateleindex + 1
            for i = 1, 100 do
                if allitems[index] and allitems[index] ~= target and not FindEntity(allitems[index], 4, nil, {"player"}) then
                    item = allitems[index]
                    break
                end
                index = index % #allitems + 1
            end
            if item then
                local pos = item:GetPosition()
                doer.components.locomotor:Stop()
                if doer:GetDistanceSqToInst(item) > 4 then
                    self.inst.components.stackable:Get():Remove()
                end
                local pp = doer:GetPosition()
                doer.Physics:Teleport(pos.x, pp.y, pos.z)
            else
                return Say(doer, "没有找到目标地点\n请稍后传送")
            end
        else
            return Say(doer, "没有找到目标地点\n请稍后传送")
        end
    end
end

-- function com:OnSave()
--     return {
--         --add_component_if_missing_sora = (self.pass ~= "") and 1 or nil
--     }
-- end

-- function com:OnLoad(data)
--     if not data then
--         return
--     end

-- end

function com:GetDebugString()
    return ""
end

return com
