local TweenService = game:GetService("TweenService")

local ReactorStatusValue = workspace.ThermonuclearReactor.CPU.Values.ReactorStatusValue

local Trigger = script.Parent.Parent.Parent.Lever.Trigger
local Lever = script.Parent.Parent.Parent.Lever.Handle.Handle.Handle
local LeverPos5 = script.Parent.Parent.Parent.Lever.LeverPos5
local LeverPos4 = script.Parent.Parent.Parent.Lever.LeverPos4
local LeverPos2 = script.Parent.Parent.Parent.Lever.LeverPos2
local LeverPos1 = script.Parent.Parent.Parent.Lever.LeverPos1
local LeverSound = script.Parent.Parent.Parent.Lever.Handle.Handle.Handle.LeverSound
local LeverPositionValue = script.Parent.Parent.Values.LeverPositionValue
local ReactorTemperatureIncreaseCoefValue = workspace.ThermonuclearReactor.CPU.Values.ReactorTemperatureIncreaseCoefValue
local FuelCapacity = workspace.FuelSystem.CPU.Values.FuelCapacityValue
local OverloadButton = workspace.OverloadConsole.EmergencyButton.Button

local AlarmControlValue = workspace.TNERAlarmSystem.CPU.Values.AlarmControlValue

local LeverPullIn5 = {
	CFrame = LeverPos5.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullIn4 = {
	CFrame = LeverPos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullIn3 = {
	CFrame = Lever.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullIn2 = {
	CFrame = LeverPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut4 = {
	CFrame = LeverPos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut3 = {
	CFrame = Lever.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut2 = {
	CFrame = LeverPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut1 = {
	CFrame = LeverPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local PullLeverAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeverPullIn5 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn5)
local LeverPullIn4 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn4)
local LeverPullIn3 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn3)
local LeverPullIn2 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn2)
local LeverPullOut4 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut4)
local LeverPullOut3 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut3)
local LeverPullOut2 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut2)
local LeverPullOut1 = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut1)

Trigger.ClickDetector.MouseClick:Connect(function()
	CanDisable = true
end)
Trigger.ClickDetector.RightMouseClick:Connect(function()
	CanDisable = true
end)

-- Lever Moving Forward
Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverPositionValue.Value == 1 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn2:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 10
		LeverPositionValue.Value = 2
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverPositionValue.Value == 2 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn3:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 19
		LeverPositionValue.Value = 3
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverPositionValue.Value == 3 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn4:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 23
		LeverPositionValue.Value = 4
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverPositionValue.Value == 4 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn5:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 37
		LeverPositionValue.Value = 5
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)
--

-- Lever Moving Backward
Trigger.ClickDetector.RightMouseClick:Connect(function()
	if LeverPositionValue.Value == 5 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut4:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 23
		LeverPositionValue.Value = 4
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)

Trigger.ClickDetector.RightMouseClick:Connect(function()
	if LeverPositionValue.Value == 4 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut3:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 19
		LeverPositionValue.Value = 3
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)

Trigger.ClickDetector.RightMouseClick:Connect(function()
	if LeverPositionValue.Value == 3 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut2:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 10
		LeverPositionValue.Value = 2
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)

Trigger.ClickDetector.RightMouseClick:Connect(function()
	if LeverPositionValue.Value == 2 then
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut1:Play()
		LeverSound:Play()
		wait(0.1)
		ReactorTemperatureIncreaseCoefValue.Value = 3
		LeverPositionValue.Value = 1
		wait(0.9)
		Trigger.ClickDetector.MaxActivationDistance = 10
		AlarmControlValue.Value = 1
	end
end)
--

CanDisable = false

while true do
	if ReactorStatusValue.Value == 3 and CanDisable == true then
		CanDisable = false
		LeverPullIn3:Play()
		LeverSound:Play()
		ReactorTemperatureIncreaseCoefValue.Value = 19
		wait(0.1)
		LeverPositionValue.Value = 3
	end
	wait(0.1)
end
