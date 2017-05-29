local assets=
{
	Asset("ANIM", "anim/gear_torch_off.zip"),
	Asset("ANIM", "anim/gear_torch_on.zip"),
	Asset("ANIM", "anim/swap_gear_torch_on.zip"),	
	Asset("ATLAS", "images/inventoryimages/gear_torch.xml"),
    Asset("SOUND", "sound/common.fsb")
}

local function turnon(inst)
	if not inst.components.fueled:IsEmpty() then
		if not inst.components.machine.ison then
			if inst.components.fueled then
				inst.components.fueled:StartConsuming()	
	inst.AnimState:SetBuild("gear_torch_on")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")	
	inst.Light:Enable(true)	
	inst.Light:SetRadius(2.75)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(.85)
	
	inst.components.machine.ison = true
	        end
	    end
	end
end

local function turnoff(inst)
	inst.AnimState:SetBuild("gear_torch_off")
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")	
	inst.Light:Enable(false)
	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end	
	inst.components.machine.ison = false
end

local function onperish (inst, owner)
	inst.Light:Enable(false)
	inst.components.lootdropper:SpawnLootPrefab("twigs")
	inst.components.lootdropper:SpawnLootPrefab("twigs")	
	inst.SoundEmitter:PlaySound("dontstarve/wilson/use_break")
	inst:Remove()	
	local brokentool = SpawnPrefab("brokentool")
    brokentool.Transform:SetPosition(inst.Transform:GetWorldPosition() )
    local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
    if owner then
        local brokentool = SpawnPrefab("brokentool")
        brokentool.Transform:SetPosition(inst.Transform:GetWorldPosition() )
    inst:Remove()
	end		
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_gear_torch_on", "swap_umbrella")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")	
	
	turnon(inst)
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )

end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
	turnoff(inst)	
end

local function ondropped(inst)
	inst.AnimState:SetBuild("gear_torch_on")
	turnon(inst)
	inst.Light:Enable(true)	
	if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end
end

local function onputininventory(inst)
	turnoff(inst)
	inst.Light:Enable(false)
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()		
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("umbrella")
	inst.AnimState:SetBuild("gear_torch_on")
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("light")

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_torch.xml"
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "gear_torch.tex" )	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
	inst.components.inventoryitem:SetOnPutInInventoryFn(onputininventory)
	
	inst:AddComponent("equippable")		
	
    inst:AddComponent("lootdropper")
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(8)
	
	inst:AddComponent("machine")
	inst.components.machine.turnonfn = turnon
	inst.components.machine.turnofffn = turnoff
	inst.components.machine.cooldowntime = 0
	inst.components.machine.caninteractfn = function() return not inst.components.fueled:IsEmpty() end	
	
	inst:AddComponent("fueled")
    inst.components.fueled:InitializeFuelLevel(3*480) -- 3 days
    inst.components.fueled:SetDepletedFn(onperish)

	inst.entity:AddLight()
	inst.Light:SetRadius(1.8)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(.8)
    inst.Light:SetColour(237/255, 237/255, 209/255)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )


	inst.components.equippable:SetOnEquip( onequip )
	inst.components.equippable:SetOnUnequip( onunequip ) 

	return inst
end

return Prefab( "common/inventory/gear_torch", fn, assets)