local TweenService = game:GetService("TweenService")

local Elevator = script.Parent.Elevator.ElevatorMainFrame
local ElevatorPosF1 = script.Parent.Elevator.ElevatorMainFramePos1F
local ElevatorPosF2 = script.Parent.Elevator.ElevatorMainFramePos2F

local ElevatorAlarmSound = script.Parent.Elevator.ElevatorMainFrame.ElevatorAlarmSound
local ElevatorStartSound = script.Parent.Elevator.ElevatorMainFrame.ElevatorStartSound
local ElevatorMoveSound = script.Parent.Elevator.ElevatorMainFrame.ElevatorMoveSound
local ElevatorStopSound = script.Parent.Elevator.ElevatorMainFrame.ElevatorStopSound
local ElevatorDoorSound = script.Parent.Elevator.ElevatorDoor.Frame.ElevatorDoorSound

local ElevatorDoor = script.Parent.Elevator.ElevatorDoor.Frame
local ElevatorDoor1FOpenPos = script.Parent.Elevator.ElevatorDoor.DoorPos1FOpen
local ElevatorDoor1FClosePos = script.Parent.Elevator.ElevatorDoor.DoorPos1FClose
local ElevatorDoor2FOpenPos = script.Parent.Elevator.ElevatorDoor.DoorPos2FOpen
local ElevatorDoor2FClosePos = script.Parent.Elevator.ElevatorDoor.DoorPos2FClose

local UpFenceDoor = script.Parent.UpStation.Fence.Door.Frame
local UpFenceDoorPosUp = script.Parent.UpStation.Fence.Door.DoorPosUp
local UpFenceDoorPosDown = script.Parent.UpStation.Fence.Door.DoorPosDown

local DownFenceDoor = script.Parent.DownStation.Fence.Door.Frame
local DownFenceDoorPosUp = script.Parent.DownStation.Fence.Door.DoorPosUp
local DownFenceDoorPosDown = script.Parent.DownStation.Fence.Door.DoorPosDown

local UpLeftGateHinge = script.Parent.UpStation.Gates.LeftDoor.Hinge
local UpRightGateHinge = script.Parent.UpStation.Gates.RightDoor.Hinge

local DownLeftGateHinge = script.Parent.DownStation.Gates.LeftDoor.Hinge
local DownRightGateHinge = script.Parent.DownStation.Gates.RightDoor.Hinge

local UpCallButton = script.Parent.UpStation.Gates.Control.Button.Button
local DownCallButton = script.Parent.DownStation.Gates.Control.Button.Button

local Button1 = script.Parent.Elevator.Control.Button1.Button
local Button2 = script.Parent.Elevator.Control.Button2.Button
local OpenDoorButton = script.Parent.Elevator.Control.OpenDoorButton.Button

local ElevatorYellowLamp = script.Parent.Elevator.Control.YellowLamp
local ElevatorGreenLamp = script.Parent.Elevator.Control.GreenLamp
local UpStationYellowLamp = script.Parent.UpStation.Gates.Control.YellowLamp
local UpStationGreenLamp = script.Parent.UpStation.Gates.Control.GreenLamp
local DownStationYellowLamp = script.Parent.DownStation.Gates.Control.YellowLamp
local DownStationGreenLamp = script.Parent.DownStation.Gates.Control.GreenLamp

local WeldTrigger = script.Parent.Elevator.Cabin.WeldTrigger

