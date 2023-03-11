-- ReactorStatusValue.Value = 0 [OFFLINE]
-- ReactorStatusValue.Value = 1 [POWERING ON]
-- ReactorStatusValue.Value = 2 [ONLINE]
-- ReactorStatusValue.Value = 3 [SHUTTING DOWN]
-- ReactorStatusValue.Value = 4 [COOLING]

-- ReactorStatusValue.Value = 5 [MAINTENANCE MODE]

-- ReactorStatusValue.Value = 6 [UNSTABLE]
-- ReactorStatusValue.Value = 7 [OVERLOADING]

-- Control
local TweenService = game:GetService("TweenService")
local ButtonOfTNR = workspace.ConfirmingConsole.AdvancedLever.Handle1

local ReactorSpeedLever = workspace.ReactorSpeedLever.Lever.Trigger
local SuperchargerButton = workspace.SuperchargerPullLever.Lever.Trigger
local FEM1PullLever = workspace.FEM1PullLever.Lever.Trigger
local FEM2PullLever = workspace.FEM2PullLever.Lever.Trigger
local FEM3PullLever = workspace.FEM3PullLever.Lever.Trigger
local FuseButton1 = workspace.FuseSystem.Fuse1.FuseButton.FuseButton
local FuseButton2 = workspace.FuseSystem.Fuse2.FuseButton.FuseButton
local FuseButton3 = workspace.FuseSystem.Fuse3.FuseButton.FuseButton
local FuseButton4 = workspace.FuseSystem.Fuse4.FuseButton.FuseButton
local OverloadButton = workspace.OverloadConsole.EmergencyButton.Button
local OverloadLever = workspace.OverloadPannel.SwitchWithHandle.Handle
--

-- Values
local ReactorStatusValue = workspace.ThermonuclearReactor.CPU.Values.ReactorStatusValue
local ReactorControlValue = workspace.ThermonuclearReactor.CPU.Values.ReactorControlValue
local ReactorTemperatureValue = workspace.ThermonuclearReactor.CPU.Values.ReactorTemperatureValue
local ReactorTemperatureIncreaseCoefValue = workspace.ThermonuclearReactor.CPU.Values.ReactorTemperatureIncreaseCoefValue
local RPMValue = workspace.ThermonuclearReactor.CPU.Values.RPMValue
local OutputEnergyValue = workspace.ThermonuclearReactor.CPU.Values.OutputEnergyValue
local InputEnergyValue = workspace.ThermonuclearReactor.CPU.Values.InputEnergyValue
local FuelCapacityValue = workspace.FuelSystem.CPU.Values.FuelCapacityValue
local FuelSystemStatusValue = workspace.FuelSystem.CPU.Values.FuelSystemStatusValue
local FuseHatchStatusValue = workspace.FuseSystem.CPU.Values.FuseHatchStatusValue
local ReactorElectricStatusValue = workspace.ThermonuclearReactor.CPU.Values.ReactorElectricStatusValue
local LeverPositionValue = workspace.ReactorSpeedLever.CPU.Values.LeverPositionValue
local SuperchargerSystemServerStatusValue = workspace.ThermonuclearReactor.SuperchargerSystem.CPU.Values.ServerStatusValue
local FuelSystemServerStatusValue = workspace.FuelSystem.CPU.Values.ServerStatusValue
local CoolingSystemServerStatusValue = workspace.CoolingSystem.CPU.Values.ServerStatusValue
local SuperchargerControlValue = workspace.ThermonuclearReactor.SuperchargerSystem.CPU.Values.SuperchargerControlValue
local SuperchargerStatusValue = workspace.ThermonuclearReactor.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.FuelEnrichmentSystem.CPU.Values.FESStatusValue
local FEM1StatuseValue = workspace.FuelEnrichmentSystem.FEM1.CPU.Values.FEMStatusValue
local FEM2StatuseValue = workspace.FuelEnrichmentSystem.FEM2.CPU.Values.FEMStatusValue
local FEM3StatuseValue = workspace.FuelEnrichmentSystem.FEM3.CPU.Values.FEMStatusValue
local FEM1ControlValue = workspace.FuelEnrichmentSystem.FEM1.CPU.Values.FEMControlValue
local FEM2ControlValue = workspace.FuelEnrichmentSystem.FEM2.CPU.Values.FEMControlValue
local FEM3ControlValue = workspace.FuelEnrichmentSystem.FEM3.CPU.Values.FEMControlValue
local FuseSystemStatusValue = workspace.FuseSystem.CPU.Values.FuseSystemStatusValue
local AlarmControlValue = workspace.TNERAlarmSystem.CPU.Values.AlarmControlValue
local ConsoleControlValue = workspace.ConfirmingConsole.CPU.Values.ConsoleControlValue
local ConsoleStatusValue = workspace.ConfirmingConsole.CPU.Values.ConsoleStatusValue
local AlarmStatusValue = workspace.SecuritySystem1.SecurityPanel.CPU.Values.AlarmStatusValue
--

-- Items
local EL1 = workspace.ThermonuclearReactor.Lamps.EmergencyLamps.EmergencyLamp1.EL1
local EL2 = workspace.ThermonuclearReactor.Lamps.EmergencyLamps.EmergencyLamp2.EL2
local EL3 = workspace.ThermonuclearReactor.Lamps.EmergencyLamps.EmergencyLamp3.EL3
local EL4 = workspace.ThermonuclearReactor.Lamps.EmergencyLamps.EmergencyLamp4.EL4

local LHRRL1 = workspace.ThermonuclearReactor.Lamps.RoundRedLamps.LeftRoundRedLamps.LHRRL1
local LHRRL2 = workspace.ThermonuclearReactor.Lamps.RoundRedLamps.LeftRoundRedLamps.LHRRL2
local RHRRL1 = workspace.ThermonuclearReactor.Lamps.RoundRedLamps.RightRoundRedLamps.RHRRL1
local RHRRL2 = workspace.ThermonuclearReactor.Lamps.RoundRedLamps.RightRoundRedLamps.RHRRL2

local RBL1 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL1
local RBL2 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL2
local RBL3 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL3
local RBL4 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL4
local RBL5 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL5
local RBL6 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL6
local RBL7 = workspace.ThermonuclearReactor.Lamps.RoundBlueLamps.RBL7

local SL1 = workspace.ThermonuclearReactor.Lamps.SideLamps.Lamps.SL1
local SL2 = workspace.ThermonuclearReactor.Lamps.SideLamps.Lamps.SL2
local SL3 = workspace.ThermonuclearReactor.Lamps.SideLamps.Lamps.SL3
local SL4 = workspace.ThermonuclearReactor.Lamps.SideLamps.Lamps.SL4

