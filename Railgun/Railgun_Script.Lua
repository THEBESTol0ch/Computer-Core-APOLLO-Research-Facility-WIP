local TweenService = game:GetService("TweenService")

local Elevator = script.Parent.ProjectileElevator.Elevator.Elevator
local ElevatorPos1 = script.Parent.ProjectileElevator.Elevator.ElevatorPos1
local ElevatorPos2 = script.Parent.ProjectileElevator.Elevator.ElevatorPos2
local ElevatorPos3 = script.Parent.ProjectileElevator.Elevator.ElevatorPos3

local ElevatorProjectile = script.Parent.ProjectileElevator.Elevator.ElevatorProjectile
local RailProjectile = script.Parent.ProjectileElevator.Elevator.RailProjectile
local ReloadButton = workspace.RailgunConsole.Button1.Button
local FireButton = workspace.RailgunConsole.EmergencyButton.Button
local RailgunShotSound = script.Parent.SoundEmitter.RailgunShotSound
local FireProjectilePos = script.Parent.ProjectileElevator.Elevator.FireProjectilePos
local RailLightning = script.Parent.Lightning

local RailsMainPart = script.Parent.Rails.RailsMainPart
local RailsPos1 = script.Parent.Rails.RailsPos1
local RailsPos2 = script.Parent.Rails.RailsPos2
local UpRailsTeeth = script.Parent.Rails.UpRail.Teeth.Teeth
local DownRailsTeeth = script.Parent.Rails.DownRail.Teeth.Teeth

local RailsSmokeEmitter = script.Parent.Rails.RailsSmokeEmitter
local UpComputerSmokeEmitter = script.Parent.MainFrame.UpComputer.UpComputerSmokeEmitter
local LeftMainComputerSmokeEmitter = script.Parent.MainComputer.Computer.Vents.LeftSmallVent.LeftMainComputerSmokeEmitter
local RightMainComputerSmokeEmitter = script.Parent.MainComputer.Computer.Vents.RightSmallVent.RightMainComputerSmokeEmitter

local LeftBatterySmokeEmitter1 = script.Parent.BatteryModule.VentSystem.LeftSmokeEmitters.BatterySmokeEmitter1
local LeftBatterySmokeEmitter2 = script.Parent.BatteryModule.VentSystem.LeftSmokeEmitters.BatterySmokeEmitter2
local LeftBatterySmokeEmitter3 = script.Parent.BatteryModule.VentSystem.LeftSmokeEmitters.BatterySmokeEmitter3
local LeftBatterySmokeEmitter4 = script.Parent.BatteryModule.VentSystem.LeftSmokeEmitters.BatterySmokeEmitter4

local RightBatterySmokeEmitter1 = script.Parent.BatteryModule.VentSystem.RightSmokeEmitters.BatterySmokeEmitter1
local RightBatterySmokeEmitter2 = script.Parent.BatteryModule.VentSystem.RightSmokeEmitters.BatterySmokeEmitter2
local RightBatterySmokeEmitter3 = script.Parent.BatteryModule.VentSystem.RightSmokeEmitters.BatterySmokeEmitter3
local RightBatterySmokeEmitter4 = script.Parent.BatteryModule.VentSystem.RightSmokeEmitters.BatterySmokeEmitter4

local LBD1Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD1Hinge
local LBD2Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD2Hinge
local LBD3Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD3Hinge
local LBD4Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD4Hinge
local LBD5Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD5Hinge
local LBD6Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD6Hinge
local LBD7Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD7Hinge
local LBD8Hinge = script.Parent.BatteryModule.LeftBatterySystem.BD.BD8Hinge
local LBU1Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU1Hinge
local LBU2Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU2Hinge
local LBU3Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU3Hinge
local LBU4Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU4Hinge
local LBU5Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU5Hinge
local LBU6Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU6Hinge
local LBU7Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU7Hinge
local LBU8Hinge = script.Parent.BatteryModule.LeftBatterySystem.BU.BU8Hinge

