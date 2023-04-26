-- Transform Parameters
-- 0.35 Studs
--

-- Control
local TweenService = game:GetService("TweenService")
local ButtonTrigger = script.Parent.Parent.Parent.Button.Trigger
local CRCAdvancedLever = workspace.CRCAdvancedLever.Lever.Handle
--

-- Values
local ButtonStatusValue = script.Parent.Parent.Values.ButtonStatusValue

local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue

local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.CoreStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.CoreStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.CoreStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.CoreStatusValue

local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
--

-- Items
local Hinge = script.Parent.Parent.Parent.Hinge.Hinge
local Button = script.Parent.Parent.Parent.Button.Button
local ButtonPos1 = script.Parent.Parent.Parent.Button.Pos1
local ButtonPos2 = script.Parent.Parent.Parent.Button.Pos2
local ButtonPos3 = script.Parent.Parent.Parent.Button.Pos3
local MainFrame = script.Parent.Parent.Parent.MainFrame.MainFrame
local MainFramePos1 = script.Parent.Parent.Parent.MainFrame.Pos1
local MainFramePos2 = script.Parent.Parent.Parent.MainFrame.Pos2
--

-- Sounds
local ButtonSound = script.Parent.Parent.Parent.Button.Button.ButtonSound2
--

local CapUpAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Elastic,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local CapDownAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local MainFrameAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local ButtonAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local CapUp = {
	CFrame = Hinge.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local CapDown = {
	CFrame = Hinge.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local MainFrameUp = {
	CFrame = MainFramePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local MainFrameDown = {
	CFrame = MainFramePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonUp1 = {
	CFrame = ButtonPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonUp2 = {
	CFrame = ButtonPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonDown1 = {
	CFrame = ButtonPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonDown2 = {
	CFrame = ButtonPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local CapUp = TweenService:Create(Hinge, CapUpAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(-120), 0, 0)
})
local CapDown = TweenService:Create(Hinge, CapDownAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local MainFrameUp = TweenService:Create(MainFrame, MainFrameAnimationSettings, MainFrameUp)
local MainFrameDown = TweenService:Create(MainFrame, MainFrameAnimationSettings, MainFrameDown)
local ButtonUp1 = TweenService:Create(Button, MainFrameAnimationSettings, ButtonUp1)
local ButtonUp2 = TweenService:Create(Button, ButtonAnimationSettings, ButtonUp2)
local ButtonDown1 = TweenService:Create(Button, ButtonAnimationSettings, ButtonDown1)
local ButtonDown2 = TweenService:Create(Button, MainFrameAnimationSettings, ButtonDown2)

-- Functions
function DoButton(Mode)
	if Mode == "Open" then
		ButtonStatusValue.Value = "OPEN"
		CapUp:Play()
		MainFrameUp:Play()
		ButtonUp1:Play()
		wait(3.5)
		ButtonUp2:Play()
		wait(0.5)
		Button.Material = ("Neon")
		ButtonTrigger.ClickDetector.MaxActivationDistance = 10
		ButtonStatusValue.Value = "OPENED"
	elseif Mode == "Close" then
		ButtonTrigger.ClickDetector.MaxActivationDistance = 0
		ButtonStatusValue.Value = "CLOSE"
		ButtonSound:Play()
		ButtonDown1:Play()
		Button.Material = ("Metal")
		wait(0.5)
		MainFrameDown:Play()
		ButtonDown2:Play()
		wait(1.5)
		CapDown:Play()
		wait(1)
		ButtonStatusValue.Value = "CLOSED"
	end
end

function DoCheck()
	if AlphaCoreStatusValue.Value == "ERROR" or BetaCoreStatusValue.Value == "ERROR" or GammaCoreStatusValue.Value == "ERROR" or DeltaCoreStatusValue.Value == "ERROR" or CentralReactorCoreStatusValue.Value == "ERROR" then
		if ButtonStatusValue.Value == "OPENED" then
			DoButton("Close")
		end
	end
end
--

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

ButtonTrigger.ClickDetector.MouseClick:Connect(function()
	DoButton("Close")
end)

CRCAdvancedLever.ClickDetector.MouseClick:Connect(function()
	wait(23.2)
	if not (AlphaCoreStatusValue.Value == "ERROR") and not (BetaCoreStatusValue.Value == "ERROR") and not (GammaCoreStatusValue.Value == "ERROR") and not (DeltaCoreStatusValue.Value == "ERROR") and not (CentralReactorCoreStatusValue.Value == "ERROR") then
		DoButton("Open")
	end
end)
