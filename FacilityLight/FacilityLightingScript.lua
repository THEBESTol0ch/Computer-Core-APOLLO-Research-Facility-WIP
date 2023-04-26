-- Values
local BlackControlValue = game.ReplicatedStorage.GameValues.BlackControlValue
local FacilityLightingStatusValue = script.Parent.Parent.Values.FacilityLightingStatusValue

local SwitchLeverValue = workspace.FacilityLightSwitchLever.CPU.Values.SwitchLeverValue
local GeneratorsStatusValue = workspace.FacilityDieselsGenerators.CPU.Values.GeneratorsStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
--
-- Values
local BlackControlValue = game.ReplicatedStorage.GameValues.BlackControlValue
local FacilityLightingStatusValue = script.Parent.Parent.Values.FacilityLightingStatusValue

local SwitchLeverValue = workspace.FacilityLightSwitchLever.CPU.Values.SwitchLeverValue
local GeneratorsStatusValue = workspace.FacilityDieselsGenerators.CPU.Values.GeneratorsStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
--

-- Sounds
local BlackoutSound = game.SoundService.BlackoutSound
local BlackinSound = game.SoundService.BlackinSound
--

-- Items
local FacilityLighting = script.Parent.Parent.Parent.FacilityLighting
--

-- Functions
function DoLights(Mode)
	if Mode == "ON" then
		FacilityLightingStatusValue.Value = "POWER ON"
		BlackinSound:Play()
		for _, Group in (FacilityLighting:GetChildren()) do
			for _, Item in (Group:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("Neon") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = true end
			end
			wait(0.1)
		end
		FacilityLightingStatusValue.Value = "ONLINE"
	elseif Mode == "OFF" then
		FacilityLightingStatusValue.Value = "SHUT DOWN"
		BlackoutSound:Play()
		for _, Group in (FacilityLighting:GetChildren()) do
			for _, Item in (Group:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("SmoothPlastic") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = false end
			end
			wait(0.1)
		end
		FacilityLightingStatusValue.Value = "OFFLINE"
	end
end

function DoCheck()
	if (GeneratorsStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "ONLINE" or CentralReactorCoreStatusValue.Value == "ONLINE") and SwitchLeverValue.Value == "UP" then
		BlackControlValue.Value = "IN"
	elseif (GeneratorsStatusValue.Value == "OFFLINE" and (TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "MAINTENANCE MODE" or TNERStatusValue.Value == "COOLING") and (CentralReactorCoreStatusValue.Value == "OFFLINE" or CentralReactorCoreStatusValue.Value == "ERROR")) or SwitchLeverValue.Value == "DOWN" then
		BlackControlValue.Value = "OUT"
	end
end
--

SwitchLeverValue.Changed:Connect(function()
	DoCheck()
end)
GeneratorsStatusValue.Changed:Connect(function()
	DoCheck()
end)
TNERStatusValue.Changed:Connect(function()
	DoCheck()
end)
CentralReactorCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)

BlackControlValue.Changed:Connect(function()
	if BlackControlValue.Value == "IN" then
		DoLights("ON")
	elseif BlackControlValue.Value == "OUT" then
		DoLights("OFF")
	end
end)
-- Sounds
local BlackoutSound = game.SoundService.BlackoutSound
local BlackinSound = game.SoundService.BlackinSound
--

-- Items
local FacilityLighting = script.Parent.Parent.Parent.FacilityLighting
--

-- Functions
function DoLights(Mode)
	if Mode == "ON" then
		FacilityLightingStatusValue.Value = "POWER ON"
		BlackinSound:Play()
		for _, Group in (FacilityLighting:GetChildren()) do
			for _, Item in (Group:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("Neon") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = true end
			end
			wait(0.1)
		end
		FacilityLightingStatusValue.Value = "ONLINE"
	elseif Mode == "OFF" then
		FacilityLightingStatusValue.Value = "SHUT DOWN"
		BlackoutSound:Play()
		for _, Group in (FacilityLighting:GetChildren()) do
			for _, Item in (Group:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("SmoothPlastic") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = false end
			end
			wait(0.1)
		end
		FacilityLightingStatusValue.Value = "OFFLINE"
	end
end

function DoCheck()
	if (GeneratorsStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "ONLINE" or CentralReactorCoreStatusValue.Value == "ONLINE") and SwitchLeverValue.Value == "UP" then
		BlackControlValue.Value = "IN"
	elseif (GeneratorsStatusValue.Value == "OFFLINE" and (TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "MAINTENANCE MODE" or TNERStatusValue.Value == "COOLING") and CentralReactorCoreStatusValue.Value == "OFFLINE") or SwitchLeverValue.Value == "DOWN" then
		BlackControlValue.Value = "OUT"
	end
end
--

SwitchLeverValue.Changed:Connect(function()
	DoCheck()
end)
GeneratorsStatusValue.Changed:Connect(function()
	DoCheck()
end)
TNERStatusValue.Changed:Connect(function()
	DoCheck()
end)
CentralReactorCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)

BlackControlValue.Changed:Connect(function()
	if BlackControlValue.Value == "IN" then
		DoLights("ON")
	elseif BlackControlValue.Value == "OUT" then
		DoLights("OFF")
	end
end)
