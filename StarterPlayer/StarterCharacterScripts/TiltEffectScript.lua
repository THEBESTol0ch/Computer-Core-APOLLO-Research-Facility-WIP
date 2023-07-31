local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local rad = math.rad
local Rot = CFrame.new()

local function GetRollAngle()
	local Character = Player.Character

	if not Character then
		return
	end

	local Cf = Camera.CFrame

	return -Cf.RightVector:Dot(Character.Humanoid.MoveDirection)
end

RunService:BindToRenderStep("RotateCameraInDirectionPlayerIsGoing", Enum.RenderPriority.Camera.Value + 1, function()
	local Roll = GetRollAngle() * 4
	Rot = Rot:Lerp(CFrame.Angles(0, 0, rad(Roll)),0.075)

	Camera.CFrame *= Rot
end)
