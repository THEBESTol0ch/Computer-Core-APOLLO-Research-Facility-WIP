-- Control
local TweenService = game:GetService("TweenService")
local PushDoor = script.Parent
local LeftTrigger = PushDoor.LeftDoor.Trigger
local RightTrigger = PushDoor.RightDoor.Trigger
--

-- Items
local LeftDoorHinge = PushDoor.LeftDoorHinge
local RightDoorHinge = PushDoor.RightDoorHinge
--

-- Sounds
local SoundEmitter = PushDoor.SoundEmitter
local OpenSound = SoundEmitter.DoorOpenSound
local CloseSound = SoundEmitter.DoorCloseSound
--

-- Logic
local CanEvent = true
local DoorClosed = true

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

local LeftDoorOpenAnim = TweenService:Create(LeftDoorHinge, OpenDoorAnimationSettings, { CFrame = LeftDoorHinge.CFrame * CFrame.Angles(0, math.rad(-90), 0) })
local LeftDoorCloseAnim = TweenService:Create(LeftDoorHinge, CloseDoorAnimationSettings, { CFrame = LeftDoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0) })

local RightDoorOpenAnim = TweenService:Create(RightDoorHinge, OpenDoorAnimationSettings, { CFrame = RightDoorHinge.CFrame * CFrame.Angles(0, math.rad(90), 0) })
local RightDoorCloseAnim = TweenService:Create(RightDoorHinge, CloseDoorAnimationSettings, { CFrame = RightDoorHinge.CFrame * CFrame.Angles(0, math.rad(0), 0) })
--

-- Functions
function DoDoor()
	if CanEvent then
		CanEvent = false
		if DoorClosed then
			LeftTrigger.CanQuery = false
			RightTrigger.CanQuery = false
			LeftDoorOpenAnim:Play()
			RightDoorOpenAnim:Play()
			OpenSound:Play()
			wait(1.5)
			DoorClosed = false
			LeftTrigger.CanQuery = true
			RightTrigger.CanQuery = true
		else
			LeftTrigger.CanQuery = false
			RightTrigger.CanQuery = false
			LeftDoorCloseAnim:Play()
			RightDoorCloseAnim:Play()
			wait(0.3)
			CloseSound:Play()
			wait(1.2)
			DoorClosed = true
			LeftTrigger.CanQuery = true
			RightTrigger.CanQuery = true
		end
		CanEvent = true
	end
end
--

LeftTrigger.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)

RightTrigger.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)
