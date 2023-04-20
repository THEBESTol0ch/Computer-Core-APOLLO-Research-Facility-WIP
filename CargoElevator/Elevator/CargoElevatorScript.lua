-- Control
local TweenService = game:GetService("TweenService")
local Elevator = script.Parent.Parent.Parent
--

-- Values
local ElevatorCurrentStationValue = Elevator.CPU.Values.ElevatorCurrentStationValue
local ElevatorTargetStationValue = Elevator.CPU.Values.ElevatorTargetStationValue
local ElevatorStatusValue = Elevator.CPU.Values.ElevatorStatusValue
--

-- Items
local ElevatorPrimaryPart = Elevator.ElevatorPrimaryPart
local LeftGateHinge = Elevator.LiftGates.LEFT_LiftGate.Gate.Hinge
local RightGateHinge = Elevator.LiftGates.RIGHT_LiftGate.Gate.Hinge
local FrontGateHinge = Elevator.LiftGates.FRONT_LiftGate.Gate.Hinge
local BackGateHinge = Elevator.LiftGates.BACK_LiftGate.Gate.Hinge
local WeldTrigger = Elevator.WeldTrigger
--

-- Sounds
local ElevatorStartSound = Elevator.ElevatorPrimaryPart.ElevatorStartSound
local ElevatorMoveSound = Elevator.ElevatorPrimaryPart.ElevatorMoveSound
local ElevatorStopSound = Elevator.ElevatorPrimaryPart.ElevatorStopSound
--

-- Logic
local FloorPassTime = 20
local CurrentPath = script.Parent.Parent.Parent.Parent["Station_"..ElevatorCurrentStationValue.Value]
local TargetPath = script.Parent.Parent.Parent.Parent["Station_"..ElevatorTargetStationValue.Value]
--

local LiftGateAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

