-- Values
local FacilityDestructionEffectValue = script.Parent.Parent.Values.FacilityDestructionEffectValue
--

-- Items
local DustEmitters = script.Parent.Parent.Parent.DustEmitters:GetChildren()
local SmokeEmitters = script.Parent.Parent.Parent.SmokeEmitters:GetChildren()
--

-- Functions
function DoEffect()
	FacilityDestructionEffectValue.Value = "SHAKING"
	wait(2)
	for _, Object in pairs(DustEmitters) do
		Object.ParticleEmitter.Enabled = true
	end
	for _, Object in pairs(SmokeEmitters) do
		Object.Smoke.Enabled = true
	end
	wait(10)
	for _, Object in pairs(DustEmitters) do
		Object.ParticleEmitter.Enabled = false
	end
	for _, Object in pairs(SmokeEmitters) do
		Object.Smoke.Enabled = false
	end
	FacilityDestructionEffectValue.Value = "SHAKED"
end
--

FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKE" then
		DoEffect()
	end
end)
