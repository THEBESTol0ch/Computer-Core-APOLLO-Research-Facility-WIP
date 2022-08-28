local TweenService = game:GetService("TweenService")

local Glass = script.Parent.Parent.Parent.KeyBox.Glass
local GlassPos = script.Parent.Parent.Parent.KeyBox.GlassPos

local Hole = script.Parent.Parent.Parent.Hole
local Key = script.Parent.Parent.Parent.Key
local HolePos1 = script.Parent.Parent.Parent.HolePos1
local KeyPos1 = script.Parent.Parent.Parent.KeyPos1
local KeyPos2 = script.Parent.Parent.Parent.KeyPos2
local KeyPos3 = script.Parent.Parent.Parent.KeyPos3
local KeyPos4 = script.Parent.Parent.Parent.KeyPos4
local HoleSound = script.Parent.Parent.Parent.HoleSoundEmitter.HoleSound
local KeySound = script.Parent.Parent.Parent.KeySoundEmitter.KeySound

local KeyCapValue = script.Parent.Parent.Values.KeyCapValue
local OtherKeyCapValue1 = workspace.BetaCoreLockConsole.KWB1.CPU.Values.KeyCapValue
local OtherKeyCapValue2 = workspace.GammaCoreLockConsole.KWB1.CPU.Values.KeyCapValue
local OtherKeyCapValue3 = workspace.DeltaCoreLockConsole.KWB1.CPU.Values.KeyCapValue

local PullLeverLockValue = script.Parent.Parent.Parent.Parent.PullLever.CPU.Values.PullLeverLockValue

local MDAEmergencyButton = workspace.MDAEmergencyButton.Button

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
		PullLeverLockValue.Value = 1
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
		PullLeverLockValue.Value = 1
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
	OtherKeyCapValue1.Value = 0
	OtherKeyCapValue2.Value = 0
	OtherKeyCapValue3.Value = 0
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
			PullLeverLockValue.Value = 0
		else
			PullLeverLockValue.Value = 1
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

MDAEmergencyButton.ClickDetector.MouseClick:Connect(function()
	KeyCapValue.Value = 1
end)

while true do
	if KeyCapValue.Value == 1 then
		KeyCapValue.Value = 3
		GlassUp:Play()
		GlassOpened = true
		Key.ClickDetector.MaxActivationDistance = 10
	end
	if KeyCapValue.Value == 0 then
		KeyCapValue.Value = 3
		GlassDown:Play()
		GlassOpened = false
		Key.ClickDetector.MaxActivationDistance = 0
	end
	if KeyTurned == false and KeyInserted == true and KeyCapValue.Value == 2 then
		KeyCapValue.Value = 3
		KeyInserted = false
		Step1 = true
		Key.ClickDetector.MaxActivationDistance = 0
		PullLeverLockValue.Value = 1
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
	if KeyTurned == true and KeyInserted == true and KeyCapValue.Value == 2 then
		KeyCapValue.Value = 3
		KeyTurned = false
		KeyInserted = false
		Step1 = true
		Key.ClickDetector.MaxActivationDistance = 0
		PullLeverLockValue.Value = 1
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
