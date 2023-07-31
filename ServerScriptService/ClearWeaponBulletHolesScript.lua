local WeaponBulletHoles = workspace.WeaponBulletHoles

WeaponBulletHoles.ChildAdded:Connect(function(Child)
	wait(0.1)
	local WallParticleEmitter1 = Child:FindFirstChild("WallParticleEmitter1")
	local WaterParticleEmitter1 = Child:FindFirstChild("WaterParticleEmitter1")
	local WaterParticleEmitter2 = Child:FindFirstChild("WaterParticleEmitter2")
	local BloodEmitter1 = Child:FindFirstChild("BloodEmitter1")
	if WallParticleEmitter1 then
		WallParticleEmitter1.Enabled = true
	end
	if WaterParticleEmitter1 and WaterParticleEmitter2 then
		WaterParticleEmitter1.Enabled = true
		WaterParticleEmitter2.Enabled = true
	end
	if BloodEmitter1 then
		BloodEmitter1.Enabled = true
	end
	wait(0.1)
	if WallParticleEmitter1 then
		WallParticleEmitter1.Enabled = false
	end
	if WaterParticleEmitter1 and WaterParticleEmitter2 then
		WaterParticleEmitter1.Enabled = false
		WaterParticleEmitter2.Enabled = false
	end
	if BloodEmitter1 then
		BloodEmitter1.Enabled = false
	end
	wait(4.9)
	Child:Destroy()
end)
