local CentralReactorCoreStatusValue = script.Parent.Parent.Values.CentralReactorCoreStatusValue
local EnergyCapacityValue = script.Parent.Parent.Values.EnergyCapacityValue
local AlphaAdvancedLever = workspace.AlphaCoreAdvancedLever.Handle1
local BetaAdvancedLever = workspace.BetaCoreAdvancedLever.Handle1
local GammaAdvancedLever = workspace.GammaCoreAdvancedLever.Handle1
local DeltaAdvancedLever = workspace.DeltaCoreAdvancedLever.Handle1
local Button = workspace.CRCConsole.EmergencyButton.Button

local Stop = false

AlphaAdvancedLever.ClickDetector.MouseClick:Connect(function()
	Stop = true
end)
BetaAdvancedLever.ClickDetector.MouseClick:Connect(function()
	Stop = true
end)
GammaAdvancedLever.ClickDetector.MouseClick:Connect(function()
	Stop = true
end)
DeltaAdvancedLever.ClickDetector.MouseClick:Connect(function()
	Stop = true
end)

Button.ClickDetector.MouseClick:Connect(function()
	Stop = false
end)

while true do
	if CentralReactorCoreStatusValue.Value >= 1 and EnergyCapacityValue.Value <= 998000 and Stop == false then
		repeat
			EnergyCapacityValue.Value = EnergyCapacityValue.Value + 1000
			wait(0.3)
		until
		CentralReactorCoreStatusValue.Value == 0 or EnergyCapacityValue.Value >= 998000 or Stop == true
	end
	wait(0.1)
end
