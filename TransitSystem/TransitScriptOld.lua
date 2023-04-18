-- Main
local TweenService = game:GetService("TweenService")

local Transit = script.Parent.Parent.Parent.Transit.TransitPrimaryPart
local TransitFrontStationPos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.TransitPos
local TransitEmergencyStopPos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.TransitPos
local TransitBackStationPos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.TransitPos

local FrontLeftDoor = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.LeftDoor
local FrontRightDoor = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.RightDoor
local BackLeftDoor = script.Parent.Parent.Parent.Transit.Interior.BackDoor.LeftDoor
local BackRightDoor = script.Parent.Parent.Parent.Transit.Interior.BackDoor.RightDoor

local FrontStationFrontLeftDoorClosePos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.FrontLeftDoorClosePos
local FrontStationFrontRightDoorClosePos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.FrontRightDoorClosePos
local FrontStationBackLeftDoorClosePos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.BackLeftDoorClosePos
local FrontStationBackRightDoorClosePos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.BackRightDoorClosePos
local FrontStationFrontLeftDoorOpenPos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.FrontLeftDoorOpenPos
local FrontStationFrontRightDoorOpenPos = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.FrontRightDoorOpenPos

local EmergencyStopFrontLeftDoorClosePos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.FrontLeftDoorClosePos
local EmergencyStopFrontRightDoorClosePos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.FrontRightDoorClosePos
local EmergencyStopFrontLeftDoorOpenPos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.FrontLeftDoorOpenPos
local EmergencyStopFrontRightDoorOpenPos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.FrontRightDoorOpenPos
local EmergencyStopBackLeftDoorOpenPos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.BackLeftDoorOpenPos
local EmergencyStopBackRightDoorOpenPos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.BackRightDoorOpenPos
local EmergencyStopBackLeftDoorClosePos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.BackLeftDoorClosePos
local EmergencyStopBackRightDoorClosePos = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.BackRightDoorClosePos

local BackStationBackLeftDoorClosePos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.BackLeftDoorClosePos
local BackStationBackRightDoorClosePos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.BackRightDoorClosePos
local BackStationFrontLeftDoorClosePos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.FrontLeftDoorClosePos
local BackStationFrontRightDoorClosePos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.FrontRightDoorClosePos
local BackStationBackLeftDoorOpenPos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.BackLeftDoorOpenPos
local BackStationBackRightDoorOpenPos = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.BackRightDoorOpenPos

local WeldTrigger = script.Parent.Parent.Parent.Transit.Interior.WeldTrigger
--

-- Control
local FrontDoorTransitButton = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.FrontDoorTransitButton.Button
local BackDoorTransitButton = script.Parent.Parent.Parent.Transit.Interior.BackDoor.BackDoorTransitButton.Button
local FrontStationButton = script.Parent.Parent.Parent.TransitFrontStation.TransitStationGates.RightGate.Button.Button
local FrontStationButtonFrame = script.Parent.Parent.Parent.TransitFrontStation.TransitStationGates.RightGate.Button.ButtonFrame
local BackStationButton = script.Parent.Parent.Parent.TransitBackStation.TransitStationGates.RightGate.Button.Button
local BackStationButtonFrame = script.Parent.Parent.Parent.TransitBackStation.TransitStationGates.RightGate.Button.ButtonFrame

local EmergencyStopTrigger = script.Parent.Parent.Parent.Transit.Interior.EmergencyStopTrigger
--

-- Lamps
local TransitLamp1 = script.Parent.Parent.Parent.Transit.Interior.TransitModule1.TransitLamp
local TransitLamp2 = script.Parent.Parent.Parent.Transit.Interior.TransitModule2.TransitLamp
local TransitLamp3 = script.Parent.Parent.Parent.Transit.Interior.TransitModule3.TransitLamp
local TransitLamp4 = script.Parent.Parent.Parent.Transit.Interior.TransitModule4.TransitLamp
local TransitSmallLamp1 = script.Parent.Parent.Parent.Transit.Interior.TransitModule1.TransitSmallLamp1.Lamp
local TransitSmallLamp2 = script.Parent.Parent.Parent.Transit.Interior.TransitModule1.TransitSmallLamp2.Lamp
local TransitSmallLamp3 = script.Parent.Parent.Parent.Transit.Interior.TransitModule2.TransitSmallLamp1.Lamp
local TransitSmallLamp4 = script.Parent.Parent.Parent.Transit.Interior.TransitModule2.TransitSmallLamp2.Lamp
local TransitSmallLamp5 = script.Parent.Parent.Parent.Transit.Interior.TransitModule3.TransitSmallLamp1.Lamp
local TransitSmallLamp6 = script.Parent.Parent.Parent.Transit.Interior.TransitModule3.TransitSmallLamp2.Lamp
local TransitSmallLamp7 = script.Parent.Parent.Parent.Transit.Interior.TransitModule4.TransitSmallLamp1.Lamp
local TransitSmallLamp8 = script.Parent.Parent.Parent.Transit.Interior.TransitModule4.TransitSmallLamp2.Lamp
local TransitSmallLamp9 = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.TransitSmallLamp.Lamp
local TransitSmallLamp10 = script.Parent.Parent.Parent.Transit.Interior.BackDoor.TransitSmallLamp.Lamp
local TransitSmallLamp11 = script.Parent.Parent.Parent.Transit.Covering.FrontLamps.TransitSmallLamp.Lamp
local TransitSmallLamp12 = script.Parent.Parent.Parent.Transit.Covering.BackLamps.TransitSmallLamp.Lamp
local FrontStationGateLamps1 = script.Parent.Parent.Parent.TransitFrontStation.TransitStationGates.LeftGate.Frame.Lamps
local FrontStationGateLamps2 = script.Parent.Parent.Parent.TransitFrontStation.TransitStationGates.RightGate.Frame.Lamps
local BackStationGateLamps1 = script.Parent.Parent.Parent.TransitBackStation.TransitStationGates.LeftGate.Frame.Lamps
local BackStationGateLamps2 = script.Parent.Parent.Parent.TransitBackStation.TransitStationGates.RightGate.Frame.Lamps
local FrontStationEmergencyLamps = script.Parent.Parent.Parent.TransitFrontStation.EmergencyLamps.EmergencyLamps:GetChildren()
local FrontStationEmergencyStopLamps = script.Parent.Parent.Parent.TransitFrontStation.EmergencyLamps.EmergencyStopLamps:GetChildren()
local BackStationEmergencyLamps = script.Parent.Parent.Parent.TransitBackStation.EmergencyLamps.EmergencyLamps:GetChildren()
local BackStationEmergencyStopLamps = script.Parent.Parent.Parent.TransitBackStation.EmergencyLamps.EmergencyStopLamps:GetChildren()
--

-- Sound
local FrontDoorTransitCallButtonSound = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.FrontDoorTransitButton.Button.TransitCallButtonSound
local BackDoorTransitCallButtonSound = script.Parent.Parent.Parent.Transit.Interior.BackDoor.BackDoorTransitButton.Button.TransitCallButtonSound
local TransitArrivingStationInteriorSound = script.Parent.Parent.Parent.Transit.SoundEmitter.TransitArrivingStationInteriorSound
local TransitMotionInteriorSound = script.Parent.Parent.Parent.Transit.SoundEmitter.TransitMotionInteriorSound
local TransitDepartingStationInteriorSound = script.Parent.Parent.Parent.Transit.SoundEmitter.TransitDepartingStationInteriorSound
local TransitArrivingEmergencyStopSound = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.TransitPos.TransitStationArrivingSound
local TransitDepartingEmergencyStopSound = script.Parent.Parent.Parent.TransitTunnel.TransitPoses.TransitPos.TransitStationDepartingSound
local TransitBoopAlarmSound = script.Parent.Parent.Parent.TransitFrontStation.ConsoleSpeaker.SoundEmitter.BoopAlarmSound
local TransitLongAlarmSound = script.Parent.Parent.Parent.Transit.SoundEmitter.LongAlarmSound
local TransitMessage1 = script.Parent.Parent.Parent.Transit.SoundEmitter.TransitMessage1
local TransitMessage2 = script.Parent.Parent.Parent.Transit.SoundEmitter.TransitMessage2
local TransitFrontDoorOpenSound = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.SoundEmitter.TransitDoorOpenSound
local TransitFrontDoorCloseSound = script.Parent.Parent.Parent.Transit.Interior.FrontDoor.SoundEmitter.TransitDoorCloseSound
local TransitBackDoorOpenSound = script.Parent.Parent.Parent.Transit.Interior.BackDoor.SoundEmitter.TransitDoorOpenSound
local TransitBackDoorCloseSound = script.Parent.Parent.Parent.Transit.Interior.BackDoor.SoundEmitter.TransitDoorCloseSound
local TransitInteriorAmbient = script.Parent.Parent.Parent.Transit.SoundEmitter.TransitInteriorAmbient

