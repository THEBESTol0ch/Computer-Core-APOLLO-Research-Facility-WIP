-- Values
local SuperchargerStatusValue = script.Parent.Parent.Values.SuperchargerStatusValue
local LeverValue = workspace.SuperchargerPullLever.CPU.Values.LeverValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Items
local Flywheels = workspace.TNER.SuperchargerSystem.Flywheels
local FlywheelsStats = workspace.SuperchargerSystemMonitor.Monitor.Lines
local SuperchargerSystemConsoleMonitor = workspace.SuperchargerSystemConsoleMonitor.Screen
local DeathTriggerScript = script.Parent.Parent.Parent.DeathTriggers.DeathTriggerScript
--

-- Sounds
local SuperchargerIncreaseSound = workspace.TNER.SoundEmitter.SuperchargerIncreaseSound
local SuperchargerWorkSound = workspace.TNER.SoundEmitter.SuperchargerWorkSound
local SuperchargerDecreaseSound = workspace.TNER.SoundEmitter.SuperchargerDecreaseSound
local OverloadStopUnsuccessSound = workspace.TNER.SoundEmitter.OverloadStopUnsuccessSound
--

-- Functions
function DoSupercharger()
	if SuperchargerStatusValue.Value == "OFFLINE" and LeverValue.Value == "FULL" then
		SuperchargerStatusValue.Value = "INCREASE"
		if OverloadStopUnsuccessSound.IsPlaying == false then SuperchargerIncreaseSound:Play() end
		DeathTriggerScript.Enabled = true
		for Count = 1, 6, 1 do
			if Count == 2 or Count == 5 then
				Flywheels["Flywheel"..Count].MainFrame.HingeConstraint.AngularVelocity = -20
			else
				Flywheels["Flywheel"..Count].MainFrame.HingeConstraint.AngularVelocity = 20
			end
			FlywheelsStats["Flywheel"..Count.."Status"].SurfaceGui.TextLabel.Text = ("ONLINE")
			FlywheelsStats["Flywheel"..Count.."Status"].SurfaceGui.TextLabel.TextColor3 = Color3.new(0, 1, 0)
		end
		SuperchargerSystemConsoleMonitor.SuperchargerOfflineDecal.Transparency = 1
		SuperchargerSystemConsoleMonitor.SuperchargerOnlineDecal.Transparency = 0
		wait(5)
		SuperchargerStatusValue.Value = "ONLINE"
	elseif SuperchargerStatusValue.Value == "ONLINE" and LeverValue.Value == "LOW" then
		SuperchargerStatusValue.Value = "OFFLINE"
		for Count = 1, 6, 1 do
			Flywheels["Flywheel"..Count].MainFrame.HingeConstraint.AngularVelocity = 0
			FlywheelsStats["Flywheel"..Count.."Status"].SurfaceGui.TextLabel.Text = ("OFFLINE")
			FlywheelsStats["Flywheel"..Count.."Status"].SurfaceGui.TextLabel.TextColor3 = Color3.new(1, 0, 0)
		end
		SuperchargerSystemConsoleMonitor.SuperchargerOfflineDecal.Transparency = 0
		SuperchargerSystemConsoleMonitor.SuperchargerOnlineDecal.Transparency = 1
		wait(2)
		SuperchargerDecreaseSound:Play()
		wait(0.5)
		SuperchargerIncreaseSound:Stop()
		SuperchargerWorkSound:Stop()
		wait(10)
		DeathTriggerScript.Enabled = false
	end
end
--

SuperchargerStatusValue.Changed:Connect(function()
	if SuperchargerStatusValue.Value == "ONLINE" then
		wait(SuperchargerIncreaseSound.TimeLength - 6)
		if SuperchargerStatusValue.Value == "ONLINE" and TNERStatusValue.Value == "ONLINE" and OverloadStopUnsuccessSound.IsPlaying == false then
			SuperchargerWorkSound:Play()	
		end
	end
end)

LeverValue.Changed:Connect(function()
	DoSupercharger()
end)

SuperchargerStatusValue.Changed:Connect(function()
	wait(1)
	DoSupercharger()
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "UNSTABLE" then
		SuperchargerIncreaseSound:Stop()
		SuperchargerWorkSound:Stop()
	end
end)
