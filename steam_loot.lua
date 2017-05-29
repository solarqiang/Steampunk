
local function AddBishopLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',1)
end

AddPrefabPostInit("bishop", AddBishopLoot)


local function AddMermhouseLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("mermhouse", AddMermhouseLoot)

local function AddEvergreenLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("evergreen", AddEvergreenLoot)

local function AddEvergreen_sparseLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("evergreen_sparse", AddEvergreen_sparseLoot)

local function AddRock1Loot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("rock1", AddRock1Loot)

local function AddRock_flintlessLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("rock_flintless", AddRock_flintlessLoot)

local function AddRock2Loot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("rock2", AddRock2Loot)

local function AddStalagmiteLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("stalagmite", AddStalagmiteLoot)

local function AddStalagmite_lowLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("stalagmite_low", AddStalagmite_lowLoot)

local function AddStalagmite_medLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("stalagmite_med", AddStalagmite_medLoot)

local function AddStalagmite_fullLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)	
end

AddPrefabPostInit("stalagmite_full", AddStalagmite_fullLoot)

local function AddStalagmite_tallLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)	
end

AddPrefabPostInit("stalagmite_tall", AddStalagmite_tallLoot)

local function AddStalagmite_tall_fullLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)	
end

AddPrefabPostInit("stalagmite_tall_full", AddStalagmite_tall_fullLoot)

local function AddStalagmite_tall_medLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("stalagmite_tall_med", AddStalagmite_tall_medLoot)

local function AddStalagmite_tall_lowLoot(prefab)
	prefab.components.lootdropper:AddChanceLoot('bulbo',0.02)
end

AddPrefabPostInit("stalagmite_tall_low", AddStalagmite_tall_lowLoot)