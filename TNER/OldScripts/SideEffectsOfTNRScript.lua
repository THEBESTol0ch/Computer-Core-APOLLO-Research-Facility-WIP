local TweenService = game:GetService("TweenService")

local OverloadButton = workspace.OverloadConsole.EmergencyButton.Button
local ReactorControlValue = workspace.ThermonuclearReactor.CPU.Values.ReactorControlValue

local Plasma1 = workspace.ThermonuclearReactor.Lightning.Plasma.Plasma1
local Plasma2 = workspace.ThermonuclearReactor.Lightning.Plasma.Plasma2
local Plasma3 = workspace.ThermonuclearReactor.Lightning.Plasma.Plasma3
local PlasmaLight = workspace.ThermonuclearReactor.Lightning.Plasma.Plasma3.PointLight

local Photon1 = workspace.ThermonuclearReactor.Lightning.Photons.Photon1
local Photon2 = workspace.ThermonuclearReactor.Lightning.Photons.Photon2
local Photon3 = workspace.ThermonuclearReactor.Lightning.Photons.Photon3
local Photon4 = workspace.ThermonuclearReactor.Lightning.Photons.Photon4
local Photon5 = workspace.ThermonuclearReactor.Lightning.Photons.Photon5
local Photon6 = workspace.ThermonuclearReactor.Lightning.Photons.Photon6
local Photon7 = workspace.ThermonuclearReactor.Lightning.Photons.Photon7
local Photon8 = workspace.ThermonuclearReactor.Lightning.Photons.Photon8
local Photon9 = workspace.ThermonuclearReactor.Lightning.Photons.Photon9
local Photon10 = workspace.ThermonuclearReactor.Lightning.Photons.Photon10
local Photon11 = workspace.ThermonuclearReactor.Lightning.Photons.Photon11
local Photon12 = workspace.ThermonuclearReactor.Lightning.Photons.Photon12
local Photon13 = workspace.ThermonuclearReactor.Lightning.Photons.Photon13
local Photon14 = workspace.ThermonuclearReactor.Lightning.Photons.Photon14
local Photon15 = workspace.ThermonuclearReactor.Lightning.Photons.Photon15
local Photon16 = workspace.ThermonuclearReactor.Lightning.Photons.Photon16
local Photon17 = workspace.ThermonuclearReactor.Lightning.Photons.Photon17

local DarkMatter1 = workspace.ThermonuclearReactor.Lightning.Plasma.DarkMatter1
local DarkMatter2 = workspace.ThermonuclearReactor.Lightning.Plasma.DarkMatter2

local ReactorSmoke1 = workspace.ThermonuclearReactor.Ventilation.LeftVentilation.Vent1.SmokeEmitter.GreySmoke
local ReactorSmoke2 = workspace.ThermonuclearReactor.Ventilation.LeftVentilation.Vent2.SmokeEmitter.GreySmoke
local ReactorSmoke3 = workspace.ThermonuclearReactor.Ventilation.RightVentilation.Vent3.SmokeEmitter.GreySmoke
local ReactorSmoke4 = workspace.ThermonuclearReactor.Ventilation.RightVentilation.Vent4.SmokeEmitter.GreySmoke

local Alarm1First = workspace.TNERAlarmSystem.TNRSpeaker1.SoundEmitter.Alarm1
local Alarm2First = workspace.TNERAlarmSystem.TNRSpeaker1.SoundEmitter.Alarm2
local Alarm1Second = workspace.TNERAlarmSystem.TNRSpeaker2.SoundEmitter.Alarm1
local Alarm2Second = workspace.TNERAlarmSystem.TNRSpeaker2.SoundEmitter.Alarm2

