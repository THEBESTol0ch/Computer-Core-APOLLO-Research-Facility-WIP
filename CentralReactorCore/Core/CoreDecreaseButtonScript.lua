local TweenService = game:GetService("TweenService")

local Button2 = workspace.AlphaCoreIncreaseButton.Button
local Button1 = workspace.AlphaCoreDecreaseButton.Button
local ButtonPos = script.Parent.ButtonPos
local ButtonSound = script.Parent.SoundEmitter.ButtonSound

local ButtonAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local ButtonDown = {
	CFrame = ButtonPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ButtonUp = {
	CFrame = Button1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ButtonDown = TweenService:Create(Button1, ButtonAnimationSettings, ButtonDown)
local ButtonUp = TweenService:Create(Button1, ButtonAnimationSettings, ButtonUp)

Button1.ClickDetector.MouseClick:Connect(function()
	Button1.ClickDetector.MaxActivationDistance = 0
	Button2.ClickDetector.MaxActivationDistance = 0
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(1.6)
	Button1.ClickDetector.MaxActivationDistance = 10
	Button2.ClickDetector.MaxActivationDistance = 10
end)
