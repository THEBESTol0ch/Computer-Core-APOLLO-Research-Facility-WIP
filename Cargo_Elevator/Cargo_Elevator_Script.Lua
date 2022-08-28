local TweenService = game:GetService("TweenService")

local Elevator = script.Parent.ElevatorFrame.Frame
local ElevatorPosUS = script.Parent.ElevatorFrame.ElevatorPosUS
local ElevatorPosDS = script.Parent.ElevatorFrame.ElevatorPosDS

local ElevatorButton = script.Parent.ElevatorConsole.Button.Button
local WaitingLamp = script.Parent.ElevatorConsole.WaitingLamp.Lamp
local StoppedLamp = script.Parent.ElevatorConsole.StoppedLamp.Lamp
local MovingLamp = script.Parent.ElevatorConsole.MovingLamp.Lamp
local EEL1 = script.Parent.EmergencyLamps.EmergencyLamp1.Lamp
local EEL2 = script.Parent.EmergencyLamps.EmergencyLamp2.Lamp
local EEL3 = script.Parent.EmergencyLamps.EmergencyLamp3.Lamp
local EEL4 = script.Parent.EmergencyLamps.EmergencyLamp4.Lamp

local USCallButton = workspace.UpStation.USElevatorConsole.Button.Button
local USWaitingLamp = workspace.UpStation.USElevatorConsole.WaitingLamp.Lamp
local USStoppedLamp = workspace.UpStation.USElevatorConsole.StoppedLamp.Lamp
local USMovingLamp = workspace.UpStation.USElevatorConsole.MovingLamp.Lamp
local USSpeaker = workspace.UpStation.CargoElevatorUSSpeaker.SoundEmitter
local ELUS1 = workspace.UpStation.EmergencyLamps.ELUS1.Lamp
local ELUS2 = workspace.UpStation.EmergencyLamps.ELUS2.Lamp
local ELUS3 = workspace.UpStation.EmergencyLamps.ELUS3.Lamp
local ELUS4 = workspace.UpStation.EmergencyLamps.ELUS4.Lamp

local DSCallButton = workspace.DownStation.DSElevatorConsole.Button.Button
local DSWaitingLamp = workspace.DownStation.DSElevatorConsole.WaitingLamp.Lamp
local DSStoppedLamp = workspace.DownStation.DSElevatorConsole.StoppedLamp.Lamp
local DSMovingLamp = workspace.DownStation.DSElevatorConsole.MovingLamp.Lamp
local DSSpeaker = workspace.DownStation.CargoElevatorDSSpeaker.SoundEmitter
local ELDS1 = workspace.DownStation.EmergencyLamps.ELDS1.Lamp
local ELDS2 = workspace.DownStation.EmergencyLamps.ELDS2.Lamp
local ELDS3 = workspace.DownStation.EmergencyLamps.ELDS3.Lamp
local ELDS4 = workspace.DownStation.EmergencyLamps.ELDS4.Lamp

-- Values
local ElevatorPositionValue = workspace.CargoElevator.ElevatorPositionValue
--

-- ElevatorPositionValue = 1 - Up Station
-- ElevatorPositionValue = 0 - Down Station

