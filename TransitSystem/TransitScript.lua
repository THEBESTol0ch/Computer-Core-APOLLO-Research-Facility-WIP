-- Control
local TweenService = game:GetService("TweenService")

local Transit = script.Parent.Parent.Parent.Transit
local Interior = Transit.Interior

local EmergencyStopTrigger = Interior.EmergencyStopTrigger
--

-- Values
local Values = script.Parent.Parent.Values
local TransitStatusValue = Values.TransitStatusValue
local TransitCurrentStationValue = Values.TransitCurrentStationValue
local TransitTargetStationValue = Values.TransitTargetStationValue
local FacilityTransitSystemControlValue = script.Parent.Parent.Parent.Parent.CPU.Values.FacilityTransitSystemControlValue
local FacilityTransitSystemStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.FacilityTransitSystemStatusValue
local TransitLightingModeValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitLightingModeValue

local FrontStationBlastDoorValue = script.Parent.Parent.Parent.Station_FRONT.TransitBlastDoor.CPU.Values.TransitBlastDoorValue
local BackStationBlastDoorValue = script.Parent.Parent.Parent.Station_BACK.TransitBlastDoor.CPU.Values.TransitBlastDoorValue
local FrontStationGatesValue = script.Parent.Parent.Parent.Station_FRONT.TransitStationGates.CPU.Values.TransitStationGatesValue
local BackStationGatesValue = script.Parent.Parent.Parent.Station_BACK.TransitStationGates.CPU.Values.TransitStationGatesValue
--

-- Items
local TransitPrimaryPart = Transit.TransitPrimaryPart
local FrontLeftDoor = script.Parent.Parent.Parent.Transit.Interior.FRONT_Door.LeftDoor
local FrontRightDoor = script.Parent.Parent.Parent.Transit.Interior.FRONT_Door.RightDoor
local BackLeftDoor = script.Parent.Parent.Parent.Transit.Interior.BACK_Door.LeftDoor
local BackRightDoor = script.Parent.Parent.Parent.Transit.Interior.BACK_Door.RightDoor

local TransitLamps = Interior.TransitLamps
local TransitSmallLamps = Interior.TransitSmallLamps

local WeldTrigger = Interior.WeldTrigger

local TransitEmergencyStopPos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.TransitPos
local EmergencyStopFrontLeftDoorClosePos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.FRONT_LeftDoorClosePos
local EmergencyStopFrontRightDoorClosePos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.FRONT_RightDoorClosePos
local EmergencyStopFrontLeftDoorOpenPos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.FRONT_LeftDoorOpenPos
local EmergencyStopFrontRightDoorOpenPos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.FRONT_RightDoorOpenPos
local EmergencyStopBackLeftDoorOpenPos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.BACK_LeftDoorOpenPos
local EmergencyStopBackRightDoorOpenPos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.BACK_RightDoorOpenPos
local EmergencyStopBackLeftDoorClosePos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.BACK_LeftDoorClosePos
local EmergencyStopBackRightDoorClosePos = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.BACK_RightDoorClosePos

local FrontStationEmergencyLamps = script.Parent.Parent.Parent.Station_FRONT.EmergencyLamps.EmergencyLamps
local FrontStationEmergencyStopLamps = script.Parent.Parent.Parent.Station_FRONT.EmergencyLamps.EmergencyStopLamps
local BackStationEmergencyLamps = script.Parent.Parent.Parent.Station_BACK.EmergencyLamps.EmergencyLamps
local BackStationEmergencyStopLamps = script.Parent.Parent.Parent.Station_BACK.EmergencyLamps.EmergencyStopLamps

local FrontStationGateLamps1 = script.Parent.Parent.Parent.Station_FRONT.TransitStationGates.LeftGate.Frame.Lamps
local FrontStationGateLamps2 = script.Parent.Parent.Parent.Station_FRONT.TransitStationGates.RightGate.Frame.Lamps
local BackStationGateLamps1 = script.Parent.Parent.Parent.Station_BACK.TransitStationGates.LeftGate.Frame.Lamps
local BackStationGateLamps2 = script.Parent.Parent.Parent.Station_BACK.TransitStationGates.RightGate.Frame.Lamps
--

