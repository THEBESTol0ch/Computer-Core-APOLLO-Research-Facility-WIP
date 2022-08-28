local StatusValue = workspace.CoolantPump.Values.StatusValue
local PowerValue = workspace.CoolantPump.Values.PowerValue
local RPMValue = workspace.CoolantPump.Values.RPMValue
local InputEnergyValue = workspace.CoolantPump.Values.InputEnergyValue

local StatusLabel = workspace.CoolantPumpMonitor.Lines.Status.SurfaceGui.TextLabel
local PowerLabel = workspace.CoolantPumpMonitor.Lines.Power.SurfaceGui.TextLabel
local RPMLabel = workspace.CoolantPumpMonitor.Lines.RPM.SurfaceGui.TextLabel
local InputEnergyLabel = workspace.CoolantPumpMonitor.Lines.InputEnergy.SurfaceGui.TextLabel
local PercentLabel = workspace.CoolantPumpMonitor.Lines.Percent.SurfaceGui.TextLabel

while true do
	if PowerValue.Value >= 10 then
		PercentLabel.Text = ("  %")
	end
	if PowerValue.Value == 100 then
		PercentLabel.Text = ("    %")
	end
	if PowerValue.Value <= 99 then
		PercentLabel.Text = ("  %")
	end
	if PowerValue.Value <= 9 then
		PercentLabel.Text = ("%")
	end
	PowerLabel.Text = PowerValue.Value
	RPMLabel.Text = RPMValue.Value
	InputEnergyLabel.Text = InputEnergyValue.Value
	wait(0.01)
end
