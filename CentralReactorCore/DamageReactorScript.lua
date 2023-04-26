-- Values
local DamageReactorValue = script.Parent.Parent.Values.DamageReactorValue
--

-- Items
local DamagedModules = script.Parent.Parent.Parent.DamagedModules
local CRCDamagedParts = workspace.CRCDamagedParts
local ErrorMessage = workspace.CRCHologram.Hologram.CentralCore.ErrorMessage
local CentralCoreHologram = workspace.CRCHologram.Hologram.CentralCore.CentralCore
--

DamageReactorValue.Changed:Connect(function()
	if DamageReactorValue.Value == true then
		
		local DamagedModule = DamagedModules["DamageModule"..math.random(1, 8)]
		wait(2)
		CRCDamagedParts["CRCDamagedPartsGroup"..math.random(1, 2)].CPU.Values.DeployPartsValue.Value = true
		DamagedModule.SoundEmitter["Explosion"..math.random(1, 3).."Sound"]:Play()
		DamagedModule.Metal.Orientation = DamagedModule.MetalPos.Orientation
		DamagedModule.BlastSphere.Transparency = 0
		DamagedModule.BlastSphere.PointLight.Enabled = true
		DamagedModule.SmokeEmitter1.Smoke1.Enabled = true
		DamagedModule.SmokeEmitter2.Smoke1.Enabled = true
		wait(0.2)
		DamagedModule.BlastSphere.Transparency = 1
		DamagedModule.BlastSphere.PointLight.Enabled = false
		wait(2)
		DamagedModule.SmokeEmitter1.Smoke1.Enabled = false
		DamagedModule.SmokeEmitter1.Smoke2.Enabled = true
		wait(2)
		ErrorMessage.Transparency = 0.4
		CentralCoreHologram.BrickColor = BrickColor.new("Neon orange")
		
		DamageReactorValue.Value = false
	end
end)
