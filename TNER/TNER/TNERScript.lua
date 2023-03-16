-- Control
local TweenService = game:GetService("TweenService")
local Trigger = workspace.TNERDriver.AdvancedLever.Lever.Handle
local MaintenanceButton = workspace.TNERMaintenanceModeConsole.CapButton.Button
local UnstableModeLever = workspace.TNERUnstableModePanel.Switch.Handle
--

-- Values
local Values = script.Parent.Parent.Parent.CPU.Values
local TNERStatusValue = Values.TNERStatusValue
local FlywheelRotationSpeedValue = Values.FlywheelRotationSpeedValue
local TemperatureValue = Values.TemperatureValue
local MinTemperatureValue = Values.MinTemperatureValue
local NaturalCoolingValue = Values.NaturalCoolingValue
local TNERStartUpTime = Values.TNERStartUpTime
local MinFuelCapacityValue = Values.MinFuelCapacityValue

local AllFuelCellsInjectedValue = workspace.TNERFuelSystem.CPU.Values.AllFuelCellsInjectedValue
local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
local HatchStatusValue = workspace.TNERFuseSystem.Hatch.CPU.Values.HatchStatusValue

local TNERServers = workspace.TNERSystemServer.Servers
local SuperchargerServerStatusValue = TNERServers.SuperchargerSystemServer.CPU.Values.ServerStatusValue
local FuelServerStatusValue = TNERServers.FuelSystemServer.CPU.Values.ServerStatusValue
local CoolingServerStatusValue = TNERServers.CoolingSystemServer.CPU.Values.ServerStatusValue

local SuperchargerStatusValue = Values.Parent.Parent.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.TNERFuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.TNERFuseSystem.CPU.Values.FuseSystemStatusValue

local CoolingCoeffValue = workspace.TNERCoolingSystem.CPU.Values.CoolingCoeffValue

local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
--

-- Items
local Ventilation = script.Parent.Parent.Parent.Ventilation
local Flywheels = script.Parent.Parent.Parent.Flywheels
--

-- Sounds
local SoundEmitter = script.Parent.Parent.Parent.SoundEmitter
local StartUpSound = SoundEmitter.StartUpSound
local FlywheelsRotationSound = SoundEmitter.FlywheelsRotationSound
local FlywheelsRotationStopSound = SoundEmitter.FlywheelsRotationStopSound
local ShutDownSound1 = SoundEmitter.ShutDownSound1
local ShutDownSound2 = SoundEmitter.ShutDownSound2
local OverloadProcessSound = SoundEmitter.OverloadProcessSound
--

-- Logic
local InvertedLeverPositionValue = 3
local FuelConsumtionMultiplier = 3.3
local TemperatureMultiplier = 8
--

-- Monitoring
local StatusLabel = workspace.ReactorOutputMonitor.Monitor.Lines.ReactorStatus.SurfaceGui.TextLabel
--

local FlywheelAnimationSettings = TweenInfo.new(
	4.5,
	Enum.EasingStyle.Sine,
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
function DoReactor(Mode)
	if Mode == "START" and TNERStatusValue.Value == "OFFLINE" then
		TNERStatusValue.Value = "POWER ON"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
		StartUpSound:Play()
		wait(10.955)
		DoFlywheels("SHOW")
		wait(4.5)
		DoFlywheels("RELEASE")
		wait(1.578)
		DoFlywheels("START")
		wait(1)
		TNERStatusValue.Value = "ONLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(0, 1, 0))
		wait(6.467)
		FlywheelsRotationSound:Play()
	elseif Mode == "STOP" and TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "UNSTABLE" then
		TNERStatusValue.Value = "SHUT DOWN"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
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
		TNERStatusValue.Value = "COOLING"
		DoMonitoring(TNERStatusValue.Value, Color3.new(0.333333, 0.666667, 1))
	end
end
--

Trigger.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "OFFLINE" and HatchStatusValue.Value == "LOCKED" then
		if FuelCapacityValue.Value > 10 and AllFuelCellsInjectedValue.Value == true then
			if SuperchargerServerStatusValue.Value == "ONLINE" and FuelServerStatusValue.Value == "ONLINE" and CoolingServerStatusValue.Value == "ONLINE" then
				wait(1)
				DoReactor("START")
			end	
		end
	elseif TNERStatusValue.Value == "ONLINE" then
		wait(1)
		DoReactor("STOP")
	end
end)

FlywheelRotationSpeedValue.Changed:Connect(function()
	DoFlywheels("START")
end)

FuelCapacityValue.Changed:Connect(function()
	if FuelCapacityValue.Value == 0 then
		DoReactor("STOP")
	end
end)

TemperatureValue.Changed:Connect(function()
	if TemperatureValue.Value >= 3959 then
		DoReactor("STOP")
	end
	if TNERStatusValue.Value == "COOLING" and TemperatureValue.Value < (MinTemperatureValue.Value + NaturalCoolingValue.Value + CoolingCoeffValue.Value) then
		TNERStatusValue.Value = "OFFLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0, 0))
		DoSmoke("Grey", false)
	end
end)

LeverPositionValue.Changed:Connect(function()
	if LeverPositionValue.Value == 5 then
		InvertedLeverPositionValue = 1
		FlywheelRotationSpeedValue.Value = 27
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1.2 }):Play()
	elseif LeverPositionValue.Value == 4 then
		InvertedLeverPositionValue = 2
		FlywheelRotationSpeedValue.Value = 25
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1.1 }):Play()
	elseif LeverPositionValue.Value == 3 then
		InvertedLeverPositionValue = 3
		FlywheelRotationSpeedValue.Value = 10
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1 }):Play()
	elseif LeverPositionValue.Value == 2 then
		InvertedLeverPositionValue = 4
		FlywheelRotationSpeedValue.Value = 6
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 0.9 }):Play()
	elseif LeverPositionValue.Value == 1 then
		InvertedLeverPositionValue = 5
		FlywheelRotationSpeedValue.Value = 4
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 0.8 }):Play()
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(TNERStartUpTime.Value)
		repeat
			FuelCapacityValue.Value = FuelCapacityValue.Value - 1
			wait(InvertedLeverPositionValue * FuelConsumtionMultiplier)
		until FuelCapacityValue.Value <= 0 or TNERStatusValue.Value == "SHUT DOWN"
	end
end)

MaintenanceButton.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "COOLING" then
		TNERStatusValue.Value = "MAINTENANCE MODE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
	elseif TemperatureValue.Value > (MinTemperatureValue.Value + NaturalCoolingValue.Value + CoolingCoeffValue.Value) then
		TNERStatusValue.Value = "COOLING"
		DoMonitoring(TNERStatusValue.Value, Color3.new(0.333333, 0.666667, 1))
	else
		TNERStatusValue.Value = "OFFLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0, 0))
	end
end)

UnstableModeLever.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "ONLINE" and SuperchargerStatusValue.Value == "ONLINE" and FESStatusValue.Value == "ONLINE" and FuseSystemStatusValue.Value == "OFFLINE" and LeverPositionValue.Value == 5 and FuelCapacityValue.Value > MinFuelCapacityValue.Value then
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

while true do
	if TemperatureValue.Value > (MinTemperatureValue.Value + NaturalCoolingValue.Value + CoolingCoeffValue.Value) then
		TemperatureValue.Value = TemperatureValue.Value - (NaturalCoolingValue.Value + CoolingCoeffValue.Value)
	end
	if TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "UNSTABLE" then
		TemperatureValue.Value = TemperatureValue.Value + LeverPositionValue.Value * TemperatureMultiplier
	end
	wait(1)
end
