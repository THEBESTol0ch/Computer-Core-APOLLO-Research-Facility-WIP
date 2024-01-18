-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Trigger
--

-- Items
local SlideDoor = script.Parent
local SoundEmitter = SlideDoor.SoundEmitter

local LeftDoor = SlideDoor.LeftDoor.Door
local LeftDoorClosePos = SlideDoor.LeftDoorClosePos
local LeftDoorOpenPos = SlideDoor.LeftDoorOpenPos

local RightDoor = SlideDoor.RightDoor.Door
local RightDoorClosePos = SlideDoor.RightDoorClosePos
local RightDoorOpenPos = SlideDoor.RightDoorOpenPos
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
--

local LeftDoorOpenAnim = TweenService:Create(LeftDoor, DoorAnimationSettings, { CFrame = LeftDoorOpenPos.CFrame })
local LeftDoorCloseAnim = TweenService:Create(LeftDoor, DoorAnimationSettings, { CFrame = LeftDoorClosePos.CFrame })

local RightDoorOpenAnim = TweenService:Create(RightDoor, DoorAnimationSettings, { CFrame = RightDoorOpenPos.CFrame })
local RightDoorCloseAnim = TweenService:Create(RightDoor, DoorAnimationSettings, { CFrame = RightDoorClosePos.CFrame })

Trigger.Touched:Connect(function()
	Trigger.CanTouch = false
	LeftDoorOpenAnim:Play()
	RightDoorOpenAnim:Play()
	OpenSound:Play()
	wait(3)
	LeftDoorCloseAnim:Play()
	RightDoorCloseAnim:Play()
	CloseSound:Play()
	wait(1)
	Trigger.CanTouch = true
end)
