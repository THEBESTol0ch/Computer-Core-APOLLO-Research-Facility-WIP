local GeneratorStatusLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Status.SurfaceGui.TextLabel
local FuelCapacityLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local TemperatureLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Temperature.SurfaceGui.TextLabel
local RPMLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.RPM.SurfaceGui.TextLabel
local PercentLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Percent.SurfaceGui.TextLabel

local GeneratorStatusValue = script.Parent.Parent.Values.GeneratorStatusValue
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local RPMValue = script.Parent.Parent.Values.RPMValue

local Button = script.Parent.Parent.Parent.Control.Button.Button
local GeneratorStartSound = script.Parent.Parent.Parent.Engine.SoundEmitter.GeneratorStartSound
local GeneratorWorkSound = script.Parent.Parent.Parent.Engine.SoundEmitter.GeneratorWorkSound
local GeneratorEndSound = script.Parent.Parent.Parent.Engine.SoundEmitter.GeneratorEndSound

local Fan = script.Parent.Parent.Parent.Engine.Fan.Axis

local CanEvent = true

Button.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value == 100 then
		Button.ClickDetector.MaxActivationDistance = 0
		GeneratorStatusLabel.Text = ("ONLINE")
		GeneratorStatusLabel.TextColor3 = Color3.new(0, 1, 0)
		Fan.HingeConstraint.AngularVelocity = 10
		GeneratorStatusValue.Value = 1
		CanEvent = true
		GeneratorStartSound:Play()
		wait(9.73)
		GeneratorWorkSound:Play()
	end
end)

while true do
	if FuelCapacityValue.Value > 1 and GeneratorStatusValue.Value == 1 then
		repeat
			FuelCapacityValue.Value = FuelCapacityValue.Value - 1
			wait(15)
		until
		FuelCapacityValue.Value == 0 or GeneratorStatusValue.Value == 0
	end
	if FuelCapacityValue.Value == 0 and CanEvent == true then
		CanEvent = false
		GeneratorStatusValue.Value = 0
		GeneratorStatusLabel.Text = ("OFFLINE")
		GeneratorStatusLabel.TextColor3 = Color3.new(1, 0, 0)
		GeneratorWorkSound:Stop()
		GeneratorEndSound:Play()
		wait(1)
		Fan.HingeConstraint.AngularVelocity = 0
	end
	wait(0.1)
end
