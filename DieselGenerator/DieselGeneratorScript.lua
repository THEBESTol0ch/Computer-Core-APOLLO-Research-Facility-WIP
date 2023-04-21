-- Control
local Button = script.Parent.Parent.Parent.Control.Button.Button
local Trigger = script.Parent.Parent.Parent.CapSystem.Trigger
--

-- Values 
local GeneratorControlValue = script.Parent.Parent.Values.GeneratorControlValue
local GeneratorStatusValue = script.Parent.Parent.Values.GeneratorStatusValue
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
local CapStatusValue = script.Parent.Parent.Values.CapStatusValue
local RPMValue = script.Parent.Parent.Values.RPMValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
--

-- Items
local Fan = script.Parent.Parent.Parent.Engine.Fan.Axis
--

-- Sounds
local GeneratorStartSound = script.Parent.Parent.Parent.Engine.SoundEmitter.GeneratorStartSound
local GeneratorWorkSound = script.Parent.Parent.Parent.Engine.SoundEmitter.GeneratorWorkSound
local GeneratorEndSound = script.Parent.Parent.Parent.Engine.SoundEmitter.GeneratorEndSound
--

-- Monitoring
local GeneratorStatusLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Status.SurfaceGui.TextLabel
local FuelCapacityLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local TemperatureLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Temperature.SurfaceGui.TextLabel
local RPMLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.RPM.SurfaceGui.TextLabel
--

-- Functions
function DoValuesMonitoring()
	FuelCapacityLabel.Text = (FuelCapacityValue.Value.." %")
	TemperatureLabel.Text = (TemperatureValue.Value.." °C")
	RPMLabel.Text = RPMValue.Value
	if FuelCapacityValue.Value < 50 then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	if FuelCapacityValue.Value > 50 then
		FuelCapacityLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if FuelCapacityValue.Value < 25 then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0, 0)
	end
end
--

Button.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value == 100 then
		GeneratorControlValue.Value = "START"
	end
end)

GeneratorControlValue.Changed:Connect(function()
	if GeneratorControlValue.Value == "START" then
		Button.ClickDetector.MaxActivationDistance = 0
		FuelCapacityValue.Value = 100
		GeneratorStatusValue.Value = "ONLINE"
		GeneratorStatusLabel.Text = ("ONLINE")
		GeneratorStatusLabel.TextColor3 = Color3.new(0, 1, 0)
		GeneratorControlValue.Value = ""
		Fan.HingeConstraint.AngularVelocity = 10
		GeneratorStartSound:Play()
		wait(9.73)
		GeneratorWorkSound:Play()
	end
end)

FuelCapacityValue.Changed:Connect(function()
	if FuelCapacityValue.Value == 0 then
		if CapStatusValue.Value == "OPENED" then Trigger.CanTouch = true end
		GeneratorStatusValue.Value = "OFFLINE"
		GeneratorStatusLabel.Text = ("OFFLINE")
		GeneratorStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		GeneratorWorkSound:Stop()
		GeneratorEndSound:Play()
		wait(1)
		Fan.HingeConstraint.AngularVelocity = 0
	end
end)

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		repeat
			RPMValue.Value = RPMValue.Value + 298
			wait(0.1)
		until RPMValue.Value == 2980
	elseif GeneratorStatusValue.Value == "OFFLINE" then
		repeat
			RPMValue.Value = RPMValue.Value - 298
			wait(0.1)
		until RPMValue.Value == 0
	end
end)

FuelCapacityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
TemperatureValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
RPMValue.Changed:Connect(function()
	DoValuesMonitoring()
end)

while true do
	if TemperatureValue.Value < 90 and GeneratorStatusValue.Value == "ONLINE" then
		TemperatureValue.Value = TemperatureValue.Value + 1
	elseif TemperatureValue.Value > 29 and GeneratorStatusValue.Value == "OFFLINE" then
		TemperatureValue.Value = TemperatureValue.Value - 1
	end
	wait(1)
end
