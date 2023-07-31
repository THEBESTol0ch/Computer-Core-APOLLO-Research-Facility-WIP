local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local PlayerIn1stPersonValue = Character:WaitForChild("PlayerIn1stPersonValue")

Character:WaitForChild("Head"):GetPropertyChangedSignal('LocalTransparencyModifier'):Connect(function()
	if Character.Head.LocalTransparencyModifier == 1 and PlayerIn1stPersonValue.Value == false then
		PlayerIn1stPersonValue.Value = true
	elseif Character.Head.LocalTransparencyModifier == 0 and PlayerIn1stPersonValue.Value == true then
		PlayerIn1stPersonValue.Value = false
	end
end)
