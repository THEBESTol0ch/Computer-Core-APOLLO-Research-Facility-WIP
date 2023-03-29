-- Values
local BlackControlValue = game.ReplicatedStorage.GameValues.BlackControlValue
local FacilityLightingStatusValue = script.Parent.Parent.Values.FacilityLightingStatusValue
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
--

BlackControlValue.Changed:Connect(function()
	if BlackControlValue.Value == "IN" then
		DoLights("ON")
	elseif BlackControlValue.Value == "OUT" then
		DoLights("OFF")
	end
end)
