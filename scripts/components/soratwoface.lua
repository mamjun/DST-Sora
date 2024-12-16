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
]] --[[标准组件
]] --
local com = Class(function(self, inst)
    self.inst = inst
    self.faced = 2 
    self:SetFaced()
    inst:AddTag("rotatableobject")
end)
local ROT_SIDES = 8
local function CalcRotationEnum(rot)
    return math.floor((math.floor(rot + 0.5) / 45) % ROT_SIDES)
end
local function IsNarrow(inst)
    return CalcRotationEnum(inst.Transform:GetRotation()) % 2 == 0
end

local function IsEnumNarrow(enum)
    return enum % 2 == 0
end

local function SetOrientation(inst, rotation, rotation_enum)
    inst.Transform:SetRotation(rotation)
end
function com:SetFaced(face)
    if not face then 
        face = self.faced
    end
    if face == 8 then 
        self.inst.Transform:SetEightFaced()
        self.faced = 8
    elseif face == 6 then 
        self.inst.Transform:SetSixFaced()
        self.faced = 6
    elseif face == 4 then 
        self.inst.Transform:SetFourFaced()
        self.faced = 4
    else
        self.inst.Transform:SetTwoFaced()
        self.faced = 2
    end
    
end
function com:NextFace()
    local face = 2 
    if self.faced ==  2 then 
        face = 4
    elseif self.faced == 4 then 
        face = 6 
    elseif self.faced == 6 then 
        face = 8
    end
    self:SetFaced(face)
    return face
end

function com:OnSave()
    local data = {}
    local boat = self.inst:GetCurrentPlatform()
    if boat and boat:HasTag("boat") then
        data.boatrotation = self.inst.Transform:GetRotation()
    else
        local rot = CalcRotationEnum(self.inst.Transform:GetRotation())
        data.rot = rot > 0 and rot or nil
    end
    data.faced = self.faced 
    return data
end

function com:OnLoad(data)
    if not data then
        return
    end
    local inst = self.inst
    local rotation = 0
    inst.loaded_rotation_enum = 0
    if data.rotation ~= nil then
        -- very old style of save data. updates save data to v2 format, safe to remove this when we go out of the beta branch
        rotation = data.rotation - 90
        inst.loaded_rotation_enum = CalcRotationEnum(rotation)
    elseif data.rot ~= nil then
        rotation = data.rot * 45
        inst.loaded_rotation_enum = data.rot
    end
    SetOrientation(inst, rotation)
    self.faced = data.faced or 2
    self:SetFaced()
    inst:DoTaskInTime(0, function(inst)
        -- If fences are placed on rotated boats, we need to account for the boat's rotation
        if data.boatrotation ~= nil then
            -- New method for loading rotation on boats; set the orientation directly
            local rot_enum = CalcRotationEnum(inst.Transform:GetRotation())
            SetOrientation(inst, data.boatrotation, rot_enum)
        else
            -- Old method for loading rotation on boats
            local boat = inst:GetCurrentPlatform()
            if boat and boat:HasTag("boat") then
                local fence_rotation = inst.Transform:GetRotation()
                local boat_rotation = boat.Transform:GetRotation()
                if fence_rotation < 0 then
                    fence_rotation = 360 + fence_rotation
                end
                local fence_rotation_enum = inst.loaded_rotation_enum
                local boat_rot_enum = CalcRotationEnum(boat_rotation)
                local base_rotation_enum = fence_rotation_enum - boat_rot_enum
                SetOrientation(inst, base_rotation_enum * 45 + boat_rotation)
                inst.loaded_rotation_enum = nil
            end
        end
    end)

end

return com
