script.Parent.MouseButton1Click:Connect(function()
	for _, Descendant in pairs(workspace:GetDescendants()) do
		if Descendant:IsA("TextLabel") then
			local BufferText = Descendant.Text
			Descendant.Text = "TEXT HERE"
			Descendant.Text = BufferText
		end
	end
end)
