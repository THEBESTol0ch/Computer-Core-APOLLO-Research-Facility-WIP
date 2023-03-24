-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local AccessGrantedValue = script.Parent.Parent.Values.AccessGrantedValue
--

-- Items
local DoorHinge = script.Parent.Parent.Parent.DoorHinge
--

-- Sounds
local OpenSound = script.Parent.Parent.Parent.Door.DoorOpenSound
local CloseSound = script.Parent.Parent.Parent.Door.DoorCloseSound
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

local DoorOpen = TweenService:Create(DoorHinge, OpenDoorAnimationSettings, {
	CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(-90), 0)
})
local DoorClose = TweenService:Create(DoorHinge, CloseDoorAnimationSettings, {
	CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0)
})

AccessGrantedValue.Changed:Connect(function()
	if AccessGrantedValue.Value == true and CanEvent == true then
		CanEvent = false
		DoorOpen:Play()
		OpenSound:Play()
		OpenSound:Play()
		wait(3)
		DoorClose:Play()
		wait(0.3)
		CloseSound:Play()
		wait(0.7)
		CanEvent = true
	end
end)
