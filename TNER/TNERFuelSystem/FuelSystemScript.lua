-- Control
local Trigger = workspace.TNERMaintenanceModeConsole.CapButton.Button
--

-- Values
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
local AllFuelCellsInjectedValue = script.Parent.Parent.Values.AllFuelCellsInjectedValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Sounds
local ActionAlarm = workspace.TNERAlarmSystem.SoundEmitter.Alarm3
--

-- Monitoring
local FuelCapacityLable = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
--

FuelCapacityValue.Changed:Connect(function()
	FuelCapacityLable.Text = FuelCapacityValue.Value
	if FuelCapacityValue.Value == 99 and TNERStatusValue.Value == "MAINTENANCE MODE" then
		FuelCapacityValue.Value = 100
		AllFuelCellsInjectedValue.Value = true
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	ActionAlarm:Play()
	if FuelCapacityValue.Value < 11 then
		AllFuelCellsInjectedValue.Value = false
	end
end)
