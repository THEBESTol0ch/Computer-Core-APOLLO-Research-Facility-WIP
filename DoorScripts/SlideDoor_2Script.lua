-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Trigger
--

-- Items
local SlideDoor = script.Parent
local SoundEmitter = SlideDoor.SoundEmitter

local Door = SlideDoor.Door.Door
local DoorClosePos = SlideDoor.DoorClosePos
local DoorOpenPos = SlideDoor.DoorOpenPos
--

-- Sounds
local OpenSound = SoundEmitter.SlideDoorOpenSound
local CloseSound = SoundEmitter.SlideDoorCloseSound
--

-- Logic
local DoorAnimationSettings = TweenInfo.new(
	0.8,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local DoorOpenAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorOpenPos.CFrame })
local DoorCloseAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorClosePos.CFrame })
--

Trigger.Touched:Connect(function()
	Trigger.CanTouch = false
	DoorOpenAnim:Play()
	OpenSound:Play()
	wait(3)
	DoorCloseAnim:Play()
	CloseSound:Play()
	wait(1)
	Trigger.CanTouch = true
end)
