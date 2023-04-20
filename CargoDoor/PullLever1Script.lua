-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue
local SecondLeverValue = script.Parent.Parent.Parent.Parent.Parent.CargoDoorConsole2.PullLever.CPU.Values.LeverValue
local KeyTurnedValue = script.Parent.Parent.Parent.Parent.KeyLock.CPU.Values.KeyTurnedValue
local CargoDoorStatusValue = script.Parent.Parent.Parent.Parent.Parent.CPU.Values.CargoDoorStatusValue
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
function PullIn()
	LeverValue.Value = "FULL"
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverPullIn:Play()
	LeverSound:Play()
end
function PullOut()
	LeverValue.Value = "LOW"
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverPullOut:Play()
	LeverSound:Play()
end

function DoCheck()
	if (CargoDoorStatusValue.Value == "OPENED" or CargoDoorStatusValue.Value == "CLOSED") and KeyTurnedValue.Value == true then
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif KeyTurnedValue.Value == false then
		Trigger.ClickDetector.MaxActivationDistance = 0
	end
end
--

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverValue.Value == "LOW" then
		PullIn()
	elseif LeverValue.Value == "FULL" then
		PullOut()
	end
end)

KeyTurnedValue.Changed:Connect(function()
	DoCheck()
end)
CargoDoorStatusValue.Changed:Connect(function()
	DoCheck()
end)

SecondLeverValue.Changed:Connect(function()
	if SecondLeverValue.Value == "FULL" then
		PullIn()
	elseif SecondLeverValue.Value == "LOW" then
		PullOut()
	end
end)