local GreyReactorSmoke1 = workspace.ThermonuclearReactor.Ventilation.LeftVentilation.Vent1.SmokeEmitter.GreySmoke
local GreyReactorSmoke2 = workspace.ThermonuclearReactor.Ventilation.LeftVentilation.Vent2.SmokeEmitter.GreySmoke
local GreyReactorSmoke3 = workspace.ThermonuclearReactor.Ventilation.RightVentilation.Vent3.SmokeEmitter.GreySmoke
local GreyReactorSmoke4 = workspace.ThermonuclearReactor.Ventilation.RightVentilation.Vent4.SmokeEmitter.GreySmoke

local LeftPartOfReactor = script.Parent.Parent.Parent.Flywheels.LeftFlywheel.LeftPartOfReactor
local LeftPartOfReactorPos = script.Parent.Parent.Parent.Flywheels.LeftFlywheel.LeftPartOfReactorPos
local LeftStatorOfReactor = script.Parent.Parent.Parent.Flywheels.LeftFlywheel.LeftStatorOfReactor
local LeftStatorOfReactorPos = script.Parent.Parent.Parent.Flywheels.LeftFlywheel.LeftStatorOfReactorPos

local RightPartOfReactor = script.Parent.Parent.Parent.Flywheels.RightFlywheel.RightPartOfReactor
local RightPartOfReactorPos = script.Parent.Parent.Parent.Flywheels.RightFlywheel.RightPartOfReactorPos
local RightStatorOfReactor = script.Parent.Parent.Parent.Flywheels.RightFlywheel.RightStatorOfReactor
local RightStatorOfReactorPos = script.Parent.Parent.Parent.Flywheels.RightFlywheel.RightStatorOfReactorPos

local LeftRoundLightning1 = script.Parent.Parent.Parent.Lightning.RoundLightning.LeftRoundLightning.LeftRoundLightning1
local LeftRoundLightning1Pos = script.Parent.Parent.Parent.Lightning.RoundLightning.LeftRoundLightning.LeftRoundLightning1Pos
local LeftRoundLightning2 = script.Parent.Parent.Parent.Lightning.RoundLightning.LeftRoundLightning.LeftRoundLightning2
local LeftRoundLightning2Pos = script.Parent.Parent.Parent.Lightning.RoundLightning.LeftRoundLightning.LeftRoundLightning2Pos

local RightRoundLightning1 = script.Parent.Parent.Parent.Lightning.RoundLightning.RightRoundLightning.RightRoundLightning1
local RightRoundLightning1Pos = script.Parent.Parent.Parent.Lightning.RoundLightning.RightRoundLightning.RightRoundLightning1Pos
local RightRoundLightning2 = script.Parent.Parent.Parent.Lightning.RoundLightning.RightRoundLightning.RightRoundLightning2
local RightRoundLightning2Pos = script.Parent.Parent.Parent.Lightning.RoundLightning.RightRoundLightning.RightRoundLightning2Pos

local StartLightning1 = script.Parent.Parent.Parent.Lightning.MainLightning.StartLightning1
local StartLightning2 = script.Parent.Parent.Parent.Lightning.MainLightning.StartLightning2
local StartLightning3 = script.Parent.Parent.Parent.Lightning.MainLightning.StartLightning3
local StartLightning4 = script.Parent.Parent.Parent.Lightning.MainLightning.StartLightning4
local Lightning1 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning1
local Lightning2 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning2
local Lightning3 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning3
local Lightning4 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning4
local Lightning5 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning5
local Lightning6 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning6
local Lightning7 = script.Parent.Parent.Parent.Lightning.MainLightning.Lightning7
--

-- Sounds
local StartUpReactorSound = script.Parent.Parent.Parent.SoundEmitter.StartUpReactorSound
local ShutDownReactorSound1 = script.Parent.Parent.Parent.SoundEmitter.ShutDownReactorSound1
local ShutDownReactorSound2 = script.Parent.Parent.Parent.SoundEmitter.ShutDownReactorSound2

local ElectricDischargeSound1 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound1
local ElectricDischargeSound2 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound2
local ElectricDischargeSound3 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound3
local ElectricDischargeSound4 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound4
local ElectricDischargeSound5 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound5
local ElectricDischargeSound6 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound6
local ElectricDischargeSound7 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound7

local FlyWheelRotatingSoundVeryHigh = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundVeryHigh
local FlyWheelRotatingSoundHigh = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundHigh
local FlyWheelRotatingSoundNormal = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundNormal
local FlyWheelRotatingSoundLow = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundLow
local FlyWheelRotatingSoundVeryLow = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundVeryLow
local FlyWheelRotatingStoppingSound = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingStoppingSound

local OverloadingProcess1 = workspace.ThermonuclearReactor.SuperchargerSystem.LeftSupercharger.SoundEmitter.OverloadingProcess1
local OverloadingProcess2 = workspace.ThermonuclearReactor.SuperchargerSystem.RightSupercharger.SoundEmitter.OverloadingProcess2
local ReactorOverloadSound1 = workspace.ThermonuclearReactor.SoundEmitter.ReactorOverloadSound1
local ReactorOverloadSound2 = workspace.ThermonuclearReactor.SuperchargerSystem.LeftSupercharger.SoundEmitter.ReactorOverloadSound2
local ReactorOverloadSound3 = workspace.ThermonuclearReactor.SuperchargerSystem.RightSupercharger.SoundEmitter.ReactorOverloadSound3

local SuperChargerIncreasing1 = workspace.ThermonuclearReactor.SuperchargerSystem.LeftSupercharger.SoundEmitter.SuperChargerIncreasing1
local SuperChargerDecreasing1 = workspace.ThermonuclearReactor.SuperchargerSystem.LeftSupercharger.SoundEmitter.SuperChargerDecreasing1
local SuperChargerWork1 = workspace.ThermonuclearReactor.SuperchargerSystem.LeftSupercharger.SoundEmitter.SuperChargerWork1
local SuperChargerIncreasing2 = workspace.ThermonuclearReactor.SuperchargerSystem.RightSupercharger.SoundEmitter.SuperChargerIncreasing2
local SuperChargerDecreasing2 = workspace.ThermonuclearReactor.SuperchargerSystem.RightSupercharger.SoundEmitter.SuperChargerDecreasing2
local SuperChargerWork2 = workspace.ThermonuclearReactor.SuperchargerSystem.RightSupercharger.SoundEmitter.SuperChargerWork2

