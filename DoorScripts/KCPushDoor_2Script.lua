-- Control
local TweenService = game:GetService("TweenService")
local PushDoor = script.Parent
--

-- Items
local DoorHinge = PushDoor.DoorHinge
--

-- Values
local AccessGrantedValue_1 = PushDoor.KeyCardPanel_1.CPU.Values.AccessGrantedValue
local AccessGrantedValue_2 = PushDoor.KeyCardPanel_2.CPU.Values.AccessGrantedValue
--

-- Sounds
local SoundEmitter = PushDoor.SoundEmitter
local OpenSound = SoundEmitter.DoorOpenSound
local CloseSound = SoundEmitter.DoorCloseSound
--

-- Logic
local CanEvent = true

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
	Enum.EasingDirection.In,
	0,
	false,
	0
)

local DoorOpenAnim = TweenService:Create(DoorHinge, OpenDoorAnimationSettings, { CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(-90), 0) })
local DoorCloseAnim = TweenService:Create(DoorHinge, CloseDoorAnimationSettings, { CFrame = DoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0) })
--

-- Functions
function DoDoor()
	if CanEvent then
		CanEvent = false
		DoorOpenAnim:Play()
		OpenSound:Play()
		wait(3.5)
		DoorCloseAnim:Play()
		wait(0.3)
		CloseSound:Play()
		wait(1.2)
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
