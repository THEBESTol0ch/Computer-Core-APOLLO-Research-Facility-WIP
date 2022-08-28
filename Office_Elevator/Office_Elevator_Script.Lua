local TweenService = game:GetService("TweenService")

local Elevator = script.Parent.ElevatorCabin.Frame
local ElevatorPosF1 = script.Parent.ElevatorCabin.ElevatorPosF1
local ElevatorPosF2 = script.Parent.ElevatorCabin.ElevatorPosF2

local ElevatorMusic = script.Parent.ElevatorCabin.SoundEmitter.ElevatorMusic
local ElevatorBeepSound = script.Parent.ElevatorCabin.SoundEmitter.ElevatorBeepSound
local ElevatorDoorSound = script.Parent.ElevatorCabin.SoundEmitter.ElevatorDoorSound

local ElevatorFloorIndicator = script.Parent.ElevatorCabin.FloorIndicator.SurfaceGui.TextLabel

local F1PortalFloorIndicator = script.Parent.F1Portal.FloorIndicator.SurfaceGui.TextLabel
local F2PortalFloorIndicator = script.Parent.F2Portal.FloorIndicator.SurfaceGui.TextLabel

local ElevatorDoor1 = script.Parent.ElevatorCabin.Door1.Door
local ElevatorDoor2 = script.Parent.ElevatorCabin.Door2.Door
local ElevatorDoor1F1OpenPos = script.Parent.ElevatorCabin.Door1.Door1F1OpenPos
local ElevatorDoor1F1ClosePos = script.Parent.ElevatorCabin.Door1.Door1F1ClosePos
local ElevatorDoor1F2OpenPos = script.Parent.ElevatorCabin.Door1.Door1F2OpenPos
local ElevatorDoor1F2ClosePos = script.Parent.ElevatorCabin.Door1.Door1F2ClosePos

local ElevatorDoor2F1OpenPos = script.Parent.ElevatorCabin.Door2.Door2F1OpenPos
local ElevatorDoor2F1ClosePos = script.Parent.ElevatorCabin.Door2.Door2F1ClosePos
local ElevatorDoor2F2OpenPos = script.Parent.ElevatorCabin.Door2.Door2F2OpenPos
local ElevatorDoor2F2ClosePos = script.Parent.ElevatorCabin.Door2.Door2F2ClosePos

local F1PortalDoor1 = script.Parent.F1Portal.Door1.Door
local F1PortalDoor2 = script.Parent.F1Portal.Door2.Door
local F1PortalDoor1OpenPos = script.Parent.F1Portal.Door1.Door1F1OpenPos
local F1PortalDoor1ClosePos = script.Parent.F1Portal.Door1.Door1F1ClosePos
local F1PortalDoor2OpenPos = script.Parent.F1Portal.Door2.Door2F1OpenPos
local F1PortalDoor2ClosePos = script.Parent.F1Portal.Door2.Door2F1ClosePos

local F2PortalDoor1 = script.Parent.F2Portal.Door1.Door
local F2PortalDoor2 = script.Parent.F2Portal.Door2.Door
local F2PortalDoor1OpenPos = script.Parent.F2Portal.Door1.Door1F2OpenPos
local F2PortalDoor1ClosePos = script.Parent.F2Portal.Door1.Door1F2ClosePos
local F2PortalDoor2OpenPos = script.Parent.F2Portal.Door2.Door2F2OpenPos
local F2PortalDoor2ClosePos = script.Parent.F2Portal.Door2.Door2F2ClosePos

local F1CallButton = script.Parent.F1Portal.CallButton.Button.Button
local F2CallButton = script.Parent.F2Portal.CallButton.Button.Button

local DoorOpenButton = script.Parent.ElevatorCabin.ElevatorControlPanel.DoorOpenButton.Button
local DoorCloseButton = script.Parent.ElevatorCabin.ElevatorControlPanel.DoorCloseButton.Button

local EBTF1 = script.Parent.ElevatorCabin.ElevatorControlPanel.BTF1.Button
local EBTF2 = script.Parent.ElevatorCabin.ElevatorControlPanel.BTF2.Button

