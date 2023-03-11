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
local Trigger = workspace.TNERDriver.AdvancedLever.Lever.Handle
--

-- Values
local TNERStatusValue = script.Parent.Parent.Values.TNERStatusValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local TemperatureIncreaseCoefValue = script.Parent.Parent.Values.TemperatureIncreaseCoefValue
local RPMValue = script.Parent.Parent.Values.RPMValue
local InputEnergyValue = script.Parent.Parent.Values.InputEnergyValue
local OutputEnergyValue = script.Parent.Parent.Values.OutputEnergyValue
local FlywheelRotationSpeedValue = script.Parent.Parent.Values.FlywheelRotationSpeedValue

local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
local HatchStatusValue = workspace.TNERFuseSystem.Hatch.CPU.Values.HatchStatusValue
local TNERServers = workspace.TNERSystemServer.Servers
local SuperchargerServerStatusValue = TNERServers.SuperchargerSystemServer.CPU.Values.ServerStatusValue
local FuelServerStatusValue = TNERServers.FuelSystemServer.CPU.Values.ServerStatusValue
local CoolingServerStatusValue = TNERServers.CoolingSystemServer.CPU.Values.ServerStatusValue

local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
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
	ReactorStatusLable.Text = Text
	ReactorStatusLable.TextColor3 = Color
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
	if Mode == "START" then
		TNERStatusValue.Value = "POWER ON"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
		DoEmergencyLamps("ON")
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
	elseif Mode == "STOP" then
		TNERStatusValue.Value = "SHUT DOWN"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0.666667, 0))
		DoEmergencyLamps("ON")
		ShutDownSound1:Play()
		FlywheelsRotationSound:Stop()
		FlywheelsRotationStopSound:Play()
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
		TNERStatusValue.Value = "OFFLINE"
		DoMonitoring(TNERStatusValue.Value, Color3.new(1, 0, 0))
	end
end
--

Trigger.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "OFFLINE" and FuelCapacityValue.Value > 10 and HatchStatusValue.Value == "LOCKED" then
		if SuperchargerServerStatusValue.Value == "ONLINE" and FuelServerStatusValue.Value == "ONLINE" and CoolingServerStatusValue.Value == "ONLINE" then
			wait(1)
			DoReactor("START")
		end	
	elseif TNERStatusValue.Value == "ONLINE" then
		wait(1)
		DoReactor("STOP")
	end
end)

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

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(18)
		repeat
			local Num1 = LeverPositionValue.Value * 3.5 - 2
			local Num2 = LeverPositionValue.Value * 3.5 + 2
			DoLightning("Lightning")
			wait(math.random(Num1, Num2) / 10)
		until TNERStatusValue.Value == "SHUT DOWN"
	end
end)

LeverPositionValue.Changed:Connect(function()
	if LeverPositionValue.Value == 1 then
		FlywheelRotationSpeedValue.Value = 27
	elseif LeverPositionValue.Value == 2 then
		FlywheelRotationSpeedValue.Value = 25
	elseif LeverPositionValue.Value == 3 then
		FlywheelRotationSpeedValue.Value = 10
	elseif LeverPositionValue.Value == 4 then
		FlywheelRotationSpeedValue.Value = 6
	elseif LeverPositionValue.Value == 5 then
		FlywheelRotationSpeedValue.Value = 4
	end
	DoFlywheels("START")

	if LeverPositionValue.Value == 1 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1.2 }):Play()
	elseif LeverPositionValue.Value == 2 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1.1 }):Play()
	elseif LeverPositionValue.Value == 3 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 1 }):Play()
	elseif LeverPositionValue.Value == 4 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 0.9 }):Play()
	elseif LeverPositionValue.Value == 5 then
		TweenService:Create(FlywheelsRotationSound, FlywheelsRotationSoundAnimationSettings, { PlaybackSpeed = 0.8 }):Play()
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		for Count = 1, 7, 1 do
			wait(1)
			BlueLamps["BlueLamp"..Count].Material = ("Neon")
			BlueLamps["BlueLamp"..Count].BrickColor = BrickColor.new("Electric blue")
		end
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		for Count = 7, 1, -1 do
			wait(1)
			BlueLamps["BlueLamp"..Count].Material = ("Metal")
			BlueLamps["BlueLamp"..Count].BrickColor = BrickColor.new("Deep blue")
		end
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		repeat
			for Count = 1, 4, 1 do
				DoSideLamps("OFF")
				SideLamps["SideLamp"..Count].Material = ("Neon")
				SideLamps["SideLamp"..Count].BrickColor = BrickColor.new("Electric blue")
				wait(0.3)
			end
		until TNERStatusValue.Value == "SHUT DOWN"
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
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
		until TNERStatusValue.Value == "SHUT DOWN"
	end
end)

