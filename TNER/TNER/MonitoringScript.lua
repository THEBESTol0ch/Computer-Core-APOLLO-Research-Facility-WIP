-- Values
local Values = script.Parent.Parent.Values
local TemperatureValue = Values.TemperatureValue
local RPMValue = Values.RPMValue
local InputEnergyValue = Values.InputEnergyValue
local OutputEnergyValue = Values.OutputEnergyValue
local MinFuelCapacityValue = Values.MinFuelCapacityValue

local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
--

-- Monitoring
local ReactorOutputMonitor = workspace.ReactorOutputMonitor
local TemperatureLabel = ReactorOutputMonitor.Monitor.Lines.ReactorTemperature.SurfaceGui.TextLabel
local RPMLabel = ReactorOutputMonitor.Monitor.Lines.ReactorRPM.SurfaceGui.TextLabel
local InputEnergyLabel = ReactorOutputMonitor.Monitor.Lines.InputEnergy.SurfaceGui.TextLabel
local OutputEnergyLabel = ReactorOutputMonitor.Monitor.Lines.OutputEnergy.SurfaceGui.TextLabel

local FuelCapacityLabel = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
--

-- Functions
function DoValuesMonitoring()
	TemperatureLabel.Text = (TemperatureValue.Value.." °C")
	RPMLabel.Text = RPMValue.Value
	InputEnergyLabel.Text = (InputEnergyValue.Value.." V")
	OutputEnergyLabel.Text = (OutputEnergyValue.Value.." V")
	FuelCapacityLabel.Text = (FuelCapacityValue.Value.." %")
	
	if TemperatureValue.Value < 0 then TemperatureValue.Value = 0 end
	if RPMValue.Value < 0 then RPMValue.Value = 0 end
	if InputEnergyValue.Value < 0 then InputEnergyValue.Value = 0 end
	if OutputEnergyValue.Value < 0 then OutputEnergyValue.Value = 0 end
	if FuelCapacityValue.Value < 0 then FuelCapacityValue.Value = 0 end

	if TemperatureValue.Value > 3200 then
		TemperatureLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif TemperatureValue.Value < 3200 and TemperatureValue.Value > 1600 then
		TemperatureLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif TemperatureValue.Value < 1600 then
		TemperatureLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if RPMValue.Value > 75000 then
		RPMLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif RPMValue.Value < 75000 and RPMValue.Value > 37500 then
		RPMLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif RPMValue.Value < 37500 then
		RPMLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if InputEnergyValue.Value > 13000 then
		InputEnergyLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif InputEnergyValue.Value < 5000 then
		InputEnergyLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if OutputEnergyValue.Value > 340000 then
		OutputEnergyLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif OutputEnergyValue.Value < 340000 and OutputEnergyValue.Value > 168000 then
		OutputEnergyLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif OutputEnergyValue.Value < 168000 then
		OutputEnergyLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if FuelCapacityValue.Value > 51 then
		FuelCapacityLabel.TextColor3 = Color3.new(0, 1, 0)
	elseif FuelCapacityValue.Value < 51 and FuelCapacityValue.Value > MinFuelCapacityValue.Value then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif FuelCapacityValue.Value < MinFuelCapacityValue.Value then
		FuelCapacityLabel.TextColor3 = Color3.new(1, 0, 0)
	end
end
--

TemperatureValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
RPMValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
InputEnergyValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
OutputEnergyValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
FuelCapacityValue.Changed:Connect(function()
	DoValuesMonitoring()
end)
