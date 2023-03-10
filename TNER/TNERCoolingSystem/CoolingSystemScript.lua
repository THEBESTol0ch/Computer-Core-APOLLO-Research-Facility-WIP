-- Control
local CSEngageButton = workspace.TNERCoolingSystemConsole.CSEngageButton.Button
local CSDisengageButton = workspace.TNERCoolingSystemConsole.CSDisengageButton.Button
--

-- Values
local CoolingSystemStatusValue = script.Parent.Parent.Values.CoolingSystemStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Sounds
local Alarm = workspace.TNERAlarmSystem.SoundEmitter.Alarm3
--

-- Monitoring
local RadiatorsStats = workspace.CoolingSystemMonitor.Monitor.Lines
--

-- Functions
function DoMonitoring(Text, Color)
	for Count = 1, 4, 1 do
		wait(0.5)
		RadiatorsStats["Radiator"..Count.."Status"].SurfaceGui.TextLabel.Text = Text
		RadiatorsStats["Radiator"..Count.."Status"].SurfaceGui.TextLabel.TextColor3 = Color
	end
end
function DoRadiator(Mode)
	if Mode == "ON" then
		CSEngageButton.ClickDetector.MaxActivationDistance = 0
		CoolingSystemStatusValue.Value = "ENGAGE"
		DoMonitoring(CoolingSystemStatusValue.Value, Color3.new(1, 0.666667, 0))
		Alarm:Play()
		wait(20)
		CoolingSystemStatusValue.Value = "ONLINE"
		DoMonitoring(CoolingSystemStatusValue.Value, Color3.new(0, 1, 0))
		CSDisengageButton.ClickDetector.MaxActivationDistance = 10
	elseif Mode == "OFF" then
		CSDisengageButton.ClickDetector.MaxActivationDistance = 0
		CoolingSystemStatusValue.Value = "DISENGAGE"
		DoMonitoring(CoolingSystemStatusValue.Value, Color3.new(1, 0.666667, 0))
		Alarm:Play()
		wait(20)
		CoolingSystemStatusValue.Value = "OFFLINE"
		DoMonitoring(CoolingSystemStatusValue.Value, Color3.new(1, 0, 0))
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

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(23)
		if TNERStatusValue.Value == "OVERLOAD" and CoolingSystemStatusValue.Value == "OFFLINE" then
			DoRadiator("ON")
			wait(58)
			DoRadiator("OFF")
		elseif TNERStatusValue.Value == "OVERLOAD" and CoolingSystemStatusValue.Value == "ONLINE" or CoolingSystemStatusValue.Value == "ENGAGE" then
			CSDisengageButton.ClickDetector.MaxActivationDistance = 0
			wait(95)
			DoRadiator("OFF")
		end
	end
end)
