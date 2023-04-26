-- Values
local CentralReactorCoreStatusValue = script.Parent.Parent.Values.CentralReactorCoreStatusValue
local EnergyCapacityValue = script.Parent.Parent.Values.EnergyCapacityValue
--

while true do
	if not (CentralReactorCoreStatusValue.Value == "OFFLINE") and EnergyCapacityValue.Value < 999000 then
		EnergyCapacityValue.Value = EnergyCapacityValue.Value + 1000
	end
	wait(0.3)
end
