local TweenService = game:GetService("TweenService")

local Glass = script.Parent.KeyBox.Glass
local GlassPos = script.Parent.KeyBox.GlassPos

local Hole = script.Parent.Hole
local Key = script.Parent.Key
local HolePos1 = script.Parent.HolePos1
local KeyPos1 = script.Parent.KeyPos1
local KeyPos2 = script.Parent.KeyPos2
local KeyPos3 = script.Parent.KeyPos3
local KeyPos4 = script.Parent.KeyPos4
local HoleSound = script.Parent.HoleSoundEmitter.HoleSound
local KeySound = script.Parent.KeySoundEmitter.KeySound

local Button = script.Parent.Parent.Button2.Button

local KWB2Value = script.Parent.KWB2Value

local GlassAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

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

local GlassUp = {
	CFrame = GlassPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local GlassDown = {
	CFrame = Glass.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyOnHanger = {
	CFrame = Key.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
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

local GlassUp = TweenService:Create(Glass, GlassAnimationSettings, GlassUp)
local GlassDown = TweenService:Create(Glass, GlassAnimationSettings, GlassDown)
local KeyOnHanger = TweenService:Create(Key, KeyStepAnimationSettings, KeyOnHanger)
local KeyStep1 = TweenService:Create(Key, KeyStepAnimationSettings, KeyStep1)
local KeyStep2 = TweenService:Create(Key, KeyStepAnimationSettings, KeyStep2)
local KeyStep3 = TweenService:Create(Key, KeyInsertAnimationSettings, KeyStep3)
local KeyTurn1 = TweenService:Create(Key, KeyTurnAnimationSettings, KeyTurn1)
local KeyTurn2 = TweenService:Create(Key, KeyTurnAnimationSettings, KeyTurn2)
local HoleTurn1 = TweenService:Create(Hole, KeyTurnAnimationSettings, HoleTurn1)
local HoleTurn2 = TweenService:Create(Hole, KeyTurnAnimationSettings, HoleTurn2)

local KeyTurned = false
local KeyInserted = false
local Step1 = true

Key.ClickDetector.RightMouseClick:Connect(function()
	if KeyTurned == false and KeyInserted == true then
		KWB2Value.Value = 3
		KeyInserted = false
		Step1 = true
		Key.ClickDetector.MaxActivationDistance = 0
		HoleSound:Play()
		KeyStep2:Play()
		wait(0.5)
		KeyStep1:Play()
		wait(0.5)
		KeyOnHanger:Play()
		wait(0.5)
		Key.ClickDetector.MaxActivationDistance = 10
	end
end)

Key.ClickDetector.RightMouseClick:Connect(function()
	if KeyTurned == true and KeyInserted == true then
		KWB2Value.Value = 3
		KeyTurned = false
		KeyInserted = false
		Step1 = true
		Key.ClickDetector.MaxActivationDistance = 0
		KeySound:Play()
		KeyStep3:Play()
		HoleTurn2:Play()
		wait(0.5)
		HoleSound:Play()
		KeyStep2:Play()
		wait(0.5)
		KeyStep1:Play()
		wait(0.5)
		KeyOnHanger:Play()
		wait(0.5)
		Key.ClickDetector.MaxActivationDistance = 10
	end
end)

Key.ClickDetector.MouseClick:Connect(function()
	if Step1 == true then
		Step1 = false
		KeyInserted = true
		Key.ClickDetector.MaxActivationDistance = 0
		KeyStep1:Play()
		wait(0.5)
		KeyStep2:Play()
		wait(0.5)
		KeyStep3:Play()
		wait(0.1)
		HoleSound:Play()
		Key.ClickDetector.MaxActivationDistance = 10
	else
		if KeyTurned == false then
			Key.ClickDetector.MaxActivationDistance = 0
			KeyTurn1:Play()
			HoleTurn1:Play()
			KeySound:Play()
			wait(1)
			Key.ClickDetector.MaxActivationDistance = 10
			KeyTurned = true
			KWB2Value.Value = 4
		else
			KWB2Value.Value = 3
			Key.ClickDetector.MaxActivationDistance = 0
			KeyTurn2:Play()
			HoleTurn2:Play()
			KeySound:Play()
			wait(1)
			Key.ClickDetector.MaxActivationDistance = 10
			KeyTurned = false
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	wait(0.4)
	GlassUp:Play()
	GlassOpened = true
	Key.ClickDetector.MaxActivationDistance = 10
end)

while true do
	if KWB2Value.Value == 1 then
		KWB2Value.Value = 3
		GlassUp:Play()
		GlassOpened = true
		Key.ClickDetector.MaxActivationDistance = 10
	end
	if KWB2Value.Value == 0 then
		KWB2Value.Value = 3
		GlassDown:Play()
		GlassOpened = false
		Key.ClickDetector.MaxActivationDistance = 0
	end
	if KeyTurned == false and KeyInserted == true and KWB2Value.Value == 2 then
		KWB2Value.Value = 3
		KeyInserted = false
		Step1 = true
		Key.ClickDetector.MaxActivationDistance = 0
		wait(0.5)
		HoleSound:Play()
		KeyStep2:Play()
		wait(0.5)
		KeyStep1:Play()
		wait(0.5)
		KeyOnHanger:Play()
		wait(2.5)
		GlassDown:Play()
	end
	if KeyTurned == true and KeyInserted == true and KWB2Value.Value == 2 then
		KWB2Value.Value = 3
		KeyTurned = false
		KeyInserted = false
		Step1 = true
		Key.ClickDetector.MaxActivationDistance = 0
		wait(0.5)
		KeySound:Play()
		KeyStep3:Play()
		HoleTurn2:Play()
		wait(0.5)
		HoleSound:Play()
		KeyStep2:Play()
		wait(0.5)
		KeyStep1:Play()
		wait(0.5)
		KeyOnHanger:Play()
		wait(2.5)
		GlassDown:Play()
	end
	wait(0.1)
end
