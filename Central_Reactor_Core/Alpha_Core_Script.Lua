local DischargerStatusValue = script.Parent.Parent.Values.DischargerStatusValue
local TemperatureValue = script.Parent.Parent.Values.TemperatureValue
local IntegrityValue = script.Parent.Parent.Values.IntegrityValue
local DischargeControlValue = script.Parent.Parent.Values.DischargeControlValue
local DischargeCoef = script.Parent.Parent.Values.DischargeCoef
local EnergyCapacity = script.Parent.Parent.Parent.Parent.CentralCore.CPU.Values.EnergyCapacityValue

local Lightning = script.Parent.Parent.Parent.Lightning.Lightning
local LightningPrimaryPart = script.Parent.Parent.Parent.Lightning.LightningPrimaryPart
local DeathTrigger = script.Parent.Parent.Parent.DeathTrigger

local ElectricDischargeSound1 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound1
local ElectricDischargeSound2 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound2
local ElectricDischargeSound3 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound3
local ElectricDischargeSound4 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound4
local ElectricDischargeSound5 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound5
local ElectricDischargeSound6 = script.Parent.Parent.Parent.SoundEmitter.ElectricDischargeSound6

local Explosion1Sound = script.Parent.Parent.Parent.SoundEmitter.Explosion1Sound
local Explosion2Sound = script.Parent.Parent.Parent.SoundEmitter.Explosion2Sound
local Explosion3Sound = script.Parent.Parent.Parent.SoundEmitter.Explosion3Sound

local BlastSphere = script.Parent.Parent.Parent.BlastSphere
local Smoke = script.Parent.Parent.Parent.SmokeEmitter.Smoke

local IncreaseButton = workspace.AlphaCoreIncreaseButton.Button
local DecreaseButton = workspace.AlphaCoreDecreaseButton.Button

local ErrorMessage = workspace.CRCHologram.Hologram.AlphaCore.ErrorMessage
local DownDischargerHologram = workspace.CRCHologram.Hologram.AlphaCore.DownDischarger

local FacilityDestructionEffectControlValue = workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectControlValue

local IntercomSystemPackSound = game.SoundService.IntercomSystemPackSound
local FacilityIntercomSystemModeValue = workspace.FacilityIntercomSystem.CPU.Values.FacilityIntercomSystemModeValue

local BlackoutStatusValue = workspace.FacilityLight.CPU.Values.BlackoutStatusValue

local RandomIndex1 = 1
local RandomIndex2 = 1
local RandomIndex3 = 1

IncreaseButton.ClickDetector.MouseClick:Connect(function()
	if DischargeCoef.Value < 16000 then
		DischargeCoef.Value = DischargeCoef.Value + 1000
	end
end)

DecreaseButton.ClickDetector.MouseClick:Connect(function()
	if DischargeCoef.Value > 1000 then
		DischargeCoef.Value = DischargeCoef.Value - 1000
	end
end)

while true do
	if DischargeControlValue.Value == 1 and DischargerStatusValue.Value >= 1 and EnergyCapacity.Value > DischargeCoef.Value then
		DischargeControlValue.Value = 3
		if DischargerStatusValue.Value == 1 then
			EnergyCapacity.Value = EnergyCapacity.Value - DischargeCoef.Value
		end
		DeathTrigger.CanTouch = true
		RandomIndex1 = math.random(1, 6)
		RandomIndex2 = math.random(1, 4)
		if RandomIndex1 == 1 then
			ElectricDischargeSound1:Play()
		end
		if RandomIndex1 == 2 then
			ElectricDischargeSound2:Play()
		end
		if RandomIndex1 == 3 then
			ElectricDischargeSound3:Play()
		end
		if RandomIndex1 == 4 then
			ElectricDischargeSound4:Play()
		end
		if RandomIndex1 == 5 then
			ElectricDischargeSound5:Play()
		end
		if RandomIndex1 == 6 then
			ElectricDischargeSound6:Play()
		end
		if RandomIndex2 == 1 then
			LightningPrimaryPart.Orientation = Vector3.new(0, 0, 0)
		end
		if RandomIndex2 == 2 then
			LightningPrimaryPart.Orientation = Vector3.new(0, -90, 0)
		end
		if RandomIndex2 == 3 then
			LightningPrimaryPart.Orientation = Vector3.new(0, 180, 0)
		end
		if RandomIndex2 == 4 then
			LightningPrimaryPart.Orientation = Vector3.new(0, 90, 0)
		end
		if DischargeCoef.Value == 12000 then
			TemperatureValue.Value = TemperatureValue.Value + 10
			IntegrityValue.Value = IntegrityValue.Value - 1
		end
		if DischargeCoef.Value == 13000 then
			TemperatureValue.Value = TemperatureValue.Value + 21
			IntegrityValue.Value = IntegrityValue.Value - 2
		end
		if DischargeCoef.Value == 14000 then
			TemperatureValue.Value = TemperatureValue.Value + 42
			IntegrityValue.Value = IntegrityValue.Value - 3
		end
		if DischargeCoef.Value == 15000 then
			TemperatureValue.Value = TemperatureValue.Value + 84
			IntegrityValue.Value = IntegrityValue.Value - 4
		end
		if DischargeCoef.Value == 16000 then
			TemperatureValue.Value = TemperatureValue.Value + 126
			IntegrityValue.Value = IntegrityValue.Value - 5
		end
		if IntegrityValue.Value <= 0 then
			FacilityDestructionEffectControlValue.Value = 1
			RandomIndex3 = math.random(1, 3)
			if RandomIndex3 == 1 then
				Explosion1Sound:Play()
			end
			if RandomIndex3 == 2 then
				Explosion2Sound:Play()
			end
			if RandomIndex3 == 3 then
				Explosion3Sound:Play()
			end
			DischargerStatusValue.Value = 0
			BlastSphere.Transparency = 0
			BlastSphere.PointLight.Enabled = true
			Smoke.Enabled = true
			ErrorMessage.Transparency = 0.4
			DownDischargerHologram.BrickColor = BrickColor.new("Really red")
			wait(0.2)
			BlastSphere.Transparency = 1
			BlastSphere.PointLight.Enabled = false
		end
		Lightning.Transparency = 0
		Lightning.PointLight.Enabled = true
		Lightning.CanTouch = true
		wait(0.1)
		Lightning.Transparency = 1
		Lightning.PointLight.Enabled = false
		Lightning.CanTouch = false
		wait(0.1)
		DeathTrigger.CanTouch = false
	end
	wait(0.1)
end
