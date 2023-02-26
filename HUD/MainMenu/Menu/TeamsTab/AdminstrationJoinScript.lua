local Team = game.Teams.Administration
local Player = game:GetService("Players").LocalPlayer
local Group = game:GetService("GroupService")
local Groupid = 11755642

local PlayerRank = Player:GetRankInGroup(Groupid)
local AdministrationRank = 250
local SecurityRank = 200

local RedNot1 = script.Parent.Parent.Parent.Parent.Parent.Parent.Notifications.RedNot1
local RedNot2 = script.Parent.Parent.Parent.Parent.Parent.Parent.Notifications.RedNot2
local NotificationSound = script.Parent.Parent.Parent.Parent.Parent.Parent.NotificationSound

script.Parent.MouseButton1Click:Connect(function()
	if PlayerRank >= AdministrationRank then
		game.ReplicatedStorage.ChangeTeam:FireServer(Team)
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	else
		NotificationSound:Play()
		RedNot2.Visible = 0
		RedNot2:TweenPosition(UDim2.new(0.908, 0, 0.93, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
		wait(2)
		RedNot2:TweenPosition(UDim2.new(1.09, 0, 0.93, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
		wait(1)
		RedNot2.Visible = 1
	end
end)
