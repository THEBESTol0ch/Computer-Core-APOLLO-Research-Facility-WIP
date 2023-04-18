-- Control
local TweenService = game:GetService("TweenService")
local Button = script.Parent.Button
--

-- Values
local TransitBlastDoorValue = script.Parent.Parent.Parent.TransitBlastDoor.CPU.Values.TransitBlastDoorValue
local TransitStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitStatusValue
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
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
	Button.ClickDetector.MaxActivationDistance = 10
end)

Button.ClickDetector.MouseClick:Connect(function()
	if not (TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "EMERGENCY STOPPED") then
		if TransitBlastDoorValue.Value == "CLOSED" then
			TransitBlastDoorValue.Value = "OPEN"
		end
		wait(10)
		if TransitBlastDoorValue.Value == "OPENED" then
			TransitBlastDoorValue.Value = "CLOSE"
		end
	end
end)
