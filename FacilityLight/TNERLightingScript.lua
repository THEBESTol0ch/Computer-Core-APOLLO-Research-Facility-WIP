-- Values
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
local SecurityPanelStatusValue = workspace.TNERSecurityPanel.CPU.Values.SecurityPanelStatusValue
local FacilityLightingStatusValue = script.Parent.Parent.Values.FacilityLightingStatusValue
--

-- Items
local OfficesLighting = script.Parent.Parent.Parent.TNERLighting.OfficesLighting
local ReactorChamberLighting = script.Parent.Parent.Parent.TNERLighting.ReactorChamberLighting
--

-- Sounds
local TurningOnSystemsSound = workspace.TNERSoundEmitter.TurningOnSystemsSound
--

-- Logic
local SectorPowered = false
--

-- Functions
function DoLights(Class, Mode)
	if Mode == "ON" then
		if Class == "OfficesLighting" then
			for _, Group in (OfficesLighting:GetChildren()) do
				for _, Item in (Group:GetDescendants()) do
					if Item.Name == "Lamp" then Item.Material = ("Neon") end
					if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = true end
				end
				wait(1)
			end
		elseif Class == "BridgeLighting" then
			for _, Item in (ReactorChamberLighting.BridgeLighting:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("Neon") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = true end
			end
		elseif Class == "TNERFuse5Lighting" then
			for _, Item in (ReactorChamberLighting.TNERFuse5Lighting:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("Neon") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = true end
			end
		elseif Class == "SpotLights" then
			for _, Group in (ReactorChamberLighting.SpotLights:GetChildren()) do
				for _, Item in (Group:GetDescendants()) do
					if Item.Name == "Lamp" then Item.Material = ("Neon") end
					if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = true end
					if Item.Name == "SpotLightSound" and Item:IsA("Sound") then Item:Play() end
				end
				wait(1)
			end
		end
	elseif Mode == "OFF" then
		if Class == "OfficesLighting" then
			for _, Group in (OfficesLighting:GetChildren()) do
				for _, Item in (Group:GetDescendants()) do
					if Item.Name == "Lamp" then Item.Material = ("Metal") end
					if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = false end
				end
			end
		elseif Class == "BridgeLighting" then
			for _, Item in (ReactorChamberLighting.BridgeLighting:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("Metal") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = false end
			end
		elseif Class == "TNERFuse5Lighting" then
			for _, Item in (ReactorChamberLighting.TNERFuse5Lighting:GetDescendants()) do
				if Item.Name == "Lamp" then Item.Material = ("Metal") end
				if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = false end
			end
		elseif Class == "SpotLights" then
			for _, Group in (ReactorChamberLighting.SpotLights:GetChildren()) do
				for _, Item in (Group:GetDescendants()) do
					if Item.Name == "Lamp" then Item.Material = ("Metal") end
					if Item:IsA("PointLight") or Item:IsA("SpotLight") then Item.Enabled = false end
				end
			end
		end
	end
end
--

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		SectorPowered = true
		TurningOnSystemsSound:Play()
		DoLights("OfficesLighting", "ON")
		DoLights("BridgeLighting", "ON")
		DoLights("TNERFuse5Lighting", "ON")
		DoLights("SpotLights", "ON")
	end
end)

SecurityPanelStatusValue.Changed:Connect(function()
	if SecurityPanelStatusValue.Value == "ALERT" then
		DoLights("OfficesLighting", "OFF")
	elseif FacilityLightingStatusValue.Value == "ONLINE" or FacilityLightingStatusValue.Value == "POWER ON" then
		DoLights("OfficesLighting", "ON")
	end
end)

FacilityLightingStatusValue.Changed:Connect(function()
	if FacilityLightingStatusValue.Value == "SHUT DOWN" then
		wait(2)
		DoLights("OfficesLighting", "OFF")
		DoLights("TNERFuse5Lighting", "OFF")
		DoLights("SpotLights", "OFF")
	elseif FacilityLightingStatusValue.Value == "POWER ON" and SectorPowered == true then
		if SecurityPanelStatusValue.Value == "ONLINE" then DoLights("OfficesLighting", "ON") end
		DoLights("TNERFuse5Lighting", "ON")
		DoLights("SpotLights", "ON")
	end
end)