local RoomAlarm1Sound = workspace.TNERConsoleSpeaker.SoundEmitter.RoomAlarm1Sound
--

-- Monitoring
local ReactorStatusLable = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorStatus.SurfaceGui.TextLabel
local ReactorTemperatureLable = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorTemperature.SurfaceGui.TextLabel
local ReactorFuelCapacityLable = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local ReactorOutputEnergyLable = workspace.ReactorOutputMonitor.Monitor.Lines.OutputEnergy.SurfaceGui.TextLabel
local ReactorInputEnergyLable = workspace.ReactorOutputMonitor.Monitor.Lines.InputEnergy.SurfaceGui.TextLabel
local ReactorRPMLable = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorRPM.SurfaceGui.TextLabel
--

-- Logic
local LeftRoundLightning = false
local RightRoundLightning = false
local RoundRedLamps = false
local SideLamps = false
local ElectricalDischarge = false
local FuelConsumption = false
local ReactorOverload = false
local ReactorLampsGlitch = false
local SideLampsGlitch = false
local RoundBlueLampsGlitch = false
--

local LeftPartOfReactorStart = {
	CFrame = LeftPartOfReactorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftStatorOfReactorStart = {
	CFrame = LeftStatorOfReactorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftPartOfReactorEnd = {
	CFrame = LeftPartOfReactor.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftStatorOfReactorEnd = {
	CFrame = LeftStatorOfReactor.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RightPartOfReactorStart = {
	CFrame = RightPartOfReactorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightStatorOfReactorStart = {
	CFrame = RightStatorOfReactorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightPartOfReactorEnd = {
	CFrame = RightPartOfReactor.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightStatorOfReactorEnd = {
	CFrame = RightStatorOfReactor.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeftRoundLightningAnimationSettingsStart = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local LeftRoundLightningAnimationSettingsEnd = TweenInfo.new(
	0,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local RightRoundLightningAnimationSettingsStart = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local RightRoundLightningAnimationSettingsEnd = TweenInfo.new(
	0,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local RotorAnimationSettings = TweenInfo.new(
	4.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

local LeftLightningPropertiesStart = {
	Size = Vector3.new(7.653, 7.701, 0.74);
	Position = Vector3.new(266.589, 463.127, 1244.99)
}
local LeftLightningPropertiesEnd = {
	Size = Vector3.new(10.853, 10.922, 1.049);
	Position = Vector3.new(266.492, 463.227, 1251.325)
}
local RightLightningPropertiesStart = { 
	Size = Vector3.new(7.653, 7.701, 0.74); 
	Position = Vector3.new(266.603, 463.127, 1240.457) 
} 
local RightLightningPropertiesEnd = { 
	Size = Vector3.new(10.853, 10.922, 1.049); 
	Position = Vector3.new(266.701, 463.227, 1234.122) 
}

local LeftPartOfReactorStart = TweenService:Create(LeftPartOfReactor, RotorAnimationSettings, LeftPartOfReactorStart)
local LeftStatorOfReactorStart = TweenService:Create(LeftStatorOfReactor, RotorAnimationSettings, LeftStatorOfReactorStart)
local LeftPartOfReactorEnd = TweenService:Create(LeftPartOfReactor, RotorAnimationSettings, LeftPartOfReactorEnd)
local LeftStatorOfReactorEnd = TweenService:Create(LeftStatorOfReactor, RotorAnimationSettings, LeftStatorOfReactorEnd)

local LeftRoundLightning1Start = TweenService:Create(LeftRoundLightning1, LeftRoundLightningAnimationSettingsStart, LeftLightningPropertiesStart)
local LeftRoundLightning1End = TweenService:Create(LeftRoundLightning1, LeftRoundLightningAnimationSettingsEnd, LeftLightningPropertiesEnd)
local LeftRoundLightning2Start = TweenService:Create(LeftRoundLightning2, LeftRoundLightningAnimationSettingsStart, LeftLightningPropertiesStart)
local LeftRoundLightning2End = TweenService:Create(LeftRoundLightning2, LeftRoundLightningAnimationSettingsEnd, LeftLightningPropertiesEnd)

local RightPartOfReactorStart = TweenService:Create(RightPartOfReactor, RotorAnimationSettings, RightPartOfReactorStart)
local RightStatorOfReactorStart = TweenService:Create(RightStatorOfReactor, RotorAnimationSettings, RightStatorOfReactorStart)
local RightPartOfReactorEnd = TweenService:Create(RightPartOfReactor, RotorAnimationSettings, RightPartOfReactorEnd)
local RightStatorOfReactorEnd = TweenService:Create(RightStatorOfReactor, RotorAnimationSettings, RightStatorOfReactorEnd)

local RightRoundLightning1Start = TweenService:Create(RightRoundLightning1, RightRoundLightningAnimationSettingsStart, RightLightningPropertiesStart)
local RightRoundLightning1End = TweenService:Create(RightRoundLightning1, RightRoundLightningAnimationSettingsEnd, RightLightningPropertiesEnd)
local RightRoundLightning2Start = TweenService:Create(RightRoundLightning2, RightRoundLightningAnimationSettingsStart, RightLightningPropertiesStart)
local RightRoundLightning2End = TweenService:Create(RightRoundLightning2, RightRoundLightningAnimationSettingsEnd, RightLightningPropertiesEnd)

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		FuelConsumption = true
		wait(14.6)
		repeat
			FuelCapacityValue.Value = FuelCapacityValue.Value - 1
			if LeverPositionValue.Value == 5 then
				wait(1)
			end
			if LeverPositionValue.Value == 4 then
				wait(1.5)
			end
			if LeverPositionValue.Value == 3 then
				wait(2)
			end
			if LeverPositionValue.Value == 2 then
				wait(2.5)
			end
			if LeverPositionValue.Value == 1 then
				wait(3)
			end
		until
		FuelCapacityValue.Value == 0 or FuelConsumption == false
	end
end)

ReactorSpeedLever.ClickDetector.MouseClick:Connect(function()
	ElectricalDischarge = false
end)

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 2 then
		ReactorControlValue.Value = 0
	end
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		ReactorStatusValue.Value = 1
		AlarmControlValue.Value = 1
		ConsoleControlValue.Value = 0
		ReactorStatusLable.Text = ("POWERING ON")
		ReactorStatusLable.TextColor3 = Color3.new(1, 0.666667, 0)
		StartUpReactorSound:Play()
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL3.SpotLight.Enabled = true
		EL3.HingeConstraint.AngularVelocity = 5
		EL4.SpotLight.Enabled = true
		EL4.HingeConstraint.AngularVelocity = 5
		wait(8.4)
		LeftPartOfReactorStart:Play()
		LeftStatorOfReactorStart:Play()
		wait(0.1)
		RightPartOfReactorStart:Play()
		RightStatorOfReactorStart:Play()
		wait(6.1)
		LeftRoundLightning = false
		LeftPartOfReactor.Anchored = false
		LeftPartOfReactor.CanTouch = true
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 10
		wait(0.1)
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL3.SpotLight.Enabled = false
		EL3.HingeConstraint.AngularVelocity = 0
		EL4.SpotLight.Enabled = false
		EL4.HingeConstraint.AngularVelocity = 0
		RightRoundLightning = false
		RoundRedLamps = false
		RightPartOfReactor.Anchored = false
		RightPartOfReactor.CanTouch = true
		RightPartOfReactor.HingeConstraint.AngularVelocity = 10
		SideLamps = false
		ReactorStatusValue.Value = 2
		wait(2)
		SL1.Material = ("Neon")
		SL1.BrickColor = BrickColor.new("Electric blue")
		SL2.Material = ("Neon")
		SL2.BrickColor = BrickColor.new("Electric blue")
		SL3.Material = ("Neon")
		SL3.BrickColor = BrickColor.new("Electric blue")
		SL4.Material = ("Neon")
		SL4.BrickColor = BrickColor.new("Electric blue")
		ReactorStatusLable.Text = ("ONLINE")
		ReactorStatusLable.TextColor3 = Color3.new(0, 1, 0)
		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 10
		SuperchargerButton.ClickDetector.MaxActivationDistance = 10
		FEM1PullLever.ClickDetector.MaxActivationDistance = 10
		FEM2PullLever.ClickDetector.MaxActivationDistance = 10
		FEM3PullLever.ClickDetector.MaxActivationDistance = 10
	end
end)

-- Electrical Discharges

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(14.5)
		FlyWheelRotatingSoundNormal:Play()
		ElectricalDischarge = true
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.7)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.5)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(1)
		until
		ElectricalDischarge == false
	end
end)

-- Round Blue Lamps

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(1)
		RBL1.Material = ("Neon")
		RBL1.BrickColor = BrickColor.new("Electric blue")
		wait(1)
		RBL2.Material = ("Neon")
		RBL2.BrickColor = BrickColor.new("Electric blue")
		wait(1)
		RBL3.Material = ("Neon")
		RBL3.BrickColor = BrickColor.new("Electric blue")
		wait(1)
		RBL4.Material = ("Neon")
		RBL4.BrickColor = BrickColor.new("Electric blue")
		wait(1)
		RBL5.Material = ("Neon")
		RBL5.BrickColor = BrickColor.new("Electric blue")
		wait(1)
		RBL6.Material = ("Neon")
		RBL6.BrickColor = BrickColor.new("Electric blue")
		wait(1)
		RBL7.Material = ("Neon")
		RBL7.BrickColor = BrickColor.new("Electric blue")
	else
		wait(1)
		RBL7.Material = ("Metal")
		RBL7.BrickColor = BrickColor.new("Deep blue")
		wait(1)
		RBL6.Material = ("Metal")
		RBL6.BrickColor = BrickColor.new("Deep blue")
		wait(1)
		RBL5.Material = ("Metal")
		RBL5.BrickColor = BrickColor.new("Deep blue")
		wait(1)
		RBL4.Material = ("Metal")
		RBL4.BrickColor = BrickColor.new("Deep blue")
		wait(1)
		RBL3.Material = ("Metal")
		RBL3.BrickColor = BrickColor.new("Deep blue")
		wait(1)
		RBL2.Material = ("Metal")
		RBL2.BrickColor = BrickColor.new("Deep blue")
		wait(1)
		RBL1.Material = ("Metal")
		RBL1.BrickColor = BrickColor.new("Deep blue")
	end
end)

-- Side Lamps

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		SideLamps = true
		repeat
			SL1.Material = ("Neon")
			SL1.BrickColor = BrickColor.new("Electric blue")
			wait(0.3)
			SL1.Material = ("SmoothPlastic")
			SL1.BrickColor = BrickColor.new("Institutional white")
			SL2.Material = ("Neon")
			SL2.BrickColor = BrickColor.new("Electric blue")
			wait(0.3)
			SL2.Material = ("SmoothPlastic")
			SL2.BrickColor = BrickColor.new("Institutional white")
			SL3.Material = ("Neon")
			SL3.BrickColor = BrickColor.new("Electric blue")
			wait(0.3)
			SL3.Material = ("SmoothPlastic")
			SL3.BrickColor = BrickColor.new("Institutional white")
			SL4.Material = ("Neon")
			SL4.BrickColor = BrickColor.new("Electric blue")
			wait(0.3)
			SL4.Material = ("SmoothPlastic")
			SL4.BrickColor = BrickColor.new("Institutional white")
		until
		SideLamps == false
	end
end)

-- Round Red Lamps

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		RoundRedLamps = true
		repeat
			LHRRL1.Material = ("Neon")
			LHRRL1.BrickColor = BrickColor.new("Really red")
			LHRRL2.Material = ("Neon")
			LHRRL2.BrickColor = BrickColor.new("Really red")
			RHRRL1.Material = ("Neon")
			RHRRL1.BrickColor = BrickColor.new("Really red")
			RHRRL2.Material = ("Neon")
			RHRRL2.BrickColor = BrickColor.new("Really red")
			wait(1.2)
			LHRRL1.Material = ("Metal")
			LHRRL1.BrickColor = BrickColor.new("Crimson")
			LHRRL2.Material = ("Metal")
			LHRRL2.BrickColor = BrickColor.new("Crimson")
			RHRRL1.Material = ("Metal")
			RHRRL1.BrickColor = BrickColor.new("Crimson")
			RHRRL2.Material = ("Metal")
			RHRRL2.BrickColor = BrickColor.new("Crimson")
			wait(1.2)
		until
		RoundRedLamps == false
	end
end)

-- Left Round Lightning

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(12.8)
		LeftRoundLightning = true
		repeat 
			LeftRoundLightning1.Transparency = 0
			wait(0.01)
			LeftRoundLightning1.Transparency = 1
			LeftRoundLightning2.Transparency = 0
			wait(0.01)
			LeftRoundLightning2.Transparency = 1
		until
		LeftRoundLightning == false
	end
end)

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(12.8)
		LeftRoundLightning = true
		repeat
			LeftRoundLightning1Start:Play()
			LeftRoundLightning2Start:Play()
			wait(0.3)
			LeftRoundLightning1End:Play()
			LeftRoundLightning2End:Play()
			wait(0.01)
		until
		LeftRoundLightning == false
	end
end)

-- Right Round Lightning

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(12.9)
		RightRoundLightning = true
		repeat 
			RightRoundLightning1.Transparency = 0
			wait(0.01)
			RightRoundLightning1.Transparency = 1
			RightRoundLightning2.Transparency = 0
			wait(0.01)
			RightRoundLightning2.Transparency = 1
		until
		RightRoundLightning == false
	end
end)

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(12.9)
		RightRoundLightning = true
		repeat
			RightRoundLightning1Start:Play()
			RightRoundLightning2Start:Play()
			wait(0.3)
			RightRoundLightning1End:Play()
			RightRoundLightning2End:Play()
			wait(0.01)
		until
		RightRoundLightning == false
	end
