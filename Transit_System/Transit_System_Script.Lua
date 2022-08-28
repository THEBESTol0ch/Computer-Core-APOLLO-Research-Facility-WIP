local TweenService = game:GetService("TweenService")

local Transit = script.Parent.Transit.TransitPrimaryPart
local TransitBackStationPos = script.Parent.TransitBackStation.TransitPoses.TransitPos
local TransitFrontStationPos = script.Parent.TransitFrontStation.TransitPoses.TransitPos

local FrontLeftDoor = script.Parent.Transit.Interior.FrontDoor.LeftDoor
local FrontRightDoor = script.Parent.Transit.Interior.FrontDoor.RightDoor
local BackLeftDoor = script.Parent.Transit.Interior.BackDoor.LeftDoor
local BackRightDoor = script.Parent.Transit.Interior.BackDoor.RightDoor

local FrontStationFrontLeftDoorClosePos = script.Parent.TransitFrontStation.TransitPoses.FrontLeftDoorClosePos
local FrontStationFrontRightDoorClosePos = script.Parent.TransitFrontStation.TransitPoses.FrontRightDoorClosePos
local FrontStationBackLeftDoorClosePos = script.Parent.TransitFrontStation.TransitPoses.BackLeftDoorClosePos
local FrontStationBackRightDoorClosePos = script.Parent.TransitFrontStation.TransitPoses.BackRightDoorClosePos
local FrontStationFrontLeftDoorOpenPos = script.Parent.TransitFrontStation.TransitPoses.FrontLeftDoorOpenPos
local FrontStationFrontRightDoorOpenPos = script.Parent.TransitFrontStation.TransitPoses.FrontRightDoorOpenPos

local BackStationBackLeftDoorClosePos = script.Parent.TransitBackStation.TransitPoses.BackLeftDoorClosePos
local BackStationBackRightDoorClosePos = script.Parent.TransitBackStation.TransitPoses.BackRightDoorClosePos
local BackStationFrontLeftDoorClosePos = script.Parent.TransitBackStation.TransitPoses.FrontLeftDoorClosePos
local BackStationFrontRightDoorClosePos = script.Parent.TransitBackStation.TransitPoses.FrontRightDoorClosePos
local BackStationBackLeftDoorOpenPos = script.Parent.TransitBackStation.TransitPoses.BackLeftDoorOpenPos
local BackStationBackRightDoorOpenPos = script.Parent.TransitBackStation.TransitPoses.BackRightDoorOpenPos

local FrontDoorTransitButton = script.Parent.Transit.Interior.FrontDoor.FrontDoorTransitButton.Button
local BackDoorTransitButton = script.Parent.Transit.Interior.BackDoor.BackDoorTransitButton.Button
local FrontStationButton = script.Parent.TransitFrontStation.TransitStationGates.RightGate.Button.Button
local FrontStationButtonFrame = script.Parent.TransitFrontStation.TransitStationGates.RightGate.Button.ButtonFrame
local BackStationButton = script.Parent.TransitBackStation.TransitStationGates.RightGate.Button.Button
local BackStationButtonFrame = script.Parent.TransitBackStation.TransitStationGates.RightGate.Button.ButtonFrame

local TransitLeavingStationInteriorSound = script.Parent.Transit.SoundEmitter.TransitLeavingStationInteriorSound
local TransitArrivingStationInteriorSound = script.Parent.Transit.SoundEmitter.TransitArrivingStationInteriorSound

local TransitArrivingFrontStationSound = script.Parent.TransitFrontStation.TransitPoses.TransitPos.TransitArrivingStationSound
local TransitLeavingFrontStationSound = script.Parent.TransitFrontStation.TransitPoses.TransitPos.TransitLeavingStationSound
local TransitArrivingBackStationSound = script.Parent.TransitBackStation.TransitPoses.TransitPos.TransitArrivingStationSound
local TransitLeavingBackStationSound = script.Parent.TransitBackStation.TransitPoses.TransitPos.TransitLeavingStationSound

