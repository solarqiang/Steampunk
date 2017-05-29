local assets=
{
	Asset("ANIM", "anim/gear_mask.zip"),
	Asset("ANIM", "anim/gear_mask2.zip"),	
	Asset("ATLAS", "images/inventoryimages/gear_mask.xml"),
	Asset("IMAGE", "images/inventoryimages/gear_mask.tex"),
}

local function ondrop(inst)
	local anim = inst.entity:AddAnimState()
    anim:SetBank("bushhat")
    anim:SetBuild("gear_mask2")
    anim:PlayAnimation("anim") 
end

local function healowner(inst, owner)
    if (owner.components.health and owner.components.health:IsHurt()) then
        owner.components.health:DoDelta(5*0.75,false,"redamulet")
    end
end

local function onperish (inst, owner)
    local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
    if owner then
        owner.SoundEmitter:PlaySound("dontstarve/wilson/use_break")
	    owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/hurt")
        local brokentool = SpawnPrefab("brokentool")
        brokentool.Transform:SetPosition(inst.Transform:GetWorldPosition() )
    inst:Remove()
	end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "gear_mask", "swap_hat")
	owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
	inst.task = inst:DoPeriodicTask(15, function() healowner(inst, owner) end)
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
		if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
end

local function onunequip(inst, owner) 
    if inst.task then inst.task:Cancel() inst.task = nil end
	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    inst:AddTag("hat")
    
    anim:SetBank("slurper")
    anim:SetBuild("gear_mask")
    anim:PlayAnimation("anim")    
        
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(ondrop)	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_mask.xml"
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "gear_mask.tex" )
    
	inst:AddComponent("fueled")
    inst.components.fueled.fueltype = "USAGE"
    inst.components.fueled:InitializeFuelLevel(3840*1.3) --- 8 days * 1.3
    inst.components.fueled:SetDepletedFn(onperish)
		
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable.dapperness = -TUNING.DAPPERNESS_LARGE
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    return inst
end

return Prefab( "common/inventory/gear_mask", fn, assets) 
