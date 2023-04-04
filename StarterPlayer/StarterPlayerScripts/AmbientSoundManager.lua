-- Control
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
--

-- Triggers
local SurfaceAmbientSound_Trigger1 = workspace.Triggers.SurfaceAmbientSoundTriggers.SurfaceAmbientSound_Trigger1
local SurfaceAmbientSound_Trigger2 = workspace.Triggers.SurfaceAmbientSoundTriggers.SurfaceAmbientSound_Trigger2
local SurfaceAmbientSound_Trigger3 = workspace.Triggers.SurfaceAmbientSoundTriggers.SurfaceAmbientSound_Trigger3
local EngineeringDecksAmbientSound_Trigger1 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger1
local EngineeringDecksAmbientSound_Trigger2 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger2
local EngineeringDecksAmbientSound_Trigger3 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger3
local EngineeringDecksAmbientSound_Trigger4 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger4
local EngineeringDecksAmbientSound_Trigger5 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger5
local EngineeringDecksAmbientSound_Trigger6 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger6
local EngineeringDecksAmbientSound_Trigger7 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger7
local EngineeringDecksAmbientSound_Trigger8 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger8
local EngineeringDecksAmbientSound_Trigger9 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger9
local EngineeringDecksAmbientSound_Trigger10 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger10
local EngineeringDecksAmbientSound_Trigger11 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger11
local EngineeringDecksAmbientSound_Trigger12 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger12
local EngineeringDecksAmbientSound_Trigger13 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger13
local EngineeringDecksAmbientSound_Trigger14 = workspace.Triggers.EngineeringDecksAmbientSoundTriggers.EngineeringDecksAmbientSound_Trigger14
local RainAmbientSound_Trigger1 = workspace.Triggers.RainAmbientSoundTriggers.RainAmbientSound_Trigger1
local RainAmbientSound_Trigger2 = workspace.Triggers.RainAmbientSoundTriggers.RainAmbientSound_Trigger2
local RainAmbientSound_Trigger3 = workspace.Triggers.RainAmbientSoundTriggers.RainAmbientSound_Trigger3
local RainInRoomAmbientSound_Trigger = workspace.Triggers.RainInRoomAmbientSoundTriggers.RainInRoomAmbientSound_Trigger
local TransitStationAmbientSound_Trigger1 = workspace.Triggers.TransitStationAmbientSoundTriggers.TransitStationAmbientSound_Trigger1
local TransitStationAmbientSound_Trigger2 = workspace.Triggers.TransitStationAmbientSoundTriggers.TransitStationAmbientSound_Trigger2
local TransitStationAmbientSound_Trigger3 = workspace.Triggers.TransitStationAmbientSoundTriggers.TransitStationAmbientSound_Trigger3
local TransitStationAmbientSound_Trigger4 = workspace.Triggers.TransitStationAmbientSoundTriggers.TransitStationAmbientSound_Trigger4
local TransitStationAmbientSound_Trigger5 = workspace.Triggers.TransitStationAmbientSoundTriggers.TransitStationAmbientSound_Trigger5
local TransitStationAmbientSound_Trigger6 = workspace.Triggers.TransitStationAmbientSoundTriggers.TransitStationAmbientSound_Trigger6
--

-- Sounds
local SurfaceAmbientSound = game.SoundService.Ambients.SurfaceAmbientSound
local EngineeringDecksAmbientSound = game.SoundService.Ambients.EngineeringDecksAmbientSound
local RainInRoomAmbientSound = game.SoundService.Ambients.RainInRoomAmbientSound
local RainAmbientSound = game.SoundService.Ambients.RainAmbientSound
local BMAirRaidAmbientSound = game.SoundService.Ambients.BMAirRaidAmbientSound
local FacilityAlarmAmbientSound1 = game.SoundService.Ambients.FacilityAlarmAmbientSound1
local FacilityAlarmAmbientSound2 = game.SoundService.Ambients.FacilityAlarmAmbientSound2
local FacilityAlarmAmbientSound3 = game.SoundService.Ambients.FacilityAlarmAmbientSound3
local TransitStationAmbientSound = game.SoundService.Ambients.TransitStationAmbientSound
local TransitStationPowerOffAmbientSound = game.SoundService.Ambients.TransitStationPowerOffAmbientSound
local TransitSystemPowerDownAmbientSound = game.SoundService.Ambients.TransitSystemPowerDownAmbientSound
local TransitSystemPowerUpAmbientSound = game.SoundService.Ambients.TransitSystemPowerUpAmbientSound
--

-- Logic
local SurfaceAmbientSound_Volume = 0.1
local EngineeringDecksAmbientSound_Volume = 2
local RainInRoomAmbientSound_Volume = 1
local RainAmbientSound_Volume = 1
local BMAirRaidAmbientSound_Volume = 0.5
local FacilityAlarmAmbientSound1_Volume = 1
local FacilityAlarmAmbientSound2_Volume = 2
local FacilityAlarmAmbientSound3_Volume = 2
local TransitStationAmbientSound_Volume = 2
local TransitStationPowerOffAmbientSound_Volume = 2
local TransitSystemPowerDownAmbientSound_Volume = 1
local TransitSystemPowerUpAmbientSound_Volume = 2
--

local SoundAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

-- Functions
function StopSound()
	for _, Ambient in pairs(game.SoundService.Ambients:GetChildren()) do
		TweenService:Create(Ambient, SoundAnimationSettings, { Volume = 0 }):Play()
	end
end
function DoCheck(Hit, Ambient, Volume)
	local PlayerCheck = Players:GetPlayerFromCharacter(Hit.Parent)
	if PlayerCheck == Player then
		if Ambient.Volume == 0 then
			StopSound()
			TweenService:Create(Ambient, SoundAnimationSettings, { Volume = Volume }):Play()
			if Ambient.Name == "SurfaceAmbientSound" then
				TweenService:Create(BMAirRaidAmbientSound, SoundAnimationSettings, { Volume = BMAirRaidAmbientSound_Volume }):Play()
			else
				TweenService:Create(FacilityAlarmAmbientSound1, SoundAnimationSettings, { Volume = FacilityAlarmAmbientSound1_Volume }):Play()
				TweenService:Create(FacilityAlarmAmbientSound2, SoundAnimationSettings, { Volume = FacilityAlarmAmbientSound2_Volume }):Play()
				TweenService:Create(FacilityAlarmAmbientSound3, SoundAnimationSettings, { Volume = FacilityAlarmAmbientSound3_Volume }):Play()
			end
		end
	end
end
--

TransitStationAmbientSound.Changed:Connect(function()
	if TransitStationAmbientSound.Volume > 0 then
		TweenService:Create(TransitSystemPowerDownAmbientSound, SoundAnimationSettings, { Volume = TransitSystemPowerDownAmbientSound_Volume }):Play()
		TweenService:Create(TransitSystemPowerUpAmbientSound, SoundAnimationSettings, { Volume = TransitSystemPowerUpAmbientSound_Volume }):Play()
	end
end)

SurfaceAmbientSound_Trigger1.Touched:connect(function(Hit)
	DoCheck(Hit, SurfaceAmbientSound, SurfaceAmbientSound_Volume)
end)
SurfaceAmbientSound_Trigger2.Touched:connect(function(Hit)
	DoCheck(Hit, SurfaceAmbientSound, SurfaceAmbientSound_Volume)
end)
SurfaceAmbientSound_Trigger3.Touched:connect(function(Hit)
	DoCheck(Hit, SurfaceAmbientSound, SurfaceAmbientSound_Volume)
end)

EngineeringDecksAmbientSound_Trigger1.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger2.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger3.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger4.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger5.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger6.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger7.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger8.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger9.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger10.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger11.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger12.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger13.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)
EngineeringDecksAmbientSound_Trigger14.Touched:connect(function(Hit)
	DoCheck(Hit, EngineeringDecksAmbientSound, EngineeringDecksAmbientSound_Volume)
end)

RainAmbientSound_Trigger1.Touched:connect(function(Hit)
	DoCheck(Hit, RainAmbientSound, RainAmbientSound_Volume)
end)
RainAmbientSound_Trigger2.Touched:connect(function(Hit)
	DoCheck(Hit, RainAmbientSound, RainAmbientSound_Volume)
end)
RainAmbientSound_Trigger3.Touched:connect(function(Hit)
	DoCheck(Hit, RainAmbientSound, RainAmbientSound_Volume)
end)

RainInRoomAmbientSound_Trigger.Touched:connect(function(Hit)
	DoCheck(Hit, RainInRoomAmbientSound, RainInRoomAmbientSound_Volume)
end)

TransitStationAmbientSound_Trigger1.Touched:connect(function(Hit)
	DoCheck(Hit, TransitStationAmbientSound, TransitStationAmbientSound_Volume)
end)
TransitStationAmbientSound_Trigger2.Touched:connect(function(Hit)
	DoCheck(Hit, TransitStationAmbientSound, TransitStationAmbientSound_Volume)
end)
TransitStationAmbientSound_Trigger3.Touched:connect(function(Hit)
	DoCheck(Hit, TransitStationAmbientSound, TransitStationAmbientSound_Volume)
end)
TransitStationAmbientSound_Trigger4.Touched:connect(function(Hit)
	DoCheck(Hit, TransitStationAmbientSound, TransitStationAmbientSound_Volume)
end)
TransitStationAmbientSound_Trigger5.Touched:connect(function(Hit)
	DoCheck(Hit, TransitStationAmbientSound, TransitStationAmbientSound_Volume)
end)
TransitStationAmbientSound_Trigger6.Touched:connect(function(Hit)
	DoCheck(Hit, TransitStationAmbientSound, TransitStationAmbientSound_Volume)
end)