local TransitAtFrontStationValue = script.Parent.Transit.TransitAtFrontStationValue
local TransitAtBackStationValue = script.Parent.Transit.TransitAtBackStationValue
local FrontStationTransitBlastDoorValue = script.Parent.TransitFrontStation.TransitBlastDoor.TransitBlastDoorValue
local BackStationTransitBlastDoorValue = script.Parent.TransitBackStation.TransitBlastDoor.TransitBlastDoorValue
local FrontStationTransitGatesValue = script.Parent.TransitFrontStation.TransitStationGates.TransitStationGatesValue
local BackStationTransitGatesValue = script.Parent.TransitBackStation.TransitStationGates.TransitStationGatesValue
local FrontStationEmergencyLampValue = script.Parent.TransitFrontStation.EmergencyLamps.EmergencyLampValue
local BackStationEmergencyLampValue = script.Parent.TransitBackStation.EmergencyLamps.EmergencyLampValue

local CanDo = true
local CanSound = false

local TransitMovingToFrontStation = {
	CFrame = TransitFrontStationPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
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
	28,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local TransitMovingToFrontStation = TweenService:Create(Transit, TransitAnimationSettings, TransitMovingToFrontStation)
local TransitMovingToBackStation = TweenService:Create(Transit, TransitAnimationSettings, TransitMovingToBackStation)

local FrontStationFrontLeftDoorOpen = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, FrontStationFrontLeftDoorOpen)
local FrontStationFrontRightDoorOpen = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, FrontStationFrontRightDoorOpen)
local FrontStationFrontLeftDoorClose = TweenService:Create(FrontLeftDoor, TransitDoorAnimationSettings, FrontStationFrontLeftDoorClose)
local FrontStationFrontRightDoorClose = TweenService:Create(FrontRightDoor, TransitDoorAnimationSettings, FrontStationFrontRightDoorClose)

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

BackStationButton.ClickDetector.MouseClick:Connect(function()
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	FrontDoorTransitButton.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	BackStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
	BackStationButtonFrame.Material = ("Neon")
	TransitArrivingBackStationSound:Play()
	TransitAtFrontStationValue.Value = 0
	FrontStationEmergencyLampValue.Value = 1
	BackStationEmergencyLampValue.Value = 1
	FrontStationTransitGatesValue.Value = 0
	FrontStationTransitBlastDoorValue.Value = 1
	FrontStationFrontLeftDoorClose:Play()
	FrontStationFrontRightDoorClose:Play()
	TransitLeavingFrontStationSound:Play()
	TransitLeavingStationInteriorSound.TimePosition = 1
	TransitLeavingStationInteriorSound:Play()
	wait(4)
	CanSound = true
	TransitMovingToBackStation:Play()
	FrontLeftDoorMovingToBackStation:Play()
	FrontRightDoorMovingToBackStation:Play()
	BackLeftDoorMovingToBackStation:Play()
	BackRightDoorMovingToBackStation:Play()
	wait(3)
	FrontStationTransitBlastDoorValue.Value = 0
	wait(10)
	FrontStationEmergencyLampValue.Value = 0
	wait(6)
	BackStationTransitBlastDoorValue.Value = 1
	wait(7)
	BackStationTransitBlastDoorValue.Value = 0
	wait(8)
	BackStationEmergencyLampValue.Value = 0
	wait(2)
	TransitAtBackStationValue.Value = 1
	BackStationBackLeftDoorOpen:Play()
	BackStationBackRightDoorOpen:Play()
	wait(2)
	BackStationTransitGatesValue.Value = 1
	wait(5)
	TransitAtBackStationValue.Value = 1
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	FrontStationButton.ClickDetector.MaxActivationDistance = 10
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	BackStationButtonFrame.Material = ("Plastic")
	FrontStationButtonFrame.Material = ("Neon")
	FrontDoorTransitButton.Material = ("Neon")
	BackDoorTransitButton.Material = ("Neon")
end)

