local Team = game.Teams.Visitors

script.Parent.MouseButton1Click:Connect(function()
	game.ReplicatedStorage.ChangeTeam:FireServer(Team)
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
