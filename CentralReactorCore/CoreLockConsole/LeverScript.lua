-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
local KeyTurnedValue = script.Parent.Parent.Parent.Parent.KeyLock.CPU.Values.KeyTurnedValue
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue
local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
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
		if KeyTurnedValue.Value == true then Trigger.ClickDetector.MaxActivationDistance = 10 end
	elseif Mode == "OUT" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut:Play()
		LeverSound:Play()
		wait(1)
		LeverValue.Value = "LOW"
		if KeyTurnedValue.Value == true then Trigger.ClickDetector.MaxActivationDistance = 10 end
	end
end
--

DoPull("IN")

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverValue.Value == "LOW" then
		DoPull("IN")
	elseif LeverValue.Value == "FULL" then
		DoPull("OUT")
	end
end)

KeyTurnedValue.Changed:Connect(function()
	if KeyTurnedValue.Value == true then
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif KeyTurnedValue.Value == false then
		Trigger.ClickDetector.MaxActivationDistance = 0
	end
end)

CentralReactorCoreStatusValue.Changed:Connect(function()
	if CentralReactorCoreStatusValue.Value == "OFFLINE" then
		DoPull("IN")
	end
end)
