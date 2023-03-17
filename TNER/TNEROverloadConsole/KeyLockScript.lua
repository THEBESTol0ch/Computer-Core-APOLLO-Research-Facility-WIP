-- Control
local TweenService = game:GetService("TweenService")
local Trigger = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Values
local KeyTurnedValue = script.Parent.Parent.Values.KeyTurnedValue
local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
local MinFuelCapacityValue = workspace.TNER.CPU.Values.MinFuelCapacityValue
local ButtonStatusValue = script.Parent.Parent.Parent.Parent.AdvancedButton.CPU.Values.ButtonStatusValue
--

-- Items
local Glass = script.Parent.Parent.Parent.KeyBox.Glass
local Key = script.Parent.Parent.Parent.Key
local Hole = script.Parent.Parent.Parent.Hole

local GlassPos = script.Parent.Parent.Parent.KeyBox.GlassPos
local KeyPos1 = script.Parent.Parent.Parent.Positions.KeyPos1
local KeyPos2 = script.Parent.Parent.Parent.Positions.KeyPos2
local KeyPos3 = script.Parent.Parent.Parent.Positions.KeyPos3
local KeyPos4 = script.Parent.Parent.Parent.Positions.KeyPos4
local HolePos = script.Parent.Parent.Parent.Positions.HolePos
--

-- Sounds
local HoleSound = script.Parent.Parent.Parent.SoundEmitter.HoleSound
local KeySound = script.Parent.Parent.Parent.SoundEmitter.KeySound
--


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
	CFrame = HolePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
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

-- Logic
local KeyInserted = false
--

-- Functions
function InsertKey()
	Key.ClickDetector.MaxActivationDistance = 0
	KeyInserted = true
	KeyStep1:Play()
	wait(0.5)
	KeyStep2:Play()
	wait(0.5)
	KeyStep3:Play()
	wait(0.1)
	HoleSound:Play()
	Key.ClickDetector.MaxActivationDistance = 10
end

function KeyToHangerAnim()
	HoleSound:Play()
	KeyStep2:Play()
	wait(0.5)
	KeyStep1:Play()
	wait(0.5)
	KeyOnHanger:Play()
	wait(0.5)
end
function KeyToHanger(Lock)
	if KeyInserted == true and KeyTurnedValue.Value == false then
		Key.ClickDetector.MaxActivationDistance = 0
		KeyInserted = false
		KeyToHangerAnim()
		if Lock == false then
			Key.ClickDetector.MaxActivationDistance = 10
		elseif Lock == true then
			wait(1)
			GlassDown:Play()
		end
	elseif KeyInserted == true and KeyTurnedValue.Value == true then
		Key.ClickDetector.MaxActivationDistance = 0
		KeyInserted = false
		KeyTurnedValue.Value = false
		KeySound:Play()
		KeyStep3:Play()
		HoleTurn2:Play()
		wait(0.5)
		KeyToHangerAnim()
		if Lock == false then
			Key.ClickDetector.MaxActivationDistance = 10
		elseif Lock == true then
			wait(1)
			GlassDown:Play()
		end
	elseif KeyInserted == false and KeyTurnedValue.Value == false then
		if Lock == true then
			Key.ClickDetector.MaxActivationDistance = 0
			GlassDown:Play()
		end
	end
end
--

Key.ClickDetector.MouseClick:Connect(function()
	if KeyInserted == false then
		InsertKey()
	elseif KeyTurnedValue.Value == false then
		Key.ClickDetector.MaxActivationDistance = 0
		KeyTurn1:Play()
		HoleTurn1:Play()
		KeySound:Play()
		wait(1)
		KeyTurnedValue.Value = true
	elseif KeyTurnedValue.Value == true then
		Key.ClickDetector.MaxActivationDistance = 0
		KeyTurnedValue.Value = false
		KeyTurn2:Play()
		HoleTurn2:Play()
		KeySound:Play()
	end
end)

Key.ClickDetector.RightMouseClick:Connect(function()
	KeyToHanger(false)
end)

Trigger.Changed:Connect(function()
	if Trigger.Value == "UNSTABLE" then
		GlassUp:Play()
		Key.ClickDetector.MaxActivationDistance = 10
	else
		KeyToHanger(true)
	end
end)

FuelCapacityValue.Changed:Connect(function()
	if FuelCapacityValue.Value < MinFuelCapacityValue.Value then
		KeyToHanger(true)
	end
end)

ButtonStatusValue.Changed:Connect(function()
	if ButtonStatusValue.Value == "OPENED" or ButtonStatusValue.Value == "CLOSED" then
		Key.ClickDetector.MaxActivationDistance = 10
	else
		Key.ClickDetector.MaxActivationDistance = 0
	end
end)
