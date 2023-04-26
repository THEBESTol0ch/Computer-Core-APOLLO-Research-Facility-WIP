-- Values
local CentralReactorCoreStatusValue = script.Parent.Parent.Values.CentralReactorCoreStatusValue
local EnergyCapacityValue = script.Parent.Parent.Values.EnergyCapacityValue
local IntegrityValue = script.Parent.Parent.Values.IntegrityValue
--

while true do
	if not (CentralReactorCoreStatusValue.Value == "OFFLINE") and EnergyCapacityValue.Value > 110000 and IntegrityValue.Value > 0 then
		IntegrityValue.Value = IntegrityValue.Value - 1
	end
	wait(9)
end
