local TweenService = game:GetService("TweenService")

local Trigger = script.Parent.Parent.Parent.Lever.Trigger
local Lever = script.Parent.Parent.Parent.Lever.Handle
local LeverPos = script.Parent.Parent.Parent.Lever.LeverPos
local LeverSound = script.Parent.Parent.Parent.Lever.Handle.LeverSound

local PullLeverLockValue = script.Parent.Parent.Values.PullLeverLockValue

local AdvancedLever = workspace.AlphaCoreAdvancedLever.Handle1
local RedLamp = workspace.AlphaCoreAdvancedLever.RedLamp.Lamp
local GreenLamp = workspace.AlphaCoreAdvancedLever.GreenLamp.Lamp

local CRCPurgeAdvancedButton = workspace.CRCPurgeAdvancedButton.Button.Trigger

local LeverPullIn = {
	CFrame = LeverPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LeverPullOut = {
	CFrame = Lever.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local PullLeverAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeverPullIn = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullIn)
local LeverPullOut = TweenService:Create(Lever, PullLeverAnimationSettings, LeverPullOut)

local Lever = false
local LeverMoving = false

Trigger.ClickDetector.MouseClick:Connect(function()
	if Lever == false then
		Lever = true
		LeverMoving = true
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullIn:Play()
		LeverSound:Play()
		wait(2)
		LeverMoving = false
		AdvancedLever.ClickDetector.MaxActivationDistance = 10
		RedLamp.Material = ("Plastic")
		GreenLamp.Material = ("Neon")
		if PullLeverLockValue.Value == 0 then
			Trigger.ClickDetector.MaxActivationDistance = 10
		end
	else
		Lever = false
		LeverMoving = true
		AdvancedLever.ClickDetector.MaxActivationDistance = 0
		RedLamp.Material = ("Neon")
		GreenLamp.Material = ("Plastic")
		Trigger.ClickDetector.MaxActivationDistance = 0
		LeverPullOut:Play()
		LeverSound:Play()
		wait(2)
		LeverMoving = false
		if PullLeverLockValue.Value == 0 then
			Trigger.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

CRCPurgeAdvancedButton.ClickDetector.MouseClick:Connect(function()
	Lever = false
	LeverMoving = true
	AdvancedLever.ClickDetector.MaxActivationDistance = 0
	RedLamp.Material = ("Neon")
	GreenLamp.Material = ("Plastic")
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverPullOut:Play()
	LeverSound:Play()
	wait(2)
	LeverMoving = false
end)

while true do
	if PullLeverLockValue.Value == 0 and LeverMoving == false then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
	if PullLeverLockValue.Value == 1 and LeverMoving == false then
		Trigger.ClickDetector.MaxActivationDistance = 0
	end
	wait(0.1)
end
