
local assets=
{
	Asset("ANIM", "anim/ws_03.zip"),
	Asset("IMAGE", "images/inventoryimages/ws_03.tex"),	
}

local prefabs = {"gears","sentinel",}

SetSharedLootTable( 'ws_03_loot', {{'sentinel', 1},{'sentinel', 1},{'sentinel', 1},{'gears', 1},{'gears',1},{'gears', 1},{'gears', 0.25},})

local function OnStopFollowing(inst) 
    inst:RemoveTag("companion") 
end

local function OnStartFollowing(inst) 
    inst:AddTag("companion") 
end

local function OnAttacked(inst, data)
    local attacker = data.attacker

    inst.components.combat:SetTarget(attacker)
    inst.components.combat:ShareTarget(attacker, 30, function(dude) return dude:HasTag("gear_sentinel") end, 15)
end

local function OnNewTarget(inst, data)
    inst.components.combat:ShareTarget(data.target, 30, function(dude) return dude:HasTag("gear_sentinel") end, 15)
end

local function OnKeepTarget(inst, target)
    return inst.components.combat:CanTarget(target) 
end

local function OnDeath(inst)
end

local function OnGetItemFromPlayer(inst, giver, item)
	    if (item.prefab == "gears") then 
		
        inst.components.health:DoDelta(500) 
        inst.SoundEmitter:PlaySound("dontstarve/creatures/bishop/charge") 
        inst.components.follower:SetLeader(giver)
	    inst.components.talker:Say("HEALTH RESTORED!")
    end
end

local function ShouldAcceptItem(inst, item)
	if (item.prefab == "gears") then   
    return true
    end
end

local function OnRefuseItem(inst, item)
    local playerprefab = GetPlayer()
    if playerprefab then
		inst.components.talker:Say("ERROR!")
        inst.SoundEmitter:PlaySound("dontstarve/creatures/bishop/hurt") 		
    end
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    local physics = inst.entity:AddPhysics()
	local sound = inst.entity:AddSoundEmitter()
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize( 1.8, 2 )

	local scaleFactor = 0.8
    inst.Transform:SetFourFaced()
    inst.Transform:SetScale(scaleFactor, scaleFactor, scaleFactor)

	MakeCharacterPhysics(inst, 600, 1)
	
    inst:AddTag("character")	
    inst:AddTag("ws_03_loot")
	inst:AddTag("notraptrigger")
    inst:AddTag("gear_sentinel")
	inst:AddTag("scarytoprey")
	inst:AddTag("companion")
	
    anim:SetBank("spider_queen")
    anim:SetBuild("ws_03")
    anim:PlayAnimation("idle")
    
    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 3.8
    inst.components.locomotor.runspeed = 5.4
	inst.components.locomotor:SetSlowMultiplier( 1 )
	inst.components.locomotor:SetTriggersCreep(true)
    inst.components.locomotor.pathcaps = { ignorecreep = false }

    inst:SetStateGraph("SG_ws_03")

	local brain = require "brains/ws_03_brain"
    inst:SetBrain(brain)

    inst:AddComponent("knownlocations")
	inst:AddComponent("inspectable")
	
    inst:AddComponent("combat")		
    inst.components.combat.hiteffectsymbol = "body"
    inst.components.combat:SetDefaultDamage(120)
    inst.components.combat:SetAttackPeriod(1)	
    inst.components.combat:SetKeepTargetFunction(OnKeepTarget)	
	inst.components.combat:SetRange(2)
	
    MakeLargeFreezableCharacter(inst, "body")

	inst:AddComponent("health")
    inst.components.health.canmurder = true
    inst.components.health:SetMaxHealth(500)
	inst.components.health.canheal = false
	
    inst:AddComponent("follower")
    inst:ListenForEvent("stopfollowing", OnStopFollowing)
    inst:ListenForEvent("startfollowing", OnStartFollowing)
	inst.components.follower.maxfollowtime = 9999999
    inst.components.follower:AddLoyaltyTime(999999)	
	GetPlayer().components.leader:AddFollower(inst)
	
    inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("gears")
    inst.components.periodicspawner:SetRandomTimes(540,550)
    inst.components.periodicspawner:SetDensityInRange(20, 2)
    inst.components.periodicspawner:SetMinimumSpacing(15)
    inst.components.periodicspawner:Start()

	inst:AddComponent("trader")
    inst.components.trader.onaccept = OnGetItemFromPlayer	
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)	
    inst.components.trader.onrefuse = OnRefuseItem	
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 35
	inst.components.talker.colour = Vector3(.99, .55, 0, 0)
    inst.components.talker:StopIgnoringAll()
	
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "ws_03.tex" )
	
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetChanceLootTable('ws_03_loot')
	inst:AddComponent("norecipelootdrop")
	
	inst:ListenForEvent("attacked", OnAttacked)
	inst:ListenForEvent("newcombattarget", OnNewTarget)
    inst:ListenForEvent("death", OnDeath)
	
    return inst
end

return Prefab( "forest/animals/ws_03", fn, assets, prefabs) 
