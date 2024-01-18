-- Control
local TweenService = game:GetService("TweenService")
local KeyCardPanel = script.Parent.Parent.Parent
local Trigger = KeyCardPanel.Trigger
--

-- Values
local Values = script.Parent.Parent.Values
local AccessGrantedValue = Values.AccessGrantedValue
--

-- Items
local KeyCardTemplate = KeyCardPanel.KeyCardTemplate
local KeyCardInPos = KeyCardPanel.KeyCardInPos
local KeyCardOutPos = KeyCardPanel.KeyCardOutPos

local Lamps = KeyCardPanel.Frame.Lamps
--

-- Sounds
local SoundEmitter = KeyCardPanel.SoundEmitter
local KeyCardSound = SoundEmitter.KeyCardSound
local ConfirmingSound = SoundEmitter.ConfirmingSound
local RejectionSound = SoundEmitter.RejectionSound
--

-- Logic
local AllowedKeyCard = {["A"] = false, ["E"] = false, ["SO"] = false}

local KeyCardAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
--

local KeyCardInAnim = TweenService:Create(KeyCardTemplate, KeyCardAnimationSettings, { CFrame = KeyCardInPos.CFrame })
local KeyCardOutAnim = TweenService:Create(KeyCardTemplate, KeyCardAnimationSettings, { CFrame = KeyCardOutPos.CFrame })

-- Functions
function DoKeyCard(KeyCardType)
	Trigger.CanTouch = false
	KeyCardTemplate.Transparency = 0
	KeyCardTemplate[KeyCardType.."_FrontDecal"].Transparency = 0
	KeyCardTemplate[KeyCardType.."_BackDecal"].Transparency = 0
	KeyCardInAnim:Play()
	KeyCardSound:Play()
	wait(0.5)
	if AllowedKeyCard[KeyCardType] then
		ConfirmingSound:Play()
		Lamps.BrickColor = BrickColor.new("Lime green")
		AccessGrantedValue.Value = true
	else
		Lamps.BrickColor = BrickColor.new("Really red")
		RejectionSound:Play()
	end
	wait(0.5)
	KeyCardOutAnim:Play()
	wait(0.8)
	KeyCardTemplate.Transparency = 1
	KeyCardTemplate[KeyCardType.."_FrontDecal"].Transparency = 1
	KeyCardTemplate[KeyCardType.."_BackDecal"].Transparency = 1
	Lamps.BrickColor = BrickColor.new("Deep blue")
	AccessGrantedValue.Value = false
	Trigger.CanTouch = true
end
--

Trigger.Touched:Connect(function(Hit)
	local KeyCard = Hit.Parent.Name:split("_")
	if KeyCard[2] == "KeyCard" then
		DoKeyCard(KeyCard[1])
	end
end)
