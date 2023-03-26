-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local BlastDoorStatusValue = script.Parent.Parent.Values.BlastDoorStatusValue
local BlastDoorsControlValue = game.ReplicatedStorage.GameValues.BlastDoorsControlValue
--

-- Items
local BlastDoor = script.Parent.Parent.Parent.BlastDoor
local BlastDoorPosOpen = script.Parent.Parent.Parent.BlastDoorPosOpen
local BlastDoorPosClose = script.Parent.Parent.Parent.BlastDoorPosClose
local EL1 = script.Parent.Parent.Parent.EmergencyLamps.EmergencyLamp1.Lamp
local EL2 = script.Parent.Parent.Parent.EmergencyLamps.EmergencyLamp2.Lamp
--

-- Sounds
local OpenSound = script.Parent.Parent.Parent.SoundEmitter.BlastDoorOpenSound
local CloseSound = script.Parent.Parent.Parent.SoundEmitter.BlastDoorCloseSound
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
function DoDoor(Mode)
	if Mode == "OPEN" and BlastDoorStatusValue.Value == "CLOSED" then
		BlastDoorStatusValue.Value = "OPEN"
		BlastDoor.CanTouch = false
		OpenSound:Play()
		BlastDoorOpen:Play()
		DoLamps("EmergencyLamp", "ON")
		wait(5.9)
		DoLamps("EmergencyLamp", "OFF")
		BlastDoorStatusValue.Value = "OPENED"
	elseif Mode == "CLOSE" and BlastDoorStatusValue.Value == "OPENED" then
		BlastDoorStatusValue.Value = "CLOSE"
		CloseSound:Play()
		BlastDoorClose:Play()
		DoLamps("EmergencyLamp", "ON")
		wait(5.9)
		DoLamps("EmergencyLamp", "OFF")
		BlastDoor.CanTouch = true
		BlastDoorStatusValue.Value = "CLOSED"
	end
end
function DoCheck()
	if BlastDoorsControlValue.Value == "CLOSE" then
		DoDoor("CLOSE")
	elseif BlastDoorsControlValue.Value == "OPEN" then
		DoDoor("OPEN")
	end
end
--

BlastDoorsControlValue.Changed:Connect(function()
	DoCheck()
end)

BlastDoorStatusValue.Changed:Connect(function()
	wait(2)
	DoCheck()
end)

BlastDoor.Touched:Connect(function(Hit)
	if Hit.Parent:FindFirstChild("HackToolTrigger") then
		DoDoor("OPEN")
	end
end)
