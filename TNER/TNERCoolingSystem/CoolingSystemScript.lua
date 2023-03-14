-- Control
local CSEngageButton = workspace.TNERCoolingSystemConsole.CSEngageButton.Button
local CSDisengageButton = workspace.TNERCoolingSystemConsole.CSDisengageButton.Button
--

-- Values
local CoolingSystemStatusValue = script.Parent.Parent.Values.CoolingSystemStatusValue
local CoolingCoeffValue = script.Parent.Parent.Values.CoolingCoeffValue
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
		CoolingCoeffValue.Value = 23
		CoolingSystemStatusValue.Value = "ONLINE"
		DoMonitoring(CoolingSystemStatusValue.Value, Color3.new(0, 1, 0))
		CSDisengageButton.ClickDetector.MaxActivationDistance = 10
	elseif Mode == "OFF" then
		CSDisengageButton.ClickDetector.MaxActivationDistance = 0
		CoolingSystemStatusValue.Value = "DISENGAGE"
		DoMonitoring(CoolingSystemStatusValue.Value, Color3.new(1, 0.666667, 0))
		Alarm:Play()
		wait(5)
		CoolingCoeffValue.Value = 0
		wait(15)
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
