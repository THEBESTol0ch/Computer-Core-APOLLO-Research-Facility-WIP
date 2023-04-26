-- Values
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue

local KeyTurnedValue1 = workspace.CRCConsole.KeyLock1.CPU.Values.KeyTurnedValue
local KeyTurnedValue2 = workspace.CRCConsole.KeyLock2.CPU.Values.KeyTurnedValue

local CRCIntegrityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.IntegrityValue
--

-- Sounds
local FacilityAlarmAmbientSound1 = game.SoundService.Ambients.FacilityAlarmAmbientSound1
local FacilityAlarmAmbientSound2 = game.SoundService.Ambients.FacilityAlarmAmbientSound2
local FacilityAlarmAmbientSound3 = game.SoundService.Ambients.FacilityAlarmAmbientSound3
local BMAirRaidAmbientSound = game.SoundService.Ambients.BMAirRaidAmbientSound
--

-- Functions
function DoCheck()
	if KeyTurnedValue1.Value == true and KeyTurnedValue2.Value == true then
		FacilityAlarmAmbientSound1:Play()
	else
		FacilityAlarmAmbientSound1:Stop()
	end
end
--

KeyTurnedValue1.Changed:Connect(function()
	DoCheck()
end)
KeyTurnedValue2.Changed:Connect(function()
	DoCheck()
end)

FacilitySystemsHackDevicesStatusValue.Changed:Connect(function()
	if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
		wait(2)
		FacilityAlarmAmbientSound3:Play()
	elseif FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then
		wait(2)
		FacilityAlarmAmbientSound3:Stop()
	end
end)

CRCIntegrityValue.Changed:Connect(function()
	if CRCIntegrityValue.Value == 20 then
		wait(20)
		FacilityAlarmAmbientSound3:Play()
	elseif CRCIntegrityValue.Value == 0 then
		wait(20)
		FacilityAlarmAmbientSound2:Play()
		BMAirRaidAmbientSound:Play()
	end
end)
