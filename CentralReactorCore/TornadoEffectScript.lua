-- Values
local TornadoEffectValue = script.Parent.Parent.Values.TornadoEffectValue
--

-- Items
local Smokes = script.Parent.Parent.Parent.Smokes
--

-- Sounds
local CRCWindSound = script.Parent.Parent.Parent.SoundEmitter.CRCWindSound
--

TornadoEffectValue.Changed:Connect(function()
	if TornadoEffectValue.Value == true then
		CRCWindSound:Play()
		for _, Object in pairs(Smokes:GetChildren()) do
			Object.Smoke.Enabled = true
		end
	elseif TornadoEffectValue.Value == false then
		CRCWindSound:Stop()
		for _, Object in pairs(Smokes:GetChildren()) do
			Object.Smoke.Enabled = false
		end
	end
end)