-- Sounds
local TransitBoopAlarmSound = Transit.SoundEmitter.BoopAlarmSound
local TransitLongAlarmSound = Transit.SoundEmitter.LongAlarmSound
local TransitArrivingStationInteriorSound = Transit.SoundEmitter.TransitArrivingStationInteriorSound
local TransitDepartingStationInteriorSound = Transit.SoundEmitter.TransitDepartingStationInteriorSound
local TransitInteriorAmbient = Transit.SoundEmitter.TransitInteriorAmbient
local TransitMessage1 = Transit.SoundEmitter.TransitMessage1
local TransitMessage2 = Transit.SoundEmitter.TransitMessage2
local TransitMotionInteriorSound = Transit.SoundEmitter.TransitMotionInteriorSound

local TransitArrivingEmergencyStopSound = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.TransitPos.TransitStationArrivingSound
local TransitDepartingEmergencyStopSound = script.Parent.Parent.Parent.Station_MIDDLE.TransitPositions.TransitPos.TransitStationDepartingSound

local FrontStationBoopAlarmSound = script.Parent.Parent.Parent.Station_FRONT.ConsoleSpeaker.SoundEmitter.BoopAlarmSound
local BackStationBoopAlarmSound = script.Parent.Parent.Parent.Station_BACK.ConsoleSpeaker.SoundEmitter.BoopAlarmSound
local FrontStationLongAlarmSound = script.Parent.Parent.Parent.Station_FRONT.ConsoleSpeaker.SoundEmitter.LongAlarmSound
local BackStationLongAlarmSound = script.Parent.Parent.Parent.Station_BACK.ConsoleSpeaker.SoundEmitter.LongAlarmSound

local TransitFrontDoorOpenSound = script.Parent.Parent.Parent.Transit.Interior.FRONT_Door.SoundEmitter.TransitDoorOpenSound
local TransitFrontDoorCloseSound = script.Parent.Parent.Parent.Transit.Interior.FRONT_Door.SoundEmitter.TransitDoorCloseSound
local TransitBackDoorOpenSound = script.Parent.Parent.Parent.Transit.Interior.BACK_Door.SoundEmitter.TransitDoorOpenSound
local TransitBackDoorCloseSound = script.Parent.Parent.Parent.Transit.Interior.BACK_Door.SoundEmitter.TransitDoorCloseSound

local FrontStationTransitMessage1 = script.Parent.Parent.Parent.Station_FRONT.ConsoleSpeaker.SoundEmitter.TransitMessage1
local FrontStationTransitMessage2 = script.Parent.Parent.Parent.Station_FRONT.ConsoleSpeaker.SoundEmitter.TransitMessage2
local BackStationTransitMessage1 = script.Parent.Parent.Parent.Station_BACK.ConsoleSpeaker.SoundEmitter.TransitMessage1
local BackStationTransitMessage2 = script.Parent.Parent.Parent.Station_BACK.ConsoleSpeaker.SoundEmitter.TransitMessage2

local FrontStationAlarmSound = script.Parent.Parent.Parent.Station_FRONT.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound
local BackStationAlarmSound = script.Parent.Parent.Parent.Station_BACK.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound
local FrontStationCallAlarmSound = script.Parent.Parent.Parent.Station_FRONT.ConsoleSpeaker.SoundEmitter.TransitStationCallAlarmSound
local BackStationCallAlarmSound = script.Parent.Parent.Parent.Station_BACK.ConsoleSpeaker.SoundEmitter.TransitStationCallAlarmSound

local FrontStationArrivingSound = script.Parent.Parent.Parent.Station_FRONT.TransitPositions.TransitPos.TransitStationArrivingSound
local BackStationArrivingSound = script.Parent.Parent.Parent.Station_BACK.TransitPositions.TransitPos.TransitStationArrivingSound
--

-- Logic
local CanEvent = true
local BufferTargetStationValue = nil
--

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

