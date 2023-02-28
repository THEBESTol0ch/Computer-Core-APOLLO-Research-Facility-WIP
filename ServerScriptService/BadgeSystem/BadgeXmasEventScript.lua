local BadgeService = game:GetService("BadgeService")
local BadgeID = 2130007708

game.Players.PlayerAdded:Connect(function(player)
	local hasBadge = BadgeService:UserHasBadgeAsync(player.UserId, BadgeID)
	if not hasBadge then
		BadgeService:AwardBadge(player.UserId, BadgeID)
	end
end)
