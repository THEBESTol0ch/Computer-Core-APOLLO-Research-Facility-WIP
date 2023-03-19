-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local TNERFuse5StatusValue = script.Parent.Parent.Values.TNERFuse5StatusValue
local LeverValue = workspace.TNERFuse5Console.PullLever.CPU.Values.LeverValue
--

-- Items
local CapsuleHinge = script.Parent.Parent.Parent.DMRModule.Lock.Hinge
--

-- Monitoring
local StatusLabel = workspace.TNERFuse5Monitor.Monitor.Lines.Status.SurfaceGui.TextLabel
local OutputLabel = workspace.TNERFuse5Monitor.Monitor.Lines.Output.SurfaceGui.TextLabel
--

local CapsuleOpen1AnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local CapsuleOpen2AnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local CapsuleCloseAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local CapsuleOpen1 = TweenService:Create(CapsuleHinge, CapsuleOpen1AnimationSettings, {
	CFrame = CapsuleHinge.CFrame * CFrame.Angles(math.rad(20), 0, 0)
})
local CapsuleOpen2 = TweenService:Create(CapsuleHinge, CapsuleOpen2AnimationSettings, {
	CFrame = CapsuleHinge.CFrame * CFrame.Angles(math.rad(30), 0, 0)
})
local CapsuleClose = TweenService:Create(CapsuleHinge, CapsuleCloseAnimationSettings, {
	CFrame = CapsuleHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

-- Functions
function DoMonitoring(Text, Color)
	StatusLabel.Text = Text
	StatusLabel.TextColor3 = Color
end
--

LeverValue.Changed:Connect(function()
	if LeverValue.Value == "FULL" then
		TNERFuse5StatusValue.Value = "SHUT DOWN"
		DoMonitoring(TNERFuse5StatusValue.Value, Color3.new(1, 0.666667, 0))
		wait(0.2)
		OutputLabel.Text = "THE REACTOR CANNOT BE STARTED WHILE THE 5TH FUSE IS DISABLED. CODE:H453B8"
		wait(2)
		CapsuleOpen1:Play()
		wait(4)
		CapsuleOpen2:Play()
		wait(2)
		TNERFuse5StatusValue.Value = "OFFLINE"
		DoMonitoring(TNERFuse5StatusValue.Value, Color3.new(1, 0, 0))
	elseif LeverValue.Value == "LOW" then
		TNERFuse5StatusValue.Value = "POWER ON"
		DoMonitoring(TNERFuse5StatusValue.Value, Color3.new(1, 0.666667, 0))
		CapsuleClose:Play()
		wait(8)
		TNERFuse5StatusValue.Value = "ONLINE"
		DoMonitoring(TNERFuse5StatusValue.Value, Color3.new(0, 1, 0))
		wait(0.2)
		OutputLabel.Text = ""
	end
end)