local RBD1Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD1Hinge
local RBD2Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD2Hinge
local RBD3Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD3Hinge
local RBD4Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD4Hinge
local RBD5Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD5Hinge
local RBD6Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD6Hinge
local RBD7Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD7Hinge
local RBD8Hinge = script.Parent.BatteryModule.RightBatterySystem.BD.BD8Hinge
local RBU1Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU1Hinge
local RBU2Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU2Hinge
local RBU3Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU3Hinge
local RBU4Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU4Hinge
local RBU5Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU5Hinge
local RBU6Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU6Hinge
local RBU7Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU7Hinge
local RBU8Hinge = script.Parent.BatteryModule.RightBatterySystem.BU.BU8Hinge

local LeftBeaconHinge = script.Parent.BatteryModule.LeftBeacon.Hinge
local LeftBeaconLamp = script.Parent.BatteryModule.LeftBeacon.Lamp

local RightBeaconHinge = script.Parent.BatteryModule.RightBeacon.Hinge
local RightBeaconLamp = script.Parent.BatteryModule.RightBeacon.Lamp

local ReloadProjectile1 = workspace.ReloadProjectileAS.ReloadProjectile1
local ReloadProjectile2 = workspace.ReloadProjectileAS.ReloadProjectile2

local RailsTemperatureValue = workspace.Railgun.RailsTemperatureValue

