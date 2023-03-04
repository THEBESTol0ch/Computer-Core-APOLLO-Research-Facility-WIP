-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Handle
--

-- Values
local TNERDriverStatusValue = script.Parent.Parent.CPU.Values.TNERDriverStatusValue
local AccessGrantedValue = script.Parent.Parent.KeyCardPanel.CPU.Values.AccessGrantedValue
--

-- Items
local HandleHinge = script.Parent.Hinge
local RedLamp = script.Parent.Parent.Rod.SwitchFake.RedLamp.Lamp
local GreenLamp = script.Parent.Parent.Rod.SwitchFake.GreenLamp.Lamp
--

-- Sounds
local SwitchSound = script.Parent.SoundEmitter.SwitchSound
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
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local LeverDown = TweenService:Create(HandleHinge, LeverAnimationSettings, {
	CFrame = HandleHinge.CFrame * CFrame.Angles(math.rad(-45), 0, 0)
})
local LeverUp = TweenService:Create(HandleHinge, LeverAnimationSettings, {
	CFrame = HandleHinge.CFrame * CFrame.Angles(math.rad(-0), 0, 0)
})

Trigger.ClickDetector.MouseClick:Connect(function()
	Trigger.ClickDetector.MaxActivationDistance = 0
	LeverDown:Play()
	SwitchSound:Play()
	wait(1)
	LeverUp:Play()
end)

TNERDriverStatusValue.Changed:Connect(function()
	if TNERDriverStatusValue.Value == "MOVING" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		DoLamp(GreenLamp, "Green", "OFF")
		DoLamp(RedLamp, "Red", "ON")
	end
end)

AccessGrantedValue.Changed:Connect(function()
	if AccessGrantedValue.Value == true then
		Trigger.ClickDetector.MaxActivationDistance = 10
		DoLamp(GreenLamp, "Green", "ON")
		DoLamp(RedLamp, "Red", "OFF")
	end
end)
