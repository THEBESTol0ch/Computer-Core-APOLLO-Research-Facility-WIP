-- Values
local FacilityLightingStatusValue = script.Parent.Parent.Values.FacilityLightingStatusValue
local SecurityPanelStatusValue = workspace.TNERSecurityPanel.CPU.Values.SecurityPanelStatusValue
--

-- Items
local RedLighting = script.Parent.Parent.Parent.RedLighting
--

-- Functions
function DoLights(Class, Mode)
	if Mode == "ON" then
		for _, Lamp in pairs(RedLighting:GetChildren()) do
			if Lamp.Name == Class then
				Lamp.RedLamp.Material = ("Neon")
				Lamp.RedLamp.PointLight.Enabled = true
			end
		end
	elseif Mode == "OFF" then
		for _, Lamp in pairs(RedLighting:GetChildren()) do
			if Lamp.Name == Class then
				Lamp.RedLamp.Material = ("Metal")
				Lamp.RedLamp.PointLight.Enabled = false
			end
		end
	end
end
--

FacilityLightingStatusValue.Changed:Connect(function()
	if FacilityLightingStatusValue.Value == "OFFLINE" then
		wait(5)
		DoLights("RedLamp", "ON")
		DoLights("TNERRedLamp", "ON")
	elseif FacilityLightingStatusValue.Value == "POWER ON" then
		DoLights("RedLamp", "OFF")
		if SecurityPanelStatusValue.Value == "ONLINE" then DoLights("TNERRedLamp", "OFF") end
	end
end)

SecurityPanelStatusValue.Changed:Connect(function()
	if SecurityPanelStatusValue.Value == "ALERT" then
		wait(2)
		DoLights("TNERRedLamp", "ON")
	elseif FacilityLightingStatusValue.Value == "ONLINE" or FacilityLightingStatusValue.Value == "POWER ON" then
		DoLights("TNERRedLamp", "OFF")
	end
end)
