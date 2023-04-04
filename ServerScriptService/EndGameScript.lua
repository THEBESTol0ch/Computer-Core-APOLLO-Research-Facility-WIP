-- Control
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
--

-- Values
local EndGameControlValue = game.ReplicatedStorage.GameValues.EndGameControlValue

local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Sounds
local FacilityExplosionSound = game.SoundService.FacilityExplosionSound
--

-- Logic
local PlaceID = 7237780847
--

local SoundAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

-- Functions
function EndGame()
	EndGameControlValue.Value = "END"
	FacilityExplosionSound:Play()
	for _, Item in pairs(game:GetDescendants()) do
		if Item:IsA("Sound") and not (Item.Name == "FacilityExplosionSound") then
			TweenService:Create(Item, SoundAnimationSettings, { Volume = 0 }):Play()
		end
	end
	wait(50)
	TeleportService:TeleportAsync(7237780847, Players:GetPlayers(), { TeleportService:ReserveServer(PlaceID) })
end
--

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "EXPLODE" then
		EndGame()
	end
end)
