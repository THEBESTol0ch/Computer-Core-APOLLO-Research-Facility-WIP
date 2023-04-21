-- Values
local GeneratorStatusValue = script.Parent.Parent.Values.GeneratorStatusValue
local FuelCapacityValue = script.Parent.Parent.Values.FuelCapacityValue
--

while true do
	if FuelCapacityValue.Value > 0 and GeneratorStatusValue.Value == "ONLINE" then
		FuelCapacityValue.Value = FuelCapacityValue.Value - 1
	end
	wait(15)
end
