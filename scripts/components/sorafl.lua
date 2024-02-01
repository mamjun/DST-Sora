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
    self.has = false
    inst:DoTaskInTime(0, function()
        self:Init()
    end)
    inst.SoraOnPlayeLeave = self.OnPlayeLeave
    self.flsave = {}
    inst:ListenForEvent("ms_playerdespawnandmigrate",inst.SoraOnPlayeLeave,TheWorld)   --跳世界
    --inst:ListenForEvent("ms_playerdespawnanddelete",inst.SoraOnPlayeLeave,TheWorld)    --重新选人
    --inst:ListenForEvent("ms_playerdespawn",inst.SoraOnPlayeLeave,TheWorld)  --下线
end)

function com:Init()
    if not self.has then
        local pos = self:FindSpawnPoint()
        if pos then
            local fl = SpawnAt("sora_fl", pos)
            fl.components.sorabind:Bind(self.inst.userid, self.inst.name)
            print("生成风铃草",self.inst.userid,self.inst.name,pos)
            self.has = true
            return fl
        end
    end
    if self.flsave then 
        for k,v in pairs(self.flsave) do 
            local pos = self:FindSpawnPoint()
            local item = SpawnSaveRecord(v[1])
            print("重新生成风铃草",self.inst.userid,self.inst.name,pos)
            if item then 
                item.Physics:Teleport(pos.x, pos.y, pos.z)
            end
        end
        self.flsave = {}
    end
end
function com.OnPlayeLeave(world,data)
    local player =data and ( data.userid and  data or data.player )
    if not player then return end 
    local self = player.components.sorafl 
    if not self then return end
    local fls = TheWorld.components.soraenttrack:FindWith("sora_fl",function (inst)
        if inst and inst.components.sorabind and inst.components.sorabind.bind == player.userid and 
            inst.components.sorafllink and not inst.components.sorafllink.link  then 
                return true
        end
    end)
    local flsaves = {}
    for k,v in pairs(fls) do 
        table.insert(flsaves,{k:GetSaveRecord()})
        print("带走风铃草",player.userid,player.name,k:GetPosition())
        k:Remove()
    end
    self.flsave = flsaves
end
-- function com:TestPoint()
--     local pos = self:FindSpawnPoint()
--     self.inst.Transform:SetPosition(pos:Get())
-- end
function com:FindSpawnPoint()
    for i = 1, 10000 do
        local x = math.random(-600, 600)
        local y = math.random(-600, 600)
        local yes = true
        local ents = TheSim:FindEntities(x, 0, y, 2, nil, {"FX", "NOCLICK", "NOBLOCK"})
        yes = yes and #ents < 1
        yes = yes and (i > 7000 or (self.inst:GetDistanceSqToPoint(x, 0, y) > 6400))
        local tile = TheWorld.Map:GetTileAtPoint(x, 0, y)
        yes = yes and (i > 5000 or (tile > 4 and tile < 8))
        if yes then
            for ix = -2, 2, 1 do
                for iy = -2, 2, 1 do
                    yes = yes and TheWorld.Map:CanPlantAtPoint(x + ix * 4, 0, y + iy * 4)
                    yes = yes and TheWorld.Map:IsPassableAtPoint(x + ix * 4, 0, y + iy * 4, false, true)
                end
            end
        end
        if yes then
            local ix = math.random()
            local iy = math.random()
            x = x + ix
            y = y + iy
            return Vector3(x, 0, y)
        end
    end
    return Vector3(math.random() * 20, 0, math.random() * 20)
end

function com:OnSave()
    return {
        has = self.has,
        link = self.link,
        flsave = self.flsave 
    }
end

function com:OnLoad(data)
    if data then
        if data.has then
            self.has = data.has
        end
        if data.link then
            self.link = data.link
        end
        if data.flsave then 
            self.flsave = data.flsave
        end
    end
end

return com
