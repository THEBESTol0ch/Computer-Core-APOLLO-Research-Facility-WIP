-- Values
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
--

-- Items
local LoadingScreen = script.Parent.Parent.Parent.LoadingScreen.ApolloCorporationDecal
local Marks = script.Parent.Parent.Parent.Marks
local Lines = script.Parent.Parent.Parent.Lines
--

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		wait(1)
		LoadingScreen.Transparency = 0
		wait(2)
		LoadingScreen.Transparency = 1
		for _, Object in pairs(Marks:GetChildren()) do
			Object.Transparency = 0
		end
		for _, Object in pairs(Lines:GetChildren()) do
			Object.SurfaceGui.TextLabel.Visible = true
		end
	end
end)
