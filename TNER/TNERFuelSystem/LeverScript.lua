-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
local FRButton = workspace[script.Parent.Parent.Parent.Name:split("PullLever")[1].."CapButton"].Button
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue
local FRStatusValue = workspace.TNERFuelSystem[script.Parent.Parent.Parent.Name:split("PullLever")[1]].CPU.Values.FRStatusValue
local ServerStatusValue = workspace.TNERSystemServer.Servers.FuelSystemServer.CPU.Values.ServerStatusValue
local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
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
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverPullIn:Play()
	LeverSound:Play()
	wait(1)
	LeverValue.Value = "FULL"
end
function PullOut()
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverPullOut:Play()
	LeverSound:Play()
	wait(1)
	LeverValue.Value = "LOW"
end
function DoCheck()
	if FRStatusValue.Value == "FUEL INSERTED" and ServerStatusValue.Value == "ONLINE" then
		Trigger.ClickDetector.MaxActivationDistance = 10
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

FRButton.ClickDetector.MouseClick:Connect(function()
	if FRStatusValue.Value == "INJECTED" then
		Trigger.ClickDetector.MaxActivationDistance = 10
		FuelCapacityValue.Value = 0
	end
end)

FRStatusValue.Changed:Connect(function()
	DoCheck()
end)

ServerStatusValue.Changed:Connect(function()
	DoCheck()
end)
