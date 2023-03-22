-- Control
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")
--

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camera = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camera.CFrame = camera.CFrame * shakeCf
end)

camShake:Start()

game.ReplicatedStorage.CameraShakeEvent.OnClientEvent:Connect(function()
	camShake:Shake(CameraShaker.Presets.Earthquake)
end)

local TNERShakeInTrigger = workspace.Triggers.TNERTriggers.TNERShakeInTrigger
local TNERShakeOutTrigger = workspace.Triggers.TNERTriggers.TNERShakeOutTrigger
local OverloadStartSound = workspace.TNER.SoundEmitter.OverloadStartSound
local OverloadLoopSound = workspace.TNER.SoundEmitter.OverloadLoopSound
local OverloadStopSound = workspace.TNER.SoundEmitter.OverloadStopSound
local TNEROverloadStartUpTime = workspace.TNER.CPU.Values.TNEROverloadStartUpTime

local ForceIncreaseAnimationSettings = TweenInfo.new(
	65.2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local ForceDecreaseAnimationSettings = TweenInfo.new(
	9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

-- Logic
local ShakeForceValue = game.ReplicatedStorage.GameValues.ShakeForceValue
local PlayerInShakeZone = false
--

-- Functions
function ShakeCamera(Force)
	local XOffset = math.random(-Force, Force) / 1000
	local YOffset = math.random(-Force, Force) / 1000
	local ZOffset = math.random(-Force, Force) / 1000
	Humanoid.CameraOffset = Vector3.new(XOffset, YOffset, ZOffset)
	wait(0.02)
	Humanoid.CameraOffset = Vector3.new(0, 0, 0)
end
--

OverloadStartSound.Changed:Connect(function()
	if OverloadStartSound.IsPlaying == true then
		wait(TNEROverloadStartUpTime.Value)
		TweenService:Create(ShakeForceValue, ForceIncreaseAnimationSettings, { Value = 100 }):Play()
	end
end)

OverloadStopSound.Changed:Connect(function()
	if OverloadStopSound.IsPlaying == true then
		wait(TNEROverloadStartUpTime.Value)
		TweenService:Create(ShakeForceValue, ForceDecreaseAnimationSettings, { Value = 0 }):Play()
	end
end)

TNERShakeInTrigger.Touched:Connect(function(Hit)
	local PlayerCheck = Players:GetPlayerFromCharacter(Hit.Parent)
	if PlayerCheck and PlayerCheck == Player then
		PlayerInShakeZone = true
		if OverloadStartSound.IsPlaying == true or OverloadLoopSound.IsPlaying == true or OverloadStopSound.IsPlaying == true then
			repeat
				ShakeCamera(ShakeForceValue.Value)
			until PlayerInShakeZone == false
		end
	end
end)
TNERShakeOutTrigger.Touched:Connect(function(Hit)
	local PlayerCheck = Players:GetPlayerFromCharacter(Hit.Parent)
	if PlayerCheck and PlayerCheck == Player then
		PlayerInShakeZone = false
	end
end)
