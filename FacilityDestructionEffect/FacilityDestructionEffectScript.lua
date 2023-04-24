-- Values
local FacilityDestructionEffectValue = script.Parent.Parent.Values.FacilityDestructionEffectValue
local DestroyPumpValue = workspace.PumpStationAlphaDamageSystem.CPU.Values.DestroyPumpValue
--

-- Items
local DustEmitters = script.Parent.Parent.Parent.DustEmitters
local SmokeEmitters = script.Parent.Parent.Parent.SmokeEmitters
local Cars = script.Parent.Parent.Parent.Cars
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
function TiggerCar()
	local Car = "Car"..math.random(1, 8)
	local CarAlarmSound = "CarAlarm"..math.random(1, 2).."Sound"
	Cars[Car].EarthquakeEventSet.Lights[CarAlarmSound]:Play()
	repeat
		Cars[Car].EarthquakeEventSet.Lights.Transparency = 0
		Cars[Car].EarthquakeEventSet.FrontArtificalLight.SpotLight.Enabled = true
		Cars[Car].EarthquakeEventSet.BackArtificalLight.SpotLight.Enabled = true
		wait(1)
		Cars[Car].EarthquakeEventSet.Lights.Transparency = 1
		Cars[Car].EarthquakeEventSet.FrontArtificalLight.SpotLight.Enabled = false
		Cars[Car].EarthquakeEventSet.BackArtificalLight.SpotLight.Enabled = false
		wait(1)
	until Cars[Car].EarthquakeEventSet.Lights[CarAlarmSound].IsPlaying == false
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

FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKING" then
		wait(2)
		TiggerCar()
	end
end)

FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKING" then
		wait(5.5)
		TiggerCar()
	end
end)

FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKING" then
		wait(3.2)
		TiggerCar()
	end
end)

DestroyPumpValue.Changed:Connect(function()
	if DestroyPumpValue.Value == true then
		FacilityDestructionEffectValue.Value = "SHAKE"
	end
end)

--workspace.PumpTestButton.ClickDetector.MouseClick:Connect(function()
--	FacilityDestructionEffectValue.Value = "SHAKE"
--end)

--workspace.AlphaCoreTestButton.ClickDetector.MouseClick:Connect(function()
--	FacilityDestructionEffectValue.Value = "SHAKE"
--end)

--workspace.CRCExplosionTestButton.ClickDetector.MouseClick:Connect(function()
--	FacilityDestructionEffectValue.Value = "SHAKE"
--end)
