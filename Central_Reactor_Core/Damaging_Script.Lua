local CentralReactorCoreStatusValue = script.Parent.Parent.Parent.Parent.CentralCore.CPU.Values.CentralReactorCoreStatusValue
local EnergyCapacityValue = script.Parent.Parent.Parent.Parent.CentralCore.CPU.Values.EnergyCapacityValue
local IntegrityValue = script.Parent.Parent.Values.IntegrityValue
local CheckpointSystemControlValue = workspace.CheckpointSystemEvent.CheckpointSystemControlValue
local FacilityAlarm3ControlValue = workspace.FacilityAlarm3ControlValue
local FacilityEmergencyLampControlValue = workspace.FacilityEmergencyLampControlValue
local FacilityCountdownControlValue = workspace.FacilityCountdownControlValue

local CanEvent = true
local CanEvent2 = true

while true do
	if CentralReactorCoreStatusValue.Value >= 1 and EnergyCapacityValue.Value > 100000 and IntegrityValue.Value > 0 then
		IntegrityValue.Value = IntegrityValue.Value - 1
		wait(9)
	end
	if IntegrityValue.Value < 0 then
		IntegrityValue.Value = 0
	end
	if IntegrityValue.Value < 20 and CanEvent == true then
		CanEvent = false
		FacilityAlarm3ControlValue.Value = 1
		CheckpointSystemControlValue.Value = 1
		FacilityEmergencyLampControlValue.Value = 1
	end
	if IntegrityValue.Value == 0 and CanEvent2 == true then
		CanEvent2 = false
		wait(60)
		FacilityCountdownControlValue.Value = 1
		wait(120)
		CentralReactorCoreStatusValue.Value = -1
	end
	wait(0.1)
end
