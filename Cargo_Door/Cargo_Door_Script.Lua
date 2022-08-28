local TweenService = game:GetService("TweenService")

local LeftDoor = script.Parent.LeftDoor
local LeftDoorPos = script.Parent.LeftDoorPos
local RightDoor = script.Parent.RightDoor
local RightDoorPos = script.Parent.RightDoorPos

local EL1 = script.Parent.EmergencyLamp1.EL1
local EL2 = script.Parent.EmergencyLamp2.EL2

local OpenSound = script.Parent.SoundEmitter1.BlastDoorOpenSound
local CloseSound = script.Parent.SoundEmitter1.BlastDoorCloseSound
local AlarmSound = script.Parent.SoundEmitter2.CargoDoorAlarmSound

local Trigger1 = script.Parent.CargoDoorConsole1.PullLever.Lever.Trigger
local Trigger2 = script.Parent.CargoDoorConsole2.PullLever.Lever.Trigger

local LeftDoorOpen = {
	CFrame = LeftDoorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RightDoorOpen = {
	CFrame = RightDoorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeftDoorClose = {
	CFrame = LeftDoor.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RightDoorClose = {
	CFrame = RightDoor.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local BlastDoorAnimationSettings = TweenInfo.new(
	5.9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeftDoorOpen = TweenService:Create(LeftDoor, BlastDoorAnimationSettings, LeftDoorOpen)
local RightDoorOpen = TweenService:Create(RightDoor, BlastDoorAnimationSettings, RightDoorOpen)
local LeftDoorClose = TweenService:Create(LeftDoor, BlastDoorAnimationSettings, LeftDoorClose)
local RightDoorClose = TweenService:Create(RightDoor, BlastDoorAnimationSettings, RightDoorClose)

local Opened = false

Trigger1.ClickDetector.MouseClick:Connect(function()
	if Opened == false then
		AlarmSound:Play()
		wait(1)
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		OpenSound:Play()
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		Opened = true
		wait(6)
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
	else
		AlarmSound:Play()
		wait(1)
		LeftDoorClose:Play()
		RightDoorClose:Play()
		CloseSound:Play()
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		Opened = false
		wait(6)
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
	end
end)

Trigger2.ClickDetector.MouseClick:Connect(function()
	if Opened == false then
		AlarmSound:Play()
		wait(1)
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		OpenSound:Play()
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		Opened = true
		wait(6)
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
	else
		AlarmSound:Play()
		wait(1)
		LeftDoorClose:Play()
		RightDoorClose:Play()
		CloseSound:Play()
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		Opened = false
		wait(6)
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
	end
end)
