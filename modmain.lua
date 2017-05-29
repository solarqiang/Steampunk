local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

local require = GLOBAL.require
require "behaviours/doaction"

--- List of all prefabs
PrefabFiles = {"gear_axe","gear_mace","sparks2","gear_hat","gear_mask","gear_armor","gear_helmet","gear_wings","sentinel","ws_03","bulbo","gear_torch",}

--- List of all assets
Assets = {
    Asset("ATLAS", "images/inventoryimages/gear_axe.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_axe.tex"),
	
    Asset("ATLAS", "images/inventoryimages/gear_mace.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_mace.tex"),	
	
    Asset("ATLAS", "images/inventoryimages/gear_hat.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_hat.tex"),	
	
    Asset("ATLAS", "images/inventoryimages/gear_mask.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_mask.tex"),	
	
    Asset("ATLAS", "images/inventoryimages/gear_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_armor.tex"),	

    Asset("ATLAS", "images/inventoryimages/gear_helmet.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_helmet.tex"),	

    Asset("ATLAS", "images/inventoryimages/gear_wings.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_wings.tex"),	

    Asset("ATLAS", "images/inventoryimages/sentinel.xml"),	
	Asset("IMAGE", "images/inventoryimages/sentinel.tex"),
	
	Asset("ATLAS", "images/inventoryimages/gear_torch.xml"),	
	Asset("IMAGE", "images/inventoryimages/gear_torch.tex"),	
	
	Asset("ATLAS", "images/inventoryimages/ws_03.xml"),	
	Asset("IMAGE", "images/inventoryimages/ws_03.tex"),
	
	Asset("ATLAS", "images/inventoryimages/gear_tab.xml"),
	
    Asset( "ATLAS", "images/inventoryimages/gears.xml" ),	
}


--- Strings for items
GLOBAL.STRINGS.NAMES.GEAR_AXE = "Gear axe"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_AXE = "Make even better axe - gear axe!"

GLOBAL.STRINGS.NAMES.GEAR_MACE = "Gear mace"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_MACE = "Heavy and lethal mace!"

GLOBAL.STRINGS.NAMES.GEAR_HAT = "Gear hat"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_HAT = "Fabulous and elegant hat!"

GLOBAL.STRINGS.NAMES.GEAR_MASK = "Gear mask"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_MASK = "Evil doctor mask, just for you!"

GLOBAL.STRINGS.NAMES.GEAR_ARMOR = "Gear stove"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_ARMOR = "Heavy and mobile fireplace!"

GLOBAL.STRINGS.NAMES.GEAR_HELMET = "Gear helmet"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_HELMET = "Massive welder's mask!"

GLOBAL.STRINGS.NAMES.GEAR_WINGS = "Gear wings"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_WINGS = "Flightless, but makes you run faster!"

GLOBAL.STRINGS.NAMES.SENTINEL = "WS-01"
GLOBAL.STRINGS.RECIPE_DESC.SENTINEL = "Make your own gear minions!"

GLOBAL.STRINGS.NAMES.WS_03 = "WS-03"
GLOBAL.STRINGS.RECIPE_DESC.WS_03 = "Powerful servant could be yours!"

GLOBAL.STRINGS.NAMES.GEAR_TORCH = "Gear torch"
GLOBAL.STRINGS.RECIPE_DESC.GEAR_TORCH = "Fancy mix of torch and lightbulb."

GLOBAL.STRINGS.NAMES.BULBO = "Bulber"

GLOBAL.STRINGS.NAMES.GEAR_TAB = "GEARS"

STRINGS.TABS.GEAR_TAB = "Gears"
GLOBAL.RECIPETABS['GEAR_TAB'] = {str = "GEAR_TAB", sort=1, icon = "gear_tab.tex", icon_atlas = "images/inventoryimages/gear_tab.xml"}


GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_AXE = "Time for chopping!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_MACE = "That should be very useful!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_HAT = "I love this hat!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_MASK = "It's very, very creepy."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_ARMOR = "It's quite heavy, but I will be heated!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_HELMET = "There is a name on it.. Kovac."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_WINGS = "Now I only need wind."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENTINEL = "He was produced via machine."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WS_03 = "I'm lucky that he is on my side."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BULBO = "I never thought that these creatures are hiding here."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEAR_TORCH = "I used lightbulb in a right way."

