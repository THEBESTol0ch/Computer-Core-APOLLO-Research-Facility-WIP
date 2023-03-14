-- Control
local TweenService = game:GetService("TweenService")
local Trigger = workspace.TNERDriver.AdvancedLever.Lever.Handle
local MaintenanceButton = workspace.TNERMaintenanceModeConsole.CapButton.Button
local UnstableModeLever = workspace.TNERUnstableModePanel.Switch.Handle
--

-- Values
local TNERStatusValue = script.Parent.Parent.Values.TNERStatusValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local RPMValue = script.Parent.Parent.Values.RPMValue
local InputEnergyValue = script.Parent.Parent.Values.InputEnergyValue
local OutputEnergyValue = script.Parent.Parent.Values.OutputEnergyValue
local FlywheelRotationSpeedValue = script.Parent.Parent.Values.FlywheelRotationSpeedValue

local AllFuelCellsInjectedValue = workspace.TNERFuelSystem.CPU.Values.AllFuelCellsInjectedValue
local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
local HatchStatusValue = workspace.TNERFuseSystem.Hatch.CPU.Values.HatchStatusValue
local TNERServers = workspace.TNERSystemServer.Servers
local SuperchargerServerStatusValue = TNERServers.SuperchargerSystemServer.CPU.Values.ServerStatusValue
local FuelServerStatusValue = TNERServers.FuelSystemServer.CPU.Values.ServerStatusValue
local CoolingServerStatusValue = TNERServers.CoolingSystemServer.CPU.Values.ServerStatusValue

local SuperchargerStatusValue = workspace.TNER.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.TNERFuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.TNERFuseSystem.CPU.Values.FuseSystemStatusValue

local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
local PreviousLeverPositionValue = workspace.TNERPullLever.CPU.Values.PreviousLeverPositionValue

local CoolingCoeffValue = workspace.TNERCoolingSystem.CPU.Values.CoolingCoeffValue
--

-- Items
local EmergencyLamps = script.Parent.Parent.Parent.Lamps.EmergencyLamps
local RedLamps = script.Parent.Parent.Parent.Lamps.RedLamps.RedLamps
local BlueLamps = script.Parent.Parent.Parent.Lamps.BlueLamps.BlueLamps
local SideLamps = script.Parent.Parent.Parent.Lamps.SideLamps.SideLamps
local Ventilation = script.Parent.Parent.Parent.Ventilation
local Flywheels = script.Parent.Parent.Parent.Flywheels
local Lightning = script.Parent.Parent.Parent.Lightning
--

-- Sounds
local SoundEmitter = script.Parent.Parent.Parent.SoundEmitter
local StartUpSound = SoundEmitter.StartUpSound
local FlywheelsRotationSound = SoundEmitter.FlywheelsRotationSound
local FlywheelsRotationStopSound = SoundEmitter.FlywheelsRotationStopSound
local ShutDownSound1 = SoundEmitter.ShutDownSound1
local ShutDownSound2 = SoundEmitter.ShutDownSound2
local ActionAlarm = workspace.TNERAlarmSystem.SoundEmitter.Alarm3
local OverloadProcessSound = script.Parent.Parent.Parent.SoundEmitter.OverloadProcessSound
--

-- Monitoring
local StatusLabel = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorStatus.SurfaceGui.TextLabel
local TemperatureLabel = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorTemperature.SurfaceGui.TextLabel
local RPMLabel = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorRPM.SurfaceGui.TextLabel
local InputEnergyLabel = workspace.ReactorOutputMonitor.Monitor.Lines.InputEnergy.SurfaceGui.TextLabel
local OutputEnergyLabel = workspace.ReactorOutputMonitor.Monitor.Lines.OutputEnergy.SurfaceGui.TextLabel

local FuelCapacityLabel = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
--

-- Logic
local InvertedLeverPositionValue = 3
local FuelConsumtionWaitTime = 9.9
--

