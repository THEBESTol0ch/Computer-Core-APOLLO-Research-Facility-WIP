-- Values
local FacilityTransitSystemControlValue = script.Parent.Parent.Values.FacilityTransitSystemControlValue
local FacilityTransitSystemStatusValue = script.Parent.Parent.Values.FacilityTransitSystemStatusValue
local TransitStatusValue1 = script.Parent.Parent.Parent.Transit1.CPU.Values.TransitStatusValue
local TransitStatusValue2 = script.Parent.Parent.Parent.Transit2.CPU.Values.TransitStatusValue
local TransitStatusValue3 = script.Parent.Parent.Parent.Transit3.CPU.Values.TransitStatusValue
--

-- Sounds
local TransitStationAmbientSound = game.SoundService.Ambients.TransitStationAmbientSound
local TransitStationPowerOffAmbientSound = game.SoundService.Ambients.TransitStationPowerOffAmbientSound
local TransitSystemPowerDownAmbientSound = game.SoundService.Ambients.TransitSystemPowerDownAmbientSound
local TransitSystemPowerUpAmbientSound = game.SoundService.Ambients.TransitSystemPowerUpAmbientSound

local LocalTransitSystemPowerDownSound = workspace.FacilityTransitSystem.TransitSystemSoundEmitter.TransitSystemPowerDownSound
local LocalTransitSystemPowerUpSound = workspace.FacilityTransitSystem.TransitSystemSoundEmitter.TransitSystemPowerUpSound
--

-- Logic
local CanEvent1 = true
local CanEvent2 = false
--

-- Functions
function DoCheck()
	if FacilityTransitSystemControlValue.Value == "DISABLE" and FacilityTransitSystemStatusValue.Value == "ONLINE" then
		FacilityTransitSystemStatusValue.Value = "SHUT DOWN"
	elseif FacilityTransitSystemControlValue.Value == "ENABLE" and FacilityTransitSystemStatusValue.Value == "OFFLINE" then
		FacilityTransitSystemStatusValue.Value = "POWER ON"
	end
	if FacilityTransitSystemStatusValue.Value == "SHUT DOWN" and CanEvent1 == true then
		if TransitStatusValue1.Value == "PARKING MODE" and TransitStatusValue2.Value == "PARKING MODE" and TransitStatusValue3.Value == "PARKING MODE" then
			CanEvent1 = false
			TransitStationAmbientSound:Stop()
			TransitStationPowerOffAmbientSound:Play()
			TransitSystemPowerDownAmbientSound:Play()
			LocalTransitSystemPowerDownSound:Play()
			wait(30)
			CanEvent2 = true
			FacilityTransitSystemStatusValue.Value = "OFFLINE"
		end
	elseif FacilityTransitSystemStatusValue.Value == "POWER ON" and CanEvent2 == true then
		CanEvent2 = false
		TransitStationAmbientSound:Play()
		TransitStationPowerOffAmbientSound:Stop()
		TransitSystemPowerUpAmbientSound:Play()
		LocalTransitSystemPowerUpSound:Play()
		wait(80)
		CanEvent1 = true
		FacilityTransitSystemStatusValue.Value = "ONLINE"
	end
end
--

FacilityTransitSystemControlValue.Changed:Connect(function()
	DoCheck()
end)
FacilityTransitSystemStatusValue.Changed:Connect(function()
	DoCheck()
end)

TransitStatusValue1.Changed:Connect(function()
	DoCheck()
end)
TransitStatusValue2.Changed:Connect(function()
	DoCheck()
end)
TransitStatusValue3.Changed:Connect(function()
	DoCheck()
end)
