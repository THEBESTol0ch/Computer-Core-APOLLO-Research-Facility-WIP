-- Control
local FuelCellPickUpTrigger = script.Parent
--

FuelCellPickUpTrigger.ClickDetector.MouseClick:Connect(function(Player)
	local fuelCell = Player.Backpack:FindFirstChild("FuelCell")
	if not fuelCell then
		local FuelCell = game.ReplicatedStorage.FuelCell
		local Backpack = Player.Backpack
		local FuelCellClone = FuelCell:Clone()
		FuelCellClone.Parent = Backpack
	end
end)
