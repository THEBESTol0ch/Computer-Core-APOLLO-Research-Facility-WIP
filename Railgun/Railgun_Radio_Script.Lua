local RCSierraSound = script.Parent.Frame.RCSierraSound
local RCInstructionsSound = script.Parent.Frame.RCInstructionsSound
local RCTakeCover = script.Parent.Frame.RCTakeCover

local TargetValue = workspace.RailgunConsole.EmergencyButton.TargetValue
local Screen = script.Parent.Screen
local RadioClickDetector = script.Parent.RadioClickDetector
local FireButton = workspace.RailgunConsole.EmergencyButton.Button

RadioClickDetector.ClickDetector.MouseClick:Connect(function()
	RadioClickDetector.ClickDetector.MaxActivationDistance = 0
	RCSierraSound:Play()
	Screen.BrickColor = BrickColor.new("Bright green")
	Screen.Material = ("Neon")
	wait(0.9)
	Screen.BrickColor = BrickColor.new("Slime green")
	Screen.Material = ("Glass")
	wait(10)
	TargetValue.Value = 1
	RCInstructionsSound:Play()
	workspace.RailgunMonitor.Lines.TargetStatus.SurfaceGui.TextLabel.Text = ("INSTALLED")
	workspace.RailgunMonitor.Lines.TargetStatus.SurfaceGui.TextLabel.TextColor3 = Color3.new(0, 255, 0)
	Screen.BrickColor = BrickColor.new("Bright green")
	Screen.Material = ("Neon")
	wait(3.3)
	Screen.BrickColor = BrickColor.new("Slime green")
	Screen.Material = ("Glass")
end)

FireButton.ClickDetector.MouseClick:Connect(function()
	wait(3)
	RCTakeCover:Play()
	Screen.BrickColor = BrickColor.new("Bright green")
	Screen.Material = ("Neon")
	wait(1.5)
	Screen.BrickColor = BrickColor.new("Slime green")
	Screen.Material = ("Glass")
end)
