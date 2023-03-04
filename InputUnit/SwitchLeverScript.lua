-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
local DoorTrigger = script.Parent.Parent.Parent.Door.Trigger
--

-- Values
local SwitchLeverValue = script.Parent.Parent.Values.SwitchLeverValue
--

-- Items
local LeverHinge = script.Parent.Parent.Parent.Lever.Hinge
--

-- Sounds
local SwitchLeverSound = script.Parent.Parent.Parent.Lever.Frame.SwitchLeverSound
--

local SwitchLeverAnimationSettings = TweenInfo.new(
	0.98,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local SwitchLeverMoveDown = TweenService:Create(LeverHinge, SwitchLeverAnimationSettings, {
	CFrame = LeverHinge.CFrame * CFrame.Angles(math.rad(-180), 0, 0)
})
local SwitchLeverMoveUp = TweenService:Create(LeverHinge, SwitchLeverAnimationSettings, {
	CFrame = LeverHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

Trigger.ClickDetector.MouseClick:Connect(function()
	if SwitchLeverValue.Value == "UP" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		DoorTrigger.ClickDetector.MaxActivationDistance = 0
		SwitchLeverMoveDown:Play()
		SwitchLeverSound:Play()
		wait(1)
		SwitchLeverValue.Value = "DOWN"
		wait(1)
		Trigger.ClickDetector.MaxActivationDistance = 10
		DoorTrigger.ClickDetector.MaxActivationDistance = 10
	elseif SwitchLeverValue.Value == "DOWN" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		DoorTrigger.ClickDetector.MaxActivationDistance = 0
		SwitchLeverMoveUp:Play()
		SwitchLeverSound:Play()
		wait(1)
		SwitchLeverValue.Value = "UP"
		wait(1)
		Trigger.ClickDetector.MaxActivationDistance = 10
		DoorTrigger.ClickDetector.MaxActivationDistance = 10
	end
end)
