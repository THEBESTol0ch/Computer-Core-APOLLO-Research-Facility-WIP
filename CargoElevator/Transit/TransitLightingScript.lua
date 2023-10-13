-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local TransitLightingModeValue = game.Workspace.FacilityTransitSystem.CPU.Values.TransitLightingModeValue
--

-- Items
local TransitLamps = script.Parent.Parent.Parent.Interior.TransitLamps
local TransitSmallLamps = script.Parent.Parent.Parent.Interior.TransitSmallLamps
--

local GradientAnimationSettings = TweenInfo.new(
	5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local ColorPropertiesLampFrame = {
	Color = Color3.fromRGB(248, 248, 248);
}
local ColorPropertiesLampLight = {
	Color = Color3.fromRGB(255, 222, 156);
}
local ColorPropertiesSmallLampFrame = {
	Color = Color3.fromRGB(188, 155, 93);
}
local ColorPropertiesSmallLampLight = {
	Color = Color3.fromRGB(163, 95, 0);
}
local ColorProperties1 = {
	Color = Color3.fromRGB(85, 170, 255);
}
local ColorProperties2 = {
	Color = Color3.fromRGB(0, 85, 255);
}
local ColorProperties3 = {
	Color = Color3.fromRGB(85, 0, 255);
}
local ColorProperties4 = {
	Color = Color3.fromRGB(203, 0, 203);
}
local ColorProperties5 = {
	Color = Color3.fromRGB(194, 0, 0);
}
local ColorProperties6 = {
	Color = Color3.fromRGB(231, 223, 5);
}
local ColorProperties7 = {
	Color = Color3.fromRGB(85, 170, 255);
}
local ColorProperties8 = {
	Color = Color3.fromRGB(0, 255, 0);
}
local ColorProperties = {
	[1] = ColorProperties1,
	[2] = ColorProperties2,
	[3] = ColorProperties3,
	[4] = ColorProperties4,
	[5] = ColorProperties5,
	[6] = ColorProperties6,
	[7] = ColorProperties7,
	[8] = ColorProperties8,
}

TransitLightingModeValue.Changed:Connect(function()
	if TransitLightingModeValue.Value == "RGB" then
		local TransitLampNumber = 1
		local TransitSmallLampNumber = 3
		repeat
			if TransitLightingModeValue.Value == "RGB" then
				for _, TransitLamp in pairs(TransitLamps:GetChildren()) do
					TweenService:Create(TransitLamp.Lamp, GradientAnimationSettings, ColorProperties[TransitLampNumber]):Play()
					TweenService:Create(TransitLamp.LightEmitter.SpotLight, GradientAnimationSettings, ColorProperties[TransitLampNumber]):Play()
				end
				for _, TransitSmallLamp in pairs(TransitSmallLamps:GetChildren()) do
					TweenService:Create(TransitSmallLamp.Lamp, GradientAnimationSettings, ColorProperties[TransitSmallLampNumber]):Play()
					TweenService:Create(TransitSmallLamp.Lamp.PointLight, GradientAnimationSettings, ColorProperties[TransitSmallLampNumber]):Play()
				end
				if TransitLampNumber == 8 then
					TransitLampNumber = 1
				else
					TransitLampNumber = TransitLampNumber + 1
				end
				if TransitSmallLampNumber == 8 then
					TransitSmallLampNumber = 1
				else
					TransitSmallLampNumber = TransitSmallLampNumber + 1
				end
			end
			wait(5)
		until TransitLightingModeValue.Value == "STANDARD"
		for _, TransitLamp in pairs(TransitLamps:GetChildren()) do
			TweenService:Create(TransitLamp.Lamp, GradientAnimationSettings, ColorPropertiesLampFrame):Play()
			TweenService:Create(TransitLamp.LightEmitter.SpotLight, GradientAnimationSettings, ColorPropertiesLampLight):Play()
		end
		for _, TransitSmallLamp in pairs(TransitSmallLamps:GetChildren()) do
			TweenService:Create(TransitSmallLamp.Lamp, GradientAnimationSettings, ColorPropertiesSmallLampFrame):Play()
			TweenService:Create(TransitSmallLamp.Lamp.PointLight, GradientAnimationSettings, ColorPropertiesSmallLampLight):Play()
		end
		wait(5)
	end
end)