-- Electrical Discharges

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(14.5)
--		FlyWheelRotatingSoundNormal:Play()
--		ElectricalDischarge = true
--		repeat
--			ElectricDischargeSound1:Play()
--			Lightning1.Transparency = 0
--			Lightning1.PointLight.Enabled = true
--			wait(0.1)
--			Lightning1.Transparency = 1
--			Lightning1.PointLight.Enabled = false
--			wait(1)
--			ElectricDischargeSound2:Play()
--			Lightning2.Transparency = 0
--			Lightning2.PointLight.Enabled = true
--			wait(0.1)
--			Lightning2.Transparency = 1
--			Lightning2.PointLight.Enabled = false
--			wait(0.4)
--			ElectricDischargeSound3:Play()
--			Lightning3.Transparency = 0
--			Lightning3.PointLight.Enabled = true
--			wait(0.1)
--			Lightning3.Transparency = 1
--			Lightning3.PointLight.Enabled = false
--			wait(1)
--			ElectricDischargeSound4:Play()
--			Lightning4.Transparency = 0
--			Lightning4.PointLight.Enabled = true
--			wait(0.1)
--			Lightning4.Transparency = 1
--			Lightning4.PointLight.Enabled = false
--			wait(0.7)
--			ElectricDischargeSound5:Play()
--			Lightning5.Transparency = 0
--			Lightning5.PointLight.Enabled = true
--			wait(0.1)
--			Lightning5.Transparency = 1
--			Lightning5.PointLight.Enabled = false
--			wait(1)
--			ElectricDischargeSound6:Play()
--			Lightning6.Transparency = 0
--			Lightning6.PointLight.Enabled = true
--			wait(0.1)
--			Lightning6.Transparency = 1
--			Lightning6.PointLight.Enabled = false
--			wait(0.5)
--			ElectricDischargeSound7:Play()
--			Lightning7.Transparency = 0
--			Lightning7.PointLight.Enabled = true
--			wait(0.1)
--			Lightning7.Transparency = 1
--			Lightning7.PointLight.Enabled = false
--			wait(1)
--		until
--		ElectricalDischarge == false
--	end
--end)

---- Round Blue Lamps

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(1)
--		RBL1.Material = ("Neon")
--		RBL1.BrickColor = BrickColor.new("Electric blue")
--		wait(1)
--		RBL2.Material = ("Neon")
--		RBL2.BrickColor = BrickColor.new("Electric blue")
--		wait(1)
--		RBL3.Material = ("Neon")
--		RBL3.BrickColor = BrickColor.new("Electric blue")
--		wait(1)
--		RBL4.Material = ("Neon")
--		RBL4.BrickColor = BrickColor.new("Electric blue")
--		wait(1)
--		RBL5.Material = ("Neon")
--		RBL5.BrickColor = BrickColor.new("Electric blue")
--		wait(1)
--		RBL6.Material = ("Neon")
--		RBL6.BrickColor = BrickColor.new("Electric blue")
--		wait(1)
--		RBL7.Material = ("Neon")
--		RBL7.BrickColor = BrickColor.new("Electric blue")
--	else
--		wait(1)
--		RBL7.Material = ("Metal")
--		RBL7.BrickColor = BrickColor.new("Deep blue")
--		wait(1)
--		RBL6.Material = ("Metal")
--		RBL6.BrickColor = BrickColor.new("Deep blue")
--		wait(1)
--		RBL5.Material = ("Metal")
--		RBL5.BrickColor = BrickColor.new("Deep blue")
--		wait(1)
--		RBL4.Material = ("Metal")
--		RBL4.BrickColor = BrickColor.new("Deep blue")
--		wait(1)
--		RBL3.Material = ("Metal")
--		RBL3.BrickColor = BrickColor.new("Deep blue")
--		wait(1)
--		RBL2.Material = ("Metal")
--		RBL2.BrickColor = BrickColor.new("Deep blue")
--		wait(1)
--		RBL1.Material = ("Metal")
--		RBL1.BrickColor = BrickColor.new("Deep blue")
--	end
--end)

---- Side Lamps

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		SideLamps = true
--		repeat
--			SL1.Material = ("Neon")
--			SL1.BrickColor = BrickColor.new("Electric blue")
--			wait(0.3)
--			SL1.Material = ("SmoothPlastic")
--			SL1.BrickColor = BrickColor.new("Institutional white")
--			SL2.Material = ("Neon")
--			SL2.BrickColor = BrickColor.new("Electric blue")
--			wait(0.3)
--			SL2.Material = ("SmoothPlastic")
--			SL2.BrickColor = BrickColor.new("Institutional white")
--			SL3.Material = ("Neon")
--			SL3.BrickColor = BrickColor.new("Electric blue")
--			wait(0.3)
--			SL3.Material = ("SmoothPlastic")
--			SL3.BrickColor = BrickColor.new("Institutional white")
--			SL4.Material = ("Neon")
--			SL4.BrickColor = BrickColor.new("Electric blue")
--			wait(0.3)
--			SL4.Material = ("SmoothPlastic")
--			SL4.BrickColor = BrickColor.new("Institutional white")
--		until
--		SideLamps == false
--	end
--end)

---- Round Red Lamps

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		RoundRedLamps = true
--		repeat
--			LHRRL1.Material = ("Neon")
--			LHRRL1.BrickColor = BrickColor.new("Really red")
--			LHRRL2.Material = ("Neon")
--			LHRRL2.BrickColor = BrickColor.new("Really red")
--			RHRRL1.Material = ("Neon")
--			RHRRL1.BrickColor = BrickColor.new("Really red")
--			RHRRL2.Material = ("Neon")
--			RHRRL2.BrickColor = BrickColor.new("Really red")
--			wait(1.2)
--			LHRRL1.Material = ("Metal")
--			LHRRL1.BrickColor = BrickColor.new("Crimson")
--			LHRRL2.Material = ("Metal")
--			LHRRL2.BrickColor = BrickColor.new("Crimson")
--			RHRRL1.Material = ("Metal")
--			RHRRL1.BrickColor = BrickColor.new("Crimson")
--			RHRRL2.Material = ("Metal")
--			RHRRL2.BrickColor = BrickColor.new("Crimson")
--			wait(1.2)
--		until
--		RoundRedLamps == false
--	end
--end)