local FlywheelAnimationSettings = TweenInfo.new(
	4.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local RoundLightningAnimationSettings = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local FlywheelsRotationSoundAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

-- Functions
function DoMonitoring(Text, Color)
	StatusLabel.Text = Text
	StatusLabel.TextColor3 = Color
end
function DoValuesMonitoring()
	TemperatureLabel.Text = (TemperatureValue.Value.." °C")
	RPMLabel.Text = RPMValue.Value
	InputEnergyLabel.Text = (InputEnergyValue.Value.." V")
	OutputEnergyLabel.Text = (OutputEnergyValue.Value.." V")
	FuelCapacityLabel.Text = (FuelCapacityValue.Value.." %")

	if TemperatureValue.Value > 3200 then
		TemperatureLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif TemperatureValue.Value < 3200 and TemperatureValue.Value > 1600 then
		TemperatureLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif TemperatureValue.Value < 1600 then
		TemperatureLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if RPMValue.Value > 75000 then
		RPMLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif RPMValue.Value < 75000 and RPMValue.Value > 37500 then
		RPMLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif RPMValue.Value < 37500 then
		RPMLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if InputEnergyValue.Value > 500 then
		InputEnergyLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif InputEnergyValue.Value < 500 then
		InputEnergyLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if OutputEnergyValue.Value > 340000 then
		OutputEnergyLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif OutputEnergyValue.Value < 340000 and OutputEnergyValue.Value > 168000 then
		OutputEnergyLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif OutputEnergyValue.Value < 168000 then
		OutputEnergyLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if FuelCapacityValue.Value > 51 then
		FuelCapacityLabel.TextColor3 = Color3.new(0, 1, 0)
	elseif FuelCapacityValue.Value < 51 and FuelCapacityValue.Value > 11 then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif FuelCapacityValue.Value < 11 then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0, 0)
	end
end
function CalcRPM()
	repeat
		if LeverPositionValue.Value > PreviousLeverPositionValue.Value then
			RPMValue.Value = RPMValue.Value + 3748
		elseif LeverPositionValue.Value < PreviousLeverPositionValue.Value then
			RPMValue.Value = RPMValue.Value - 3748
		end
		wait(0.03)
	until RPMValue.Value == 1874 * LeverPositionValue.Value * 10 or TNERStatusValue.Value == "SHUT DOWN"
end
function CalcOutputEnergy()
	repeat
		if LeverPositionValue.Value > PreviousLeverPositionValue.Value then
			OutputEnergyValue.Value = OutputEnergyValue.Value + 16800
		elseif LeverPositionValue.Value < PreviousLeverPositionValue.Value then
			OutputEnergyValue.Value = OutputEnergyValue.Value - 16800
		end
		wait(0.03)
	until OutputEnergyValue.Value == 84 * LeverPositionValue.Value * 1000 or TNERStatusValue.Value == "SHUT DOWN"
end
function DoEmergencyLamps(Mode)
	if Mode == "ON" then
		for _, EmergencyLamp in pairs(EmergencyLamps:GetChildren()) do
			EmergencyLamp.Lamp.SpotLight.Enabled = true
			EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 5
		end
	elseif Mode == "OFF" then
		for _, EmergencyLamp in pairs(EmergencyLamps:GetChildren()) do
			EmergencyLamp.Lamp.SpotLight.Enabled = false
			EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 0
		end
	end
end
function DoSideLamps(Mode)
	if Mode == "ON" then
		for _, SideLamp in pairs(SideLamps:GetChildren()) do
			SideLamp.Material = ("Neon")
			SideLamp.BrickColor = BrickColor.new("Electric blue")
		end
	elseif Mode == "OFF" then
		for _, SideLamp in pairs(SideLamps:GetChildren()) do
			SideLamp.Material = ("SmoothPlastic")
			SideLamp.BrickColor = BrickColor.new("Institutional white")
		end
	end
