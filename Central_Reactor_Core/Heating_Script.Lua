local CentralReactorCoreStatusValue = script.Parent.Parent.Parent.Parent.CentralCore.CPU.Values.CentralReactorCoreStatusValue
local EnergyCapacityValue = script.Parent.Parent.Parent.Parent.CentralCore.CPU.Values.EnergyCapacityValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue

while true do
	if CentralReactorCoreStatusValue.Value >= 1 and EnergyCapacityValue.Value > 100000 and TemperatureValue.Value < 9700 then
		TemperatureValue.Value = TemperatureValue.Value + 100
		wait(1)
	end
	wait(0.1)
end
