-- Values
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue
--

-- Sounds
local FacilityAlarmAmbientSound1 = game.SoundService.Ambients.FacilityAlarmAmbientSound1
local FacilityAlarmAmbientSound2 = game.SoundService.Ambients.FacilityAlarmAmbientSound2
local FacilityAlarmAmbientSound3 = game.SoundService.Ambients.FacilityAlarmAmbientSound3
local BMAirRaidAmbientSound = game.SoundService.Ambients.BMAirRaidAmbientSound
--

FacilitySystemsHackDevicesStatusValue.Changed:Connect(function()
	if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
		wait(2)
		FacilityAlarmAmbientSound3:Play()
	elseif FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then
		wait(2)
		FacilityAlarmAmbientSound3:Stop()
	end
end)