end)

-- Animation Sound Sequence

ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
		wait(8.4)
		StartLightning1.Transparency = 0
		StartLightning1.PointLight.Enabled = true
		wait(0.1)
		StartLightning1.Transparency = 1
		StartLightning1.PointLight.Enabled = false
		wait(1.3)
		StartLightning2.Transparency = 0
		StartLightning2.PointLight.Enabled = true
		wait(0.1)
		StartLightning2.Transparency = 1
		StartLightning2.PointLight.Enabled = false
		wait(0.5)
		StartLightning3.Transparency = 0
		StartLightning3.PointLight.Enabled = true
		wait(0.1)
		StartLightning3.Transparency = 1
		StartLightning3.PointLight.Enabled = false
		wait(0.3)
		StartLightning4.Transparency = 0
		StartLightning4.PointLight.Enabled = true
		wait(0.1)
		StartLightning4.Transparency = 1
		StartLightning4.PointLight.Enabled = false
	end
end)

-- Overload Sequence

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		ReactorStatusLable.Text = ("OVERLOADING")
		ReactorStatusLable.TextColor3 = Color3.new(1, 0, 0)
		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 0
		ReactorStatusValue.Value = 4
		ReactorOverload = true
		wait(5)
		ReactorOverloadSound1:Play()
		wait(0.05)
		ReactorOverloadSound2:Play()
		wait(0.05)
		ReactorOverloadSound3:Play()
		FlyWheelRotatingSoundNormal:Stop()
		OverloadingProcess1:Stop()
		OverloadingProcess2:Stop()
		SuperChargerIncreasing1:Stop()
		SuperChargerIncreasing2:Stop()
		SuperChargerWork1:Stop()
		SuperChargerWork2:Stop()
		ElectricalDischarge = false
		wait(4.4)
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 40
		wait(0.1)
		RightPartOfReactor.HingeConstraint.AngularVelocity = 40
		SL1.Material = ("Neon")
		SL1.BrickColor = BrickColor.new("Really red")
		SL2.Material = ("Neon")
		SL2.BrickColor = BrickColor.new("Really red")
		SL3.Material = ("Neon")
		SL3.BrickColor = BrickColor.new("Really red")
		SL4.Material = ("Neon")
		SL4.BrickColor = BrickColor.new("Really red")

		LHRRL1.Material = ("Neon")
		LHRRL1.BrickColor = BrickColor.new("Really red")
		LHRRL2.Material = ("Neon")
		LHRRL2.BrickColor = BrickColor.new("Really red")
		RHRRL1.Material = ("Neon")
		RHRRL1.BrickColor = BrickColor.new("Really red")
		RHRRL2.Material = ("Neon")
		RHRRL2.BrickColor = BrickColor.new("Really red")
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		RBL1.Material = ("Neon")
		RBL1.BrickColor = BrickColor.new("Really red")
		wait(0.05)
		RBL2.Material = ("Neon")
		RBL2.BrickColor = BrickColor.new("Really red")
		wait(0.05)
		RBL3.Material = ("Neon")
		RBL3.BrickColor = BrickColor.new("Really red")
		wait(0.05)
		RBL4.Material = ("Neon")
		RBL4.BrickColor = BrickColor.new("Really red")
		wait(0.05)
		RBL5.Material = ("Neon")
		RBL5.BrickColor = BrickColor.new("Really red")
		wait(0.05)
		RBL6.Material = ("Neon")
		RBL6.BrickColor = BrickColor.new("Really red")
		wait(0.05)
		RBL7.Material = ("Neon")
		RBL7.BrickColor = BrickColor.new("Really red")
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		ReactorOverload = true
		repeat
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.01)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(0.01)
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.01)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.01)
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.01)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(0.01)
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.01)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.01)
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.01)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(0.01)
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.01)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.01)
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.01)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(0.01)
		until
		ReactorOverload == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		LeftRoundLightning = true
		repeat 
			LeftRoundLightning1.Transparency = 0
			wait(0.01)
			LeftRoundLightning1.Transparency = 1
			LeftRoundLightning2.Transparency = 0
			wait(0.01)
			LeftRoundLightning2.Transparency = 1
		until
		LeftRoundLightning == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		LeftRoundLightning = true
		repeat
			LeftRoundLightning1Start:Play()
			LeftRoundLightning2Start:Play()
			wait(0.3)
			LeftRoundLightning1End:Play()
			LeftRoundLightning2End:Play()
			wait(0.01)
		until
		LeftRoundLightning == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.6)
		RightRoundLightning = true
		repeat 
			RightRoundLightning1.Transparency = 0
			wait(0.01)
			RightRoundLightning1.Transparency = 1
			RightRoundLightning2.Transparency = 0
			wait(0.01)
			RightRoundLightning2.Transparency = 1
		until
		RightRoundLightning == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.6)
		RightRoundLightning = true
		repeat
			RightRoundLightning1Start:Play()
			RightRoundLightning2Start:Play()
			wait(0.3)
			RightRoundLightning1End:Play()
			RightRoundLightning2End:Play()
			wait(0.01)
		until
		RightRoundLightning == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(70.5)
		ReactorLampsGlitch = true
		repeat
			RBL1.Material = ("Neon")
			RBL1.BrickColor = BrickColor.new("Electric blue")
			RBL2.Material = ("Neon")
			RBL2.BrickColor = BrickColor.new("Electric blue")
			RBL3.Material = ("Neon")
			RBL3.BrickColor = BrickColor.new("Electric blue")
			RBL4.Material = ("Neon")
			RBL4.BrickColor = BrickColor.new("Electric blue")
			RBL5.Material = ("Neon")
			RBL5.BrickColor = BrickColor.new("Electric blue")
			RBL6.Material = ("Neon")
			RBL6.BrickColor = BrickColor.new("Electric blue")
			RBL7.Material = ("Neon")
			RBL7.BrickColor = BrickColor.new("Electric blue")

			SL1.Material = ("SmoothPlastic")
			SL1.BrickColor = BrickColor.new("Institutional white")
			SL2.Material = ("SmoothPlastic")
			SL2.BrickColor = BrickColor.new("Institutional white")
			SL3.Material = ("SmoothPlastic")
			SL3.BrickColor = BrickColor.new("Institutional white")
			SL4.Material = ("SmoothPlastic")
			SL4.BrickColor = BrickColor.new("Institutional white")

			LHRRL1.Material = ("Metal")
			LHRRL1.BrickColor = BrickColor.new("Crimson")
			LHRRL2.Material = ("Metal")
			LHRRL2.BrickColor = BrickColor.new("Crimson")
			RHRRL1.Material = ("Metal")
			RHRRL1.BrickColor = BrickColor.new("Crimson")
			RHRRL2.Material = ("Metal")
			RHRRL2.BrickColor = BrickColor.new("Crimson")
			wait(0.03)
			RBL1.Material = ("Neon")
			RBL1.BrickColor = BrickColor.new("Really red")
			RBL2.Material = ("Neon")
			RBL2.BrickColor = BrickColor.new("Really red")
			RBL3.Material = ("Neon")
			RBL3.BrickColor = BrickColor.new("Really red")
			RBL4.Material = ("Neon")
			RBL4.BrickColor = BrickColor.new("Really red")
			RBL5.Material = ("Neon")
			RBL5.BrickColor = BrickColor.new("Really red")
			RBL6.Material = ("Neon")
			RBL6.BrickColor = BrickColor.new("Really red")
			RBL7.Material = ("Neon")
			RBL7.BrickColor = BrickColor.new("Really red")

			SL1.Material = ("Neon")
			SL1.BrickColor = BrickColor.new("Really red")
			SL2.Material = ("Neon")
			SL2.BrickColor = BrickColor.new("Really red")
			SL3.Material = ("Neon")
			SL3.BrickColor = BrickColor.new("Really red")
			SL4.Material = ("Neon")
			SL4.BrickColor = BrickColor.new("Really red")

			LHRRL1.Material = ("Neon")
			LHRRL1.BrickColor = BrickColor.new("Really red")
			LHRRL2.Material = ("Neon")
			LHRRL2.BrickColor = BrickColor.new("Really red")
			RHRRL1.Material = ("Neon")
			RHRRL1.BrickColor = BrickColor.new("Really red")
			RHRRL2.Material = ("Neon")
			RHRRL2.BrickColor = BrickColor.new("Really red")
			wait(0.05)
			RBL1.Material = ("Neon")
			RBL1.BrickColor = BrickColor.new("Electric blue")
			RBL2.Material = ("Neon")
			RBL2.BrickColor = BrickColor.new("Electric blue")
			RBL3.Material = ("Neon")
			RBL3.BrickColor = BrickColor.new("Electric blue")
			RBL4.Material = ("Neon")
			RBL4.BrickColor = BrickColor.new("Electric blue")
			RBL5.Material = ("Neon")
			RBL5.BrickColor = BrickColor.new("Electric blue")
			RBL6.Material = ("Neon")
			RBL6.BrickColor = BrickColor.new("Electric blue")
			RBL7.Material = ("Neon")
			RBL7.BrickColor = BrickColor.new("Electric blue")

			SL1.Material = ("SmoothPlastic")
			SL1.BrickColor = BrickColor.new("Institutional white")
			SL2.Material = ("SmoothPlastic")
			SL2.BrickColor = BrickColor.new("Institutional white")
			SL3.Material = ("SmoothPlastic")
			SL3.BrickColor = BrickColor.new("Institutional white")
			SL4.Material = ("SmoothPlastic")
			SL4.BrickColor = BrickColor.new("Institutional white")

			LHRRL1.Material = ("Metal")
			LHRRL1.BrickColor = BrickColor.new("Crimson")
			LHRRL2.Material = ("Metal")
			LHRRL2.BrickColor = BrickColor.new("Crimson")
			RHRRL1.Material = ("Metal")
			RHRRL1.BrickColor = BrickColor.new("Crimson")
			RHRRL2.Material = ("Metal")
			RHRRL2.BrickColor = BrickColor.new("Crimson")
			wait(0.02)
			RBL1.Material = ("Neon")
			RBL1.BrickColor = BrickColor.new("Really red")
			RBL2.Material = ("Neon")
			RBL2.BrickColor = BrickColor.new("Really red")
			RBL3.Material = ("Neon")
			RBL3.BrickColor = BrickColor.new("Really red")
			RBL4.Material = ("Neon")
			RBL4.BrickColor = BrickColor.new("Really red")
			RBL5.Material = ("Neon")
			RBL5.BrickColor = BrickColor.new("Really red")
			RBL6.Material = ("Neon")
			RBL6.BrickColor = BrickColor.new("Really red")
			RBL7.Material = ("Neon")
			RBL7.BrickColor = BrickColor.new("Really red")

			SL1.Material = ("Neon")
			SL1.BrickColor = BrickColor.new("Really red")
			SL2.Material = ("Neon")
			SL2.BrickColor = BrickColor.new("Really red")
			SL3.Material = ("Neon")
			SL3.BrickColor = BrickColor.new("Really red")
			SL4.Material = ("Neon")
			SL4.BrickColor = BrickColor.new("Really red")

			LHRRL1.Material = ("Neon")
			LHRRL1.BrickColor = BrickColor.new("Really red")
			LHRRL2.Material = ("Neon")
			LHRRL2.BrickColor = BrickColor.new("Really red")
			RHRRL1.Material = ("Neon")
			RHRRL1.BrickColor = BrickColor.new("Really red")
			RHRRL2.Material = ("Neon")
			RHRRL2.BrickColor = BrickColor.new("Really red")
			wait(0.05)
		until
		ReactorLampsGlitch == false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		SideLampsGlitch = false
		RoundBlueLampsGlitch = false
		RoundRedLamps = false
		wait(72.5)
		ReactorLampsGlitch = false
		wait(1)
		RBL7.Material = ("Metal")
		RBL7.BrickColor = BrickColor.new("Deep blue")
		wait(0.1)
		RBL6.Material = ("Metal")
		RBL6.BrickColor = BrickColor.new("Deep blue")
		wait(0.1)
		RBL5.Material = ("Metal")
		RBL5.BrickColor = BrickColor.new("Deep blue")
		wait(0.1)
		RBL4.Material = ("Metal")
		RBL4.BrickColor = BrickColor.new("Deep blue")
		wait(0.1)
		RBL3.Material = ("Metal")
		RBL3.BrickColor = BrickColor.new("Deep blue")
		wait(0.1)
		RBL2.Material = ("Metal")
		RBL2.BrickColor = BrickColor.new("Deep blue")
		wait(0.1)
		RBL1.Material = ("Metal")
		RBL1.BrickColor = BrickColor.new("Deep blue")

		SL1.Material = ("SmoothPlastic")
		SL1.BrickColor = BrickColor.new("Institutional white")
		SL2.Material = ("SmoothPlastic")
		SL2.BrickColor = BrickColor.new("Institutional white")
		SL3.Material = ("SmoothPlastic")
		SL3.BrickColor = BrickColor.new("Institutional white")
		SL4.Material = ("SmoothPlastic")
		SL4.BrickColor = BrickColor.new("Institutional white")

		LHRRL1.Material = ("Metal")
		LHRRL1.BrickColor = BrickColor.new("Crimson")
		LHRRL2.Material = ("Metal")
		LHRRL2.BrickColor = BrickColor.new("Crimson")
		RHRRL1.Material = ("Metal")
		RHRRL1.BrickColor = BrickColor.new("Crimson")
		RHRRL2.Material = ("Metal")
		RHRRL2.BrickColor = BrickColor.new("Crimson")
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		ReactorStatusValue.Value = 7
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL3.SpotLight.Enabled = true
		EL3.HingeConstraint.AngularVelocity = 5
		EL4.SpotLight.Enabled = true
		EL4.HingeConstraint.AngularVelocity = 5
		wait(68.5)
		FuseButton1.ClickDetector.MaxActivationDistance = 10
		FuseButton2.ClickDetector.MaxActivationDistance = 10
		FuseButton3.ClickDetector.MaxActivationDistance = 10
		FuseButton4.ClickDetector.MaxActivationDistance = 10
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		FuelConsumption = false
		wait(0.5)
		FuelConsumption = true
		repeat
			FuelCapacityValue.Value = FuelCapacityValue.Value - 1
			wait(0.5)
		until
		FuelConsumption == false
	end