end
function DoBlueLights(Mode, Color, WaitTime)
	if Mode == "ON" then
		for Count = 1, 7, 1 do
			if WaitTime > 0 then wait(WaitTime) end
			BlueLamps["BlueLamp"..Count].Material = ("Neon")
			BlueLamps["BlueLamp"..Count].BrickColor = BrickColor.new(Color)
		end
	elseif Mode == "OFF" then
		for Count = 7, 1, -1 do
			if WaitTime > 0 then wait(WaitTime) end
			BlueLamps["BlueLamp"..Count].Material = ("Metal")
			BlueLamps["BlueLamp"..Count].BrickColor = BrickColor.new(Color)
		end
	end
end
function DoFlywheels(Mode)
	if Mode == "SHOW" then
		for _, Flywheel in pairs(Flywheels:GetChildren()) do
			TweenService:Create(Flywheel.Stator, FlywheelAnimationSettings, { CFrame = Flywheel.Positions.StatorPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
			TweenService:Create(Flywheel.Flywheel, FlywheelAnimationSettings, { CFrame = Flywheel.Positions.FlywheelPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		end
	elseif Mode == "HIDE" then
		for _, Flywheel in pairs(Flywheels:GetChildren()) do
			TweenService:Create(Flywheel.Stator, FlywheelAnimationSettings, { CFrame = Flywheel.Positions.StatorPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
			TweenService:Create(Flywheel.Flywheel, FlywheelAnimationSettings, { CFrame = Flywheel.Positions.FlywheelPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		end
	elseif Mode == "RELEASE" then
		for _, Flywheel in pairs(Flywheels:GetChildren()) do
			Flywheel.Flywheel.Anchored = false
		end
	elseif Mode == "WELD" then
		for _, Flywheel in pairs(Flywheels:GetChildren()) do
			Flywheel.Flywheel.Anchored = true
		end
	elseif Mode == "START" then
		for _, Flywheel in pairs(Flywheels:GetChildren()) do
			Flywheel.Flywheel.HingeConstraint.AngularVelocity = FlywheelRotationSpeedValue.Value
			Flywheel.Flywheel.DeathTriggerScript.Enabled = true
		end
	elseif Mode == "STOP" then
		for _, Flywheel in pairs(Flywheels:GetChildren()) do
			Flywheel.Flywheel.HingeConstraint.AngularVelocity = 0
			Flywheel.Flywheel.DeathTriggerScript.Enabled = false
		end
	end
end
function DoSmoke(Color, Mode)
	for _, Descendant in pairs(Ventilation:GetDescendants()) do
		if Descendant.Name == (Color.."Smoke") then
			Descendant.Enabled = Mode
		end
	end
end
function DoLightning(Class)
	if Class == "LargeLightning" then
		Lightning.MainLightnings.LargeLightning.Orientation = Lightning.MainLightnings.Positions[Class.."Pos"..math.random(1, 4)].Orientation
		Lightning.MainLightnings.LargeLightning.Transparency = 0
		Lightning.MainLightnings.LargeLightning.PointLight.Enabled = true
		wait(0.1)
		Lightning.MainLightnings.LargeLightning.Transparency = 1
		Lightning.MainLightnings.LargeLightning.PointLight.Enabled = false
	elseif Class == "Lightning" then
		local RandomIndex = math.random(1, 7)
		Lightning.MainLightnings.Lightning.Position = Lightning.MainLightnings.Positions[Class.."Pos"..RandomIndex].Position
		Lightning.MainLightnings.Lightning.Orientation = Lightning.MainLightnings.Positions[Class.."Pos"..RandomIndex].Orientation
		Lightning.MainLightnings.Lightning.Transparency = 0
		Lightning.MainLightnings.Lightning.PointLight.Enabled = true
		SoundEmitter["ElectricDischargeSound"..RandomIndex]:Play()
		wait(0.1)
		Lightning.MainLightnings.Lightning.Transparency = 1
		Lightning.MainLightnings.Lightning.PointLight.Enabled = false
	end
end
function DoRoundLightning(Mode, Side)
	if Mode == "COMPRESS" then
		TweenService:Create(Lightning.RoundLightning[Side.."Lightning"].Lightning1, RoundLightningAnimationSettings, { Size = Lightning.RoundLightning.SizeValues.LightningSizeValue2.Value, Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos2.Position }):Play()
		TweenService:Create(Lightning.RoundLightning[Side.."Lightning"].Lightning2, RoundLightningAnimationSettings, { Size = Lightning.RoundLightning.SizeValues.LightningSizeValue2.Value, Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos2.Position }):Play()
	elseif Mode == "RETURN" then
		Lightning.RoundLightning[Side.."Lightning"].Lightning1.Size = Lightning.RoundLightning.SizeValues.LightningSizeValue1.Value
		Lightning.RoundLightning[Side.."Lightning"].Lightning1.Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos1.Position
		Lightning.RoundLightning[Side.."Lightning"].Lightning2.Size = Lightning.RoundLightning.SizeValues.LightningSizeValue1.Value
		Lightning.RoundLightning[Side.."Lightning"].Lightning2.Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos1.Position
	end
end
function DoReactor(Mode)
	if Mode == "START" and TNERStatusValue.Value == "OFFLINE" then
		TNERStatusValue.Value = "POWER ON"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
		DoEmergencyLamps("ON")
		ActionAlarm:Play()
		StartUpSound:Play()
		wait(10.955)
		DoFlywheels("SHOW")
		wait(4.5)
		DoFlywheels("RELEASE")
		wait(1.578)
		DoFlywheels("START")
		wait(1)
		DoEmergencyLamps("OFF")
		TNERStatusValue.Value = "ONLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(0, 1, 0))
		wait(6.467)
		FlywheelsRotationSound:Play()
	elseif Mode == "STOP" and TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "UNSTABLE" then
		TNERStatusValue.Value = "SHUT DOWN"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
		DoEmergencyLamps("ON")
		ActionAlarm:Play()
		ShutDownSound1:Play()
		FlywheelsRotationSound:Stop()
		FlywheelsRotationStopSound:Play()
		OverloadProcessSound:Stop()
		wait(10)
		DoFlywheels("STOP")
		wait(4)
		ShutDownSound2:Play()
		DoSmoke("Grey", true)
		DoFlywheels("WELD")
		DoFlywheels("HIDE")
		wait(4.5)
		DoSmoke("Grey", false)
		DoEmergencyLamps("OFF")
		TNERStatusValue.Value = "COOLING"
		DoMonitoring(TNERStatusValue.Value, Color3.new(0.333333, 0.666667, 1))
	end
end
--

-- Reactor Control
Trigger.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "OFFLINE" and HatchStatusValue.Value == "LOCKED" then
		if FuelCapacityValue.Value > 10 and AllFuelCellsInjectedValue.Value == true then
			if SuperchargerServerStatusValue.Value == "ONLINE" and FuelServerStatusValue.Value == "ONLINE" and CoolingServerStatusValue.Value == "ONLINE" then
				wait(1)
				DoReactor("START")
			end	
		end
	elseif TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "UNSTABLE" then
		wait(1)
		DoReactor("STOP")
	end
end)
--

-- Large Lightning
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(10.955)
		DoLightning("LargeLightning")
		wait(1.342)
		DoLightning("LargeLightning")
		wait(0.518)
		DoLightning("LargeLightning")
		wait(0.329)
		DoLightning("LargeLightning")
	end
end)
--

-- Round Lightning
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(15.3)
		repeat
			DoRoundLightning("COMPRESS", "Left")
			wait(0.3)
			DoRoundLightning("RETURN", "Left")
			wait(0.01)
		until TNERStatusValue.Value == "ONLINE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(15.45)
		repeat
			DoRoundLightning("COMPRESS", "Right")
			wait(0.3)
			DoRoundLightning("RETURN", "Right")
			wait(0.01)
		until TNERStatusValue.Value == "ONLINE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(15.3)
		repeat
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 0
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 0
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 1
			wait(0.01)
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 0
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 0
			wait(0.01)
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 1
		until TNERStatusValue.Value == "ONLINE"
	end
end)
--

-- Lightning and LeverPosition Control
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(18)
		repeat
			if LeverPositionValue.Value == 5 then
				InvertedLeverPositionValue = 1
			elseif LeverPositionValue.Value == 4 then
				InvertedLeverPositionValue = 2
			elseif LeverPositionValue.Value == 3 then
				InvertedLeverPositionValue = 3
			elseif LeverPositionValue.Value == 2 then
				InvertedLeverPositionValue = 4
			elseif LeverPositionValue.Value == 1 then
				InvertedLeverPositionValue = 5
			end
			FuelConsumtionWaitTime = InvertedLeverPositionValue * 3.3
			local Num1 = InvertedLeverPositionValue * 3.5 - 2
			local Num2 = InvertedLeverPositionValue * 3.5 + 2
			DoLightning("Lightning")
			wait(math.random(Num1, Num2) / 10)
		until TNERStatusValue.Value == "SHUT DOWN"
	end
end)
LeverPositionValue.Changed:Connect(function()
	if LeverPositionValue.Value == 5 then
		FlywheelRotationSpeedValue.Value = 27
	elseif LeverPositionValue.Value == 4 then
		FlywheelRotationSpeedValue.Value = 25
	elseif LeverPositionValue.Value == 3 then
		FlywheelRotationSpeedValue.Value = 10
	elseif LeverPositionValue.Value == 2 then
		FlywheelRotationSpeedValue.Value = 6
	elseif LeverPositionValue.Value == 1 then
		FlywheelRotationSpeedValue.Value = 4
	end
	DoFlywheels("START")

	if LeverPositionValue.Value == 5 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1.2 }):Play()
	elseif LeverPositionValue.Value == 4 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1.1 }):Play()
	elseif LeverPositionValue.Value == 3 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1 }):Play()
	elseif LeverPositionValue.Value == 2 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 0.9 }):Play()
	elseif LeverPositionValue.Value == 1 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 0.8 }):Play()
	end
