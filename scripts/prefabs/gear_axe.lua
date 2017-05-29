local assets =
{
	Asset("ANIM", "anim/gear_axe.zip"),
	Asset("ANIM", "anim/swap_gear_axe.zip"),
	Asset("IMAGE", "images/inventoryimages/gear_axe.tex"),	
	Asset("ATLAS", "images/inventoryimages/gear_axe.xml"),
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
    owner.AnimState:OverrideSymbol("swap_object", "swap_gear_axe", "swap_axe")
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
    
    anim:SetBank("axe")
    anim:SetBuild("gear_axe")
    anim:PlayAnimation("idle")
    
    inst:AddTag("sharp")
    
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(35)


    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(300)
    inst.components.finiteuses:SetUses(300)
    inst.components.finiteuses:SetOnFinished(onfinished)
    inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 0.7)

    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_axe.xml"	
	inst.entity:AddMiniMapEntity()	
	inst.MiniMapEntity:SetIcon( "gear_axe.tex" )		
    
    inst:AddComponent("equippable")

    inst.components.equippable:SetOnEquip( onequip )
    
    inst.components.equippable:SetOnUnequip( onunequip)
    
    return inst
end

return Prefab( "common/inventory/gear_axe", fn, assets)