---- Left Round Lightning

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(12.8)
--		LeftRoundLightning = true
--		repeat 
--			LeftRoundLightning1.Transparency = 0
--			wait(0.01)
--			LeftRoundLightning1.Transparency = 1
--			LeftRoundLightning2.Transparency = 0
--			wait(0.01)
--			LeftRoundLightning2.Transparency = 1
--		until
--		LeftRoundLightning == false
--	end
--end)

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(12.8)
--		LeftRoundLightning = true
--		repeat
--			LeftRoundLightning1Start:Play()
--			LeftRoundLightning2Start:Play()
--			wait(0.3)
--			LeftRoundLightning1End:Play()
--			LeftRoundLightning2End:Play()
--			wait(0.01)
--		until
--		LeftRoundLightning == false
--	end
--end)

---- Right Round Lightning

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(12.9)
--		RightRoundLightning = true
--		repeat 
--			RightRoundLightning1.Transparency = 0
--			wait(0.01)
--			RightRoundLightning1.Transparency = 1
--			RightRoundLightning2.Transparency = 0
--			wait(0.01)
--			RightRoundLightning2.Transparency = 1
--		until
--		RightRoundLightning == false
--	end
--end)

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(12.9)
--		RightRoundLightning = true
--		repeat
--			RightRoundLightning1Start:Play()
--			RightRoundLightning2Start:Play()
--			wait(0.3)
--			RightRoundLightning1End:Play()
--			RightRoundLightning2End:Play()
--			wait(0.01)
--		until
--		RightRoundLightning == false
--	end
--end)

---- Animation Sound Sequence

--ButtonOfTNR.ClickDetector.MouseClick:Connect(function()
--	if ReactorStatusValue.Value == 0 and FuelSystemStatusValue.Value == 1 and FuseHatchStatusValue.Value == 1 and SuperchargerSystemServerStatusValue.Value == 1 and FuelSystemServerStatusValue.Value == 1 and CoolingSystemServerStatusValue.Value == 1 and AlarmStatusValue.Value == 0 then
--		wait(8.4)
--		StartLightning1.Transparency = 0
--		StartLightning1.PointLight.Enabled = true
--		wait(0.1)
--		StartLightning1.Transparency = 1
--		StartLightning1.PointLight.Enabled = false
--		wait(1.3)
--		StartLightning2.Transparency = 0
--		StartLightning2.PointLight.Enabled = true
--		wait(0.1)
--		StartLightning2.Transparency = 1
--		StartLightning2.PointLight.Enabled = false
--		wait(0.5)
--		StartLightning3.Transparency = 0
--		StartLightning3.PointLight.Enabled = true
--		wait(0.1)
--		StartLightning3.Transparency = 1
--		StartLightning3.PointLight.Enabled = false
--		wait(0.3)
--		StartLightning4.Transparency = 0
--		StartLightning4.PointLight.Enabled = true
--		wait(0.1)
--		StartLightning4.Transparency = 1
--		StartLightning4.PointLight.Enabled = false
--	end
--end)

---- Overload Sequence

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		ReactorStatusLable.Text = ("OVERLOADING")
--		ReactorStatusLable.TextColor3 = Color3.new(1, 0, 0)
--		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 0
--		ReactorStatusValue.Value = 4
--		ReactorOverload = true
--		wait(5)
--		ReactorOverloadSound1:Play()
--		wait(0.05)
--		ReactorOverloadSound2:Play()
--		wait(0.05)
--		ReactorOverloadSound3:Play()
--		FlyWheelRotatingSoundNormal:Stop()
--		OverloadingProcess1:Stop()
--		OverloadingProcess2:Stop()
--		SuperChargerIncreasing1:Stop()
--		SuperChargerIncreasing2:Stop()
--		SuperChargerWork1:Stop()
--		SuperChargerWork2:Stop()
--		ElectricalDischarge = false
--		wait(4.4)
--		LeftPartOfReactor.HingeConstraint.AngularVelocity = 40
--		wait(0.1)
--		RightPartOfReactor.HingeConstraint.AngularVelocity = 40
--		SL1.Material = ("Neon")
--		SL1.BrickColor = BrickColor.new("Really red")
--		SL2.Material = ("Neon")
--		SL2.BrickColor = BrickColor.new("Really red")
--		SL3.Material = ("Neon")
--		SL3.BrickColor = BrickColor.new("Really red")
--		SL4.Material = ("Neon")
--		SL4.BrickColor = BrickColor.new("Really red")

