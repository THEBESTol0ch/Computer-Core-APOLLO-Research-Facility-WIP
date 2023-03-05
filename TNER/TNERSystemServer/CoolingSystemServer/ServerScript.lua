-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Switch.Handle
--

-- Values
local ServerStatusValue = script.Parent.Parent.Values.ServerStatusValue
--

-- Items
local CoolingSystemServerStatus = script.Parent.Parent.Parent.Monitor.Lines.Status.SurfaceGui.TextLabel
local CoolingSystemServerOutput = script.Parent.Parent.Parent.Monitor.Lines.Output.SurfaceGui.TextLabel
local CoolingSystemStatus = workspace.CoolingSystemMonitor.Monitor.Lines.SystemStatus.SurfaceGui.TextLabel
local CoolingSystemStatusRS = workspace.ReactorSystemsMonitor.Monitor.Lines.CoolingSystemStatus.SurfaceGui.TextLabel
local RadiatorStats = workspace.CoolingSystemMonitor.Monitor.Lines
--

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.5)
	CoolingSystemServerStatus.Text = ("ENGAGING...")
	CoolingSystemServerStatus.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(1)
	for Count = 1, 4, 1 do
		CoolingSystemServerOutput.Text = ("RADIATOR "..Count.."...")
		CoolingSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
		wait(2)
		CoolingSystemServerOutput.Text = ("RADIATOR "..Count)
		CoolingSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
		RadiatorStats["Radiator"..Count.."Status"].SurfaceGui.TextLabel.Text = ("OFFLINE")
		wait(0.5)
	end
	CoolingSystemServerStatus.Text = ("ONLINE")
	CoolingSystemServerStatus.TextColor3 = Color3.new(0, 1, 0)
	CoolingSystemStatus.Text = ("ONLINE")
	CoolingSystemStatus.TextColor3 = Color3.new(0, 1, 0)
	CoolingSystemStatusRS.Text = ("ONLINE")
	CoolingSystemStatusRS.TextColor3 = Color3.new(0, 1, 0)
	ServerStatusValue.Value = "ONLINE"
	wait(0.5)
	CoolingSystemServerOutput.Text = ("")
	CoolingSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
end)
