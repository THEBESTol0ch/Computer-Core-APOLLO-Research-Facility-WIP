local Button = script.Parent

local Descendants = workspace:GetDescendants()

Button.MouseButton1Click:Connect(function()
	for _, Descendant in pairs(Descendants) do
		if Descendant:IsA("TextLabel") then
			Descendant.TextScaled = false
		end
	end
	wait(2)
	for _, Descendant in pairs(Descendants) do
		if Descendant:IsA("TextLabel") then
			Descendant.TextScaled = true
		end
	end
end)
