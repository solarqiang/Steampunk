require "behaviours/follow"
require "behaviours/wander"
require "behaviours/chaseandattack"
require "behaviours/doaction"

local KEEP_CHOPPING_DIST = 15
local SEE_TREE_DIST = 20

local WS_03_Brain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local function KeepChoppingAction(inst)
    return inst.components.follower.leader and inst.components.follower.leader:GetDistanceSqToInst(inst) <= KEEP_CHOPPING_DIST*KEEP_CHOPPING_DIST
end

local function StartChoppingCondition(inst)
    return inst.components.follower.leader and inst.components.follower.leader.sg and inst.components.follower.leader.sg:HasStateTag("chopping")
end


local function FindTreeToChopAction(inst)
    local target = FindEntity(inst, SEE_TREE_DIST, function(item) return item.components.workable and item.components.workable.action == ACTIONS.CHOP end)
    if target then
        return BufferedAction(inst, target, ACTIONS.CHOP)
    end
end

function WS_03_Brain:OnStart()
    local root = 
    PriorityNode({
	    IfNode(function() return StartChoppingCondition(self.inst) end, "chop", 
                WhileNode(function() return KeepChoppingAction(self.inst) end, "keep chopping",
                    LoopNode{ 
                            DoAction(self.inst, FindTreeToChopAction )})),
		ChaseAndAttack(self.inst, 12, 20),
		Follow(self.inst, function() return self.inst.components.follower.leader end, 4.5, 10, 12),
        Wander(self.inst, function() return Point(GetPlayer().Transform:GetWorldPosition()) end , 14)
		
    }, 1)
    self.bt = BT(self.inst, root)
end

return WS_03_Brain