local FrontStationCallButtonSound = script.Parent.Parent.Parent.TransitFrontStation.TransitStationGates.RightGate.Button.Button.TransitCallButtonSound
local FrontStationBoopAlarmSound = script.Parent.Parent.Parent.TransitBackStation.ConsoleSpeaker.SoundEmitter.BoopAlarmSound
local FrontStationLongAlarmSound = script.Parent.Parent.Parent.TransitFrontStation.ConsoleSpeaker.SoundEmitter.LongAlarmSound
local FrontStationTransitMessage1 = script.Parent.Parent.Parent.TransitFrontStation.ConsoleSpeaker.SoundEmitter.TransitMessage1
local FrontStationTransitMessage2 = script.Parent.Parent.Parent.TransitFrontStation.ConsoleSpeaker.SoundEmitter.TransitMessage2
local FrontStationAlarmSound = script.Parent.Parent.Parent.TransitFrontStation.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound
local FrontStationCallAlarmSound = script.Parent.Parent.Parent.TransitFrontStation.ConsoleSpeaker.SoundEmitter.TransitStationCallAlarmSound
local FrontStationArrivingSound = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.TransitPos.TransitStationArrivingSound
local FrontStationDepartingSound = script.Parent.Parent.Parent.TransitFrontStation.TransitPoses.TransitPos.TransitStationDepartingSound

local BackStationCallButtonSound = script.Parent.Parent.Parent.TransitBackStation.TransitStationGates.RightGate.Button.Button.TransitCallButtonSound
local BackStationBoopAlarmSound = script.Parent.Parent.Parent.Transit.SoundEmitter.BoopAlarmSound
local BackStationLongAlarmSound = script.Parent.Parent.Parent.TransitBackStation.ConsoleSpeaker.SoundEmitter.LongAlarmSound
local BackStationTransitMessage1 = script.Parent.Parent.Parent.TransitBackStation.ConsoleSpeaker.SoundEmitter.TransitMessage1
local BackStationTransitMessage2 = script.Parent.Parent.Parent.TransitBackStation.ConsoleSpeaker.SoundEmitter.TransitMessage2
local BackStationAlarmSound = script.Parent.Parent.Parent.TransitBackStation.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound
local BackStationCallAlarmSound = script.Parent.Parent.Parent.TransitBackStation.ConsoleSpeaker.SoundEmitter.TransitStationCallAlarmSound
local BackStationArrivingSound = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.TransitPos.TransitStationArrivingSound
local BackStationDepartingSound = script.Parent.Parent.Parent.TransitBackStation.TransitPoses.TransitPos.TransitStationDepartingSound
--

-- Values
local TransitValue = script.Parent.Parent.Values.TransitValue
local TransitDirectionValue = script.Parent.Parent.Values.TransitDirectionValue
local TransitLightingModeValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitLightingModeValue
local FrontStationGatesValue = script.Parent.Parent.Parent.TransitFrontStation.TransitStationGates.CPU.Values.TransitStationGatesValue
local FrontStationBlastDoorValue = script.Parent.Parent.Parent.TransitFrontStation.TransitBlastDoor.CPU.Values.TransitBlastDoorValue

local BackStationGatesValue = script.Parent.Parent.Parent.TransitBackStation.TransitStationGates.CPU.Values.TransitStationGatesValue
local BackStationBlastDoorValue = script.Parent.Parent.Parent.TransitBackStation.TransitBlastDoor.CPU.Values.TransitBlastDoorValue

local FacilityTransitSystemStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.FacilityTransitSystemStatusValue
--

