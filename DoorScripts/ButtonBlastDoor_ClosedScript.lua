-- Control
local TweenService = game:GetService("TweenService")
local BlastDoor = script.Parent
local Button1 = BlastDoor.Button_1.Button
local Button2 = BlastDoor.Button_2.Button
--

-- Items
local Door = BlastDoor.Door.Door
local DoorOpenPos = BlastDoor.DoorOpenPos
local DoorClosePos = BlastDoor.DoorClosePos

local EmergencyLamps = BlastDoor.EmergencyLamps
--

-- Sounds
local OpenSound = BlastDoor.Door.SoundEmitter.BlastDoorOpenSound
local CloseSound = BlastDoor.Door.SoundEmitter.BlastDoorCloseSound
--

-- Logic
local CanEvent = true
local DoorClosed = true

local DoorAnimationSettings = TweenInfo.new(
	5.9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
--

local BlastDoorOpenAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorOpenPos.CFrame })
local BlastDoorCloseAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorClosePos.CFrame })

-- Functions
function DoLamps(Mode, Speed)
	for _, Lamp in pairs(EmergencyLamps:GetChildren()) do
		Lamp.Lamp.SpotLight.Enabled = Mode
		Lamp.Lamp.HingeConstraint.AngularVelocity = Speed
	end
end
function DoDoor()
	if CanEvent then
		if DoorClosed then
			CanEvent = false
			OpenSound:Play()
			BlastDoorOpenAnim:Play()
			DoLamps(true, 5)
			wait(5.9)
			DoLamps(false, 0)
			DoorClosed = false
			CanEvent = true
		elseif DoorClosed == false then
			CanEvent = false
			CloseSound:Play()
			BlastDoorCloseAnim:Play()
			DoLamps(true, 5)
			wait(5.9)
			DoLamps(false, 0)
			DoorClosed = true
			CanEvent = true
		end
	end
end
--

Button1.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)

Button2.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)
