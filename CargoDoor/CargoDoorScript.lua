-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local CargoDoorStatusValue = script.Parent.Parent.Values.CargoDoorStatusValue
local LeverValue = script.Parent.Parent.Parent.CargoDoorConsole1.PullLever.CPU.Values.LeverValue
--

-- Items
local LeftDoor = script.Parent.Parent.Parent.LeftDoor
local LeftDoorPos = script.Parent.Parent.Parent.LeftDoorPos
local RightDoor = script.Parent.Parent.Parent.RightDoor
local RightDoorPos = script.Parent.Parent.Parent.RightDoorPos

local EmergencyLamps = script.Parent.Parent.Parent.EmergencyLamps

local DoorLamp1 = script.Parent.Parent.Parent.CargoDoorConsole1.GreenLamp.Lamp
local DoorLamp2 = script.Parent.Parent.Parent.CargoDoorConsole2.GreenLamp.Lamp
--

-- Sounds
local OpenSound = script.Parent.Parent.Parent.SoundEmitter1.BlastDoorOpenSound
local CloseSound = script.Parent.Parent.Parent.SoundEmitter1.BlastDoorCloseSound
local AlarmSound = script.Parent.Parent.Parent.SoundEmitter2.CargoDoorAlarmSound
--

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

-- Functions
function DoLamps(Mode)
	if Mode == "ON" then
		for _, EmergencyLamp in pairs(EmergencyLamps:GetChildren()) do
			EmergencyLamp.Lamp.SpotLight.Enabled = true
			EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 5
		end
	elseif Mode == "OFF" then
		for _, EmergencyLamp in pairs(EmergencyLamps:GetChildren()) do
			EmergencyLamp.Lamp.SpotLight.Enabled = true
			EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 5
		end
	end
end
--

LeverValue.Changed:Connect(function()
	if LeverValue.Value == "FULL" then
		CargoDoorStatusValue.Value = "OPEN"
		DoorLamp1.BrickColor = BrickColor.new("Neon orange")
		DoorLamp2.BrickColor = BrickColor.new("Neon orange")
		AlarmSound:Play()
		wait(1)
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		OpenSound:Play()
		DoLamps("ON")
		wait(6)
		DoLamps("OFF")
		DoorLamp1.BrickColor = BrickColor.new("Lime green")
		DoorLamp2.BrickColor = BrickColor.new("Lime green")
		CargoDoorStatusValue.Value = "OPENED"
	elseif LeverValue.Value == "LOW" then
		CargoDoorStatusValue.Value = "CLOSE"
		DoorLamp1.BrickColor = BrickColor.new("Neon orange")
		DoorLamp2.BrickColor = BrickColor.new("Neon orange")
		AlarmSound:Play()
		wait(1)
		LeftDoorClose:Play()
		RightDoorClose:Play()
		CloseSound:Play()
		DoLamps("ON")
		wait(6)
		DoLamps("OFF")
		DoorLamp1.BrickColor = BrickColor.new("Lime green")
		DoorLamp2.BrickColor = BrickColor.new("Lime green")
		CargoDoorStatusValue.Value = "CLOSED"
	end
end)