--- Willow - items strings
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_AXE = "It's sharp and cold."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_MACE = "Now I need find a target."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_HAT = "I would love a lightbulb on top of this hat."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_MASK = "It's spooky. I like it."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_ARMOR = "I love to just sit down and look at this furnace."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_HELMET = "It can stand between me and the fire?!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_WINGS = "I could burn this for better efficiency. No I can't."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.SENTINEL = "He will help me in fight."
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.WS_03 = "I made something interesting!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.BULBO = "Stop turning off this light! I want to hug you!"
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.GEAR_TORCH = "High amount of light trapped in a small bulb."

--- Wolfgang - items strings
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_AXE = "Pretty chop!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_MACE = "Wolfgang is stronger now!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_HAT = "Pretty hat for mighty Wolfgang."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_MASK = "It's scary. Really scary."
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_ARMOR = "Carrying this is a good workout!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_HELMET = "Wolfgang is unstoppable now!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_WINGS = "It won't lift Wolfgang for sure!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SENTINEL = "You are so weak! Stand back!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.WS_03 = "Mighty robot! Just as Wolfgang!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BULBO = "I could crush him with one finger!"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GEAR_TORCH = "This will help me to avoid dark."

--- Wendy - items strings
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_AXE = "Murdering trees was never that fancy as it's now."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_MACE = "I can rule the world now.. or a tiny part at least."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_HAT = "I look like a gentlegirl."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_MASK = "Darkly-beautiful mask created with a dead crows."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_ARMOR = "It looks so ominous. I love it!"
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_HELMET = "I feel like my head falls to the ground."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_WINGS = "I wish they could be made from bones."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.SENTINEL = "I hope Abigail won't be jealous."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.WS_03 = "The Rider of death."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.BULBO = "This tiny spider got electrified."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.GEAR_TORCH = "It's standing between me and the darkness."

--- WX-78 - items strings
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_AXE = "LIVING MATTER HAS NO CHANCE."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_MACE = "SMASHING DEVICE READY."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_HAT = "ELEGANT HEAD COVERING."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_MASK = "DRAINS SANITY METER, RAISES HEALTH METER."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_ARMOR = "HEAVY LIGHT SOURCE."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_HELMET = "HIGH FIRE RESISTANCE FUNCTION READY."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_WINGS = "OBJECT ALLOWS TO INCREASE SPEED."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.SENTINEL = "GUARDIAN DROID READY."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.WS_03 = "MECHANICAL DESTROYER READY FOR ACTION."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.BULBO = "ELECTRICAL INSECT IS IN RANGE."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.GEAR_TORCH = "NEW WAY TO USE A LIGHTBULB."

--- Wickerbottom - items strings
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_AXE = "Special type of axe, made of gears."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_MACE = "This fancy weapon is not for cloddish workers."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_HAT = "At least I managed to keep the style."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_MASK = "I'm not convinced to that kind of healing."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_ARMOR = "It provides heat, and good amount of light."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_HELMET = "This protection seems to be way to heavy."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_WINGS = "How practical this is."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SENTINEL = "Not so complicated device, but it's enough for me."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.WS_03 = "I created a strong mechanical device for protection."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BULBO = "An interesting way to use light bulbs."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GEAR_TORCH = "Is it organic or not?"

--- Woodie - items strings
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_AXE = "It's almost as good as my Lucy."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_MACE = "Made of precious wood.. and some junk."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_HAT = "It looks very good I must say."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_MASK = "I hate that mask. It looks like a nasty bird."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_ARMOR = "Ha! Now I can chop tress in the night."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_HELMET = "This will protect me against splinters while chopping trees."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_WINGS = "I probably look dumb while wearing this."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.SENTINEL = "He will protect me, so I can chop."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.WS_03 = "He can chop trees for me?!"
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.BULBO = "It's scary to cut trees, if something like this is sitting on them!"
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.GEAR_TORCH = "Not so chewy anymore."