end)
LeverPositionValue.Changed:Connect(function()
	if TNERStatusValue.Value == "ONLINE" then
		CalcRPM()
	end
end)
LeverPositionValue.Changed:Connect(function()
	if TNERStatusValue.Value == "ONLINE" then
		CalcOutputEnergy()
	end
end)
--

-- Blue Lamps
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		DoBlueLights("ON", "Electric blue", 1)
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		DoBlueLights("OFF", "Deep blue", 1)
	end
	if TNERStatusValue.Value == "UNSTABLE" then
		repeat
			DoBlueLights("OFF", "Deep blue", 0)
			wait(math.random(1, 15) / 10)
			if math.random(1, 2) == 1 then DoBlueLights("ON", "Electric blue", 0) else DoBlueLights("ON", "Really red", 0) end
			wait(math.random(1, 15) / 10)
		until TNERStatusValue.Value == "SHUT DOWN"
		DoBlueLights("ON", "Electric blue", 0)
		DoBlueLights("OFF", "Deep blue", 1)
	end
end)
--

-- Side Lamps
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		repeat
			for Count = 1, 4, 1 do
				DoSideLamps("OFF")
				SideLamps["SideLamp"..Count].Material = ("Neon")
				SideLamps["SideLamp"..Count].BrickColor = BrickColor.new("Electric blue")
				wait(0.3)
			end
		until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "UNSTABLE"
		DoSideLamps("OFF")
		if TNERStatusValue.Value == "UNSTABLE" then
			repeat
				DoSideLamps("ON")
				wait(1)
				DoSideLamps("OFF")
				wait(1)
			until TNERStatusValue.Value == "SHUT DOWN"
		end
	end
