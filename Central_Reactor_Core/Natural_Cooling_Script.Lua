local TemperatureValue = script.Parent.Parent.Values.TemperatureValue

while true do
	if TemperatureValue.Value > 311 then
		repeat
			TemperatureValue.Value = TemperatureValue.Value - 10
			wait(1)
		until
		TemperatureValue.Value < 311
	end
	wait(0.1)
end
