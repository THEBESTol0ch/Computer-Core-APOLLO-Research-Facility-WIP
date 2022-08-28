local CRCDamagedModuleStatusValue = script.Parent.Parent.Values.CRCDamagedModuleStatusValue
local CRCDamagedModuleControlValue = script.Parent.Parent.Values.CRCDamagedModuleControlValue
local FacilityDestructionEffectControlValue = workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectControlValue
local Metal = script.Parent.Parent.Parent.Metal
local BlastSphere = script.Parent.Parent.Parent.BlastSphere
local Smoke11 = script.Parent.Parent.Parent.SmokeEmitter1.Smoke1
local Smoke12 = script.Parent.Parent.Parent.SmokeEmitter1.Smoke2
local Smoke21 = script.Parent.Parent.Parent.SmokeEmitter2.Smoke1
local Explosion1Sound = script.Parent.Parent.Parent.SoundEmitter.Explosion1Sound
local Explosion2Sound = script.Parent.Parent.Parent.SoundEmitter.Explosion2Sound
local Explosion3Sound = script.Parent.Parent.Parent.SoundEmitter.Explosion3Sound
local ErrorMessage = workspace.CRCHologram.Hologram.CentralCore.ErrorMessage
local CentralCoreHologram = workspace.CRCHologram.Hologram.CentralCore.CentralCore

local CRCDamagedPartsGroup1ControlValue = workspace.CRCDamagedPartsGroup1.CRCDamagedPartsGroup1ControlValue
local CRCDamagedPartsGroup2ControlValue = workspace.CRCDamagedPartsGroup2.CRCDamagedPartsGroup2ControlValue

local RandomIndex1 = 1
local RandomIndex2 = 1

while true do
	if CRCDamagedModuleControlValue.Value == 1 and CRCDamagedModuleStatusValue.Value == 0 then
		CRCDamagedModuleControlValue.Value = 3
		CRCDamagedModuleStatusValue.Value = 1
		FacilityDestructionEffectControlValue.Value = 1
		wait(2)
		RandomIndex1 = math.random(1, 3)
		RandomIndex2 = math.random(1, 2)
		if RandomIndex1 == 1 then
			Explosion1Sound:Play()
		end
		if RandomIndex1 == 2 then
			Explosion2Sound:Play()
		end
		if RandomIndex1 == 3 then
			Explosion3Sound:Play()
		end
		if RandomIndex2 == 1 then
			CRCDamagedPartsGroup1ControlValue.Value = 1
		end
		if RandomIndex2 == 2 then
			CRCDamagedPartsGroup2ControlValue.Value = 1
		end
		Metal.Orientation = Vector3.new(0, 0, 90)
		BlastSphere.Transparency = 0
		BlastSphere.PointLight.Enabled = true
		ErrorMessage.Transparency = 0.4
		CentralCoreHologram.BrickColor = BrickColor.new("Neon orange")
		Smoke11.Enabled = true
		Smoke21.Enabled = true
		wait(0.2)
		BlastSphere.Transparency = 1
		BlastSphere.PointLight.Enabled = false
		wait(2)
		Smoke11.Enabled = false
		Smoke12.Enabled = true
	end
	wait(0.1)
end
