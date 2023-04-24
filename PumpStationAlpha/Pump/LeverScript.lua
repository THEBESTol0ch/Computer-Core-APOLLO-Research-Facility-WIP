-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue

local BlackControlValue = game.ReplicatedStorage.GameValues.BlackControlValue
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

-- Functions
function DoPull(Mode)
	if Mode == "IN" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn:Play()
		LeverSound:Play()
		LeverValue.Value = "FULL"
		wait(1)
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif Mode == "OUT" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut:Play()
		LeverSound:Play()
		LeverValue.Value = "LOW"
		wait(1)
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end
--

DoPull("IN")

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverValue.Value == "LOW" and BlackControlValue.Value == "IN" then
		DoPull("IN")
	elseif LeverValue.Value == "FULL" then
		DoPull("OUT")
	end
end)

BlackControlValue.Changed:Connect(function()
	if BlackControlValue.Value == "OUT" then
		wait(math.random(1, 10) / 10)
		if LeverValue.Value == "FULL" then
			DoPull("OUT")
		end
	end
end)
