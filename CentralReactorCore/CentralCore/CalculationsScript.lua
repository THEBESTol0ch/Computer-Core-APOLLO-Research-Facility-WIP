-- Values
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local CoolantPumpStatusValue = workspace.CoolantPump.CPU.Values.PumpStatusValue
local CoolingCoef = workspace.CoolantPump.CPU.Values.CoolingCoef
local CentralReactorCoreStatusValue = script.Parent.Parent.Values.CentralReactorCoreStatusValue
local EnergyCapacityValue = script.Parent.Parent.Values.EnergyCapacityValue
--

while true do
	if TemperatureValue.Value > 311 then
		TemperatureValue.Value = TemperatureValue.Value - 10
	end
	if TemperatureValue.Value > 438 and CoolantPumpStatusValue.Value == "ONLINE" then
		TemperatureValue.Value = TemperatureValue.Value - CoolingCoef.Value
	end
	if not (CentralReactorCoreStatusValue.Value == "OFFLINE") and EnergyCapacityValue.Value > 110000 and TemperatureValue.Value < 9700 then
		TemperatureValue.Value = TemperatureValue.Value + 100
	end
	wait(1)
end
