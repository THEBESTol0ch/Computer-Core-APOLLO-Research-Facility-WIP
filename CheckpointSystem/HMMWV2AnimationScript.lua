-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local CheckpointSystemStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.CheckpointSystemStatusValue
local MilitaryForceControlValue = game.ReplicatedStorage.GameValues.MilitaryForceControlValue
local MilitaryForceStatusValue = game.ReplicatedStorage.GameValues.MilitaryForceStatusValue
local StatusValue = script.Parent.Parent.Values.StatusValue
--

-- Items
local HMMWV = script.Parent.Parent.Parent.HMMWV
local HMMWVPrimaryPart = HMMWV.HMMWVPrimaryPart
local Light = HMMWV.RBumper.Frame.PointLight
local Lamp1 = HMMWV.Lamps.Lamp1.Lamp
local Lamp2 = HMMWV.Lamps.Lamp2.Lamp

local Positions = script.Parent.Parent.Parent.Positions
local Pos1 = Positions.Pos1
local Pos2 = Positions.Pos2
local Pos3 = Positions.Pos3
local Pos4 = Positions.Pos4
local Pos5 = Positions.Pos5
local Pos6 = Positions.Pos6
local Pos7 = Positions.Pos7
local Pos8 = Positions.Pos8
local Pos9 = Positions.Pos9
local Pos10 = Positions.Pos10
local Pos11 = Positions.Pos11
local Pos12 = Positions.Pos12
local Pos13 = Positions.Pos13
local Pos14 = Positions.Pos14
local Pos15 = Positions.Pos15
local Pos16 = Positions.Pos16
--

local ObjectMove1 = {
	CFrame = Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove2 = {
	CFrame = Pos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove3 = {
	CFrame = Pos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove4 = {
	CFrame = Pos5.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove5 = {
	CFrame = Pos6.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove6 = {
	CFrame = Pos7.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove7 = {
	CFrame = Pos8.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove8 = {
	CFrame = Pos9.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove9 = {
	CFrame = Pos10.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove10 = {
	CFrame = Pos11.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove11 = {
	CFrame = Pos12.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove12 = {
	CFrame = Pos13.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove13 = {
	CFrame = Pos14.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove14 = {
	CFrame = Pos15.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove15 = {
	CFrame = Pos16.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ObjectMove16 = {
	CFrame = Pos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ObjectAnimationSettingsStart = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local ObjectAnimationSettingsMove = TweenInfo.new(
	2.5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local ObjectAnimationSettingsEnd = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local ObjectAnimationSettingsEvac = TweenInfo.new(
	30,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local ObjectMove1 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsStart, ObjectMove1)
local ObjectMove2 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove2)
local ObjectMove3 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove3)
local ObjectMove4 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove4)
local ObjectMove5 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove5)
local ObjectMove6 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove6)
local ObjectMove7 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsEnd, ObjectMove7)
local ObjectMove8 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsStart, ObjectMove8)
local ObjectMove9 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove9)
local ObjectMove10 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove10)
local ObjectMove11 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove11)
local ObjectMove12 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove12)
local ObjectMove13 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove13)
local ObjectMove14 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove14)
local ObjectMove15 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsEvac, ObjectMove15)
local ObjectMove16 = TweenService:Create(HMMWVPrimaryPart, ObjectAnimationSettingsMove, ObjectMove16)

-- Functions
function DoAction()
	if StatusValue.Value == "DEPARTED" and MilitaryForceStatusValue.Value == "DEPARTED" and MilitaryForceControlValue.Value == "CALL" then
		StatusValue.Value = "ARRIVE"
		wait(9)
		ObjectMove1:Play()
		wait(2.5)
		ObjectMove2:Play()
		wait(2)
		ObjectMove3:Play()
		wait(2.5)
		ObjectMove4:Play()
		wait(2.5)
		ObjectMove5:Play()
		wait(2.5)
		ObjectMove6:Play()
		wait(2.5)
		ObjectMove7:Play()
		StatusValue.Value = "ARRIVED"
	elseif StatusValue.Value == "ARRIVED" and MilitaryForceStatusValue.Value == "ARRIVED" and MilitaryForceControlValue.Value == "CALL OFF" then
		StatusValue.Value = "DEPART"
		wait(11)
		ObjectMove8:Play()
		wait(3)
		ObjectMove9:Play()
		wait(2.5)
		ObjectMove10:Play()
		wait(2.5)
		ObjectMove11:Play()
		wait(2.5)
		ObjectMove12:Play()
		wait(2)
		ObjectMove13:Play()
		wait(2)
		ObjectMove14:Play()
		wait(2)
		ObjectMove15:Play()
		wait(30)
		ObjectMove16:Play()
		wait(1)
		StatusValue.Value = "DEPARTED"
	end
end
--

StatusValue.Changed:Connect(function()
	DoAction()
end)
MilitaryForceControlValue.Changed:Connect(function()
	DoAction()
end)
MilitaryForceStatusValue.Changed:Connect(function()
	DoAction()
end)
