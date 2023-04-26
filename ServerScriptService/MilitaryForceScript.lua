-- Values
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue
local MilitaryForceControlValue = game.ReplicatedStorage.GameValues.MilitaryForceControlValue
local MilitaryForceCounterValue = game.ReplicatedStorage.GameValues.MilitaryForceCounterValue

local CRCIntegrityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.IntegrityValue
--

CRCIntegrityValue.Changed:Connect(function()
	if CRCIntegrityValue.Value == 20 then
		MilitaryForceControlValue.Value = "CALL"
	elseif CRCIntegrityValue.Value == 0 then
		wait(35)
		wait(MilitaryForceCounterValue.Value)
		MilitaryForceControlValue.Value = "CALL OFF"
	end
end)

FacilitySystemsHackDevicesStatusValue.Changed:Connect(function()
	if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
		MilitaryForceControlValue.Value = "CALL"
	elseif FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" and CRCIntegrityValue.Value > 20 then
		MilitaryForceControlValue.Value = "CALL OFF"
	end
end)

MilitaryForceCounterValue.Changed:Connect(function()
	if MilitaryForceCounterValue.Value == 100 then
		MilitaryForceControlValue.Value = "OPEN"
	end
end)
