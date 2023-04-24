-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local DestroyPumpValue = script.Parent.Parent.Values.DestroyPumpValue
local PumpStatusValue = workspace[script.Parent.Parent.Parent.Name:split("_")[1]].CPU.Values.PumpStatusValue
--

-- Items
local Floor = workspace.PumpStationAlphaFloor.Floor
local FloorPos = workspace.PumpStationAlphaFloor.Pos
local DamagedParts = script.Parent.Parent.Parent.DamagedParts
local InvisibleParts = script.Parent.Parent.Parent.InvisibleParts
local ParticleEffects = script.Parent.Parent.Parent.ParticleEffects
local Pipe = script.Parent.Parent.Parent.Pipe
local WaterEmitters = script.Parent.Parent.Parent.WaterEmitters
local BlastSphere = script.Parent.Parent.Parent.BlastSphere
local Wall = script.Parent.Parent.Parent.Wall
--

-- Sounds
local WaterFallSound = script.Parent.Parent.Parent.SoundEmitter.WaterFallSound
--

local FloorDown = {
	CFrame = FloorPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FloorAnimationSettings = TweenInfo.new(
	120,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local FloorDown = TweenService:Create(Floor, FloorAnimationSettings, FloorDown)

-- Fucntions
function DoCheck()
	if PumpStatusValue.Value == "ONLINE" and DestroyPumpValue.Value == true then
		for _, Object in pairs(WaterEmitters:GetChildren()) do
			wait(0.1)
			Object.WaterFlow.Enabled = true
		end
		WaterFallSound:Play()
		FloorDown:Play()
	elseif PumpStatusValue.Value == "SHUT DOWN" and DestroyPumpValue.Value == true then
		for _, Object in pairs(WaterEmitters:GetChildren()) do
			Object.WaterFlow.Enabled = false
		end
		wait(2)
		WaterFallSound:Stop()
		FloorDown:Pause()
	end
end
--

DestroyPumpValue.Changed:Connect(function()
	for _, Part in pairs(InvisibleParts:GetDescendants()) do
		if Part:IsA("UnionOperation") then Part.Transparency = 0 end
	end
	for _, Effect in pairs(ParticleEffects:GetDescendants()) do
		if Effect:IsA("ParticleEmitter") or Effect:IsA("PointLight") then Effect.Enabled = true end
	end
	Wall.Transparency = 1
	Pipe.Pipe.Transparency = 1
	Pipe.Frame.Transparency = 1
	BlastSphere.Transparency = 0
	BlastSphere["Explosion"..math.random(1, 3).."Sound"]:Play()
	wait(0.2)
	BlastSphere.Transparency = 1
	DoCheck()
	for _, Object in pairs(DamagedParts:GetChildren()) do
		wait(0.3)
		Object.Transparency = 0
		Object.Anchored = false
	end
end)

PumpStatusValue.Changed:Connect(function()
	DoCheck()
end)
