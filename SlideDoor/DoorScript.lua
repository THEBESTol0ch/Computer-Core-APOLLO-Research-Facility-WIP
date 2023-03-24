-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Trigger
--

-- Items
local DoorFrame = script.Parent.DoorFrame
local DoorPos = script.Parent.DoorPos
--

-- Sounds
local OpenSound = script.Parent.SoundEmitter.SlideDoorOpenSound
local CloseSound = script.Parent.SoundEmitter.SlideDoorCloseSound
--

-- Logic
local CanEvent = true
--

local DoorOpen = {
	CFrame = DoorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local DoorClose = {
	CFrame = DoorFrame.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local DoorAnimationSettings = TweenInfo.new(
	0.8,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local DoorOpen = TweenService:Create(DoorFrame, DoorAnimationSettings, DoorOpen)
local DoorClose = TweenService:Create(DoorFrame, DoorAnimationSettings, DoorClose)


Trigger.Touched:Connect(function()
	if CanEvent == true then
		CanEvent = false
		DoorOpen:Play()
		OpenSound:Play()
		wait(3)
		DoorClose:Play()
		CloseSound:Play()
		wait(1)
		CanEvent = true
	end
end)
