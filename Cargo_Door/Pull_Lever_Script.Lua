local TweenService = game:GetService("TweenService")

local Trigger1 = script.Parent.CargoDoorConsole1.PullLever.Lever.Trigger
local Trigger2 = script.Parent.CargoDoorConsole2.PullLever.Lever.Trigger
local Lever1 = script.Parent.CargoDoorConsole1.PullLever.Lever.Handle.Handle.Handle
local Lever2 = script.Parent.CargoDoorConsole2.PullLever.Lever.Handle.Handle.Handle
local LeverPos1 = script.Parent.CargoDoorConsole1.PullLever.Lever.LeverPos
local LeverPos2 = script.Parent.CargoDoorConsole2.PullLever.Lever.LeverPos
local LeverSound1 = script.Parent.CargoDoorConsole1.PullLever.Lever.Handle.Handle.Handle.LeverSound
local LeverSound2 = script.Parent.CargoDoorConsole2.PullLever.Lever.Handle.Handle.Handle.LeverSound

local GreenLamp1 = script.Parent.CargoDoorConsole1.GreenLamp.Lamp
local GreenLamp2 = script.Parent.CargoDoorConsole2.GreenLamp.Lamp
local Key1 = script.Parent.CargoDoorConsole1.KeyWithBox.Key
local Key2 = script.Parent.CargoDoorConsole2.KeyWithBox.Key

local LeverPullIn1 = {
	CFrame = LeverPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullIn2 = {
	CFrame = LeverPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut1 = {
	CFrame = Lever1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverPullOut2 = {
	CFrame = Lever2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local PullLeverAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeverPullIn1 = TweenService:Create(Lever1, PullLeverAnimationSettings, LeverPullIn1)
local LeverPullIn2 = TweenService:Create(Lever2, PullLeverAnimationSettings, LeverPullIn2)
local LeverPullOut1 = TweenService:Create(Lever1, PullLeverAnimationSettings, LeverPullOut1)
local LeverPullOut2 = TweenService:Create(Lever2, PullLeverAnimationSettings, LeverPullOut2)


local Lever = false

Trigger1.ClickDetector.MouseClick:Connect(function()
	if Lever == false then
		Lever = true
		GreenLamp1.BrickColor = BrickColor.new("Neon orange")
		GreenLamp2.BrickColor = BrickColor.new("Neon orange")
		Trigger1.ClickDetector.MaxActivationDistance = 0
		Trigger2.ClickDetector.MaxActivationDistance = 0
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		LeverPullIn1:Play()
		LeverPullIn2:Play()
		LeverSound1:Play()
		LeverSound2:Play()
		wait(8)
		Trigger1.ClickDetector.MaxActivationDistance = 10
		Trigger2.ClickDetector.MaxActivationDistance = 10
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
		GreenLamp1.BrickColor = BrickColor.new("Lime green")
		GreenLamp2.BrickColor = BrickColor.new("Lime green")
	else
		Lever = false
		GreenLamp1.BrickColor = BrickColor.new("Neon orange")
		GreenLamp2.BrickColor = BrickColor.new("Neon orange")
		Trigger1.ClickDetector.MaxActivationDistance = 0
		Trigger2.ClickDetector.MaxActivationDistance = 0
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		LeverPullOut1:Play()
		LeverPullOut2:Play()
		LeverSound1:Play()
		LeverSound2:Play()
		wait(8)
		Trigger1.ClickDetector.MaxActivationDistance = 10
		Trigger2.ClickDetector.MaxActivationDistance = 10
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
		GreenLamp1.BrickColor = BrickColor.new("Lime green")
		GreenLamp2.BrickColor = BrickColor.new("Lime green")
	end
end)

Trigger2.ClickDetector.MouseClick:Connect(function()
	if Lever == false then
		Lever = true
		GreenLamp1.BrickColor = BrickColor.new("Neon orange")
		GreenLamp2.BrickColor = BrickColor.new("Neon orange")
		Trigger1.ClickDetector.MaxActivationDistance = 0
		Trigger2.ClickDetector.MaxActivationDistance = 0
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		LeverPullIn1:Play()
		LeverPullIn2:Play()
		LeverSound1:Play()
		LeverSound2:Play()
		wait(8)
		Trigger1.ClickDetector.MaxActivationDistance = 10
		Trigger2.ClickDetector.MaxActivationDistance = 10
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
		GreenLamp1.BrickColor = BrickColor.new("Lime green")
		GreenLamp2.BrickColor = BrickColor.new("Lime green")
	else
		Lever = false
		GreenLamp1.BrickColor = BrickColor.new("Neon orange")
		GreenLamp2.BrickColor = BrickColor.new("Neon orange")
		Trigger1.ClickDetector.MaxActivationDistance = 0
		Trigger2.ClickDetector.MaxActivationDistance = 0
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		LeverPullOut1:Play()
		LeverPullOut2:Play()
		LeverSound1:Play()
		LeverSound2:Play()
		wait(8)
		Trigger1.ClickDetector.MaxActivationDistance = 10
		Trigger2.ClickDetector.MaxActivationDistance = 10
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
		GreenLamp1.BrickColor = BrickColor.new("Lime green")
		GreenLamp2.BrickColor = BrickColor.new("Lime green")
	end
end)
