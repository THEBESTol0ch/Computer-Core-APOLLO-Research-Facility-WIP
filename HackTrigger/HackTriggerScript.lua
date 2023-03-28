-- Control
local HackTrigger = script.Parent
--

-- Items
local MilitaryLaptop = script.Parent.Parent.MilitaryLaptop
--

HackTrigger.Touched:Connect(function(Hit)
	if Hit.Parent.Name == "MilitaryLaptop" then
		HackTrigger.CanTouch = false
		local Player = game.Players:GetPlayerFromCharacter(Hit.Parent.Parent)
		local Tool = workspace[tostring(Player)][Hit.Parent.Name]
		Tool:Destroy()
		
		MilitaryLaptop.Trigger.ClickDetector.MaxActivationDistance = 10
		MilitaryLaptop.MainFrame.Transparency = 0
		MilitaryLaptop.Monitor.Frame.Transparency = 0
		HackTrigger.Transparency = 1
		wait(1)
		HackTrigger.Transparency = 1
	end
end)
