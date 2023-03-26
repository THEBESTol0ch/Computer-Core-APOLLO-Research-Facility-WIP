-- Control
local TweenService = game:GetService("TweenService")
local Button1 = script.Parent.Control.Button1.Button
local Button2 = script.Parent.Control.Button2.Button
--

-- Items
local BlastDoor = script.Parent.BlastDoor.BlastDoor
local BlastDoorPosOpen = script.Parent.BlastDoor.BlastDoorPosOpen
local BlastDoorPosClose = script.Parent.BlastDoor.BlastDoorPosClose
local EL1 = script.Parent.BlastDoor.EmergencyLamps.EmergencyLamp1.Lamp
local EL2 = script.Parent.BlastDoor.EmergencyLamps.EmergencyLamp2.Lamp
--

-- Sounds
local OpenSound = script.Parent.BlastDoor.SoundEmitter.BlastDoorOpenSound
local CloseSound = script.Parent.BlastDoor.SoundEmitter.BlastDoorCloseSound
--

-- Logic
local BlastDoorClosed = true
--

local BlastDoorOpen = {
	CFrame = BlastDoorPosOpen.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local BlastDoorClose = {
	CFrame = BlastDoorPosClose.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local BlastDoorAnimationSettings = TweenInfo.new(
	5.9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local BlastDoorOpen = TweenService:Create(BlastDoor, BlastDoorAnimationSettings, BlastDoorOpen)
local BlastDoorClose = TweenService:Create(BlastDoor, BlastDoorAnimationSettings, BlastDoorClose)

-- Functions
function DoLamps(Class, Mode)
	if Class == "EmergencyLamp" then
		if Mode == "ON" then
			EL1.HingeConstraint.AngularVelocity = 5
			EL1.SpotLight.Enabled = true
			EL2.HingeConstraint.AngularVelocity = 5
			EL2.SpotLight.Enabled = true
		elseif Mode == "OFF" then
			EL1.HingeConstraint.AngularVelocity = 0
			EL1.SpotLight.Enabled = false
			EL2.HingeConstraint.AngularVelocity = 0
			EL2.SpotLight.Enabled = false
		end
	end
end
function DoDoor()
	if BlastDoorClosed == true then
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		OpenSound:Play()
		BlastDoorOpen:Play()
		DoLamps("EmergencyLamp", "ON")
		wait(5.9)
		DoLamps("EmergencyLamp", "OFF")
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		BlastDoorClosed = false
	elseif BlastDoorClosed == false then
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		CloseSound:Play()
		BlastDoorClose:Play()
		DoLamps("EmergencyLamp", "ON")
		wait(5.9)
		DoLamps("EmergencyLamp", "OFF")
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		BlastDoorClosed = true
	end
end
--

Button1.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)

Button2.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)
