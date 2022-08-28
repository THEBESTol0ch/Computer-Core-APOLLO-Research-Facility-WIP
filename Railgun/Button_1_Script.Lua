local TweenService = game:GetService("TweenService")

local Button = script.Parent.Button
local ButtonPos = script.Parent.ButtonPos
local ButtonSound = script.Parent.SoundEmitter.ButtonSound

local Alarm1 = workspace.RailgunSpeaker1.SoundEmitter.Alarm2
local Alarm2 = workspace.RailgunSpeaker2.SoundEmitter.Alarm2

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
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
end)

Button.ClickDetector.MouseClick:Connect(function()
	Alarm1:Play()
	wait(0.05)
	Alarm2:Play()
	wait(1)
	Alarm1:Stop()
	wait(0.05)
	Alarm2:Stop()
end)

Button.ClickDetector.MouseClick:Connect(function()
	wait(50)
	workspace.RailgunMonitor.Lines.ProjectileStatus.SurfaceGui.TextLabel.Text = ("LOADED")
	workspace.RailgunMonitor.Lines.ProjectileStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(0, 255, 0)
end)