--		LHRRL1.Material = ("Neon")
--		LHRRL1.BrickColor = BrickColor.new("Really red")
--		LHRRL2.Material = ("Neon")
--		LHRRL2.BrickColor = BrickColor.new("Really red")
--		RHRRL1.Material = ("Neon")
--		RHRRL1.BrickColor = BrickColor.new("Really red")
--		RHRRL2.Material = ("Neon")
--		RHRRL2.BrickColor = BrickColor.new("Really red")
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.5)
--		RBL1.Material = ("Neon")
--		RBL1.BrickColor = BrickColor.new("Really red")
--		wait(0.05)
--		RBL2.Material = ("Neon")
--		RBL2.BrickColor = BrickColor.new("Really red")
--		wait(0.05)
--		RBL3.Material = ("Neon")
--		RBL3.BrickColor = BrickColor.new("Really red")
--		wait(0.05)
--		RBL4.Material = ("Neon")
--		RBL4.BrickColor = BrickColor.new("Really red")
--		wait(0.05)
--		RBL5.Material = ("Neon")
--		RBL5.BrickColor = BrickColor.new("Really red")
--		wait(0.05)
--		RBL6.Material = ("Neon")
--		RBL6.BrickColor = BrickColor.new("Really red")
--		wait(0.05)
--		RBL7.Material = ("Neon")
--		RBL7.BrickColor = BrickColor.new("Really red")
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.5)
--		ReactorOverload = true
--		repeat
--			Lightning1.Transparency = 0
--			Lightning1.PointLight.Enabled = true
--			wait(0.01)
--			Lightning1.Transparency = 1
--			Lightning1.PointLight.Enabled = false
--			wait(0.01)
--			Lightning2.Transparency = 0
--			Lightning2.PointLight.Enabled = true
--			wait(0.01)
--			Lightning2.Transparency = 1
--			Lightning2.PointLight.Enabled = false
--			wait(0.01)
--			Lightning3.Transparency = 0
--			Lightning3.PointLight.Enabled = true
--			wait(0.01)
--			Lightning3.Transparency = 1
--			Lightning3.PointLight.Enabled = false
--			wait(0.01)
--			Lightning4.Transparency = 0
--			Lightning4.PointLight.Enabled = true
--			wait(0.01)
--			Lightning4.Transparency = 1
--			Lightning4.PointLight.Enabled = false
--			wait(0.01)
--			Lightning5.Transparency = 0
--			Lightning5.PointLight.Enabled = true
--			wait(0.01)
--			Lightning5.Transparency = 1
--			Lightning5.PointLight.Enabled = false
--			wait(0.01)
--			Lightning6.Transparency = 0
--			Lightning6.PointLight.Enabled = true
--			wait(0.01)
--			Lightning6.Transparency = 1
--			Lightning6.PointLight.Enabled = false
--			wait(0.01)
--			Lightning7.Transparency = 0
--			Lightning7.PointLight.Enabled = true
--			wait(0.01)
--			Lightning7.Transparency = 1
--			Lightning7.PointLight.Enabled = false
--			wait(0.01)
--		until
--		ReactorOverload == false
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.5)
--		LeftRoundLightning = true
--		repeat 
--			LeftRoundLightning1.Transparency = 0
--			wait(0.01)
--			LeftRoundLightning1.Transparency = 1
--			LeftRoundLightning2.Transparency = 0
--			wait(0.01)
--			LeftRoundLightning2.Transparency = 1
--		until
--		LeftRoundLightning == false
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.5)
--		LeftRoundLightning = true
--		repeat
--			LeftRoundLightning1Start:Play()
--			LeftRoundLightning2Start:Play()
--			wait(0.3)
--			LeftRoundLightning1End:Play()
--			LeftRoundLightning2End:Play()
--			wait(0.01)
--		until
--		LeftRoundLightning == false
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.6)
--		RightRoundLightning = true
--		repeat 
--			RightRoundLightning1.Transparency = 0
--			wait(0.01)
--			RightRoundLightning1.Transparency = 1
--			RightRoundLightning2.Transparency = 0
--			wait(0.01)
--			RightRoundLightning2.Transparency = 1
--		until
--		RightRoundLightning == false
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.6)
--		RightRoundLightning = true
--		repeat
--			RightRoundLightning1Start:Play()
--			RightRoundLightning2Start:Play()
--			wait(0.3)
--			RightRoundLightning1End:Play()
--			RightRoundLightning2End:Play()
--			wait(0.01)
--		until
--		RightRoundLightning == false
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(70.5)
--		ReactorLampsGlitch = true
--		repeat
--			RBL1.Material = ("Neon")
--			RBL1.BrickColor = BrickColor.new("Electric blue")
--			RBL2.Material = ("Neon")
--			RBL2.BrickColor = BrickColor.new("Electric blue")
--			RBL3.Material = ("Neon")
--			RBL3.BrickColor = BrickColor.new("Electric blue")
--			RBL4.Material = ("Neon")
--			RBL4.BrickColor = BrickColor.new("Electric blue")
--			RBL5.Material = ("Neon")
--			RBL5.BrickColor = BrickColor.new("Electric blue")
--			RBL6.Material = ("Neon")
--			RBL6.BrickColor = BrickColor.new("Electric blue")
--			RBL7.Material = ("Neon")
--			RBL7.BrickColor = BrickColor.new("Electric blue")

--			SL1.Material = ("SmoothPlastic")
--			SL1.BrickColor = BrickColor.new("Institutional white")
--			SL2.Material = ("SmoothPlastic")
--			SL2.BrickColor = BrickColor.new("Institutional white")
--			SL3.Material = ("SmoothPlastic")
--			SL3.BrickColor = BrickColor.new("Institutional white")
--			SL4.Material = ("SmoothPlastic")
--			SL4.BrickColor = BrickColor.new("Institutional white")

