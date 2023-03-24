-- Control
local TweenService = game:GetService("TweenService")
local Trigger = script.Parent.Parent.Parent.Trigger
--

-- Values
local AccessGrantedValue = script.Parent.Parent.Parent.Parent.Door.CPU.Values.AccessGrantedValue
--

-- Items
local KeyCardTemplate = script.Parent.Parent.Parent.KeyCardTemplate
local KeyCardPos = script.Parent.Parent.Parent.KeyCardPos
--

-- Sounds
local KeyCardSound = script.Parent.Parent.Parent.SoundEmitter.KeyCardSound
local ConfirmingSound = script.Parent.Parent.Parent.SoundEmitter.ConfirmingSound
local RejectionSound = script.Parent.Parent.Parent.SoundEmitter.RejectionSound
--

-- Logic
local AllowedKeyCard = {["A"] = true, ["E"] = false, ["SO"] = false}
--

local KeyCardAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local KeyCardIn = {
	CFrame = KeyCardPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local KeyCardOut = {
	CFrame = KeyCardTemplate.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyCardIn = TweenService:Create(KeyCardTemplate, KeyCardAnimationSettings, KeyCardIn)
local KeyCardOut = TweenService:Create(KeyCardTemplate, KeyCardAnimationSettings, KeyCardOut)

-- Functions
function DoKeyCard(KeyCardType)
	Trigger.CanTouch = false
	KeyCardTemplate.Transparency = 0
	KeyCardTemplate[KeyCardType.."_FrontDecal"].Transparency = 0
	KeyCardTemplate[KeyCardType.."_BackDecal"].Transparency = 0
	KeyCardIn:Play()
	KeyCardSound:Play()
	wait(0.5)
	if AllowedKeyCard[KeyCardType] then
		ConfirmingSound:Play()
		AccessGrantedValue.Value = true
	else
		RejectionSound:Play()
	end
	wait(0.5)
	KeyCardOut:Play()
	wait(0.8)
	KeyCardTemplate.Transparency = 1
	KeyCardTemplate[KeyCardType.."_FrontDecal"].Transparency = 1
	KeyCardTemplate[KeyCardType.."_BackDecal"].Transparency = 1
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
