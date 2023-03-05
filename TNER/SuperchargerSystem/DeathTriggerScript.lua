-- Items
local DeathTrigger1 = script.Parent.DeathTrigger1
local DeathTrigger2 = script.Parent.DeathTrigger2
--

-- Functions
function Kill(Hit)
	if Hit.Parent:FindFirstChild("Humanoid") then
		Hit.Parent.Humanoid.Health = 0
	end
end
--

DeathTrigger1.Touched:connect(function(Hit)
	Kill(Hit)
end)

DeathTrigger2.Touched:connect(function(Hit)
	Kill(Hit)
end)