local ElevatorTF2 = {
	CFrame = ElevatorPosF2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorTF1 = {
	CFrame = ElevatorPosF1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorDoor1TF2 = {
	CFrame = ElevatorDoor1F2ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2TF2 = {
	CFrame = ElevatorDoor2F2ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor1TF1 = {
	CFrame = ElevatorDoor1F1ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2TF1 = {
	CFrame = ElevatorDoor2F1ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorDoor1F1Open = {
	CFrame = ElevatorDoor1F1OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2F1Open = {
	CFrame = ElevatorDoor2F1OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor1F1Close = {
	CFrame = ElevatorDoor1F1ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2F1Close = {
	CFrame = ElevatorDoor2F1ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ElevatorDoor1F2Open = {
	CFrame = ElevatorDoor1F2OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2F2Open = {
	CFrame = ElevatorDoor2F2OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor1F2Close = {
	CFrame = ElevatorDoor1F2ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ElevatorDoor2F2Close = {
	CFrame = ElevatorDoor2F2ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}



local F1PortalDoor1Open = {
	CFrame = F1PortalDoor1OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local F1PortalDoor2Open = {
	CFrame = F1PortalDoor2OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local F1PortalDoor1Close = {
	CFrame = F1PortalDoor1ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local F1PortalDoor2Close = {
	CFrame = F1PortalDoor2ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local F2PortalDoor1Open = {
	CFrame = F2PortalDoor1OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local F2PortalDoor2Open = {
	CFrame = F2PortalDoor2OpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local F2PortalDoor1Close = {
	CFrame = F2PortalDoor1ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local F2PortalDoor2Close = {
	CFrame = F2PortalDoor2ClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local DoorAnimationSettings = TweenInfo.new(
	2.6,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local ElevatorAnimationSettings = TweenInfo.new(
	10,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local ElevatorTF1 = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorTF1)
local ElevatorTF2 = TweenService:Create(Elevator, ElevatorAnimationSettings, ElevatorTF2)

local ElevatorDoor1TF2 = TweenService:Create(ElevatorDoor1, ElevatorAnimationSettings, ElevatorDoor1TF2)
local ElevatorDoor2TF2 = TweenService:Create(ElevatorDoor2, ElevatorAnimationSettings, ElevatorDoor2TF2)
local ElevatorDoor1TF1 = TweenService:Create(ElevatorDoor1, ElevatorAnimationSettings, ElevatorDoor1TF1)
local ElevatorDoor2TF1 = TweenService:Create(ElevatorDoor2, ElevatorAnimationSettings, ElevatorDoor2TF1)

local ElevatorDoor1F1Open = TweenService:Create(ElevatorDoor1, DoorAnimationSettings, ElevatorDoor1F1Open)
local ElevatorDoor1F1Close = TweenService:Create(ElevatorDoor1, DoorAnimationSettings, ElevatorDoor1F1Close)
local ElevatorDoor2F1Open = TweenService:Create(ElevatorDoor2, DoorAnimationSettings, ElevatorDoor2F1Open)
local ElevatorDoor2F1Close = TweenService:Create(ElevatorDoor2, DoorAnimationSettings, ElevatorDoor2F1Close)

local ElevatorDoor1F2Open = TweenService:Create(ElevatorDoor1, DoorAnimationSettings, ElevatorDoor1F2Open)
local ElevatorDoor1F2Close = TweenService:Create(ElevatorDoor1, DoorAnimationSettings, ElevatorDoor1F2Close)
local ElevatorDoor2F2Open = TweenService:Create(ElevatorDoor2, DoorAnimationSettings, ElevatorDoor2F2Open)
local ElevatorDoor2F2Close = TweenService:Create(ElevatorDoor2, DoorAnimationSettings, ElevatorDoor2F2Close)

local F1PortalDoor1Open = TweenService:Create(F1PortalDoor1, DoorAnimationSettings, F1PortalDoor1Open)
local F1PortalDoor1Close = TweenService:Create(F1PortalDoor1, DoorAnimationSettings, F1PortalDoor1Close)
local F1PortalDoor2Open = TweenService:Create(F1PortalDoor2, DoorAnimationSettings, F1PortalDoor2Open)
local F1PortalDoor2Close = TweenService:Create(F1PortalDoor2, DoorAnimationSettings, F1PortalDoor2Close)

local F2PortalDoor1Open = TweenService:Create(F2PortalDoor1, DoorAnimationSettings, F2PortalDoor1Open)
local F2PortalDoor1Close = TweenService:Create(F2PortalDoor1, DoorAnimationSettings, F2PortalDoor1Close)
local F2PortalDoor2Open = TweenService:Create(F2PortalDoor2, DoorAnimationSettings, F2PortalDoor2Open)
local F2PortalDoor2Close = TweenService:Create(F2PortalDoor2, DoorAnimationSettings, F2PortalDoor2Close)

local CanEvent = true
local DoorStatus = true
local ElevatorCurrentLevel = 1

local function OpenDoors1FPortal()
	DoorStatus = false
	ElevatorDoorSound:Play()
	F1PortalDoor1Open:Play()
	F1PortalDoor2Open:Play()
	wait(0.1)
	ElevatorDoor1F1Open:Play()
	ElevatorDoor2F1Open:Play()
end
local function CloseDoors1FPortal()
	DoorStatus = true
	ElevatorDoorSound:Play()
	ElevatorDoor1F1Close:Play()
	ElevatorDoor2F1Close:Play()
	wait(0.1)
	F1PortalDoor1Close:Play()
	F1PortalDoor2Close:Play()
end
local function OpenDoors2FPortal()
	DoorStatus = false
	ElevatorDoorSound:Play()
	F2PortalDoor1Open:Play()
	F2PortalDoor2Open:Play()
	wait(0.1)
	ElevatorDoor1F2Open:Play()
	ElevatorDoor2F2Open:Play()
end
local function CloseDoors2FPortal()
	DoorStatus = true
	ElevatorDoorSound:Play()
	ElevatorDoor1F2Close:Play()
	ElevatorDoor2F2Close:Play()
	wait(0.1)
	F2PortalDoor1Close:Play()
	F2PortalDoor2Close:Play()
end
local function ElevatorMoveUp()
	ElevatorTF2:Play()
	ElevatorDoor1TF2:Play()
	ElevatorDoor2TF2:Play()
end
local function ElevatorMoveDown()
	ElevatorTF1:Play()
	ElevatorDoor1TF1:Play()
	ElevatorDoor2TF1:Play()
end

DoorOpenButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 1 and DoorStatus == true and CanEvent == true then
		CanEvent = false
		DoorOpenButton.Material = ("Neon")

		DoorStatus = false
		ElevatorDoorSound:Play()
		F1PortalDoor1Open:Play()
		F1PortalDoor2Open:Play()
		wait(0.1)
		ElevatorDoor1F1Open:Play()
		ElevatorDoor2F1Open:Play()
		
		wait(3)
		CanEvent = true
		DoorOpenButton.Material = ("Plastic")
		
		wait(10)
		if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F1Close:Play()
			ElevatorDoor2F1Close:Play()
			wait(0.1)
			F1PortalDoor1Close:Play()
			F1PortalDoor2Close:Play()
			
			wait(3)
			CanEvent = true
		end
	end
end)

DoorOpenButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 2 and DoorStatus == true and CanEvent == true then
		CanEvent = false
		DoorOpenButton.ClickDetector.MaxActivationDistance = 0
		DoorOpenButton.Material = ("Neon")
		
		DoorStatus = false
		ElevatorDoorSound:Play()
		F2PortalDoor1Open:Play()
		F2PortalDoor2Open:Play()
		wait(0.1)
		ElevatorDoor1F2Open:Play()
		ElevatorDoor2F2Open:Play()
		
		wait(3)
		CanEvent = true
		DoorOpenButton.Material = ("Plastic")
		
		wait(10)
		if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F2Close:Play()
			ElevatorDoor2F2Close:Play()
			wait(0.1)
			F2PortalDoor1Close:Play()
			F2PortalDoor2Close:Play()

			wait(3)
			CanEvent = true
			DoorOpenButton.ClickDetector.MaxActivationDistance = 10
		end
	end
end)



DoorCloseButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
		CanEvent = false
		DoorCloseButton.Material = ("Neon")
		F1CallButton.Material = ("Plastic")
		EBTF1.Material = ("Plastic")
		
		DoorStatus = true
		ElevatorDoorSound:Play()
		ElevatorDoor1F1Close:Play()
		ElevatorDoor2F1Close:Play()
		wait(0.1)
		F1PortalDoor1Close:Play()
		F1PortalDoor2Close:Play()
		
		wait(3)
		CanEvent = true
		DoorCloseButton.Material = ("Plastic")
	end
end)

DoorCloseButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
		CanEvent = false
		DoorCloseButton.Material = ("Neon")
		F2CallButton.Material = ("Plastic")
		EBTF2.Material = ("Plastic")
		
		DoorStatus = true
		ElevatorDoorSound:Play()
		ElevatorDoor1F2Close:Play()
		ElevatorDoor2F2Close:Play()
		wait(0.1)
		F2PortalDoor1Close:Play()
		F2PortalDoor2Close:Play()
		
		wait(3)
		CanEvent = true
		DoorCloseButton.Material = ("Plastic")
	end
end)



F1CallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 1 and DoorStatus == true and CanEvent == true then
		CanEvent = false
		F1CallButton.Material = ("Neon")
		EBTF1.Material = ("Neon")

		DoorStatus = false
		ElevatorDoorSound:Play()
		F1PortalDoor1Open:Play()
		F1PortalDoor2Open:Play()
		wait(0.1)
		ElevatorDoor1F1Open:Play()
		ElevatorDoor2F1Open:Play()
		
		wait(3)
		CanEvent = true
		F1CallButton.Material = ("Plastic")
		EBTF1.Material = ("Plastic")
		
		wait(10)
		if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F1Close:Play()
			ElevatorDoor2F1Close:Play()
			wait(0.1)
			F1PortalDoor1Close:Play()
			F1PortalDoor2Close:Play()
			
			wait(3)
			CanEvent = true
		end
	end
end)

F1CallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 2 and CanEvent == true then
		F1CallButton.Material = ("Neon")
		EBTF1.Material = ("Neon")
		ElevatorCurrentLevel = 0
		
		if DoorStatus == true and CanEvent == true then
			CanEvent = false
			ElevatorTF1:Play()
			ElevatorDoor1TF1:Play()
			ElevatorDoor2TF1:Play()
			
			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("1")
			F1PortalFloorIndicator.Text = ("1")
			F2PortalFloorIndicator.Text = ("1")
			ElevatorCurrentLevel = 1
			F1CallButton.Material = ("Plastic")
			EBTF1.Material = ("Plastic")
			
			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F1PortalDoor1Open:Play()
			F1PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F1Open:Play()
			ElevatorDoor2F1Open:Play()
			
			wait(3)
			CanEvent = true
			
			wait(10)

			if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F1Close:Play()
				ElevatorDoor2F1Close:Play()
				wait(0.1)
				F1PortalDoor1Close:Play()
				F1PortalDoor2Close:Play()
				
				wait(3)
				CanEvent = true
			end
		end
		if DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F2Close:Play()
			ElevatorDoor2F2Close:Play()
			wait(0.1)
			F2PortalDoor1Close:Play()
			F2PortalDoor2Close:Play()
			
			wait(3)
			
			ElevatorTF1:Play()
			ElevatorDoor1TF1:Play()
			ElevatorDoor2TF1:Play()
			
			wait(10)
			
			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("1")
			F1PortalFloorIndicator.Text = ("1")
			F2PortalFloorIndicator.Text = ("1")
			ElevatorCurrentLevel = 1
			F1CallButton.Material = ("Plastic")
			EBTF1.Material = ("Plastic")
			
			wait(2)
			
			DoorStatus = false
			ElevatorDoorSound:Play()
			F1PortalDoor1Open:Play()
			F1PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F1Open:Play()
			ElevatorDoor2F1Open:Play()
			
			wait(3)
			CanEvent = true
			
			wait(10)
			
			if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F1Close:Play()
				ElevatorDoor2F1Close:Play()
				wait(0.1)
				F1PortalDoor1Close:Play()
				F1PortalDoor2Close:Play()
				
				wait(3)
				CanEvent = true
			end
		end
	end
end)



F2CallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 2 and DoorStatus == true and CanEvent == true then
		CanEvent = false
		F2CallButton.Material = ("Neon")
		EBTF2.Material = ("Neon")

		DoorStatus = false
		ElevatorDoorSound:Play()
		F2PortalDoor1Open:Play()
		F2PortalDoor2Open:Play()
		wait(0.1)
		ElevatorDoor1F2Open:Play()
		ElevatorDoor2F2Open:Play()

		wait(3)
		CanEvent = true
		F2CallButton.Material = ("Plastic")
		EBTF2.Material = ("Plastic")

		wait(10)
		if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F2Close:Play()
			ElevatorDoor2F2Close:Play()
			wait(0.1)
			F2PortalDoor1Close:Play()
			F2PortalDoor2Close:Play()

			wait(3)
			CanEvent = true
		end
	end
end)

F2CallButton.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 1 and CanEvent == true then
		F2CallButton.Material = ("Neon")
		EBTF2.Material = ("Neon")
		ElevatorCurrentLevel = 0

		if DoorStatus == true and CanEvent == true then
			CanEvent = false
			ElevatorTF2:Play()
			ElevatorDoor1TF2:Play()
			ElevatorDoor2TF2:Play()

			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("2")
			F1PortalFloorIndicator.Text = ("2")
			F2PortalFloorIndicator.Text = ("2")
			ElevatorCurrentLevel = 2
			F2CallButton.Material = ("Plastic")
			EBTF2.Material = ("Plastic")

			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F2PortalDoor1Open:Play()
			F2PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F2Open:Play()
			ElevatorDoor2F2Open:Play()

			wait(3)
			CanEvent = true

			wait(10)

			if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F2Close:Play()
				ElevatorDoor2F2Close:Play()
				wait(0.1)
				F2PortalDoor1Close:Play()
				F2PortalDoor2Close:Play()

				wait(3)
				CanEvent = true
			end
		end
		if DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F1Close:Play()
			ElevatorDoor2F1Close:Play()
			wait(0.1)
			F1PortalDoor1Close:Play()
			F1PortalDoor2Close:Play()

			wait(3)

			ElevatorTF2:Play()
			ElevatorDoor1TF2:Play()
			ElevatorDoor2TF2:Play()

			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("2")
			F1PortalFloorIndicator.Text = ("2")
			F2PortalFloorIndicator.Text = ("2")
			ElevatorCurrentLevel = 2
			F2CallButton.Material = ("Plastic")
			EBTF2.Material = ("Plastic")

			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F2PortalDoor1Open:Play()
			F2PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F2Open:Play()
			ElevatorDoor2F2Open:Play()

			wait(3)
			CanEvent = true

			wait(10)

			if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F2Close:Play()
				ElevatorDoor2F2Close:Play()
				wait(0.1)
				F2PortalDoor1Close:Play()
				F2PortalDoor2Close:Play()

				wait(3)
				CanEvent = true
			end
		end
	end
end)



EBTF1.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 1 and DoorStatus == true and CanEvent == true then
		CanEvent = false
		F1CallButton.Material = ("Neon")
		EBTF1.Material = ("Neon")

		DoorStatus = false
		ElevatorDoorSound:Play()
		F1PortalDoor1Open:Play()
		F1PortalDoor2Open:Play()
		wait(0.1)
		ElevatorDoor1F1Open:Play()
		ElevatorDoor2F1Open:Play()

		wait(3)
		CanEvent = true
		F1CallButton.Material = ("Plastic")
		EBTF1.Material = ("Plastic")

		wait(10)
		if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F1Close:Play()
			ElevatorDoor2F1Close:Play()
			wait(0.1)
			F1PortalDoor1Close:Play()
			F1PortalDoor2Close:Play()

			wait(3)
			CanEvent = true
		end
	end
end)

EBTF1.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 2 and CanEvent == true then
		F1CallButton.Material = ("Neon")
		EBTF1.Material = ("Neon")
		ElevatorCurrentLevel = 0

		if DoorStatus == true and CanEvent == true then
			CanEvent = false
			ElevatorTF1:Play()
			ElevatorDoor1TF1:Play()
			ElevatorDoor2TF1:Play()

			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("1")
			F1PortalFloorIndicator.Text = ("1")
			F2PortalFloorIndicator.Text = ("1")
			ElevatorCurrentLevel = 1
			F1CallButton.Material = ("Plastic")
			EBTF1.Material = ("Plastic")

			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F1PortalDoor1Open:Play()
			F1PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F1Open:Play()
			ElevatorDoor2F1Open:Play()

			wait(3)
			CanEvent = true

			wait(10)

			if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F1Close:Play()
				ElevatorDoor2F1Close:Play()
				wait(0.1)
				F1PortalDoor1Close:Play()
				F1PortalDoor2Close:Play()

				wait(3)
				CanEvent = true
			end
		end
		if DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F2Close:Play()
			ElevatorDoor2F2Close:Play()
			wait(0.1)
			F2PortalDoor1Close:Play()
			F2PortalDoor2Close:Play()

			wait(3)

			ElevatorTF1:Play()
			ElevatorDoor1TF1:Play()
			ElevatorDoor2TF1:Play()

			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("1")
			F1PortalFloorIndicator.Text = ("1")
			F2PortalFloorIndicator.Text = ("1")
			ElevatorCurrentLevel = 1
			F1CallButton.Material = ("Plastic")
			EBTF1.Material = ("Plastic")

			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F1PortalDoor1Open:Play()
			F1PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F1Open:Play()
			ElevatorDoor2F1Open:Play()

			wait(3)
			CanEvent = true

			wait(10)

			if ElevatorCurrentLevel == 1 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F1Close:Play()
				ElevatorDoor2F1Close:Play()
				wait(0.1)
				F1PortalDoor1Close:Play()
				F1PortalDoor2Close:Play()

				wait(3)
				CanEvent = true
			end
		end
	end
end)



EBTF2.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 2 and DoorStatus == true and CanEvent == true then
		CanEvent = false
		F2CallButton.Material = ("Neon")
		EBTF2.Material = ("Neon")

		DoorStatus = false
		ElevatorDoorSound:Play()
		F2PortalDoor1Open:Play()
		F2PortalDoor2Open:Play()
		wait(0.1)
		ElevatorDoor1F2Open:Play()
		ElevatorDoor2F2Open:Play()

		wait(3)
		CanEvent = true
		F2CallButton.Material = ("Plastic")
		EBTF2.Material = ("Plastic")

		wait(10)
		if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F2Close:Play()
			ElevatorDoor2F2Close:Play()
			wait(0.1)
			F2PortalDoor1Close:Play()
			F2PortalDoor2Close:Play()

			wait(3)
			CanEvent = true
		end
	end
end)

EBTF2.ClickDetector.MouseClick:Connect(function()
	if ElevatorCurrentLevel == 1 and CanEvent == true then
		F2CallButton.Material = ("Neon")
		EBTF2.Material = ("Neon")
		ElevatorCurrentLevel = 0

		if DoorStatus == true and CanEvent == true then
			CanEvent = false
			ElevatorTF2:Play()
			ElevatorDoor1TF2:Play()
			ElevatorDoor2TF2:Play()

			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("2")
			F1PortalFloorIndicator.Text = ("2")
			F2PortalFloorIndicator.Text = ("2")
			ElevatorCurrentLevel = 2
			F2CallButton.Material = ("Plastic")
			EBTF2.Material = ("Plastic")

			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F2PortalDoor1Open:Play()
			F2PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F2Open:Play()
			ElevatorDoor2F2Open:Play()

			wait(3)
			CanEvent = true

			wait(10)

			if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F2Close:Play()
				ElevatorDoor2F2Close:Play()
				wait(0.1)
				F2PortalDoor1Close:Play()
				F2PortalDoor2Close:Play()

				wait(3)
				CanEvent = true
			end
		end
		if DoorStatus == false and CanEvent == true then
			CanEvent = false
			DoorStatus = true
			ElevatorDoorSound:Play()
			ElevatorDoor1F1Close:Play()
			ElevatorDoor2F1Close:Play()
			wait(0.1)
			F1PortalDoor1Close:Play()
			F1PortalDoor2Close:Play()

			wait(3)

			ElevatorTF2:Play()
			ElevatorDoor1TF2:Play()
			ElevatorDoor2TF2:Play()

			wait(10)

			ElevatorBeepSound:Play()
			ElevatorFloorIndicator.Text = ("2")
			F1PortalFloorIndicator.Text = ("2")
			F2PortalFloorIndicator.Text = ("2")
			ElevatorCurrentLevel = 2
			F2CallButton.Material = ("Plastic")
			EBTF2.Material = ("Plastic")

			wait(2)

			DoorStatus = false
			ElevatorDoorSound:Play()
			F2PortalDoor1Open:Play()
			F2PortalDoor2Open:Play()
			wait(0.1)
			ElevatorDoor1F2Open:Play()
			ElevatorDoor2F2Open:Play()

			wait(3)
			CanEvent = true

			wait(10)

			if ElevatorCurrentLevel == 2 and DoorStatus == false and CanEvent == true then
				CanEvent = false
				DoorStatus = true
				ElevatorDoorSound:Play()
				ElevatorDoor1F2Close:Play()
				ElevatorDoor2F2Close:Play()
				wait(0.1)
				F2PortalDoor1Close:Play()
				F2PortalDoor2Close:Play()

				wait(3)
				CanEvent = true
			end
		end
	end
end)
