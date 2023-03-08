-- Values
local FuseSystemStatusValue = script.Parent.Parent.Values.FuseSystemStatusValue
local Fuse1StatusValue = script.Parent.Parent.Parent.Fuse1.CPU.Values.FuseStatusValue
local Fuse2StatusValue = script.Parent.Parent.Parent.Fuse2.CPU.Values.FuseStatusValue
local Fuse3StatusValue = script.Parent.Parent.Parent.Fuse3.CPU.Values.FuseStatusValue
local Fuse4StatusValue = script.Parent.Parent.Parent.Fuse4.CPU.Values.FuseStatusValue
--

-- Monitoring
local SystemStatus = workspace.FuseSystemMonitor.Monitor.Lines.SystemStatus.SurfaceGui.TextLabel
local SystemStatusRS = workspace.ReactorSystemsMonitor.Monitor.Lines.FuseSystemStatus.SurfaceGui.TextLabel
--

-- Functions
function DoMonitoring(Text, Color)
	SystemStatus.Text = Text
	SystemStatus.TextColor3 = Color
	SystemStatusRS.Text = Text
	SystemStatusRS.TextColor3 = Color
end
function DoCheck()
	if Fuse1StatusValue.Value == "OFFLINE" and Fuse2StatusValue.Value == "OFFLINE" and Fuse3StatusValue.Value == "OFFLINE" and Fuse4StatusValue.Value == "OFFLINE" then
		FuseSystemStatusValue.Value = "OFFLINE"
		DoMonitoring(FuseSystemStatusValue.Value, Color3.new(1, 0, 0))
	elseif Fuse1StatusValue.Value == "ONLINE" or Fuse2StatusValue.Value == "ONLINE" or Fuse3StatusValue.Value == "ONLINE" or Fuse4StatusValue.Value == "ONLINE" then
		FuseSystemStatusValue.Value = "ONLINE"
		DoMonitoring(FuseSystemStatusValue.Value, Color3.new(0, 1, 0))
	end
end
--

Fuse1StatusValue.Changed:Connect(function()
	DoCheck()
end)

Fuse2StatusValue.Changed:Connect(function()
	DoCheck()
end)

Fuse3StatusValue.Changed:Connect(function()
	DoCheck()
end)

Fuse4StatusValue.Changed:Connect(function()
	DoCheck()
end)