--			LHRRL1.Material = ("Metal")
--			LHRRL1.BrickColor = BrickColor.new("Crimson")
--			LHRRL2.Material = ("Metal")
--			LHRRL2.BrickColor = BrickColor.new("Crimson")
--			RHRRL1.Material = ("Metal")
--			RHRRL1.BrickColor = BrickColor.new("Crimson")
--			RHRRL2.Material = ("Metal")
--			RHRRL2.BrickColor = BrickColor.new("Crimson")
--			wait(0.03)
--			RBL1.Material = ("Neon")
--			RBL1.BrickColor = BrickColor.new("Really red")
--			RBL2.Material = ("Neon")
--			RBL2.BrickColor = BrickColor.new("Really red")
--			RBL3.Material = ("Neon")
--			RBL3.BrickColor = BrickColor.new("Really red")
--			RBL4.Material = ("Neon")
--			RBL4.BrickColor = BrickColor.new("Really red")
--			RBL5.Material = ("Neon")
--			RBL5.BrickColor = BrickColor.new("Really red")
--			RBL6.Material = ("Neon")
--			RBL6.BrickColor = BrickColor.new("Really red")
--			RBL7.Material = ("Neon")
--			RBL7.BrickColor = BrickColor.new("Really red")

--			SL1.Material = ("Neon")
--			SL1.BrickColor = BrickColor.new("Really red")
--			SL2.Material = ("Neon")
--			SL2.BrickColor = BrickColor.new("Really red")
--			SL3.Material = ("Neon")
--			SL3.BrickColor = BrickColor.new("Really red")
--			SL4.Material = ("Neon")
--			SL4.BrickColor = BrickColor.new("Really red")

--			LHRRL1.Material = ("Neon")
--			LHRRL1.BrickColor = BrickColor.new("Really red")
--			LHRRL2.Material = ("Neon")
--			LHRRL2.BrickColor = BrickColor.new("Really red")
--			RHRRL1.Material = ("Neon")
--			RHRRL1.BrickColor = BrickColor.new("Really red")
--			RHRRL2.Material = ("Neon")
--			RHRRL2.BrickColor = BrickColor.new("Really red")
--			wait(0.05)
--			RBL1.Material = ("Neon")
--			RBL1.BrickColor = BrickColor.new("Electric blue")
--			RBL2.Material = ("Neon")
--			RBL2.BrickColor = BrickColor.new("Electric blue")
--			RBL3.Material = ("Neon")
--			RBL3.BrickColor = BrickColor.new("Electric blue")
--			RBL4.Material = ("Neon")
--			RBL4.BrickColor = BrickColor.new("Electric blue")
--			RBL5.Material = ("Neon")
--			RBL5.BrickColor = BrickColor.new("Electric blue")
--			RBL6.Material = ("Neon")
--			RBL6.BrickColor = BrickColor.new("Electric blue")
--			RBL7.Material = ("Neon")
--			RBL7.BrickColor = BrickColor.new("Electric blue")

--			SL1.Material = ("SmoothPlastic")
--			SL1.BrickColor = BrickColor.new("Institutional white")
--			SL2.Material = ("SmoothPlastic")
--			SL2.BrickColor = BrickColor.new("Institutional white")
--			SL3.Material = ("SmoothPlastic")
--			SL3.BrickColor = BrickColor.new("Institutional white")
--			SL4.Material = ("SmoothPlastic")
--			SL4.BrickColor = BrickColor.new("Institutional white")

--			LHRRL1.Material = ("Metal")
--			LHRRL1.BrickColor = BrickColor.new("Crimson")
--			LHRRL2.Material = ("Metal")
--			LHRRL2.BrickColor = BrickColor.new("Crimson")
--			RHRRL1.Material = ("Metal")
--			RHRRL1.BrickColor = BrickColor.new("Crimson")
--			RHRRL2.Material = ("Metal")
--			RHRRL2.BrickColor = BrickColor.new("Crimson")
--			wait(0.02)
--			RBL1.Material = ("Neon")
--			RBL1.BrickColor = BrickColor.new("Really red")
--			RBL2.Material = ("Neon")
--			RBL2.BrickColor = BrickColor.new("Really red")
--			RBL3.Material = ("Neon")
--			RBL3.BrickColor = BrickColor.new("Really red")
--			RBL4.Material = ("Neon")
--			RBL4.BrickColor = BrickColor.new("Really red")
--			RBL5.Material = ("Neon")
--			RBL5.BrickColor = BrickColor.new("Really red")
--			RBL6.Material = ("Neon")
--			RBL6.BrickColor = BrickColor.new("Really red")
--			RBL7.Material = ("Neon")
--			RBL7.BrickColor = BrickColor.new("Really red")

--			SL1.Material = ("Neon")
--			SL1.BrickColor = BrickColor.new("Really red")
--			SL2.Material = ("Neon")
--			SL2.BrickColor = BrickColor.new("Really red")
--			SL3.Material = ("Neon")
--			SL3.BrickColor = BrickColor.new("Really red")
--			SL4.Material = ("Neon")
--			SL4.BrickColor = BrickColor.new("Really red")

