local assets=
{
	Asset("ANIM", "anim/gear_mace.zip"),
	Asset("ANIM", "anim/swap_gear_mace.zip"),
    Asset("ATLAS", "images/inventoryimages/gear_mace.xml"),
	Asset("IMAGE", "images/inventoryimages/gear_mace.tex"),		
}

local function onfinished(inst, owner)
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
    owner.AnimState:OverrideSymbol("swap_object", "swap_gear_mace", "swap_ham_bat")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")	
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal")
end
    
local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)
    
    anim:SetBank("ham_bat")
    anim:SetBuild("gear_mace")
    anim:PlayAnimation("idle")
    
    
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)


    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.HAMMER)
 
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_mace.xml"
	inst.entity:AddMiniMapEntity()	
	inst.MiniMapEntity:SetIcon( "gear_mace.tex" )	
	 
	inst:AddComponent("inspectable")
    
    inst:AddComponent("equippable")

    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(130)
    inst.components.finiteuses:SetUses(130)
	inst.components.finiteuses:SetConsumption(ACTIONS.HAMMER, 1.0)
    inst.components.finiteuses:SetOnFinished( onfinished )
    
    return inst
end


return Prefab( "common/inventory/gear_mace", fn, assets) 
