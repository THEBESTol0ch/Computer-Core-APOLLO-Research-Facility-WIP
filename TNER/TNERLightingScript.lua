-- Values
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
--

-- Items
local OfficesLighting = script.Parent.OfficesLighting
local ReactorChamberLighting = script.Parent.ReactorChamberLighting
--

-- Sounds
local TurningOnSystemsSound = workspace.TNERSoundEmitter.TurningOnSystemsSound
--

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		TurningOnSystemsSound:Play()
		for _, Lighting in pairs(OfficesLighting:GetChildren()) do
			for _, Item in pairs(Lighting:GetDescendants()) do
				if Item:IsA("PointLight") then
					Item.Enabled = true
				end
				if Item.Name == "Lamp" and Item:IsA("UnionOperation") then
					Item.Material = ("Neon")
				end
			end
			wait(1)
		end
		for _, BridgeLamp in pairs(ReactorChamberLighting.BridgeLighting:GetChildren()) do
			BridgeLamp.Lamp.PointLight.Enabled = true
		end
		for _, Item in pairs(ReactorChamberLighting.TNERFuse5Lighting:GetDescendants()) do
			if Item.Name == "Lamp" and Item:IsA("Part") or Item:IsA("UnionOperation") then
				Item.Material = ("Neon")
			elseif Item:IsA("PointLight") or Item:IsA("SpotLight") then
				Item.Enabled = true
			end
		end
		for Count = 1, 5, 1 do
			for _, Item in pairs(ReactorChamberLighting["SpotLights"..Count]:GetDescendants()) do
				if Item:IsA("SpotLight") then
					Item.Enabled = true
				end
				if Item.Name == "Light" and Item:IsA("Part") then
					Item.Material = ("Neon")
				end
				if Item.Name == "SpotLightSound" and Item:IsA("Sound") then
					Item:Play()
				end
				if Item:IsA("PointLight") then
					Item.Enabled = true
				end
			end
			wait(1)
		end
	end
end)