--			LHRRL1.Material = ("Neon")
--			LHRRL1.BrickColor = BrickColor.new("Really red")
--			LHRRL2.Material = ("Neon")
--			LHRRL2.BrickColor = BrickColor.new("Really red")
--			RHRRL1.Material = ("Neon")
--			RHRRL1.BrickColor = BrickColor.new("Really red")
--			RHRRL2.Material = ("Neon")
--			RHRRL2.BrickColor = BrickColor.new("Really red")
--			wait(0.05)
--		until
--		ReactorLampsGlitch == false
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		SideLampsGlitch = false
--		RoundBlueLampsGlitch = false
--		RoundRedLamps = false
--		wait(72.5)
--		ReactorLampsGlitch = false
--		wait(1)
--		RBL7.Material = ("Metal")
--		RBL7.BrickColor = BrickColor.new("Deep blue")
--		wait(0.1)
--		RBL6.Material = ("Metal")
--		RBL6.BrickColor = BrickColor.new("Deep blue")
--		wait(0.1)
--		RBL5.Material = ("Metal")
--		RBL5.BrickColor = BrickColor.new("Deep blue")
--		wait(0.1)
--		RBL4.Material = ("Metal")
--		RBL4.BrickColor = BrickColor.new("Deep blue")
--		wait(0.1)
--		RBL3.Material = ("Metal")
--		RBL3.BrickColor = BrickColor.new("Deep blue")
--		wait(0.1)
--		RBL2.Material = ("Metal")
--		RBL2.BrickColor = BrickColor.new("Deep blue")
--		wait(0.1)
--		RBL1.Material = ("Metal")
--		RBL1.BrickColor = BrickColor.new("Deep blue")

--		SL1.Material = ("SmoothPlastic")
--		SL1.BrickColor = BrickColor.new("Institutional white")
--		SL2.Material = ("SmoothPlastic")
--		SL2.BrickColor = BrickColor.new("Institutional white")
--		SL3.Material = ("SmoothPlastic")
--		SL3.BrickColor = BrickColor.new("Institutional white")
--		SL4.Material = ("SmoothPlastic")
--		SL4.BrickColor = BrickColor.new("Institutional white")

--		LHRRL1.Material = ("Metal")
--		LHRRL1.BrickColor = BrickColor.new("Crimson")
--		LHRRL2.Material = ("Metal")
--		LHRRL2.BrickColor = BrickColor.new("Crimson")
--		RHRRL1.Material = ("Metal")
--		RHRRL1.BrickColor = BrickColor.new("Crimson")
--		RHRRL2.Material = ("Metal")
--		RHRRL2.BrickColor = BrickColor.new("Crimson")
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		ReactorStatusValue.Value = 7
--		EL1.SpotLight.Enabled = true
--		EL1.HingeConstraint.AngularVelocity = 5
--		EL2.SpotLight.Enabled = true
--		EL2.HingeConstraint.AngularVelocity = 5
--		EL3.SpotLight.Enabled = true
--		EL3.HingeConstraint.AngularVelocity = 5
--		EL4.SpotLight.Enabled = true
--		EL4.HingeConstraint.AngularVelocity = 5
--		wait(68.5)
--		FuseButton1.ClickDetector.MaxActivationDistance = 10
--		FuseButton2.ClickDetector.MaxActivationDistance = 10
--		FuseButton3.ClickDetector.MaxActivationDistance = 10
--		FuseButton4.ClickDetector.MaxActivationDistance = 10
--	end
--end)

--OverloadButton.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		wait(9.5)
--		FuelConsumption = false
--		wait(0.5)
--		FuelConsumption = true
--		repeat
--			FuelCapacityValue.Value = FuelCapacityValue.Value - 1
--			wait(0.5)
--		until
--		FuelConsumption == false
--	end
--end)

--OverloadLever.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		ReactorStatusValue.Value = 6
--		FEM1PullLever.ClickDetector.MaxActivationDistance = 0
--		FEM2PullLever.ClickDetector.MaxActivationDistance = 0
--		FEM3PullLever.ClickDetector.MaxActivationDistance = 0
--		SuperchargerButton.ClickDetector.MaxActivationDistance = 0
--		FuseButton1.ClickDetector.MaxActivationDistance = 0
--		FuseButton2.ClickDetector.MaxActivationDistance = 0
--		FuseButton3.ClickDetector.MaxActivationDistance = 0
--		FuseButton4.ClickDetector.MaxActivationDistance = 0
--		OverloadLever.ClickDetector.MaxActivationDistance = 0
--		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 0
--		RoomAlarm1Sound:Play()
--		OverloadingProcess1:Play()
--		wait(0.05)
--		OverloadingProcess2:Play()
--		SuperChargerIncreasing1:Stop()
--		SuperChargerIncreasing2:Stop()
--		SuperChargerWork1:Stop()
--		SuperChargerWork2:Stop()
--		ReactorStatusLable.Text = ("UNSTABLE")
--		ReactorStatusLable.TextColor3 = Color3.new(1, 0, 0)
--	end
--end)

