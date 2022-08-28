local TweenService = game:GetService("TweenService")

local Button = script.Parent.Button
local ButtonPos = script.Parent.ButtonPos
local CapHinge = script.Parent.PrimaryPart
local Cap = script.Parent.Cap
local ButtonSound = script.Parent.SoundEmitter.ButtonSound

local CapControlValue = script.Parent.CapControlValue
local ApolloStatusValue = workspace.ComputerCoreApollo.CPU.Values.ApolloStatusValue

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

while true do
	if CapControlValue.Value == 1 and ApolloStatusValue.Value == 1 then
		CapControlValue.Value = 3
		Button.ClickDetector.MaxActivationDistance = 10
		CapUp:Play()
	end
	if CapControlValue.Value == 0 then
		CapControlValue.Value = 3
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
	end
	wait(0.1)
end
