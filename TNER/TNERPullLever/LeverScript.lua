-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
--

-- Values
local LeverPositionValue = script.Parent.Parent.Values.LeverPositionValue
local PreviousLeverPositionValue = script.Parent.Parent.Values.PreviousLeverPositionValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local TNERFuse5StatusValue = workspace.TNERFuse5.CPU.Values.TNERFuse5StatusValue
--

-- Items
local Lever = script.Parent.Parent.Parent.Lever.Handle
local Positions = script.Parent.Parent.Parent.Lever.Positions
--

-- Sounds
local LeverSound = script.Parent.Parent.Parent.Lever.Handle.LeverSound
local Alarm = workspace.TNERAlarmSystem.SoundEmitter.Alarm3
local OverloadStopUnsuccessSound = workspace.TNER.SoundEmitter.OverloadStopUnsuccessSound
--

local PullLeverAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverPositionValue.Value < 5 then
		PreviousLeverPositionValue.Value = LeverPositionValue.Value
		LeverPositionValue.Value = LeverPositionValue.Value + 1
	end
end)

Trigger.ClickDetector.RightMouseClick:Connect(function()
	if LeverPositionValue.Value > 1 then
		PreviousLeverPositionValue.Value = LeverPositionValue.Value
		LeverPositionValue.Value = LeverPositionValue.Value - 1
	end
end)

LeverPositionValue.Changed:Connect(function()
	Trigger.ClickDetector.MaxActivationDistance = 0
	TweenService:Create(Lever, PullLeverAnimationSettings, { CFrame = Positions["LeverPos"..LeverPositionValue.Value].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	LeverSound:Play()
	wait(1)
	if TNERStatusValue.Value == "ONLINE" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "ONLINE" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		Trigger.ClickDetector.MaxActivationDistance = 0	
		LeverPositionValue.Value = 3
		PreviousLeverPositionValue.Value = 2
	elseif TNERStatusValue.Value == "UNSTABLE" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPositionValue.Value = 5
		PreviousLeverPositionValue.Value = 4
	end
end)
