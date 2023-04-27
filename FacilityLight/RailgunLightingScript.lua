-- Values
local FacilityLightingStatusValue = script.Parent.Parent.Values.FacilityLightingStatusValue
--

-- Items
local RailgunLighting = script.Parent.Parent.Parent.RailgunLighting
--

FacilityLightingStatusValue.Changed:Connect(function()
	if FacilityLightingStatusValue.Value == "SHUT DOWN" then
		wait(2)
		for _, SpotLight in (RailgunLighting:GetChildren()) do
			SpotLight.MainSpotLight.Lamp.Material = ("Metal")
			SpotLight.MainSpotLight.Lamp.PointLight.Enabled = false
			SpotLight.ArtificalLight.PointLight.Enabled = false
		end
	elseif FacilityLightingStatusValue.Value == "POWER ON" then
		wait(2)
		for _, SpotLight in (RailgunLighting:GetChildren()) do
			SpotLight.MainSpotLight.Lamp.Material = ("Neon")
			SpotLight.MainSpotLight.Lamp.PointLight.Enabled = true
			SpotLight.ArtificalLight.PointLight.Enabled = true
			SpotLight.MainSpotLight.Lamp.SpotLightSound:Play()
			wait(1)
		end
	end
end)