local ElevatorTUS = {
	CFrame = ElevatorPosUS.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorTDS = {
	CFrame = ElevatorPosDS.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorAnimationSettings = TweenInfo.new(
	30,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local ElevatorTUS = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorTUS)
local ElevatorTDS = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorTDS)

ElevatorButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorPositionValue.Value == 1 then
		ElevatorButton.ClickDetector.MaxActivationDistance = 0
		DSCallButton.ClickDetector.MaxActivationDistance = 0
		wait(0.1)
		ElevatorPositionValue.Value = 0
		
		EEL1.SpotLight.Enabled = true
		EEL1.HingeConstraint.AngularVelocity = 5
		EEL2.SpotLight.Enabled = true
		EEL2.HingeConstraint.AngularVelocity = 5
		EEL3.SpotLight.Enabled = true
		EEL3.HingeConstraint.AngularVelocity = 5
		EEL4.SpotLight.Enabled = true
		EEL4.HingeConstraint.AngularVelocity = 5
		
		ELUS1.SpotLight.Enabled = true
		ELUS1.HingeConstraint.AngularVelocity = 5
		ELUS2.SpotLight.Enabled = true
		ELUS2.HingeConstraint.AngularVelocity = 5
		ELUS3.SpotLight.Enabled = true
		ELUS3.HingeConstraint.AngularVelocity = 5
		ELUS4.SpotLight.Enabled = true
		ELUS4.HingeConstraint.AngularVelocity = 5
		
		ELDS1.SpotLight.Enabled = true
		ELDS1.HingeConstraint.AngularVelocity = 5
		ELDS2.SpotLight.Enabled = true
		ELDS2.HingeConstraint.AngularVelocity = 5
		ELDS3.SpotLight.Enabled = true
		ELDS3.HingeConstraint.AngularVelocity = 5
		ELDS4.SpotLight.Enabled = true
		ELDS4.HingeConstraint.AngularVelocity = 5
		
		StoppedLamp.BrickColor = BrickColor.new("Maroon")
		StoppedLamp.Material = ("SmoothPlastic")
		USStoppedLamp.BrickColor = BrickColor.new("Maroon")
		USStoppedLamp.Material = ("SmoothPlastic")
		DSStoppedLamp.BrickColor = BrickColor.new("Maroon")
		DSStoppedLamp.Material = ("SmoothPlastic")
		
		WaitingLamp.Material = ("Neon")
		USWaitingLamp.Material = ("Neon")
		DSWaitingLamp.Material = ("Neon")
		
		wait(10)
		USSpeaker.Alarm1:Play()
		wait(5)
		USSpeaker.Alarm2:Play()
		wait(2)
		
		WaitingLamp.Material = ("SmoothPlastic")
		USWaitingLamp.Material = ("SmoothPlastic")
		DSWaitingLamp.Material = ("SmoothPlastic")
		
		MovingLamp.BrickColor = BrickColor.new("Lime green")
		MovingLamp.Material = ("Neon")
		USMovingLamp.BrickColor = BrickColor.new("Lime green")
		USMovingLamp.Material = ("Neon")
		DSMovingLamp.BrickColor = BrickColor.new("Lime green")
		DSMovingLamp.Material = ("Neon")
		
		ElevatorTDS:Play()
		wait(25)
		DSSpeaker.Alarm1:Play()
		wait(5)
		DSSpeaker.Alarm2:Play()
		
		MovingLamp.BrickColor = BrickColor.new("Earth green")
		MovingLamp.Material = ("SmoothPlastic")
		USMovingLamp.BrickColor = BrickColor.new("Earth green")
		USMovingLamp.Material = ("SmoothPlastic")
		DSMovingLamp.BrickColor = BrickColor.new("Earth green")
		DSMovingLamp.Material = ("SmoothPlastic")
		
		StoppedLamp.BrickColor = BrickColor.new("Really red")
		StoppedLamp.Material = ("Neon")
		USStoppedLamp.BrickColor = BrickColor.new("Really red")
		USStoppedLamp.Material = ("Neon")
		DSStoppedLamp.BrickColor = BrickColor.new("Really red")
		DSStoppedLamp.Material = ("Neon")
		
		EEL1.SpotLight.Enabled = false
		EEL1.HingeConstraint.AngularVelocity = 0
		EEL2.SpotLight.Enabled = false
		EEL2.HingeConstraint.AngularVelocity = 0
		EEL3.SpotLight.Enabled = false
		EEL3.HingeConstraint.AngularVelocity = 0
		EEL4.SpotLight.Enabled = false
		EEL4.HingeConstraint.AngularVelocity = 0

		ELUS1.SpotLight.Enabled = false
		ELUS1.HingeConstraint.AngularVelocity = 0
		ELUS2.SpotLight.Enabled = false
		ELUS2.HingeConstraint.AngularVelocity = 0
		ELUS3.SpotLight.Enabled = false
		ELUS3.HingeConstraint.AngularVelocity = 0
		ELUS4.SpotLight.Enabled = false
		ELUS4.HingeConstraint.AngularVelocity = 0

		ELDS1.SpotLight.Enabled = false
		ELDS1.HingeConstraint.AngularVelocity = 0
		ELDS2.SpotLight.Enabled = false
		ELDS2.HingeConstraint.AngularVelocity = 0
		ELDS3.SpotLight.Enabled = false
		ELDS3.HingeConstraint.AngularVelocity = 0
		ELDS4.SpotLight.Enabled = false
		ELDS4.HingeConstraint.AngularVelocity = 0
		wait(1)
		ElevatorButton.ClickDetector.MaxActivationDistance = 10
		USCallButton.ClickDetector.MaxActivationDistance = 10
	end
end)

ElevatorButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorPositionValue.Value == 0 then
		ElevatorButton.ClickDetector.MaxActivationDistance = 0
		USCallButton.ClickDetector.MaxActivationDistance = 0
		wait(0.1)
		ElevatorPositionValue.Value = 1

		EEL1.SpotLight.Enabled = true
		EEL1.HingeConstraint.AngularVelocity = 5
		EEL2.SpotLight.Enabled = true
		EEL2.HingeConstraint.AngularVelocity = 5
		EEL3.SpotLight.Enabled = true
		EEL3.HingeConstraint.AngularVelocity = 5
		EEL4.SpotLight.Enabled = true
		EEL4.HingeConstraint.AngularVelocity = 5

		ELUS1.SpotLight.Enabled = true
		ELUS1.HingeConstraint.AngularVelocity = 5
		ELUS2.SpotLight.Enabled = true
		ELUS2.HingeConstraint.AngularVelocity = 5
		ELUS3.SpotLight.Enabled = true
		ELUS3.HingeConstraint.AngularVelocity = 5
		ELUS4.SpotLight.Enabled = true
		ELUS4.HingeConstraint.AngularVelocity = 5

		ELDS1.SpotLight.Enabled = true
		ELDS1.HingeConstraint.AngularVelocity = 5
		ELDS2.SpotLight.Enabled = true
		ELDS2.HingeConstraint.AngularVelocity = 5
		ELDS3.SpotLight.Enabled = true
		ELDS3.HingeConstraint.AngularVelocity = 5
		ELDS4.SpotLight.Enabled = true
		ELDS4.HingeConstraint.AngularVelocity = 5

		StoppedLamp.BrickColor = BrickColor.new("Maroon")
		StoppedLamp.Material = ("SmoothPlastic")
		USStoppedLamp.BrickColor = BrickColor.new("Maroon")
		USStoppedLamp.Material = ("SmoothPlastic")
		DSStoppedLamp.BrickColor = BrickColor.new("Maroon")
		DSStoppedLamp.Material = ("SmoothPlastic")

		WaitingLamp.Material = ("Neon")
		USWaitingLamp.Material = ("Neon")
		DSWaitingLamp.Material = ("Neon")

		wait(10)
		DSSpeaker.Alarm1:Play()
		wait(5)
		DSSpeaker.Alarm2:Play()
		wait(2)

		WaitingLamp.Material = ("SmoothPlastic")
		USWaitingLamp.Material = ("SmoothPlastic")
		DSWaitingLamp.Material = ("SmoothPlastic")

		MovingLamp.BrickColor = BrickColor.new("Lime green")
		MovingLamp.Material = ("Neon")
		USMovingLamp.BrickColor = BrickColor.new("Lime green")
		USMovingLamp.Material = ("Neon")
		DSMovingLamp.BrickColor = BrickColor.new("Lime green")
		DSMovingLamp.Material = ("Neon")

		ElevatorTUS:Play()
		wait(25)
		USSpeaker.Alarm1:Play()
		wait(5)
		USSpeaker.Alarm2:Play()

		MovingLamp.BrickColor = BrickColor.new("Earth green")
		MovingLamp.Material = ("SmoothPlastic")
		USMovingLamp.BrickColor = BrickColor.new("Earth green")
		USMovingLamp.Material = ("SmoothPlastic")
		DSMovingLamp.BrickColor = BrickColor.new("Earth green")
		DSMovingLamp.Material = ("SmoothPlastic")

		StoppedLamp.BrickColor = BrickColor.new("Really red")
		StoppedLamp.Material = ("Neon")
		USStoppedLamp.BrickColor = BrickColor.new("Really red")
		USStoppedLamp.Material = ("Neon")
		DSStoppedLamp.BrickColor = BrickColor.new("Really red")
		DSStoppedLamp.Material = ("Neon")

		EEL1.SpotLight.Enabled = false
		EEL1.HingeConstraint.AngularVelocity = 0
		EEL2.SpotLight.Enabled = false
		EEL2.HingeConstraint.AngularVelocity = 0
		EEL3.SpotLight.Enabled = false
		EEL3.HingeConstraint.AngularVelocity = 0
		EEL4.SpotLight.Enabled = false
		EEL4.HingeConstraint.AngularVelocity = 0

		ELUS1.SpotLight.Enabled = false
		ELUS1.HingeConstraint.AngularVelocity = 0
		ELUS2.SpotLight.Enabled = false
		ELUS2.HingeConstraint.AngularVelocity = 0
		ELUS3.SpotLight.Enabled = false
		ELUS3.HingeConstraint.AngularVelocity = 0
		ELUS4.SpotLight.Enabled = false
		ELUS4.HingeConstraint.AngularVelocity = 0

		ELDS1.SpotLight.Enabled = false
		ELDS1.HingeConstraint.AngularVelocity = 0
		ELDS2.SpotLight.Enabled = false
		ELDS2.HingeConstraint.AngularVelocity = 0
		ELDS3.SpotLight.Enabled = false
		ELDS3.HingeConstraint.AngularVelocity = 0
		ELDS4.SpotLight.Enabled = false
		ELDS4.HingeConstraint.AngularVelocity = 0
		wait(1)
		ElevatorButton.ClickDetector.MaxActivationDistance = 10
		DSCallButton.ClickDetector.MaxActivationDistance = 10
	end
