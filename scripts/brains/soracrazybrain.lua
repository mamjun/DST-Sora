require "behaviours/soracrazyattack"

local brain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function brain:ForcePetrify()

end
function brain:OnStart()
    local root =
    PriorityNode({
        SoraCrazyAttack(self.inst, 2),
    }, 2)
    self.bt = BT(self.inst, root)
end

return brain