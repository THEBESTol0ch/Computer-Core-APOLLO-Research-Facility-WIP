-- Control
local TweenService = game:GetService("TweenService")
local LeftDoorClickDetector = script.Parent.LeftDoor.DoorClickDetector
local RightDoorClickDetector = script.Parent.RightDoor.DoorClickDetector
--

-- Items
local LeftHinge = script.Parent.LeftDoor.Hinge
local RightHinge = script.Parent.RightDoor.Hinge
--

-- Logic
local DoorOpened = false
--

local LeftDoorAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local RightDoorAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeftDoorOpen = TweenService:Create(LeftHinge, LeftDoorAnimationSettings, {
	CFrame = LeftHinge.CFrame * CFrame.Angles(math.rad(135), 0, 0)
})
local LeftDoorClose = TweenService:Create(LeftHinge, LeftDoorAnimationSettings, {
	CFrame = LeftHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RightDoorOpen = TweenService:Create(RightHinge, RightDoorAnimationSettings, {
	CFrame = RightHinge.CFrame * CFrame.Angles(math.rad(-105), 0, 0)
})
local RightDoorClose = TweenService:Create(RightHinge, RightDoorAnimationSettings, {
	CFrame = RightHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

LeftDoorClickDetector.ClickDetector.MouseClick:Connect(function()
	if DoorOpened == false then
		DoorOpened = true
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		LeftDoorOpen:Play()
		wait(1)
		RightDoorOpen:Play()
		wait(3)
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 10
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 10
	else
		DoorOpened = false
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		LeftDoorClose:Play()
		wait(1)
		RightDoorClose:Play()
		wait(3)
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 10
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 10
	end
end)

RightDoorClickDetector.ClickDetector.MouseClick:Connect(function()
	if DoorOpened == false then
		DoorOpened = true
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorOpen:Play()
		wait(1)
		LeftDoorOpen:Play()
		wait(3)
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 10
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 10
	else
		DoorOpened = false
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClose:Play()
		wait(1)
		LeftDoorClose:Play()
		wait(3)
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 10
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 10
	end
end)
