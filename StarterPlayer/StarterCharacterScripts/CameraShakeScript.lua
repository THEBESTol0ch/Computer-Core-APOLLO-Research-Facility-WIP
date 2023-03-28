-- Control
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")
--

-- Earthquake
local FacilityDestructionEffectValue = workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camera = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camera.CFrame = camera.CFrame * shakeCf
end)
camShake:Start()
FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKING" then
		camShake:Shake(CameraShaker.Presets.Earthquake)
	end
end)
--

-- TNER
local TNERShakeInTrigger = workspace.Triggers.TNERTriggers.TNERShakeInTrigger
local TNERShakeOutTrigger = workspace.Triggers.TNERTriggers.TNERShakeOutTrigger
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local ShakeForceValue = workspace.TNER.CPU.Values.ShakeForceValue
local InTNERShakeZoneValue = script.Parent:WaitForChild("InTNERShakeZoneValue")
--

-- Functions
function ShakeCamera()
	print("Shake Started")
	repeat
		local XOffset = math.random(-ShakeForceValue.Value, ShakeForceValue.Value) / 1000
		local YOffset = math.random(-ShakeForceValue.Value, ShakeForceValue.Value) / 1000
		local ZOffset = math.random(-ShakeForceValue.Value, ShakeForceValue.Value) / 1000
		Humanoid.CameraOffset = Vector3.new(XOffset, YOffset, ZOffset)
		wait(0.02)
		Humanoid.CameraOffset = Vector3.new(0, 0, 0)
	until InTNERShakeZoneValue.Value == false or ShakeForceValue.Value == 0
	print("Shake Ended")
end
function DoCheck()
	if TNERStatusValue.Value == "OVERLOAD" and InTNERShakeZoneValue.Value == true then
		ShakeCamera()
	end
end
--

TNERShakeInTrigger.Touched:Connect(function(Hit)
	local PlayerCheck = Players:GetPlayerFromCharacter(Hit.Parent)
	if PlayerCheck == Player then
		InTNERShakeZoneValue.Value = true
	end
end)
TNERShakeOutTrigger.Touched:Connect(function(Hit)
	local PlayerCheck = Players:GetPlayerFromCharacter(Hit.Parent)
	if PlayerCheck == Player then
		InTNERShakeZoneValue.Value = false
	end
end)

TNERStatusValue.Changed:Connect(function()
	DoCheck()
end)
InTNERShakeZoneValue.Changed:Connect(function()
	DoCheck()
end)
