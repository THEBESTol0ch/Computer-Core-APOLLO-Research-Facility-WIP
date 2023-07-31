local RunService = game:GetService("RunService")

local Player = game.Players.LocalPlayer
local PlayerMouse = Player:GetMouse()

local Camera = workspace.CurrentCamera

local Character = Player.Character or Player.CharacterAdded:Wait()
local Head = Character:WaitForChild("Head")
local Neck = Head:WaitForChild("Neck")

local Torso = Character:WaitForChild("UpperTorso")
local Waist = Torso:WaitForChild("Waist")

local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local NeckOriginC0 = Neck.C0
local WaistOriginC0 = Waist.C0

local CanEvent = true
local PlayerIn1stPersonValue = Character:WaitForChild("PlayerIn1stPersonValue")

Neck.MaxVelocity = 1/3

RunService.RenderStepped:Connect(function() 
	local CameraCFrame = Camera.CoordinateFrame

	if Character:FindFirstChild("UpperTorso") and Character:FindFirstChild("Head") and CanEvent == true then
		local TorsoLookVector = Torso.CFrame.lookVector
		local HeadPosition = Head.CFrame.p

		if Neck and Waist then
			if Camera.CameraSubject:IsDescendantOf(Character) or Camera.CameraSubject:IsDescendantOf(Player) then
				local Point = PlayerMouse.Hit.p

				local Distance = (Head.CFrame.p - Point).magnitude
				local Difference = Head.CFrame.Y - Point.Y

				Neck.C0 = Neck.C0:lerp(NeckOriginC0 * CFrame.Angles(-(math.atan(Difference / Distance) * 0.5), (((HeadPosition - Point).Unit):Cross(TorsoLookVector)).Y * 1, 0), 0.5 / 2)
				Waist.C0 = Waist.C0:lerp(WaistOriginC0 * CFrame.Angles(-(math.atan(Difference / Distance) * 0.5), (((HeadPosition - Point).Unit):Cross(TorsoLookVector)).Y * 0.5, 0), 0.5 / 2)
			end
		end
	end
	if PlayerIn1stPersonValue.Value == true then
		CanEvent = false
		Neck.C0 = NeckOriginC0
		Waist.C0 = WaistOriginC0
	elseif PlayerIn1stPersonValue.Value == false then
		CanEvent = true
	end
end)
