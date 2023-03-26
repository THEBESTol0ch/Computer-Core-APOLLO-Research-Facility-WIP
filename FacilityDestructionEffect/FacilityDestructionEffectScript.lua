-- Values
local FacilityDestructionEffectValue = script.Parent.Parent.Values.FacilityDestructionEffectValue
--

-- Items
local DustEmitters = script.Parent.Parent.Parent.DustEmitters
local SmokeEmitters = script.Parent.Parent.Parent.SmokeEmitters
--

-- Sounds
local FacilityDestructionSounds = game.SoundService.FacilityDestructionSounds
--

-- Functions
function DoEffect(Mode)
	if Mode == "ON" then
		for _, Object in pairs(DustEmitters:GetChildren()) do
			Object.ParticleEmitter.Enabled = true
		end
		for _, Object in pairs(SmokeEmitters:GetChildren()) do
			Object.Smoke.Enabled = true
		end
	elseif Mode == "OFF" then
		for _, Object in pairs(DustEmitters:GetChildren()) do
			Object.ParticleEmitter.Enabled = false
		end
		for _, Object in pairs(SmokeEmitters:GetChildren()) do
			Object.Smoke.Enabled = false
		end
	end
	
end
--

FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKE" then
		FacilityDestructionEffectValue.Value = "SHAKING"
		FacilityDestructionSounds["FacilityDestructionSound"..math.random(1, 7)]:Play()
		wait(2)
		DoEffect("ON")
		wait(10)
		DoEffect("OFF")
		FacilityDestructionEffectValue.Value = "SHAKED"
	end
end)
