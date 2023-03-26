-- Control
local LeftClickDetector = script.Parent.LeftClickDetector
local RightClickDetector = script.Parent.RightClickDetector
--

-- Sounds
local CloseSound = script.Parent.SoundEmitter.SimpleDoorCloseSound
--

-- Functions
function DoDoor()
	LeftClickDetector.ClickDetector.MaxActivationDistance = 0
	RightClickDetector.ClickDetector.MaxActivationDistance = 0
	CloseSound:Play()
	wait(1)
	LeftClickDetector.ClickDetector.MaxActivationDistance = 10
	RightClickDetector.ClickDetector.MaxActivationDistance = 10
end
--

LeftClickDetector.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)

RightClickDetector.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)
