-- Control
local CSEngageButton = workspace.TNERCoolingSystemConsole.CSEngageButton.Button
local CSDisengageButton = workspace.TNERCoolingSystemConsole.CSDisengageButton.Button
--

-- Values
local CoolingSystemStatusValue = script.Parent.Parent.Values.CoolingSystemStatusValue
local CoolingCoeffValue = script.Parent.Parent.Values.CoolingCoeffValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local Radiator1StatusValue = script.Parent.Parent.Parent.Radiator1.CPU.Values.RadiatorStatusValue
local Radiator2StatusValue = script.Parent.Parent.Parent.Radiator2.CPU.Values.RadiatorStatusValue
local Radiator3StatusValue = script.Parent.Parent.Parent.Radiator3.CPU.Values.RadiatorStatusValue
local Radiator4StatusValue = script.Parent.Parent.Parent.Radiator4.CPU.Values.RadiatorStatusValue
--

-- Sounds
local Alarm = workspace.TNERAlarmSystem.SoundEmitter.Alarm3
--

-- Functions
function DoRadiator(Mode)
	Alarm:Play()
	if Mode == "ON" then
		CSEngageButton.ClickDetector.MaxActivationDistance = 0
		CoolingSystemStatusValue.Value = "ENGAGE"
	elseif Mode == "OFF" then
		CSDisengageButton.ClickDetector.MaxActivationDistance = 0
		CoolingSystemStatusValue.Value = "DISENGAGE"
	end
end
function DoCheck()
	if Radiator1StatusValue.Value == "ONLINE" and Radiator2StatusValue.Value == "ONLINE" and Radiator3StatusValue.Value == "ONLINE" and Radiator4StatusValue.Value == "ONLINE" then
		CoolingCoeffValue.Value = 23
		CSDisengageButton.ClickDetector.MaxActivationDistance = 10
		CoolingSystemStatusValue.Value = "ONLINE"
	else
		CoolingCoeffValue.Value = 0
		CoolingSystemStatusValue.Value = "OFFLINE"
	end
	if Radiator1StatusValue.Value == "OFFLINE" and Radiator2StatusValue.Value == "OFFLINE" and Radiator3StatusValue.Value == "OFFLINE" and Radiator4StatusValue.Value == "OFFLINE" then
		CSEngageButton.ClickDetector.MaxActivationDistance = 10
	end
end
--

CSEngageButton.ClickDetector.MouseClick:Connect(function()
	DoRadiator("ON")
end)
CSDisengageButton.ClickDetector.MouseClick:Connect(function()
	DoRadiator("OFF")
end)

Radiator1StatusValue.Changed:Connect(function()
	DoCheck()
end)
Radiator2StatusValue.Changed:Connect(function()
	DoCheck()
end)
Radiator3StatusValue.Changed:Connect(function()
	DoCheck()
end)
Radiator4StatusValue.Changed:Connect(function()
	DoCheck()
end)