local ElevatorMove1 = {
	CFrame = ElevatorPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorMove2 = {
	CFrame = ElevatorPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorMove3 = {
	CFrame = ElevatorPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RailProjectileStart = {
	CFrame = FireProjectilePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RailProjectileEnd = {
	CFrame = RailProjectile.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RailsStart = {
	CFrame = RailsPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RailsEnd = {
	CFrame = RailsPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local RailProjectileAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local RailsAnimationSettings1 = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local RailsAnimationSettings2 = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local TeethAnimationSettings = TweenInfo.new(
	20,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local BatteryAnimationSettingsStart = TweenInfo.new(
	0.05,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local BatteryAnimationSettingsEnd = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local TeethPropertiesEnd = {
	Color = Color3.fromRGB(91, 93, 105)
}

local ElevatorMove1 = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorMove1)
local ElevatorMove2 = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorMove2)
local ElevatorMove3 = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorMove3)

local RailProjectileStart = TweenService:Create(RailProjectile, RailProjectileAnimationSettings, RailProjectileStart)
local RailProjectileEnd = TweenService:Create(RailProjectile, RailProjectileAnimationSettings, RailProjectileEnd)

local RailsStart = TweenService:Create(RailsMainPart, RailsAnimationSettings1, RailsStart)
local RailsEnd = TweenService:Create(RailsMainPart, RailsAnimationSettings2, RailsEnd)
local UpRailsTeethEnd = TweenService:Create(UpRailsTeeth, TeethAnimationSettings, TeethPropertiesEnd)
local DownRailsTeethEnd = TweenService:Create(DownRailsTeeth, TeethAnimationSettings, TeethPropertiesEnd)
--
local LBU1Start = TweenService:Create(LBU1Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU1Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU1End = TweenService:Create(LBU1Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU1Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD1Start = TweenService:Create(LBD1Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD1Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD1End = TweenService:Create(LBD1Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD1Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU1Start = TweenService:Create(RBU1Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU1Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU1End = TweenService:Create(RBU1Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU1Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD1Start = TweenService:Create(RBD1Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD1Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD1End = TweenService:Create(RBD1Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD1Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU2Start = TweenService:Create(LBU2Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU2Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU2End = TweenService:Create(LBU2Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU2Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD2Start = TweenService:Create(LBD2Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD2Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD2End = TweenService:Create(LBD2Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD2Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU2Start = TweenService:Create(RBU2Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU2Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU2End = TweenService:Create(RBU2Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU2Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD2Start = TweenService:Create(RBD2Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD2Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD2End = TweenService:Create(RBD2Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD2Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU3Start = TweenService:Create(LBU3Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU3Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU3End = TweenService:Create(LBU3Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU3Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD3Start = TweenService:Create(LBD3Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD3Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD3End = TweenService:Create(LBD3Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD3Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU3Start = TweenService:Create(RBU3Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU3Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU3End = TweenService:Create(RBU3Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU3Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD3Start = TweenService:Create(RBD3Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD3Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD3End = TweenService:Create(RBD3Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD3Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU4Start = TweenService:Create(LBU4Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU4Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU4End = TweenService:Create(LBU4Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU4Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD4Start = TweenService:Create(LBD4Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD4Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD4End = TweenService:Create(LBD4Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD4Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU4Start = TweenService:Create(RBU4Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU4Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU4End = TweenService:Create(RBU4Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU4Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD4Start = TweenService:Create(RBD4Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD4Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD4End = TweenService:Create(RBD4Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD4Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU5Start = TweenService:Create(LBU5Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU5Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU5End = TweenService:Create(LBU5Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU5Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD5Start = TweenService:Create(LBD5Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD5Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD5End = TweenService:Create(LBD5Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD5Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU5Start = TweenService:Create(RBU5Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU5Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU5End = TweenService:Create(RBU5Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU5Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD5Start = TweenService:Create(RBD5Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD5Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD5End = TweenService:Create(RBD5Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD5Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU6Start = TweenService:Create(LBU6Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU6Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU6End = TweenService:Create(LBU6Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU6Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD6Start = TweenService:Create(LBD6Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD6Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD6End = TweenService:Create(LBD6Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD6Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU6Start = TweenService:Create(RBU6Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU6Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU6End = TweenService:Create(RBU6Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU6Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD6Start = TweenService:Create(RBD6Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD6Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD6End = TweenService:Create(RBD6Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD6Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU7Start = TweenService:Create(LBU7Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU7Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU7End = TweenService:Create(LBU7Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU7Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD7Start = TweenService:Create(LBD7Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD7Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD7End = TweenService:Create(LBD7Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD7Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU7Start = TweenService:Create(RBU7Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU7Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU7End = TweenService:Create(RBU7Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU7Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD7Start = TweenService:Create(RBD7Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD7Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD7End = TweenService:Create(RBD7Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD7Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBU8Start = TweenService:Create(LBU8Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBU8Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local LBU8End = TweenService:Create(LBU8Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBU8Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LBD8Start = TweenService:Create(LBD8Hinge, BatteryAnimationSettingsStart, {
	CFrame = LBD8Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LBD8End = TweenService:Create(LBD8Hinge, BatteryAnimationSettingsEnd, {
	CFrame = LBD8Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBU8Start = TweenService:Create(RBU8Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBU8Hinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local RBU8End = TweenService:Create(RBU8Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBU8Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBD8Start = TweenService:Create(RBD8Hinge, BatteryAnimationSettingsStart, {
	CFrame = RBD8Hinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local RBD8End = TweenService:Create(RBD8Hinge, BatteryAnimationSettingsEnd, {
	CFrame = RBD8Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
--
local LBStart = TweenService:Create(LeftBeaconHinge, BatteryAnimationSettingsStart, {
	CFrame = LeftBeaconHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})
local LBEnd = TweenService:Create(LeftBeaconHinge, BatteryAnimationSettingsEnd, {
	CFrame = LeftBeaconHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RBStart = TweenService:Create(RightBeaconHinge, BatteryAnimationSettingsStart, {
	CFrame = RightBeaconHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})
local RBEnd = TweenService:Create(RightBeaconHinge, BatteryAnimationSettingsEnd, {
	CFrame = RightBeaconHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

ReloadButton.ClickDetector.MouseClick:Connect(function()
	wait(30)
	ElevatorMove1:Play()
	wait(4)
	ElevatorMove3:Play()
	wait(6)
	ElevatorMove1:Play()
	wait(4)
	ElevatorMove2:Play()
	wait(4)
	ElevatorProjectile.Transparency = 1
	RailProjectile.Transparency = 0
end)

FireButton.ClickDetector.MouseClick:Connect(function()
	FireButton.ClickDetector.MaxActivationDistance = 0
	RailgunShotSound:Play()
	workspace.RailgunMonitor.Lines.RailgunStatus.SurfaceGui.TextLabel.Text = ("FIRING...")
	workspace.RailgunMonitor.Lines.RailgunStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(7.15)
	RailProjectile.Material = ("Neon")
	RailProjectile.UsePartColor = true
	RailProjectileStart:Play()
	RailsStart:Play()
	RailLightning.Transparency = 0
	RailLightning.PointLight.Enabled = true
	UpRailsTeeth.BrickColor = BrickColor.new("CGA brown")
	UpRailsTeeth.Material = ("Neon")
	DownRailsTeeth.BrickColor = BrickColor.new("CGA brown")
	DownRailsTeeth.Material = ("Neon")
	RailsMainPart.PointLight.Enabled = true
	LeftBeaconLamp.BrickColor = BrickColor.new("Crimson")
	RightBeaconLamp.BrickColor = BrickColor.new("Crimson")
	workspace.Railgun.RailsTemperatureValue.Value = 2325
	workspace.RailgunMonitor.Lines.TargetStatus.SurfaceGui.TextLabel.Text = ("NONE")
	workspace.RailgunMonitor.Lines.TargetStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(255, 0, 0)
	workspace.RailgunConsole.EmergencyButton.TargetValue.Value = 0
	workspace.RailgunMonitor.Lines.ProjectileStatus.SurfaceGui.TextLabel.Text = ("NONE")
	workspace.RailgunMonitor.Lines.ProjectileStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(255, 0, 0)
	LBU1Start:Play()
	LBD1Start:Play()
	RBU1Start:Play()
	RBD1Start:Play()
	LBU2Start:Play()
	LBD2Start:Play()
	RBU2Start:Play()
	RBD2Start:Play()
	LBU3Start:Play()
	LBD3Start:Play()
	RBU3Start:Play()
	RBD3Start:Play()
	LBU4Start:Play()
	LBD4Start:Play()
	RBU4Start:Play()
	RBD4Start:Play()
	LBU5Start:Play()
	LBD5Start:Play()
	RBU5Start:Play()
	RBD5Start:Play()
	LBU6Start:Play()
	LBD6Start:Play()
	RBU6Start:Play()
	RBD6Start:Play()
	LBU7Start:Play()
	LBD7Start:Play()
	RBU7Start:Play()
	RBD7Start:Play()
	LBU8Start:Play()
	LBD8Start:Play()
	RBU8Start:Play()
	RBD8Start:Play()
	LBStart:Play()
	RBStart:Play()
	
	LeftMainComputerSmokeEmitter.Smoke.Enabled = true
	RightMainComputerSmokeEmitter.Smoke.Enabled = true
	UpComputerSmokeEmitter.Smoke.Enabled = true
	LeftBatterySmokeEmitter1.Smoke.Enabled = true
	LeftBatterySmokeEmitter2.Smoke.Enabled = true
	LeftBatterySmokeEmitter3.Smoke.Enabled = true
	LeftBatterySmokeEmitter4.Smoke.Enabled = true
	RightBatterySmokeEmitter1.Smoke.Enabled = true
	RightBatterySmokeEmitter2.Smoke.Enabled = true
	RightBatterySmokeEmitter3.Smoke.Enabled = true
	RightBatterySmokeEmitter4.Smoke.Enabled = true
	RailsSmokeEmitter.Smoke.Enabled = true
	wait(0.1)
	workspace.RailgunMonitor.Lines.RailgunStatus.SurfaceGui.TextLabel.Text = ("COOLING")
	workspace.RailgunMonitor.Lines.RailgunStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(0.333333, 0.666667, 1)
	UpRailsTeethEnd:Play()
	DownRailsTeethEnd:Play()
	RailsEnd:Play()
	RailLightning.Transparency = 1
	RailLightning.PointLight.Enabled = false
	wait(10)
	RailsSmokeEmitter.Smoke.Enabled = false
	RailProjectile.Material = ("Metal")
	RailProjectile.UsePartColor = false
	RailProjectileEnd:Play()
	RailProjectile.Transparency = 1
	RailsMainPart.PointLight.Enabled = false
	wait(10)
	UpRailsTeeth.Material = ("Metal")
	DownRailsTeeth.Material = ("Metal")
	wait(13)
	LeftMainComputerSmokeEmitter.Smoke.Enabled = false
	RightMainComputerSmokeEmitter.Smoke.Enabled = false
	UpComputerSmokeEmitter.Smoke.Enabled = false
	LeftBatterySmokeEmitter1.Smoke.Enabled = false
	LeftBatterySmokeEmitter2.Smoke.Enabled = false
	LeftBatterySmokeEmitter3.Smoke.Enabled = false
	LeftBatterySmokeEmitter4.Smoke.Enabled = false
	RightBatterySmokeEmitter1.Smoke.Enabled = false
	RightBatterySmokeEmitter2.Smoke.Enabled = false
	RightBatterySmokeEmitter3.Smoke.Enabled = false
	RightBatterySmokeEmitter4.Smoke.Enabled = false
	wait(5)
	LBU1End:Play()
	LBD1End:Play()
	RBU1End:Play()
	RBD1End:Play()
	wait(0.1)
	LBU2End:Play()
	LBD2End:Play()
	RBU2End:Play()
	RBD2End:Play()
	wait(0.1)
	LBU3End:Play()
	LBD3End:Play()
	RBU3End:Play()
	RBD3End:Play()
	wait(0.1)
	LBU4End:Play()
	LBD4End:Play()
	RBU4End:Play()
	RBD4End:Play()
	wait(0.1)
	LBU5End:Play()
	LBD5End:Play()
	RBU5End:Play()
	RBD5End:Play()
	wait(0.1)
	LBU6End:Play()
	LBD6End:Play()
	RBU6End:Play()
	RBD6End:Play()
	wait(0.1)
	LBU7End:Play()
	LBD7End:Play()
	RBU7End:Play()
	RBD7End:Play()
	wait(0.1)
	LeftBeaconLamp.BrickColor = BrickColor.new("Forest green")
	RightBeaconLamp.BrickColor = BrickColor.new("Forest green")
	LBU8End:Play()
	LBD8End:Play()
	RBU8End:Play()
	RBD8End:Play()
	wait(0.1)
	LBEnd:Play()
	RBEnd:Play()
	wait(1)
	workspace.RailgunMonitor.Lines.RailgunStatus.SurfaceGui.TextLabel.Text = ("OFFLINE")
	workspace.RailgunMonitor.Lines.RailgunStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(255, 0, 0)
	workspace.RailgunConsole.Button2.Button.ClickDetector.MaxActivationDistance = 10
	workspace.RailgunRadio.RadioClickDetector.ClickDetector.MaxActivationDistance = 10
	if ReloadProjectile1.ReloadProjectile1Value.Value == 1 and ReloadProjectile2.ReloadProjectile2Value.Value == 0 then
		ReloadProjectile2.ClickDetector.MaxActivationDistance = 10
	end
	if ReloadProjectile2.ReloadProjectile2Value.Value == 1 and ReloadProjectile1.ReloadProjectile1Value.Value == 0 then
		ReloadProjectile1.ClickDetector.MaxActivationDistance = 10
	end
	if ReloadProjectile1.ReloadProjectile1Value.Value == 1 and ReloadProjectile2.ReloadProjectile2Value.Value == 1 then
		workspace.ReloadProjectileAS.Case.Cap.CapClickDetector.ClickDetector.MaxActivationDistance = 10
	end
end)

FireButton.ClickDetector.MouseClick:Connect(function()
	wait(10)
	repeat
		RailsTemperatureValue.Value = RailsTemperatureValue.Value - 31
		wait(0.5)
	until
	RailsTemperatureValue.Value < 58
end)
