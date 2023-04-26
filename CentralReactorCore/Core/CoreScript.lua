-- Control
local Core = script.Parent.Parent.Parent
local Values = script.Parent.Parent.Values
local IncreaseButton = workspace[Core.Name.."IncreaseButton"].Button
local DecreaseButton = workspace[Core.Name.."DecreaseButton"].Button

local SoundEmitter = Core.SoundEmitter

local AdvancedLever = workspace[Core.Name.."_AdvancedLever"].Lever.Handle
local CRCAdvancedLever = workspace.CRCAdvancedLever.Lever.Handle
--

-- Values
local CoreStatusValue = Values.CoreStatusValue
local TemperatureValue = Values.TemperatureValue
local IntegrityValue = Values.IntegrityValue
local EnergyDischargeCoef = Values.EnergyDischargeCoef
local DischargeValue = Values.DischargeValue

local CoolingCoef = workspace.CoolantPump.CPU.Values.CoolingCoef

local EnergyCapacityValue = Core.Parent.CentralCore.CPU.Values.EnergyCapacityValue
local CentralReactorCoreStatusValue = Core.Parent.CentralCore.CPU.Values.CentralReactorCoreStatusValue

local CoolantPumpStatusValue = workspace.CoolantPump.CPU.Values.PumpStatusValue

local DischargeLockValue = workspace.CentralReactorCore.CentralCore.CPU.Values.DischargeLockValue
local DischargeDelayValue = workspace.CentralReactorCore.CentralCore.CPU.Values.DischargeDelayValue

local KeyPickupValue = workspace.CentralReactorCore.CPU.Values.KeyPickupValue
--

-- Items
local Lightning = Core.Lightning.Lightning
local LightningPositions = Core.Lightning.Positions
local DeathTrigger = Core.DeathTrigger.DeathTriggerScript
local BlastSphere = Core.BlastSphere
local Smoke = Core.SmokeEmitter.Smoke
local ErrorMessage = workspace.CRCHologram.Hologram[Core.Name].ErrorMessage
local DownDischargerHologram = workspace.CRCHologram.Hologram[Core.Name].DownDischarger
--

-- Sounds
local CoreOverloadSound = Core.SoundEmitter.CoreOverloadSound
--

-- Monitoring
local Monitor = workspace[Core.Name.."Monitor"].Monitor
local ConsoleMonitor = workspace[Core.Name.."ConsoleMonitor"]
local StatusLabel1 = workspace.CRCPurgeSystemMonitor.Monitor.Lines[Core.Name.."StatusLabel"].SurfaceGui.TextLabel
local StatusLabel2 = workspace.CRCPurgeSystemConsoleMonitor.Lines[Core.Name.."StatusLabel"].SurfaceGui.TextLabel
--

-- Functions
function DoMonitoring(Text, Color)
	StatusLabel1.Text = Text
	StatusLabel1.TextColor3 = Color
	StatusLabel2.Text = Text
	StatusLabel2.TextColor3 = Color
	Monitor.Lines.StatusLabel.SurfaceGui.TextLabel.Text = Text
	Monitor.Lines.StatusLabel.SurfaceGui.TextLabel.TextColor3 = Color
	ConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel.Text = Text
	ConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel.TextColor3 = Color
end

function DoValuesMonitoring()
	if CoreStatusValue.Value == "ONLINE" then
		Monitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.Text = (TemperatureValue.Value.." °C")
		ConsoleMonitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.Text = (TemperatureValue.Value.." °C")
		Monitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.Text = (IntegrityValue.Value.." %")
		ConsoleMonitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.Text = (IntegrityValue.Value.." %")
		Monitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.Text = (EnergyDischargeCoef.Value.." V")
		ConsoleMonitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.Text = (EnergyDischargeCoef.Value.." V")
		if TemperatureValue.Value > 1000 then
			Monitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
			ConsoleMonitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		elseif TemperatureValue.Value < 1000 then
			Monitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
			ConsoleMonitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		end
		if IntegrityValue.Value < 0 then
			IntegrityValue.Value = 0
		elseif IntegrityValue.Value < 50 and IntegrityValue.Value > 10 then
			Monitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
			ConsoleMonitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		elseif IntegrityValue.Value < 10 then
			Monitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
			ConsoleMonitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		end
		if EnergyDischargeCoef.Value >= 12000 then
			Monitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
			ConsoleMonitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		elseif EnergyDischargeCoef.Value < 12000 and EnergyDischargeCoef.Value > 4000 then
			Monitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
			ConsoleMonitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		elseif EnergyDischargeCoef.Value <= 4000 then
			Monitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
			ConsoleMonitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		end
		if EnergyCapacityValue.Value >= 110000 then
			DoMonitoring("READY TO PRIME", Color3.new(1, 0.666667, 0))
		elseif EnergyCapacityValue.Value < 100000 then
			DoMonitoring("ONLINE", Color3.new(0, 1, 0))
		end
	elseif CoreStatusValue.Value == "ERROR" then
		Monitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.Text = ("ERROR")
		ConsoleMonitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.Text = ("ERROR")
		Monitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		ConsoleMonitor.Lines.TemperatureLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		Monitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.Text = ("ERROR")
		ConsoleMonitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.Text = ("ERROR")
		Monitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		ConsoleMonitor.Lines.IntegrityLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		Monitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.Text = ("ERROR")
		ConsoleMonitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.Text = ("ERROR")
		Monitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		ConsoleMonitor.Lines.EnergyDischargeLabel.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
	end
end
--

TemperatureValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
IntegrityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
EnergyDischargeCoef.Changed:Connect(function()
	DoValuesMonitoring()
end)
EnergyCapacityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)

