local GeneratorStatusLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Status.SurfaceGui.TextLabel
local FuelCapacityLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local TemperatureLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Temperature.SurfaceGui.TextLabel
local RPMLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.RPM.SurfaceGui.TextLabel
local PercentLabel = script.Parent.Parent.Parent.Control.Monitor.Lines.Percent.SurfaceGui.TextLabel

local GeneratorStatusValue = script.Parent.Parent.Values.GeneratorStatusValue
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local RPMValue = script.Parent.Parent.Values.RPMValue

while true do
	if FuelCapacityValue.Value >= 10 then
		PercentLabel.Text = ("  %")
	end
	if FuelCapacityValue.Value == 100 then
		PercentLabel.Text = ("    %")
	end
	if FuelCapacityValue.Value <= 99 then
		PercentLabel.Text = ("  %")
	end
	if FuelCapacityValue.Value <= 9 then
		PercentLabel.Text = ("%")
	end
	if FuelCapacityValue.Value < 50 then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	if FuelCapacityValue.Value > 50 then
		FuelCapacityLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if FuelCapacityValue.Value < 25 then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0, 0)
	end
	FuelCapacityLabel.Text = FuelCapacityValue.Value
	TemperatureLabel.Text = TemperatureValue.Value
	RPMLabel.Text = RPMValue.Value
	wait(0.01)
end
