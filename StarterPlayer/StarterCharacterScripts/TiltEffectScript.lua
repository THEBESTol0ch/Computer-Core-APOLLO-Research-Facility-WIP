local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Camera = workspace.CurrentCamera

local rad = math.rad
local Rot = CFrame.new()

local function GetRollAngle()
	if not Character then
		return
	end

	local Cf = Camera.CFrame

	return -Cf.RightVector:Dot(Character.Humanoid.MoveDirection)
end

RunService:BindToRenderStep("RotateCameraInDirectionPlayerIsGoing", Enum.RenderPriority.Camera.Value + 1, function()
	local Roll = GetRollAngle() * 4
	Rot = Rot:Lerp(CFrame.Angles(0, 0, rad(Roll)),0.075)

	if Humanoid.Sit == false then Camera.CFrame *= Rot end
end)
