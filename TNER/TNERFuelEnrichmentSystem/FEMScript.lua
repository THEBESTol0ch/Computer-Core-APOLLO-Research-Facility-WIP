-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local FEMStatusValue = script.Parent.Parent.Values.FEMStatusValue
local LeverValue = workspace[script.Parent.Parent.Parent.Name.."PullLever"].CPU.Values.LeverValue
--

-- Items
local Base = script.Parent.Parent.Parent.MovingConnector.Base
local BasePos1 = script.Parent.Parent.Parent.Positions.BasePos1
local BasePos2 = script.Parent.Parent.Parent.Positions.BasePos2
local BasePos3 = script.Parent.Parent.Parent.Positions.BasePos3
local BlueLamps = script.Parent.Parent.Parent.StaticConnector.BlueLamps
local Lock = script.Parent.Parent.Parent.StaticConnector.Frame.LockFrame.LockHinge

local FEM = workspace.FESConsoleMonitor[script.Parent.Parent.Parent.Name]
local FEMConsoleMonitorStatus = workspace.FESConsoleMonitor.Lines[script.Parent.Parent.Parent.Name.."Status"].SurfaceGui.TextLabel
local FEMMonitorStatus = workspace.FESMonitor.Monitor.Lines[script.Parent.Parent.Parent.Name.."Status"].SurfaceGui.TextLabel
--

-- Sounds
local TritiumEnrichmentSystemSound = script.Parent.Parent.Parent.MovingConnector.SoundEmitter.TritiumEnrichmentSystemSound	
--

local TritiumEnrichmentSystemPos1AnimationSettings = TweenInfo.new(
	6,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local TritiumEnrichmentSystemPos2AnimationSettings = TweenInfo.new(
	5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local TritiumEnrichmentSystemPos3AnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local LockAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local BaseUp1 = {
	CFrame = BasePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BaseUp2 = {
	CFrame = BasePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BaseUp3 = {
	CFrame = BasePos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}


local BaseDown1 = {
	CFrame = BasePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BaseDown2 = {
	CFrame = BasePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BaseDown3 = {
	CFrame = Base.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LockUp = TweenService:Create(Lock, LockAnimationSettings, {
	CFrame = Lock.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local LockDown = TweenService:Create(Lock, LockAnimationSettings, {
	CFrame = Lock.CFrame * CFrame.Angles(math.rad(-90), 0, 0)
})

local BaseUp1 = TweenService:Create(Base, TritiumEnrichmentSystemPos1AnimationSettings, BaseUp1)
local BaseUp2 = TweenService:Create(Base, TritiumEnrichmentSystemPos2AnimationSettings, BaseUp2)
local BaseUp3 = TweenService:Create(Base, TritiumEnrichmentSystemPos3AnimationSettings, BaseUp3)

local BaseDown1 = TweenService:Create(Base, TritiumEnrichmentSystemPos1AnimationSettings, BaseDown1)
local BaseDown2 = TweenService:Create(Base, TritiumEnrichmentSystemPos2AnimationSettings, BaseDown2)
local BaseDown3 = TweenService:Create(Base, TritiumEnrichmentSystemPos3AnimationSettings, BaseDown3)

-- Functions
function DoMonitors(Text, Color)
	FEMMonitorStatus.Text = Text
	FEMMonitorStatus.TextColor3 = Color
	FEMConsoleMonitorStatus.Text = Text
	FEMConsoleMonitorStatus.TextColor3 = Color
end
function DoFEM(Mode)
	if Mode == "ON" then
		FEMStatusValue.Value = "ENGAGE"
		DoMonitors(FEMStatusValue.Value, Color3.new(1, 0.666667, 0))
		wait(10)
		TritiumEnrichmentSystemSound:Play()
		wait(1)
		BaseUp1:Play()
		wait(9.5)
		BaseUp2:Play()
		wait(3.4)
		BaseUp3:Play()
		wait(5)
		LockDown:Play()
		wait(1)
		for Count = 1, 4, 1 do
			BlueLamps["Lamp"..Count].Material = ("Neon")
			wait(math.random(1, 2))
		end
		FEMStatusValue.Value = "ONLINE"
		FEM.FEMOfflineDecal.Transparency = 1
		FEM.FEMOnlineDecal.Transparency = 0
		DoMonitors(FEMStatusValue.Value, Color3.new(0, 255, 0))
	elseif Mode == "OFF" then
		if FEMStatusValue.Value == "ONLINE" then
			FEMStatusValue.Value = "DISENGAGE"
			DoMonitors(FEMStatusValue.Value, Color3.new(1, 0.666667, 0))
			FEM.FEMOfflineDecal.Transparency = 0
			FEM.FEMOnlineDecal.Transparency = 1
			for Count = 4, 1, -1 do
				BlueLamps["Lamp"..Count].Material = ("Glass")
				wait(math.random(1, 2))
			end
			wait(1)
			LockUp:Play()
			wait(2)
			TritiumEnrichmentSystemSound:Play()
			wait(1)
			BaseDown1:Play()
			wait(9.5)
			BaseDown2:Play()
			wait(3.4)
			BaseDown3:Play()
			wait(3)
			FEMStatusValue.Value = "OFFLINE"
			DoMonitors(FEMStatusValue.Value, Color3.new(1, 0, 0))
		end
	end
end
--

LeverValue.Changed:Connect(function()
	if LeverValue.Value == "FULL" then
		DoFEM("ON")
	else
		DoFEM("OFF")
	end
end)

FEMStatusValue.Changed:Connect(function()
	wait(1)
	if FEMStatusValue.Value == "ONLINE" and LeverValue.Value == "LOW" then
		DoFEM("OFF")
	end
end)
