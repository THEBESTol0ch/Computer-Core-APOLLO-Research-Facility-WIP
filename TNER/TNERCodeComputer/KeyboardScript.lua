-- RSU 09R74S
-- RSD 82S65D

-- Control
local TweenService = game:GetService("TweenService")
local KeyboardTrigger = script.Parent.Parent.Parent.KeyboardTrigger
--

-- Values
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Items
local KeysAnimationSettings = TweenInfo.new(
	0.05,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local CodeSequences = {
	["OFFLINE"] = {
		{ WaitTime = 0.585, Key = script.Parent.Parent.Parent.Keys.Key0.Key0, Pos = script.Parent.Parent.Parent.Keys.Key0.KeyPos0 },
		{ WaitTime = 0.230, Key = script.Parent.Parent.Parent.Keys.Key9.Key9, Pos = script.Parent.Parent.Parent.Keys.Key9.KeyPos9 },
		{ WaitTime = 0.277, Key = script.Parent.Parent.Parent.Keys.KeyR.KeyR, Pos = script.Parent.Parent.Parent.Keys.KeyR.KeyPosR },
		{ WaitTime = 0.8, Key = script.Parent.Parent.Parent.Keys.Key7.Key7, Pos = script.Parent.Parent.Parent.Keys.Key7.KeyPos7 },
		{ WaitTime = 0.2, Key = script.Parent.Parent.Parent.Keys.Key4.Key4, Pos = script.Parent.Parent.Parent.Keys.Key4.KeyPos4 },
		{ WaitTime = 0.2, Key = script.Parent.Parent.Parent.Keys.KeyS.KeyS, Pos = script.Parent.Parent.Parent.Keys.KeyS.KeyPosS },
		{ WaitTime = 0.3, Key = script.Parent.Parent.Parent.Keys.KeyEnter.KeyEnter, Pos = script.Parent.Parent.Parent.Keys.KeyEnter.KeyPosEnter },
	},
	["ONLINE"] = {
		{ WaitTime = 0.585, Key = script.Parent.Parent.Parent.Keys.Key8.Key8, Pos = script.Parent.Parent.Parent.Keys.Key8.KeyPos8 },
		{ WaitTime = 0.230, Key = script.Parent.Parent.Parent.Keys.Key2.Key2, Pos = script.Parent.Parent.Parent.Keys.Key2.KeyPos2 },
		{ WaitTime = 0.277, Key = script.Parent.Parent.Parent.Keys.KeyS.KeyS, Pos = script.Parent.Parent.Parent.Keys.KeyS.KeyPosS },
		{ WaitTime = 0.8, Key = script.Parent.Parent.Parent.Keys.Key6.Key6, Pos = script.Parent.Parent.Parent.Keys.Key6.KeyPos6 },
		{ WaitTime = 0.2, Key = script.Parent.Parent.Parent.Keys.Key5.Key5, Pos = script.Parent.Parent.Parent.Keys.Key5.KeyPos5 },
		{ WaitTime = 0.2, Key = script.Parent.Parent.Parent.Keys.KeyD.KeyD, Pos = script.Parent.Parent.Parent.Keys.KeyD.KeyPosD },
		{ WaitTime = 0.3, Key = script.Parent.Parent.Parent.Keys.KeyEnter.KeyEnter, Pos = script.Parent.Parent.Parent.Keys.KeyEnter.KeyPosEnter },
	}
}
--

-- Sounds
local KeyboardSound = script.Parent.Parent.Parent.SoundEmitter.KeyboardSound
--

-- Functions
function ActivateCode(Sequence)
	KeyboardSound:Play()
	KeyboardTrigger.ClickDetector.MaxActivationDistance = 0
	for _, Step in pairs(CodeSequences[Sequence]) do
		wait(Step.WaitTime)
		TweenService:Create(Step.Key, KeysAnimationSettings, { CFrame = Step.Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0)) }):Play()
		wait(0.05)
		TweenService:Create(Step.Key, KeysAnimationSettings, { CFrame = Step.Key.CFrame:ToWorldSpace(CFrame.new(0, 0.035, 0)) }):Play()
	end
end
--

KeyboardTrigger.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "OFFLINE"  or TNERStatusValue.Value == "MAINTENANCE MODE" then
		ActivateCode("OFFLINE")
	elseif TNERStatusValue.Value == "ONLINE" then
		ActivateCode("ONLINE")
	end
end)

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		wait(3) -- Loading Screen Animation
		KeyboardTrigger.ClickDetector.MaxActivationDistance = 10
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "MAINTENANCE MODE" then
		KeyboardTrigger.ClickDetector.MaxActivationDistance = 10
	else
		KeyboardTrigger.ClickDetector.MaxActivationDistance = 0
	end
end)
