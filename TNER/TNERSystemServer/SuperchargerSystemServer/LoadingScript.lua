-- Values
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
--

-- Items
local Marks = script.Parent.Marks
local Lines = script.Parent.Lines
--

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		wait(2)
		for _, Object in pairs(Marks:GetChildren()) do
			Object.Transparency = 0
		end
		for _, Object in pairs(Lines:GetChildren()) do
			Object.SurfaceGui.TextLabel.Visible = true
		end
	end
end)
