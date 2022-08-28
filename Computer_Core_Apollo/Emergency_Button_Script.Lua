local TweenService = game:GetService("TweenService")

local Button = script.Parent.Parent.Parent.Button
local ButtonPos = script.Parent.Parent.Parent.ButtonPos
local CapHinge = script.Parent.Parent.Parent.PrimaryPart
local Cap = script.Parent.Parent.Parent.Cap
local ButtonSound = script.Parent.Parent.Parent.SoundEmitter.ButtonSound

local KeyCapValue = script.Parent.Parent.Parent.Parent.KWB1.CPU.Values.KeyCapValue
local EBCapLock1Value = script.Parent.Parent.Values.EBCapLock1Value

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

Button.ClickDetector.MouseClick:Connect(function()
	KeyCapValue.Value = 2
end)

while true do
	if EBCapLock1Value.Value == 0 then
		EBCapLock1Value.Value = 3
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
	end
	if EBCapLock1Value.Value == 1 then
		EBCapLock1Value.Value = 3
		Button.ClickDetector.MaxActivationDistance = 10
		CapUp:Play()
	end
	wait(0.1)
end
