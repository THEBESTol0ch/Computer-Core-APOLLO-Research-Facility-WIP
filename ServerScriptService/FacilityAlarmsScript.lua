-- Values
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue
--

-- Sounds
local FacilityAlarm1 = game.SoundService.FacilityAlarm1
local FacilityAlarm2 = game.SoundService.FacilityAlarm2
local FacilityAlarm3 = game.SoundService.FacilityAlarm3
local BMAirRaidAmbientSound = game.SoundService.BMAirRaidAmbientSound
--

FacilitySystemsHackDevicesStatusValue.Changed:Connect(function()
	if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
		wait(2)
		FacilityAlarm3:Play()
	elseif FacilitySystemsHackDevicesStatusValue.Value == "CLEAR" then
		wait(2)
		FacilityAlarm3:Stop()
	end
end)
