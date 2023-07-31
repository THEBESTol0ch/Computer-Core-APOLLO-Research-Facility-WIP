local Character = script.Parent
local Backpack = game.Players[Character.Name].Backpack
local Item = script.Name:split("_")[1]
local HolsterModel = game.ReplicatedStorage[Item.."Stuff"][Item.."HolsterModel"]

function CreateHolsterModel()
	if not Character:FindFirstChild(HolsterModel.Name) then
		NewHolsterModel = HolsterModel:Clone()
		NewHolsterModel.Parent = Character
		NewHolsterModel.Connector.Weld.Part1 = Character.LowerTorso
	end
end

Backpack.ChildAdded:Connect(function(Child)
	if Child.Name == Item then
		CreateHolsterModel()
		for _, Item in pairs(NewHolsterModel:GetChildren()) do
			if not (Item:IsA("WeldConstraint") or Item:IsA("Weld") or Item.Name == "Connector") then
				Item.Transparency = 0
			end
		end
	end
end)

Backpack.ChildRemoved:Connect(function(Child)
	if Child.Name == Item then
		CreateHolsterModel()
		for _, Item in pairs(NewHolsterModel:GetChildren()) do
			if not (Item:IsA("WeldConstraint") or Item:IsA("Weld") or Item.Name == "Connector") then
				Item.Transparency = 1
			end
		end
	end
end)
