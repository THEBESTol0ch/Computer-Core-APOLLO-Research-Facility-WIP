-- Items
local DeathTrigger = script.Parent
--

DeathTrigger.Touched:connect(function(Hit)
	if Hit.Parent:FindFirstChild("Humanoid") then
		DeathTrigger.CanTouch = false
		Hit.Parent.Humanoid.Health = Hit.Parent.Humanoid.Health - 10
		wait(1)
		DeathTrigger.CanTouch = true
	end
end)
