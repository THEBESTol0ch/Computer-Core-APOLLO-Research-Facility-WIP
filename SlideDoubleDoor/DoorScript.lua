-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Trigger
--

-- Items
local DoorFrameLeft = script.Parent.DoorFrameLeft
local DoorFrameRight = script.Parent.DoorFrameRight
local DoorFrameLeftPos = script.Parent.DoorFrameLeftPos
local DoorFrameRightPos = script.Parent.DoorFrameRightPos
--

-- Sounds
local OpenSound = script.Parent.SoundEmitter.SlideDoorOpenSound
local CloseSound = script.Parent.SoundEmitter.SlideDoorCloseSound
--

-- Logic
local CanEvent = true
--

local DoorFrameLeftOpen = {
	CFrame = DoorFrameLeftPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local DoorFrameRightOpen = {
	CFrame = DoorFrameRightPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local DoorFrameLeftClose = {
	CFrame = DoorFrameLeft.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local DoorFrameRightClose = {
	CFrame = DoorFrameRight.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local DoorAnimationSettings = TweenInfo.new(
	0.8,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local DoorFrameLeftOpen = TweenService:Create(DoorFrameLeft, DoorAnimationSettings, DoorFrameLeftOpen)
local DoorFrameRightOpen = TweenService:Create(DoorFrameRight, DoorAnimationSettings, DoorFrameRightOpen)
local DoorFrameLeftClose = TweenService:Create(DoorFrameLeft, DoorAnimationSettings, DoorFrameLeftClose)
local DoorFrameRightClose = TweenService:Create(DoorFrameRight, DoorAnimationSettings, DoorFrameRightClose)

Trigger.Touched:Connect(function()
	if CanEvent == true then
		CanEvent = false
		DoorFrameLeftOpen:Play()
		DoorFrameRightOpen:Play()
		OpenSound:Play()
		wait(3)
		DoorFrameLeftClose:Play()
		DoorFrameRightClose:Play()
		CloseSound:Play()
		wait(1)
		CanEvent = true
	end
end)
