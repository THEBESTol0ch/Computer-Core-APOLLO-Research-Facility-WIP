-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Switch.Handle
--

-- Values
local ServerStatusValue = script.Parent.Parent.Values.ServerStatusValue
--

-- Monitoring
local SuperchargerSystemServerStatus = script.Parent.Parent.Parent.Monitor.Lines.Status.SurfaceGui.TextLabel
local SuperchargerSystemServerOutput = script.Parent.Parent.Parent.Monitor.Lines.Output.SurfaceGui.TextLabel
local SuperchargerSystemStatus = workspace.SuperchargerSystemMonitor.Monitor.Lines.SystemStatus.SurfaceGui.TextLabel
local SuperchargerSystemStatusRS = workspace.ReactorSystemsMonitor.Monitor.Lines.SuperchargerSystemStatus.SurfaceGui.TextLabel
local TotalRPM = workspace.SuperchargerSystemMonitor.Monitor.Lines.TotalRPM.SurfaceGui.TextLabel
local Flywheels = workspace.SuperchargerSystemMonitor.Monitor.Lines
local SuperchargerSystemConsoleMonitor = workspace.SuperchargerSystemConsoleMonitor.Screen
--

-- Functions
function DoMonitoring(Text, Color)
	SuperchargerSystemServerStatus.Text = Text
	SuperchargerSystemServerStatus.TextColor3 = Color
	SuperchargerSystemStatus.Text = Text
	SuperchargerSystemStatus.TextColor3 = Color
	SuperchargerSystemStatusRS.Text = Text
	SuperchargerSystemStatusRS.TextColor3 = Color
end
--

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.5)
	SuperchargerSystemServerStatus.Text = ("ENGAGING...")
	SuperchargerSystemServerStatus.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(1)
	for Count = 1, 6, 1 do
		SuperchargerSystemServerOutput.Text = ("FLYWHEEL "..Count.."...")
		SuperchargerSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
		wait(2)
		SuperchargerSystemServerOutput.Text = ("FLYWHEEL "..Count)
		SuperchargerSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
		Flywheels["Flywheel"..Count.."Status"].SurfaceGui.TextLabel.Text = ("OFFLINE")
		wait(0.5)
	end
	SuperchargerSystemServerOutput.Text = ("TOTAL RPM...")
	SuperchargerSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(2)
	SuperchargerSystemServerOutput.Text = ("TOTAL RPM")
	SuperchargerSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
	TotalRPM.Text = ("0")
	TotalRPM.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(0.5)
	ServerStatusValue.Value = "ONLINE"
	DoMonitoring(ServerStatusValue.Value, Color3.new(0, 1, 0))
	SuperchargerSystemConsoleMonitor.SuperchargerOfflineDecal.Transparency = 0
	SuperchargerSystemConsoleMonitor.SuperchargerStableDecal.Transparency = 1
	wait(0.5)
	SuperchargerSystemServerOutput.Text = ("")
	SuperchargerSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
end)
