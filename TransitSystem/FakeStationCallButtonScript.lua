-- Control
local Button = script.Parent
--

-- Sounds
local TransitCallButtonSound = Button.TransitCallButtonSound
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	TransitCallButtonSound:Play()
	wait(2.3)
	Button.ClickDetector.MaxActivationDistance = 10
end)
