-- Values
local DestroyPumpValue = script.Parent.Parent.Values.DestroyPumpValue

local WaterDestroyPumpValue = script.Parent.Parent.Parent.WaterPump_DamageEffect.CPU.Values.DestroyPumpValue
local HotWaterDestroyPumpValue = script.Parent.Parent.Parent.HotWaterPump_DamageEffect.CPU.Values.DestroyPumpValue
local FireProtectionWaterDestroyPumpValue = script.Parent.Parent.Parent.FireProtectionWaterPump_DamageEffect.CPU.Values.DestroyPumpValue
local CoolantDestroyPumpValue = script.Parent.Parent.Parent.CoolantPump_DamageEffect.CPU.Values.DestroyPumpValue
--

DestroyPumpValue.Changed:Connect(function()
	if DestroyPumpValue.Value == true then
		local RandomIndex = math.random(1, 4)
		if RandomIndex == 1 then
			WaterDestroyPumpValue.Value = true
		elseif RandomIndex == 2 then
			HotWaterDestroyPumpValue.Value = true
		elseif RandomIndex == 3 then
			FireProtectionWaterDestroyPumpValue.Value = true
		elseif RandomIndex == 4 then
			CoolantDestroyPumpValue.Value = true
		end
	end
end)
