-- Control
local TweenService = game:GetService("TweenService")
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

-- Values
local AccessGrantedValue_1 = SlideDoor.KeyCardPanel_1.CPU.Values.AccessGrantedValue
local AccessGrantedValue_2 = SlideDoor.KeyCardPanel_2.CPU.Values.AccessGrantedValue
--

-- Sounds
local OpenSound = SoundEmitter.SlideDoorOpenSound
local CloseSound = SoundEmitter.SlideDoorCloseSound
--

-- Logic
local CanEvent = true

local DoorAnimationSettings = TweenInfo.new(
	0.8,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local LeftDoorOpenAnim = TweenService:Create(LeftDoor, DoorAnimationSettings, { CFrame = LeftDoorOpenPos.CFrame })
local LeftDoorCloseAnim = TweenService:Create(LeftDoor, DoorAnimationSettings, { CFrame = LeftDoorClosePos.CFrame })

local RightDoorOpenAnim = TweenService:Create(RightDoor, DoorAnimationSettings, { CFrame = RightDoorOpenPos.CFrame })
local RightDoorCloseAnim = TweenService:Create(RightDoor, DoorAnimationSettings, { CFrame = RightDoorClosePos.CFrame })
--

-- Functions
function DoDoor()
	if CanEvent then
		CanEvent = false
		LeftDoorOpenAnim:Play()
		RightDoorOpenAnim:Play()
		OpenSound:Play()
		wait(3)
		LeftDoorCloseAnim:Play()
		RightDoorCloseAnim:Play()
		CloseSound:Play()
		wait(1)
		CanEvent = true
	end
end
--

AccessGrantedValue_1.Changed:Connect(function()
	if AccessGrantedValue_1.Value == true then
		DoDoor()
	end
end)

AccessGrantedValue_2.Changed:Connect(function()
	if AccessGrantedValue_2.Value == true then
		DoDoor()
	end
end)
