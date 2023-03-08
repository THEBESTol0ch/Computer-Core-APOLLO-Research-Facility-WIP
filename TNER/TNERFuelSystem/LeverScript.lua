-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue
local FRStatusValue = workspace.TNERFuelSystem[script.Parent.Parent.Parent.Name:split("PullLever")[1]].CPU.Values.FRStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local ServerStatusValue = workspace.TNERSystemServer.Servers.FuelSystemServer.CPU.Values.ServerStatusValue
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
function CheckCondition()
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

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "MAINTENANCE MODE" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

FRStatusValue.Changed:Connect(function()
	CheckCondition()
end)

ServerStatusValue.Changed:Connect(function()
	CheckCondition()
end)
