-- Control
local TweenService = game:GetService("TweenService")
local ClickDetector = script.Parent.ClickDetector.ClickDetector
--

-- Items
local DoorHinge = script.Parent.DoorHinge
--

-- Sounds
local OpenSound = script.Parent.ClickDetector.SimpleDoorOpenSound
local CloseSound = script.Parent.ClickDetector.SimpleDoorCloseSound
--

-- Logic
local DoorOpened = false
--

local DoorAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local DoorOpen = TweenService:Create(DoorHinge, DoorAnimationSettings, {
	CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(90), 0)
})
local DoorClose = TweenService:Create(DoorHinge, DoorAnimationSettings, {
	CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0)
})

ClickDetector.MouseClick:Connect(function()
	if DoorOpened == false then
		ClickDetector.MaxActivationDistance = 0
		DoorOpen:Play()
		OpenSound:Play()
		wait(1)
		DoorOpened = true
		ClickDetector.MaxActivationDistance = 10
	else
		ClickDetector.MaxActivationDistance = 0
		DoorClose:Play()
		wait(0.5)
		CloseSound:Play()
		DoorOpened = false
		ClickDetector.MaxActivationDistance = 10
	end
end)
