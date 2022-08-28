local Button = workspace.CRCConsole.EmergencyButton.Button

local CentralReactorCoreAlarmSound = script.Parent.Parent.Parent.SoundEmitter.CentralReactorCoreAlarmSound

local CentralReactorCoreStatusValue = script.Parent.Parent.Values.CentralReactorCoreStatusValue
local AlphaDischargeControlValue = script.Parent.Parent.Parent.Parent.AlphaCore.CPU.Values.DischargeControlValue
local BetaDischargeControlValue = script.Parent.Parent.Parent.Parent.BetaCore.CPU.Values.DischargeControlValue
local GammaDischargeControlValue = script.Parent.Parent.Parent.Parent.GammaCore.CPU.Values.DischargeControlValue
local DeltaDischargeControlValue = script.Parent.Parent.Parent.Parent.DeltaCore.CPU.Values.DischargeControlValue

local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargerStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargerStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargerStatusValue

local AlphaDischargerPrimeStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerPrimeStatusValue
local BetaDischargerPrimeStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargerPrimeStatusValue
local GammaDischargerPrimeStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargerPrimeStatusValue
local DeltaDischargerPrimeStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargerPrimeStatusValue

local CRCStatusLabel = workspace.CRCMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel

local AlphaCoreStatusLabel1 = workspace.AlphaCoreMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local AlphaCoreStatusLabel2 = workspace.CRCPurgeSystemMonitor.Monitor.Lines.AlphaCoreStatusLabel.SurfaceGui.TextLabel
local AlphaCoreStatusLabel3 = workspace.CRCPurgeSystemConsoleMonitor.Lines.AlphaCoreStatusLabel.SurfaceGui.TextLabel
local AlphaCoreConsoleStatusLabel = workspace.AlphaCoreConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel
local BetaCoreStatusLabel1 = workspace.BetaCoreMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local BetaCoreStatusLabel2 = workspace.CRCPurgeSystemMonitor.Monitor.Lines.BetaCoreStatusLabel.SurfaceGui.TextLabel
local BetaCoreStatusLabel3 = workspace.CRCPurgeSystemConsoleMonitor.Lines.BetaCoreStatusLabel.SurfaceGui.TextLabel
local BetaCoreConsoleStatusLabel = workspace.BetaCoreConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel
local GammaCoreStatusLabel1 = workspace.GammaCoreMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local GammaCoreStatusLabel2 = workspace.CRCPurgeSystemMonitor.Monitor.Lines.GammaCoreStatusLabel.SurfaceGui.TextLabel
local GammaCoreStatusLabel3 = workspace.CRCPurgeSystemConsoleMonitor.Lines.GammaCoreStatusLabel.SurfaceGui.TextLabel
local GammaCoreConsoleStatusLabel = workspace.GammaCoreConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel
local DeltaCoreStatusLabel1 = workspace.DeltaCoreMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local DeltaCoreStatusLabel2 = workspace.CRCPurgeSystemMonitor.Monitor.Lines.DeltaCoreStatusLabel.SurfaceGui.TextLabel
local DeltaCoreStatusLabel3 = workspace.CRCPurgeSystemConsoleMonitor.Lines.DeltaCoreStatusLabel.SurfaceGui.TextLabel
local DeltaCoreConsoleStatusLabel = workspace.DeltaCoreConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel

local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargerStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargerStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargerStatusValue

local AlphaCoreIncreaseButton = workspace.AlphaCoreIncreaseButton.Button
local AlphaCoreDecreaseButton = workspace.AlphaCoreDecreaseButton.Button
local BetaCoreIncreaseButton = workspace.BetaCoreIncreaseButton.Button
local BetaCoreDecreaseButton = workspace.BetaCoreDecreaseButton.Button
local GammaCoreIncreaseButton = workspace.GammaCoreIncreaseButton.Button
local GammaCoreDecreaseButton = workspace.GammaCoreDecreaseButton.Button
local DeltaCoreIncreaseButton = workspace.DeltaCoreIncreaseButton.Button
local DeltaCoreDecreaseButton = workspace.DeltaCoreDecreaseButton.Button

