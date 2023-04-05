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
local ElevatorFloorIndicator = Elevator.FloorIndicator.SurfaceGui.TextLabel
local WeldTrigger = Elevator.WeldTrigger
--

-- Sounds
local ElevatorBeepSound = script.Parent.Parent.Parent.Elevator.SoundEmitter.ElevatorBeepSound
local ElevatorDoorSound = script.Parent.Parent.Parent.Elevator.SoundEmitter.ElevatorDoorSound
--

-- Logic
local FloorPassTime = 5
local CurrentPath = script.Parent.Parent.Parent["Portal_"..ElevatorCurrentFloorValue.Value]
local TargetPath = script.Parent.Parent.Parent["Portal_"..ElevatorTargetFloorValue.Value]
--

local DoorAnimationSettings = TweenInfo.new(
	2.6,
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
		TweenService:Create(Elevator.LeftDoor.Door, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.ElevatorLeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Elevator.RightDoor.Door, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.ElevatorRightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(0.1)
		TweenService:Create(Path.LeftDoor.Door, DoorAnimationSettings, { CFrame = Path.LeftDoor.DoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Path.RightDoor.Door, DoorAnimationSettings, { CFrame = Path.RightDoor.DoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(2.6)
		ElevatorStatusValue.Value = "OPENED"
	elseif Mode == "CLOSE" then
		ElevatorStatusValue.Value = "CLOSE"
		ElevatorDoorSound:Play()
		TweenService:Create(Path.LeftDoor.Door, DoorAnimationSettings, { CFrame = Path.LeftDoor.DoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Path.RightDoor.Door, DoorAnimationSettings, { CFrame = Path.RightDoor.DoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(0.1)
		TweenService:Create(Elevator.LeftDoor.Door, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.ElevatorLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Elevator.RightDoor.Door, DoorAnimationSettings, { CFrame = Path.ElevatorPositions.ElevatorRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(2.6)
		ElevatorStatusValue.Value = "CLOSED"
	end
end
--

ElevatorTargetFloorValue.Changed:Connect(function()
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
	TweenService:Create(Elevator.Frame, ElevatorAnimationSettings, { CFrame = TargetPath.ElevatorPositions.ElevatorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Elevator.LeftDoor.Door, ElevatorAnimationSettings, { CFrame = TargetPath.ElevatorPositions.ElevatorLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Elevator.RightDoor.Door, ElevatorAnimationSettings, { CFrame = TargetPath.ElevatorPositions.ElevatorRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	wait(PassTime)
	WeldTrigger.CanTouch = false
	ElevatorCurrentFloorValue.Value = ElevatorTargetFloorValue.Value
	CurrentPath = script.Parent.Parent.Parent["Portal_"..ElevatorCurrentFloorValue.Value]
	ElevatorBeepSound:Play()
	ElevatorFloorIndicator.Text = ElevatorCurrentFloorValue.Value
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
