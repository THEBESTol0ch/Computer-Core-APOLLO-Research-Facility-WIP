-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local AccessGrantedValue = script.Parent.Parent.Values.AccessGrantedValue
--

-- Items
local LeftDoorHinge = script.Parent.Parent.Parent.LeftDoorHinge
local RightDoorHinge = script.Parent.Parent.Parent.RightDoorHinge
--

-- Sounds
local OpenSound = script.Parent.Parent.Parent.SoundEmitter.DoorOpenSound
local CloseSound = script.Parent.Parent.Parent.SoundEmitter.DoorCloseSound
--

-- Logic
local CanEvent = true
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

AccessGrantedValue.Changed:Connect(function()
	if AccessGrantedValue.Value == true and CanEvent == true then
		CanEvent = false
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		OpenSound:Play()
		wait(3)
		LeftDoorClose:Play()
		RightDoorClose:Play()
		wait(0.3)
		CloseSound:Play()
		wait(0.7)
		CanEvent = true
	end
end)