local ElevatorUp = {
	CFrame = ElevatorPosF2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDown = {
	CFrame = ElevatorPosF1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorDoor1FOpen = {
	CFrame = ElevatorDoor1FOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor1FClose = {
	CFrame = ElevatorDoor1FClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2FOpen = {
	CFrame = ElevatorDoor2FOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2FClose = {
	CFrame = ElevatorDoor2FClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorDoorTF1 = {
	CFrame = ElevatorDoor1FClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoorTF2 = {
	CFrame = ElevatorDoor2FClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local UpFenceDoorOpen = {
	CFrame = UpFenceDoorPosUp.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local UpFenceDoorClose = {
	CFrame = UpFenceDoorPosDown.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local DownFenceDoorOpen = {
	CFrame = DownFenceDoorPosUp.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local DownFenceDoorClose = {
	CFrame = DownFenceDoorPosDown.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorFloor1 = true
local ElevatorFloor2 = false
local ElevatorDoorClosed = true
local LampBlinking = false

local DoorAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local ElevatorAnimationSettings = TweenInfo.new(
	15,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local GateAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local UpLeftGateOpen = TweenService:Create(UpLeftGateHinge, GateAnimationSettings, {
	CFrame = UpLeftGateHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})
local UpRightGateOpen = TweenService:Create(UpRightGateHinge, GateAnimationSettings, {
	CFrame = UpRightGateHinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
})
local UpLeftGateClose = TweenService:Create(UpLeftGateHinge, GateAnimationSettings, {
	CFrame = UpLeftGateHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local UpRightGateClose = TweenService:Create(UpRightGateHinge, GateAnimationSettings, {
	CFrame = UpRightGateHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local DownLeftGateOpen = TweenService:Create(DownLeftGateHinge, GateAnimationSettings, {
	CFrame = DownLeftGateHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})
local DownRightGateOpen = TweenService:Create(DownRightGateHinge, GateAnimationSettings, {
	CFrame = DownRightGateHinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
})
local DownLeftGateClose = TweenService:Create(DownLeftGateHinge, GateAnimationSettings, {
	CFrame = DownLeftGateHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local DownRightGateClose = TweenService:Create(DownRightGateHinge, GateAnimationSettings, {
	CFrame = DownRightGateHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local ElevatorUp = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorUp)
local ElevatorDown = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorDown)

local ElevatorDoor1FOpen = TweenService:Create(ElevatorDoor, DoorAnimationSettings, ElevatorDoor1FOpen)
local ElevatorDoor1FClose = TweenService:Create(ElevatorDoor, DoorAnimationSettings, ElevatorDoor1FClose)
local ElevatorDoor2FOpen = TweenService:Create(ElevatorDoor, DoorAnimationSettings, ElevatorDoor2FOpen)
local ElevatorDoor2FClose = TweenService:Create(ElevatorDoor, DoorAnimationSettings, ElevatorDoor2FClose)

local ElevatorDoorTF1 = TweenService:Create(ElevatorDoor, ElevatorAnimationSettings, ElevatorDoorTF1)
local ElevatorDoorTF2 = TweenService:Create(ElevatorDoor, ElevatorAnimationSettings, ElevatorDoorTF2)

local UpFenceDoorOpen = TweenService:Create(UpFenceDoor, DoorAnimationSettings, UpFenceDoorOpen)
local UpFenceDoorClose = TweenService:Create(UpFenceDoor, DoorAnimationSettings, UpFenceDoorClose)

local DownFenceDoorOpen = TweenService:Create(DownFenceDoor, DoorAnimationSettings, DownFenceDoorOpen)
local DownFenceDoorClose = TweenService:Create(DownFenceDoor, DoorAnimationSettings, DownFenceDoorClose)

OpenDoorButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true and ElevatorFloor1 == true then
		OpenDoorButton.ClickDetector.MaxActivationDistance = 0
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		UpCallButton.ClickDetector.MaxActivationDistance = 0
		DownCallButton.ClickDetector.MaxActivationDistance = 0
		ElevatorDoorClosed = false
		OpenDoorButton.Material = ("Neon")
		wait(0.5)
		DownFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor1FOpen:Play()
		DownLeftGateOpen:Play()
		DownRightGateOpen:Play()
		wait(4)
		OpenDoorButton.Material = ("Plastic")
		Button2.ClickDetector.MaxActivationDistance = 10
		UpCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor1 == true then
			Button2.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			DownLeftGateClose:Play()
			DownRightGateClose:Play()
			ElevatorDoor1FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			DownFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button2.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
		end
	else
		OpenDoorButton.ClickDetector.MaxActivationDistance = 0
		wait(1)
		OpenDoorButton.ClickDetector.MaxActivationDistance = 10
	end
end)

OpenDoorButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true and ElevatorFloor2 == true then
		OpenDoorButton.ClickDetector.MaxActivationDistance = 0
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		UpCallButton.ClickDetector.MaxActivationDistance = 0
		DownCallButton.ClickDetector.MaxActivationDistance = 0
		ElevatorDoorClosed = false
		OpenDoorButton.Material = ("Neon")
		wait(0.5)
		UpFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor2FOpen:Play()
		UpLeftGateOpen:Play()
		UpRightGateOpen:Play()
		wait(4)
		OpenDoorButton.Material = ("Plastic")
		Button1.ClickDetector.MaxActivationDistance = 10
		DownCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor2 == true then
			Button1.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			UpLeftGateClose:Play()
			UpRightGateClose:Play()
			ElevatorDoor2FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			UpFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button1.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	else
		OpenDoorButton.ClickDetector.MaxActivationDistance = 0
		wait(1)
		OpenDoorButton.ClickDetector.MaxActivationDistance = 10
	end	
end)

Button2.ClickDetector.MouseClick:Connect(function()
	Button2.ClickDetector.MaxActivationDistance = 0
	UpCallButton.ClickDetector.MaxActivationDistance = 0
	DownCallButton.ClickDetector.MaxActivationDistance = 0
	ElevatorFloor1 = false
	Button2.Material = ("Neon")
	if ElevatorDoorClosed == false then
		DownLeftGateClose:Play()
		DownRightGateClose:Play()
		ElevatorDoor1FClose:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorAlarmSound:Play()
		DownFenceDoorClose:Play()
		wait(2)
		ElevatorDoorClosed = true
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorUp:Play()
		ElevatorDoorTF2:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		Button2.Material = ("Plastic")
		ElevatorFloor2 = true
		wait(1)
		ElevatorDoorClosed = false
		UpFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor2FOpen:Play()
		UpLeftGateOpen:Play()
		UpRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button1.ClickDetector.MaxActivationDistance = 10
		DownCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor2 == true then
			Button1.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			UpLeftGateClose:Play()
			UpRightGateClose:Play()
			ElevatorDoor2FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			UpFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button1.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

Button2.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true then
		wait(1)
		ElevatorAlarmSound:Play()
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorUp:Play()
		ElevatorDoorTF2:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		Button2.Material = ("Plastic")
		ElevatorFloor2 = true
		wait(1)
		ElevatorDoorClosed = false
		UpFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor2FOpen:Play()
		UpLeftGateOpen:Play()
		UpRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button1.ClickDetector.MaxActivationDistance = 10
		DownCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor2 == true then
			Button1.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			UpLeftGateClose:Play()
			UpRightGateClose:Play()
			ElevatorDoor2FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			UpFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button1.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end	
end)

Button1.ClickDetector.MouseClick:Connect(function()
	Button1.ClickDetector.MaxActivationDistance = 0
	UpCallButton.ClickDetector.MaxActivationDistance = 0
	DownCallButton.ClickDetector.MaxActivationDistance = 0
	ElevatorFloor2 = false
	Button1.Material = ("Neon")
	if ElevatorDoorClosed == false then
		UpLeftGateClose:Play()
		UpRightGateClose:Play()
		ElevatorDoor2FClose:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorAlarmSound:Play()
		UpFenceDoorClose:Play()
		wait(2)
		ElevatorDoorClosed = true
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorDown:Play()
		ElevatorDoorTF1:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		Button1.Material = ("Plastic")
		ElevatorFloor1 = true
		wait(1)
		ElevatorDoorClosed = false
		DownFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor1FOpen:Play()
		DownLeftGateOpen:Play()
		DownRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button2.ClickDetector.MaxActivationDistance = 10
		UpCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor1 == true then
			Button2.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			DownLeftGateClose:Play()
			DownRightGateClose:Play()
			ElevatorDoor1FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			DownFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button2.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

Button1.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true then
		wait(1)
		ElevatorAlarmSound:Play()
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorDown:Play()
		ElevatorDoorTF1:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		Button1.Material = ("Plastic")
		ElevatorFloor1 = true
		wait(1)
		ElevatorDoorClosed = false
		DownFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor1FOpen:Play()
		DownLeftGateOpen:Play()
		DownRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button2.ClickDetector.MaxActivationDistance = 10
		UpCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor1 == true then
			Button2.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			DownLeftGateClose:Play()
			DownRightGateClose:Play()
			ElevatorDoor1FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			DownFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button2.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end	
end)

UpCallButton.ClickDetector.MouseClick:Connect(function()
	Button2.ClickDetector.MaxActivationDistance = 0
	UpCallButton.ClickDetector.MaxActivationDistance = 0
	DownCallButton.ClickDetector.MaxActivationDistance = 0
	UpCallButton.Material = ("Neon")
	if ElevatorDoorClosed == false and ElevatorFloor1 == true then
		ElevatorFloor1 = false
		DownLeftGateClose:Play()
		DownRightGateClose:Play()
		ElevatorDoor1FClose:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		DownFenceDoorClose:Play()
		wait(2)
		ElevatorDoorClosed = true
		ElevatorAlarmSound:Play()
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorUp:Play()
		ElevatorDoorTF2:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		UpCallButton.Material = ("Plastic")
		ElevatorFloor2 = true
		wait(1)
		ElevatorDoorClosed = false
		UpFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor2FOpen:Play()
		UpLeftGateOpen:Play()
		UpRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button1.ClickDetector.MaxActivationDistance = 10
		DownCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor2 == true then
			Button1.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			UpLeftGateClose:Play()
			UpRightGateClose:Play()
			ElevatorDoor2FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			UpFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button1.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

UpCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true and ElevatorFloor1 == true then
		ElevatorFloor1 = false
		wait(1)
		ElevatorAlarmSound:Play()
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorUp:Play()
		ElevatorDoorTF2:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		UpCallButton.Material = ("Plastic")
		ElevatorFloor2 = true
		wait(1)
		ElevatorDoorClosed = false
		UpFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor2FOpen:Play()
		UpLeftGateOpen:Play()
		UpRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button1.ClickDetector.MaxActivationDistance = 10
		DownCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor2 == true then
			Button1.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			UpLeftGateClose:Play()
			UpRightGateClose:Play()
			ElevatorDoor2FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			UpFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button1.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end	
end)

UpCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true and ElevatorFloor2 == true then
		OpenDoorButton.ClickDetector.MaxActivationDistance = 0
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		UpCallButton.ClickDetector.MaxActivationDistance = 0
		DownCallButton.ClickDetector.MaxActivationDistance = 0
		UpCallButton.Material = ("Neon")
		wait(0.5)
		ElevatorDoorClosed = false
		UpFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor2FOpen:Play()
		UpLeftGateOpen:Play()
		UpRightGateOpen:Play()
		wait(4)
		UpCallButton.Material = ("Plastic")
		Button1.ClickDetector.MaxActivationDistance = 10
		DownCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor2 == true then
			Button1.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			UpLeftGateClose:Play()
			UpRightGateClose:Play()
			ElevatorDoor2FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			UpFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button1.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

DownCallButton.ClickDetector.MouseClick:Connect(function()
	Button1.ClickDetector.MaxActivationDistance = 0
	UpCallButton.ClickDetector.MaxActivationDistance = 0
	DownCallButton.ClickDetector.MaxActivationDistance = 0
	DownCallButton.Material = ("Neon")
	if ElevatorDoorClosed == false and ElevatorFloor2 == true then
		ElevatorFloor2 = false
		UpLeftGateClose:Play()
		UpRightGateClose:Play()
		ElevatorDoor2FClose:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorAlarmSound:Play()
		UpFenceDoorClose:Play()
		wait(2)
		ElevatorDoorClosed = true
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorDown:Play()
		ElevatorDoorTF1:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		DownCallButton.Material = ("Plastic")
		ElevatorFloor1 = true
		wait(1)
		ElevatorDoorClosed = false
		DownFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor1FOpen:Play()
		DownLeftGateOpen:Play()
		DownRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button2.ClickDetector.MaxActivationDistance = 10
		UpCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor1 == true then
			Button2.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			DownLeftGateClose:Play()
			DownRightGateClose:Play()
			ElevatorDoor1FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			DownFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button2.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

DownCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true and ElevatorFloor2 == true then
		ElevatorFloor2 = false
		wait(1)
		ElevatorAlarmSound:Play()
		wait(3)
		ElevatorStartSound:Play()
		ElevatorMoveSound:Play()
		ElevatorDown:Play()
		ElevatorDoorTF1:Play()
		wait(13)
		ElevatorAlarmSound:Play()
		wait(2)
		ElevatorMoveSound:Stop()
		ElevatorStopSound:Play()
		DownCallButton.Material = ("Plastic")
		ElevatorFloor1 = true
		wait(1)
		ElevatorDoorClosed = false
		DownFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor1FOpen:Play()
		DownLeftGateOpen:Play()
		DownRightGateOpen:Play()
		LampBlinking = false
		ElevatorGreenLamp.Material = ("Neon")
		UpStationGreenLamp.Material = ("Neon")
		DownStationGreenLamp.Material = ("Neon")
		wait(4)
		Button2.ClickDetector.MaxActivationDistance = 10
		UpCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor1 == true then
			Button2.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			DownLeftGateClose:Play()
			DownRightGateClose:Play()
			ElevatorDoor1FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			DownFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button2.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

DownCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorDoorClosed == true and ElevatorFloor1 == true then
		OpenDoorButton.ClickDetector.MaxActivationDistance = 0
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		UpCallButton.ClickDetector.MaxActivationDistance = 0
		DownCallButton.ClickDetector.MaxActivationDistance = 0
		DownCallButton.Material = ("Neon")
		wait(0.5)
		ElevatorDoorClosed = false
		DownFenceDoorOpen:Play()
		ElevatorDoorSound:Play()
		wait(0.5)
		ElevatorDoor1FOpen:Play()
		DownLeftGateOpen:Play()
		DownRightGateOpen:Play()
		wait(4)
		DownCallButton.Material = ("Plastic")
		Button2.ClickDetector.MaxActivationDistance = 10
		UpCallButton.ClickDetector.MaxActivationDistance = 10
		wait(6)
		if ElevatorFloor1 == true then
			Button2.ClickDetector.MaxActivationDistance = 0
			UpCallButton.ClickDetector.MaxActivationDistance = 0
			DownCallButton.ClickDetector.MaxActivationDistance = 0
			DownLeftGateClose:Play()
			DownRightGateClose:Play()
			ElevatorDoor1FClose:Play()
			ElevatorDoorSound:Play()
			wait(0.5)
			DownFenceDoorClose:Play()
			wait(5)
			ElevatorDoorClosed = true
			OpenDoorButton.ClickDetector.MaxActivationDistance = 10
			Button2.ClickDetector.MaxActivationDistance = 10
			UpCallButton.ClickDetector.MaxActivationDistance = 10
			DownCallButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

Button1.ClickDetector.MouseClick:Connect(function()
	LampBlinking = true
	wait(0.1)
	ElevatorGreenLamp.Material = ("Glass")
	UpStationGreenLamp.Material = ("Glass")
	DownStationGreenLamp.Material = ("Glass")
	repeat
		ElevatorYellowLamp.Material = ("Neon")
		UpStationYellowLamp.Material = ("Neon")
		DownStationYellowLamp.Material = ("Neon")
		wait(0.5)
		ElevatorYellowLamp.Material = ("Glass")
		UpStationYellowLamp.Material = ("Glass")
		DownStationYellowLamp.Material = ("Glass")
		wait(0.5)
	until
	LampBlinking == false
end)

Button1.ClickDetector.MouseClick:Connect(function()
	wait(2)
	WeldTrigger.CanTouch = true
	wait(2)
	WeldTrigger.CanTouch = false
end)

Button2.ClickDetector.MouseClick:Connect(function()
	LampBlinking = true
	wait(0.1)
	ElevatorGreenLamp.Material = ("Glass")
	UpStationGreenLamp.Material = ("Glass")
	DownStationGreenLamp.Material = ("Glass")
	repeat
		ElevatorYellowLamp.Material = ("Neon")
		UpStationYellowLamp.Material = ("Neon")
		DownStationYellowLamp.Material = ("Neon")
		wait(0.5)
		ElevatorYellowLamp.Material = ("Glass")
		UpStationYellowLamp.Material = ("Glass")
		DownStationYellowLamp.Material = ("Glass")
		wait(0.5)
	until
	LampBlinking == false
end)

Button2.ClickDetector.MouseClick:Connect(function()
	wait(2)
	WeldTrigger.CanTouch = true
	wait(2)
	WeldTrigger.CanTouch = false
end)

UpCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorFloor2 == false then
		LampBlinking = true
		wait(0.1)
		ElevatorGreenLamp.Material = ("Glass")
		UpStationGreenLamp.Material = ("Glass")
		DownStationGreenLamp.Material = ("Glass")
		repeat
			ElevatorYellowLamp.Material = ("Neon")
			UpStationYellowLamp.Material = ("Neon")
			DownStationYellowLamp.Material = ("Neon")
			wait(0.5)
			ElevatorYellowLamp.Material = ("Glass")
			UpStationYellowLamp.Material = ("Glass")
			DownStationYellowLamp.Material = ("Glass")
			wait(0.5)
		until
		LampBlinking == false
	end
end)

UpCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorFloor2 == false then
		wait(2)
		WeldTrigger.CanTouch = true
		wait(2)
		WeldTrigger.CanTouch = false
	end
end)

DownCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorFloor1 == false then
		LampBlinking = true
		wait(0.1)
		ElevatorGreenLamp.Material = ("Glass")
		UpStationGreenLamp.Material = ("Glass")
		DownStationGreenLamp.Material = ("Glass")
		repeat
			ElevatorYellowLamp.Material = ("Neon")
			UpStationYellowLamp.Material = ("Neon")
			DownStationYellowLamp.Material = ("Neon")
			wait(0.5)
			ElevatorYellowLamp.Material = ("Glass")
			UpStationYellowLamp.Material = ("Glass")
			DownStationYellowLamp.Material = ("Glass")
			wait(0.5)
		until
		LampBlinking == false
	end
end)

DownCallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorFloor1 == false then
		wait(2)
		WeldTrigger.CanTouch = true
		wait(2)
		WeldTrigger.CanTouch = false
	end
end)
