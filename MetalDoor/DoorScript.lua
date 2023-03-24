-- Control
local TweenService = game:GetService("TweenService")

local ClickDetector = script.Parent.ClickDetector.ClickDetector
--

-- Items
local DoorHinge = script.Parent.DoorHinge
--

-- Sounds
local OpenSound = script.Parent.ClickDetector.DoorOpenSound
local CloseSound = script.Parent.ClickDetector.DoorCloseSound
--

-- Logic
local DoorOpened = false
--

local OpenDoorAnimationSettings = TweenInfo.new(
	1.2,
	Enum.EasingStyle.Bounce,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local CloseDoorAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local DoorOpen = TweenService:Create(DoorHinge, OpenDoorAnimationSettings, {
	CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(-90), 0)
})
local DoorClose = TweenService:Create(DoorHinge, CloseDoorAnimationSettings, {
	CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0)
})

ClickDetector.MouseClick:Connect(function()
	if DoorOpened == false then
		ClickDetector.MaxActivationDistance = 0
		DoorOpen:Play()
		OpenSound:Play()
		wait(1.5)
		DoorOpened = true
		ClickDetector.MaxActivationDistance = 10
	else
		ClickDetector.MaxActivationDistance = 0
		DoorClose:Play()
		wait(0.3)
		CloseSound:Play()
		wait(1.2)
		DoorOpened = false
		ClickDetector.MaxActivationDistance = 10
	end
end)
