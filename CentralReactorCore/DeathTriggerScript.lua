-- Items
local DeathTrigger = script.Parent
--

DeathTrigger.Touched:connect(function(Hit)
	if Hit.Parent:FindFirstChild("Humanoid") then
		Hit.Parent.Humanoid.Health = 0
	end
end)
