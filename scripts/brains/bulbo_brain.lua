require "behaviours/wander"
require "behaviours/doaction"
require "behaviours/runaway"

local RUN_AWAY_DIST = 4
local STOP_RUN_AWAY_DIST = 6
local START_FACE_DIST = 4
local KEEP_FACE_DIST = 6

local BulboBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local function GetFaceTargetFn(inst)
    local target = GetClosestInstWithTag("player", inst, START_FACE_DIST)
	inst.Light:Enable(false)
	inst.AnimState:SetBuild("bulbo_off")
	inst.SoundEmitter:KillSound("loop")
    if target and not target:HasTag("notarget") then
        return target
    end
	inst.Light:Enable(true)
	inst.AnimState:SetBuild("bulbo_on")	
	inst.SoundEmitter:PlaySound("dontstarve/wilson/lantern_LP", "loop")	
end

local function KeepFaceTargetFn(inst, target)
    return inst:GetDistanceSqToInst(target) <= KEEP_FACE_DIST * KEEP_FACE_DIST and not target:HasTag("notarget")
end

local function ShouldRunAway(guy)
	return guy:HasTag("character") and not guy:HasTag("notarget")
end

function BulboBrain:OnStart()

    local root = 
    PriorityNode({
		SequenceNode{
        FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn, 0.5),		
        RunAway(self.inst, ShouldRunAway, RUN_AWAY_DIST, STOP_RUN_AWAY_DIST)},
        Wander(self.inst)
		
    }, 1)
    self.bt = BT(self.inst, root)
end

return BulboBrain