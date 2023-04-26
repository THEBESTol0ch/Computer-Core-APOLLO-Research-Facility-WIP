-- Control
local Trigger = script.Parent.Trigger
--

-- Items
local MainFrame = script.Parent.MainFrame
local BridgeLamp = script.Parent.BrigdeLamp.Lamp
--

Trigger.Touched:connect(function(Hit)
	if Hit.Parent:FindFirstChild("DamagedPart") then
		MainFrame.Anchored = false
		MainFrame.CanCollide = false
		BridgeLamp.Material = ("Metal")
		BridgeLamp.PointLight.Enabled = false
	end
end)