end)
--

-- RedLamps
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" or TNERStatusValue.Value == "UNSTABLE" then
		repeat
			for _, RedLamp in pairs(RedLamps:GetChildren()) do
				RedLamp.Material = ("Neon")
				RedLamp.BrickColor = BrickColor.new("Really red")
			end
			wait(1.2)
			for _, RedLamp in pairs(RedLamps:GetChildren()) do
				RedLamp.Material = ("Metal")
				RedLamp.BrickColor = BrickColor.new("Crimson")
			end
			wait(1.2)
		until TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "SHUT DOWN"
	end
end)
--

-- RPM Control
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(16.8)
		CalcRPM()
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		repeat
			RPMValue.Value = RPMValue.Value - 1874
			wait(0.02)
		until RPMValue.Value <= 0
	end
end)
--

-- Input Energy Control
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value + 28
			wait(0.1)
		until InputEnergyValue.Value > 670
		wait(8)
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value - 28
			wait(0.1)
		until InputEnergyValue.Value < 130
		wait(2)
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value - 28
			wait(0.1)
		until InputEnergyValue.Value <= 0
	end
end)
--

-- Output Energy Control
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(16.8)
		CalcOutputEnergy()
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value - 16800
			wait(0.02)
		until OutputEnergyValue.Value <= 0
	end
