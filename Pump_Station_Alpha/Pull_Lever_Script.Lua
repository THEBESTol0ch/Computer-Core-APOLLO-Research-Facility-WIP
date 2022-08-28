local TweenService = game:GetService("TweenService")

local Trigger = script.Parent.Lever.Trigger
local Lever = script.Parent.Lever.Handle.Handle.Handle
local LeverPos = script.Parent.Lever.LeverPos
local LeverSound = script.Parent.Lever.Handle.Handle.Handle.LeverSound

local PumpStartUpSound = workspace.CoolantPump.SoundEmitter.PumpStartUpSound
local PumpWorkSound = workspace.CoolantPump.SoundEmitter.PumpWorkSound
local PumpShutDownSound = workspace.CoolantPump.SoundEmitter.PumpShutDownSound

local StatusValue = workspace.CoolantPump.Values.StatusValue
local PowerValue = workspace.CoolantPump.Values.PowerValue
local CRCPowerValue = workspace.CRCCSMonitor.PowerValue
local RPMValue = workspace.CoolantPump.Values.RPMValue
local InputEnergyValue = workspace.CoolantPump.Values.InputEnergyValue

local StatusLabel = workspace.CoolantPumpMonitor.Lines.Status.SurfaceGui.TextLabel
local CRCStatusLabel = workspace.CRCCSMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local PowerLabel = workspace.CoolantPumpMonitor.Lines.Power.SurfaceGui.TextLabel
local CRCPowerLabel = workspace.CRCCSMonitor.Monitor.Lines.PowerLabel.SurfaceGui.TextLabel
local RPMLabel = workspace.CoolantPumpMonitor.Lines.RPM.SurfaceGui.TextLabel
local InputEnergyLabel = workspace.CoolantPumpMonitor.Lines.InputEnergy.SurfaceGui.TextLabel
local PercentLabel = workspace.CoolantPumpMonitor.Lines.Percent.SurfaceGui.TextLabel

local FanRotor = workspace.CRCCSMonitor.Monitor.Marks.Fan.Rotor

local BlackoutStatusValue = workspace.FacilityLight.CPU.Values.BlackoutStatusValue

local LeverPullIn = {
	CFrame = LeverPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut = {
	CFrame = Lever.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local PullLeverAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeverPullIn = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn)
local LeverPullOut = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut)

local Lever = true

Trigger.ClickDetector.MouseClick:Connect(function()
	if Lever == false then
		Lever = true
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut:Play()
		LeverSound:Play()
		StatusLabel.Text = ("STARTING UP")
		StatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		CRCStatusLabel.Text = ("STARTING UP")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		StatusValue.Value = 1
		PumpStartUpSound:Play()
		wait(8.7)
		StatusLabel.Text = ("ONLINE")
		StatusLabel.TextColor3 = Color3.new(0, 1, 0)
		CRCStatusLabel.Text = ("ONLINE")
		CRCStatusLabel.TextColor3 = Color3.new(0, 1, 0)
		FanRotor.HingeConstraint.AngularVelocity = -5
		PumpWorkSound:Play()
		wait(10)
		Trigger.ClickDetector.MaxActivationDistance = 10
	else
		Lever = false
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn:Play()
		LeverSound:Play()
		StatusLabel.Text = ("SHUTTING DOWN")
		StatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		CRCStatusLabel.Text = ("SHUTTING DOWN")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		StatusValue.Value = 0
		PumpShutDownSound:Play()
		wait(0.05)
		PumpWorkSound:Stop()
		wait(8)
		StatusLabel.Text = ("OFFLINE")
		StatusLabel.TextColor3 = Color3.new(1, 0, 0)
		CRCStatusLabel.Text = ("OFFLINE")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		FanRotor.HingeConstraint.AngularVelocity = 0
		wait(2)
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 1 then
		repeat
			PowerValue.Value = PowerValue.Value + 2
			wait(0.01)
		until
		PowerValue.Value == 100
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 1 then
		repeat
			CRCPowerValue.Value = CRCPowerValue.Value + 2
			wait(0.01)
		until
		CRCPowerValue.Value == 100
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 1 then
		repeat
			RPMValue.Value = RPMValue.Value + 12
			wait(0.01)
		until
		RPMValue.Value > 2970
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 1 then
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value + 8
			wait(0.01)
		until
		InputEnergyValue.Value > 620
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 0 then
		repeat
			PowerValue.Value = PowerValue.Value - 2
			wait(0.01)
		until
		PowerValue.Value == 0
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 0 then
		repeat
			CRCPowerValue.Value = CRCPowerValue.Value - 2
			wait(0.01)
		until
		CRCPowerValue.Value == 0
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 0 then
		repeat
			RPMValue.Value = RPMValue.Value - 12
			wait(0.01)
		until
		RPMValue.Value == 0
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.1)
	if StatusValue.Value == 0 then
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value - 24
			wait(0.01)
		until
		InputEnergyValue.Value == 0
	end
end)

local CanEvent = true

while true do
	if CanEvent == true and Lever == true and BlackoutStatusValue.Value == 1 then
		CanEvent = false
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 0
		StatusValue.Value = 0
		CRCStatusLabel.Text = ("OFFLINE")
		CRCStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		FanRotor.HingeConstraint.AngularVelocity = 0
		CRCPowerValue.Value = 0
		PumpShutDownSound:Play()
		wait(0.05)
		PumpWorkSound:Stop()
	end
	if CanEvent == false and BlackoutStatusValue.Value == 0 then
		CanEvent = true
		wait(1.2)
		StatusValue.Value = 1
		CRCStatusLabel.Text = ("ONLINE")
		CRCStatusLabel.TextColor3 = Color3.new(0, 1, 0)
		FanRotor.HingeConstraint.AngularVelocity = -5
		CRCPowerValue.Value = 100
		PumpStartUpSound:Play()
		wait(8.7)
		PumpWorkSound:Play()
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
	wait(0.1)
end