local OutputEnergy = workspace.ThermonuclearReactor.CPU.Values.OutputEnergyValue
local RPM = workspace.ThermonuclearReactor.CPU.Values.RPMValue
local Temperature = workspace.ThermonuclearReactor.CPU.Values.ReactorTemperatureValue
local FuelCapacityValue = workspace.FuelSystem.CPU.Values.FuelCapacityValue
local LeverPositionValue = workspace.ReactorSpeedLever.CPU.Values.LeverPositionValue
local SuperchargerStatusValue = workspace.ThermonuclearReactor.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.FuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.FuseSystem.CPU.Values.FuseSystemStatusValue
local AlarmControlValue = workspace.SecuritySystem1.SecurityPanel.CPU.Values.AlarmControlValue
local AlarmStatusValue = workspace.SecuritySystem1.SecurityPanel.CPU.Values.AlarmStatusValue

-- Monitoring
local ReactorStatusLable = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorStatus.SurfaceGui.TextLabel
local ReactorTemperatureLable = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorTemperature.SurfaceGui.TextLabel
local ReactorFuelCapacityLable = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local ReactorOutputEnergyLable = workspace.ReactorOutputMonitor.Monitor.Lines.OutputEnergy.SurfaceGui.TextLabel
local ReactorInputEnergyLable = workspace.ReactorOutputMonitor.Monitor.Lines.InputEnergy.SurfaceGui.TextLabel
local ReactorRPMLable = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorRPM.SurfaceGui.TextLabel
--

local ReactorStatusSurfaceGui = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorStatus.SurfaceGui
local ReactorTemperatureSurfaceGui = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorTemperature.SurfaceGui
local ReactorRPMSurfaceGui = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorRPM.SurfaceGui
local ReactorOutputEnergySurfaceGui = workspace.ReactorOutputMonitor.Monitor.Lines.OutputEnergy.SurfaceGui

local ErrorReplacement1 = workspace.ReactorOutputMonitor.Monitor.Lines.ErrorReplacement1.SurfaceGui
local ErrorReplacement2 = workspace.ReactorOutputMonitor.Monitor.Lines.ErrorReplacement2.SurfaceGui
local ErrorReplacement3 = workspace.ReactorOutputMonitor.Monitor.Lines.ErrorReplacement3.SurfaceGui
local ErrorReplacement4 = workspace.ReactorOutputMonitor.Monitor.Lines.ErrorReplacement4.SurfaceGui

