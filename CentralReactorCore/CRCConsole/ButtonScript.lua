-- Control
local TweenService = game:GetService("TweenService")
local Button = script.Parent.Button
--

-- Values
local KeyTurnedValue1 = script.Parent.Parent.KeyLock1.CPU.Values.KeyTurnedValue
local KeyTurnedValue2 = script.Parent.Parent.KeyLock2.CPU.Values.KeyTurnedValue
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

-- Functions
function DoCheck()
	if KeyTurnedValue1.Value == true and KeyTurnedValue2.Value == true then
		Button.ClickDetector.MaxActivationDistance = 10
		CapUp:Play()
	else
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
	end
end
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
	CapDown:Play()
end)

KeyTurnedValue1.Changed:Connect(function()
	DoCheck()
end)
KeyTurnedValue2.Changed:Connect(function()
	DoCheck()
end)