end)

OverloadLever.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		ReactorStatusValue.Value = 6
		FEM1PullLever.ClickDetector.MaxActivationDistance = 0
		FEM2PullLever.ClickDetector.MaxActivationDistance = 0
		FEM3PullLever.ClickDetector.MaxActivationDistance = 0
		SuperchargerButton.ClickDetector.MaxActivationDistance = 0
		FuseButton1.ClickDetector.MaxActivationDistance = 0
		FuseButton2.ClickDetector.MaxActivationDistance = 0
		FuseButton3.ClickDetector.MaxActivationDistance = 0
		FuseButton4.ClickDetector.MaxActivationDistance = 0
		OverloadLever.ClickDetector.MaxActivationDistance = 0
		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 0
		RoomAlarm1Sound:Play()
		OverloadingProcess1:Play()
		wait(0.05)
		OverloadingProcess2:Play()
		SuperChargerIncreasing1:Stop()
		SuperChargerIncreasing2:Stop()
		SuperChargerWork1:Stop()
		SuperChargerWork2:Stop()
		ReactorStatusLable.Text = ("UNSTABLE")
		ReactorStatusLable.TextColor3 = Color3.new(1, 0, 0)
	end
end)

OverloadLever.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		SideLampsGlitch = true
		repeat
			SL1.Material = ("SmoothPlastic")
			SL1.BrickColor = BrickColor.new("Institutional white")
			SL2.Material = ("SmoothPlastic")
			SL2.BrickColor = BrickColor.new("Institutional white")
			SL3.Material = ("SmoothPlastic")
			SL3.BrickColor = BrickColor.new("Institutional white")
			SL4.Material = ("SmoothPlastic")
			SL4.BrickColor = BrickColor.new("Institutional white")
			wait(1)
			SL1.Material = ("Neon")
			SL1.BrickColor = BrickColor.new("Electric blue")
			SL2.Material = ("Neon")
			SL2.BrickColor = BrickColor.new("Electric blue")
			SL3.Material = ("Neon")
			SL3.BrickColor = BrickColor.new("Electric blue")
			SL4.Material = ("Neon")
			SL4.BrickColor = BrickColor.new("Electric blue")
			wait(1)
		until
		SideLampsGlitch == false
	end
