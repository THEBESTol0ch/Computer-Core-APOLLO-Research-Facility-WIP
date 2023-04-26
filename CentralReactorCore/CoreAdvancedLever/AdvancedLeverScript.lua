-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Lever.Handle
local CoreName = script.Parent.Name:split("_")[1]
--

-- Values
local LeverValue = workspace[CoreName.."_LockConsole"].PullLever.CPU.Values.LeverValue
--

-- Items
local HandleHinge = script.Parent.Hinge
local RedLamp = script.Parent.RedLamp.Lamp
local GreenLamp = script.Parent.GreenLamp.Lamp
local Handle = script.Parent.Handle
local HandlePos = script.Parent.HandlePos
--

-- Sounds
local LeverSound = script.Parent.SoundEmitter.LeverSound
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
	DoLamp(RedLamp, "Red", "ON")
	DoLamp(GreenLamp, "Green", "OFF")
end)

LeverValue.Changed:Connect(function()
	if LeverValue.Value == "FULL" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		DoLamp(RedLamp, "Red", "ON")
		DoLamp(GreenLamp, "Green", "OFF")
	elseif LeverValue.Value == "LOW" then
		Trigger.ClickDetector.MaxActivationDistance = 10
		DoLamp(RedLamp, "Red", "OFF")
		DoLamp(GreenLamp, "Green", "ON")
	end
end)