local DarkMatterAnimationSettingsStart = TweenInfo.new(
	5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local DarkMatterAnimationSettingsEnd = TweenInfo.new(
	5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local PlasmaAnimationSettingsStart = TweenInfo.new(
	40,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local PlasmaAnimationSettingsEnd = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local PhotonAnimationSettingsStart = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local PhotonAnimationSettingsEnd = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local DarkMatter1PropertiesStart = {
	Transparency = 0.1
}

local DarkMatter1PropertiesEnd = {
	Transparency = 1
}

local DarkMatter2PropertiesStart = {
	Size = Vector3.new(17.552, 17.552, 17.552);
	Transparency = 0.6
}

local DarkMatter2PropertiesEnd = {
	Size = Vector3.new(31.98, 31.98, 31.98);
	Transparency = 1
}

local PlasmaLightPropertiesStart = {
	Brightness = 10
}

local PlasmaLightPropertiesEnd = {
	Brightness = 0
}

local Plasma1PropertiesStart = {
	Transparency = 0
}

local Plasma1PropertiesEnd = {
	Transparency = 1
}

local Plasma2PropertiesStart = {
	Transparency = 0
}

local Plasma2PropertiesEnd = {
	Transparency = 1
}

local Plasma3PropertiesStart = {
	Size = Vector3.new(11.352, 11.352, 11.352);
	Transparency = 0
}

local Plasma3PropertiesEnd = {
	Size = Vector3.new(4.148, 4.148, 4.148);
	Transparency = 1
}

local PhotonProperties1Start = {
	Size = Vector3.new(32.847, 2, 2);
	Transparency = 0
}

local PhotonProperties2Start = {
	Size = Vector3.new(53.91, 2, 2);
	Transparency = 0
}

local PhotonProperties3Start = {
	Size = Vector3.new(77.43, 2, 2);
	Transparency = 0
}

local PhotonPropertiesEnd = {
	Transparency = 1
}

local DarkMatter1Start = TweenService:Create(DarkMatter1, DarkMatterAnimationSettingsStart, DarkMatter1PropertiesStart)
local DarkMatter1End = TweenService:Create(DarkMatter1, DarkMatterAnimationSettingsEnd, DarkMatter1PropertiesEnd)

local DarkMatter2Start = TweenService:Create(DarkMatter2, DarkMatterAnimationSettingsStart, DarkMatter2PropertiesStart)
local DarkMatter2End = TweenService:Create(DarkMatter2, DarkMatterAnimationSettingsEnd, DarkMatter2PropertiesEnd)

local PlasmaLightStart = TweenService:Create(PlasmaLight, PlasmaAnimationSettingsStart, PlasmaLightPropertiesStart)
local PlasmaLightEnd = TweenService:Create(PlasmaLight, PlasmaAnimationSettingsEnd, PlasmaLightPropertiesEnd)

local Plasma1Start = TweenService:Create(Plasma1, PlasmaAnimationSettingsStart, Plasma1PropertiesStart)
local Plasma1End = TweenService:Create(Plasma1, PlasmaAnimationSettingsEnd, Plasma1PropertiesEnd)

local Plasma2Start = TweenService:Create(Plasma2, PlasmaAnimationSettingsStart, Plasma2PropertiesStart)
local Plasma2End = TweenService:Create(Plasma2, PlasmaAnimationSettingsEnd, Plasma2PropertiesEnd)

local Plasma3Start = TweenService:Create(Plasma3, PlasmaAnimationSettingsStart, Plasma3PropertiesStart)
local Plasma3End = TweenService:Create(Plasma3, PlasmaAnimationSettingsEnd, Plasma3PropertiesEnd)

local Photon1Start1 = TweenService:Create(Photon1, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon1Start2 = TweenService:Create(Photon1, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon1Start3 = TweenService:Create(Photon1, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon1End = TweenService:Create(Photon1, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon2Start1 = TweenService:Create(Photon2, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon2Start2 = TweenService:Create(Photon2, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon2Start3 = TweenService:Create(Photon2, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon2End = TweenService:Create(Photon2, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon3Start1 = TweenService:Create(Photon3, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon3Start2 = TweenService:Create(Photon3, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon3Start3 = TweenService:Create(Photon3, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon3End = TweenService:Create(Photon3, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon4Start1 = TweenService:Create(Photon4, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon4Start2 = TweenService:Create(Photon4, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon4Start3 = TweenService:Create(Photon4, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon4End = TweenService:Create(Photon4, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon5Start1 = TweenService:Create(Photon5, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon5Start2 = TweenService:Create(Photon5, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon5Start3 = TweenService:Create(Photon5, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon5End = TweenService:Create(Photon5, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon6Start1 = TweenService:Create(Photon6, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon6Start2 = TweenService:Create(Photon6, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon6Start3 = TweenService:Create(Photon6, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon6End = TweenService:Create(Photon6, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon7Start1 = TweenService:Create(Photon7, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon7Start2 = TweenService:Create(Photon7, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon7Start3 = TweenService:Create(Photon7, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon7End = TweenService:Create(Photon7, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon8Start1 = TweenService:Create(Photon8, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon8Start2 = TweenService:Create(Photon8, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon8Start3 = TweenService:Create(Photon8, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon8End = TweenService:Create(Photon8, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon9Start1 = TweenService:Create(Photon9, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon9Start2 = TweenService:Create(Photon9, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon9Start3 = TweenService:Create(Photon9, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon9End = TweenService:Create(Photon9, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon10Start1 = TweenService:Create(Photon10, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon10Start2 = TweenService:Create(Photon10, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon10Start3 = TweenService:Create(Photon10, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon10End = TweenService:Create(Photon10, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon11Start1 = TweenService:Create(Photon11, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon11Start2 = TweenService:Create(Photon11, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon11Start3 = TweenService:Create(Photon11, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon11End = TweenService:Create(Photon11, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon12Start1 = TweenService:Create(Photon12, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon12Start2 = TweenService:Create(Photon12, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon12Start3 = TweenService:Create(Photon12, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon12End = TweenService:Create(Photon12, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon13Start1 = TweenService:Create(Photon13, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon13Start2 = TweenService:Create(Photon13, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon13Start3 = TweenService:Create(Photon13, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon13End = TweenService:Create(Photon13, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon14Start1 = TweenService:Create(Photon14, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon14Start2 = TweenService:Create(Photon14, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon14Start3 = TweenService:Create(Photon14, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon14End = TweenService:Create(Photon14, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon15Start1 = TweenService:Create(Photon15, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon15Start2 = TweenService:Create(Photon15, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon15Start3 = TweenService:Create(Photon15, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon15End = TweenService:Create(Photon15, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon16Start1 = TweenService:Create(Photon16, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon16Start2 = TweenService:Create(Photon16, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon16Start3 = TweenService:Create(Photon16, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon16End = TweenService:Create(Photon16, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local Photon17Start1 = TweenService:Create(Photon17, PhotonAnimationSettingsStart, PhotonProperties1Start)
local Photon17Start2 = TweenService:Create(Photon17, PhotonAnimationSettingsStart, PhotonProperties2Start)
local Photon17Start3 = TweenService:Create(Photon17, PhotonAnimationSettingsStart, PhotonProperties3Start)
local Photon17End = TweenService:Create(Photon17, PhotonAnimationSettingsEnd, PhotonPropertiesEnd)

local PhotonsFlashing = false

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(26.5)
		Photon1Start1:Play()
		wait(0.1)
		Photon1End:Play()
		wait(0.1)
		Photon1.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon2Start1:Play()
		wait(0.1)
		Photon2End:Play()
		wait(0.1)
		Photon2.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon3Start1:Play()
		wait(0.1)
		Photon3End:Play()
		wait(0.1)
		Photon3.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon4Start1:Play()
		wait(0.1)
		Photon4End:Play()
		wait(0.1)
		Photon4.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon5Start1:Play()
		wait(0.1)
		Photon5End:Play()
		wait(0.1)
		Photon5.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon6Start1:Play()
		wait(0.1)
		Photon6End:Play()
		wait(0.1)
		Photon6.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon7Start1:Play()
		wait(0.1)
		Photon7End:Play()
		wait(0.1)
		Photon7.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon8Start1:Play()
		wait(0.1)
		Photon8End:Play()
		wait(0.1)
		Photon8.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon9Start1:Play()
		wait(0.1)
		Photon9End:Play()
		wait(0.1)
		Photon9.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon10Start1:Play()
		wait(0.1)
		Photon10End:Play()
		wait(0.1)
		Photon10.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon11Start1:Play()
		wait(0.1)
		Photon11End:Play()
		wait(0.1)
		Photon11.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon12Start1:Play()
		wait(0.1)
		Photon12End:Play()
		wait(0.1)
		Photon12.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon13Start1:Play()
		wait(0.1)
		Photon13End:Play()
		wait(0.1)
		Photon13.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon14Start1:Play()
		wait(0.1)
		Photon14End:Play()
		wait(0.1)
		Photon14.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon15Start1:Play()
		wait(0.1)
		Photon15End:Play()
		wait(0.1)
		Photon15.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon16Start1:Play()
		wait(0.1)
		Photon16End:Play()
		wait(0.1)
		Photon16.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon17Start1:Play()
		wait(0.1)
		Photon17End:Play()
		wait(0.1)
		Photon17.Size = Vector3.new(0.05, 2, 2)



		Photon1Start2:Play()
		wait(0.1)
		Photon1End:Play()
		wait(0.1)
		Photon1.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon2Start2:Play()
		wait(0.1)
		Photon2End:Play()
		wait(0.1)
		Photon2.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon3Start2:Play()
		wait(0.1)
		Photon3End:Play()
		wait(0.1)
		Photon3.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon4Start2:Play()
		wait(0.1)
		Photon4End:Play()
		wait(0.1)
		Photon4.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon5Start2:Play()
		wait(0.1)
		Photon5End:Play()
		wait(0.1)
		Photon5.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon6Start2:Play()
		wait(0.1)
		Photon6End:Play()
		wait(0.1)
		Photon6.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon7Start2:Play()
		wait(0.1)
		Photon7End:Play()
		wait(0.1)
		Photon7.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon8Start2:Play()
		wait(0.1)
		Photon8End:Play()
		wait(0.1)
		Photon8.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon9Start2:Play()
		wait(0.1)
		Photon9End:Play()
		wait(0.1)
		Photon9.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon10Start2:Play()
		wait(0.1)
		Photon10End:Play()
		wait(0.1)
		Photon10.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon11Start2:Play()
		wait(0.1)
		Photon11End:Play()
		wait(0.1)
		Photon11.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon12Start2:Play()
		wait(0.1)
		Photon12End:Play()
		wait(0.1)
		Photon12.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon13Start2:Play()
		wait(0.1)
		Photon13End:Play()
		wait(0.1)
		Photon13.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon14Start2:Play()
		wait(0.1)
		Photon14End:Play()
		wait(0.1)
		Photon14.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon15Start2:Play()
		wait(0.1)
		Photon15End:Play()
		wait(0.1)
		Photon15.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon16Start2:Play()
		wait(0.1)
		Photon16End:Play()
		wait(0.1)
		Photon16.Size = Vector3.new(0.05, 2, 2)
		wait(0.01)
		Photon17Start2:Play()
		wait(0.1)
		Photon17End:Play()
		wait(0.1)
		Photon17.Size = Vector3.new(0.05, 2, 2)
		PhotonsFlashing = true

		repeat
			Photon1Start3:Play()
			wait(0.1)
			Photon1End:Play()
			wait(0.1)
			Photon1.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon2Start3:Play()
			wait(0.1)
			Photon2End:Play()
			wait(0.1)
			Photon2.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon3Start3:Play()
			wait(0.1)
			Photon3End:Play()
			wait(0.1)
			Photon3.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon4Start3:Play()
			wait(0.1)
			Photon4End:Play()
			wait(0.1)
			Photon4.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon5Start3:Play()
			wait(0.1)
			Photon5End:Play()
			wait(0.1)
			Photon5.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon6Start3:Play()
			wait(0.1)
			Photon6End:Play()
			wait(0.1)
			Photon6.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon7Start3:Play()
			wait(0.1)
			Photon7End:Play()
			wait(0.1)
			Photon7.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon8Start3:Play()
			wait(0.1)
			Photon8End:Play()
			wait(0.1)
			Photon8.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon9Start3:Play()
			wait(0.1)
			Photon9End:Play()
			wait(0.1)
			Photon9.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon10Start3:Play()
			wait(0.1)
			Photon10End:Play()
			wait(0.1)
			Photon10.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon11Start3:Play()
			wait(0.1)
			Photon11End:Play()
			wait(0.1)
			Photon11.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon12Start3:Play()
			wait(0.1)
			Photon12End:Play()
			wait(0.1)
			Photon12.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon13Start3:Play()
			wait(0.1)
			Photon13End:Play()
			wait(0.1)
			Photon13.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon14Start3:Play()
			wait(0.1)
			Photon14End:Play()
			wait(0.1)
			Photon14.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon15Start3:Play()
			wait(0.1)
			Photon15End:Play()
			wait(0.1)
			Photon15.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon16Start3:Play()
			wait(0.1)
			Photon16End:Play()
			wait(0.1)
			Photon16.Size = Vector3.new(0.05, 2, 2)
			wait(0.001)
			Photon17Start3:Play()
			wait(0.1)
			Photon17End:Play()
			wait(0.1)
			Photon17.Size = Vector3.new(0.05, 2, 2)
		until
		PhotonsFlashing == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		Plasma1Start:Play()
		wait(7)
		Plasma2Start:Play()
		wait(10)
		Plasma3Start:Play()
		PlasmaLightStart:Play()
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(55)
		Alarm1First:Play()
		wait(0.01)
		Alarm1Second:Play()
		wait(10)
		ReactorStatusSurfaceGui.Enabled = false
		ErrorReplacement4.Enabled = true
		Alarm2First:Play()
		wait(0.01)
		Alarm2Second:Play()
	end
end)

local Math = false

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		Math = true
		wait(9.5)
		repeat
			RPM.Value = RPM.Value + 937
			wait(1)
		until
		RPM.Value > 99000 or Math == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		repeat
			OutputEnergy.Value = OutputEnergy.Value + 252
			wait(1)
		until
		OutputEnergy.Value > 14400 or Math == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		repeat
			Temperature.Value = Temperature.Value + 51
			wait(1)
		until
		Temperature.Value > 12589 or Math == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(50)
		Math = false
		wait(3)
		ReactorTemperatureSurfaceGui.Enabled = false
		ErrorReplacement1.Enabled = true
		wait(5)
		ReactorOutputEnergySurfaceGui.Enabled = false
		ErrorReplacement2.Enabled = true
		wait(6)
		ReactorRPMSurfaceGui.Enabled = false
		ErrorReplacement3.Enabled = true
		Math = false
		wait(1)
		OutputEnergy.Value = 0
		RPM.Value = 0
		Temperature.Value = 28
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(70)
		DarkMatter1Start:Play()
		DarkMatter2Start:Play()
		ReactorSmoke1.Enabled = true
		ReactorSmoke2.Enabled = true
		ReactorSmoke3.Enabled = true
		ReactorSmoke4.Enabled = true
		wait(50)
		ReactorSmoke1.Enabled = false
		ReactorSmoke2.Enabled = false
		ReactorSmoke3.Enabled = false
		ReactorSmoke4.Enabled = false
		wait(2)
		ReactorRPMLable.Text = ("0")
		ReactorRPMLable.TextColor3 = Color3.new(0, 1, 0)
		ReactorRPMSurfaceGui.Enabled = true
		ErrorReplacement2.Enabled = false
		wait(1)
		ReactorOutputEnergyLable.Text = ("0")
		ReactorOutputEnergyLable.TextColor3 = Color3.new(0, 1, 0)
		ReactorOutputEnergySurfaceGui.Enabled = true
		ErrorReplacement3.Enabled = false
		wait(1)
		ReactorTemperatureLable.Text = ("27")
		ReactorTemperatureLable.TextColor3 = Color3.new(0, 1, 0)
		ReactorTemperatureSurfaceGui.Enabled = true
		ErrorReplacement1.Enabled = false
		wait(1)
		ReactorStatusSurfaceGui.Enabled = true
		ErrorReplacement4.Enabled = false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(72.5)
		PhotonsFlashing = false
		Plasma1End:Play()
		Plasma2End:Play()
		Plasma3End:Play()
		PlasmaLightEnd:Play()
		DarkMatter1End:Play()
		DarkMatter2End:Play()
		ReactorControlValue.Value = 0
		AlarmControlValue.Value = 1
		wait(15)
		Alarm1First.Looped = false
		Alarm2First.Looped = false
		Alarm1Second.Looped = false
		Alarm2Second.Looped = false
		wait(10)
		Alarm1First.Looped = true
		Alarm2First.Looped = true
		Alarm1Second.Looped = true
		Alarm2Second.Looped = true
		wait(120)
		if AlarmStatusValue.Value == 1 then
			AlarmControlValue.Value = 0
		end
	end
end)