--OverloadLever.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		SideLampsGlitch = true
--		repeat
--			SL1.Material = ("SmoothPlastic")
--			SL1.BrickColor = BrickColor.new("Institutional white")
--			SL2.Material = ("SmoothPlastic")
--			SL2.BrickColor = BrickColor.new("Institutional white")
--			SL3.Material = ("SmoothPlastic")
--			SL3.BrickColor = BrickColor.new("Institutional white")
--			SL4.Material = ("SmoothPlastic")
--			SL4.BrickColor = BrickColor.new("Institutional white")
--			wait(1)
--			SL1.Material = ("Neon")
--			SL1.BrickColor = BrickColor.new("Electric blue")
--			SL2.Material = ("Neon")
--			SL2.BrickColor = BrickColor.new("Electric blue")
--			SL3.Material = ("Neon")
--			SL3.BrickColor = BrickColor.new("Electric blue")
--			SL4.Material = ("Neon")
--			SL4.BrickColor = BrickColor.new("Electric blue")
--			wait(1)
--		until
--		SideLampsGlitch == false
--	end
--end)

--OverloadLever.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		RoundRedLamps = true
--		repeat
--			LHRRL1.Material = ("Neon")
--			LHRRL1.BrickColor = BrickColor.new("Really red")
--			LHRRL2.Material = ("Neon")
--			LHRRL2.BrickColor = BrickColor.new("Really red")
--			RHRRL1.Material = ("Neon")
--			RHRRL1.BrickColor = BrickColor.new("Really red")
--			RHRRL2.Material = ("Neon")
--			RHRRL2.BrickColor = BrickColor.new("Really red")
--			wait(1.2)
--			LHRRL1.Material = ("Metal")
--			LHRRL1.BrickColor = BrickColor.new("Crimson")
--			LHRRL2.Material = ("Metal")
--			LHRRL2.BrickColor = BrickColor.new("Crimson")
--			RHRRL1.Material = ("Metal")
--			RHRRL1.BrickColor = BrickColor.new("Crimson")
--			RHRRL2.Material = ("Metal")
--			RHRRL2.BrickColor = BrickColor.new("Crimson")
--			wait(1.2)
--		until
--		RoundRedLamps == false
--	end
--end)

--OverloadLever.ClickDetector.MouseClick:Connect(function()
--	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
--		RoundBlueLampsGlitch = true
--		repeat
--			RBL7.Material = ("Metal")
--			RBL7.BrickColor = BrickColor.new("Deep blue")
--			RBL6.Material = ("Metal")
--			RBL6.BrickColor = BrickColor.new("Deep blue")
--			RBL5.Material = ("Metal")
--			RBL5.BrickColor = BrickColor.new("Deep blue")
--			RBL4.Material = ("Metal")
--			RBL4.BrickColor = BrickColor.new("Deep blue")
--			RBL3.Material = ("Metal")
--			RBL3.BrickColor = BrickColor.new("Deep blue")
--			RBL2.Material = ("Metal")
--			RBL2.BrickColor = BrickColor.new("Deep blue")
--			RBL1.Material = ("Metal")
--			RBL1.BrickColor = BrickColor.new("Deep blue")
--			wait(0.3)
--			RBL1.Material = ("Neon")
--			RBL1.BrickColor = BrickColor.new("Electric blue")
--			RBL2.Material = ("Neon")
--			RBL2.BrickColor = BrickColor.new("Electric blue")
--			RBL3.Material = ("Neon")
--			RBL3.BrickColor = BrickColor.new("Electric blue")
--			RBL4.Material = ("Neon")
--			RBL4.BrickColor = BrickColor.new("Electric blue")
--			RBL5.Material = ("Neon")
--			RBL5.BrickColor = BrickColor.new("Electric blue")
--			RBL6.Material = ("Neon")
--			RBL6.BrickColor = BrickColor.new("Electric blue")
--			RBL7.Material = ("Neon")
--			RBL7.BrickColor = BrickColor.new("Electric blue")
--			wait(0.7)
--			RBL7.Material = ("Metal")
--			RBL7.BrickColor = BrickColor.new("Deep blue")
--			RBL6.Material = ("Metal")
--			RBL6.BrickColor = BrickColor.new("Deep blue")
--			RBL5.Material = ("Metal")
--			RBL5.BrickColor = BrickColor.new("Deep blue")
--			RBL4.Material = ("Metal")
--			RBL4.BrickColor = BrickColor.new("Deep blue")
--			RBL3.Material = ("Metal")
--			RBL3.BrickColor = BrickColor.new("Deep blue")
--			RBL2.Material = ("Metal")
--			RBL2.BrickColor = BrickColor.new("Deep blue")
--			RBL1.Material = ("Metal")
--			RBL1.BrickColor = BrickColor.new("Deep blue")
--			wait(0.4)
--			RBL1.Material = ("Neon")
--			RBL1.BrickColor = BrickColor.new("Electric blue")
--			RBL2.Material = ("Neon")
--			RBL2.BrickColor = BrickColor.new("Electric blue")
--			RBL3.Material = ("Neon")
--			RBL3.BrickColor = BrickColor.new("Electric blue")
--			RBL4.Material = ("Neon")
--			RBL4.BrickColor = BrickColor.new("Electric blue")
--			RBL5.Material = ("Neon")
--			RBL5.BrickColor = BrickColor.new("Electric blue")
--			RBL6.Material = ("Neon")
--			RBL6.BrickColor = BrickColor.new("Electric blue")
--			RBL7.Material = ("Neon")
--			RBL7.BrickColor = BrickColor.new("Electric blue")
--			wait(2)
--		until
--		RoundBlueLampsGlitch == false
--	end
--end)
----

