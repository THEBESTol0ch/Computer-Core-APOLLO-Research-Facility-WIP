local RunService = game:GetService("RunService");
local Player = game.Players.LocalPlayer;
local Character = Player.Character or Player.CharacterAdded:Wait();
local Camera = game.Workspace.CurrentCamera;
local Head = Character:WaitForChild("Head");

local FPMaximumDistance = 0.6; -- For scalability, but keep it at 0.6 since it is the right distance.
local FirstPersonLocalTransparency = 0;
local ThirdPresonLocalTransparency = 0;

local function SetCharacterLocalTransparency(transparency)
	for i, Part in pairs(Character:GetChildren()) do
		if (Part:IsA("BasePart")) and (Part.Name == "LeftUpperArm" or Part.Name == "LeftLowerArm" or Part.Name == "LeftHand" or Part.Name == "RightUpperArm" or Part.Name == "RightLowerArm" or Part.Name == "RightHand") then -- Only baseparts have a LocalTransparencyModifier property.
			Part.LocalTransparencyModifier = transparency;
		end
	end
end

RunService.RenderStepped:Connect(function()
	local isfirstperson = (Head.CFrame.Position - Camera.CFrame.Position).Magnitude < FPMaximumDistance; -- Determine wether we are in first person
	if (isfirstperson) then
		SetCharacterLocalTransparency(FirstPersonLocalTransparency);
	else
		SetCharacterLocalTransparency(ThirdPresonLocalTransparency);
	end
end)
