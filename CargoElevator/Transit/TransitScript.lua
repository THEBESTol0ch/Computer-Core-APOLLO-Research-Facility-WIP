-- Control
local TweenService = game:GetService("TweenService")
local Transit = script.Parent.Parent.Parent
--

-- Values
local TransitCurrentStationValue = Transit.CPU.Values.TransitCurrentStationValue
local TransitTargetStationValue = Transit.CPU.Values.TransitTargetStationValue
local TransitStatusValue = Transit.CPU.Values.TransitStatusValue
--

-- Items
local WeldTrigger = Transit.Interior.WeldTrigger
--

-- Sounds
local ElevatorStartSound = Transit.SoundEmitter.ElevatorStartSound
local ElevatorMoveSound = Transit.SoundEmitter.ElevatorMoveSound
local ElevatorStopSound = Transit.SoundEmitter.ElevatorStopSound
--

-- Logic
local FloorPassTime = 10
local CurrentPath = script.Parent.Parent.Parent.Parent["Station_"..TransitCurrentStationValue.Value]
local TargetPath = script.Parent.Parent.Parent.Parent["Station_"..TransitTargetStationValue.Value]
local TransitSide = Transit.Name:split("_")[1]
--

local DoorsAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

-- Functions
function DoDoors(Mode, Path)
	if Mode == "OPEN" then
		TransitStatusValue.Value = "OPEN"
		local DoorsSide = ""
		if not (TransitCurrentStationValue.Value == 4) then DoorsSide = "BACK" else DoorsSide = "FRONT" end
		local Door = Transit.Interior[DoorsSide.."_Door"]
		Door.SoundEmitter.TransitDoorOpenSound:Play()
		TweenService:Create(Door.LeftDoor, DoorsAnimationSettings, { CFrame = Path.Positions[TransitSide.."_TransitPositions"][DoorsSide.."_DoorPositions"].LeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Door.RightDoor, DoorsAnimationSettings, { CFrame = Path.Positions[TransitSide.."_TransitPositions"][DoorsSide.."_DoorPositions"].RightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(2)
		TransitStatusValue.Value = "OPENED"
	elseif Mode == "CLOSE" then
		TransitStatusValue.Value = "CLOSE"
		local DoorsSide = ""
		if not (TransitCurrentStationValue.Value == 4) then DoorsSide = "BACK" else DoorsSide = "FRONT" end
		local Door = Transit.Interior[DoorsSide.."_Door"]
		Door.SoundEmitter.TransitDoorCloseSound:Play()
		TweenService:Create(Door.LeftDoor, DoorsAnimationSettings, { CFrame = Path.Positions[TransitSide.."_TransitPositions"][DoorsSide.."_DoorPositions"].LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Door.RightDoor, DoorsAnimationSettings, { CFrame = Path.Positions[TransitSide.."_TransitPositions"][DoorsSide.."_DoorPositions"].RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(2)
		TransitStatusValue.Value = "CLOSED"
	end
end
--

TransitTargetStationValue.Changed:Connect(function()
	local PassTime = math.abs((TransitTargetStationValue.Value - TransitCurrentStationValue.Value) * FloorPassTime)
	CurrentPath = script.Parent.Parent.Parent.Parent["Station_"..TransitCurrentStationValue.Value]
	TargetPath = script.Parent.Parent.Parent.Parent["Station_"..TransitTargetStationValue.Value]
	local TransitAnimationSettings = TweenInfo.new(
		PassTime,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.InOut,
		0,
		false,
		0
	)
	DoDoors("CLOSE", CurrentPath)
	wait(3)
	TransitStatusValue.Value = "MOVING"
	WeldTrigger.CanTouch = true
	TweenService:Create(Transit.TransitPrimaryPart, TransitAnimationSettings, { CFrame = TargetPath.Positions[TransitSide.."_TransitPositions"].TransitPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Transit.Interior.BACK_Door.LeftDoor, TransitAnimationSettings, { CFrame = TargetPath.Positions[TransitSide.."_TransitPositions"].BACK_DoorPositions.LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Transit.Interior.BACK_Door.RightDoor, TransitAnimationSettings, { CFrame = TargetPath.Positions[TransitSide.."_TransitPositions"].BACK_DoorPositions.RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Transit.Interior.FRONT_Door.LeftDoor, TransitAnimationSettings, { CFrame = TargetPath.Positions[TransitSide.."_TransitPositions"].FRONT_DoorPositions.LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Transit.Interior.FRONT_Door.RightDoor, TransitAnimationSettings, { CFrame = TargetPath.Positions[TransitSide.."_TransitPositions"].FRONT_DoorPositions.RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	ElevatorStartSound:Play()
	ElevatorMoveSound:Play()
	wait(1)
	WeldTrigger.CanTouch = false
	wait(PassTime - 1)
	ElevatorMoveSound:Stop()
	ElevatorStopSound:Play()
	TransitCurrentStationValue.Value = TransitTargetStationValue.Value
	CurrentPath = script.Parent.Parent.Parent.Parent["Station_"..TransitCurrentStationValue.Value]
	TransitStatusValue.Value = "ARRIVED"
	wait(1)
	DoDoors("OPEN", CurrentPath)
end)