--- Waxwell - items strings
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_AXE = "Using this type of axe is less humiliating."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_MACE = "I hope it can hit hard."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_HAT = "I will look more captivating than usual."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_MASK = "It suits great to my humble personality. Just joking."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_ARMOR = "Too bad I can't convince someone to carry this for me."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_HELMET = "Sometimes you have to sacrifice style.. for a while."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_WINGS = "I can't believe that I created this."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SENTINEL = "I could create something more spectacular."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.WS_03 = "Now that's a serious invention!"
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BULBO = "I almost forgot about this pity creation."
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GEAR_TORCH = "Charlie hates that light."

	if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then 

--- Wigfrid - items strings
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_AXE = "Stylish axe for destruction!"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_MACE = "It looks weird, but hits good."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_HAT = "That supposed to satisfy me?"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_MASK = "I should relies on strength, not on magic."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_ARMOR = "This will give me warm during the expedition."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_HELMET = "It's hard to perform attacks using this heavy helmet."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_WINGS = "I can fly straight to Valhalla!"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SENTINEL = "He's my slave now!"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.WS_03 = "Mighty spider is on my side!"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BULBO = "You are no match for me!"
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GEAR_TORCH = "It's glowing!"

--- Webber - items strings
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_AXE = "We can chop tress with style."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_MACE = "This is too much complicated for us."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_HAT = "Father would love that hat!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_MASK = "Half spider, half crow."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_ARMOR = "We can take heat with us!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_HELMET = "We are protected. We are slow."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_WINGS = "Best way to create wings - Use silk."
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.SENTINEL = "He's so similar to us!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.WS_03 = "We made a perfect friend!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.BULBO = "Just like spider, but with a bulb on the head!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.GEAR_TORCH = "A true friend!"
	end

--- All recipes

