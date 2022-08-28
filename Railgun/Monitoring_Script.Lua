local RailsTemperatureLabel = script.Parent.Lines.RailgunTemp.SurfaceGui.TextLabel
local RailsTemperatureValue = workspace.Railgun.RailsTemperatureValue

while true do
	RailsTemperatureLabel.Text = RailsTemperatureValue.Value
	if RailsTemperatureValue.Value > 1700 then
		RailsTemperatureLabel.TextColor3 = Color3.new(1, 0, 0)
	end
	if RailsTemperatureValue.Value < 1000 then
		RailsTemperatureLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	if RailsTemperatureValue.Value < 500 then
		RailsTemperatureLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	wait(0.1)
end
