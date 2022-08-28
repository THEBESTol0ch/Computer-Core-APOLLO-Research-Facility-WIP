local TweenService = game:GetService("TweenService")

local Button = script.Parent.Button
local ButtonPos = script.Parent.ButtonPos
local CapHinge = script.Parent.PrimaryPart
local Cap = script.Parent.Cap
local ButtonSound = script.Parent.SoundEmitter.ButtonSound

local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue

local CanEvent = true
local Lock = false

local AlphaCoreIncreaseButton = workspace.AlphaCoreIncreaseButton.Button
local AlphaCoreDecreaseButton = workspace.AlphaCoreDecreaseButton.Button
local BetaCoreIncreaseButton = workspace.BetaCoreIncreaseButton.Button
local BetaCoreDecreaseButton = workspace.BetaCoreDecreaseButton.Button
local GammaCoreIncreaseButton = workspace.GammaCoreIncreaseButton.Button
local GammaCoreDecreaseButton = workspace.GammaCoreDecreaseButton.Button
local DeltaCoreIncreaseButton = workspace.DeltaCoreIncreaseButton.Button
local DeltaCoreDecreaseButton = workspace.DeltaCoreDecreaseButton.Button

local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargerStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargerStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargerStatusValue

local AlphaCoreDischargeCoef = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargeCoef
local BetaCoreDischargeCoef = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargeCoef
local GammaCoreDischargeCoef = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargeCoef
local DeltaCoreDischargeCoef = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargeCoef

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
	Lock = true
	Button.ClickDetector.MaxActivationDistance = 0
	AlphaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 0
	AlphaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 0
	BetaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 0
	BetaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 0
	GammaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 0
	GammaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 0
	DeltaCoreIncreaseButton.ClickDetector.MaxActivationDistance = 0
	DeltaCoreDecreaseButton.ClickDetector.MaxActivationDistance = 0
	AlphaCoreDischargeCoef.Value = 8000
	BetaCoreDischargeCoef.Value = 8000
	GammaCoreDischargeCoef.Value = 8000
	DeltaCoreDischargeCoef.Value = 8000
	ButtonDown:Play()
	ButtonSound:Play()
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
	CapDown:Play()
end)

while true do
	if EnergyCapacityValue.Value >= 110000 and CanEvent == true and Lock == false and AlphaCoreStatusValue.Value >= 1 and BetaCoreStatusValue.Value >= 1 and GammaCoreStatusValue.Value >= 1 and DeltaCoreStatusValue.Value >= 1 then
		CanEvent = false
		Button.ClickDetector.MaxActivationDistance = 10
		CapUp:Play()
	end
	if EnergyCapacityValue.Value < 100000 and CanEvent == false and Lock == false then
		CanEvent = true
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
	end
	if AlphaCoreStatusValue.Value == 0 or BetaCoreStatusValue.Value == 0 or GammaCoreStatusValue.Value == 0 or DeltaCoreStatusValue.Value == 0 then
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
	end
	if EnergyCapacityValue.Value == 0 then
		Lock = false
	end
	wait(0.1)
end
