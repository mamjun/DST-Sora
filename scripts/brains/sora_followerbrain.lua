require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
local MIN_FOLLOW_DIST = 1
local MAX_FOLLOW_DIST = 6
local TARGET_FOLLOW_DIST = 3

local MAX_WANDER_DIST = 3


local function GetFaceTargetFn(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end


local sora_followerBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)


function sora_followerBrain:OnStart()
    local root =
    PriorityNode({
        Follow(self.inst, function() return self.inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
        FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
    }, 0.1)
    self.bt = BT(self.inst, root)
end

return sora_followerBrain