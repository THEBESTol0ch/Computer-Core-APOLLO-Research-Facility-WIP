-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Lever.Trigger
--

-- Values
local LeverValue = script.Parent.Parent.Values.LeverValue
local AccessGrantedValue = script.Parent.Parent.Parent.Parent.KeyCardPanel.CPU.Values.AccessGrantedValue
local TNERFuse5StatusValue = workspace.TNERFuse5.CPU.Values.TNERFuse5StatusValue
local Fuse5HackDeviceValue = workspace.HackTriggers.Fuse5HackTrigger.MilitaryLaptop.CPU.Values.LaptopStatusValue
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
--

Trigger.ClickDetector.MouseClick:Connect(function()
	if LeverValue.Value == "LOW" then
		PullIn()
	elseif LeverValue.Value == "FULL" then
		PullOut()
	end
end)

AccessGrantedValue.Changed:Connect(function()
	if AccessGrantedValue.Value == true then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

TNERFuse5StatusValue.Changed:Connect(function()
	if TNERFuse5StatusValue.Value == "OFFLINE" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif TNERFuse5StatusValue.Value == "ONLINE" and Fuse5HackDeviceValue.Value == "HACKED" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

Fuse5HackDeviceValue.Changed:Connect(function()
	if Fuse5HackDeviceValue.Value == "HACKED" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)
