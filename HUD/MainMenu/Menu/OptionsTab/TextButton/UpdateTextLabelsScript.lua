-- Control
local Button = script.Parent
--

-- Logic
local BufferFont
local TextBoldStatus
--

Button.MouseButton1Click:Connect(function()
	for _, Descendant in pairs(workspace:GetDescendants()) do
		if Descendant:IsA("TextLabel") then
			BufferFont = Descendant.Font
			TextBoldStatus = Descendant.FontFace.Bold
			print(TextBoldStatus)
			Descendant.Font = "Ubuntu"
			Descendant.Font = BufferFont
			if TextBoldStatus then
				Descendant.FontFace.Weight = Enum.FontWeight.Bold
			end
		end
	end
end)
