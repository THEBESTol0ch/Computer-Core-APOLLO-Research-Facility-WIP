local TweenService = game:GetService("TweenService")

local Glass = script.Parent.CargoDoorConsole1.KeyWithBox.KeyBox.Glass
local Hole = script.Parent.CargoDoorConsole1.KeyWithBox.Hole
local Key1 = script.Parent.CargoDoorConsole1.KeyWithBox.Key
local Key2 = script.Parent.CargoDoorConsole2.KeyWithBox.Key
local HolePos1 = script.Parent.CargoDoorConsole1.KeyWithBox.HolePos1
local KeyPos1 = script.Parent.CargoDoorConsole1.KeyWithBox.KeyPos1
local KeyPos2 = script.Parent.CargoDoorConsole1.KeyWithBox.KeyPos2
local KeyPos3 = script.Parent.CargoDoorConsole1.KeyWithBox.KeyPos3
local KeyPos4 = script.Parent.CargoDoorConsole1.KeyWithBox.KeyPos4
local HoleSound = script.Parent.CargoDoorConsole1.KeyWithBox.HoleSoundEmitter.HoleSound
local KeySound = script.Parent.CargoDoorConsole1.KeyWithBox.KeySoundEmitter.KeySound

local Trigger1 = script.Parent.CargoDoorConsole1.PullLever.Lever.Trigger
local Trigger2 = script.Parent.CargoDoorConsole2.PullLever.Lever.Trigger
local RedLamp1 = script.Parent.CargoDoorConsole1.RedLamp.Lamp
local RedLamp2 = script.Parent.CargoDoorConsole2.RedLamp.Lamp

local KeyStepAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local KeyInsertAnimationSettings = TweenInfo.new(
	0.48,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local KeyTurnAnimationSettings = TweenInfo.new(
	0.365,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local KeyOnHanger = {
	CFrame = Key1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}


local KeyStep1 = {
	CFrame = KeyPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyStep2 = {
	CFrame = KeyPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyStep3 = {
	CFrame = KeyPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyTurn1 = {
	CFrame = KeyPos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyTurn2 = {
	CFrame = KeyPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local HoleTurn1 = {
	CFrame = HolePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local HoleTurn2 = {
	CFrame = Hole.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyOnHanger = TweenService:Create(Key1, KeyStepAnimationSettings, KeyOnHanger)
local KeyStep1 = TweenService:Create(Key1, KeyStepAnimationSettings, KeyStep1)
local KeyStep2 = TweenService:Create(Key1, KeyStepAnimationSettings, KeyStep2)
local KeyStep3 = TweenService:Create(Key1, KeyInsertAnimationSettings, KeyStep3)
local KeyTurn1 = TweenService:Create(Key1, KeyTurnAnimationSettings, KeyTurn1)
local KeyTurn2 = TweenService:Create(Key1, KeyTurnAnimationSettings, KeyTurn2)
local HoleTurn1 = TweenService:Create(Hole, KeyTurnAnimationSettings, HoleTurn1)
local HoleTurn2 = TweenService:Create(Hole, KeyTurnAnimationSettings, HoleTurn2)

local KeyTurned = false
local KeyInserted = false
local Step1 = true

Key1.ClickDetector.RightMouseClick:Connect(function()
	if KeyTurned == false and KeyInserted == true then
		KeyInserted = false
		Step1 = true
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		HoleSound:Play()
		KeyStep2:Play()
		wait(0.5)
		KeyStep1:Play()
		wait(0.5)
		KeyOnHanger:Play()
		wait(0.5)
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
	end
end)

Key1.ClickDetector.RightMouseClick:Connect(function()
	if KeyTurned == true and KeyInserted == true then
		Trigger1.ClickDetector.MaxActivationDistance = 0
		Trigger2.ClickDetector.MaxActivationDistance = 0
		KeyTurned = false
		KeyInserted = false
		Step1 = true
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		KeySound:Play()
		KeyStep3:Play()
		HoleTurn2:Play()
		wait(0.5)
		HoleSound:Play()
		KeyStep2:Play()
		wait(0.5)
		KeyStep1:Play()
		RedLamp1.Material = ("Neon")
		RedLamp1.BrickColor = BrickColor.new("Really red")
		RedLamp2.Material = ("Neon")
		RedLamp2.BrickColor = BrickColor.new("Really red")
		wait(0.5)
		KeyOnHanger:Play()
		wait(0.5)
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
	end
end)

Key1.ClickDetector.MouseClick:Connect(function()
	if Step1 == true then
		Step1 = false
		KeyInserted = true
		Key1.ClickDetector.MaxActivationDistance = 0
		Key2.ClickDetector.MaxActivationDistance = 0
		KeyStep1:Play()
		wait(0.5)
		KeyStep2:Play()
		wait(0.5)
		KeyStep3:Play()
		wait(0.1)
		HoleSound:Play()
		Key1.ClickDetector.MaxActivationDistance = 10
		Key2.ClickDetector.MaxActivationDistance = 10
	else
		if KeyTurned == false then
			Key1.ClickDetector.MaxActivationDistance = 0
			Key2.ClickDetector.MaxActivationDistance = 0
			KeyTurn1:Play()
			HoleTurn1:Play()
			KeySound:Play()
			wait(1)
			Key1.ClickDetector.MaxActivationDistance = 10
			Key2.ClickDetector.MaxActivationDistance = 10
			KeyTurned = true
			RedLamp1.Material = ("Plastic")
			RedLamp1.BrickColor = BrickColor.new("Maroon")
			RedLamp2.Material = ("Plastic")
			RedLamp2.BrickColor = BrickColor.new("Maroon")
			Trigger1.ClickDetector.MaxActivationDistance = 10
			Trigger2.ClickDetector.MaxActivationDistance = 10
		else
			Trigger1.ClickDetector.MaxActivationDistance = 0
			Trigger2.ClickDetector.MaxActivationDistance = 0
			Key1.ClickDetector.MaxActivationDistance = 0
			Key2.ClickDetector.MaxActivationDistance = 0
			KeyTurn2:Play()
			HoleTurn2:Play()
			KeySound:Play()
			wait(1)
			Key1.ClickDetector.MaxActivationDistance = 10
			Key2.ClickDetector.MaxActivationDistance = 10
			KeyTurned = false
			RedLamp1.Material = ("Neon")
			RedLamp1.BrickColor = BrickColor.new("Really red")
			RedLamp2.Material = ("Neon")
			RedLamp2.BrickColor = BrickColor.new("Really red")
		end
	end
end)
