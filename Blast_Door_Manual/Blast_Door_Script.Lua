local TweenService = game:GetService("TweenService")

local BlastDoor = script.Parent.BlastDoor.BlastDoor
local BlastDoorPosOpen = script.Parent.BlastDoor.BlastDoorPosOpen
local BlastDoorPosClose = script.Parent.BlastDoor.BlastDoorPosClose

local OpenSound = script.Parent.BlastDoor.SoundEmitter.BlastDoorOpenSound
local CloseSound = script.Parent.BlastDoor.SoundEmitter.BlastDoorCloseSound

local EL1 = script.Parent.BlastDoor.EmergencyLamps.EmergencyLamp1.Lamp
local EL2 = script.Parent.BlastDoor.EmergencyLamps.EmergencyLamp2.Lamp

local Button1 = script.Parent.Control.Button1.Button
local Button2 = script.Parent.Control.Button2.Button

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

local BlastDoorStatus = false
local CanEvent = true

Button1.ClickDetector.MouseClick:Connect(function()
	if BlastDoorStatus == false and CanEvent == true then
		CanEvent = false
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		OpenSound:Play()
		BlastDoorOpen:Play()
		EL1.HingeConstraint.AngularVelocity = 5
		EL1.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		BlastDoorStatus = true
		wait(5.9)
		EL1.HingeConstraint.AngularVelocity = 0
		EL1.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		CanEvent = true
	end
end)

Button1.ClickDetector.MouseClick:Connect(function()
	if BlastDoorStatus == true and CanEvent == true then
		CanEvent = false
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		CloseSound:Play()
		BlastDoorClose:Play()
		EL1.HingeConstraint.AngularVelocity = 5
		EL1.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		BlastDoorStatus = false
		wait(5.9)
		EL1.HingeConstraint.AngularVelocity = 0
		EL1.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		CanEvent = true
	end
end)

Button2.ClickDetector.MouseClick:Connect(function()
	if BlastDoorStatus == false and CanEvent == true then
		CanEvent = false
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		OpenSound:Play()
		BlastDoorOpen:Play()
		EL1.HingeConstraint.AngularVelocity = 5
		EL1.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		BlastDoorStatus = true
		wait(5.9)
		EL1.HingeConstraint.AngularVelocity = 0
		EL1.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		CanEvent = true
	end
end)

Button2.ClickDetector.MouseClick:Connect(function()
	if BlastDoorStatus == true and CanEvent == true then
		CanEvent = false
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		CloseSound:Play()
		BlastDoorClose:Play()
		EL1.HingeConstraint.AngularVelocity = 5
		EL1.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		BlastDoorStatus = false
		wait(5.9)
		EL1.HingeConstraint.AngularVelocity = 0
		EL1.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		CanEvent = true
	end
end)