end)

OverloadLever.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		RoundRedLamps = true
		repeat
			LHRRL1.Material = ("Neon")
			LHRRL1.BrickColor = BrickColor.new("Really red")
			LHRRL2.Material = ("Neon")
			LHRRL2.BrickColor = BrickColor.new("Really red")
			RHRRL1.Material = ("Neon")
			RHRRL1.BrickColor = BrickColor.new("Really red")
			RHRRL2.Material = ("Neon")
			RHRRL2.BrickColor = BrickColor.new("Really red")
			wait(1.2)
			LHRRL1.Material = ("Metal")
			LHRRL1.BrickColor = BrickColor.new("Crimson")
			LHRRL2.Material = ("Metal")
			LHRRL2.BrickColor = BrickColor.new("Crimson")
			RHRRL1.Material = ("Metal")
			RHRRL1.BrickColor = BrickColor.new("Crimson")
			RHRRL2.Material = ("Metal")
			RHRRL2.BrickColor = BrickColor.new("Crimson")
			wait(1.2)
		until
		RoundRedLamps == false
	end
end)

OverloadLever.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		RoundBlueLampsGlitch = true
		repeat
			RBL7.Material = ("Metal")
			RBL7.BrickColor = BrickColor.new("Deep blue")
			RBL6.Material = ("Metal")
			RBL6.BrickColor = BrickColor.new("Deep blue")
			RBL5.Material = ("Metal")
			RBL5.BrickColor = BrickColor.new("Deep blue")
			RBL4.Material = ("Metal")
			RBL4.BrickColor = BrickColor.new("Deep blue")
			RBL3.Material = ("Metal")
			RBL3.BrickColor = BrickColor.new("Deep blue")
			RBL2.Material = ("Metal")
			RBL2.BrickColor = BrickColor.new("Deep blue")
			RBL1.Material = ("Metal")
			RBL1.BrickColor = BrickColor.new("Deep blue")
			wait(0.3)
			RBL1.Material = ("Neon")
			RBL1.BrickColor = BrickColor.new("Electric blue")
			RBL2.Material = ("Neon")
			RBL2.BrickColor = BrickColor.new("Electric blue")
			RBL3.Material = ("Neon")
			RBL3.BrickColor = BrickColor.new("Electric blue")
			RBL4.Material = ("Neon")
			RBL4.BrickColor = BrickColor.new("Electric blue")
			RBL5.Material = ("Neon")
			RBL5.BrickColor = BrickColor.new("Electric blue")
			RBL6.Material = ("Neon")
			RBL6.BrickColor = BrickColor.new("Electric blue")
			RBL7.Material = ("Neon")
			RBL7.BrickColor = BrickColor.new("Electric blue")
			wait(0.7)
			RBL7.Material = ("Metal")
			RBL7.BrickColor = BrickColor.new("Deep blue")
			RBL6.Material = ("Metal")
			RBL6.BrickColor = BrickColor.new("Deep blue")
			RBL5.Material = ("Metal")
			RBL5.BrickColor = BrickColor.new("Deep blue")
			RBL4.Material = ("Metal")
			RBL4.BrickColor = BrickColor.new("Deep blue")
			RBL3.Material = ("Metal")
			RBL3.BrickColor = BrickColor.new("Deep blue")
			RBL2.Material = ("Metal")
			RBL2.BrickColor = BrickColor.new("Deep blue")
			RBL1.Material = ("Metal")
			RBL1.BrickColor = BrickColor.new("Deep blue")
			wait(0.4)
			RBL1.Material = ("Neon")
			RBL1.BrickColor = BrickColor.new("Electric blue")
			RBL2.Material = ("Neon")
			RBL2.BrickColor = BrickColor.new("Electric blue")
			RBL3.Material = ("Neon")
			RBL3.BrickColor = BrickColor.new("Electric blue")
			RBL4.Material = ("Neon")
			RBL4.BrickColor = BrickColor.new("Electric blue")
			RBL5.Material = ("Neon")
			RBL5.BrickColor = BrickColor.new("Electric blue")
			RBL6.Material = ("Neon")
			RBL6.BrickColor = BrickColor.new("Electric blue")
			RBL7.Material = ("Neon")
			RBL7.BrickColor = BrickColor.new("Electric blue")
			wait(2)
		until
		RoundBlueLampsGlitch == false
	end
