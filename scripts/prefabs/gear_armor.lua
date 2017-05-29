local assets=
{
	Asset("ANIM", "anim/gear_armor.zip"),
	Asset("ANIM", "anim/gear_armor2.zip"),	
	Asset("ATLAS", "images/inventoryimages/gear_armor.xml"),
    Asset("SOUND", "sound/common.fsb")
}

local prefabs = {"torchfire",}

local function turnon(inst)
	if not inst.components.fueled:IsEmpty() then
		if not inst.components.machine.ison then
			if inst.components.fueled then
				inst.components.fueled:StartConsuming()		
				
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
	local small_puff = SpawnPrefab("small_puff")
	small_puff.Transform:SetPosition(inst.Transform:GetWorldPosition() )	
				
			 inst:AddComponent("heater")
        inst.components.heater.heat = 60
        inst.components.heater.equippedheat = 60
			end
			inst.Light:Enable(true)		
			inst.AnimState:PlayAnimation("anim")
	        inst.AnimState:SetBuild("gear_armor")				
				
			assert( not inst.fire )
			
			if inst.components.equippable:IsEquipped() then
				inst.components.inventoryitem.owner.AnimState:OverrideSymbol("swap_body", "gear_armor", "swap_body")
			end
			inst.components.machine.ison = true

			inst.SoundEmitter:PlaySound("dontstarve/wilson/torch_swing")
			inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
			inst.SoundEmitter:PlaySound("dontstarve/wilson/torch_LP", "torch")			
		end
	end
end

local function turnoff(inst)
	if inst.components.fueled then
		inst.components.fueled:StopConsuming()		
		
		inst:RemoveComponent("heater")
	end

	inst.Light:Enable(false)
	inst.AnimState:PlayAnimation("anim")
	inst.AnimState:SetBuild("gear_armor2")	
	
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
	local small_puff = SpawnPrefab("small_puff")
	small_puff.Transform:SetPosition(inst.Transform:GetWorldPosition() )	

	if inst.components.equippable:IsEquipped() then
		inst.components.inventoryitem.owner.AnimState:OverrideSymbol("swap_body", "gear_armor2", "swap_body")
	end

	if inst.fire then
		inst.fire:Remove()
		inst.fire = nil
	end

	inst.components.machine.ison = false

	inst.SoundEmitter:KillSound("torch")
	inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")	
end

local function OnLoad(inst, data)
	if inst.components.machine and inst.components.machine.ison then
		inst.AnimState:PlayAnimation("anim")
		turnon(inst)
	else
		inst.AnimState:PlayAnimation("anim")
		turnoff(inst)
	end
end

local function ondropped(inst)
	turnoff(inst)
	turnon(inst)
end

local function onpickup(inst)
	turnon(inst)
end

local function onputininventory(inst)
	turnoff(inst)
end

local function onequip(inst, owner) 
	turnon(inst)
	
	owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
	local small_puff = SpawnPrefab("small_puff")
	small_puff.Transform:SetPosition(inst.Transform:GetWorldPosition() )		
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
	inst.Light:Enable(false)
	
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )	

	if inst.fire then
		inst.fire:Remove()
		inst.fire = nil
	end
end

local function nofuel(inst)
	local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
	if owner then
		owner:PushEvent("torchranout", {torch = inst})
	end

	turnoff(inst)
end

local function takefuel(inst)
	if inst.components.equippable and inst.components.equippable:IsEquipped() then
		turnon(inst)
	end
	inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
	local small_puff = SpawnPrefab("small_puff")
	small_puff.Transform:SetPosition(inst.Transform:GetWorldPosition() )	
end

local function fuelupdate(inst)
	local fuelpercent = inst.components.fueled:GetPercent()
	inst.Light:SetIntensity(Lerp(0.5, 0.8, fuelpercent))
	inst.Light:SetRadius(Lerp(2.0, 4.5, fuelpercent))
	inst.Light:SetFalloff(.9)
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()		
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("armor_slurtleshell")
	inst.AnimState:SetBuild("gear_armor")
	inst.AnimState:PlayAnimation("anim")

	inst:AddTag("light")

	inst:AddComponent("inspectable")
	
	inst:AddTag("irreplaceable")
	
	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_armor.xml"
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "gear_armor.tex" )	

	inst.components.inventoryitem:SetOnDroppedFn(ondropped)
	inst.components.inventoryitem:SetOnPutInInventoryFn(onputininventory)	

	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY	
    inst.components.equippable.walkspeedmult = 0.8		

	inst:AddComponent("fueled")
	inst.components.fueled:SetSectionCallback(function(newsection, oldsection)
		if newsection == 0 then
			if inst.components.lighter then
				inst:RemoveComponent("lighter")
				
			end
		elseif oldsection == 0 then
			if not inst.components.lighter then
				inst:AddComponent("lighter")
				inst.components.lighter.onlight = function()
local curfuel = inst.components.fueled:GetPercent()
inst.components.fueled:SetPercent(curfuel - 0.01)
end

			end
		end
	end)
	
	inst:AddComponent("machine")
	inst.components.machine.turnonfn = turnon
	inst.components.machine.turnofffn = turnoff
	inst.components.machine.cooldowntime = 0
	inst.components.machine.caninteractfn = function() return not inst.components.fueled:IsEmpty() end

	inst.components.fueled.fueltype = "BURNABLE"
	inst.components.fueled:InitializeFuelLevel(TUNING.LANTERN_LIGHTTIME * 0.5)
	inst.components.fueled:SetDepletedFn(nofuel)
	inst.components.fueled:SetUpdateFn(fuelupdate)
	inst.components.fueled.ontakefuelfn = takefuel
	inst.components.fueled.accepting = true

	inst.entity:AddLight()
    inst.Light:SetColour(220/255,209/255,50/255)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )		

	fuelupdate(inst)

	inst.components.equippable:SetOnEquip( onequip )
	inst.components.equippable:SetOnUnequip( onunequip ) 

	inst.OnLoad = OnLoad

	return inst
end

return Prefab( "common/inventory/gear_armor", fn, assets, prefabs)