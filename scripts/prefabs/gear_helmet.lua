
local assets=
{
	Asset("ANIM", "anim/gear_helmet.zip"),
	Asset("ATLAS", "images/inventoryimages/gear_helmet.xml"),
	Asset("IMAGE", "images/inventoryimages/gear_helmet.tex"),
}

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "gear_helmet", "swap_hat")
    inst:ListenForEvent("blocked", OnBlocked, owner)	
	owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
		
	   if owner.components.health then
	   owner.components.health.fire_damage_scale = 0.2	
       end			
end

local function onunequip(inst, owner) 
    inst:RemoveEventCallback("blocked", OnBlocked, owner)
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
    
    anim:SetBank("beehat")
    anim:SetBuild("gear_helmet")
    anim:PlayAnimation("anim")    
        
    inst:AddTag("metal")
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/metalarmour"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_helmet.xml"
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "gear_helmet.tex" )
		
    inst:AddComponent("armor")
    inst.components.armor:InitCondition(TUNING.ARMORWOOD, TUNING.ARMORMARBLE_ABSORPTION*0.737)		
		
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable.walkspeedmult = 0.8	
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    return inst
end

return Prefab( "common/inventory/gear_helmet", fn, assets) 
