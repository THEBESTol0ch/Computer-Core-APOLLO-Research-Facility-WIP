-- Control
local TweenService = game:GetService("TweenService")
local Bolt = script.Parent.Parent.Parent.Bolt
local Button = script.Parent.Parent.Parent.FuseButton.Button
--

-- Values
local FuseStatusValue = script.Parent.Parent.Values.FuseStatusValue
local FuseGroundedValue = script.Parent.Parent.Values.FuseGroundedValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Parts
local Fuse = script.Parent.Parent.Parent.Fuse
local BoltPositions = script.Parent.Parent.Parent.Positions.BoltPositions
local FusePositions = script.Parent.Parent.Parent.Positions.FusePositions
local ButtonPositions = script.Parent.Parent.Parent.Positions.ButtonPositions
local CapPositions = script.Parent.Parent.Parent.Positions.CapPositions

local CapMainFrame = script.Parent.Parent.Parent.Capacity.CapMainFrame
local Solution = script.Parent.Parent.Parent.Capacity.Solution
--

-- Sound
local ButtonSound = script.Parent.Parent.Parent.FuseButton.SoundEmitter.ButtonSound
--

-- Monitoring
local FuseStatus = workspace.FuseSystemMonitor.Monitor.Lines[script.Parent.Parent.Parent.Name.."Status"].SurfaceGui.TextLabel
--

-- Logic
local Step = 1
--

local ButtonAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local FuseAnimationSettings = TweenInfo.new(
	5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local BoltPrepareAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local BoltTurnAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local SolutionAnimationSettings = TweenInfo.new(
	10,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local SolutionPropertiesStart = {
	Color = Color3.fromRGB(255, 89, 89)
}
local SolutionPropertiesEnd = {
	Color = Color3.fromRGB(128, 187, 219)
}

local SolutionStart = TweenService:Create(Solution, SolutionAnimationSettings, SolutionPropertiesStart)
local SolutionEnd = TweenService:Create(Solution, SolutionAnimationSettings, SolutionPropertiesEnd)

-- Functions
function TurnBolt(Direction)
	if Direction == "IN" then
		for Count = 2, 10, 1 do
			if Count < 5 then
				TweenService:Create(Bolt, BoltPrepareAnimationSettings, { CFrame = BoltPositions["BoltPos"..Count].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
				wait(2)
			else
				TweenService:Create(Bolt, BoltTurnAnimationSettings, { CFrame = BoltPositions["BoltPos"..Count].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
				wait(1.5)
			end
		end
	elseif Direction == "OUT" then
		for Count = 9, 1, -1 do
			if Count > 3 then
				TweenService:Create(Bolt, BoltTurnAnimationSettings, { CFrame = BoltPositions["BoltPos"..Count].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
				wait(1.5)
			else
				TweenService:Create(Bolt, BoltPrepareAnimationSettings, { CFrame = BoltPositions["BoltPos"..Count].CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
				wait(2)
			end
		end
	end
end
function MoveFuse(Direction)
	if Direction == "UP1" then
		TweenService:Create(Bolt, FuseAnimationSettings, { CFrame = BoltPositions.BoltPos11.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Fuse, FuseAnimationSettings, { CFrame = FusePositions.FusePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Button, FuseAnimationSettings, { CFrame = ButtonPositions.ButtonPos_2_1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	elseif Direction == "UP2" then
		TweenService:Create(Bolt, FuseAnimationSettings, { CFrame = BoltPositions.BoltPos12.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Fuse, FuseAnimationSettings, { CFrame = FusePositions.FusePos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Button, FuseAnimationSettings, { CFrame = ButtonPositions.ButtonPos_3_1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(CapMainFrame, FuseAnimationSettings, { CFrame = CapPositions.CapPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	elseif Direction == "DOWN1" then
		TweenService:Create(Bolt, FuseAnimationSettings, { CFrame = BoltPositions.BoltPos10.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Fuse, FuseAnimationSettings, { CFrame = FusePositions.FusePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Button, FuseAnimationSettings, { CFrame = ButtonPositions.ButtonPos_1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	elseif Direction == "DOWN2" then
		TweenService:Create(Bolt, FuseAnimationSettings, { CFrame = BoltPositions.BoltPos11.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Fuse, FuseAnimationSettings, { CFrame = FusePositions.FusePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(Button, FuseAnimationSettings, { CFrame = ButtonPositions.ButtonPos_2_1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		TweenService:Create(CapMainFrame, FuseAnimationSettings, { CFrame = CapPositions.CapPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
	end
end
function PushButton(Direction, Position)
	if Direction == "IN" then
		if Position == 3 then
			TweenService:Create(Button, ButtonAnimationSettings, { CFrame = ButtonPositions.ButtonPos_2_2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		elseif Position == 4 then
			TweenService:Create(Button, ButtonAnimationSettings, { CFrame = ButtonPositions.ButtonPos_3_2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		end
	elseif Direction == "OUT" then
		if Position == 3 then
			TweenService:Create(Button, ButtonAnimationSettings, { CFrame = ButtonPositions.ButtonPos_2_1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		elseif Position == 4 then
			TweenService:Create(Button, ButtonAnimationSettings, { CFrame = ButtonPositions.ButtonPos_3_1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		end
	end
end
function DoMonitoring(Text, Color)
	FuseStatus.Text = Text
	FuseStatus.TextColor3 = Color
end
--

Bolt.ClickDetector.MouseClick:Connect(function()
	Bolt.ClickDetector.MaxActivationDistance = 0
	if Step == 1 then
		FuseStatusValue.Value = "BOLTING"
		FuseGroundedValue.Value = false
		TurnBolt("IN")
		Bolt.ClickDetector.MaxActivationDistance = 10
		Step = 2
		FuseStatusValue.Value = "ONLINE"
		FuseGroundedValue.Value = true
	elseif Step == 2 then
		FuseStatusValue.Value = "FUSE UP"
		FuseGroundedValue.Value = false
		MoveFuse("UP1")
		wait(5)
		Bolt.ClickDetector.MaxActivationDistance = 10
		Button.ClickDetector.MaxActivationDistance = 10
		Step = 3
	elseif Step == 3 then
		Button.ClickDetector.MaxActivationDistance = 0
		MoveFuse("DOWN1")
		wait(5)
		Bolt.ClickDetector.MaxActivationDistance = 10
		Step = 2
		FuseStatusValue.Value = "ONLINE"
		FuseGroundedValue.Value = true
	end
end)

Bolt.ClickDetector.RightMouseClick:Connect(function()
	if Step == 2 then
		Bolt.ClickDetector.MaxActivationDistance = 0
		FuseStatusValue.Value = "BOLTING"
		FuseGroundedValue.Value = false
		TurnBolt("OUT")
		Bolt.ClickDetector.MaxActivationDistance = 10
		Step = 1
		FuseStatusValue.Value = "ONLINE"
		FuseGroundedValue.Value = true
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	PushButton("IN", Step)
	ButtonSound:Play()
	wait(0.4)
	PushButton("OUT", Step)
end)

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	if Step == 3 then
		Bolt.ClickDetector.MaxActivationDistance = 0
		FuseStatusValue.Value = "DISENGAGE"
		DoMonitoring(FuseStatusValue.Value, Color3.new(1, 0.666667, 0))
		wait(4)
		MoveFuse("UP2")
		wait(7)
		SolutionStart:Play()
		wait(10)
		FuseStatusValue.Value = "OFFLINE"
		DoMonitoring(FuseStatusValue.Value, Color3.new(1, 0, 0))
		Button.ClickDetector.MaxActivationDistance = 10
		Step = 4
	elseif Step == 4 then
		FuseStatusValue.Value = "ENGAGE"
		DoMonitoring(FuseStatusValue.Value, Color3.new(1, 0.666667, 0))
		wait(3)
		SolutionEnd:Play()
		wait(13)
		MoveFuse("DOWN2")
		wait(5)
		Bolt.ClickDetector.MaxActivationDistance = 10
		Step = 3
		FuseStatusValue.Value = "ONLINE"
		DoMonitoring(FuseStatusValue.Value, Color3.new(0, 1, 0))
		Button.ClickDetector.MaxActivationDistance = 10
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "UNSTABLE" then
		Button.ClickDetector.MaxActivationDistance = 0
	end
	if TNERStatusValue.Value == "SHUT DOWN" then
		Button.ClickDetector.MaxActivationDistance = 10
	end
end)