end)

DSCallButton.ClickDetector.MouseClick:Connect(function()
	ElevatorPositionValue.Value = 0
	ElevatorButton.ClickDetector.MaxActivationDistance = 0
	DSCallButton.ClickDetector.MaxActivationDistance = 0

	EEL1.SpotLight.Enabled = true
	EEL1.HingeConstraint.AngularVelocity = 5
	EEL2.SpotLight.Enabled = true
	EEL2.HingeConstraint.AngularVelocity = 5
	EEL3.SpotLight.Enabled = true
	EEL3.HingeConstraint.AngularVelocity = 5
	EEL4.SpotLight.Enabled = true
	EEL4.HingeConstraint.AngularVelocity = 5

	ELUS1.SpotLight.Enabled = true
	ELUS1.HingeConstraint.AngularVelocity = 5
	ELUS2.SpotLight.Enabled = true
	ELUS2.HingeConstraint.AngularVelocity = 5
	ELUS3.SpotLight.Enabled = true
	ELUS3.HingeConstraint.AngularVelocity = 5
	ELUS4.SpotLight.Enabled = true
	ELUS4.HingeConstraint.AngularVelocity = 5

	ELDS1.SpotLight.Enabled = true
	ELDS1.HingeConstraint.AngularVelocity = 5
	ELDS2.SpotLight.Enabled = true
	ELDS2.HingeConstraint.AngularVelocity = 5
	ELDS3.SpotLight.Enabled = true
	ELDS3.HingeConstraint.AngularVelocity = 5
	ELDS4.SpotLight.Enabled = true
	ELDS4.HingeConstraint.AngularVelocity = 5

	StoppedLamp.BrickColor = BrickColor.new("Maroon")
	StoppedLamp.Material = ("SmoothPlastic")
	USStoppedLamp.BrickColor = BrickColor.new("Maroon")
	USStoppedLamp.Material = ("SmoothPlastic")
	DSStoppedLamp.BrickColor = BrickColor.new("Maroon")
	DSStoppedLamp.Material = ("SmoothPlastic")

	WaitingLamp.Material = ("Neon")
	USWaitingLamp.Material = ("Neon")
	DSWaitingLamp.Material = ("Neon")

	wait(10)
	USSpeaker.Alarm1:Play()
	wait(5)
	USSpeaker.Alarm2:Play()
	wait(2)

	WaitingLamp.Material = ("SmoothPlastic")
	USWaitingLamp.Material = ("SmoothPlastic")
	DSWaitingLamp.Material = ("SmoothPlastic")

	MovingLamp.BrickColor = BrickColor.new("Lime green")
	MovingLamp.Material = ("Neon")
	USMovingLamp.BrickColor = BrickColor.new("Lime green")
	USMovingLamp.Material = ("Neon")
	DSMovingLamp.BrickColor = BrickColor.new("Lime green")
	DSMovingLamp.Material = ("Neon")

	ElevatorTDS:Play()
	wait(25)
	DSSpeaker.Alarm1:Play()
	wait(5)
	DSSpeaker.Alarm2:Play()

	MovingLamp.BrickColor = BrickColor.new("Earth green")
	MovingLamp.Material = ("SmoothPlastic")
	USMovingLamp.BrickColor = BrickColor.new("Earth green")
	USMovingLamp.Material = ("SmoothPlastic")
	DSMovingLamp.BrickColor = BrickColor.new("Earth green")
	DSMovingLamp.Material = ("SmoothPlastic")

	StoppedLamp.BrickColor = BrickColor.new("Really red")
	StoppedLamp.Material = ("Neon")
	USStoppedLamp.BrickColor = BrickColor.new("Really red")
	USStoppedLamp.Material = ("Neon")
	DSStoppedLamp.BrickColor = BrickColor.new("Really red")
	DSStoppedLamp.Material = ("Neon")

	EEL1.SpotLight.Enabled = false
	EEL1.HingeConstraint.AngularVelocity = 0
	EEL2.SpotLight.Enabled = false
	EEL2.HingeConstraint.AngularVelocity = 0
	EEL3.SpotLight.Enabled = false
	EEL3.HingeConstraint.AngularVelocity = 0
	EEL4.SpotLight.Enabled = false
	EEL4.HingeConstraint.AngularVelocity = 0

	ELUS1.SpotLight.Enabled = false
	ELUS1.HingeConstraint.AngularVelocity = 0
	ELUS2.SpotLight.Enabled = false
	ELUS2.HingeConstraint.AngularVelocity = 0
	ELUS3.SpotLight.Enabled = false
	ELUS3.HingeConstraint.AngularVelocity = 0
	ELUS4.SpotLight.Enabled = false
	ELUS4.HingeConstraint.AngularVelocity = 0

	ELDS1.SpotLight.Enabled = false
	ELDS1.HingeConstraint.AngularVelocity = 0
	ELDS2.SpotLight.Enabled = false
	ELDS2.HingeConstraint.AngularVelocity = 0
	ELDS3.SpotLight.Enabled = false
	ELDS3.HingeConstraint.AngularVelocity = 0
	ELDS4.SpotLight.Enabled = false
	ELDS4.HingeConstraint.AngularVelocity = 0
	wait(1)
	ElevatorButton.ClickDetector.MaxActivationDistance = 10
	USCallButton.ClickDetector.MaxActivationDistance = 10
end)