local TransitMovingToFrontStation = {
	CFrame = TransitFrontStationPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local TransitMovingToEmergencyStop = {
	CFrame = TransitEmergencyStopPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local TransitMovingToBackStation = {
	CFrame = TransitBackStationPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FrontStationFrontLeftDoorOpen = {
	CFrame = FrontStationFrontLeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontStationFrontRightDoorOpen = {
	CFrame = FrontStationFrontRightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontStationFrontLeftDoorClose = {
	CFrame = FrontStationFrontLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontStationFrontRightDoorClose = {
	CFrame = FrontStationFrontRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local EmergencyStopFrontLeftDoorOpen = {
	CFrame = EmergencyStopFrontLeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopFrontRightDoorOpen = {
	CFrame = EmergencyStopFrontRightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopFrontLeftDoorClose = {
	CFrame = EmergencyStopFrontLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopFrontRightDoorClose = {
	CFrame = EmergencyStopFrontRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopBackLeftDoorOpen = {
	CFrame = EmergencyStopBackLeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopBackRightDoorOpen = {
	CFrame = EmergencyStopBackRightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopBackLeftDoorClose = {
	CFrame = EmergencyStopBackLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EmergencyStopBackRightDoorClose = {
	CFrame = EmergencyStopBackRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontLeftDoorMovingToEmergencyStop = {
	CFrame = EmergencyStopFrontLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontRightDoorMovingToEmergencyStop = {
	CFrame = EmergencyStopFrontRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackLeftDoorMovingToEmergencyStop = {
	CFrame = EmergencyStopBackLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackRightDoorMovingToEmergencyStop = {
	CFrame = EmergencyStopBackRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local BackStationBackLeftDoorOpen = {
	CFrame = BackStationBackLeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackStationBackRightDoorOpen = {
	CFrame = BackStationBackRightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackStationBackLeftDoorClose = {
	CFrame = BackStationBackLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackStationBackRightDoorClose = {
	CFrame = BackStationBackRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FrontLeftDoorMovingToFrontStation = {
	CFrame = FrontStationFrontLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontRightDoorMovingToFrontStation = {
	CFrame = FrontStationFrontRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackLeftDoorMovingToFrontStation = {
	CFrame = FrontStationBackLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackRightDoorMovingToFrontStation = {
	CFrame = FrontStationBackRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FrontLeftDoorMovingToBackStation = {
	CFrame = BackStationFrontLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontRightDoorMovingToBackStation = {
	CFrame = BackStationFrontRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackLeftDoorMovingToBackStation = {
	CFrame = BackStationBackLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackRightDoorMovingToBackStation = {
	CFrame = BackStationBackRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local TransitDoorAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local TransitAnimationSettings = TweenInfo.new(
	36,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local TransitEmergencyStopAnimationSettings = TweenInfo.new(
	8,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local TransitMovingToFrontStation = TweenService:Create(Transit, TransitAnimationSettings, TransitMovingToFrontStation)
local TransitMovingToEmergencyStop = TweenService:Create(Transit, TransitEmergencyStopAnimationSettings, TransitMovingToEmergencyStop)
local TransitMovingToBackStation = TweenService:Create(Transit, TransitAnimationSettings, TransitMovingToBackStation)

local FrontStationFrontLeftDoorOpen = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, FrontStationFrontLeftDoorOpen)
local FrontStationFrontRightDoorOpen = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, FrontStationFrontRightDoorOpen)
local FrontStationFrontLeftDoorClose = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, FrontStationFrontLeftDoorClose)
local FrontStationFrontRightDoorClose = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, FrontStationFrontRightDoorClose)

local EmergencyStopFrontLeftDoorOpen = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, EmergencyStopFrontLeftDoorOpen)
local EmergencyStopFrontRightDoorOpen = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, EmergencyStopFrontRightDoorOpen)
local EmergencyStopBackLeftDoorOpen = TweenService:Create(BackLeftDoor, TransitDoorAnimationSettings, EmergencyStopBackLeftDoorOpen)
local EmergencyStopBackRightDoorOpen = TweenService:Create(BackRightDoor, TransitDoorAnimationSettings, EmergencyStopBackRightDoorOpen)
local EmergencyStopFrontLeftDoorClose = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, EmergencyStopFrontLeftDoorClose)
local EmergencyStopFrontRightDoorClose = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, EmergencyStopFrontRightDoorClose)
local EmergencyStopBackLeftDoorClose = TweenService:Create(BackLeftDoor, TransitDoorAnimationSettings, EmergencyStopBackLeftDoorClose)
local EmergencyStopBackRightDoorClose = TweenService:Create(BackRightDoor, TransitDoorAnimationSettings, EmergencyStopBackRightDoorClose)
local FrontLeftDoorMovingToEmergencyStop = TweenService:Create(FrontLeftDoor, TransitEmergencyStopAnimationSettings, FrontLeftDoorMovingToEmergencyStop)
local FrontRightDoorMovingToEmergencyStop = TweenService:Create(FrontRightDoor, TransitEmergencyStopAnimationSettings, FrontRightDoorMovingToEmergencyStop)
local BackLeftDoorMovingToEmergencyStop = TweenService:Create(BackLeftDoor, TransitEmergencyStopAnimationSettings, BackLeftDoorMovingToEmergencyStop)
local BackRightDoorMovingToEmergencyStop = TweenService:Create(BackRightDoor, TransitEmergencyStopAnimationSettings, BackRightDoorMovingToEmergencyStop)

local BackStationBackLeftDoorOpen = TweenService:Create(BackLeftDoor, TransitDoorAnimationSettings, BackStationBackLeftDoorOpen)
local BackStationBackRightDoorOpen = TweenService:Create(BackRightDoor, TransitDoorAnimationSettings, BackStationBackRightDoorOpen)
local BackStationBackLeftDoorClose = TweenService:Create(BackLeftDoor, TransitDoorAnimationSettings, BackStationBackLeftDoorClose)
local BackStationBackRightDoorClose = TweenService:Create(BackRightDoor, TransitDoorAnimationSettings, BackStationBackRightDoorClose)

local FrontLeftDoorMovingToFrontStation = TweenService:Create(FrontLeftDoor, TransitAnimationSettings, FrontLeftDoorMovingToFrontStation)
local FrontRightDoorMovingToFrontStation = TweenService:Create(FrontRightDoor, TransitAnimationSettings, FrontRightDoorMovingToFrontStation)
local BackLeftDoorMovingToFrontStation = TweenService:Create(BackLeftDoor, TransitAnimationSettings, BackLeftDoorMovingToFrontStation)
local BackRightDoorMovingToFrontStation = TweenService:Create(BackRightDoor, TransitAnimationSettings, BackRightDoorMovingToFrontStation)

local FrontLeftDoorMovingToBackStation = TweenService:Create(FrontLeftDoor, TransitAnimationSettings, FrontLeftDoorMovingToBackStation)
local FrontRightDoorMovingToBackStation = TweenService:Create(FrontRightDoor, TransitAnimationSettings, FrontRightDoorMovingToBackStation)
local BackLeftDoorMovingToBackStation = TweenService:Create(BackLeftDoor, TransitAnimationSettings, BackLeftDoorMovingToBackStation)
local BackRightDoorMovingToBackStation = TweenService:Create(BackRightDoor, TransitAnimationSettings, BackRightDoorMovingToBackStation)

-- Functions
function TurnOnFrontStationEmergencyLamps()
	FrontStationAlarmSound:Play()
	for _, Object in pairs(FrontStationEmergencyLamps) do
		Object.Lamp.SpotLight.Enabled = true
		Object.Lamp.HingeConstraint.AngularVelocity = 5
	end
end
function TurnOffFrontStationEmergencyLamps()
	FrontStationAlarmSound:Stop()
	for _, Object in pairs(FrontStationEmergencyLamps) do
		Object.Lamp.SpotLight.Enabled = false
		Object.Lamp.HingeConstraint.AngularVelocity = 0
	end
end
function TurnOnFrontStationEmergencyStopLamps()
	for _, Object in pairs(FrontStationEmergencyStopLamps) do
		Object.Lamp.SpotLight.Enabled = true
		Object.Lamp.HingeConstraint.AngularVelocity = 5
	end
end
function TurnOffFrontStationEmergencyStopLamps()
	for _, Object in pairs(FrontStationEmergencyStopLamps) do
		Object.Lamp.SpotLight.Enabled = false
		Object.Lamp.HingeConstraint.AngularVelocity = 0
	end
end

function TurnOnBackStationEmergencyLamps()
	BackStationAlarmSound:Play()
	for _, Object in pairs(BackStationEmergencyLamps) do
		Object.Lamp.SpotLight.Enabled = true
		Object.Lamp.HingeConstraint.AngularVelocity = 5
	end
end
function TurnOffBackStationEmergencyLamps()
	BackStationAlarmSound:Stop()
	for _, Object in pairs(BackStationEmergencyLamps) do
		Object.Lamp.SpotLight.Enabled = false
		Object.Lamp.HingeConstraint.AngularVelocity = 0
	end
end
function TurnOnBackStationEmergencyStopLamps()
	for _, Object in pairs(BackStationEmergencyStopLamps) do
		Object.Lamp.SpotLight.Enabled = true
		Object.Lamp.HingeConstraint.AngularVelocity = 5
	end
end
function TurnOffBackStationEmergencyStopLamps()
	for _, Object in pairs(BackStationEmergencyStopLamps) do
		Object.Lamp.SpotLight.Enabled = false
		Object.Lamp.HingeConstraint.AngularVelocity = 0
	end
end

function TurnOnBoopAlarms()
	TransitBoopAlarmSound:Play()
	FrontStationBoopAlarmSound:Play()
	BackStationBoopAlarmSound:Play()
end
function TurnOffBoopAlarms()
	TransitBoopAlarmSound.Looped = false
	FrontStationBoopAlarmSound.Looped = false
	BackStationBoopAlarmSound.Looped = false
	wait(1.5)
	TransitBoopAlarmSound:Stop()
	FrontStationBoopAlarmSound:Stop()
	BackStationBoopAlarmSound:Stop()
end

function TurnOnLongAlarms()
	TransitLongAlarmSound:Play()
	FrontStationLongAlarmSound:Play()
	BackStationLongAlarmSound:Play()
end
function TurnOffLongAlarms()
	TransitLongAlarmSound.Looped = false
	FrontStationLongAlarmSound.Looped = false
	BackStationLongAlarmSound.Looped = false
	wait(2.5)
	TransitLongAlarmSound:Stop()
	FrontStationLongAlarmSound:Stop()
	BackStationLongAlarmSound:Stop()
end

function TurnOffAlarms()
	TransitLongAlarmSound.Looped = false
	FrontStationLongAlarmSound.Looped = false
	BackStationLongAlarmSound.Looped = false
	
	TransitBoopAlarmSound.Looped = false
	FrontStationBoopAlarmSound.Looped = false
	BackStationBoopAlarmSound.Looped = false
	wait(2.5)
	TransitLongAlarmSound:Stop()
	FrontStationLongAlarmSound:Stop()
	BackStationLongAlarmSound:Stop()
	
	TransitBoopAlarmSound:Stop()
	FrontStationBoopAlarmSound:Stop()
	BackStationBoopAlarmSound:Stop()
	
	TransitLongAlarmSound.Looped = true
	FrontStationLongAlarmSound.Looped = true
	BackStationLongAlarmSound.Looped = true

	TransitBoopAlarmSound.Looped = true
	FrontStationBoopAlarmSound.Looped = true
	BackStationBoopAlarmSound.Looped = true
end

function TurnOnTransitLamp1()
	TransitLamp1.Lamp.Material = "Neon"
	TransitLamp1.LightEmitter.SpotLight.Enabled = true
end
function TurnOffTransitLamp1()
	TransitLamp1.Lamp.Material = "Metal"
	TransitLamp1.LightEmitter.SpotLight.Enabled = false
end
function GetTransitLamp1Red()
	TransitLamp1.Lamp.Color = Color3.fromRGB(255, 0, 0)
	TransitLamp1.LightEmitter.SpotLight.Color = Color3.new(1, 0, 0)
end
function GetTransitLamp1White()
	TransitLamp1.Lamp.Color = Color3.fromRGB(248, 248, 248)
	TransitLamp1.LightEmitter.SpotLight.Color = Color3.fromRGB(255, 222, 156)
end

function TurnOnTransitLamp2()
	TransitLamp2.Lamp.Material = "Neon"
	TransitLamp2.LightEmitter.SpotLight.Enabled = true
end
function TurnOffTransitLamp2()
	TransitLamp2.Lamp.Material = "Metal"
	TransitLamp2.LightEmitter.SpotLight.Enabled = false
end
function GetTransitLamp2Red()
	TransitLamp2.Lamp.Color = Color3.fromRGB(255, 0, 0)
	TransitLamp2.LightEmitter.SpotLight.Color = Color3.new(1, 0, 0)
end
function GetTransitLamp2White()
	TransitLamp2.Lamp.Color = Color3.fromRGB(248, 248, 248)
	TransitLamp2.LightEmitter.SpotLight.Color = Color3.fromRGB(255, 222, 156)
end

function TurnOnTransitLamp3()
	TransitLamp3.Lamp.Material = "Neon"
	TransitLamp3.LightEmitter.SpotLight.Enabled = true
end
function TurnOffTransitLamp3()
	TransitLamp3.Lamp.Material = "Metal"
	TransitLamp3.LightEmitter.SpotLight.Enabled = false
end
function GetTransitLamp3Red()
	TransitLamp3.Lamp.Color = Color3.fromRGB(255, 0, 0)
	TransitLamp3.LightEmitter.SpotLight.Color = Color3.new(1, 0, 0)
end
function GetTransitLamp3White()
	TransitLamp3.Lamp.Color = Color3.fromRGB(248, 248, 248)
	TransitLamp3.LightEmitter.SpotLight.Color = Color3.fromRGB(255, 222, 156)
end

function TurnOnTransitLamp4()
	TransitLamp4.Lamp.Material = "Neon"
	TransitLamp4.LightEmitter.SpotLight.Enabled = true
end
function TurnOffTransitLamp4()
	TransitLamp4.Lamp.Material = "Metal"
	TransitLamp4.LightEmitter.SpotLight.Enabled = false
end
function GetTransitLamp4Red()
	TransitLamp4.Lamp.Color = Color3.fromRGB(255, 0, 0)
	TransitLamp4.LightEmitter.SpotLight.Color = Color3.new(1, 0, 0)
end
function GetTransitLamp4White()
	TransitLamp4.Lamp.Color = Color3.fromRGB(248, 248, 248)
	TransitLamp4.LightEmitter.SpotLight.Color = Color3.fromRGB(255, 222, 156)
end

function TurnOnTransitLamps()
	TransitInteriorAmbient:Play()
	TurnOnTransitLamp1()
	TurnOnTransitLamp2()
	TurnOnTransitLamp3()
	TurnOnTransitLamp4()
end
function TurnOffTransitLamps()
	TurnOffTransitLamp1()
	TurnOffTransitLamp2()
	TurnOffTransitLamp3()
	TurnOffTransitLamp4()
end
function GetTransitLampsRed()
	GetTransitLamp1Red()
	GetTransitLamp2Red()
	GetTransitLamp3Red()
	GetTransitLamp4Red()
end
function GetTransitLampsWhite()
	GetTransitLamp1White()
	GetTransitLamp2White()
	GetTransitLamp3White()
	GetTransitLamp4White()
end

function TurnOnTransitSmallLamp1()
	TransitSmallLamp1.Material = "Neon"
	TransitSmallLamp1.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp1()
	TransitSmallLamp1.Material = "Metal"
	TransitSmallLamp1.PointLight.Enabled = false
end
function GetTransitSmallLamp1Red()
	TransitSmallLamp1.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp1.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp1Orange()
	TransitSmallLamp1.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp1.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp2()
	TransitSmallLamp2.Material = "Neon"
	TransitSmallLamp2.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp2()
	TransitSmallLamp2.Material = "Metal"
	TransitSmallLamp2.PointLight.Enabled = false
end
function GetTransitSmallLamp2Red()
	TransitSmallLamp2.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp2.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp2Orange()
	TransitSmallLamp2.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp2.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp3()
	TransitSmallLamp3.Material = "Neon"
	TransitSmallLamp3.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp3()
	TransitSmallLamp3.Material = "Metal"
	TransitSmallLamp3.PointLight.Enabled = false
end
function GetTransitSmallLamp3Red()
	TransitSmallLamp3.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp3.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp3Orange()
	TransitSmallLamp3.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp3.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp4()
	TransitSmallLamp4.Material = "Neon"
	TransitSmallLamp4.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp4()
	TransitSmallLamp4.Material = "Metal"
	TransitSmallLamp4.PointLight.Enabled = false
end
function GetTransitSmallLamp4Red()
	TransitSmallLamp4.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp4.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp4Orange()
	TransitSmallLamp4.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp4.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp5()
	TransitSmallLamp5.Material = "Neon"
	TransitSmallLamp5.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp5()
	TransitSmallLamp5.Material = "Metal"
	TransitSmallLamp5.PointLight.Enabled = false
end
function GetTransitSmallLamp5Red()
	TransitSmallLamp5.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp5.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp5Orange()
	TransitSmallLamp5.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp5.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp6()
	TransitSmallLamp6.Material = "Neon"
	TransitSmallLamp6.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp6()
	TransitSmallLamp6.Material = "Metal"
	TransitSmallLamp6.PointLight.Enabled = false
end
function GetTransitSmallLamp6Red()
	TransitSmallLamp6.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp6.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp6Orange()
	TransitSmallLamp6.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp6.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp7()
	TransitSmallLamp7.Material = "Neon"
	TransitSmallLamp7.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp7()
	TransitSmallLamp7.Material = "Metal"
	TransitSmallLamp7.PointLight.Enabled = false
end
function GetTransitSmallLamp7Red()
	TransitSmallLamp7.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp7.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp7Orange()
	TransitSmallLamp7.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp7.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp8()
	TransitSmallLamp8.Material = "Neon"
	TransitSmallLamp8.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp8()
	TransitSmallLamp8.Material = "Metal"
	TransitSmallLamp8.PointLight.Enabled = false
end
function GetTransitSmallLamp8Red()
	TransitSmallLamp8.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp8.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp8Orange()
	TransitSmallLamp8.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp8.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp9()
	TransitSmallLamp9.Material = "Neon"
	TransitSmallLamp9.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp9()
	TransitSmallLamp9.Material = "Metal"
	TransitSmallLamp9.PointLight.Enabled = false
end
function GetTransitSmallLamp9Red()
	TransitSmallLamp9.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp9.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp9Orange()
	TransitSmallLamp9.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp9.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp10()
	TransitSmallLamp10.Material = "Neon"
	TransitSmallLamp10.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp10()
	TransitSmallLamp10.Material = "Metal"
	TransitSmallLamp10.PointLight.Enabled = false
end
function GetTransitSmallLamp10Red()
	TransitSmallLamp10.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp10.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp10Orange()
	TransitSmallLamp10.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp10.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp11()
	TransitSmallLamp11.Material = "Neon"
	TransitSmallLamp11.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp11()
	TransitSmallLamp11.Material = "Metal"
	TransitSmallLamp11.PointLight.Enabled = false
end
function GetTransitSmallLamp11Red()
	TransitSmallLamp11.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp11.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp11Orange()
	TransitSmallLamp11.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp11.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamp12()
	TransitSmallLamp12.Material = "Neon"
	TransitSmallLamp12.PointLight.Enabled = true
end
function TurnOffTransitSmallLamp12()
	TransitSmallLamp12.Material = "Metal"
	TransitSmallLamp12.PointLight.Enabled = false
end
function GetTransitSmallLamp12Red()
	TransitSmallLamp12.Color = Color3.fromRGB(255, 0, 0)
	TransitSmallLamp12.PointLight.Color = Color3.fromRGB(255, 0, 0)
end
function GetTransitSmallLamp12Orange()
	TransitSmallLamp12.Color = Color3.fromRGB(188, 155, 93)
	TransitSmallLamp12.PointLight.Color = Color3.fromRGB(163, 95, 0)
end

function TurnOnTransitSmallLamps()
	TurnOnTransitSmallLamp1()
	TurnOnTransitSmallLamp2()
	TurnOnTransitSmallLamp3()
	TurnOnTransitSmallLamp4()
	TurnOnTransitSmallLamp5()
	TurnOnTransitSmallLamp6()
	TurnOnTransitSmallLamp7()
	TurnOnTransitSmallLamp8()
	TurnOnTransitSmallLamp9()
	TurnOnTransitSmallLamp10()
	TurnOnTransitSmallLamp11()
	TurnOnTransitSmallLamp12()
end
function TurnOffTransitSmallLamps()
	TurnOffTransitSmallLamp1()
	TurnOffTransitSmallLamp2()
	TurnOffTransitSmallLamp3()
	TurnOffTransitSmallLamp4()
	TurnOffTransitSmallLamp5()
	TurnOffTransitSmallLamp6()
	TurnOffTransitSmallLamp7()
	TurnOffTransitSmallLamp8()
	TurnOffTransitSmallLamp9()
	TurnOffTransitSmallLamp10()
	TurnOffTransitSmallLamp11()
	TurnOffTransitSmallLamp12()
end
function GetTransitSmallLampsRed()
	GetTransitSmallLamp1Red()
	GetTransitSmallLamp2Red()
	GetTransitSmallLamp3Red()
	GetTransitSmallLamp4Red()
	GetTransitSmallLamp5Red()
	GetTransitSmallLamp6Red()
	GetTransitSmallLamp7Red()
	GetTransitSmallLamp8Red()
	GetTransitSmallLamp9Red()
	GetTransitSmallLamp10Red()
	GetTransitSmallLamp11Red()
	GetTransitSmallLamp12Red()
end
function GetTransitSmallLampsOrange()
	GetTransitSmallLamp1Orange()
	GetTransitSmallLamp2Orange()
	GetTransitSmallLamp3Orange()
	GetTransitSmallLamp4Orange()
	GetTransitSmallLamp5Orange()
	GetTransitSmallLamp6Orange()
	GetTransitSmallLamp7Orange()
	GetTransitSmallLamp8Orange()
	GetTransitSmallLamp9Orange()
	GetTransitSmallLamp10Orange()
	GetTransitSmallLamp11Orange()
	GetTransitSmallLamp12Orange()
end

function GetRandomTransitLampGlitch()
	local RandomIndex = math.random(1, 8)
	if TransitLightingModeValue.Value == "STANDARD" then
		if RandomIndex == 1 then
			TurnOffTransitLamp1()
			wait(1)
			TurnOnTransitLamp1()
			wait(0.5)
			TurnOffTransitLamp1()
			wait(0.5)
			TurnOnTransitLamp1()
			wait(0.2)
			TurnOffTransitLamp1()
			wait(0.2)
			TurnOnTransitLamp1()
			wait(0.5)
		end
		if RandomIndex == 2 then
			TurnOffTransitLamp2()
			wait(1)
			TurnOnTransitLamp2()
			wait(0.5)
			TurnOffTransitLamp2()
			wait(0.5)
			TurnOnTransitLamp2()
			wait(0.2)
			TurnOffTransitLamp2()
			wait(0.2)
			TurnOnTransitLamp2()
			wait(0.5)
		end
		if RandomIndex == 3 then
			TurnOffTransitLamp3()
			wait(1)
			TurnOnTransitLamp3()
			wait(0.5)
			TurnOffTransitLamp3()
			wait(0.5)
			TurnOnTransitLamp3()
			wait(0.2)
			TurnOffTransitLamp3()
			wait(0.2)
			TurnOnTransitLamp3()
			wait(0.5)
		end
		if RandomIndex == 4 then
			TurnOffTransitLamp4()
			wait(1)
			TurnOnTransitLamp4()
			wait(0.5)
			TurnOffTransitLamp4()
			wait(0.5)
			TurnOnTransitLamp4()
			wait(0.2)
			TurnOffTransitLamp4()
			wait(0.2)
			TurnOnTransitLamp4()
			wait(0.5)
		end
		if RandomIndex == 5 then
			TurnOffTransitLamp1()
			wait(2)
			GetTransitLamp1Red()
			TurnOnTransitLamp1()
			wait(2)
			TurnOffTransitLamp1()
			wait(0.5)
			GetTransitLamp1White()
			TurnOnTransitLamp1()
		end
		if RandomIndex == 6 then
			TurnOffTransitLamp2()
			wait(2)
			GetTransitLamp2Red()
			TurnOnTransitLamp2()
			wait(2)
			TurnOffTransitLamp2()
			wait(0.5)
			GetTransitLamp2White()
			TurnOnTransitLamp2()
		end
		if RandomIndex == 7 then
			TurnOffTransitLamp3()
			wait(2)
			GetTransitLamp3Red()
			TurnOnTransitLamp3()
			wait(2)
			TurnOffTransitLamp3()
			wait(0.5)
			GetTransitLamp3White()
			TurnOnTransitLamp3()
		end
		if RandomIndex == 8 then
			TurnOffTransitLamp4()
			wait(2)
			GetTransitLamp4Red()
			TurnOnTransitLamp4()
			wait(2)
			TurnOffTransitLamp4()
			wait(0.5)
			GetTransitLamp4White()
			TurnOnTransitLamp4()
		end
	end
end

function GetRandomTransitSmallLampGlitch()
	local RandomIndex = math.random(1, 24)
	if TransitLightingModeValue.Value == "STANDARD" then
		if RandomIndex == 1 then
			TurnOffTransitSmallLamp1()
			wait(1)
			TurnOnTransitSmallLamp1()
			wait(0.5)
			TurnOffTransitSmallLamp1()
			wait(0.5)
			TurnOnTransitSmallLamp1()
			wait(0.2)
			TurnOffTransitSmallLamp1()
			wait(0.2)
			TurnOnTransitSmallLamp1()
			wait(0.5)
		end
		if RandomIndex == 2 then
			TurnOffTransitSmallLamp2()
			wait(1)
			TurnOnTransitSmallLamp2()
			wait(0.5)
			TurnOffTransitSmallLamp2()
			wait(0.5)
			TurnOnTransitSmallLamp2()
			wait(0.2)
			TurnOffTransitSmallLamp2()
			wait(0.2)
			TurnOnTransitSmallLamp2()
			wait(0.5)
		end
		if RandomIndex == 3 then
			TurnOffTransitSmallLamp3()
			wait(1)
			TurnOnTransitSmallLamp3()
			wait(0.5)
			TurnOffTransitSmallLamp3()
			wait(0.5)
			TurnOnTransitSmallLamp3()
			wait(0.2)
			TurnOffTransitSmallLamp3()
			wait(0.2)
			TurnOnTransitSmallLamp3()
			wait(0.5)
		end
		if RandomIndex == 4 then
			TurnOffTransitSmallLamp4()
			wait(1)
			TurnOnTransitSmallLamp4()
			wait(0.5)
			TurnOffTransitSmallLamp4()
			wait(0.5)
			TurnOnTransitSmallLamp4()
			wait(0.2)
			TurnOffTransitSmallLamp4()
			wait(0.2)
			TurnOnTransitSmallLamp4()
			wait(0.5)
		end
		if RandomIndex == 5 then
			TurnOffTransitSmallLamp5()
			wait(1)
			TurnOnTransitSmallLamp5()
			wait(0.5)
			TurnOffTransitSmallLamp5()
			wait(0.5)
			TurnOnTransitSmallLamp5()
			wait(0.2)
			TurnOffTransitSmallLamp5()
			wait(0.2)
			TurnOnTransitSmallLamp5()
			wait(0.5)
		end
		if RandomIndex == 6 then
			TurnOffTransitSmallLamp6()
			wait(1)
			TurnOnTransitSmallLamp6()
			wait(0.5)
			TurnOffTransitSmallLamp6()
			wait(0.5)
			TurnOnTransitSmallLamp6()
			wait(0.2)
			TurnOffTransitSmallLamp6()
			wait(0.2)
			TurnOnTransitSmallLamp6()
			wait(0.5)
		end
		if RandomIndex == 7 then
			TurnOffTransitSmallLamp7()
			wait(1)
			TurnOnTransitSmallLamp7()
			wait(0.5)
			TurnOffTransitSmallLamp7()
			wait(0.5)
			TurnOnTransitSmallLamp7()
			wait(0.2)
			TurnOffTransitSmallLamp7()
			wait(0.2)
			TurnOnTransitSmallLamp7()
			wait(0.5)
		end
		if RandomIndex == 8 then
			TurnOffTransitSmallLamp8()
			wait(1)
			TurnOnTransitSmallLamp8()
			wait(0.5)
			TurnOffTransitSmallLamp8()
			wait(0.5)
			TurnOnTransitSmallLamp8()
			wait(0.2)
			TurnOffTransitSmallLamp8()
			wait(0.2)
			TurnOnTransitSmallLamp8()
			wait(0.5)
		end
		if RandomIndex == 9 then
			TurnOffTransitSmallLamp9()
			wait(1)
			TurnOnTransitSmallLamp9()
			wait(0.5)
			TurnOffTransitSmallLamp9()
			wait(0.5)
			TurnOnTransitSmallLamp9()
			wait(0.2)
			TurnOffTransitSmallLamp9()
			wait(0.2)
			TurnOnTransitSmallLamp9()
			wait(0.5)
		end
		if RandomIndex == 10 then
			TurnOffTransitSmallLamp10()
			wait(1)
			TurnOnTransitSmallLamp10()
			wait(0.5)
			TurnOffTransitSmallLamp10()
			wait(0.5)
			TurnOnTransitSmallLamp10()
			wait(0.2)
			TurnOffTransitSmallLamp10()
			wait(0.2)
			TurnOnTransitSmallLamp10()
			wait(0.5)
		end
		if RandomIndex == 11 then
			TurnOffTransitSmallLamp11()
			wait(1)
			TurnOnTransitSmallLamp11()
			wait(0.5)
			TurnOffTransitSmallLamp11()
			wait(0.5)
			TurnOnTransitSmallLamp11()
			wait(0.2)
			TurnOffTransitSmallLamp11()
			wait(0.2)
			TurnOnTransitSmallLamp11()
			wait(0.5)
		end
		if RandomIndex == 12 then
			TurnOffTransitSmallLamp12()
			wait(1)
			TurnOnTransitSmallLamp12()
			wait(0.5)
			TurnOffTransitSmallLamp12()
			wait(0.5)
			TurnOnTransitSmallLamp12()
			wait(0.2)
			TurnOffTransitSmallLamp12()
			wait(0.2)
			TurnOnTransitSmallLamp12()
			wait(0.5)
		end
		if RandomIndex == 13 then
			TurnOffTransitSmallLamp1()
			wait(2)
			GetTransitSmallLamp1Red()
			TurnOnTransitSmallLamp1()
			wait(2)
			TurnOffTransitSmallLamp1()
			wait(0.5)
			GetTransitSmallLamp1Orange()
			TurnOnTransitSmallLamp1()
		end
		if RandomIndex == 14 then
			TurnOffTransitSmallLamp2()
			wait(2)
			GetTransitSmallLamp2Red()
			TurnOnTransitSmallLamp2()
			wait(2)
			TurnOffTransitSmallLamp2()
			wait(0.5)
			GetTransitSmallLamp2Orange()
			TurnOnTransitSmallLamp2()
		end
		if RandomIndex == 15 then
			TurnOffTransitSmallLamp3()
			wait(2)
			GetTransitSmallLamp3Red()
			TurnOnTransitSmallLamp3()
			wait(2)
			TurnOffTransitSmallLamp3()
			wait(0.5)
			GetTransitSmallLamp3Orange()
			TurnOnTransitSmallLamp3()
		end
		if RandomIndex == 16 then
			TurnOffTransitSmallLamp4()
			wait(2)
			GetTransitSmallLamp4Red()
			TurnOnTransitSmallLamp4()
			wait(2)
			TurnOffTransitSmallLamp4()
			wait(0.5)
			GetTransitSmallLamp4Orange()
			TurnOnTransitSmallLamp4()
		end
		if RandomIndex == 17 then
			TurnOffTransitSmallLamp5()
			wait(2)
			GetTransitSmallLamp5Red()
			TurnOnTransitSmallLamp5()
			wait(2)
			TurnOffTransitSmallLamp5()
			wait(0.5)
			GetTransitSmallLamp5Orange()
			TurnOnTransitSmallLamp5()
		end
		if RandomIndex == 18 then
			TurnOffTransitSmallLamp6()
			wait(2)
			GetTransitSmallLamp6Red()
			TurnOnTransitSmallLamp6()
			wait(2)
			TurnOffTransitSmallLamp6()
			wait(0.5)
			GetTransitSmallLamp6Orange()
			TurnOnTransitSmallLamp6()
		end
		if RandomIndex == 19 then
			TurnOffTransitSmallLamp7()
			wait(2)
			GetTransitSmallLamp7Red()
			TurnOnTransitSmallLamp7()
			wait(2)
			TurnOffTransitSmallLamp7()
			wait(0.5)
			GetTransitSmallLamp7Orange()
			TurnOnTransitSmallLamp7()
		end
		if RandomIndex == 20 then
			TurnOffTransitSmallLamp8()
			wait(2)
			GetTransitSmallLamp8Red()
			TurnOnTransitSmallLamp8()
			wait(2)
			TurnOffTransitSmallLamp8()
			wait(0.5)
			GetTransitSmallLamp8Orange()
			TurnOnTransitSmallLamp8()
		end
		if RandomIndex == 21 then
			TurnOffTransitSmallLamp9()
			wait(2)
			GetTransitSmallLamp9Red()
			TurnOnTransitSmallLamp9()
			wait(2)
			TurnOffTransitSmallLamp9()
			wait(0.5)
			GetTransitSmallLamp9Orange()
			TurnOnTransitSmallLamp9()
		end
		if RandomIndex == 22 then
			TurnOffTransitSmallLamp10()
			wait(2)
			GetTransitSmallLamp10Red()
			TurnOnTransitSmallLamp10()
			wait(2)
			TurnOffTransitSmallLamp10()
			wait(0.5)
			GetTransitSmallLamp10Orange()
			TurnOnTransitSmallLamp10()
		end
		if RandomIndex == 23 then
			TurnOffTransitSmallLamp11()
			wait(2)
			GetTransitSmallLamp11Red()
			TurnOnTransitSmallLamp11()
			wait(2)
			TurnOffTransitSmallLamp11()
			wait(0.5)
			GetTransitSmallLamp11Orange()
			TurnOnTransitSmallLamp11()
		end
		if RandomIndex == 24 then
			TurnOffTransitSmallLamp12()
			wait(2)
			GetTransitSmallLamp12Red()
			TurnOnTransitSmallLamp12()
			wait(2)
			TurnOffTransitSmallLamp12()
			wait(0.5)
			GetTransitSmallLamp12Orange()
			TurnOnTransitSmallLamp12()
		end
	end
end

function OpenFrontTransitDoorsFrontStation()
	TransitFrontDoorOpenSound:Play()
	FrontStationFrontLeftDoorOpen:Play()
	FrontStationFrontRightDoorOpen:Play()
end
function CloseFrontTransitDoorsFrontStation()
	TransitFrontDoorCloseSound:Play()
	FrontStationFrontLeftDoorClose:Play()
	FrontStationFrontRightDoorClose:Play()
end

function OpenFrontTransitDoorsEmergencyStop()
	TransitFrontDoorOpenSound:Play()
	EmergencyStopFrontLeftDoorOpen:Play()
	EmergencyStopFrontRightDoorOpen:Play()
end
function CloseFrontTransitDoorsEmergencyStop()
	TransitFrontDoorCloseSound:Play()
	EmergencyStopFrontLeftDoorClose:Play()
	EmergencyStopFrontRightDoorClose:Play()
end
function OpenBackTransitDoorsEmergencyStop()
	TransitBackDoorOpenSound:Play()
	EmergencyStopBackLeftDoorOpen:Play()
	EmergencyStopBackRightDoorOpen:Play()
end
function CloseBackTransitDoorsEmergencyStop()
	TransitBackDoorCloseSound:Play()
	EmergencyStopBackLeftDoorClose:Play()
	EmergencyStopBackRightDoorClose:Play()
end

function OpenBackTransitDoorsBackStation()
	TransitBackDoorOpenSound:Play()
	BackStationBackLeftDoorOpen:Play()
	BackStationBackRightDoorOpen:Play()
end
function CloseBackTransitDoorsBackStation()
	TransitBackDoorCloseSound:Play()
	BackStationBackLeftDoorClose:Play()
	BackStationBackRightDoorClose:Play()
end

function OpenTransitBlastDoorFrontStation()
	if FrontStationBlastDoorValue.Value == "CLOSED" then
		FrontStationBlastDoorValue.Value = "OPEN"
	end
end
function CloseTransitBlastDoorFrontStation()
	if FrontStationBlastDoorValue.Value == "OPENED" then
		FrontStationBlastDoorValue.Value = "CLOSE"
	end
end

function OpenTransitBlastDoorBackStation()
	if BackStationBlastDoorValue.Value == "CLOSED" then
		BackStationBlastDoorValue.Value = "OPEN"
	end
end
function CloseTransitBlastDoorBackStation()
	if BackStationBlastDoorValue.Value == "OPENED" then
		BackStationBlastDoorValue.Value = "CLOSE"
	end
end

function FrontTransitDoorsMoveToFrontStation()
	FrontLeftDoorMovingToFrontStation:Play()
	FrontRightDoorMovingToFrontStation:Play()
end
function BackTransitDoorsMoveToFrontStation()
	BackLeftDoorMovingToFrontStation:Play()
	BackRightDoorMovingToFrontStation:Play()
end

function FrontTransitDoorsMoveToEmergencyStop()
	FrontLeftDoorMovingToEmergencyStop:Play()
	FrontRightDoorMovingToEmergencyStop:Play()
end
function BackTransitDoorsMoveToEmergencyStop()
	BackLeftDoorMovingToEmergencyStop:Play()
	BackRightDoorMovingToEmergencyStop:Play()
end

function FrontTransitDoorsMoveToBackStation()
	FrontLeftDoorMovingToBackStation:Play()
	FrontRightDoorMovingToBackStation:Play()
end
function BackTransitDoorsMoveToBackStation()
	BackLeftDoorMovingToBackStation:Play()
	BackRightDoorMovingToBackStation:Play()
end

function TransitMoveToFrontStation()
	FrontTransitDoorsMoveToFrontStation()
	TransitMovingToFrontStation:Play()
	BackTransitDoorsMoveToFrontStation()
end

function TransitMoveToEmergencyStop()
	FrontTransitDoorsMoveToEmergencyStop()
	TransitMovingToEmergencyStop:Play()
	BackTransitDoorsMoveToEmergencyStop()
end

function TransitMoveToBackStation()
	FrontTransitDoorsMoveToBackStation()
	TransitMovingToBackStation:Play()
	BackTransitDoorsMoveToBackStation()
end

function BackStationButtonPush1()
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	wait(1)
	FrontDoorTransitButton.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	BackStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
	BackStationButtonFrame.Material = ("Neon")
	BackStationCallAlarmSound:Play()
end
function BackStationButtonPush2()
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	FrontStationButton.ClickDetector.MaxActivationDistance = 10
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	BackStationButtonFrame.Material = ("Plastic")
	FrontStationButtonFrame.Material = ("Neon")
	FrontDoorTransitButton.Material = ("Neon")
	BackDoorTransitButton.Material = ("Neon")
end
function FrontStationButtonPush1()
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	wait(1)
	FrontDoorTransitButton.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	FrontStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
	FrontStationButtonFrame.Material = ("Neon")
	FrontStationCallAlarmSound:Play()
end
function FrontStationButtonPush2()
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 10
	FrontStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	FrontStationButtonFrame.Material = ("Plastic")
	BackStationButtonFrame.Material = ("Neon")
	FrontDoorTransitButton.Material = ("Neon")
	BackDoorTransitButton.Material = ("Neon")
end

function EmergencyStopPush()
	FrontStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	FrontStationButtonFrame.Material = ("Plastic")
	BackStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	BackStationButtonFrame.Material = ("Plastic")
	FrontDoorTransitButton.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	TransitArrivingStationInteriorSound:Play()
	TransitArrivingEmergencyStopSound.TimePosition = 24.1
	TransitArrivingEmergencyStopSound:Play()
	TransitDepartingStationInteriorSound:Stop()
	TransitMotionInteriorSound:Stop()
	FrontStationCallAlarmSound:Stop()
	BackStationCallAlarmSound:Stop()
	FrontStationArrivingSound:Stop()
	BackStationArrivingSound:Stop()
end

function TransitToFrontStationStandardSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	FrontStationButtonPush1()
	TurnOnFrontStationEmergencyStopLamps()
	TurnOnBackStationEmergencyLamps()
	TurnOnBackStationEmergencyStopLamps()
	BackStationGatesValue.Value = "CLOSE"
	CloseBackTransitDoorsBackStation()
	OpenTransitBlastDoorBackStation()
	TransitValue.Value = "DEPARTING"
	TransitDirectionValue.Value = "FRONT STATION"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(1.3)
	BackStationDepartingSound:Play()
	wait(2.7)
	TransitMoveToFrontStation()
	TransitValue.Value = "MOVING"
	wait(2.7)
	EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 10
	FrontStationArrivingSound:Play()
	wait(2)
	CloseTransitBlastDoorBackStation()
	wait(8.5)
	TurnOffBackStationEmergencyLamps()
	TurnOffBackStationEmergencyStopLamps()
	if TransitValue.Value == "MOVING" then
		TransitMotionInteriorSound:Play()
	end
	wait(12.3)
	if TransitValue.Value == "MOVING" then
		EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
		TransitArrivingStationInteriorSound:Play()
		TransitValue.Value = "ARRIVING"
		wait(0.5)
		OpenTransitBlastDoorFrontStation()
		wait(2.5)
		TransitMotionInteriorSound:Stop()
		FrontStationCallAlarmSound:Stop()
		TurnOnFrontStationEmergencyLamps()
		wait(8)
		TransitValue.Value = "ARRIVED"
		CloseTransitBlastDoorFrontStation()
		TurnOffFrontStationEmergencyLamps()
		wait(3)
		OpenFrontTransitDoorsFrontStation()
		wait(2)
		FrontStationGatesValue.Value = "OPEN"
		wait(5)
		TurnOffFrontStationEmergencyStopLamps()
		wait(5)
		FrontStationButtonPush2()
		TransitValue.Value = "FRONT STATION"
	end
end
function TransitToBackStationStandardSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	BackStationButtonPush1()
	TurnOnBackStationEmergencyStopLamps()
	TurnOnFrontStationEmergencyLamps()
	TurnOnFrontStationEmergencyStopLamps()
	FrontStationGatesValue.Value = "CLOSE"
	CloseFrontTransitDoorsFrontStation()
	OpenTransitBlastDoorFrontStation()
	TransitValue.Value = "DEPARTING"
	TransitDirectionValue.Value = "BACK STATION"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(1.3)
	FrontStationDepartingSound:Play()
	wait(2.7)
	TransitMoveToBackStation()
	TransitValue.Value = "MOVING"
	wait(2.7)
	EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 10
	BackStationArrivingSound:Play()
	wait(2)
	CloseTransitBlastDoorFrontStation()
	wait(8.5)
	TurnOffFrontStationEmergencyLamps()
	TurnOffFrontStationEmergencyStopLamps()
	if TransitValue.Value == "MOVING" then
		TransitMotionInteriorSound:Play()
	end
	wait(12.3)
	if TransitValue.Value == "MOVING" then
		EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
		TransitArrivingStationInteriorSound:Play()
		TransitValue.Value = "ARRIVING"
		wait(0.5)
		OpenTransitBlastDoorBackStation()
		wait(2.5)
		TransitMotionInteriorSound:Stop()
		BackStationCallAlarmSound:Stop()
		TurnOnBackStationEmergencyLamps()
		wait(8)
		TransitValue.Value = "ARRIVED"
		CloseTransitBlastDoorBackStation()
		TurnOffBackStationEmergencyLamps()
		wait(3)
		OpenBackTransitDoorsBackStation()
		wait(2)
		BackStationGatesValue.Value = "OPEN"
		wait(5)
		TurnOffBackStationEmergencyStopLamps()
		wait(5)
		BackStationButtonPush2()
		TransitValue.Value = "BACK STATION"
	end
end

function TransitToFrontStationESSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	TurnOffTransitSmallLamps()
	GetTransitSmallLampsOrange()
	TurnOffAlarms()
	wait(0.5)
	TurnOnTransitSmallLamps()
	CloseBackTransitDoorsEmergencyStop()
	CloseFrontTransitDoorsEmergencyStop()
	if BackStationBlastDoorValue.Value == "OPENED" then
		BackStationBlastDoorValue.Value = "CLOSE"
	end
	if BackStationGatesValue.Value == "OPENED" then
		BackStationGatesValue.Value = "CLOSE"
	end
	if FrontStationBlastDoorValue.Value == "OPENED" then
		FrontStationBlastDoorValue.Value = "CLOSE"
	end
	if FrontStationGatesValue.Value == "OPENED" then
		FrontStationGatesValue.Value = "CLOSE"
	end
	BackStationGateLamps1.BrickColor = BrickColor.new("Bright green")
	BackStationGateLamps2.BrickColor = BrickColor.new("Bright green")
	FrontStationGateLamps1.BrickColor = BrickColor.new("Bright green")
	FrontStationGateLamps2.BrickColor = BrickColor.new("Bright green")
	wait(7)
	TurnOnTransitLamps()
	TurnOffBackStationEmergencyLamps()
	TurnOffBackStationEmergencyStopLamps()
	TurnOffFrontStationEmergencyLamps()
	TurnOnFrontStationEmergencyStopLamps()
	TransitValue.Value = "MOVING"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(4)
	TransitMoveToFrontStation()
	wait(2.7)
	FrontStationArrivingSound:Play()
	wait(2)
	CloseTransitBlastDoorBackStation()
	wait(8.5)
	TransitMotionInteriorSound:Play()
	wait(10.3)
	OpenTransitBlastDoorFrontStation()
	wait(2)
	TransitArrivingStationInteriorSound:Play()
	TransitValue.Value = "ARRIVING"
	wait(3)
	TransitMotionInteriorSound:Stop()
	FrontStationCallAlarmSound:Stop()
	TurnOnFrontStationEmergencyLamps()
	wait(8)
	TransitValue.Value = "ARRIVED"
	CloseTransitBlastDoorFrontStation()
	TurnOffFrontStationEmergencyLamps()
	wait(3)
	OpenFrontTransitDoorsFrontStation()
	wait(2)
	FrontStationGatesValue.Value = "OPEN"
	wait(5)
	TurnOffFrontStationEmergencyStopLamps()
	wait(5)
	FrontStationButtonPush2()
	TransitValue.Value = "FRONT STATION"
end
function EmergencyStopSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	EmergencyStopPush()
	TransitValue.Value = "EMERGENCY STOP"
	TurnOnBoopAlarms()
	TurnOffTransitLamps()
	TurnOffTransitSmallLamps()
	TransitMoveToEmergencyStop()
	wait(8)
	GetTransitSmallLampsRed()
	TurnOnTransitSmallLamps()
	TurnOnLongAlarms()
	wait(1)
	OpenFrontTransitDoorsEmergencyStop()
	OpenBackTransitDoorsEmergencyStop()
	TurnOnFrontStationEmergencyLamps()
	TurnOnFrontStationEmergencyStopLamps()
	TurnOnBackStationEmergencyLamps()
	TurnOnBackStationEmergencyStopLamps()
	FrontStationBlastDoorValue.Value = "OPEN"
	FrontStationGatesValue.Value = "OPEN"
	BackStationBlastDoorValue.Value = "OPEN"
	BackStationGatesValue.Value = "OPEN"
	FrontStationGateLamps1.BrickColor = BrickColor.new("Really red")
	FrontStationGateLamps2.BrickColor = BrickColor.new("Really red")
	BackStationGateLamps1.BrickColor = BrickColor.new("Really red")
	BackStationGateLamps2.BrickColor = BrickColor.new("Really red")
	wait(10)
	EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 10
	TransitValue.Value = "EMERGENCY STOPPED"
end
function TransitToBackStationESSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	TurnOffTransitSmallLamps()
	GetTransitSmallLampsOrange()
	TurnOffAlarms()
	wait(0.5)
	TurnOnTransitSmallLamps()
	CloseFrontTransitDoorsEmergencyStop()
	CloseBackTransitDoorsEmergencyStop()
	if FrontStationBlastDoorValue.Value == "OPENED" then
		FrontStationBlastDoorValue.Value = "CLOSE"
	end
	if FrontStationGatesValue.Value == "OPENED" then
		FrontStationGatesValue.Value = "CLOSE"
	end
	if BackStationBlastDoorValue.Value == "OPENED" then
		BackStationBlastDoorValue.Value = "CLOSE"
	end
	if BackStationGatesValue.Value == "OPENED" then
		BackStationGatesValue.Value = "CLOSE"
	end
	FrontStationGateLamps1.BrickColor = BrickColor.new("Bright green")
	FrontStationGateLamps2.BrickColor = BrickColor.new("Bright green")
	BackStationGateLamps1.BrickColor = BrickColor.new("Bright green")
	BackStationGateLamps2.BrickColor = BrickColor.new("Bright green")
	wait(7)
	TurnOnTransitLamps()
	TurnOffFrontStationEmergencyLamps()
	TurnOffFrontStationEmergencyStopLamps()
	TurnOffBackStationEmergencyLamps()
	TurnOnBackStationEmergencyStopLamps()
	TransitValue.Value = "MOVING"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(4)
	TransitMoveToBackStation()
	wait(2.7)
	BackStationArrivingSound:Play()
	wait(2)
	CloseTransitBlastDoorFrontStation()
	wait(8.5)
	TransitMotionInteriorSound:Play()
	wait(10.3)
	OpenTransitBlastDoorBackStation()
	wait(2)
	TransitArrivingStationInteriorSound:Play()
	TransitValue.Value = "ARRIVING"
	wait(3)
	TransitMotionInteriorSound:Stop()
	BackStationCallAlarmSound:Stop()
	TurnOnBackStationEmergencyLamps()
	wait(8)
	TransitValue.Value = "ARRIVED"
	CloseTransitBlastDoorBackStation()
	TurnOffBackStationEmergencyLamps()
	wait(3)
	OpenBackTransitDoorsBackStation()
	wait(2)
	BackStationGatesValue.Value = "OPEN"
	wait(5)
	TurnOffBackStationEmergencyStopLamps()
	wait(5)
	BackStationButtonPush2()
	TransitValue.Value = "BACK STATION"
end

function TransitParkingFromFrontStationSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	FrontStationButtonFrame.Material = ("Plastic")
	BackStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	BackStationButtonFrame.Material = ("Plastic")
	FrontDoorTransitButton.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	FrontStationGateLamps1.BrickColor = BrickColor.new("Really red")
	FrontStationGateLamps2.BrickColor = BrickColor.new("Really red")
	BackStationGateLamps1.BrickColor = BrickColor.new("Really red")
	BackStationGateLamps2.BrickColor = BrickColor.new("Really red")
	TransitValue.Value = "PARKING"
	TurnOffTransitLamps()
	TurnOffTransitSmallLamps()

	TurnOnFrontStationEmergencyLamps()
	TurnOnFrontStationEmergencyStopLamps()
	FrontStationGatesValue.Value = "CLOSE"
	CloseFrontTransitDoorsFrontStation()
	OpenTransitBlastDoorFrontStation()
	TransitDirectionValue.Value = "FRONT STATION"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(1.3)
	FrontStationDepartingSound:Play()
	wait(2.7)
	TransitMoveToBackStation()
	wait(4.7)
	CloseTransitBlastDoorFrontStation()
	wait(8.5)
	TurnOffFrontStationEmergencyLamps()
	TurnOffFrontStationEmergencyStopLamps()
	TransitMoveToEmergencyStop()
	EmergencyStopPush()
	wait(8)
	TransitInteriorAmbient:Stop()
	wait(20)
	TransitValue.Value = "PARKING MODE"
end
function TransitParkingFromEmergencySequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
	CloseFrontTransitDoorsEmergencyStop()
	CloseBackTransitDoorsEmergencyStop()
	if FrontStationBlastDoorValue.Value == "OPENED" then
		FrontStationBlastDoorValue.Value = "CLOSE"
	end
	if FrontStationGatesValue.Value == "OPENED" then
		FrontStationGatesValue.Value = "CLOSE"
	end
	if BackStationBlastDoorValue.Value == "OPENED" then
		BackStationBlastDoorValue.Value = "CLOSE"
	end
	if BackStationGatesValue.Value == "OPENED" then
		BackStationGatesValue.Value = "CLOSE"
	end
	wait(7)
	TurnOffTransitLamps()
	TurnOffTransitSmallLamps()
	TurnOffFrontStationEmergencyLamps()
	TurnOffFrontStationEmergencyStopLamps()
	TurnOffBackStationEmergencyLamps()
	TurnOffBackStationEmergencyStopLamps()
	TurnOffAlarms()
	TransitInteriorAmbient:Stop()
	TransitValue.Value = "PARKING MODE"
end
function TransitParkingFromBackStationSequence()
	TransitValue.Value = "SEQUENCE ACTIVATED"
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	BackStationButtonFrame.Material = ("Plastic")
	FrontStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	FrontStationButtonFrame.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	FrontDoorTransitButton.Material = ("Plastic")
	BackStationGateLamps1.BrickColor = BrickColor.new("Really red")
	BackStationGateLamps2.BrickColor = BrickColor.new("Really red")
	FrontStationGateLamps1.BrickColor = BrickColor.new("Really red")
	FrontStationGateLamps2.BrickColor = BrickColor.new("Really red")
	TransitValue.Value = "PARKING"
	TurnOffTransitLamps()
	TurnOffTransitSmallLamps()

	TurnOnBackStationEmergencyLamps()
	TurnOnBackStationEmergencyStopLamps()
	BackStationGatesValue.Value = "CLOSE"
	CloseBackTransitDoorsBackStation()
	OpenTransitBlastDoorBackStation()
	TransitDirectionValue.Value = "BACK STATION"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(1.3)
	BackStationDepartingSound:Play()
	wait(2.7)
	TransitMoveToFrontStation()
	wait(4.7)
	CloseTransitBlastDoorBackStation()
	wait(8.5)
	TurnOffBackStationEmergencyLamps()
	TurnOffBackStationEmergencyStopLamps()
	TransitMoveToEmergencyStop()
	EmergencyStopPush()
	wait(8)
	TransitArrivingStationInteriorSound:Play()
	wait(20)
	TransitInteriorAmbient:Stop()
	TransitValue.Value = "PARKING MODE"
end
--

FacilityTransitSystemStatusValue.Changed:Connect(function()
	if FacilityTransitSystemStatusValue.Value == "OFFLINE" then
		if TransitValue.Value == "FRONT STATION" then
			TransitParkingFromFrontStationSequence()
		end
		if TransitValue.Value == "EMERGENCY STOPPED" then
			TransitParkingFromEmergencySequence()
		end
		if TransitValue.Value == "BACK STATION" then
			TransitParkingFromBackStationSequence()
		end
	end
	if FacilityTransitSystemStatusValue.Value == "ONLINE" then
		wait(15)
		if TransitDirectionValue.Value == "FRONT STATION" then
			TransitToFrontStationESSequence()
		end
		if TransitDirectionValue.Value == "BACK STATION" then
			TransitToBackStationESSequence()
		end
	end
end)

TransitValue.Changed:Connect(function()
	if TransitValue.Value == "MOVING" then
		repeat
			GetRandomTransitLampGlitch()
			GetRandomTransitSmallLampGlitch()
			wait(0.1)
		until TransitValue.Value == "ARRIVING" or TransitValue.Value == "EMERGENCY STOP"
	end
end)

EmergencyStopTrigger.ClickDetector.MouseClick:Connect(function()
	EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
	if TransitValue.Value == "EMERGENCY STOPPED" then
		if TransitDirectionValue.Value == "FRONT STATION" then
			TransitToFrontStationESSequence()
		end
		if TransitDirectionValue.Value == "BACK STATION" then
			TransitToBackStationESSequence()
		end
	end
	if TransitValue.Value == "MOVING" then
		EmergencyStopSequence()
	end
end)

EmergencyStopTrigger.ClickDetector.MouseClick:Connect(function()
	if TransitValue.Value == "MOVING" then
		wait(8)
		repeat
			TransitMessage1:Play()
			FrontStationTransitMessage1:Play()
			BackStationTransitMessage1:Play()
			wait(15)
			TransitMessage2:Play()
			FrontStationTransitMessage2:Play()
			BackStationTransitMessage2:Play()
			wait(15)
		until TransitValue.Value == "MOVING" or TransitValue.Value == "PARKING MODE"
	end
end)

BackStationButton.ClickDetector.MouseClick:Connect(function()
	BackStationCallButtonSound:Play()
	TransitToBackStationStandardSequence()
end)
FrontStationButton.ClickDetector.MouseClick:Connect(function()
	FrontStationCallButtonSound:Play()
	TransitToFrontStationStandardSequence()
end)

FrontDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	FrontDoorTransitCallButtonSound:Play()
	if TransitValue.Value == "FRONT STATION" then
		TransitToBackStationStandardSequence()
	end
end)
FrontDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	FrontDoorTransitCallButtonSound:Play()
	if TransitValue.Value == "BACK STATION" then
		TransitToFrontStationStandardSequence()
	end
end)

BackDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	BackDoorTransitCallButtonSound:Play()
	if TransitValue.Value == "FRONT STATION" then
		TransitToBackStationStandardSequence()
	end
end)
BackDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	BackDoorTransitCallButtonSound:Play()
	if TransitValue.Value == "BACK STATION" then
		TransitToFrontStationStandardSequence()
	end
end)
