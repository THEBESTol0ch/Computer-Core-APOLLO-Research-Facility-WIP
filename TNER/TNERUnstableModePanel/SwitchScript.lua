-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Handle
--

-- Values
local SuperchargerStatusValue = workspace.TNER.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.TNERFuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.TNERFuseSystem.CPU.Values.FuseSystemStatusValue
local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
--

-- Items
local HandleHinge = script.Parent.Hinge
local RedLamp = script.Parent.RedLamp.Lamp
local GreenLamp = script.Parent.GreenLamp.Lamp
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
function DoCheck()
	if SuperchargerStatusValue.Value == "ONLINE" and FESStatusValue.Value == "ONLINE" and FuseSystemStatusValue.Value == "OFFLINE" and LeverPositionValue.Value == 5 and FuelCapacityValue.Value > 11 then
		DoLamp(GreenLamp, "Green", "ON")
		DoLamp(RedLamp, "Red", "OFF")
	else
		DoLamp(GreenLamp, "Green", "OFF")
		DoLamp(RedLamp, "Red", "ON")
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
	DoLamp(GreenLamp, "Green", "OFF")
	DoLamp(RedLamp, "Red", "ON")
	wait(0.5)
	Trigger.ClickDetector.MaxActivationDistance = 10
end)

SuperchargerStatusValue.Changed:Connect(function()
	DoCheck()
end)

FESStatusValue.Changed:Connect(function()
	DoCheck()
end)

FuseSystemStatusValue.Changed:Connect(function()
	DoCheck()
end)

LeverPositionValue.Changed:Connect(function()
	DoCheck()
end)

FuelCapacityValue.Changed:Connect(function()
	DoCheck()
end)
