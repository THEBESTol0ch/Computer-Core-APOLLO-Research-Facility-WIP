-- Values
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
--

-- Items
local LoadingScreen = script.Parent.LoadingScreen.ApolloCorporationDecal
local Marks = script.Parent.Marks
local Lines = script.Parent.Lines
--

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		wait(math.random(1, 3))
		LoadingScreen.Transparency = 0
		wait(math.random(1, 5))
		LoadingScreen.Transparency = 1
		for _, Object in pairs(Marks:GetChildren()) do
			Object.Transparency = 0
		end
		for _, Object in pairs(Lines:GetChildren()) do
			Object.SurfaceGui.TextLabel.Visible = true
		end
	end
end)