end)
--

-- Monitoring
TemperatureValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
RPMValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
InputEnergyValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
OutputEnergyValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
FuelCapacityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
--

-- Fuel Consumption
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(18)
		repeat
			FuelCapacityValue.Value = FuelCapacityValue.Value - 1
			wait(FuelConsumtionWaitTime)
		until FuelCapacityValue.Value <= 0 or TNERStatusValue.Value == "SHUT DOWN"
	end
end)
--

-- Maintenance Mode
MaintenanceButton.ClickDetector.MouseClick:Connect(function()
	ActionAlarm:Play()
	if TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "COOLING" then
		TNERStatusValue.Value = "MAINTENANCE MODE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
	elseif TemperatureValue.Value > (27 + 9 + CoolingCoeffValue.Value) then
		TNERStatusValue.Value = "COOLING"
		DoMonitoring(TNERStatusValue.Value, Color3.new(0.333333, 0.666667, 1))
	else
		TNERStatusValue.Value = "OFFLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0, 0))
	end
end)
--

-- Unstable Mode
UnstableModeLever.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "ONLINE" and SuperchargerStatusValue.Value == "ONLINE" and FESStatusValue.Value == "ONLINE" and FuseSystemStatusValue.Value == "OFFLINE" and LeverPositionValue.Value == 5 and FuelCapacityValue.Value > 11 then
		TNERStatusValue.Value = "UNSTABLE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0, 0))
		OverloadProcessSound:Play()
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "UNSTABLE" then
		wait(70)
		if TNERStatusValue.Value == "UNSTABLE" then
			DoReactor("STOP")
		end
	end
end)
--

-- Temperature Control
while true do
	if TemperatureValue.Value > (27 + 9 + CoolingCoeffValue.Value) then
		TemperatureValue.Value = TemperatureValue.Value - (9 + CoolingCoeffValue.Value)
	end
	if TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "UNSTABLE" then
		TemperatureValue.Value = TemperatureValue.Value + LeverPositionValue.Value * 8
	end
	if TNERStatusValue.Value == "COOLING" and TemperatureValue.Value < (27 + 9 + CoolingCoeffValue.Value) then
		TNERStatusValue.Value = "OFFLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0, 0))
	end
	if TemperatureValue.Value >= 3959 then
		DoReactor("STOP")
	end
	if FuelCapacityValue.Value == 0 then
		DoReactor("STOP")
	end

	-- Fail Safe Values Check
	if TemperatureValue.Value < 27 then
		TemperatureValue.Value = 27
	end
	if RPMValue.Value < 0 then
		RPMValue.Value = 0
	end
	if InputEnergyValue.Value < 0 then
		InputEnergyValue.Value = 0
	end
	if OutputEnergyValue.Value < 0 then
		OutputEnergyValue.Value = 0
	end
	if FuelCapacityValue.Value < 0 then
		FuelCapacityValue.Value = 0
	end
	wait(1)
end
--
