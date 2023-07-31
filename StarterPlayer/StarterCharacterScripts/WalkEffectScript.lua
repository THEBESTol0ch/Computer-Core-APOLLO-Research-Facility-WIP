local Player = game:GetService("Players").LocalPlayer
local Char = game.Workspace:WaitForChild(Player.Name)
local Hum = Char:WaitForChild("Humanoid")
local RS = game:GetService("RunService")
RS.RenderStepped:Connect(function()
	local CT = tick()
	if Hum.MoveDirection.Magnitude > 0 then
		local BobbleX = math.cos(CT*10)*0.25
		local BobbleY = math.abs(math.sin(CT*10))*0.25
		local Bobble = Vector3.new(BobbleX,BobbleY,0)
			Hum.CameraOffset = Hum.CameraOffset:lerp(Bobble, 0.25)
	else
		Hum.CameraOffset = Hum.CameraOffset * 0.75
	end
end)
