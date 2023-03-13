-- Control
local TweenService = game:GetService("TweenService")
local HatchControlButton = workspace.FuseSystemConsole.CapButton.Button
local HatchTrigger = script.Parent.Parent.Parent.Parent.Hatch.Trigger
--

-- Values
local HatchStatusValue = script.Parent.Parent.Values.HatchStatusValue

local Fuse1GroundedValue = script.Parent.Parent.Parent.Parent.Fuse1.CPU.Values.FuseGroundedValue
local Fuse2GroundedValue = script.Parent.Parent.Parent.Parent.Fuse2.CPU.Values.FuseGroundedValue
local Fuse3GroundedValue = script.Parent.Parent.Parent.Parent.Fuse3.CPU.Values.FuseGroundedValue
local Fuse4GroundedValue = script.Parent.Parent.Parent.Parent.Fuse4.CPU.Values.FuseGroundedValue

local Fuse1StatusValue = script.Parent.Parent.Parent.Parent.Fuse1.CPU.Values.FuseStatusValue
local Fuse2StatusValue = script.Parent.Parent.Parent.Parent.Fuse2.CPU.Values.FuseStatusValue
local Fuse3StatusValue = script.Parent.Parent.Parent.Parent.Fuse3.CPU.Values.FuseStatusValue
local Fuse4StatusValue = script.Parent.Parent.Parent.Parent.Fuse4.CPU.Values.FuseStatusValue
--

-- Items
local Hatch = script.Parent.Parent.Parent.Parent.Hatch.Hatch
local HatchHinge = script.Parent.Parent.Parent.Parent.Hatch.Hinge
local Bolt1 = script.Parent.Parent.Parent.Parent.Fuse1.Bolt
local Bolt2 = script.Parent.Parent.Parent.Parent.Fuse2.Bolt
local Bolt3 = script.Parent.Parent.Parent.Parent.Fuse3.Bolt
local Bolt4 = script.Parent.Parent.Parent.Parent.Fuse4.Bolt
--

-- Monitoring
local FuseHatchStatus = workspace.FuseSystemMonitor.Monitor.Lines.FuseHatchStatus.SurfaceGui.TextLabel
local FuseHatchConsoleStatus = workspace.FuseSystemConsoleMonitor.Lines.FuseHatchStatus.SurfaceGui.TextLabel
local Output = workspace.FuseSystemConsoleMonitor.Lines.Output.SurfaceGui.TextLabel
local Description = workspace.FuseSystemConsoleMonitor.Lines.Description.SurfaceGui.TextLabel
--

local HatchAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local HatchUnlockAnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local HatchUnlock = TweenService:Create(HatchHinge, HatchUnlockAnimationSettings, {
	CFrame = HatchHinge.CFrame * CFrame.Angles(math.rad(-11.57), 0, 0)
})

local HatchOpen = TweenService:Create(HatchHinge, HatchAnimationSettings, {
	CFrame = HatchHinge.CFrame * CFrame.Angles(math.rad(-110), 0, 0)
})
local HatchClose = TweenService:Create(HatchHinge, HatchAnimationSettings, {
	CFrame = HatchHinge.CFrame * CFrame.Angles(math.rad(-0), 0, 0)
})

-- Functions
function DoMonitoring(Text, Color)
	FuseHatchStatus.Text = Text
	FuseHatchStatus.TextColor3 = Color
	FuseHatchConsoleStatus.Text = Text
	FuseHatchConsoleStatus.TextColor3 = Color
end
function DoCheck()
	if Fuse1GroundedValue.Value == true and Fuse2GroundedValue.Value == true and Fuse3GroundedValue.Value == true and Fuse4GroundedValue.Value == true then
		if HatchStatusValue.Value == "OPENED" then
			HatchTrigger.ClickDetector.MaxActivationDistance = 10
		end
	else
		HatchTrigger.ClickDetector.MaxActivationDistance = 0
	end
end
function CloseHatch()
	HatchTrigger.ClickDetector.MaxActivationDistance = 0
	HatchTrigger.ClickDetector.MaxActivationDistance = 0
	Bolt1.ClickDetector.MaxActivationDistance = 0
	Bolt2.ClickDetector.MaxActivationDistance = 0
	Bolt3.ClickDetector.MaxActivationDistance = 0
	Bolt4.ClickDetector.MaxActivationDistance = 0
	HatchClose:Play()
	wait(2)
	HatchStatusValue.Value = "LOCKED"
	DoMonitoring(HatchStatusValue.Value, Color3.new(0, 1, 0))
	wait(0.5)
	Output.Text = ("")
	wait(0.2)
	Description.Text = ("")
end
--

HatchControlButton.ClickDetector.MouseClick:Connect(function()
	HatchUnlock:Play()
	HatchStatusValue.Value = "UNLOCKED"
	wait(2)
	DoMonitoring(HatchStatusValue.Value, Color3.new(1, 0, 0))
	HatchTrigger.ClickDetector.MaxActivationDistance = 10
	wait(0.5)
	Output.Text = ("ERROR")
	wait(0.2)
	Description.Text = ("THE REACTOR CANNOT BE STARTED WHILE THE FUSE HATCH IS OPEN. CODE:H453B8")
end)

HatchTrigger.ClickDetector.MouseClick:Connect(function()
	if HatchStatusValue.Value == "UNLOCKED" then
		HatchTrigger.ClickDetector.MaxActivationDistance = 0
		HatchOpen:Play()	
		wait(2)
		HatchTrigger.ClickDetector.MaxActivationDistance = 10
		Bolt1.ClickDetector.MaxActivationDistance = 10
		Bolt2.ClickDetector.MaxActivationDistance = 10
		Bolt3.ClickDetector.MaxActivationDistance = 10
		Bolt4.ClickDetector.MaxActivationDistance = 10
		HatchStatusValue.Value = "OPENED"
		DoMonitoring(HatchStatusValue.Value, Color3.new(1, 0.666667, 0))
	elseif HatchStatusValue.Value == "OPENED" then
		CloseHatch()
	end
end)

HatchTrigger.ClickDetector.RightMouseClick:Connect(function()
	if HatchStatusValue.Value == "UNLOCKED" or HatchStatusValue.Value == "OPENED" then
		CloseHatch()
	end
end)

Fuse1GroundedValue.Changed:Connect(function()
	DoCheck()
end)

Fuse2GroundedValue.Changed:Connect(function()
	DoCheck()
end)

Fuse3GroundedValue.Changed:Connect(function()
	DoCheck()
end)

Fuse4GroundedValue.Changed:Connect(function()
	DoCheck()
end)
