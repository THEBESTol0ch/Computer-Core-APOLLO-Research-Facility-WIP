-- Control
local TweenService = game:GetService("TweenService")
local Button = script.Parent.Button
--

-- Values
local KeyPickupValue = workspace.CentralReactorCore.CPU.Values.KeyPickupValue
local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue

local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.CoreStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.CoreStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.CoreStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.CoreStatusValue

local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
--

-- Items
local ButtonPos = script.Parent.ButtonPos
local CapHinge = script.Parent.Hinge
--

-- Sounds
local ButtonSound = script.Parent.SoundEmitter.ButtonSound
--

-- Logic
local CanEvent = true
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
	if EnergyCapacityValue.Value == 110000 and AlphaCoreStatusValue.Value == "ONLINE" and BetaCoreStatusValue.Value == "ONLINE" and GammaCoreStatusValue.Value == "ONLINE" and DeltaCoreStatusValue.Value == "ONLINE" and not (CentralReactorCoreStatusValue.Value == "ERROR") then
		if CanEvent == true then
			Button.ClickDetector.MaxActivationDistance = 10
			CapUp:Play()
		end
	elseif EnergyCapacityValue.Value == 100000 or AlphaCoreStatusValue.Value == "ERROR" or BetaCoreStatusValue.Value == "ERROR" or GammaCoreStatusValue.Value == "ERROR" or DeltaCoreStatusValue.Value == "ERROR" or CentralReactorCoreStatusValue.Value == "ERROR" then
		Button.ClickDetector.MaxActivationDistance = 0
		CapDown:Play()
	end
end
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	CanEvent = false
	ButtonDown:Play()
	ButtonSound:Play()
	KeyPickupValue.Value = false
	wait(0.4)
	ButtonUp:Play()
	wait(0.3)
	CapDown:Play()
end)

EnergyCapacityValue.Changed:Connect(function()
	DoCheck()
end)
AlphaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
BetaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
GammaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
DeltaCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)
CentralReactorCoreStatusValue.Changed:Connect(function()
	DoCheck()
end)

CentralReactorCoreStatusValue.Changed:Connect(function()
	if CentralReactorCoreStatusValue.Value == "OFFLINE" then
		CanEvent = true
	end
end)
