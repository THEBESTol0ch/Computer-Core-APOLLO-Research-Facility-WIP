-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Lever.Handle
--

-- Values
local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.CoreStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.CoreStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.CoreStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.CoreStatusValue
--

-- Items
local HandleHinge = script.Parent.Hinge
local Lamp1 = script.Parent.Lamps.AlphaCore_Lamp.Lamp
local Lamp2 = script.Parent.Lamps.BetaCore_Lamp.Lamp
local Lamp3 = script.Parent.Lamps.GammaCore_Lamp.Lamp
local Lamp4 = script.Parent.Lamps.DeltaCore_Lamp.Lamp
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

function DoCheck()
	if AlphaCoreStatusValue.Value == "PRIMED" and BetaCoreStatusValue.Value == "PRIMED" and GammaCoreStatusValue.Value == "PRIMED" and DeltaCoreStatusValue.Value == "PRIMED" then
		Trigger.ClickDetector.MaxActivationDistance = 10
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
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	wait(1)
	DoLamp(Lamp1, "Red", "ON")
	DoLamp(Lamp2, "Red", "ON")
	DoLamp(Lamp3, "Red", "ON")
	DoLamp(Lamp4, "Red", "ON")
end)

AlphaCoreStatusValue.Changed:Connect(function()
	if AlphaCoreStatusValue.Value == "PRIMED" then
		DoLamp(Lamp1, "Green", "ON")
	end
	DoCheck()
end)
BetaCoreStatusValue.Changed:Connect(function()
	if BetaCoreStatusValue.Value == "PRIMED" then
		DoLamp(Lamp2, "Green", "ON")
	end
	DoCheck()
end)
GammaCoreStatusValue.Changed:Connect(function()
	if GammaCoreStatusValue.Value == "PRIMED" then
		DoLamp(Lamp3, "Green", "ON")
	end
	DoCheck()
end)
DeltaCoreStatusValue.Changed:Connect(function()
	if DeltaCoreStatusValue.Value == "PRIMED" then
		DoLamp(Lamp4, "Green", "ON")
	end
	DoCheck()
end)
