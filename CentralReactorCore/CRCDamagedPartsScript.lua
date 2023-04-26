-- Values
local DeployPartsValue = script.Parent.Parent.Values.DeployPartsValue
--

-- Items
local Parts = script.Parent.Parent.Parent.Parts
--

DeployPartsValue.Changed:Connect(function()
	if DeployPartsValue.Value == true then
		for _, Part in pairs(Parts:GetDescendants()) do
			if Part:IsA("UnionOperation") then
				Part.Anchored = false
			end
		end
	end
end)
