-- Values
local FacilityDestructionEffectValue = script.Parent.Parent.Values.FacilityDestructionEffectValue

local DestroyPumpValue = workspace.PumpStationAlphaDamageSystem.CPU.Values.DestroyPumpValue
local DamageReactorValue = workspace.CentralReactorCore.CPU.Values.DamageReactorValue
local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.CoreStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.CoreStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.CoreStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.CoreStatusValue

local CRCIntegrityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.IntegrityValue
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

DamageReactorValue.Changed:Connect(function()
	if DamageReactorValue.Value == true then
		FacilityDestructionEffectValue.Value = "SHAKE"
	end
end)

AlphaCoreStatusValue.Changed:Connect(function()
	if AlphaCoreStatusValue.Value == "ERROR" then
		FacilityDestructionEffectValue.Value = "SHAKE"
	end
end)
BetaCoreStatusValue.Changed:Connect(function()
	if BetaCoreStatusValue.Value == "ERROR" then
		FacilityDestructionEffectValue.Value = "SHAKE"
	end
end)
GammaCoreStatusValue.Changed:Connect(function()
	if GammaCoreStatusValue.Value == "ERROR" then
		FacilityDestructionEffectValue.Value = "SHAKE"
	end
end)
DeltaCoreStatusValue.Changed:Connect(function()
	if DeltaCoreStatusValue.Value == "ERROR" then
		FacilityDestructionEffectValue.Value = "SHAKE"
	end
end)

CRCIntegrityValue.Changed:Connect(function()
	if CRCIntegrityValue.Value == 0 then
		repeat
			wait(48)
			FacilityDestructionEffectValue.Value = "SHAKE"
		until CRCIntegrityValue.Value > 0
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
