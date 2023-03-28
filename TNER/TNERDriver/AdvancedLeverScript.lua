-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Lever.Handle
local Switch = script.Parent.Parent.Switch.Handle
--

-- Values
local TNERDriverStatusValue = script.Parent.Parent.CPU.Values.TNERDriverStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local TNERFuse5StatusValue = workspace.TNERFuse5.CPU.Values.TNERFuse5StatusValue
--

-- Items
local HandleHinge = script.Parent.Hinge
local RedLamp = script.Parent.Parent.Rod.AdvancedLeverFake.RedLamp.Lamp
local GreenLamp = script.Parent.Parent.Rod.AdvancedLeverFake.GreenLamp.Lamp
local Handle = script.Parent.Handle
local HandlePos = script.Parent.HandlePos
--

-- Sounds
local LeverSound = script.Parent.SoundEmitter.LeverSound
local OverloadStopUnsuccessSound = workspace.TNER.SoundEmitter.OverloadStopUnsuccessSound
--

-- Functions
function DoLamp(Lamp, Color, Mode)
	if Color == "Red" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Really red")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Crimson")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Green" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Lime green")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Forest green")
			Lamp.Material = ("Plastic")
		end
	end
end
--

local LeverAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

local LeverDown = TweenService:Create(HandleHinge, LeverAnimationSettings, {
	CFrame = HandleHinge.CFrame * CFrame.Angles(math.rad(-79.89), 0, 0)
})
local LeverUp = TweenService:Create(HandleHinge, LeverAnimationSettings, {
	CFrame = HandleHinge.CFrame * CFrame.Angles(math.rad(-0), 0, 0)
})

local Handle2Down = {
	CFrame = HandlePos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local Handle2Up = {
	CFrame = Handle.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local Handle2Down = TweenService:Create(Handle, LeverAnimationSettings, Handle2Down)
local Handle2Up = TweenService:Create(Handle, LeverAnimationSettings, Handle2Up)

Trigger.ClickDetector.MouseClick:Connect(function()
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverDown:Play()
	Handle2Down:Play()
	LeverSound:Play()
	wait(1)
	LeverUp:Play()
	Handle2Up:Play()
	wait(0.5)
	if TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "COOLING" or TNERStatusValue.Value == "MAINTENANCE MODE" then
		Trigger.ClickDetector.MaxActivationDistance = 10
	elseif OverloadStopUnsuccessSound.IsPlaying == true then
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

TNERDriverStatusValue.Changed:Connect(function()
	if TNERDriverStatusValue.Value == "MOVING" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		DoLamp(GreenLamp, "Green", "OFF")
		DoLamp(RedLamp, "Red", "ON")
	end
end)

Switch.ClickDetector.MouseClick:Connect(function()
	wait(1)
	Trigger.ClickDetector.MaxActivationDistance = 10
	DoLamp(GreenLamp, "Green", "ON")
	DoLamp(RedLamp, "Red", "OFF")
end)
