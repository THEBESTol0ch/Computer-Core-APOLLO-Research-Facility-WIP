-- Control
local TweenService = game:GetService("TweenService")
local Button = script.Parent.Button
--

-- Items
local ButtonPos = script.Parent.ButtonPos
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

local ButtonDown = {
	CFrame = ButtonPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonUp = {
	CFrame = Button.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ButtonDown = TweenService:Create(Button, ButtonAnimationSettings, ButtonDown)
local ButtonUp = TweenService:Create(Button, ButtonAnimationSettings, ButtonUp)

Button.ClickDetector.MouseClick:Connect(function()
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
end)
