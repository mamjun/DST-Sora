SoraCrazyAttack = Class(BehaviourNode, function(self, inst, sleeptime)
    BehaviourNode._ctor(self, "SoraCrazyAttack")
    self.inst = inst
    self.sleeptime = sleeptime or 1
end)
function SoraCrazyAttack:__tostring()
    return string.format("target %s", tostring(self.inst.components.combat.target))
end
function SoraCrazyAttack:Visit()
    local combat = self.inst.components.combat
    if self.status == READY then
        combat:ValidateTarget()
        if combat.target ~= nil then
            self.status = RUNNING
        else
            self.status = FAILED
        end
    end
    if self.status == RUNNING then
        local is_attacking = self.inst.sg:HasStateTag("attack")
        if combat.target == nil or not combat.target.entity:IsValid() then
            self.status = FAILED
            combat:SetTarget(nil)
            self.inst.components.locomotor:Stop()
        elseif combat.target.components.health ~= nil and combat.target.components.health:IsDead() then
            self.status = SUCCESS
            combat:SetTarget(nil)
            self.inst.components.locomotor:Stop()
        else
            local target_position = Point(combat.target.Transform:GetWorldPosition())
            local facing_point = target_position
            local me = Point(self.inst.Transform:GetWorldPosition())
            local dsq = distsq(target_position, me)
            local running = self.inst.components.locomotor:WantsToRun()
            if not self.inst.sg:HasStateTag("longattack") then
                local r = self.inst:GetPhysicsRadius(0) + combat.target:GetPhysicsRadius(-.1) + .1
                if (running and dsq > r * r) or (not running and dsq > combat:CalcAttackRangeSq()) then
                    self.inst.components.locomotor:GoToPoint(target_position, nil, not self.walk)
                elseif not (self.inst.sg ~= nil and self.inst.sg:HasStateTag("jumping")) then
                    self.inst.components.locomotor:Stop()
                    if self.inst.sg:HasStateTag("canrotate") then
                        self.inst:FacePoint(facing_point)
                    end
                end
                combat:TryAttack()
            end
            self:Sleep(self.sleeptime)
        end
    end
end
