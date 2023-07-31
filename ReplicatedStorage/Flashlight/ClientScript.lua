-- Control
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Tool = script.Parent.Parent.Parent
local CPU = Tool:WaitForChild("CPU")
--

-- Values
local Values = script.Parent.Parent:WaitForChild("Values")
local ToolEquippedValue = Values.ToolEquippedValue
--

-- Items
local Mouse = Player:GetMouse()
local Head = Character:WaitForChild("Head")
local Neck = Head:WaitForChild("Neck")
local RightUpperArm = Character:WaitForChild("RightUpperArm")
local RightShoulder = RightUpperArm:WaitForChild("RightShoulder")
--

-- Remote Events
local RemoteEvents = CPU:WaitForChild("RemoteEvents")
local EquipEvent = RemoteEvents.EquipEvent
local UnequipEvent = RemoteEvents.UnequipEvent
local FireEvent = RemoteEvents.FireEvent
--

-- Logic
local NeckC0 = Neck.C0
local RightShoulderC0 = RightShoulder.C0
--

-- Functions
function ResetPlayer()
	Neck.C0 = NeckC0 * CFrame.Angles(0, 0, 0)
	RightShoulder.C0 = RightShoulderC0 * CFrame.Angles(0, 0, 0)
end
--

Tool.Equipped:Connect(function()
	ToolEquippedValue.Value = true
	EquipEvent:FireServer()
end)

Tool.Unequipped:Connect(function()
	ToolEquippedValue.Value = false
	ResetPlayer()
	UnequipEvent:FireServer()
end)

UserInputService.InputBegan:Connect(function(Input)
	local InputType = Input.UserInputType
	if InputType == Enum.UserInputType.MouseButton1 then
		if ToolEquippedValue.Value == true then
			FireEvent:FireServer()
		end
	end
end)

RunService.RenderStepped:connect(function()
	if ToolEquippedValue.Value == true then
		Neck.C0 = NeckC0 * CFrame.Angles(math.asin(Mouse.Origin.lookVector.Y), 0, 0)
		RightShoulder.C0 = RightShoulderC0 * CFrame.Angles(math.asin(Mouse.Origin.lookVector.Y), 0, 0)
	end
end)
