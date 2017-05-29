require "behaviours/follow"
require "behaviours/wander"
require "behaviours/chaseandattack"
require "behaviours/doaction"

local SentinelBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function SentinelBrain:OnStart()
    local root = 
    PriorityNode({
		ChaseAndAttack(self.inst, 12, 20),
		Follow(self.inst, function() return self.inst.components.follower.leader end, 1, 6, 8),
        Wander(self.inst, function() return Point(GetPlayer().Transform:GetWorldPosition()) end , 7)
		
    }, 1)
    self.bt = BT(self.inst, root)
end

return SentinelBrain