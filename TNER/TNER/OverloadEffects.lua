-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local Values = script.Parent.Parent.Values
local TNERStatusValue = Values.TNERStatusValue
local TNEROverloadStartUpTime = Values.TNEROverloadStartUpTime
local TNEROverloadDelayTime = Values.TNEROverloadDelayTime

local Lightning = script.Parent.Parent.Parent.Lightning
local PlasmaSizeValues = Lightning.Plasma.SizeValues
local BeamSizeValues = Lightning.Beams.SizeValues
--

-- Items
local Plasma1 = Lightning.Plasma.Plasma1
local Plasma2 = Lightning.Plasma.Plasma2
local Plasma3 = Lightning.Plasma.Plasma3
local DarkMatter1 = Lightning.Plasma.DarkMatter1
local DarkMatter2 = Lightning.Plasma.DarkMatter2
local Beams = Lightning.Beams.Beams
local BeamPositions = Lightning.Beams.Positions
local Ventilation = script.Parent.Parent.Parent.Ventilation
local Wires = script.Parent.Parent.Parent.Wires
--

-- Sounds
local OverloadStopSound = script.Parent.Parent.Parent.SoundEmitter.OverloadStopSound
--

-- Logic
local BeamsMode = 2
--

local DarkMatterAnimationSettingsStart = TweenInfo.new(
	5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local DarkMatterAnimationSettingsEnd = TweenInfo.new(
	5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local PlasmaAnimationSettingsStart = TweenInfo.new(
	40,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local PlasmaAnimationSettingsEnd = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local BeamAnimationSettingsStart = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local BeamAnimationSettingsEnd = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local WireAnimationSettings = TweenInfo.new(
	40,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local DarkMatter1PropertiesStart = {
	Transparency = 0.1
}
local DarkMatter1PropertiesEnd = {
	Transparency = 1
}
local DarkMatter2PropertiesStart = {
	Size = PlasmaSizeValues.DarkMatter2Size2.Value,
	Transparency = 0.6
}
local DarkMatter2PropertiesEnd = {
	Size = PlasmaSizeValues.DarkMatter2Size1.Value,
	Transparency = 1
}
local PlasmaLightPropertiesStart = {
	Brightness = 10
}
local PlasmaLightPropertiesEnd = {
	Brightness = 0
}
local PlasmaPropertiesStart = {
	Transparency = 0
}
local PlasmaPropertiesEnd = {
	Transparency = 1
}
local Plasma3PropertiesStart = {
	Size = PlasmaSizeValues.Plasma3Size2.Value,
	Transparency = 0
}
local Plasma3PropertiesEnd = {
	Size = PlasmaSizeValues.Plasma3Size1.Value,
	Transparency = 1
}
local BeamsPropertiesEnd = {
	Transparency = 1
}
local WiresPropertiesStart = {
	Color = Color3.fromRGB(170, 85, 0)
}
local WiresPropertiesEnd = {
	Color = Color3.fromRGB(27, 42, 53)
}

-- Functions
function DoSmoke(Color, Mode)
	for _, Descendant in pairs(Ventilation:GetDescendants()) do
		if Descendant.Name == (Color.."Smoke") then
			Descendant.Enabled = Mode
		end
	end
end
function DoBeam(Number)
	Beams["Beam"..Number].DeathTriggerScript.Enabled = true
	repeat
		Beams["Beam"..Number].Orientation = BeamPositions["BeamPos"..math.random(1, 17)].Orientation
		TweenService:Create(Beams["Beam"..Number], BeamAnimationSettingsStart, { Size = BeamSizeValues["BeamSizeValue"..BeamsMode].Value, Transparency = 0 }):Play()
		wait(0.1)
		TweenService:Create(Beams["Beam"..Number], BeamAnimationSettingsEnd, BeamsPropertiesEnd):Play()
		wait(0.1)
		Beams["Beam"..Number].Size = BeamSizeValues.BeamSizeValue1.Value
		wait(0.01)
	until TNERStatusValue.Value == "SHUT DOWN"
	Beams["Beam"..Number].DeathTriggerScript.Enabled = false
end
--

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then wait(TNEROverloadDelayTime.Value + TNEROverloadStartUpTime.Value) end
	if TNERStatusValue.Value == "OVERLOAD" then
		for _, Item in pairs(Wires:GetDescendants()) do
			if Item.Name == "WirePart" then
				Item.Material = ("Neon")
				TweenService:Create(Item, WireAnimationSettings, WiresPropertiesStart):Play()
			elseif Item.Name == "Smoke" then
				Item.Enabled = true
			end
		end
	end
	if TNERStatusValue.Value == "OVERLOAD" then TweenService:Create(Plasma1, PlasmaAnimationSettingsStart, PlasmaPropertiesStart):Play() end
	if TNERStatusValue.Value == "OVERLOAD" then wait(7) end
	if TNERStatusValue.Value == "OVERLOAD" then TweenService:Create(Plasma2, PlasmaAnimationSettingsStart, PlasmaPropertiesStart):Play() end
	if TNERStatusValue.Value == "OVERLOAD" then wait(10) end
	if TNERStatusValue.Value == "OVERLOAD" then TweenService:Create(Plasma3, PlasmaAnimationSettingsStart, Plasma3PropertiesStart):Play() end
	if TNERStatusValue.Value == "OVERLOAD" then TweenService:Create(Plasma3.PointLight, PlasmaAnimationSettingsStart, PlasmaLightPropertiesStart):Play() end
	if TNERStatusValue.Value == "OVERLOAD" then wait(30) end
	if TNERStatusValue.Value == "OVERLOAD" then BeamsMode = 3 end
	if TNERStatusValue.Value == "OVERLOAD" then DoSmoke("Black", true) end
	if TNERStatusValue.Value == "OVERLOAD" then wait(16) end
	if TNERStatusValue.Value == "OVERLOAD" then BeamsMode = 4 end
	if TNERStatusValue.Value == "OVERLOAD" then TweenService:Create(DarkMatter1, DarkMatterAnimationSettingsStart, DarkMatter1PropertiesStart):Play() end
	if TNERStatusValue.Value == "OVERLOAD" then TweenService:Create(DarkMatter2, DarkMatterAnimationSettingsStart, DarkMatter2PropertiesStart):Play() end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(26.5)
		DoBeam(1)
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(30.123)
		DoBeam(2)
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(34.602)
		DoBeam(3)
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(37.45)
		DoBeam(4)
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(45.560)
		DoBeam(5)
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(52.1)
		DoBeam(6)
	end
end)

OverloadStopSound.Changed:Connect(function()
	if OverloadStopSound.IsPlaying == true then
		for _, Item in pairs(Wires:GetDescendants()) do
			if Item.Name == "WirePart" then
				TweenService:Create(Item, WireAnimationSettings, WiresPropertiesEnd):Play()
			end
		end
		TweenService:Create(Plasma1, PlasmaAnimationSettingsEnd, PlasmaPropertiesEnd):Play()
		TweenService:Create(Plasma2, PlasmaAnimationSettingsEnd, PlasmaPropertiesEnd):Play()
		TweenService:Create(Plasma3, PlasmaAnimationSettingsEnd, Plasma3PropertiesEnd):Play()
		TweenService:Create(Plasma3.PointLight, PlasmaAnimationSettingsEnd, PlasmaLightPropertiesEnd):Play()
		TweenService:Create(DarkMatter1, DarkMatterAnimationSettingsEnd, DarkMatter1PropertiesEnd):Play()
		TweenService:Create(DarkMatter2, DarkMatterAnimationSettingsEnd, DarkMatter2PropertiesEnd):Play()
		BeamsMode = 2
		wait(40)
		for _, Item in pairs(Wires:GetDescendants()) do
			if Item.Name == "WirePart" then
				Item.Material = ("SmoothPlastic")
			elseif Item.Name == "Smoke" then
				Item.Enabled = false
			end
		end
	end
end)
