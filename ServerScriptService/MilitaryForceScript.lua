-- Values
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue
local MilitaryForceControlValue = game.ReplicatedStorage.GameValues.MilitaryForceControlValue
--

FacilitySystemsHackDevicesStatusValue.Changed:Connect(function()
	if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
		MilitaryForceControlValue.Value = "CALL"
	elseif FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then
		MilitaryForceControlValue.Value = "CALL OFF"
	end
end)