local CentralCoreOverchargedSound = workspace.CentralReactorCore.CentralCore.SoundEmitter.CentralCoreOverchargedSound
local CentralCoreLastPhaseAmbient = workspace.CentralReactorCore.CentralCore.SoundEmitter.CentralCoreLastPhaseAmbient

local CRCPurgeAdvancedButton = workspace.CRCPurgeAdvancedButton.Button.Trigger

local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue

local DischargeLockValue = workspace.CentralReactorCore.CentralCore.CPU.Values.DischargeLockValue

local RoomAlarm1Sound = workspace.CRCConsoleSpeaker.SoundEmitter.RoomAlarm1Sound

local CRCDamagedModule1StatusValue = workspace.CRCDamagedModule1.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule2StatusValue = workspace.CRCDamagedModule2.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule3StatusValue = workspace.CRCDamagedModule3.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule4StatusValue = workspace.CRCDamagedModule4.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule5StatusValue = workspace.CRCDamagedModule5.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule6StatusValue = workspace.CRCDamagedModule6.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule7StatusValue = workspace.CRCDamagedModule7.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule8StatusValue = workspace.CRCDamagedModule8.CPU.Values.CRCDamagedModuleStatusValue

Button.ClickDetector.MouseClick:Connect(function()
	AlphaDischargerPrimeStatusValue.Value = 0
	BetaDischargerPrimeStatusValue.Value = 0
	GammaDischargerPrimeStatusValue.Value = 0
	DeltaDischargerPrimeStatusValue.Value = 0
	CentralReactorCoreAlarmSound.Looped = true
	CentralReactorCoreAlarmSound:Play()
	CRCStatusLabel.Text = ("POWERING ON")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(1)
	AlphaCoreStatusLabel1.Text = ("ONLINE")
	AlphaCoreStatusLabel1.TextColor3 = Color3.new(0, 1, 0)
	AlphaCoreStatusLabel2.Text = ("ONLINE")
	AlphaCoreStatusLabel2.TextColor3 = Color3.new(0, 1, 0)
	AlphaCoreStatusLabel3.Text = ("ONLINE")
	AlphaCoreStatusLabel3.TextColor3 = Color3.new(0, 1, 0)
	AlphaCoreConsoleStatusLabel.Text = ("ONLINE")
	AlphaCoreConsoleStatusLabel.TextColor3 = Color3.new(0, 1, 0)
	wait(1)
	wait(1)
	wait(1)
	BetaCoreStatusLabel1.Text = ("ONLINE")
	BetaCoreStatusLabel1.TextColor3 = Color3.new(0, 1, 0)
	BetaCoreStatusLabel2.Text = ("ONLINE")
	BetaCoreStatusLabel2.TextColor3 = Color3.new(0, 1, 0)
	BetaCoreStatusLabel3.Text = ("ONLINE")
	BetaCoreStatusLabel3.TextColor3 = Color3.new(0, 1, 0)
	BetaCoreConsoleStatusLabel.Text = ("ONLINE")
	BetaCoreConsoleStatusLabel.TextColor3 = Color3.new(0, 1, 0)
	wait(1)
	wait(1)
	wait(1)
	GammaCoreStatusLabel1.Text = ("ONLINE")
	GammaCoreStatusLabel1.TextColor3 = Color3.new(0, 1, 0)
	GammaCoreStatusLabel2.Text = ("ONLINE")
	GammaCoreStatusLabel2.TextColor3 = Color3.new(0, 1, 0)
	GammaCoreStatusLabel3.Text = ("ONLINE")
	GammaCoreStatusLabel3.TextColor3 = Color3.new(0, 1, 0)
	GammaCoreConsoleStatusLabel.Text = ("ONLINE")
	GammaCoreConsoleStatusLabel.TextColor3 = Color3.new(0, 1, 0)
	CentralReactorCoreAlarmSound.Looped = false
	wait(1)
	wait(1)
	DeltaCoreStatusLabel1.Text = ("ONLINE")
	DeltaCoreStatusLabel1.TextColor3 = Color3.new(0, 1, 0)
	DeltaCoreStatusLabel2.Text = ("ONLINE")
	DeltaCoreStatusLabel2.TextColor3 = Color3.new(0, 1, 0)
	DeltaCoreStatusLabel3.Text = ("ONLINE")
	DeltaCoreStatusLabel3.TextColor3 = Color3.new(0, 1, 0)
	DeltaCoreConsoleStatusLabel.Text = ("ONLINE")
	DeltaCoreConsoleStatusLabel.TextColor3 = Color3.new(0, 1, 0)
	wait(1)
	CRCStatusLabel.Text = ("STABLE")
	CRCStatusLabel.TextColor3 = Color3.new(0, 1, 0)
	wait(1)
	CentralReactorCoreStatusValue.Value = 1
end)

