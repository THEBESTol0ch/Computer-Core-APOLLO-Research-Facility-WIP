-- Control
local TweenService = game:GetService("TweenService")

local LeftClickDetector = script.Parent.LeftClickDetector
local RightClickDetector = script.Parent.RightClickDetector
--

-- Items
local LeftDoorHinge = script.Parent.LeftDoorHinge
local RightDoorHinge = script.Parent.RightDoorHinge
--

-- Sounds
local OpenSound = script.Parent.SoundEmitter.DoorOpenSound
local CloseSound = script.Parent.SoundEmitter.DoorCloseSound
--

--
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

local LeftDoorOpen = TweenService:Create(LeftDoorHinge, OpenDoorAnimationSettings, {
	CFrame = LeftDoorHinge.CFrame * CFrame.Angles(0, math.rad(-90), 0)
})
local LeftDoorClose = TweenService:Create(LeftDoorHinge, CloseDoorAnimationSettings, {
	CFrame = LeftDoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0)
})
local RightDoorOpen = TweenService:Create(RightDoorHinge, OpenDoorAnimationSettings, {
	CFrame = RightDoorHinge.CFrame * CFrame.Angles(0, math.rad(90), 0)
})
local RightDoorClose = TweenService:Create(RightDoorHinge, CloseDoorAnimationSettings, {
	CFrame = RightDoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0)
})

-- Functions
function DoDoor()
	if DoorOpened == false then
		LeftClickDetector.ClickDetector.MaxActivationDistance = 0
		RightClickDetector.ClickDetector.MaxActivationDistance = 0
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		OpenSound:Play()
		wait(1.5)
		DoorOpened = true
		LeftClickDetector.ClickDetector.MaxActivationDistance = 10
		RightClickDetector.ClickDetector.MaxActivationDistance = 10
	else
		LeftClickDetector.ClickDetector.MaxActivationDistance = 0
		RightClickDetector.ClickDetector.MaxActivationDistance = 0
		LeftDoorClose:Play()
		RightDoorClose:Play()
		wait(0.3)
		CloseSound:Play()
		wait(1.2)
		DoorOpened = false
		LeftClickDetector.ClickDetector.MaxActivationDistance = 10
		RightClickDetector.ClickDetector.MaxActivationDistance = 10
	end
end
--

LeftClickDetector.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)

RightClickDetector.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)
