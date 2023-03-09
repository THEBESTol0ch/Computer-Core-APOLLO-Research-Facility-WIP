-- Values
local FEM1StatusValue = script.Parent.Parent.Parent.FEM1.CPU.Values.FEMStatusValue
local FEM2StatusValue = script.Parent.Parent.Parent.FEM2.CPU.Values.FEMStatusValue
local FEM3StatusValue = script.Parent.Parent.Parent.FEM3.CPU.Values.FEMStatusValue
local FESStatusValue = script.Parent.Parent.Values.FESStatusValue
--

-- Monitoring
local FEMMonitorStatus = workspace.FESMonitor.Monitor.Lines.SystemStatus.SurfaceGui.TextLabel
local FEMMonitorStatusRS = workspace.ReactorSystemsMonitor.Monitor.Lines.FuelEnrichmentSystemStatus.SurfaceGui.TextLabel
--

-- Functions
function DoMonitoring(Text, Color)
	FEMMonitorStatus.Text = Text
	FEMMonitorStatus.TextColor3 = Color
	FEMMonitorStatusRS.Text = Text
	FEMMonitorStatusRS.TextColor3 = Color
end
function SystemCheck()
	if FEM1StatusValue.Value == "ONLINE" and FEM2StatusValue.Value == "ONLINE" and FEM3StatusValue.Value == "ONLINE" then
		FESStatusValue.Value = "ONLINE"
		DoMonitoring(FESStatusValue.Value, Color3.new(0, 1, 0))
	else
		FESStatusValue.Value = "OFFLINE"
		DoMonitoring(FESStatusValue.Value, Color3.new(1, 0, 0))
	end
end
--

FEM1StatusValue.Changed:Connect(function()
	SystemCheck()
end)

FEM2StatusValue.Changed:Connect(function()
	SystemCheck()
end)

FEM3StatusValue.Changed:Connect(function()
	SystemCheck()
end)
