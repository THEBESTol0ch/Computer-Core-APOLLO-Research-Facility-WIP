-- Control
local DepletedFuelCellDestroyerTrigger = script.Parent
--

-- Items
local DepletedFuelCell = game.ReplicatedStorage.DepletedFuelCell
--

DepletedFuelCellDestroyerTrigger.ClickDetector.MouseClick:Connect(function(Player)
	local depletedFuelCell = Player.Backpack:FindFirstChild("DepletedFuelCell")
	if depletedFuelCell then
		depletedFuelCell:Destroy()
	end
end)
