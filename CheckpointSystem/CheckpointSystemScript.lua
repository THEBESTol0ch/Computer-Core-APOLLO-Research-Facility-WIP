-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local CheckpointSystemStatusValue = script.Parent.Parent.Values.CheckpointSystemStatusValue
local MilitaryForceControlValue = game.ReplicatedStorage.GameValues.MilitaryForceControlValue
local MilitaryForceStatusValue = game.ReplicatedStorage.GameValues.MilitaryForceStatusValue
local HMMWV1StatusValue = script.Parent.Parent.Parent.HMMWV1Animation.CPU.Values.StatusValue
local HMMWV2StatusValue = script.Parent.Parent.Parent.HMMWV2Animation.CPU.Values.StatusValue
local MilitaryTruck1StatusValue = script.Parent.Parent.Parent.MilitaryTruck1Animation.CPU.Values.StatusValue
local MilitaryTruck2StatusValue = script.Parent.Parent.Parent.MilitaryTruck2Animation.CPU.Values.StatusValue
--

-- Items
local LeftDoor = script.Parent.Parent.Parent.CargoDoor.LeftDoor
local LeftDoorPos = script.Parent.Parent.Parent.CargoDoor.LeftDoorPos
local RightDoor = script.Parent.Parent.Parent.CargoDoor.RightDoor
local RightDoorPos = script.Parent.Parent.Parent.CargoDoor.RightDoorPos
local EL1 = script.Parent.Parent.Parent.CargoDoor.EmergencyLamp1.EL1
local EL2 = script.Parent.Parent.Parent.CargoDoor.EmergencyLamp2.EL2
local CargoDoorUpLamp = script.Parent.Parent.Parent.CargoDoorLamps.UpLamp.Lamp
local CargoDoorDownLamp = script.Parent.Parent.Parent.CargoDoorLamps.DownLamp.Lamp
local BarrierHinge = script.Parent.Parent.Parent.Barrier.Stick.Hinge
--

-- Sounds
local OpenSound = script.Parent.Parent.Parent.CargoDoor.SoundEmitter1.BlastDoorOpenSound
local CloseSound = script.Parent.Parent.Parent.CargoDoor.SoundEmitter1.BlastDoorCloseSound
local AlarmSound = script.Parent.Parent.Parent.CargoDoor.SoundEmitter2.CargoDoorAlarmSound
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
local BarrierAnimationSettings = TweenInfo.new(
	2,
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

local BarrierOpen = TweenService:Create(BarrierHinge, BarrierAnimationSettings, {
	CFrame = BarrierHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})
local BarrierClose = TweenService:Create(BarrierHinge, BarrierAnimationSettings, {
	CFrame = BarrierHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

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
	wait(1)
	if MilitaryForceControlValue.Value == "CALL" or MilitaryForceControlValue.Value == "CALL OFF" then
		if MilitaryForceStatusValue.Value == "ARRIVE" or MilitaryForceStatusValue.Value == "DEPART" then
			if CheckpointSystemStatusValue.Value == "CLOSED" then
				CheckpointSystemStatusValue.Value = "OPEN"
				AlarmSound:Play()
				CargoDoorUpLamp.BrickColor = BrickColor.new("Really black")
				CargoDoorDownLamp.BrickColor = BrickColor.new("Neon orange")
				wait(1)
				LeftDoorOpen:Play()
				RightDoorOpen:Play()
				OpenSound:Play()
				DoLamps("ON")
				wait(6)
				DoLamps("OFF")
				BarrierOpen:Play()
				wait(2)
				CargoDoorUpLamp.BrickColor = BrickColor.new("Really black")
				CargoDoorDownLamp.BrickColor = BrickColor.new("Neon orange")
				CheckpointSystemStatusValue.Value = "OPENED"
				wait(24)
				CheckpointSystemStatusValue.Value = "CLOSE"
				BarrierClose:Play()
				wait(2)
				AlarmSound:Play()
				CargoDoorUpLamp.BrickColor = BrickColor.new("Really black")
				CargoDoorDownLamp.BrickColor = BrickColor.new("Neon orange")
				wait(1)
				LeftDoorClose:Play()
				RightDoorClose:Play()
				CloseSound:Play()
				DoLamps("ON")
				wait(6)
				DoLamps("OFF")
				CargoDoorUpLamp.BrickColor = BrickColor.new("Really red")
				CargoDoorDownLamp.BrickColor = BrickColor.new("Really black")
				CheckpointSystemStatusValue.Value = "CLOSED"
			end
		end
	end
end
function DoCheck()
	if HMMWV1StatusValue.Value == "ARRIVED" and HMMWV2StatusValue.Value == "ARRIVED" and MilitaryTruck1StatusValue.Value == "ARRIVED" and MilitaryTruck2StatusValue.Value == "ARRIVED" then
		MilitaryForceStatusValue.Value = "ARRIVED"
	elseif HMMWV1StatusValue.Value == "DEPARTED" and HMMWV2StatusValue.Value == "DEPARTED" and MilitaryTruck1StatusValue.Value == "DEPARTED" and MilitaryTruck2StatusValue.Value == "DEPARTED" then
		MilitaryForceStatusValue.Value = "DEPARTED"
	elseif HMMWV1StatusValue.Value == "ARRIVE" or HMMWV2StatusValue.Value == "ARRIVE" or MilitaryTruck1StatusValue.Value == "ARRIVE" or MilitaryTruck2StatusValue.Value == "ARRIVE" then
		MilitaryForceStatusValue.Value = "ARRIVE"
	elseif HMMWV1StatusValue.Value == "DEPART" or HMMWV2StatusValue.Value == "DEPART" or MilitaryTruck1StatusValue.Value == "DEPART" or MilitaryTruck2StatusValue.Value == "DEPART" then
		MilitaryForceStatusValue.Value = "DEPART"
	end
end
--

HMMWV1StatusValue.Changed:Connect(function()
	DoCheck()
end)
HMMWV2StatusValue.Changed:Connect(function()
	DoCheck()
end)
MilitaryTruck1StatusValue.Changed:Connect(function()
	DoCheck()
end)
MilitaryTruck2StatusValue.Changed:Connect(function()
	DoCheck()
end)

CheckpointSystemStatusValue.Changed:Connect(function()
	DoDoor()
end)
MilitaryForceControlValue.Changed:Connect(function()
	DoDoor()
end)
