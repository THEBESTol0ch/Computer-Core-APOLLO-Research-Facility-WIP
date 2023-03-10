-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local CoolingSystemStatusValue = script.Parent.Parent.CPU.Values.CoolingSystemStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Items
local PrimaryAnimationPart1 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart1
local PrimaryAnimationPart2 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart2
local PrimaryAnimationPart3 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart3

local PrimaryAnimationPart1Pos1 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart1Pos1
local PrimaryAnimationPart1Pos2 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart1Pos2
local PrimaryAnimationPart1Pos3 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart1Pos3

local PrimaryAnimationPart2Pos1 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart2Pos1
local PrimaryAnimationPart2Pos2 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart2Pos2
local PrimaryAnimationPart2Pos3 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart2Pos3
local PrimaryAnimationPart2Pos4 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart2Pos4

local PrimaryAnimationPart3Pos1 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart3Pos1
local PrimaryAnimationPart3Pos2 = script.Parent.CoolingSystemPoses.PrimaryAnimationPart3Pos2

local Smoke = script.Parent.SmokeEmitter.Smoke
--

local KnotsAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local InOutAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local SystemLiftAnimationSettings = TweenInfo.new(
	10,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local KnotsUp1 = {
	CFrame = PrimaryAnimationPart2Pos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local KnotsUp2 = {
	CFrame = PrimaryAnimationPart2Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local KnotsIn = {
	CFrame = PrimaryAnimationPart2Pos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local KnotsOut = {
	CFrame = PrimaryAnimationPart2Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local KnotsDown1 = {
	CFrame = PrimaryAnimationPart2Pos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local KnotsDown2 = {
	CFrame = PrimaryAnimationPart2Pos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local GearPipesUp = {
	CFrame = PrimaryAnimationPart1Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local GearPipesDown = {
	CFrame = PrimaryAnimationPart1Pos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local GearPipesIn = {
	CFrame = PrimaryAnimationPart1Pos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local GearPipesOut = {
	CFrame = PrimaryAnimationPart1Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LiftUp = {
	CFrame = PrimaryAnimationPart3Pos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LiftDown = {
	CFrame = PrimaryAnimationPart3Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KnotsUp1 = TweenService:Create(PrimaryAnimationPart2, KnotsAnimationSettings, KnotsUp1)
local KnotsUp2 = TweenService:Create(PrimaryAnimationPart2, SystemLiftAnimationSettings, KnotsUp2)
local KnotsIn = TweenService:Create(PrimaryAnimationPart2, InOutAnimationSettings, KnotsIn)
local KnotsOut = TweenService:Create(PrimaryAnimationPart2, InOutAnimationSettings, KnotsOut)
local KnotsDown1 = TweenService:Create(PrimaryAnimationPart2, SystemLiftAnimationSettings, KnotsDown1)
local KnotsDown2 = TweenService:Create(PrimaryAnimationPart2, KnotsAnimationSettings, KnotsDown2)

local GearPipesUp = TweenService:Create(PrimaryAnimationPart1, SystemLiftAnimationSettings, GearPipesUp)
local GearPipesDown = TweenService:Create(PrimaryAnimationPart1, SystemLiftAnimationSettings, GearPipesDown)
local GearPipesIn = TweenService:Create(PrimaryAnimationPart1, InOutAnimationSettings, GearPipesIn)
local GearPipesOut = TweenService:Create(PrimaryAnimationPart1, InOutAnimationSettings, GearPipesOut)

local LiftUp = TweenService:Create(PrimaryAnimationPart3, SystemLiftAnimationSettings, LiftUp)
local LiftDown = TweenService:Create(PrimaryAnimationPart3, SystemLiftAnimationSettings, LiftDown)

-- Functions
function TurnOnRadiator()
	wait(math.random(1, 3))
	KnotsUp1:Play()
	wait(4)
	KnotsUp2:Play()
	GearPipesUp:Play()
	LiftUp:Play()
	wait(10)
	GearPipesIn:Play()
	KnotsIn:Play()
end
function TurnOffRadiator()
	wait(math.random(1, 3))
	GearPipesOut:Play()
	KnotsOut:Play()
	wait(2)
	KnotsDown1:Play()
	GearPipesDown:Play()
	LiftDown:Play()
	wait(10)
	KnotsDown2:Play()
end
--

CoolingSystemStatusValue.Changed:Connect(function()
	if CoolingSystemStatusValue.Value == "ENGAGE" then
		TurnOnRadiator()
	elseif CoolingSystemStatusValue.Value == "DISENGAGE" then
		TurnOffRadiator()
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(23)
		if TNERStatusValue.Value == "OVERLOAD" and CoolingSystemStatusValue.Value == "OFFLINE" then
			TurnOnRadiator()
			wait(58)
			TurnOffRadiator()
			Smoke.Enabled = true
			wait(25)
			Smoke.Enabled = false
		elseif TNERStatusValue.Value == "OVERLOAD" and CoolingSystemStatusValue.Value == "ONLINE" or CoolingSystemStatusValue.Value == "ENGAGE" then
			wait(95)
			TurnOffRadiator()
			Smoke.Enabled = true
			wait(25)
			Smoke.Enabled = false
		end
	end
end)