CRCPurgeAdvancedButton.ClickDetector.MouseClick:Connect(function()
	CRCStatusLabel.Text = ("PURGE IN PROGRESS")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(19.4)
	CRCStatusLabel.Text = ("OFFLINE")
	CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
	EnergyCapacityValue.Value = 0
	RoomAlarm1Sound:Stop()
	AlphaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 10
	AlphaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 10
	BetaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 10
	BetaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 10
	GammaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 10
	GammaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 10
	DeltaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 10
	DeltaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 10
	AlphaCoreStatusValue.Value = 1
	BetaCoreStatusValue.Value = 1
	GammaCoreStatusValue.Value = 1
	DeltaCoreStatusValue.Value = 1
	DischargeLockValue.Value = 0
	CentralReactorCoreStatusValue.Value = 0
end)

while true do
	if CentralReactorCoreStatusValue.Value == 1 then
		if DischargeLockValue.Value == 0 then
			AlphaDischargeControlValue.Value = 1
		end
		wait(2.5)
		if DischargeLockValue.Value == 0 then
			BetaDischargeControlValue.Value = 1
		end
		wait(2.5)
		if DischargeLockValue.Value == 0 then
			GammaDischargeControlValue.Value = 1
		end
		wait(2.5)
		if DischargeLockValue.Value == 0 then
			DeltaDischargeControlValue.Value = 1
		end
		wait(2.5)
	end
	if CentralReactorCoreStatusValue.Value == 2 then
		if DischargeLockValue.Value == 0 then
			AlphaDischargeControlValue.Value = 1
		end
		wait(2)
		if DischargeLockValue.Value == 0 then
			BetaDischargeControlValue.Value = 1
		end
		wait(2)
		if DischargeLockValue.Value == 0 then
			GammaDischargeControlValue.Value = 1
		end
		wait(2)
		if DischargeLockValue.Value == 0 then
			DeltaDischargeControlValue.Value = 1
		end
		wait(2)
	end
	if CentralReactorCoreStatusValue.Value == 3 then
		if DischargeLockValue.Value == 0 then
			AlphaDischargeControlValue.Value = 1
		end
		wait(1.5)
		if DischargeLockValue.Value == 0 then
			BetaDischargeControlValue.Value = 1
		end
		wait(1.5)
		if DischargeLockValue.Value == 0 then
			GammaDischargeControlValue.Value = 1
		end
		wait(1.5)
		if DischargeLockValue.Value == 0 then
			DeltaDischargeControlValue.Value = 1
		end
		wait(1.5)
	end
	if CentralReactorCoreStatusValue.Value == 4 then
		if DischargeLockValue.Value == 0 then
			AlphaDischargeControlValue.Value = 1
		end
		wait(1)
		if DischargeLockValue.Value == 0 then
			BetaDischargeControlValue.Value = 1
		end
		wait(1)
		if DischargeLockValue.Value == 0 then
			GammaDischargeControlValue.Value = 1
		end
		wait(1)
		if DischargeLockValue.Value == 0 then
			DeltaDischargeControlValue.Value = 1
		end
		wait(1)
	end
	if CentralReactorCoreStatusValue.Value == 5 then
		if DischargeLockValue.Value == 0 then
			AlphaDischargeControlValue.Value = 1
		end
		wait(0.5)
		if DischargeLockValue.Value == 0 then
			BetaDischargeControlValue.Value = 1
		end
		wait(0.5)
		if DischargeLockValue.Value == 0 then
			GammaDischargeControlValue.Value = 1
		end
		wait(0.5)
		if DischargeLockValue.Value == 0 then
			DeltaDischargeControlValue.Value = 1
		end
		wait(0.5)
	end
	wait(0.1)
end
