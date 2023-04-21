-- Values
local FacilityDieselGeneratorStatusValue1 = workspace.FacilityDieselsGenerators.FacilityDieselGenerator1.CPU.Values.GeneratorStatusValue
local FacilityDieselGeneratorStatusValue2 = workspace.FacilityDieselsGenerators.FacilityDieselGenerator2.CPU.Values.GeneratorStatusValue
local FacilityDieselGeneratorStatusValue3 = workspace.FacilityDieselsGenerators.FacilityDieselGenerator3.CPU.Values.GeneratorStatusValue
local FacilityDieselGeneratorStatusValue4 = workspace.FacilityDieselsGenerators.FacilityDieselGenerator4.CPU.Values.GeneratorStatusValue
local GeneratorsStatusValue = workspace.FacilityDieselsGenerators.CPU.Values.GeneratorsStatusValue
--

-- Functions
function DoCheck()
	if FacilityDieselGeneratorStatusValue1.Value == "ONLINE" and FacilityDieselGeneratorStatusValue2.Value == "ONLINE" and FacilityDieselGeneratorStatusValue3.Value == "ONLINE" and FacilityDieselGeneratorStatusValue4.Value == "ONLINE" then
		GeneratorsStatusValue.Value = "ONLINE"
	end
	if FacilityDieselGeneratorStatusValue1.Value == "OFFLINE" or FacilityDieselGeneratorStatusValue2.Value == "OFFLINE" or FacilityDieselGeneratorStatusValue3.Value == "OFFLINE" or FacilityDieselGeneratorStatusValue4.Value == "OFFLINE" then
		GeneratorsStatusValue.Value = "OFFLINE"
	end
end
--

FacilityDieselGeneratorStatusValue1.Changed:Connect(function()
	DoCheck()
end)
FacilityDieselGeneratorStatusValue2.Changed:Connect(function()
	DoCheck()
end)
FacilityDieselGeneratorStatusValue3.Changed:Connect(function()
	DoCheck()
end)
FacilityDieselGeneratorStatusValue4.Changed:Connect(function()
	DoCheck()
end)
