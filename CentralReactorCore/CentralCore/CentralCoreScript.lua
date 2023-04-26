-- Control
local Button = workspace.CRCConsole.CapButton.Button
local CRCPurgeAdvancedButton = workspace.CRCPurgeAdvancedButton.Button.Trigger
local CRCAdvancedLever = workspace.CRCAdvancedLever.Lever.Handle
local MDAButton = workspace.MDACapButton.Button
--

-- Values
local CentralReactorCoreStatusValue = script.Parent.Parent.Values.CentralReactorCoreStatusValue
local IntegrityValue = script.Parent.Parent.Values.IntegrityValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue
local DischargeDelayValue = script.Parent.Parent.Values.DischargeDelayValue
local DischargeLockValue = workspace.CentralReactorCore.CentralCore.CPU.Values.DischargeLockValue

local KeyPickupValue = script.Parent.Parent.Parent.Parent.CPU.Values.KeyPickupValue

local AlphaCoreStatusValue = script.Parent.Parent.Parent.Parent.AlphaCore.CPU.Values.CoreStatusValue
local AlphaDischargeValue = script.Parent.Parent.Parent.Parent.AlphaCore.CPU.Values.DischargeValue
local BetaCoreStatusValue = script.Parent.Parent.Parent.Parent.BetaCore.CPU.Values.CoreStatusValue
local BetaDischargeValue = script.Parent.Parent.Parent.Parent.BetaCore.CPU.Values.DischargeValue
local GammaCoreStatusValue = script.Parent.Parent.Parent.Parent.GammaCore.CPU.Values.CoreStatusValue
local GammaDischargeValue = script.Parent.Parent.Parent.Parent.GammaCore.CPU.Values.DischargeValue
local DeltaCoreStatusValue = script.Parent.Parent.Parent.Parent.DeltaCore.CPU.Values.CoreStatusValue
local DeltaDischargeValue = script.Parent.Parent.Parent.Parent.DeltaCore.CPU.Values.DischargeValue

local TornadoEffectValue = script.Parent.Parent.Parent.Parent.TornadoEffect.CPU.Values.TornadoEffectValue
local DamageReactorValue = script.Parent.Parent.Parent.Parent.CPU.Values.DamageReactorValue

local DestroyPumpValue = workspace.PumpStationAlphaDamageSystem.CPU.Values.DestroyPumpValue

local MilitaryForceCounterValue = game.ReplicatedStorage.GameValues.MilitaryForceCounterValue
--

-- Sounds
local CentralReactorCoreAlarmSound = script.Parent.Parent.Parent.SoundEmitter.CentralReactorCoreAlarmSound
local CentralCoreLastPhaseSound = script.Parent.Parent.Parent.SoundEmitter.CentralCoreLastPhaseSound
local CentralCoreOverchargedSound = script.Parent.Parent.Parent.SoundEmitter.CentralCoreOverchargedSound
local CentralCoreLastPhaseAmbient = script.Parent.Parent.Parent.SoundEmitter.CentralCoreLastPhaseAmbient
--

-- Monitoring
local CRCStatusLabel = workspace.CRCMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local IntegrityLabel = workspace.CRCMonitor.Monitor.Lines.IntegrityLabel.SurfaceGui.TextLabel
local TemperatureLabel = workspace.CRCMonitor.Monitor.Lines.TemperatureLabel.SurfaceGui.TextLabel
local EnergyCapacityLabel = workspace.CRCMonitor.Monitor.Lines.EnergyCapacityLabel.SurfaceGui.TextLabel
--

-- Functions
function DoValuesMonitoring()
	if not (CentralReactorCoreStatusValue.Value == "ERROR") then
		IntegrityLabel.Text = (IntegrityValue.Value.." %")
		TemperatureLabel.Text = (TemperatureValue.Value.." °C")
		EnergyCapacityLabel.Text = (EnergyCapacityValue.Value.." V")
		if IntegrityValue.Value < 0 then
			IntegrityValue.Value = 0
		elseif IntegrityValue.Value < 50 and IntegrityValue.Value > 20 then
			IntegrityLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		elseif IntegrityValue.Value < 20 then
			IntegrityLabel.TextColor3 = Color3.new(1, 0, 0)
		end
		if TemperatureValue.Value > 3000 then
			TemperatureLabel.TextColor3 = Color3.new(1, 0, 0)
		elseif TemperatureValue.Value < 1000 then
			TemperatureLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		end
		if EnergyCapacityValue.Value > 110000 then
			EnergyCapacityLabel.TextColor3 = Color3.new(1, 0, 0)
		elseif EnergyCapacityValue.Value > 50000 and EnergyCapacityValue.Value < 110000 then
			EnergyCapacityLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		elseif EnergyCapacityValue.Value < 50000 then
			EnergyCapacityLabel.TextColor3 = Color3.new(0, 1, 0)
		end
	elseif CentralReactorCoreStatusValue.Value == "ERROR" then
		CRCStatusLabel.Text = ("ERROR")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		IntegrityLabel.Text = ("ERROR")
		IntegrityLabel.TextColor3 = Color3.new(1, 0, 0)
		TemperatureLabel.Text = ("ERROR")
		TemperatureLabel.TextColor3 = Color3.new(1, 0, 0)
		EnergyCapacityLabel.Text = ("ERROR")
		EnergyCapacityLabel.TextColor3 = Color3.new(1, 0, 0)
	end
