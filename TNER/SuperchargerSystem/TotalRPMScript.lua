-- Values
local SuperchargerStatusValue = script.Parent.Parent.Values.SuperchargerStatusValue
local SuperchargerTotalRPMValue = script.Parent.Parent.Values.SuperchargerTotalRPMValue
--

-- Items
local SuperchargerTotalRPMLable = workspace.SuperchargerSystemMonitor.Monitor.Lines.TotalRPM.SurfaceGui.TextLabel
--

SuperchargerStatusValue.Changed:Connect(function()
	if SuperchargerStatusValue.Value == "ONLINE" then
		repeat
			SuperchargerTotalRPMValue.Value = SuperchargerTotalRPMValue.Value + 263
			wait(0.07)
		until
		SuperchargerTotalRPMValue.Value > 23475 or SuperchargerStatusValue.Value == "OFFLINE"
	else
		wait(0.5)
		repeat
			SuperchargerTotalRPMValue.Value = SuperchargerTotalRPMValue.Value - 263
			wait(0.07)
		until
		SuperchargerTotalRPMValue.Value == 0 or SuperchargerStatusValue.Value == "ONLINE"
	end
end)

SuperchargerTotalRPMValue.Changed:Connect(function()
	SuperchargerTotalRPMLable.Text = SuperchargerTotalRPMValue.Value
	if SuperchargerTotalRPMValue.Value > 7000 then
		SuperchargerTotalRPMLable.TextColor3 = Color3.new(1, 0.666667, 0)
	elseif SuperchargerTotalRPMValue.Value > 15000 then
		SuperchargerTotalRPMLable.TextColor3 = Color3.new(1, 0, 0)
	end
end)
