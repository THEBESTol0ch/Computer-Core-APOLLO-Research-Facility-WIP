-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Switch.Handle
--

-- Values
local ServerStatusValue = script.Parent.Parent.Values.ServerStatusValue
--

-- Monitoring
local FuelSystemServerStatus = script.Parent.Parent.Parent.Monitor.Lines.Status.SurfaceGui.TextLabel
local FuelSystemServerOutput = script.Parent.Parent.Parent.Monitor.Lines.Output.SurfaceGui.TextLabel
local FuelSystemStatus = workspace.FuelSystemMonitor.Monitor.Lines.FuelSystemStatus.SurfaceGui.TextLabel
local FuelSystemStatusRS = workspace.ReactorSystemsMonitor.Monitor.Lines.FuelSystemStatus.SurfaceGui.TextLabel
local FuelCapacity = workspace.FuelSystemMonitor.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local FuelCellStats = workspace.FuelSystemMonitor.Monitor.Lines
--

-- Functions
function DoMonitoring(Text, Color)
	FuelSystemServerStatus.Text = Text
	FuelSystemServerStatus.TextColor3 = Color
	FuelSystemStatus.Text = Text
	FuelSystemStatus.TextColor3 = Color
	FuelSystemStatusRS.Text = Text
	FuelSystemStatusRS.TextColor3 = Color
end
--

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(0.5)
	FuelSystemServerStatus.Text = ("ENGAGING...")
	FuelSystemServerStatus.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(1)
	for Count = 1, 3, 1 do
		FuelSystemServerOutput.Text = ("FUEL RECEIVER "..Count.."...")
		FuelSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
		wait(2)
		FuelSystemServerOutput.Text = ("FUEL RECEIVER "..Count)
		FuelSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
		FuelCellStats["FR"..Count.."Status"].SurfaceGui.TextLabel.Text = ("OFFLINE")
		wait(0.5)
	end
	FuelSystemServerOutput.Text = ("FUEL CAPACITY...")
	FuelSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(1)
	FuelSystemServerOutput.Text = ("FUEL CAPACITY")
	FuelSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
	FuelCapacity.Text = ("0 %")
	wait(0.5)
	FuelSystemServerOutput.Text = ("FUEL SYSTEM...")
	FuelSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(3)
	FuelSystemServerOutput.Text = ("FUEL SYSTEM")
	FuelSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
	wait(0.5)
	ServerStatusValue.Value = "ONLINE"
	DoMonitoring(ServerStatusValue.Value, Color3.new(0, 1, 0))
	wait(0.5)
	FuelSystemServerOutput.Text = ("")
	FuelSystemServerOutput.TextColor3 = Color3.new(0, 1, 0)
	wait(3)
	FuelSystemServerOutput.Text = ("SNDW4.PNG")
	FuelSystemServerOutput.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(5)
	FuelSystemServerOutput.Text = ("SNX ERR: SNDW4.PNG")
	FuelSystemServerOutput.TextColor3 = Color3.new(1, 0, 0)
end)
