-- Control
local TweenService = game:GetService("TweenService")
--

-- Items
local SlideDoor = script.Parent
local SoundEmitter = SlideDoor.SoundEmitter

local Door = SlideDoor.Door.Door
local DoorClosePos = SlideDoor.DoorClosePos
local DoorOpenPos = SlideDoor.DoorOpenPos
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

local DoorOpenAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorOpenPos.CFrame })
local DoorCloseAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorClosePos.CFrame })
--

-- Functions
function DoDoor()
	if CanEvent then
		CanEvent = false
		DoorOpenAnim:Play()
		OpenSound:Play()
		wait(3)
		DoorCloseAnim:Play()
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