local gear_axerecipe = Recipe( "gear_axe", { Ingredient("axe", 1),Ingredient("gears", 1),Ingredient("flint", 3) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_ONE)
gear_axerecipe.atlas = "images/inventoryimages/gear_axe.xml"

local gear_torchrecipe = Recipe( "gear_torch", { Ingredient("lightbulb", 1),Ingredient("gears", 1),Ingredient("twigs", 4) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_ONE)
gear_torchrecipe.atlas = "images/inventoryimages/gear_torch.xml"

local gear_macerecipe = Recipe( "gear_mace", { Ingredient("gears", 3),Ingredient("boards", 2) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_macerecipe.atlas = "images/inventoryimages/gear_mace.xml"

local gear_hatrecipe = Recipe( "gear_hat", { Ingredient("tophat", 1),Ingredient("gears", 1),Ingredient("goldnugget", 2) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_hatrecipe.atlas = "images/inventoryimages/gear_hat.xml"

local gear_maskrecipe = Recipe( "gear_mask", { Ingredient("feather_crow", 12),Ingredient("gears", 2),Ingredient("silk", 3) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_maskrecipe.atlas = "images/inventoryimages/gear_mask.xml"

local gear_armorrecipe = Recipe( "gear_armor", { Ingredient("armorwood", 1),Ingredient("gears", 4),Ingredient("charcoal", 5) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_armorrecipe.atlas = "images/inventoryimages/gear_armor.xml"

local gear_helmetrecipe = Recipe( "gear_helmet", { Ingredient("beehat", 1),Ingredient("gears", 3),Ingredient("marble", 3) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_helmetrecipe.atlas = "images/inventoryimages/gear_helmet.xml"

local gear_wingsrecipe = Recipe( "gear_wings", { Ingredient("silk", 5),Ingredient("gears", 2),Ingredient("boards", 3) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_wingsrecipe.atlas = "images/inventoryimages/gear_wings.xml"

local sentinelerecipe = Recipe( "sentinel", { Ingredient("gears", 1),Ingredient("boards", 2),Ingredient("flint", 4) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
sentinelerecipe.atlas = "images/inventoryimages/sentinel.xml"

local ws_03recipe = Recipe( "ws_03", { Ingredient("spiderhat",1), Ingredient("gears", 6),Ingredient("boards", 6) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
ws_03recipe.atlas = "images/inventoryimages/ws_03.xml"


modimport "steam_loot.lua"

--- All minimap atlases

function AddMap(inst)
        local minimap = inst.entity:AddMiniMapEntity()
        minimap:SetIcon( inst.prefab .. ".tex" )
end

AddPrefabPostInit("gears", AddMap)

AddMinimapAtlas("images/inventoryimages/gears.xml")
AddMinimapAtlas("images/inventoryimages/gear_axe.xml")
AddMinimapAtlas("images/inventoryimages/gear_mace.xml")
AddMinimapAtlas("images/inventoryimages/gear_hat.xml")
AddMinimapAtlas("images/inventoryimages/gear_mask.xml")
AddMinimapAtlas("images/inventoryimages/gear_armor.xml")
AddMinimapAtlas("images/inventoryimages/gear_helmet.xml")
AddMinimapAtlas("images/inventoryimages/gear_wings.xml")
AddMinimapAtlas("images/inventoryimages/sentinel.xml")
AddMinimapAtlas("images/inventoryimages/ws_03.xml")
AddMinimapAtlas("images/inventoryimages/gear_torch.xml")

--- Trade for WS's
function addtradablecomponenttoprefab(inst)
	if not inst.components.tradable then
		inst:AddComponent("tradable")
	end
end	 

AddPrefabPostInit("gears", addtradablecomponenttoprefab)

local function Sentinel( inst )

	inst:DoTaskInTime( 0, function() 
		local controls = inst.HUD.controls
		local Sentinel_Health = require "widgets/sentinel_health"
		controls.petStatus = controls:AddChild(Sentinel_Health(inst))
		controls.petStatus:SetPosition(0, -250, 0)
	end)

end

AddSimPostInit( Sentinel )

function lootdropperpostinit(inst)

	inst.GenerateLoot = function(self)
    local loots = {}
    
    if self.numrandomloot and math.random() <= (self.chancerandomloot or 1) then
		for k = 1, self.numrandomloot do
		    local loot = self:PickRandomLoot()
		    if loot then
			    table.insert(loots, loot)
			end
		end
	end
    
    if self.chanceloot then
		for k,v in pairs(self.chanceloot) do
			if math.random() < v.chance then
				table.insert(loots, v.prefab)
				self.droppingchanceloot = true
			end
		end
	end

    if self.chanceloottable then
    	local loot_table = GLOBAL.LootTables[self.chanceloottable]
    	if loot_table then
    		for i, entry in ipairs(loot_table) do
    			local prefab = entry[1]
    			local chance = entry[2]    			
				if math.random() <= chance then
					table.insert(loots, prefab)
					self.droppingchanceloot = true
				end
			end
		end
	end

	if not self.droppingchanceloot and self.ifnotchanceloot then
		self.inst:PushEvent("ifnotchanceloot")
		for k,v in pairs(self.ifnotchanceloot) do
			table.insert(loots, v.prefab)
		end
	end


    
    if self.loot then
		for k,v in ipairs(self.loot) do
			table.insert(loots, v)
		end
	end
	
	local recipe = GLOBAL.GetRecipe(self.inst.prefab)

	if recipe and not self.inst.components.norecipelootdrop then
	

		
		local percent = 1

		if self.inst.components.finiteuses then
			percent = self.inst.components.finiteuses:GetPercent()
		end

		for k,v in ipairs(recipe.ingredients) do
			local amt = math.ceil( (v.amount * TUNING.HAMMER_LOOT_PERCENT) * percent)
			for n = 1, amt do
				table.insert(loots, v.type)
			end
		end
	end
    
    return loots

    end


end	   
	   
AddComponentPostInit("lootdropper", lootdropperpostinit)

function HF_addtradablecomponenttoprefab(inst)
	if not inst.components.tradable then
		inst:AddComponent("tradable")
	end
end	 

AddPrefabPostInit("gear_axe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_mace", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_torch", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_helmet", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_mask", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_hat", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_armor", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_wings", HF_addtradablecomponenttoprefab)