
local assets=
{
	Asset("ANIM", "anim/gear_wings.zip"),
	Asset("ATLAS", "images/inventoryimages/gear_wings.xml"),
	Asset("IMAGE", "images/inventoryimages/gear_wings.tex"),
}

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
    owner.AnimState:OverrideSymbol("swap_body", "gear_wings", "swap_body")
	owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
		if inst.components.fueled then
		inst.components.fueled:StartConsuming()
	end
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
	local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
	if inst.components.fueled then
		inst.components.fueled:StopConsuming()
	end
end


local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    inst:AddTag("hat")
    
    anim:SetBank("armor_slurtleshell")
    anim:SetBuild("gear_wings")
    anim:PlayAnimation("anim")    
        
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_wings.xml"
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "gear_wings.tex" )
    
	inst:AddComponent("fueled")
    inst.components.fueled.fueltype = "USAGE"
    inst.components.fueled:InitializeFuelLevel(3840*1.5) --- 8 days * 1.5
    inst.components.fueled:SetDepletedFn(onperish)
		
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable.walkspeedmult = 1.15	
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    return inst
end

return Prefab( "common/inventory/gear_wings", fn, assets) 
