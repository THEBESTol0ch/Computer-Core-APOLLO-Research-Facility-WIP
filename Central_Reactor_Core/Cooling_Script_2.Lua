local CoolingCoef = workspace.CoolantPump.Values.CoolingCoef
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local CoolantPumpStatusValue = workspace.CoolantPump.Values.StatusValue
local DischargerStatusValue = script.Parent.Parent.Values.DischargerStatusValue

while true do
	if TemperatureValue.Value > 438 and CoolantPumpStatusValue.Value == 1 and DischargerStatusValue.Value == 1 then
		repeat
			TemperatureValue.Value = TemperatureValue.Value - CoolingCoef.Value
			wait(1)
		until
		TemperatureValue.Value < 438 or CoolantPumpStatusValue.Value == 0 or DischargerStatusValue.Value == 0
	end
	wait(0.1)
end