local TransitMoveToEmergencyStop = {
	CFrame = TransitEmergencyStopPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontLeftDoorMoveToEmergencyStop = {
	CFrame = EmergencyStopFrontLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FrontRightDoorMoveToEmergencyStop = {
	CFrame = EmergencyStopFrontRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackLeftDoorMoveToEmergencyStop = {
	CFrame = EmergencyStopBackLeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BackRightDoorMoveToEmergencyStop = {
	CFrame = EmergencyStopBackRightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
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

local TransitMoveToEmergencyStop = TweenService:Create(TransitPrimaryPart, TransitEmergencyStopAnimationSettings, TransitMoveToEmergencyStop)
local FrontLeftDoorMoveToEmergencyStop = TweenService:Create(FrontLeftDoor, TransitEmergencyStopAnimationSettings, FrontLeftDoorMoveToEmergencyStop)
local FrontRightDoorMoveToEmergencyStop = TweenService:Create(FrontRightDoor, TransitEmergencyStopAnimationSettings, FrontRightDoorMoveToEmergencyStop)
local BackLeftDoorMoveToEmergencyStop = TweenService:Create(BackLeftDoor, TransitEmergencyStopAnimationSettings, BackLeftDoorMoveToEmergencyStop)
local BackRightDoorMoveToEmergencyStop = TweenService:Create(BackRightDoor, TransitEmergencyStopAnimationSettings, BackRightDoorMoveToEmergencyStop)

local EmergencyStopFrontLeftDoorOpen = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, EmergencyStopFrontLeftDoorOpen)
local EmergencyStopFrontRightDoorOpen = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, EmergencyStopFrontRightDoorOpen)
local EmergencyStopBackLeftDoorOpen = TweenService:Create(BackLeftDoor, TransitDoorAnimationSettings, EmergencyStopBackLeftDoorOpen)
local EmergencyStopBackRightDoorOpen = TweenService:Create(BackRightDoor, TransitDoorAnimationSettings, EmergencyStopBackRightDoorOpen)
local EmergencyStopFrontLeftDoorClose = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, EmergencyStopFrontLeftDoorClose)
local EmergencyStopFrontRightDoorClose = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, EmergencyStopFrontRightDoorClose)
local EmergencyStopBackLeftDoorClose = TweenService:Create(BackLeftDoor, TransitDoorAnimationSettings, EmergencyStopBackLeftDoorClose)
local EmergencyStopBackRightDoorClose = TweenService:Create(BackRightDoor, TransitDoorAnimationSettings, EmergencyStopBackRightDoorClose)

-- Functions
function DoStationEmergencyLamps(Mode, Station)
	if Mode == "ON" then
		for _, Object in pairs(Station:GetChildren()) do
			Object.Lamp.SpotLight.Enabled = true
			Object.Lamp.HingeConstraint.AngularVelocity = 5
		end
	elseif Mode == "OFF" then
		for _, Object in pairs(Station:GetChildren()) do
			Object.Lamp.SpotLight.Enabled = false
			Object.Lamp.HingeConstraint.AngularVelocity = 0
		end
	end
end

function DoStationBlastDoor(Mode, Station)
	if Mode == "OPEN" then
		if Station == "FRONT" and FrontStationBlastDoorValue.Value == "CLOSED" then
			FrontStationBlastDoorValue.Value = "OPEN"
		elseif Station == "BACK" and BackStationBlastDoorValue.Value == "CLOSED" then
			BackStationBlastDoorValue.Value = "OPEN"
		end
	elseif Mode == "CLOSE" then
		if Station == "FRONT" and FrontStationBlastDoorValue.Value == "OPENED" then
			FrontStationBlastDoorValue.Value = "CLOSE"
		elseif Station == "BACK" and BackStationBlastDoorValue.Value == "OPENED" then
			BackStationBlastDoorValue.Value = "CLOSE"
		end
	end
end

function DoStationGates(Mode, Station)
	if Mode == "OPEN" then
		if Station == "FRONT" and FrontStationGatesValue.Value == "CLOSED" then
			FrontStationGatesValue.Value = "OPEN"
		elseif Station == "BACK" and BackStationGatesValue.Value == "CLOSED" then
			BackStationGatesValue.Value = "OPEN"
		end
	elseif Mode == "CLOSE" then
		if Station == "FRONT" and FrontStationGatesValue.Value == "OPENED" then
			FrontStationGatesValue.Value = "CLOSE"
		elseif Station == "BACK" and BackStationGatesValue.Value == "OPENED" then
			BackStationGatesValue.Value = "CLOSE"
		end
	end
end

function GetRandomTransitLampGlitch()
	local RandomIndex = math.random(1, 2)
	if TransitLightingModeValue.Value == "STANDARD" then
		if RandomIndex == 1 then
			local Lamp = TransitLamps["TransitLamp"..math.random(1, 4)]
			for Count = 0, 3, 1 do
				if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
					Lamp.Lamp.Material = ("Metal")
					Lamp.LightEmitter.SpotLight.Enabled = false
				end
				wait(math.random(1, 10) / 10)
				if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
					Lamp.Lamp.Material = ("Neon")
					Lamp.LightEmitter.SpotLight.Enabled = true
				end
				wait(math.random(1, 10) / 10)
			end
		elseif RandomIndex == 2 then
			local Lamp = TransitLamps["TransitLamp"..math.random(1, 4)]
			if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
				Lamp.Lamp.Material = ("Metal")
				Lamp.LightEmitter.SpotLight.Enabled = false
			end
			wait(math.random(1, 2))
			if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
				Lamp.Lamp.Color = Color3.fromRGB(255, 0, 0)
				Lamp.LightEmitter.SpotLight.Color = Color3.new(1, 0, 0)
				Lamp.Lamp.Material = ("Neon")
				Lamp.LightEmitter.SpotLight.Enabled = true
			end
			wait(math.random(1, 2))
			if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
				Lamp.Lamp.Material = ("Metal")
				Lamp.LightEmitter.SpotLight.Enabled = false
			end
			wait(math.random(1, 10) / 10)
			if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
				Lamp.Lamp.Color = Color3.fromRGB(248, 248, 248)
				Lamp.LightEmitter.SpotLight.Color = Color3.fromRGB(255, 222, 156)
				Lamp.Lamp.Material = ("Neon")
				Lamp.LightEmitter.SpotLight.Enabled = true
			end
		end
	end
end
function GetRandomTransitSmallLampGlitch()
	local RandomIndex = math.random(1, 2)
	if TransitLightingModeValue.Value == "STANDARD" then
		if RandomIndex == 1 then
			local Lamp = TransitSmallLamps["TransitSmallLamp"..math.random(1, 12)].Lamp
			for Count = 0, 3, 1 do
				Lamp.Material = ("Metal")
				Lamp.PointLight.Enabled = false
				wait(math.random(1, 10) / 10)
				Lamp.Material = ("Neon")
				Lamp.PointLight.Enabled = true
				wait(math.random(1, 10) / 10)
			end
		elseif RandomIndex == 2 then
			local Lamp = TransitSmallLamps["TransitSmallLamp"..math.random(1, 12)].Lamp
			Lamp.Material = ("Metal")
			Lamp.PointLight.Enabled = false
			wait(math.random(1, 2))
			Lamp.Color = Color3.fromRGB(255, 0, 0)
			Lamp.PointLight.Color = Color3.fromRGB(255, 0, 0)
			Lamp.Material = ("Neon")
			Lamp.PointLight.Enabled = true
			wait(math.random(1, 2))
			Lamp.Material = ("Metal")
			Lamp.PointLight.Enabled = false
			wait(math.random(1, 10) / 10)
			Lamp.Color = Color3.fromRGB(188, 155, 93)
			Lamp.PointLight.Color = Color3.fromRGB(163, 95, 0)
			Lamp.Material = ("Neon")
			Lamp.PointLight.Enabled = true
		end
	end
end

function DoTransitLamps(Mode, Color)
	if Mode == "ON" then
		for _, TransitLamp in pairs(TransitLamps:GetChildren()) do
			TransitLamp.Lamp.Material = ("Neon")
			TransitLamp.LightEmitter.SpotLight.Enabled = true
		end
	elseif Mode == "OFF" then
		for _, TransitLamp in pairs(TransitLamps:GetChildren()) do
			TransitLamp.Lamp.Material = ("Metal")
			TransitLamp.LightEmitter.SpotLight.Enabled = false
		end
	elseif Mode == "PAINT" then
		if Color == "White" then
			for _, TransitLamp in pairs(TransitLamps:GetChildren()) do
				TransitLamp.Lamp.Color = Color3.fromRGB(248, 248, 248)
				TransitLamp.LightEmitter.SpotLight.Color = Color3.fromRGB(255, 222, 156)
			end
		elseif Color == "Red" then
			for _, TransitLamp in pairs(TransitLamps:GetChildren()) do
				TransitLamp.Lamp.Color = Color3.fromRGB(255, 0, 0)
				TransitLamp.LightEmitter.SpotLight.Color = Color3.new(1, 0, 0)
			end
		end
	end
end
function DoTransitSmallLamps(Mode, Color)
	if Mode == "ON" then
		for _, TransitSmallLamp in pairs(TransitSmallLamps:GetChildren()) do
			TransitSmallLamp.Lamp.Material = ("Neon")
			TransitSmallLamp.Lamp.PointLight.Enabled = true
		end
	elseif Mode == "OFF" then
		for _, TransitSmallLamp in pairs(TransitSmallLamps:GetChildren()) do
			TransitSmallLamp.Lamp.Material = ("Metal")
			TransitSmallLamp.Lamp.PointLight.Enabled = false
		end
	elseif Mode == "PAINT" then
		if Color == "Orange" then
			for _, TransitSmallLamp in pairs(TransitSmallLamps:GetChildren()) do
				TransitSmallLamp.Lamp.Color = Color3.fromRGB(188, 155, 93)
				TransitSmallLamp.Lamp.PointLight.Color = Color3.fromRGB(163, 95, 0)
			end
		elseif Color == "Red" then
			for _, TransitSmallLamp in pairs(TransitSmallLamps:GetChildren()) do
				TransitSmallLamp.Lamp.Color = Color3.fromRGB(255, 0, 0)
				TransitSmallLamp.Lamp.PointLight.Color = Color3.fromRGB(255, 0, 0)
			end
		end
	end
end

function DoBoopAlarms(Mode)
	if Mode == "ON" then
		TransitBoopAlarmSound:Play()
		FrontStationBoopAlarmSound:Play()
		BackStationBoopAlarmSound:Play()
	elseif Mode == "OFF" then
		TransitBoopAlarmSound.Looped = false
		FrontStationBoopAlarmSound.Looped = false
		BackStationBoopAlarmSound.Looped = false
		wait(1.5)
		TransitBoopAlarmSound:Stop()
		FrontStationBoopAlarmSound:Stop()
		BackStationBoopAlarmSound:Stop()
	end
end
function DoLongAlarms(Mode)
	if Mode == "ON" then
		TransitLongAlarmSound:Play()
		FrontStationLongAlarmSound:Play()
		BackStationLongAlarmSound:Play()
	elseif Mode == "OFF" then
		TransitLongAlarmSound.Looped = false
		FrontStationLongAlarmSound.Looped = false
		BackStationLongAlarmSound.Looped = false
		wait(2.5)
		TransitLongAlarmSound:Stop()
		FrontStationLongAlarmSound:Stop()
		BackStationLongAlarmSound:Stop()
	end
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

function DoTransitDoorsEmergencyStop(Mode)
	if Mode == "OPEN" then
		TransitFrontDoorOpenSound:Play()
		EmergencyStopFrontLeftDoorOpen:Play()
		EmergencyStopFrontRightDoorOpen:Play()
		
		TransitBackDoorOpenSound:Play()
		EmergencyStopBackLeftDoorOpen:Play()
		EmergencyStopBackRightDoorOpen:Play()
	elseif Mode == "CLOSE" then
		TransitFrontDoorCloseSound:Play()
		EmergencyStopFrontLeftDoorClose:Play()
		EmergencyStopFrontRightDoorClose:Play()
		
		TransitBackDoorCloseSound:Play()
		EmergencyStopBackLeftDoorClose:Play()
		EmergencyStopBackRightDoorClose:Play()
	end
end

function StandardSequence(EmergencyStopped)
	local CurrentPath = script.Parent.Parent.Parent["Station_"..TransitCurrentStationValue.Value]
	local TargetPath = script.Parent.Parent.Parent["Station_"..TransitTargetStationValue.Value]
	if EmergencyStopped == false then
		DoStationEmergencyLamps("ON", CurrentPath.EmergencyLamps.EmergencyLamps)
		DoStationEmergencyLamps("ON", CurrentPath.EmergencyLamps.EmergencyStopLamps)
		if not (FacilityTransitSystemStatusValue.Value == "SHUT DOWN") then
			DoStationEmergencyLamps("ON", TargetPath.EmergencyLamps.EmergencyStopLamps)
			TargetPath.ConsoleSpeaker.SoundEmitter.TransitStationCallAlarmSound:Play()
		end
		CurrentPath.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound:Play()
		CurrentPath.TransitStationGates.CPU.Values.TransitStationGatesValue.Value = "CLOSE"
		Interior[TransitCurrentStationValue.Value.."_Door"].SoundEmitter.TransitDoorCloseSound:Play()
		TweenService:Create(Interior[TransitCurrentStationValue.Value.."_Door"].LeftDoor, TransitDoorAnimationSettings, { CFrame = CurrentPath.TransitPositions[TransitCurrentStationValue.Value.."_LeftDoorClosePos"].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Interior[TransitCurrentStationValue.Value.."_Door"].RightDoor, TransitDoorAnimationSettings, { CFrame = CurrentPath.TransitPositions[TransitCurrentStationValue.Value.."_RightDoorClosePos"].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		DoStationBlastDoor("OPEN", TransitCurrentStationValue.Value)
	elseif EmergencyStopped == true then
		DoStationEmergencyLamps("ON", TargetPath.EmergencyLamps.EmergencyStopLamps)
	end
	TransitStatusValue.Value = "DEPARTING"
	wait(4)
	TransitDepartingStationInteriorSound:Play()
	wait(1.3)
	if EmergencyStopped == false then
		CurrentPath.TransitPositions.TransitPos.TransitStationDepartingSound:Play()
	elseif EmergencyStopped == true then
		TransitDepartingEmergencyStopSound:Play()
	end
	wait(2.7)
	TweenService:Create(TransitPrimaryPart, TransitAnimationSettings, { CFrame = TargetPath.TransitPositions.TransitPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Interior.FRONT_Door.LeftDoor, TransitAnimationSettings, { CFrame = TargetPath.TransitPositions.FRONT_LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Interior.FRONT_Door.RightDoor, TransitAnimationSettings, { CFrame = TargetPath.TransitPositions.FRONT_RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Interior.BACK_Door.LeftDoor, TransitAnimationSettings, { CFrame = TargetPath.TransitPositions.BACK_LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TweenService:Create(Interior.BACK_Door.RightDoor, TransitAnimationSettings, { CFrame = TargetPath.TransitPositions.BACK_RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	TransitStatusValue.Value = "MOVING"
	wait(2.7)
	if CanEvent == true and FacilityTransitSystemStatusValue.Value == "ONLINE" then
		EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 10
	end
	TargetPath.TransitPositions.TransitPos.TransitStationArrivingSound:Play()
	wait(2)
	DoStationBlastDoor("CLOSE", TransitCurrentStationValue.Value)
	wait(8.5)
	if TransitStatusValue.Value == "MOVING" then
		TransitMotionInteriorSound:Play()
	end
	if EmergencyStopped == false then
		DoStationEmergencyLamps("OFF", CurrentPath.EmergencyLamps.EmergencyLamps)
		DoStationEmergencyLamps("OFF", CurrentPath.EmergencyLamps.EmergencyStopLamps)
		CurrentPath.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound:Stop()
		wait(12.3)
	elseif EmergencyStopped == true then
		wait(9.3)
		DoStationBlastDoor("OPEN", TransitTargetStationValue.Value)
		wait(3)
	end
	if TransitStatusValue.Value == "MOVING" then
		EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
		TransitArrivingStationInteriorSound:Play()
		TransitStatusValue.Value = "ARRIVING"
		if EmergencyStopped == false then
			wait(0.5)
			DoStationBlastDoor("OPEN", TransitTargetStationValue.Value)
		end
		wait(2.5)
		TransitMotionInteriorSound:Stop()
		TargetPath.ConsoleSpeaker.SoundEmitter.TransitStationCallAlarmSound:Stop()
		DoStationEmergencyLamps("ON", TargetPath.EmergencyLamps.EmergencyLamps)
		TargetPath.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound:Play()
		wait(8)
		TransitStatusValue.Value = "ARRIVED"
		DoStationBlastDoor("CLOSE", TransitTargetStationValue.Value)
		DoStationEmergencyLamps("OFF", TargetPath.EmergencyLamps.EmergencyLamps)
		TargetPath.ConsoleSpeaker.SoundEmitter.TransitStationAlarmSound:Stop()
		wait(3)
		Interior[TransitTargetStationValue.Value.."_Door"].SoundEmitter.TransitDoorOpenSound:Play()
		TweenService:Create(Interior[TransitTargetStationValue.Value.."_Door"].LeftDoor, TransitDoorAnimationSettings, { CFrame = TargetPath.TransitPositions[TransitTargetStationValue.Value.."_LeftDoorOpenPos"].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Interior[TransitTargetStationValue.Value.."_Door"].RightDoor, TransitDoorAnimationSettings, { CFrame = TargetPath.TransitPositions[TransitTargetStationValue.Value.."_RightDoorOpenPos"].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(2)
		TargetPath.TransitStationGates.CPU.Values.TransitStationGatesValue.Value = "OPEN"
		wait(5)
		DoStationEmergencyLamps("OFF", TargetPath.EmergencyLamps.EmergencyStopLamps)
		wait(5)
		CanEvent = true
		TransitCurrentStationValue.Value = TransitTargetStationValue.Value
		TransitStatusValue.Value = "OPENED"
	end
end

function GetBufferTargetStationValue()
	BufferTargetStationValue = TransitTargetStationValue.Value
	if TransitTargetStationValue.Value == "FRONT" then
		TransitTargetStationValue.Value = "BACK"
	elseif TransitTargetStationValue.Value == "BACK" then
		TransitTargetStationValue.Value = "FRONT"
	end
end

function DoCheck()
	if FacilityTransitSystemStatusValue.Value == "SHUT DOWN" then
		if TransitStatusValue.Value == "OPENED" then
			CanEvent = false
			GetBufferTargetStationValue()
			wait(20)
			TransitStatusValue.Value = "PARKING"
			TransitArrivingStationInteriorSound:Play()
			TransitArrivingEmergencyStopSound.TimePosition = 24.1
			TransitArrivingEmergencyStopSound:Play()
			TransitDepartingStationInteriorSound:Stop()
			TransitMotionInteriorSound:Stop()
			FrontStationCallAlarmSound:Stop()
			BackStationCallAlarmSound:Stop()
			FrontStationAlarmSound:Stop()
			BackStationAlarmSound:Stop()
			FrontStationArrivingSound:Stop()
			BackStationArrivingSound:Stop()
			TransitMoveToEmergencyStop:Play()
			FrontLeftDoorMoveToEmergencyStop:Play()
			FrontRightDoorMoveToEmergencyStop:Play()
			BackLeftDoorMoveToEmergencyStop:Play()
			BackRightDoorMoveToEmergencyStop:Play()
			DoStationEmergencyLamps("OFF", FrontStationEmergencyLamps)
			DoStationEmergencyLamps("OFF", FrontStationEmergencyStopLamps)
			DoStationEmergencyLamps("OFF", BackStationEmergencyLamps)
			DoStationEmergencyLamps("OFF", BackStationEmergencyStopLamps)
			wait(10)
			DoTransitDoorsEmergencyStop("OPEN")
			DoTransitDoorsEmergencyStop("OPEN")
			FrontStationGateLamps1.BrickColor = BrickColor.new("Really red")
			FrontStationGateLamps2.BrickColor = BrickColor.new("Really red")
			BackStationGateLamps1.BrickColor = BrickColor.new("Really red")
			BackStationGateLamps2.BrickColor = BrickColor.new("Really red")
			wait(6)
			TransitInteriorAmbient:Stop()
			DoTransitLamps("OFF")
			DoTransitSmallLamps("OFF")
			wait(5)
			TransitStatusValue.Value = "PARKING MODE"
		elseif TransitStatusValue.Value == "EMERGENCY STOPPED" then
			TransitStatusValue.Value = "PARKING"
			EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
			DoTransitSmallLamps("OFF")
			DoTransitSmallLamps("PAINT", "Orange")
			TurnOffAlarms()
			wait(0.5)
			DoStationBlastDoor("CLOSE", "FRONT")
			DoStationBlastDoor("CLOSE", "BACK")
			DoStationGates("CLOSE", "FRONT")
			DoStationGates("CLOSE", "BACK")
			DoStationEmergencyLamps("OFF", FrontStationEmergencyLamps)
			DoStationEmergencyLamps("OFF", FrontStationEmergencyStopLamps)
			DoStationEmergencyLamps("OFF", BackStationEmergencyLamps)
			DoStationEmergencyLamps("OFF", BackStationEmergencyStopLamps)
			TurnOffAlarms()
			FrontStationAlarmSound:Stop()
			BackStationAlarmSound:Stop()
			wait(7)
			TransitInteriorAmbient:Stop()
			DoTransitSmallLamps("OFF")
			TransitStatusValue.Value = "PARKING MODE"
		end
	elseif FacilityTransitSystemStatusValue.Value == "POWER ON" then
		if TransitStatusValue.Value == "PARKING MODE" then
			TransitStatusValue.Value = "DEPARTING"
			wait(5)
			TransitInteriorAmbient:Play()
			DoTransitLamps("ON")
			DoTransitSmallLamps("ON")
			wait(5)
			DoTransitDoorsEmergencyStop("CLOSE")
			wait(10)
			BackStationGateLamps1.BrickColor = BrickColor.new("Bright green")
			BackStationGateLamps2.BrickColor = BrickColor.new("Bright green")
			FrontStationGateLamps1.BrickColor = BrickColor.new("Bright green")
			FrontStationGateLamps2.BrickColor = BrickColor.new("Bright green")
			TransitTargetStationValue.Value = BufferTargetStationValue
			StandardSequence(true)
		end
	end
end
--

TransitTargetStationValue.Changed:Connect(function()
	if TransitStatusValue.Value == "OPENED" then
		StandardSequence(false)
	end 
end)

TransitStatusValue.Changed:Connect(function()
	if TransitStatusValue.Value == "MOVING" then
		repeat
			local RandomIndex = math.random(1, 2)
			if RandomIndex == 1 then GetRandomTransitLampGlitch() end
			if RandomIndex == 2 then GetRandomTransitSmallLampGlitch() end
			wait(0.1)
		until TransitStatusValue.Value == "ARRIVING" or TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "PARKING"
	end
end)

EmergencyStopTrigger.ClickDetector.MouseClick:Connect(function()
	EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 0
	CanEvent = false
	if TransitStatusValue.Value == "MOVING" then
		TransitStatusValue.Value = "EMERGENCY STOP"
		GetBufferTargetStationValue()
		TransitArrivingStationInteriorSound:Play()
		TransitArrivingEmergencyStopSound.TimePosition = 24.1
		TransitArrivingEmergencyStopSound:Play()
		TransitDepartingStationInteriorSound:Stop()
		TransitMotionInteriorSound:Stop()
		FrontStationCallAlarmSound:Stop()
		BackStationCallAlarmSound:Stop()
		FrontStationArrivingSound:Stop()
		BackStationArrivingSound:Stop()
		DoBoopAlarms("ON")
		DoTransitLamps("OFF")
		DoTransitSmallLamps("OFF")
		TransitMoveToEmergencyStop:Play()
		FrontLeftDoorMoveToEmergencyStop:Play()
		FrontRightDoorMoveToEmergencyStop:Play()
		BackLeftDoorMoveToEmergencyStop:Play()
		BackRightDoorMoveToEmergencyStop:Play()
		wait(8)
		DoTransitSmallLamps("PAINT", "Red")
		DoTransitSmallLamps("ON")
		DoLongAlarms("ON")
		wait(1)
		DoStationEmergencyLamps("ON", FrontStationEmergencyLamps)
		DoStationEmergencyLamps("ON", FrontStationEmergencyStopLamps)
		DoStationEmergencyLamps("ON", BackStationEmergencyLamps)
		DoStationEmergencyLamps("ON", BackStationEmergencyStopLamps)
		FrontStationAlarmSound:Play()
		BackStationAlarmSound:Play()
		DoTransitDoorsEmergencyStop("OPEN")
		DoTransitDoorsEmergencyStop("OPEN")
		DoStationBlastDoor("OPEN", "FRONT")
		DoStationBlastDoor("OPEN", "BACK")
		DoStationGates("OPEN", "FRONT")
		DoStationGates("OPEN", "BACK")
		FrontStationGateLamps1.BrickColor = BrickColor.new("Really red")
		FrontStationGateLamps2.BrickColor = BrickColor.new("Really red")
		BackStationGateLamps1.BrickColor = BrickColor.new("Really red")
		BackStationGateLamps2.BrickColor = BrickColor.new("Really red")
		wait(10)
		EmergencyStopTrigger.ClickDetector.MaxActivationDistance = 10
		TransitStatusValue.Value = "EMERGENCY STOPPED"
	elseif TransitStatusValue.Value == "EMERGENCY STOPPED" then
		DoTransitSmallLamps("OFF")
		DoTransitSmallLamps("PAINT", "Orange")
		TurnOffAlarms()
		wait(0.5)
		DoTransitSmallLamps("ON")
		DoTransitDoorsEmergencyStop("CLOSE")
		DoStationBlastDoor("CLOSE", "FRONT")
		DoStationBlastDoor("CLOSE", "BACK")
		DoStationGates("CLOSE", "FRONT")
		DoStationGates("CLOSE", "BACK")
		BackStationGateLamps1.BrickColor = BrickColor.new("Bright green")
		BackStationGateLamps2.BrickColor = BrickColor.new("Bright green")
		FrontStationGateLamps1.BrickColor = BrickColor.new("Bright green")
		FrontStationGateLamps2.BrickColor = BrickColor.new("Bright green")
		DoStationEmergencyLamps("OFF", FrontStationEmergencyLamps)
		DoStationEmergencyLamps("OFF", FrontStationEmergencyStopLamps)
		DoStationEmergencyLamps("OFF", BackStationEmergencyLamps)
		DoStationEmergencyLamps("OFF", BackStationEmergencyStopLamps)
		wait(7)
		DoTransitLamps("ON")
		StandardSequence(true)
	end
end)
TransitStatusValue.Changed:Connect(function()
	if TransitStatusValue.Value == "EMERGENCY STOP" then
		wait(8)
		repeat
			if TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED" then
				TransitMessage1:Play()
				FrontStationTransitMessage1:Play()
				BackStationTransitMessage1:Play()
			end
			wait(15)
			if TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED" then
				TransitMessage2:Play()
				FrontStationTransitMessage2:Play()
				BackStationTransitMessage2:Play()
			end
			wait(15)
		until TransitStatusValue.Value == "MOVING" or TransitStatusValue.Value == "PARKING MODE"
	end
end)

TransitStatusValue.Changed:Connect(function()
	DoCheck()
end)
FacilityTransitSystemStatusValue.Changed:Connect(function()
	DoCheck()
end)
