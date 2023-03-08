-- Values
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
--

-- Monitoring
local FuelCapacityLable = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
--

FuelCapacityValue.Changed:Connect(function()
	FuelCapacityLable.Text = FuelCapacityValue.Value
	if FuelCapacityValue.Value == 99 then
		FuelCapacityValue.Value = 100
	elseif FuelCapacityValue.Value > 50 then
		FuelCapacityLable.TextColor3 = Color3.new(0, 1, 0)
	elseif FuelCapacityValue.Value < 50 then
		FuelCapacityLable.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif FuelCapacityValue.Value < 25 then
		FuelCapacityLable.TextColor3 = Color3.new(1, 0, 0)
	end
end)
