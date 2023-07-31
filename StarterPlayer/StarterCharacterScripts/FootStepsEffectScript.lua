local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Footsteps = require(script:WaitForChild("Footsteps"))
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local LastFootstepSound = nil
local Side = "Right"
local BaseTime = 0.3

local OldRunSound = HumanoidRootPart:WaitForChild("Running")
OldRunSound:Destroy()

function PlayFootstepSound(foot, material)
	if not foot then return end

	local sounds = Footsteps.sounds[material]
	if not sounds then return end

	local random = Random.new()
	local soundId = sounds[random:NextInteger(1, #sounds)]

	if soundId and soundId ~= LastFootstepSound then
		LastFootstepSound = soundId
		local sfx = Instance.new("Sound")
		sfx.SoundId = soundId
		sfx.RollOffMaxDistance = 100
		sfx.RollOffMinDistance = 10
		sfx.Volume = Footsteps.volume[material] or 0.1
		sfx.Parent = foot
		sfx:Play()
		task.spawn(function()
			sfx.Ended:Wait()
			sfx:Destroy()
		end)
	else
		PlayFootstepSound(foot, material)
	end
end

while true do
	local Speed = Character.PrimaryPart.Velocity.Magnitude

	-- Calculate the time interval based on character speed
	local TimeInterval = BaseTime / (Speed / 16)

	-- Ensure the time interval is within bounds (not too short or too long)
	TimeInterval = math.clamp(TimeInterval, 0.1, 0.6) -- You can adjust the bounds as needed

	wait(TimeInterval)

	if Speed > 2 then
		if Side == "Left" then
			Side = "Right"
		elseif Side == "Right" then
			Side = "Left"
		end

		local Foot = Character:FindFirstChild(Side.."Foot")
		local FloorMaterial = Humanoid.FloorMaterial
		local Material = Footsteps.materialMap[FloorMaterial]
		PlayFootstepSound(Foot, Material)
	end
end