USCallButton.ClickDetector.MouseClick:Connect(function()
	ElevatorPositionValue.Value = 1
	ElevatorButton.ClickDetector.MaxActivationDistance = 0
	USCallButton.ClickDetector.MaxActivationDistance = 0

	EEL1.SpotLight.Enabled = true
	EEL1.HingeConstraint.AngularVelocity = 5
	EEL2.SpotLight.Enabled = true
	EEL2.HingeConstraint.AngularVelocity = 5
	EEL3.SpotLight.Enabled = true
	EEL3.HingeConstraint.AngularVelocity = 5
	EEL4.SpotLight.Enabled = true
	EEL4.HingeConstraint.AngularVelocity = 5

	ELUS1.SpotLight.Enabled = true
	ELUS1.HingeConstraint.AngularVelocity = 5
	ELUS2.SpotLight.Enabled = true
	ELUS2.HingeConstraint.AngularVelocity = 5
	ELUS3.SpotLight.Enabled = true
	ELUS3.HingeConstraint.AngularVelocity = 5
	ELUS4.SpotLight.Enabled = true
	ELUS4.HingeConstraint.AngularVelocity = 5

	ELDS1.SpotLight.Enabled = true
	ELDS1.HingeConstraint.AngularVelocity = 5
	ELDS2.SpotLight.Enabled = true
	ELDS2.HingeConstraint.AngularVelocity = 5
	ELDS3.SpotLight.Enabled = true
	ELDS3.HingeConstraint.AngularVelocity = 5
	ELDS4.SpotLight.Enabled = true
	ELDS4.HingeConstraint.AngularVelocity = 5

	StoppedLamp.BrickColor = BrickColor.new("Maroon")
	StoppedLamp.Material = ("SmoothPlastic")
	USStoppedLamp.BrickColor = BrickColor.new("Maroon")
	USStoppedLamp.Material = ("SmoothPlastic")
	DSStoppedLamp.BrickColor = BrickColor.new("Maroon")
	DSStoppedLamp.Material = ("SmoothPlastic")

	WaitingLamp.Material = ("Neon")
	USWaitingLamp.Material = ("Neon")
	DSWaitingLamp.Material = ("Neon")

	wait(10)
	DSSpeaker.Alarm1:Play()
	wait(5)
	DSSpeaker.Alarm2:Play()
	wait(2)

	WaitingLamp.Material = ("SmoothPlastic")
	USWaitingLamp.Material = ("SmoothPlastic")
	DSWaitingLamp.Material = ("SmoothPlastic")

	MovingLamp.BrickColor = BrickColor.new("Lime green")
	MovingLamp.Material = ("Neon")
	USMovingLamp.BrickColor = BrickColor.new("Lime green")
	USMovingLamp.Material = ("Neon")
	DSMovingLamp.BrickColor = BrickColor.new("Lime green")
	DSMovingLamp.Material = ("Neon")

	ElevatorTUS:Play()
	wait(25)
	USSpeaker.Alarm1:Play()
	wait(5)
	USSpeaker.Alarm2:Play()

	MovingLamp.BrickColor = BrickColor.new("Earth green")
	MovingLamp.Material = ("SmoothPlastic")
	USMovingLamp.BrickColor = BrickColor.new("Earth green")
	USMovingLamp.Material = ("SmoothPlastic")
	DSMovingLamp.BrickColor = BrickColor.new("Earth green")
	DSMovingLamp.Material = ("SmoothPlastic")

	StoppedLamp.BrickColor = BrickColor.new("Really red")
	StoppedLamp.Material = ("Neon")
	USStoppedLamp.BrickColor = BrickColor.new("Really red")
	USStoppedLamp.Material = ("Neon")
	DSStoppedLamp.BrickColor = BrickColor.new("Really red")
	DSStoppedLamp.Material = ("Neon")

	EEL1.SpotLight.Enabled = false
	EEL1.HingeConstraint.AngularVelocity = 0
	EEL2.SpotLight.Enabled = false
	EEL2.HingeConstraint.AngularVelocity = 0
	EEL3.SpotLight.Enabled = false
	EEL3.HingeConstraint.AngularVelocity = 0
	EEL4.SpotLight.Enabled = false
	EEL4.HingeConstraint.AngularVelocity = 0

	ELUS1.SpotLight.Enabled = false
	ELUS1.HingeConstraint.AngularVelocity = 0
	ELUS2.SpotLight.Enabled = false
	ELUS2.HingeConstraint.AngularVelocity = 0
	ELUS3.SpotLight.Enabled = false
	ELUS3.HingeConstraint.AngularVelocity = 0
	ELUS4.SpotLight.Enabled = false
	ELUS4.HingeConstraint.AngularVelocity = 0

	ELDS1.SpotLight.Enabled = false
	ELDS1.HingeConstraint.AngularVelocity = 0
	ELDS2.SpotLight.Enabled = false
	ELDS2.HingeConstraint.AngularVelocity = 0
	ELDS3.SpotLight.Enabled = false
	ELDS3.HingeConstraint.AngularVelocity = 0
	ELDS4.SpotLight.Enabled = false
	ELDS4.HingeConstraint.AngularVelocity = 0
	wait(1)
	ElevatorButton.ClickDetector.MaxActivationDistance = 10
	DSCallButton.ClickDetector.MaxActivationDistance = 10
end)
