-- Control
local TweenService = game:GetService("TweenService")
local PushDoor = script.Parent
local Trigger = PushDoor.Door.Trigger
--

-- Items
local DoorHinge = PushDoor.DoorHinge
--

-- Sounds
local OpenSound = Trigger.DoorOpenSound
local CloseSound = Trigger.DoorCloseSound
--

-- Logic
local CanEvent = true
local DoorClosed = true

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
	Enum.EasingDirection.In,
	0,
	false,
	0
)

local DoorOpenAnim = TweenService:Create(DoorHinge, OpenDoorAnimationSettings, { CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(-90), 0) })
local DoorCloseAnim = TweenService:Create(DoorHinge, CloseDoorAnimationSettings, { CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0) })
--

Trigger.ClickDetector.MouseClick:Connect(function()
	if CanEvent then
		CanEvent = false
		if DoorClosed then
			Trigger.CanQuery = false
			DoorOpenAnim:Play()
			OpenSound:Play()
			wait(1.5)
			DoorClosed = false
			Trigger.CanQuery = true
		else
			Trigger.CanQuery = false
			DoorCloseAnim:Play()
			wait(0.3)
			CloseSound:Play()
			wait(1.2)
			DoorClosed = true
			Trigger.CanQuery = true
		end
		CanEvent = true
	end
end)
