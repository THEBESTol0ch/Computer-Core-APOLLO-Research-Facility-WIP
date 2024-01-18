-- Control
local TweenService = game:GetService("TweenService")
local BlastDoor = script.Parent
--

-- Values
local ControlValue = workspace.Values.RemoteBlastDoorsControlValue
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
local DoorClosed = false

local DoorAnimationSettings = TweenInfo.new(
	5.9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local BlastDoorOpenAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorOpenPos.CFrame })
local BlastDoorCloseAnim = TweenService:Create(Door, DoorAnimationSettings, { CFrame = DoorClosePos.CFrame })
--

-- Functions
function DoCheck()
	if ControlValue.Value == true and DoorClosed == false then
		DoDoor()
	elseif ControlValue.Value == false and DoorClosed == true then
		DoDoor()
	end
end

function DoLamps(Mode, Speed)
	for _, Lamp in pairs(EmergencyLamps:GetChildren()) do
		Lamp.Lamp.SpotLight.Enabled = Mode
		Lamp.Lamp.HingeConstraint.AngularVelocity = Speed
	end
end
function DoDoor()
	if CanEvent then
		CanEvent = false
		if DoorClosed then
			OpenSound:Play()
			BlastDoorOpenAnim:Play()
			DoLamps(true, 5)
			wait(5.9)
			DoLamps(false, 0)
			DoorClosed = false
		elseif DoorClosed == false then
			CloseSound:Play()
			BlastDoorCloseAnim:Play()
			DoLamps(true, 5)
			wait(5.9)
			DoLamps(false, 0)
			DoorClosed = true
		end
		CanEvent = true
		wait(2)
		DoCheck()
	end
end
--

ControlValue.Changed:Connect(function()
	DoCheck()
end)