--while true do
--	if FuelCapacityValue.Value < 0 then
--		FuelCapacityValue.Value = 0
--		FuelConsumption = false
--	end
--	if FuelCapacityValue.Value == 0 and ReactorStatusValue.Value == 2 then
--		ReactorControlValue.Value = 0
--	end
--	if FuelCapacityValue.Value == 0 and ReactorStatusValue.Value == 6 then
--		ReactorControlValue.Value = 0
--	end
--	if ReactorControlValue.Value == 0 then
--		ReactorControlValue.Value = 3
--		AlarmControlValue.Value = 1
--		if ConsoleStatusValue.Value == 1 then
--			ConsoleControlValue.Value = 0
--		end
--		ReactorStatusValue.Value = 3
--		FEM1PullLever.ClickDetector.MaxActivationDistance = 0
--		FEM2PullLever.ClickDetector.MaxActivationDistance = 0
--		FEM3PullLever.ClickDetector.MaxActivationDistance = 0
--		SuperchargerButton.ClickDetector.MaxActivationDistance = 0
--		ReactorSpeedLever.ClickDetector.MaxActivationDistance = 0
--		ReactorStatusLable.Text = ("SHUTING DOWN")
--		ReactorStatusLable.TextColor3 = Color3.new(1, 0.666667, 0)
--		SideLampsGlitch = false
--		RoundBlueLampsGlitch = false
--		RoundRedLamps = false
--		ReactorOverload = false
--		LeftRoundLightning = false
--		RightRoundLightning = false
--		FuelConsumption = false
--		ElectricalDischarge = false
--		if FuseSystemStatusValue.Value == 0 then
--			FuseButton1.ClickDetector.MaxActivationDistance = 10
--			FuseButton2.ClickDetector.MaxActivationDistance = 10
--			FuseButton3.ClickDetector.MaxActivationDistance = 10
--			FuseButton4.ClickDetector.MaxActivationDistance = 10
--		end
--		SL1.Material = ("SmoothPlastic")
--		SL1.BrickColor = BrickColor.new("Institutional white")
--		SL2.Material = ("SmoothPlastic")
--		SL2.BrickColor = BrickColor.new("Institutional white")
--		SL3.Material = ("SmoothPlastic")
--		SL3.BrickColor = BrickColor.new("Institutional white")
--		SL4.Material = ("SmoothPlastic")
--		SL4.BrickColor = BrickColor.new("Institutional white")
--		EL1.SpotLight.Enabled = true
--		EL1.HingeConstraint.AngularVelocity = 5
--		EL2.SpotLight.Enabled = true
--		EL2.HingeConstraint.AngularVelocity = 5
--		EL3.SpotLight.Enabled = true
--		EL3.HingeConstraint.AngularVelocity = 5
--		EL4.SpotLight.Enabled = true
--		EL4.HingeConstraint.AngularVelocity = 5
--		RoomAlarm1Sound:Stop()
--		OverloadLever.ClickDetector.MaxActivationDistance = 10
--		wait(9)
--		FlyWheelRotatingSoundVeryHigh:Stop()
--		FlyWheelRotatingSoundHigh:Stop()
--		FlyWheelRotatingSoundNormal:Stop()
--		FlyWheelRotatingSoundLow:Stop()
--		FlyWheelRotatingSoundVeryLow:Stop()
--		OverloadingProcess1:Stop()
--		OverloadingProcess2:Stop()
--		ShutDownReactorSound1:Play()
--		FlyWheelRotatingStoppingSound:Play()
--		wait(2)
--		LeftPartOfReactor.HingeConstraint.AngularVelocity = 0
--		wait(0.2)
--		RightPartOfReactor.HingeConstraint.AngularVelocity = 0
--		wait(2)
--		LeftPartOfReactor.Anchored = true
--		LeftPartOfReactor.CanTouch = false
--		RightPartOfReactor.Anchored = true
--		RightPartOfReactor.CanTouch = false
--		wait(0.1)
--		ShutDownReactorSound2:Play()
--		LeftPartOfReactorEnd:Play()
--		LeftStatorOfReactorEnd:Play()
--		wait(0.1)
--		RightPartOfReactorEnd:Play()
--		RightStatorOfReactorEnd:Play()
--		ReactorStatusValue.Value = 4
--		ReactorStatusLable.Text = ("COOLING")
--		ReactorStatusLable.TextColor3 = Color3.new(0.333333, 0.666667, 1)
--		wait(4.5)
--		EL1.SpotLight.Enabled = false
--		EL1.HingeConstraint.AngularVelocity = 0
--		EL2.SpotLight.Enabled = false
--		EL2.HingeConstraint.AngularVelocity = 0
--		EL3.SpotLight.Enabled = false
--		EL3.HingeConstraint.AngularVelocity = 0
--		EL4.SpotLight.Enabled = false
--		EL4.HingeConstraint.AngularVelocity = 0
--		wait(1.5)
--		GreyReactorSmoke1.Enabled = true
--		GreyReactorSmoke2.Enabled = true
--		GreyReactorSmoke3.Enabled = true
--		GreyReactorSmoke4.Enabled = true
--		wait(1.5)
--		GreyReactorSmoke1.Enabled = false
--		GreyReactorSmoke2.Enabled = false
--		GreyReactorSmoke3.Enabled = false
--		GreyReactorSmoke4.Enabled = false
--	end
--	wait(0.1)
--end
