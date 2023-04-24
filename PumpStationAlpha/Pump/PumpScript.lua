-- Control
local Values = script.Parent.Parent.Values
local Monitor = workspace[script.Parent.Parent.Parent.Name.."_Monitor"]
local SoundEmitter = script.Parent.Parent.Parent.SoundEmitter
--

-- Values
local PumpStatusValue = Values.PumpStatusValue
local PowerValue = Values.PowerValue
local RPMValue = Values.RPMValue
local InputEnergyValue = Values.InputEnergyValue

local PullLeverValue = workspace[script.Parent.Parent.Parent.Name.."_PullLever"].CPU.Values.LeverValue
--

-- Sounds
local PumpStartUpSound = SoundEmitter.PumpStartUpSound
local PumpWorkSound = SoundEmitter.PumpWorkSound
local PumpShutDownSound = SoundEmitter.PumpShutDownSound
--

-- Monitoring
local PumpStatusLabel = Monitor.Lines.PumpStatus.SurfaceGui.TextLabel
local PowerLabel = Monitor.Lines.Power.SurfaceGui.TextLabel
local RPMLabel = Monitor.Lines.RPM.SurfaceGui.TextLabel
local InputEnergyLabel = Monitor.Lines.InputEnergy.SurfaceGui.TextLabel
--

-- Functions
function DoValuesCheck()
	PowerLabel.Text = (PowerValue.Value.." %")
	RPMLabel.Text = RPMValue.Value
	InputEnergyLabel.Text = (InputEnergyValue.Value.." V")
end

function DoCheck()
	if PullLeverValue.Value == "FULL" and PumpStatusValue.Value == "OFFLINE" then
		PumpStatusValue.Value = "POWER ON"
		PumpStatusLabel.Text = ("POWER ON")
		PumpStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		PumpStartUpSound:Play()
		wait(8.7)
		PumpWorkSound:Play()
		PumpStatusLabel.Text = ("ONLINE")
		PumpStatusLabel.TextColor3 = Color3.new(0, 1, 0)
		wait(2)
		PumpStatusValue.Value = "ONLINE"
	elseif PullLeverValue.Value == "LOW" and PumpStatusValue.Value == "ONLINE" then
		PumpStatusValue.Value = "SHUT DOWN"
		PumpStatusLabel.Text = ("SHUT DOWN")
		PumpStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		PumpShutDownSound:Play()
		wait(0.05)
		PumpWorkSound:Stop()
		wait(8)
		PumpStatusLabel.Text = ("OFFLINE")
		PumpStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		wait(2)
		PumpStatusValue.Value = "OFFLINE"
	end
end
--

PowerValue.Changed:Connect(function()
	DoValuesCheck()
end)
RPMValue.Changed:Connect(function()
	DoValuesCheck()
end)
InputEnergyValue.Changed:Connect(function()
	DoValuesCheck()
end)

PullLeverValue.Changed:Connect(function()
	DoCheck()
end)
PumpStatusValue.Changed:Connect(function()
	DoCheck()
end)

PumpStatusValue.Changed:Connect(function()
	if PumpStatusValue.Value == "POWER ON" then
		repeat
			PowerValue.Value = PowerValue.Value + 2
			wait(0.01)
		until PowerValue.Value == 100
	elseif PumpStatusValue.Value == "SHUT DOWN" then
		repeat
			PowerValue.Value = PowerValue.Value - 2
			wait(0.01)
		until PowerValue.Value <= 0
	end
end)

PumpStatusValue.Changed:Connect(function()
	if PumpStatusValue.Value == "POWER ON" then
		repeat
			RPMValue.Value = RPMValue.Value + 24
			wait(0.01)
		until RPMValue.Value > 2970
	elseif PumpStatusValue.Value == "SHUT DOWN" then
		repeat
			RPMValue.Value = RPMValue.Value - 24
			wait(0.05)
		until RPMValue.Value <= 0
	end
end)

PumpStatusValue.Changed:Connect(function()
	if PumpStatusValue.Value == "POWER ON" then
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value + 8
			wait(0.01)
		until InputEnergyValue.Value > 620
	elseif PumpStatusValue.Value == "SHUT DOWN" then
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value - 24
			wait(0.01)
		until InputEnergyValue.Value <= 0
	end
end)
