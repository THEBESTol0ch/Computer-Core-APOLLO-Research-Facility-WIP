-- Values
local FEM1StatusValue = script.Parent.Parent.Parent.FEM1.CPU.Values.FEMStatusValue
local FEM2StatusValue = script.Parent.Parent.Parent.FEM2.CPU.Values.FEMStatusValue
local FEM3StatusValue = script.Parent.Parent.Parent.FEM3.CPU.Values.FEMStatusValue
local FESStatusValue = script.Parent.Parent.Values.FESStatusValue
--

-- Items
local FEMMonitorStatus = workspace.FESMonitor.Monitor.Lines.SystemStatus.SurfaceGui.TextLabel
local FEMMonitorStatusRS = workspace.ReactorSystemsMonitor.Monitor.Lines.FuelEnrichmentSystemStatus.SurfaceGui.TextLabel
--

-- Functions
function SystemCheck()
	if FEM1StatusValue.Value == "ONLINE" and FEM2StatusValue.Value == "ONLINE" and FEM3StatusValue.Value == "ONLINE" then
		FESStatusValue.Value = "ONLINE"
		FEMMonitorStatus.Text = ("ONLINE")
		FEMMonitorStatus.TextColor3 = Color3.new(0, 255, 0)
		FEMMonitorStatusRS.Text = ("ONLINE")
		FEMMonitorStatusRS.TextColor3 = Color3.new(0, 255, 0)
	else
		FESStatusValue.Value = "OFFLINE"
		FEMMonitorStatus.Text = ("OFFLINE")
		FEMMonitorStatus.TextColor3 = Color3.new(255, 0, 0)
		FEMMonitorStatusRS.Text = ("OFFLINE")
		FEMMonitorStatusRS.TextColor3 = Color3.new(255, 0, 0)
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