-- Functions
function DoDoors(Mode, Path)
	if Mode == "OPEN" then
		ElevatorStatusValue.Value = "OPEN"
		if ElevatorCurrentStationValue.Value == 1 then
			TweenService:Create(BackGateHinge, LiftGateAnimationSettings, { CFrame = BackGateHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
			local StationGate = Path.LiftGates.ElevatorLiftGate.Gate.Hinge
			TweenService:Create(StationGate, LiftGateAnimationSettings, { CFrame = StationGate.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
		elseif ElevatorCurrentStationValue.Value == 2 or ElevatorCurrentStationValue.Value == 3 then
			TweenService:Create(LeftGateHinge, LiftGateAnimationSettings, { CFrame = LeftGateHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
			TweenService:Create(RightGateHinge, LiftGateAnimationSettings, { CFrame = RightGateHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
		elseif ElevatorCurrentStationValue.Value == 4 then
			TweenService:Create(FrontGateHinge, LiftGateAnimationSettings, { CFrame = FrontGateHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
			local StationGate = Path.LiftGates.ElevatorLiftGate.Gate.Hinge
			TweenService:Create(StationGate, LiftGateAnimationSettings, { CFrame = StationGate.CFrame * CFrame.Angles(math.rad(90), 0, 0) }):Play()
		end
		wait(2)
		ElevatorStatusValue.Value = "OPENED"
	elseif Mode == "CLOSE" then
		ElevatorStatusValue.Value = "CLOSE"
		if ElevatorCurrentStationValue.Value == 1 then
			TweenService:Create(BackGateHinge, LiftGateAnimationSettings, { CFrame = BackGateHinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
			local StationGate = Path.LiftGates.ElevatorLiftGate.Gate.Hinge
			TweenService:Create(StationGate, LiftGateAnimationSettings, { CFrame = StationGate.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
		elseif ElevatorCurrentStationValue.Value == 2 or ElevatorCurrentStationValue.Value == 3 then
			TweenService:Create(LeftGateHinge, LiftGateAnimationSettings, { CFrame = LeftGateHinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
			TweenService:Create(RightGateHinge, LiftGateAnimationSettings, { CFrame = RightGateHinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
		elseif ElevatorCurrentStationValue.Value == 4 then
			TweenService:Create(FrontGateHinge, LiftGateAnimationSettings, { CFrame = FrontGateHinge.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
			local StationGate = Path.LiftGates.ElevatorLiftGate.Gate.Hinge
			TweenService:Create(StationGate, LiftGateAnimationSettings, { CFrame = StationGate.CFrame * CFrame.Angles(math.rad(-90), 0, 0) }):Play()
		end
		wait(2)
		ElevatorStatusValue.Value = "CLOSED"
	end
end

function DoEmergencyLamp(Mode, Group)
	if Mode == "ON" then
		for _, EmergencyLamp in pairs(Group:GetChildren()) do
			EmergencyLamp.Lamp.SpotLight.Enabled = true
			EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 5
		end
	elseif Mode == "OFF" then
		for _, EmergencyLamp in pairs(Group:GetChildren()) do
			EmergencyLamp.Lamp.SpotLight.Enabled = false
			EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 0
		end
	end
end

function DoAllEmergencyLamps(Mode)
	DoEmergencyLamp(Mode, Elevator.EmergencyLamps)
	for _, Object in pairs(Elevator.Parent:GetChildren()) do
		if Object.Name:split("_")[1] == "Station" then
			DoEmergencyLamp(Mode, Object.EmergencyLamps)
		end
	end
end

function DoControlLamps(Status)
	if Status == "WAITING" then
		Elevator.Console.Control.WaitingStatusLamp.Lamp.BrickColor = BrickColor.new("Neon orange")
		Elevator.Console.Control.WaitingStatusLamp.Lamp.Material = "Neon"
		Elevator.Console.Control.StoppedStatusLamp.Lamp.BrickColor = BrickColor.new("Crimson")
		Elevator.Console.Control.StoppedStatusLamp.Lamp.Material = "Plastic"
		Elevator.Console.Control.MovingStatusLamp.Lamp.BrickColor = BrickColor.new("Forest green")
		Elevator.Console.Control.MovingStatusLamp.Lamp.Material = "Plastic"
		for _, Object in pairs(Elevator.Parent:GetChildren()) do
			if Object.Name:split("_")[1] == "Station" then
				Object.Console.Control.WaitingStatusLamp.Lamp.BrickColor = BrickColor.new("Neon orange")
				Object.Console.Control.WaitingStatusLamp.Lamp.Material = "Neon"
				Object.Console.Control.StoppedStatusLamp.Lamp.BrickColor = BrickColor.new("Crimson")
				Object.Console.Control.StoppedStatusLamp.Lamp.Material = "Plastic"
				Object.Console.Control.MovingStatusLamp.Lamp.BrickColor = BrickColor.new("Forest green")
				Object.Console.Control.MovingStatusLamp.Lamp.Material = "Plastic"
			end
		end 
	elseif Status == "STOPPED" then
		Elevator.Console.Control.WaitingStatusLamp.Lamp.BrickColor = BrickColor.new("CGA brown")
		Elevator.Console.Control.WaitingStatusLamp.Lamp.Material = "Plastic"
		Elevator.Console.Control.StoppedStatusLamp.Lamp.BrickColor = BrickColor.new("Really red")
		Elevator.Console.Control.StoppedStatusLamp.Lamp.Material = "Neon"
		Elevator.Console.Control.MovingStatusLamp.Lamp.BrickColor = BrickColor.new("Forest green")
		Elevator.Console.Control.MovingStatusLamp.Lamp.Material = "Plastic"
		for _, Object in pairs(Elevator.Parent:GetChildren()) do
			if Object.Name:split("_")[1] == "Station" then
				Object.Console.Control.WaitingStatusLamp.Lamp.BrickColor = BrickColor.new("CGA brown")
				Object.Console.Control.WaitingStatusLamp.Lamp.Material = "Plastic"
				Object.Console.Control.StoppedStatusLamp.Lamp.BrickColor = BrickColor.new("Really red")
				Object.Console.Control.StoppedStatusLamp.Lamp.Material = "Neon"
				Object.Console.Control.MovingStatusLamp.Lamp.BrickColor = BrickColor.new("Forest green")
				Object.Console.Control.MovingStatusLamp.Lamp.Material = "Plastic"
			end
		end 
	elseif Status == "MOVING" then
		Elevator.Console.Control.WaitingStatusLamp.Lamp.BrickColor = BrickColor.new("CGA brown")
		Elevator.Console.Control.WaitingStatusLamp.Lamp.Material = "Plastic"
		Elevator.Console.Control.StoppedStatusLamp.Lamp.BrickColor = BrickColor.new("Crimson")
		Elevator.Console.Control.StoppedStatusLamp.Lamp.Material = "Plastic"
		Elevator.Console.Control.MovingStatusLamp.Lamp.BrickColor = BrickColor.new("Lime green")
		Elevator.Console.Control.MovingStatusLamp.Lamp.Material = "Neon"
		for _, Object in pairs(Elevator.Parent:GetChildren()) do
			if Object.Name:split("_")[1] == "Station" then
				Object.Console.Control.WaitingStatusLamp.Lamp.BrickColor = BrickColor.new("CGA brown")
				Object.Console.Control.WaitingStatusLamp.Lamp.Material = "Plastic"
				Object.Console.Control.StoppedStatusLamp.Lamp.BrickColor = BrickColor.new("Crimson")
				Object.Console.Control.StoppedStatusLamp.Lamp.Material = "Plastic"
				Object.Console.Control.MovingStatusLamp.Lamp.BrickColor = BrickColor.new("Lime green")
				Object.Console.Control.MovingStatusLamp.Lamp.Material = "Neon"
			end
		end 
	end
end
--

ElevatorTargetStationValue.Changed:Connect(function()
	local PassTime = math.abs((ElevatorTargetStationValue.Value - ElevatorCurrentStationValue.Value) * FloorPassTime)
	CurrentPath = script.Parent.Parent.Parent.Parent["Station_"..ElevatorCurrentStationValue.Value]
	TargetPath = script.Parent.Parent.Parent.Parent["Station_"..ElevatorTargetStationValue.Value]
	local ElevatorAnimationSettings = TweenInfo.new(
		PassTime,
		Enum.EasingStyle.Sine,
		Enum.EasingDirection.InOut,
		0,
		false,
		0
	)
	CurrentPath.Speaker.SoundEmitter.Alarm1:Play()
	DoControlLamps("WAITING")
	DoAllEmergencyLamps("ON")
	DoDoors("CLOSE", CurrentPath)
	wait(5)
	CurrentPath.Speaker.SoundEmitter.Alarm2:Play()
	wait(2)
	ElevatorStatusValue.Value = "MOVING"
	DoControlLamps("MOVING")
	WeldTrigger.CanTouch = true
	TweenService:Create(ElevatorPrimaryPart, ElevatorAnimationSettings, { CFrame = TargetPath.Positions.ElevatorPositions.ElevatorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(LeftGateHinge, ElevatorAnimationSettings, { CFrame = TargetPath.Positions.ElevatorPositions.LEFT_LiftGatePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(RightGateHinge, ElevatorAnimationSettings, { CFrame = TargetPath.Positions.ElevatorPositions.RIGHT_LiftGatePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(FrontGateHinge, ElevatorAnimationSettings, { CFrame = TargetPath.Positions.ElevatorPositions.FRONT_LiftGatePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(BackGateHinge, ElevatorAnimationSettings, { CFrame = TargetPath.Positions.ElevatorPositions.BACK_LiftGatePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	ElevatorStartSound:Play()
	ElevatorMoveSound:Play()
	wait(1)
	WeldTrigger.CanTouch = false
	wait(PassTime - 1)
	ElevatorMoveSound:Stop()
	ElevatorStopSound:Play()
	ElevatorCurrentStationValue.Value = ElevatorTargetStationValue.Value
	CurrentPath = script.Parent.Parent.Parent.Parent["Station_"..ElevatorCurrentStationValue.Value]
	ElevatorStatusValue.Value = "ARRIVED"
	DoControlLamps("STOPPED")
	wait(1)
	DoDoors("OPEN", CurrentPath)
	DoAllEmergencyLamps("OFF")
end)
