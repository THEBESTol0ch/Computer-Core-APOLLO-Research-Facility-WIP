-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue
--

-- Items
local Lever = script.Parent.Parent.Parent.Lever.Handle
local LeverPos = script.Parent.Parent.Parent.Lever.LeverPos
--

-- Sounds
local LeverSound = script.Parent.Parent.Parent.Lever.Handle.LeverSound
--

local PullLeverAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeverPullIn = {
	CFrame = LeverPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeverPullOut = {
	CFrame = Lever.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullIn = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn)
local LeverPullOut = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut)

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverValue.Value == "LOW" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn:Play()
		LeverSound:Play()
		wait(1)
		LeverValue.Value = "FULL"
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif LeverValue.Value == "FULL" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut:Play()
		LeverSound:Play()
		wait(1)
		LeverValue.Value = "LOW"
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)
