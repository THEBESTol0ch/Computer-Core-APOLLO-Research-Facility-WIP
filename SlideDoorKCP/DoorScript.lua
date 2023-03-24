-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local AccessGrantedValue = script.Parent.Parent.Values.AccessGrantedValue
--

-- Items
local DoorFrame = script.Parent.Parent.Parent.DoorFrame
local DoorPos = script.Parent.Parent.Parent.DoorPos
--

-- Sounds
local OpenSound = script.Parent.Parent.Parent.SoundEmitter.SlideDoorOpenSound
local CloseSound = script.Parent.Parent.Parent.SoundEmitter.SlideDoorCloseSound
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

AccessGrantedValue.Changed:Connect(function()
	if AccessGrantedValue.Value == true and CanEvent == true then
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