BackStationButton.ClickDetector.MouseClick:Connect(function()
	wait(17)
	CanSound = false
	TransitArrivingStationInteriorSound:Play()
	wait(9)
	wait(7)
	TransitArrivingStationInteriorSound:Stop()
end)

FrontStationButton.ClickDetector.MouseClick:Connect(function()
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 0
	FrontDoorTransitButton.Material = ("Plastic")
	BackDoorTransitButton.Material = ("Plastic")
	FrontStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
	FrontStationButtonFrame.Material = ("Neon")
	TransitArrivingFrontStationSound:Play()
	TransitAtBackStationValue.Value = 0
	FrontStationEmergencyLampValue.Value = 1
	BackStationEmergencyLampValue.Value = 1
	BackStationTransitGatesValue.Value = 0
	BackStationTransitBlastDoorValue.Value = 1
	BackStationBackLeftDoorClose:Play()
	BackStationBackRightDoorClose:Play()
	TransitLeavingBackStationSound:Play()
	TransitLeavingStationInteriorSound.TimePosition = 1
	TransitLeavingStationInteriorSound:Play()
	wait(4)
	CanSound = true
	TransitMovingToFrontStation:Play()
	FrontLeftDoorMovingToFrontStation:Play()
	FrontRightDoorMovingToFrontStation:Play()
	BackLeftDoorMovingToFrontStation:Play()
	BackRightDoorMovingToFrontStation:Play()
	wait(3)
	BackStationTransitBlastDoorValue.Value = 0
	wait(10)
	BackStationEmergencyLampValue.Value = 0
	wait(6)
	FrontStationTransitBlastDoorValue.Value = 1
	wait(7)
	FrontStationTransitBlastDoorValue.Value = 0
	wait(8)
	FrontStationEmergencyLampValue.Value = 0
	wait(2)
	FrontStationFrontLeftDoorOpen:Play()
	FrontStationFrontRightDoorOpen:Play()
	wait(2)
	FrontStationTransitGatesValue.Value = 1
	wait(5)
	TransitAtFrontStationValue.Value = 1
	FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	BackDoorTransitButton.ClickDetector.MaxActivationDistance = 10
	FrontStationButton.ClickDetector.MaxActivationDistance = 0
	BackStationButton.ClickDetector.MaxActivationDistance = 10
	FrontStationButtonFrame.BrickColor = BrickColor.new("Forest green")
	FrontStationButtonFrame.Material = ("Plastic")
	BackStationButtonFrame.Material = ("Neon")
	FrontDoorTransitButton.Material = ("Neon")
	BackDoorTransitButton.Material = ("Neon")
end)

FrontStationButton.ClickDetector.MouseClick:Connect(function()
	wait(17)
	CanSound = false
	TransitArrivingStationInteriorSound:Play()
	wait(9)
	wait(7)
	TransitArrivingStationInteriorSound:Stop()
end)

FrontDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtFrontStationValue.Value == 1 then
		FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		FrontStationButton.ClickDetector.MaxActivationDistance = 0
		BackStationButton.ClickDetector.MaxActivationDistance = 0
		FrontDoorTransitButton.Material = ("Plastic")
		BackDoorTransitButton.Material = ("Plastic")
		BackStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
		BackStationButtonFrame.Material = ("Neon")
		TransitArrivingBackStationSound:Play()
		TransitAtFrontStationValue.Value = 0
		FrontStationEmergencyLampValue.Value = 1
		BackStationEmergencyLampValue.Value = 1
		FrontStationTransitGatesValue.Value = 0
		FrontStationTransitBlastDoorValue.Value = 1
		FrontStationFrontLeftDoorClose:Play()
		FrontStationFrontRightDoorClose:Play()
		TransitLeavingFrontStationSound:Play()
		TransitLeavingStationInteriorSound.TimePosition = 1
		TransitLeavingStationInteriorSound:Play()
		wait(4)
		CanSound = true
		TransitMovingToBackStation:Play()
		FrontLeftDoorMovingToBackStation:Play()
		FrontRightDoorMovingToBackStation:Play()
		BackLeftDoorMovingToBackStation:Play()
		BackRightDoorMovingToBackStation:Play()
		wait(3)
		FrontStationTransitBlastDoorValue.Value = 0
		wait(10)
		FrontStationEmergencyLampValue.Value = 0
		wait(6)
		BackStationTransitBlastDoorValue.Value = 1
		wait(7)
		BackStationTransitBlastDoorValue.Value = 0
		wait(8)
		BackStationEmergencyLampValue.Value = 0
		wait(2)
		BackStationBackLeftDoorOpen:Play()
		BackStationBackRightDoorOpen:Play()
		wait(2)
		BackStationTransitGatesValue.Value = 1
		wait(5)
		TransitAtBackStationValue.Value = 1
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
end)

FrontDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtBackStationValue.Value == 1 then
		FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		FrontStationButton.ClickDetector.MaxActivationDistance = 0
		BackStationButton.ClickDetector.MaxActivationDistance = 0
		FrontDoorTransitButton.Material = ("Plastic")
		BackDoorTransitButton.Material = ("Plastic")
		FrontStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
		FrontStationButtonFrame.Material = ("Neon")
		TransitArrivingFrontStationSound:Play()
		TransitAtBackStationValue.Value = 0
		FrontStationEmergencyLampValue.Value = 1
		BackStationEmergencyLampValue.Value = 1
		BackStationTransitGatesValue.Value = 0
		BackStationTransitBlastDoorValue.Value = 1
		BackStationBackLeftDoorClose:Play()
		BackStationBackRightDoorClose:Play()
		TransitLeavingBackStationSound:Play()
		TransitLeavingStationInteriorSound.TimePosition = 1
		TransitLeavingStationInteriorSound:Play()
		wait(4)
		CanSound = true
		TransitMovingToFrontStation:Play()
		FrontLeftDoorMovingToFrontStation:Play()
		FrontRightDoorMovingToFrontStation:Play()
		BackLeftDoorMovingToFrontStation:Play()
		BackRightDoorMovingToFrontStation:Play()
		wait(3)
		BackStationTransitBlastDoorValue.Value = 0
		wait(10)
		BackStationEmergencyLampValue.Value = 0
		wait(6)
		FrontStationTransitBlastDoorValue.Value = 1
		wait(7)
		FrontStationTransitBlastDoorValue.Value = 0
		wait(8)
		FrontStationEmergencyLampValue.Value = 0
		wait(2)
		FrontStationFrontLeftDoorOpen:Play()
		FrontStationFrontRightDoorOpen:Play()
		wait(2)
		FrontStationTransitGatesValue.Value = 1
		wait(5)
		TransitAtFrontStationValue.Value = 1
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
end)

FrontDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtFrontStationValue.Value == 1 then
		wait(17)
		CanSound = false
		TransitArrivingStationInteriorSound:Play()
		wait(9)
		wait(7)
		TransitArrivingStationInteriorSound:Stop()
	end
end)

FrontDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtBackStationValue.Value == 1 then
		wait(17)
		CanSound = false
		TransitArrivingStationInteriorSound:Play()
		wait(9)
		wait(7)
		TransitArrivingStationInteriorSound:Stop()
	end
end)

BackDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtFrontStationValue.Value == 1 then
		FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		FrontStationButton.ClickDetector.MaxActivationDistance = 0
		BackStationButton.ClickDetector.MaxActivationDistance = 0
		FrontDoorTransitButton.Material = ("Plastic")
		BackDoorTransitButton.Material = ("Plastic")
		BackStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
		BackStationButtonFrame.Material = ("Neon")
		TransitArrivingBackStationSound:Play()
		TransitAtFrontStationValue.Value = 0
		FrontStationEmergencyLampValue.Value = 1
		BackStationEmergencyLampValue.Value = 1
		FrontStationTransitGatesValue.Value = 0
		FrontStationTransitBlastDoorValue.Value = 1
		FrontStationFrontLeftDoorClose:Play()
		FrontStationFrontRightDoorClose:Play()
		TransitLeavingFrontStationSound:Play()
		TransitLeavingStationInteriorSound.TimePosition = 1
		TransitLeavingStationInteriorSound:Play()
		wait(4)
		CanSound = true
		TransitMovingToBackStation:Play()
		FrontLeftDoorMovingToBackStation:Play()
		FrontRightDoorMovingToBackStation:Play()
		BackLeftDoorMovingToBackStation:Play()
		BackRightDoorMovingToBackStation:Play()
		wait(3)
		FrontStationTransitBlastDoorValue.Value = 0
		wait(10)
		FrontStationEmergencyLampValue.Value = 0
		wait(6)
		BackStationTransitBlastDoorValue.Value = 1
		wait(7)
		BackStationTransitBlastDoorValue.Value = 0
		wait(8)
		BackStationEmergencyLampValue.Value = 0
		wait(2)
		BackStationBackLeftDoorOpen:Play()
		BackStationBackRightDoorOpen:Play()
		wait(2)
		BackStationTransitGatesValue.Value = 1
		wait(5)
		TransitAtBackStationValue.Value = 1
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
end)

BackDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtBackStationValue.Value == 1 then
		FrontDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		BackDoorTransitButton.ClickDetector.MaxActivationDistance = 0
		FrontStationButton.ClickDetector.MaxActivationDistance = 0
		BackStationButton.ClickDetector.MaxActivationDistance = 0
		FrontDoorTransitButton.Material = ("Plastic")
		BackDoorTransitButton.Material = ("Plastic")
		FrontStationButtonFrame.BrickColor = BrickColor.new("Neon orange")
		FrontStationButtonFrame.Material = ("Neon")
		TransitArrivingFrontStationSound:Play()
		TransitAtBackStationValue.Value = 0
		FrontStationEmergencyLampValue.Value = 1
		BackStationEmergencyLampValue.Value = 1
		BackStationTransitGatesValue.Value = 0
		BackStationTransitBlastDoorValue.Value = 1
		BackStationBackLeftDoorClose:Play()
		BackStationBackRightDoorClose:Play()
		TransitLeavingBackStationSound:Play()
		TransitLeavingStationInteriorSound.TimePosition = 1
		TransitLeavingStationInteriorSound:Play()
		wait(4)
		CanSound = true
		TransitMovingToFrontStation:Play()
		FrontLeftDoorMovingToFrontStation:Play()
		FrontRightDoorMovingToFrontStation:Play()
		BackLeftDoorMovingToFrontStation:Play()
		BackRightDoorMovingToFrontStation:Play()
		wait(3)
		BackStationTransitBlastDoorValue.Value = 0
		wait(10)
		BackStationEmergencyLampValue.Value = 0
		wait(6)
		FrontStationTransitBlastDoorValue.Value = 1
		wait(7)
		FrontStationTransitBlastDoorValue.Value = 0
		wait(8)
		FrontStationEmergencyLampValue.Value = 0
		wait(2)
		FrontStationFrontLeftDoorOpen:Play()
		FrontStationFrontRightDoorOpen:Play()
		wait(2)
		FrontStationTransitGatesValue.Value = 1
		wait(5)
		TransitAtFrontStationValue.Value = 1
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
end)

BackDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtFrontStationValue.Value == 1 then
		wait(17)
		CanSound = false
		TransitArrivingStationInteriorSound:Play()
		wait(9)
		wait(7)
		TransitArrivingStationInteriorSound:Stop()
	end
end)

BackDoorTransitButton.ClickDetector.MouseClick:Connect(function()
	if TransitAtBackStationValue.Value == 1 then
		wait(17)
		CanSound = false
		TransitArrivingStationInteriorSound:Play()
		wait(9)
		wait(7)
		TransitArrivingStationInteriorSound:Stop()
	end
end)
