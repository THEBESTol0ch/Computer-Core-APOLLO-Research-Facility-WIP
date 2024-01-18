-- Control
local PushDoor = script.Parent
local Trigger = PushDoor.Trigger
--

-- Sounds
local CloseSound = Trigger.SimpleDoorCloseSound
--

Trigger.ClickDetector.MouseClick:Connect(function()
	Trigger.CanQuery = false
	CloseSound:Play()
	wait(1)
	Trigger.CanQuery = true
end)
