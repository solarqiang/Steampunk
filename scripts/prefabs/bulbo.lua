
local assets=
{
	Asset("ANIM", "anim/bulbo_on.zip"),
	Asset("ANIM", "anim/bulbo_off.zip"),	
}

local prefabs = {"lightbulb",}

SetSharedLootTable( 'bulbo_loot', {{'lightbulb', 0.05},})

local function OnKeepTarget(inst, target)
    return inst.components.combat:CanTarget(target) 
end

local function OnDeath(inst)
	inst.AnimState:SetBuild("bulbo_off")
	inst.Light:Enable(false)
	inst.SoundEmitter:KillSound("loop")
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    local physics = inst.entity:AddPhysics()
	local sound = inst.entity:AddSoundEmitter()
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize( 1.0, .6 )
	local scaleFactor = 0.6
    inst.Transform:SetFourFaced()
    inst.Transform:SetScale(scaleFactor, scaleFactor, scaleFactor)
	MakeCharacterPhysics(inst, 1, .5)
	
    inst:AddTag("bulbo_loot")
	inst:AddTag("notraptrigger")
	
    anim:SetBank("spider_hider")
    anim:SetBuild("bulbo_on")
    anim:PlayAnimation("idle")
    
    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 2
    inst.components.locomotor.runspeed = 2
	inst.components.locomotor:SetSlowMultiplier( 1 )
	inst.components.locomotor:SetTriggersCreep(true)
    inst.components.locomotor.pathcaps = { ignorecreep = false }

    inst:SetStateGraph("SGbulbo")

	local brain = require "brains/bulbo_brain"
    inst:SetBrain(brain)

    inst:AddComponent("knownlocations")
	inst:AddComponent("inspectable")
	
    inst:AddComponent("combat")		
    inst.components.combat.hiteffectsymbol = "body"	
    inst.components.combat:SetKeepTargetFunction(OnKeepTarget)	
	
	inst:AddComponent("health")
    inst.components.health.canmurder = true
    inst.components.health:SetMaxHealth(5)
	inst.components.health.canheal = false
	
	local light = inst.entity:AddLight()
    inst.Light:Enable(true)
	inst.Light:SetRadius(0.65)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(0.84)
    inst.Light:SetColour(220/255,209/255,50/255)
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetChanceLootTable('bulbo_loot')
	
    inst:ListenForEvent("death", OnDeath)
	
    return inst
end

return Prefab( "forest/animals/bulbo", fn, assets, prefabs) 
