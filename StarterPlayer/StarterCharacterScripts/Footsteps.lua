local footsteps = {}
footsteps.sounds = {
	["Carpet"] = {
		"rbxassetid://9126748130",
		"rbxassetid://9126747861",
		"rbxassetid://9126747720",
		"rbxassetid://9126747529",
	},
	
	["Concrete"] = {
		"rbxassetid://9126746167",
		"rbxassetid://9126746098",
		"rbxassetid://9126745995",
		"rbxassetid://9126745877",
	},
	
	["Dirt"] = {
		"rbxassetid://9126744390",
		"rbxassetid://9126744718",
		"rbxassetid://9126744263",
		"rbxassetid://9126744157",
	},
	
	["Glass"] = {
		"rbxassetid://9126742971",
		"rbxassetid://9126742461",
		"rbxassetid://9126742875",
		"rbxassetid://9126742786",
	},
	
	["Grass"] = {
		"rbxassetid://9126742396",
		"rbxassetid://9126741427",
		"rbxassetid://9126742333",
		"rbxassetid://9126742215",
	},
	
	["Metal"] = {
		"rbxassetid://9126736470",
		"rbxassetid://9126734921",
		"rbxassetid://9126736274",
		"rbxassetid://9126736354",
	},
	
	["Sand"] = {
		"rbxassetid://9126733118",
		"rbxassetid://9126733408",
		"rbxassetid://9126733225",
	},
	
	["Snow"] = {
		"rbxassetid://9126732128", -- 11718221253
		"rbxassetid://9126731099", -- 11718221627
		"rbxassetid://9126732016", -- 11708681479
	},
	
	["Tile"] = {
		"rbxassetid://9126730713",
		"rbxassetid://9126730782",
		"rbxassetid://9126731037",
		"rbxassetid://9126730980",
	},
	["Wood"] = {
		"rbxassetid://9126931624",
		"rbxassetid://9126931515",
		"rbxassetid://9126931417",
		"rbxassetid://9126931322",
	}
}

footsteps.volume = {
	["Tile"] = 0.3,
	["Grass"] = 0.3,
}

footsteps.decay = {
	["Sand"] = 2,
	["Snow"] = 5,
}

footsteps.materialMap = {
	[Enum.Material.Fabric] = 		"Carpet",
	
	[Enum.Material.Slate] = 		"Concrete",
	[Enum.Material.Concrete] = 		"Concrete",
	[Enum.Material.Brick] = 		"Concrete",
	[Enum.Material.Cobblestone] = 	"Concrete",
	[Enum.Material.Sandstone] =		"Concrete",
	[Enum.Material.Rock] = 			"Concrete",
	[Enum.Material.Basalt] = 		"Concrete",
	[Enum.Material.CrackedLava] = 	"Concrete",
	[Enum.Material.Asphalt] = 		"Concrete",
	[Enum.Material.Limestone] = 	"Concrete",
	[Enum.Material.Pavement] = 		"Concrete",
	[Enum.Material.Pebble] = 		"Concrete",
	
	[Enum.Material.Ground] = 		"Dirt",
	[Enum.Material.Mud] = 			"Dirt",

	[Enum.Material.Grass] = 		"Grass",
	[Enum.Material.LeafyGrass] = 	"Grass",
	
	[Enum.Material.Sand] = 			"Sand",
	[Enum.Material.Salt] = 			"Sand",
	
	[Enum.Material.Snow] = 			"Snow",
	[Enum.Material.Glacier] = 		"Snow",
	
	[Enum.Material.Plastic] = 		"Tile",
	[Enum.Material.Marble] = 		"Tile",
	[Enum.Material.Granite] = 		"Tile",
	[Enum.Material.SmoothPlastic] = "Tile",

	[Enum.Material.Wood] = 			"Wood",
	[Enum.Material.WoodPlanks] = 	"Wood",
	
	[Enum.Material.CorrodedMetal] = "Metal",
	[Enum.Material.DiamondPlate] = 	"Metal",
	[Enum.Material.Metal] = 		"Metal",
	[Enum.Material.Foil] = 			"Metal",

	[Enum.Material.Ice] = 			"Glass",
	[Enum.Material.Glacier] = 		"Glass",
	[Enum.Material.Glass] = 		"Glass",
	[Enum.Material.Neon] = 			"Glass",
	[Enum.Material.ForceField] = 	"Glass",
}

return footsteps
