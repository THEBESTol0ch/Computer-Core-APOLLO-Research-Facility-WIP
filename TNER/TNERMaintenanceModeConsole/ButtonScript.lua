-- Control
local TweenService = game:GetService("TweenService")
local Button = script.Parent.Button
local Trigger = script.Parent.Trigger
--

-- Values
local AllFuelCellsInjectedValue = workspace.TNERFuelSystem.CPU.Values.AllFuelCellsInjectedValue
--

-- Items
local ButtonPos = script.Parent.ButtonPos
local CapHinge = script.Parent.Hinge
--

-- Sounds
local ButtonSound = script.Parent.SoundEmitter.ButtonSound
--

local ButtonAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local CapAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Bounce,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local ButtonDown = {
	CFrame = ButtonPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonUp = {
	CFrame = Button.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local CapDown = TweenService:Create(CapHinge,  CapAnimationSettings, {
	CFrame = CapHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local CapUp = TweenService:Create(CapHinge,  CapAnimationSettings, {
	CFrame = CapHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})

local ButtonDown = TweenService:Create(Button, ButtonAnimationSettings, ButtonDown)
local ButtonUp = TweenService:Create(Button, ButtonAnimationSettings, ButtonUp)

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
	CapDown:Play()
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 10
	CapUp:Play()
end)

AllFuelCellsInjectedValue.Changed:Connect(function()
	if AllFuelCellsInjectedValue.Value == true then
		Button.ClickDetector.MaxActivationDistance = 10
		CapUp:Play()
	end
end)
