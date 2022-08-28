local TweenService = game:GetService("TweenService")

local Button = script.Parent.Parent.Parent.Button
local ButtonPos = script.Parent.Parent.Parent.ButtonPos
local CapHinge = script.Parent.Parent.Parent.PrimaryPart
local Cap = script.Parent.Parent.Parent.Cap
local ButtonSound = script.Parent.Parent.Parent.SoundEmitter.ButtonSound

local KeyCap1Value = script.Parent.Parent.Parent.Parent.KWB1.CPU.Values.KeyCapValue
local KeyCap2Value = script.Parent.Parent.Parent.Parent.KWB2.CPU.Values.KeyCapValue
local EBCapLock1Value = script.Parent.Parent.Values.EBCapLock1Value
local EBCapLock2Value = script.Parent.Parent.Values.EBCapLock2Value

local FacilityEmergencyLampControlValue = workspace.FacilityEmergencyLampControlValue
local FacilityAlarm1ControlValue = workspace.FacilityAlarm1ControlValue
local FacilityIntercomSystemModeValue = workspace.FacilityIntercomSystem.CPU.Values.FacilityIntercomSystemModeValue

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
	EBCapLock2Value.Value = 3
	FacilityEmergencyLampControlValue.Value = 0
	FacilityAlarm1ControlValue.Value = 0
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
	CapDown:Play()
end)

Button.ClickDetector.MouseClick:Connect(function()
	KeyCap2Value.Value = 2
end)

while true do
	if EBCapLock1Value.Value == 0 or EBCapLock2Value.Value == 0 then
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
		FacilityAlarm1ControlValue.Value = 0
		if FacilityIntercomSystemModeValue.Value == 1 then
			FacilityEmergencyLampControlValue.Value = 0
		end
	end
	if EBCapLock1Value.Value == 1 and EBCapLock2Value.Value == 1 then
		Button.ClickDetector.MaxActivationDistance = 10
		CapUp:Play()
		FacilityEmergencyLampControlValue.Value = 1
		FacilityAlarm1ControlValue.Value = 1
	end
	wait(0.1)
end
