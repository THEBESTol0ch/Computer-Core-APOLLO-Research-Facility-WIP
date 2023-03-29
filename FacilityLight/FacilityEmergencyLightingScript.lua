-- Values
local EmergencyLightingControlValue = script.Parent.Parent.Values.EmergencyLightingControlValue
local SecurityPanelStatusValue = workspace.TNERSecurityPanel.CPU.Values.SecurityPanelStatusValue
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue
--

-- Items
local EmergencyLighting = script.Parent.Parent.Parent.EmergencyLighting
--

-- Functions
function DoLights(Class, Mode)
	if Mode == "ON" then
		for _, Lamp in pairs(EmergencyLighting:GetChildren()) do
			if Lamp.Name == Class then
				Lamp.Lamp.SpotLight.Enabled = true
				Lamp.Lamp.HingeConstraint.AngularVelocity = 5
			end
		end
	elseif Mode == "OFF" then
		for _, Lamp in pairs(EmergencyLighting:GetChildren()) do
			if Lamp.Name == Class then
				Lamp.Lamp.SpotLight.Enabled = false
				Lamp.Lamp.HingeConstraint.AngularVelocity = 0
			end
		end
	end
end
--

EmergencyLightingControlValue.Changed:Connect(function()
	if EmergencyLightingControlValue.Value == "ON" then
		DoLights("FacilityEmergencyLamp", "ON")
		DoLights("TNERFacilityEmergencyLamp", "ON")
	elseif EmergencyLightingControlValue.Value == "FORCE OFF" then
		DoLights("FacilityEmergencyLamp", "OFF")
		DoLights("TNERFacilityEmergencyLamp", "OFF")
	elseif EmergencyLightingControlValue.Value == "OFF" then
		if FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then DoLights("FacilityEmergencyLamp", "OFF") end
		if SecurityPanelStatusValue.Value == "ONLINE" then DoLights("TNERFacilityEmergencyLamp", "OFF") end
	end
end)

SecurityPanelStatusValue.Changed:Connect(function()
	if SecurityPanelStatusValue.Value == "ALERT" then
		wait(2)
		DoLights("TNERFacilityEmergencyLamp", "ON")
	elseif SecurityPanelStatusValue.Value == "ONLINE" and FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then
		if EmergencyLightingControlValue.Value == "OFF" or EmergencyLightingControlValue.Value == "FORCE OFF" then
			DoLights("TNERFacilityEmergencyLamp", "OFF")
		end
	end
end)

FacilitySystemsHackDevicesStatusValue.Changed:Connect(function()
	if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
		wait(2)
		EmergencyLightingControlValue.Value = "ON"
	elseif FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then
		wait(2)
		EmergencyLightingControlValue.Value = "OFF"
	end
end)
