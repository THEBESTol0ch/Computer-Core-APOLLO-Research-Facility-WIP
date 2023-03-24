-- Control
local ClickDetector = script.Parent.ClickDetector.ClickDetector
--

-- Sounds
local CloseSound = script.Parent.ClickDetector.SimpleDoorCloseSound
--

ClickDetector.MouseClick:Connect(function()
	ClickDetector.MaxActivationDistance = 0
	CloseSound:Play()
	wait(1)
	ClickDetector.MaxActivationDistance = 10
end)
