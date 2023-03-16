-- Values
local Values = script.Parent.Parent.Parent.CPU.Values
local TNERStatusValue = Values.TNERStatusValue
local RPMValue = Values.RPMValue
local InputEnergyValue = Values.InputEnergyValue
local OutputEnergyValue = Values.OutputEnergyValue

local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
local PreviousLeverPositionValue = workspace.TNERPullLever.CPU.Values.PreviousLeverPositionValue
--

-- Logic
local RPMMultiplier = 18740
local OutputEnergyMultiplier = 84000
--

-- Functions
function Calc(Class)
	if Class == "RPM" then
		repeat
			if LeverPositionValue.Value > PreviousLeverPositionValue.Value then
				RPMValue.Value = RPMValue.Value + 3748
			elseif LeverPositionValue.Value < PreviousLeverPositionValue.Value then
				RPMValue.Value = RPMValue.Value - 3748
			end
			wait(0.03)
		until RPMValue.Value == LeverPositionValue.Value * RPMMultiplier or TNERStatusValue.Value == "SHUT DOWN"
	elseif Class == "OutputEnergy" then
		repeat
			if LeverPositionValue.Value > PreviousLeverPositionValue.Value then
				OutputEnergyValue.Value = OutputEnergyValue.Value + 16800
			elseif LeverPositionValue.Value < PreviousLeverPositionValue.Value then
				OutputEnergyValue.Value = OutputEnergyValue.Value - 16800
			end
			wait(0.03)
		until OutputEnergyValue.Value == LeverPositionValue.Value * OutputEnergyMultiplier or TNERStatusValue.Value == "SHUT DOWN"
	end
end
--

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(16.8)
		Calc("RPM")
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		repeat
			RPMValue.Value = RPMValue.Value - 1874
			wait(0.02)
		until RPMValue.Value <= 0
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(16.8)
		Calc("OutputEnergy")
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value - 16800
			wait(0.02)
		until OutputEnergyValue.Value <= 0
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value + 480
			wait(0.02)
		until InputEnergyValue.Value > 13000
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(11.080)
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value - 480
			wait(0.1)
		until InputEnergyValue.Value < 6000
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(17.074)
		repeat
			InputEnergyValue.Value = InputEnergyValue.Value - 480
			wait(0.02)
		until InputEnergyValue.Value <= 0
	end
end)

LeverPositionValue.Changed:Connect(function()
	Calc("RPM")
end)
LeverPositionValue.Changed:Connect(function()
	Calc("OutputEnergy")
end)
