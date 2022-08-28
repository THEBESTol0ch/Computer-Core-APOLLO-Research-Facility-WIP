local TweenService = game:GetService("TweenService")

local LeftDoorHinge = script.Parent.LeftDoorHinge
local RightDoorHinge = script.Parent.RightDoorHinge

local OpenSound = script.Parent.SoundEmitter.DoorOpenSound
local CloseSound = script.Parent.SoundEmitter.DoorCloseSound

local DoorValue = script.Parent.DoorValue

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

local CanCheck = true

while true do
	if DoorValue.Value == 1 and CanCheck == true then
		CanCheck = false
		DoorValue.Value = 0
		wait(0.5)
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		OpenSound:Play()
		wait(3)
		LeftDoorClose:Play()
		RightDoorClose:Play()
		wait(0.3)
		CloseSound:Play()
		wait(0.7)
		CanCheck = true
	end
	wait(0.1)
end
