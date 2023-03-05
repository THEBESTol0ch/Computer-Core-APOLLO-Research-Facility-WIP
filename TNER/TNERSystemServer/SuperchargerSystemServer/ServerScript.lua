-- Control
local TweenService = game:GetService("TweenService")
local LeftDoorClickDetector = script.Parent.Parent.Parent.LeftDoor.DoorClickDetector
local RightDoorClickDetector = script.Parent.Parent.Parent.RightDoor.DoorClickDetector
--

-- Values
local DoorsStatusValue = script.Parent.Parent.Values.DoorsStatusValue
local AccessGrantedValue = script.Parent.Parent.Parent.KeyCardPanel.CPU.Values.AccessGrantedValue
--

-- Items
local LeftDoorHinge = script.Parent.Parent.Parent.LeftDoor.Hinge
local RightDoorHinge = script.Parent.Parent.Parent.RightDoor.Hinge
--

local LeftDoorUnlockAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LeftDoorAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local RightDoorAnimationSettings = TweenInfo.new(
	7,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeftDoorUnlock = TweenService:Create(LeftDoorHinge, LeftDoorUnlockAnimationSettings, {
	CFrame = LeftDoorHinge.CFrame * CFrame.Angles(math.rad(15), 0, 0)
})
local LeftDoorOpen = TweenService:Create(LeftDoorHinge, LeftDoorAnimationSettings, {
	CFrame = LeftDoorHinge.CFrame * CFrame.Angles(math.rad(165), 0, 0)
})
local LeftDoorClose = TweenService:Create(LeftDoorHinge, LeftDoorAnimationSettings, {
	CFrame = LeftDoorHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RightDoorOpen = TweenService:Create(RightDoorHinge, RightDoorAnimationSettings, {
	CFrame = RightDoorHinge.CFrame * CFrame.Angles(math.rad(-105), 0, 0)
})
local RightDoorClose = TweenService:Create(RightDoorHinge, RightDoorAnimationSettings, {
	CFrame = RightDoorHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

-- Functions
function DoDoors()
	if DoorsStatusValue.Value == "UNLOCKED" then
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		LeftDoorOpen:Play()
		RightDoorOpen:Play()
		wait(8)
		DoorsStatusValue.Value = "OPENED"
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 10
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 10
	else
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 0
		RightDoorClose:Play()
		wait(3)
		LeftDoorClose:Play()
		wait(4)
		DoorsStatusValue.Value = "LOCKED"
	end
end
--

LeftDoorClickDetector.ClickDetector.MouseClick:Connect(function()
	DoDoors()
end)

RightDoorClickDetector.ClickDetector.MouseClick:Connect(function()
	DoDoors()
end)

AccessGrantedValue.Changed:Connect(function()
	if AccessGrantedValue.Value == true and DoorsStatusValue.Value == "LOCKED" then
		DoorsStatusValue.Value = "UNLOCKED"
		LeftDoorUnlock:Play()
		LeftDoorClickDetector.ClickDetector.MaxActivationDistance = 10
		RightDoorClickDetector.ClickDetector.MaxActivationDistance = 10
	end
end)
