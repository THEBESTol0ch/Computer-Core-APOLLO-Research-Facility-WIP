-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local TransitStationGatesValue = script.Parent.Parent.Values.TransitStationGatesValue
--

-- Items
local LeftDoor = script.Parent.Parent.Parent.LeftDoor.Frame
local LeftDoorOpenPos = script.Parent.Parent.Parent.LeftDoor.DoorOpenPos
local LeftDoorClosePos = script.Parent.Parent.Parent.LeftDoor.DoorClosePos
local Lock = script.Parent.Parent.Parent.LeftDoor.Lock.UpLock.MainRod.Rod
local LockOpen1Pos = script.Parent.Parent.Parent.LeftDoor.Lock.UpLock.MainRod.RodOpenPos1
local LockOpen2Pos = script.Parent.Parent.Parent.LeftDoor.Lock.UpLock.MainRod.RodOpenPos2
local LockClosePos = script.Parent.Parent.Parent.LeftDoor.Lock.UpLock.MainRod.RodLockPos

local RightDoor = script.Parent.Parent.Parent.RightDoor.Frame
local RightDoorOpenPos = script.Parent.Parent.Parent.RightDoor.DoorOpenPos
local RightDoorClosePos = script.Parent.Parent.Parent.RightDoor.DoorClosePos
--

-- Sounds
local TransitStationDoorSound = script.Parent.Parent.Parent.SoundEmitter.TransitStationDoorSound
--

local LeftDoorOpen = {
	CFrame = LeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftDoorClose = {
	CFrame = LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LockOpen1 = {
	CFrame = LockOpen1Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LockOpen2 = {
	CFrame = LockOpen2Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LockClose1 = {
	CFrame = LockOpen1Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LockClose2 = {
	CFrame = LockClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RightDoorOpen = {
	CFrame = RightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightDoorClose = {
	CFrame = RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local DoorAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Bounce,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LockAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeftDoorOpen = TweenService:Create(LeftDoor, DoorAnimationSettings, LeftDoorOpen)
local LeftDoorClose = TweenService:Create(LeftDoor, DoorAnimationSettings, LeftDoorClose)
local LockOpen1 = TweenService:Create(Lock, LockAnimationSettings, LockOpen1)
local LockOpen2 = TweenService:Create(Lock, DoorAnimationSettings, LockOpen2)
local LockClose1 = TweenService:Create(Lock, DoorAnimationSettings, LockClose1)
local LockClose2 = TweenService:Create(Lock, LockAnimationSettings, LockClose2)

local RightDoorOpen = TweenService:Create(RightDoor, DoorAnimationSettings, RightDoorOpen)
local RightDoorClose = TweenService:Create(RightDoor, DoorAnimationSettings, RightDoorClose)

-- Functions
function DoGates(Mode)
	if Mode == "OPEN" then
		TransitStationGatesValue.Value = "OPENING"
		TransitStationDoorSound:Play()
		LockOpen1:Play()
		wait(1)
		LockOpen2:Play()
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		wait(2.5)
		TransitStationGatesValue.Value = "OPENED"
	elseif Mode == "CLOSE" then
		TransitStationGatesValue.Value = "CLOSING"
		TransitStationDoorSound:Play()
		LockClose1:Play()
		LeftDoorClose:Play()
		RightDoorClose:Play()
		wait(2.5)		
		LockClose2:Play()
		wait(1)
		TransitStationGatesValue.Value = "CLOSED"
	end
end
--

TransitStationGatesValue.Changed:Connect(function()
	if TransitStationGatesValue.Value == "OPEN" then
		DoGates("OPEN")
	end
	if TransitStationGatesValue.Value == "CLOSE" then
		DoGates("CLOSE")
	end
end)