IncreaseButton.ClickDetector.MouseClick:Connect(function()
	if EnergyDischargeCoef.Value < 16000 and CoreStatusValue.Value == "ONLINE" and not (CentralReactorCoreStatusValue.Value == "PRIME") and not (CentralReactorCoreStatusValue.Value == "PRIMED") then
		EnergyDischargeCoef.Value = EnergyDischargeCoef.Value + 1000
	end
end)

DecreaseButton.ClickDetector.MouseClick:Connect(function()
	if EnergyDischargeCoef.Value > 1000 and CoreStatusValue.Value == "ONLINE" and not (CentralReactorCoreStatusValue.Value == "PRIME") and not (CentralReactorCoreStatusValue.Value == "PRIMED") then
		EnergyDischargeCoef.Value = EnergyDischargeCoef.Value - 1000
	end
end)

DischargeValue.Changed:Connect(function()
	if DischargeValue.Value == true and EnergyCapacityValue.Value > EnergyDischargeCoef.Value and not (CoreStatusValue.Value == "ERROR") then
		DischargeValue.Value = false
		DeathTrigger.Enabled = true
		if CoreStatusValue.Value == "ONLINE" then EnergyCapacityValue.Value = EnergyCapacityValue.Value - EnergyDischargeCoef.Value end
		if EnergyDischargeCoef.Value == 12000 then
			TemperatureValue.Value = TemperatureValue.Value + 10
			IntegrityValue.Value = IntegrityValue.Value - 1
		elseif EnergyDischargeCoef.Value == 13000 then
			TemperatureValue.Value = TemperatureValue.Value + 21
			IntegrityValue.Value = IntegrityValue.Value - 2
		elseif EnergyDischargeCoef.Value == 14000 then
			TemperatureValue.Value = TemperatureValue.Value + 42
			IntegrityValue.Value = IntegrityValue.Value - 3
		elseif EnergyDischargeCoef.Value == 15000 then
			TemperatureValue.Value = TemperatureValue.Value + 84
			IntegrityValue.Value = IntegrityValue.Value - 4
		elseif EnergyDischargeCoef.Value == 16000 then
			TemperatureValue.Value = TemperatureValue.Value + 126
			IntegrityValue.Value = IntegrityValue.Value - 5
		end
		SoundEmitter["ElectricDischargeSound"..math.random(1, 6)]:Play()
		local RandomIndex = math.random(1, 2)
		Lightning.Position = LightningPositions["Pos"..RandomIndex].Position
		Lightning.Orientation = LightningPositions["Pos"..RandomIndex].Orientation
		Lightning.Transparency = 0
		Lightning.PointLight.Enabled = true
		Lightning.CanTouch = true
		wait(0.1)
		Lightning.Transparency = 1
		Lightning.PointLight.Enabled = false
		Lightning.CanTouch = false
		wait(0.1)
		DeathTrigger.Enabled = false
	end
	DischargeValue.Value = false
end)

IntegrityValue.Changed:Connect(function()
	if IntegrityValue.Value <= 0 then
		CoreStatusValue.Value = "ERROR"
		DoMonitoring("ERROR", Color3.new(1, 0, 0))
		SoundEmitter["Explosion"..math.random(1, 3).."Sound"]:Play()
		BlastSphere.Transparency = 0
		BlastSphere.PointLight.Enabled = true
		Smoke.Enabled = true
		ErrorMessage.Transparency = 0.4
		DownDischargerHologram.BrickColor = BrickColor.new("Really red")
		wait(0.2)
		BlastSphere.Transparency = 1
		BlastSphere.PointLight.Enabled = false
	end
end)

CentralReactorCoreStatusValue.Changed:Connect(function()
	if CentralReactorCoreStatusValue.Value == "POWER ON" then
		CoreStatusValue.Value = "POWER ON"
		DoMonitoring("POWER ON", Color3.new(1, 0.666667, 0))
		wait(math.random(1, 10))
		CoreStatusValue.Value = "ONLINE"
		DoMonitoring("ONLINE", Color3.new(0, 1, 0))
	elseif CentralReactorCoreStatusValue.Value == "OFFLINE" then
		DoMonitoring("OFFLINE", Color3.new(1, 0, 0))
	elseif CentralReactorCoreStatusValue.Value == "PRIME" then
		EnergyDischargeCoef.Value = 8000
	elseif CentralReactorCoreStatusValue.Value == "PURGE" then
		DoMonitoring("PURGE IN PROGRESS", Color3.new(1, 0.666667, 0))
	end
end)

AdvancedLever.ClickDetector.MouseClick:Connect(function()
	wait(2)
	CoreStatusValue.Value = "PRIMING"
	DoMonitoring("PRIMING", Color3.new(1, 0.666667, 0))
	DischargeLockValue.Value = true
	CoreOverloadSound:Play()
	wait(8.1)
	DischargeDelayValue.Value = DischargeDelayValue.Value - 0.5
	DischargeLockValue.Value = false
	KeyPickupValue.Value = false
	DischargeValue.Value = true
	CoreStatusValue.Value = "PRIMED"
	DoMonitoring("PRIMED", Color3.new(1, 0.666667, 0))
end)

CRCAdvancedLever.ClickDetector.MouseClick:Connect(function()
	wait(7)
	DischargeValue.Value = true
	wait(18.2)
	DischargeValue.Value = true
end)

while true do
	if TemperatureValue.Value > 311 then
		TemperatureValue.Value = TemperatureValue.Value - 11
	end
	if TemperatureValue.Value > 438 and CoolantPumpStatusValue.Value == "ONLINE" and CoreStatusValue.Value == "ONLINE" then
		TemperatureValue.Value = TemperatureValue.Value - CoolingCoef.Value
	end
	wait(1)
end