end
function DoCheck()
	if AlphaCoreStatusValue.Value == "ONLINE" and BetaCoreStatusValue.Value == "ONLINE" and GammaCoreStatusValue.Value == "ONLINE" and DeltaCoreStatusValue.Value == "ONLINE" then
		wait(1)
		DischargeDelayValue.Value = 2.5
		DischargeLockValue.Value = false
		CentralReactorCoreAlarmSound.Looped = false
		if IntegrityValue.Value > 75 then
			CRCStatusLabel.Text = ("ONLINE")
			CRCStatusLabel.TextColor3 = Color3.new(0, 1, 0)
			CentralReactorCoreStatusValue.Value = "ONLINE"
		elseif IntegrityValue.Value < 75 and IntegrityValue.Value > 20 then
			CRCStatusLabel.Text = ("UNSTABLE")
			CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
			CentralReactorCoreStatusValue.Value = "UNSTABLE"
		elseif IntegrityValue.Value < 20 then
			CRCStatusLabel.Text = ("CRITICAL")
			CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
			CentralReactorCoreStatusValue.Value = "CRITICAL"
		end
	end
end
--

IntegrityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
TemperatureValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
EnergyCapacityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)

AlphaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
BetaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
GammaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
DeltaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)

Button.ClickDetector.MouseClick:Connect(function()
	CentralReactorCoreAlarmSound.Looped = true
	CentralReactorCoreAlarmSound:Play()
	CentralReactorCoreStatusValue.Value = "POWER ON"
	CRCStatusLabel.Text = ("POWER ON")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
end)

CRCPurgeAdvancedButton.ClickDetector.MouseClick:Connect(function()
	CRCStatusLabel.Text = ("PURGE IN PROGRESS")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	DischargeLockValue.Value = true
	wait(19.4)
	TornadoEffectValue.Value = false
	KeyPickupValue.Value = true
	EnergyCapacityValue.Value = 0
	CRCStatusLabel.Text = ("OFFLINE")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
	CentralReactorCoreStatusValue.Value = "OFFLINE"
end)

CRCAdvancedLever.ClickDetector.MouseClick:Connect(function()
	wait(2)
	DischargeLockValue.Value = true
	CentralCoreLastPhaseSound:Play()
	wait(5)
	CentralCoreOverchargedSound:Stop()
	wait(15)
	TornadoEffectValue.Value = true
end)

DischargeDelayValue.Changed:Connect(function()
	if DischargeDelayValue.Value == 1.5 then
		CentralCoreOverchargedSound:Play()
	elseif DischargeDelayValue.Value == 0.5 then
		CentralCoreLastPhaseAmbient:Play()
		CentralReactorCoreAlarmSound.Looped = true
		CentralReactorCoreAlarmSound:Play()
		wait(8)
		CentralReactorCoreAlarmSound.Looped = false
	end
end)

IntegrityValue.Changed:Connect(function()
	if IntegrityValue.Value < 0 then
		IntegrityValue.Value = 0
	elseif IntegrityValue.Value == 75 then
		CentralReactorCoreStatusValue.Value = "UNSTABLE"
		CRCStatusLabel.Text = ("UNSTABLE")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		DamageReactorValue.Value = true
	elseif IntegrityValue.Value == 50 then
		DamageReactorValue.Value = true
	elseif IntegrityValue.Value == 38 then
		DestroyPumpValue.Value = true
	elseif IntegrityValue.Value == 25 then
		DamageReactorValue.Value = true
	elseif IntegrityValue.Value == 20 then
		CentralReactorCoreStatusValue.Value = "CRITICAL"
		CRCStatusLabel.Text = ("CRITICAL")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif IntegrityValue.Value == 0 then
		CentralReactorCoreStatusValue.Value = "ERROR"
		CRCStatusLabel.Text = ("ERROR")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		DamageReactorValue.Value = true
		wait(35)
		wait(MilitaryForceCounterValue.Value)
		wait(40)
		CentralReactorCoreStatusValue.Value = "EXPLODE"
	end
end)

MDAButton.ClickDetector.MouseClick:Connect(function()
	CentralReactorCoreStatusValue.Value = "PRIME"
	CRCStatusLabel.Text = ("PRIME")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
end)

while true do
	if DischargeLockValue.Value == false then
		AlphaDischargeValue.Value = true
	end
	wait(DischargeDelayValue.Value)
	if DischargeLockValue.Value == false then
		BetaDischargeValue.Value = true
	end
	wait(DischargeDelayValue.Value)
	if DischargeLockValue.Value == false then
		GammaDischargeValue.Value = true
	end
	wait(DischargeDelayValue.Value)
	if DischargeLockValue.Value == false then
		DeltaDischargeValue.Value = true
	end
	wait(DischargeDelayValue.Value)
end
