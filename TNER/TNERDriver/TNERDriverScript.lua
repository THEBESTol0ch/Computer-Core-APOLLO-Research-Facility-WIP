-- Control
local TweenService = game:GetService("TweenService")
local Trigger = workspace.TNERDriverButton.Button
local AdvancedLever = script.Parent.Parent.Parent.AdvancedLever.Lever.Handle
--

-- Values
local TNERDriverStatusValue = script.Parent.Parent.Values.TNERDriverStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Items
local Rod = script.Parent.Parent.Parent.Rod.Rod
local RodPos1 = script.Parent.Parent.Parent.RodPos1
local RodPos2 = script.Parent.Parent.Parent.RodPos2
--

-- Logic
local SequenceComplete = false
--

local RodInOutAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local RodRotateInOutAnimationSettings = TweenInfo.new(
	5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local AssetsStorageAnimationSettings = TweenInfo.new(
	0,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local RodOut = {
	CFrame = RodPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RodIn = {
	CFrame = Rod.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RodRotateOut = {
	CFrame = RodPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local RodRotateIn = {
	CFrame = RodPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local RodOut = TweenService:Create(Rod, RodInOutAnimationSettings, RodOut)
local RodIn = TweenService:Create(Rod, RodInOutAnimationSettings, RodIn)
local RodRotateOut = TweenService:Create(Rod, RodRotateInOutAnimationSettings, RodRotateOut)
local RodRotateIn = TweenService:Create(Rod, RodRotateInOutAnimationSettings, RodRotateIn)

Trigger.ClickDetector.MouseClick:Connect(function()
	if TNERDriverStatusValue.Value == "OFFLINE" then
		TNERDriverStatusValue.Value = "MOVING"
		wait(2)
		RodOut:Play()
		wait(2)
		RodRotateOut:Play()
		wait(5)
		TNERDriverStatusValue.Value = "ONLINE"
	end
end)

TNERStatusValue.Changed:Connect(function()
	if SequenceComplete == true and TNERDriverStatusValue.Value == "ONLINE" then
		if TNERStatusValue.Value == "POWER ON" or TNERStatusValue.Value == "SHUT DOWN" then
			SequenceComplete = false
			TNERDriverStatusValue.Value = "MOVING"
			RodRotateIn:Play()
			wait(5)
			RodIn:Play()
			wait(2)
			TNERDriverStatusValue.Value = "OFFLINE"
		end
	end
end)

AdvancedLever.ClickDetector.MouseClick:Connect(function()
	SequenceComplete = true
end)
