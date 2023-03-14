-- Values
local SuperchargerStatusValue = script.Parent.Parent.Values.SuperchargerStatusValue
local SuperchargerTotalRPMValue = script.Parent.Parent.Values.SuperchargerTotalRPMValue
--

-- Items
local SuperchargerTotalRPMLabel = workspace.SuperchargerSystemMonitor.Monitor.Lines.TotalRPM.SurfaceGui.TextLabel
--

SuperchargerStatusValue.Changed:Connect(function()
	if SuperchargerStatusValue.Value == "INCREASE" then
		repeat
			SuperchargerTotalRPMValue.Value = SuperchargerTotalRPMValue.Value + 263
			wait(0.07)
		until
		SuperchargerTotalRPMValue.Value > 23475 or SuperchargerStatusValue.Value == "OFFLINE"
	elseif SuperchargerStatusValue.Value == "OFFLINE" then
		wait(0.5)
		repeat
			SuperchargerTotalRPMValue.Value = SuperchargerTotalRPMValue.Value - 263
			wait(0.07)
		until
		SuperchargerTotalRPMValue.Value <= 0 or SuperchargerStatusValue.Value == "ONLINE"
	end
end)

SuperchargerTotalRPMValue.Changed:Connect(function()
	SuperchargerTotalRPMLabel.Text = SuperchargerTotalRPMValue.Value
	if SuperchargerTotalRPMValue.Value > 15000 then
		SuperchargerTotalRPMLabel.TextColor3 = Color3.new(1, 0, 0)
	elseif SuperchargerTotalRPMValue.Value < 15000 and SuperchargerTotalRPMValue.Value > 7000 then
		SuperchargerTotalRPMLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	if SuperchargerTotalRPMValue.Value < 0 then
		SuperchargerStatusValue.Value = 0
	end
end)
