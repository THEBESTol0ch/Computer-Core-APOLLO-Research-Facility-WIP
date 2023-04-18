-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local TransitBlastDoorValue = script.Parent.Parent.Values.TransitBlastDoorValue
--

-- Items
local LeftDoor = script.Parent.Parent.Parent.LeftDoor.Frame
local LeftDoorOpenPos = script.Parent.Parent.Parent.LeftDoor.DoorOpenPos
local LeftDoorClosePos = script.Parent.Parent.Parent.LeftDoor.DoorClosePos
local LeftLock = script.Parent.Parent.Parent.LeftDoor.Lock.UpLock
local LeftLockClosePos = script.Parent.Parent.Parent.LeftDoor.Lock.LockClosePos
local LeftLockOpen1Pos = script.Parent.Parent.Parent.LeftDoor.Lock.LockOpen1Pos
local LeftLockOpen2Pos = script.Parent.Parent.Parent.LeftDoor.Lock.LockOpen2Pos

local RightDoor = script.Parent.Parent.Parent.RightDoor.Frame
local RightDoorOpenPos = script.Parent.Parent.Parent.RightDoor.DoorOpenPos
local RightDoorClosePos = script.Parent.Parent.Parent.RightDoor.DoorClosePos
local RightLock = script.Parent.Parent.Parent.RightDoor.Lock.UpLock
local RightLockClosePos = script.Parent.Parent.Parent.RightDoor.Lock.LockClosePos
local RightLockOpen1Pos = script.Parent.Parent.Parent.RightDoor.Lock.LockOpen1Pos
local RightLockOpen2Pos = script.Parent.Parent.Parent.RightDoor.Lock.LockOpen2Pos
--

local LeftDoorOpen = {
	CFrame = LeftDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftDoorClose = {
	CFrame = LeftDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftLockOpen1 = {
	CFrame = LeftLockOpen1Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftLockOpen2 = {
	CFrame = LeftLockOpen2Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftLockClose1 = {
	CFrame = LeftLockOpen1Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeftLockClose2 = {
	CFrame = LeftLockClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RightDoorOpen = {
	CFrame = RightDoorOpenPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightDoorClose = {
	CFrame = RightDoorClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightLockOpen1 = {
	CFrame = RightLockOpen1Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightLockOpen2 = {
	CFrame = RightLockOpen2Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightLockClose1 = {
	CFrame = RightLockOpen1Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RightLockClose2 = {
	CFrame = RightLockClosePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local DoorAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LockAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeftDoorOpen = TweenService:Create(LeftDoor, DoorAnimationSettings, LeftDoorOpen)
local LeftDoorClose = TweenService:Create(LeftDoor, DoorAnimationSettings, LeftDoorClose)
local LeftLockOpen1 = TweenService:Create(LeftLock, LockAnimationSettings, LeftLockOpen1)
local LeftLockOpen2 = TweenService:Create(LeftLock, DoorAnimationSettings, LeftLockOpen2)
local LeftLockClose1 = TweenService:Create(LeftLock, DoorAnimationSettings, LeftLockClose1)
local LeftLockClose2 = TweenService:Create(LeftLock, LockAnimationSettings, LeftLockClose2)

local RightDoorOpen = TweenService:Create(RightDoor, DoorAnimationSettings, RightDoorOpen)
local RightDoorClose = TweenService:Create(RightDoor, DoorAnimationSettings, RightDoorClose)
local RightLockOpen1 = TweenService:Create(RightLock, LockAnimationSettings, RightLockOpen1)
local RightLockOpen2 = TweenService:Create(RightLock, DoorAnimationSettings, RightLockOpen2)
local RightLockClose1 = TweenService:Create(RightLock, DoorAnimationSettings, RightLockClose1)
local RightLockClose2 = TweenService:Create(RightLock, LockAnimationSettings, RightLockClose2)

-- Functions
function DoBlastDoor(Mode)
	if Mode == "OPEN" then
		TransitBlastDoorValue.Value = "OPENING"
		LeftLockOpen1:Play()
		RightLockOpen1:Play()
		wait(2.5)
		LeftLockOpen2:Play()
		RightLockOpen2:Play()
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		wait(3.5)
		TransitBlastDoorValue.Value = "OPENED"
	elseif Mode == "CLOSE" then
		TransitBlastDoorValue.Value = "CLOSING"
		LeftLockClose1:Play()
		RightLockClose1:Play()
		LeftDoorClose:Play()
		RightDoorClose:Play()
		wait(3.5)		
		LeftLockClose2:Play()
		RightLockClose2:Play()
		wait(2.5)
		TransitBlastDoorValue.Value = "CLOSED"
	end
end
--

TransitBlastDoorValue.Changed:Connect(function()
	if TransitBlastDoorValue.Value == "OPEN" then
		DoBlastDoor("OPEN")
	end
	if TransitBlastDoorValue.Value == "CLOSE" then
		DoBlastDoor("CLOSE")
	end
end)
