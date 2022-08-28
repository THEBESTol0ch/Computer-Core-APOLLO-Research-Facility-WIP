local GeneratorStatusValue = script.Parent.Parent.Values.GeneratorStatusValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue

while true do
	if TemperatureValue.Value < 90 and GeneratorStatusValue.Value == 1 then
		repeat
			TemperatureValue.Value = TemperatureValue.Value + 1
			wait(1)
		until
		TemperatureValue.Value == 90 or GeneratorStatusValue.Value == 0
	end
	if TemperatureValue.Value > 29 and GeneratorStatusValue.Value == 0 then
		repeat
			TemperatureValue.Value = TemperatureValue.Value - 1
			wait(1)
		until
		TemperatureValue.Value < 30 or GeneratorStatusValue.Value == 1
	end
	wait(0.1)
end
