-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local ElevatorCurrentFloorValue = script.Parent.Parent.Values.ElevatorCurrentFloorValue
local ElevatorTargetFloorValue = script.Parent.Parent.Values.ElevatorTargetFloorValue
local ElevatorStatusValue = script.Parent.Parent.Values.ElevatorStatusValue
local ElevatorDoorControlValue = script.Parent.Parent.Values.ElevatorDoorControlValue
--

-- Items
local Elevator = script.Parent.Parent.Parent.Elevator
local WeldTrigger = script.Parent.Parent.Parent.Elevator.Cabin.WeldTrigger
--

-- Sounds
local ElevatorAlarmSound = script.Parent.Parent.Parent.Elevator.ElevatorMainFrame.ElevatorAlarmSound
local ElevatorStartSound = script.Parent.Parent.Parent.Elevator.ElevatorMainFrame.ElevatorStartSound
local ElevatorMoveSound = script.Parent.Parent.Parent.Elevator.ElevatorMainFrame.ElevatorMoveSound
local ElevatorStopSound = script.Parent.Parent.Parent.Elevator.ElevatorMainFrame.ElevatorStopSound
local ElevatorDoorSound = script.Parent.Parent.Parent.Elevator.ElevatorDoor.Frame.ElevatorDoorSound
--

-- Logic
local FloorPassTime = 10
local CurrentPath = script.Parent.Parent.Parent["Portal_"..ElevatorCurrentFloorValue.Value]
local TargetPath = script.Parent.Parent.Parent["Portal_"..ElevatorTargetFloorValue.Value]
--

local DoorAnimationSettings = TweenInfo.new(
	2,
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

-- Functions
function DoDoors(Mode, Path)
	if Mode == "OPEN" then
		ElevatorStatusValue.Value = "OPEN"
		ElevatorDoorSound:Play()
		TweenService:Create(Elevator.ElevatorDoor.Frame, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.ElevatorDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(0.1)
		TweenService:Create(Path.Fence.Door.Frame, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.DoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Path.Gates.LeftDoor.Hinge, DoorAnimationSettings, { CFrame = Path.Gates.LeftDoor.Hinge.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
		TweenService:Create(Path.Gates.RightDoor.Hinge, DoorAnimationSettings, { CFrame = Path.Gates.RightDoor.Hinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
		wait(2)
		ElevatorStatusValue.Value = "OPENED"
	elseif Mode == "CLOSE" then
		ElevatorStatusValue.Value = "CLOSE"
		ElevatorDoorSound:Play()
		TweenService:Create(Elevator.ElevatorDoor.Frame, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.ElevatorDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(0.1)
		TweenService:Create(Path.Fence.Door.Frame, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.DoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Path.Gates.LeftDoor.Hinge, DoorAnimationSettings, { CFrame = Path.Gates.LeftDoor.Hinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
		TweenService:Create(Path.Gates.RightDoor.Hinge, DoorAnimationSettings, { CFrame = Path.Gates.RightDoor.Hinge.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
		wait(2)
		ElevatorStatusValue.Value = "CLOSED"
	end
end
--

ElevatorTargetFloorValue.Changed:Connect(function()
	ElevatorAlarmSound:Play()
	wait(2)
	local PassTime = math.abs((ElevatorTargetFloorValue.Value - ElevatorCurrentFloorValue.Value) * FloorPassTime)
	CurrentPath = script.Parent.Parent.Parent["Portal_"..ElevatorCurrentFloorValue.Value]
	TargetPath = script.Parent.Parent.Parent["Portal_"..ElevatorTargetFloorValue.Value]
	local ElevatorAnimationSettings = TweenInfo.new(
		PassTime,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.InOut,
		0,
		false,
		0
	)
	if ElevatorStatusValue.Value == "OPENED" then
		DoDoors("CLOSE", CurrentPath)
	end
	ElevatorStatusValue.Value = "MOVING"
	WeldTrigger.CanTouch = true
	TweenService:Create(Elevator.ElevatorMainFrame, ElevatorAnimationSettings, { CFrame = TargetPath.ElevatorPositions.ElevatorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Elevator.ElevatorDoor.Frame, ElevatorAnimationSettings, { CFrame = TargetPath.ElevatorPositions.ElevatorDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	ElevatorStartSound:Play()
	ElevatorMoveSound:Play()
	wait(PassTime)
	ElevatorMoveSound:Stop()
	ElevatorStopSound:Play()
	WeldTrigger.CanTouch = false
	ElevatorCurrentFloorValue.Value = ElevatorTargetFloorValue.Value
	CurrentPath = script.Parent.Parent.Parent["Portal_"..ElevatorCurrentFloorValue.Value]
	ElevatorStatusValue.Value = "ARRIVED"
	wait(1)
	DoDoors("OPEN", CurrentPath)
	if ElevatorStatusValue.Value == "OPENED" then wait(10) end
	if ElevatorStatusValue.Value == "OPENED" then DoDoors("CLOSE", CurrentPath) end
end)

ElevatorDoorControlValue.Changed:Connect(function()
	if ElevatorDoorControlValue.Value == "OPEN" then
		ElevatorDoorControlValue.Value = ""
		DoDoors("OPEN", CurrentPath)
		if ElevatorStatusValue.Value == "OPENED" then wait(10) end
		if ElevatorStatusValue.Value == "OPENED" then DoDoors("CLOSE", CurrentPath) end
	elseif ElevatorDoorControlValue.Value == "CLOSE" then
		ElevatorDoorControlValue.Value = ""
		DoDoors("CLOSE", CurrentPath)
	end
end)

ElevatorStatusValue.Changed:Connect(function()
	if ElevatorStatusValue.Value == "MOVING" then
		Elevator.Control.GreenLamp.Material = ("Plastic")
		Elevator.Control.GreenLamp.BrickColor = BrickColor.new("Forest green")
		repeat
			Elevator.Control.YellowLamp.Material = ("Neon")
			Elevator.Control.YellowLamp.BrickColor = BrickColor.new("Neon orange")
			wait(0.5)
			Elevator.Control.YellowLamp.Material = ("Plastic")
			Elevator.Control.YellowLamp.BrickColor = BrickColor.new("CGA brown")
			wait(0.5)
		until ElevatorStatusValue.Value == "ARRIVED"
		Elevator.Control.GreenLamp.Material = ("Neon")
		Elevator.Control.GreenLamp.BrickColor = BrickColor.new("Lime green")
	end
end)