end)
--

while true do
	if FuelCapacityValue.Value < 0 then
		FuelCapacityValue.Value = 0
		FuelConsumption = false
	end
	if FuelCapacityValue.Value == 0 and ReactorStatusValue.Value == 2 then
		ReactorControlValue.Value = 0
	end
	if FuelCapacityValue.Value == 0 and ReactorStatusValue.Value == 6 then
		ReactorControlValue.Value = 0
	end
	if ReactorControlValue.Value == 0 then
		ReactorControlValue.Value = 3
		AlarmControlValue.Value = 1
		if ConsoleStatusValue.Value == 1 then
			ConsoleControlValue.Value = 0
		end
		ReactorStatusValue.Value = 3
		FEM1PullLever.ClickDetector.MaxActivationDistance = 0
		FEM2PullLever.ClickDetector.MaxActivationDistance = 0
		FEM3PullLever.ClickDetector.MaxActivationDistance = 0
		SuperchargerButton.ClickDetector.MaxActivationDistance = 0
		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 0
		ReactorStatusLable.Text = ("SHUTING DOWN")
		ReactorStatusLable.TextColor3 = Color3.new(1, 0.666667, 0)
		SideLampsGlitch = false
		RoundBlueLampsGlitch = false
		RoundRedLamps = false
		ReactorOverload = false
		LeftRoundLightning = false
		RightRoundLightning = false
		FuelConsumption = false
		ElectricalDischarge = false
		if FuseSystemStatusValue.Value == 0 then
			FuseButton1.ClickDetector.MaxActivationDistance = 10
			FuseButton2.ClickDetector.MaxActivationDistance = 10
			FuseButton3.ClickDetector.MaxActivationDistance = 10
			FuseButton4.ClickDetector.MaxActivationDistance = 10
		end
		SL1.Material = ("SmoothPlastic")
		SL1.BrickColor = BrickColor.new("Institutional white")
		SL2.Material = ("SmoothPlastic")
		SL2.BrickColor = BrickColor.new("Institutional white")
		SL3.Material = ("SmoothPlastic")
		SL3.BrickColor = BrickColor.new("Institutional white")
		SL4.Material = ("SmoothPlastic")
		SL4.BrickColor = BrickColor.new("Institutional white")
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL3.SpotLight.Enabled = true
		EL3.HingeConstraint.AngularVelocity = 5
		EL4.SpotLight.Enabled = true
		EL4.HingeConstraint.AngularVelocity = 5
		RoomAlarm1Sound:Stop()
		OverloadLever.ClickDetector.MaxActivationDistance = 10
		wait(9)
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Stop()
		OverloadingProcess1:Stop()
		OverloadingProcess2:Stop()
		ShutDownReactorSound1:Play()
		FlyWheelRotatingStoppingSound:Play()
		wait(2)
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 0
		wait(0.2)
		RightPartOfReactor.HingeConstraint.AngularVelocity = 0
		wait(2)
		LeftPartOfReactor.Anchored = true
		LeftPartOfReactor.CanTouch = false
		RightPartOfReactor.Anchored = true
		RightPartOfReactor.CanTouch = false
		wait(0.1)
		ShutDownReactorSound2:Play()
		LeftPartOfReactorEnd:Play()
		LeftStatorOfReactorEnd:Play()
		wait(0.1)
		RightPartOfReactorEnd:Play()
		RightStatorOfReactorEnd:Play()
		ReactorStatusValue.Value = 4
		ReactorStatusLable.Text = ("COOLING")
		ReactorStatusLable.TextColor3 = Color3.new(0.333333, 0.666667, 1)
		wait(4.5)
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL3.SpotLight.Enabled = false
		EL3.HingeConstraint.AngularVelocity = 0
		EL4.SpotLight.Enabled = false
		EL4.HingeConstraint.AngularVelocity = 0
		wait(1.5)
		GreyReactorSmoke1.Enabled = true
		GreyReactorSmoke2.Enabled = true
		GreyReactorSmoke3.Enabled = true
		GreyReactorSmoke4.Enabled = true
		wait(1.5)
		GreyReactorSmoke1.Enabled = false
		GreyReactorSmoke2.Enabled = false
		GreyReactorSmoke3.Enabled = false
		GreyReactorSmoke4.Enabled = false
	end
	wait(0.1)
end
