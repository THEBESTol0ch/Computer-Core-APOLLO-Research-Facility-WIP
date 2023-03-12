-- Control
local Trigger = workspace.TNERMaintenanceConsole.CapButton.Button
--

-- Values
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
local AllFuelCellsInjectedValue = script.Parent.Parent.Values.AllFuelCellsInjectedValue
--

-- Sounds
local ActionAlarm = workspace.TNERAlarmSystem.SoundEmitter.Alarm3
--

-- Monitoring
local FuelCapacityLable = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
--

FuelCapacityValue.Changed:Connect(function()
	FuelCapacityLable.Text = FuelCapacityValue.Value
	if FuelCapacityValue.Value == 99 then
		FuelCapacityValue.Value = 100
		AllFuelCellsInjectedValue.Value = true
	elseif FuelCapacityValue.Value > 50 then
		FuelCapacityLable.TextColor3 = Color3.new(0, 1, 0)
	elseif FuelCapacityValue.Value < 50 then
		FuelCapacityLable.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif FuelCapacityValue.Value < 10 then
		FuelCapacityLable.TextColor3 = Color3.new(1, 0, 0)
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	ActionAlarm:Play()
	AllFuelCellsInjectedValue.Value = false
end)
