-- Main
local Tool = script.Parent.Parent.Parent
--

-- SFX
local SPAS12Shell = game.ReplicatedStorage:WaitForChild("SPAS12Shell")

local SparksEffect = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.SparksEffect
local ParticleEmitter1 = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.ParticleEmitter1
local ParticleEmitter2 = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.ParticleEmitter2
local ParticleEmitter3 = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.ParticleEmitter3
local ParticleEmitter4 = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.ParticleEmitter4
local ParticleEmitter5 = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.ParticleEmitter5
local PointLight = script.Parent.Parent.Parent.Handle.SFX.ShotEffect.PointLight
local Smoke = script.Parent.Parent.Parent.Handle.SFX.SmokeEmitter.Smoke

local SPAS12_BulletShell1_Sound = script.Parent.Parent.Parent.Handle.SFX.BulletShellSoundEmitter.SPAS12_BulletShell1_Sound
local SPAS12_BulletShell2_Sound = script.Parent.Parent.Parent.Handle.SFX.BulletShellSoundEmitter.SPAS12_BulletShell2_Sound
local SPAS12_BulletShell3_Sound = script.Parent.Parent.Parent.Handle.SFX.BulletShellSoundEmitter.SPAS12_BulletShell3_Sound
local SPAS12_BulletShell4_Sound = script.Parent.Parent.Parent.Handle.SFX.BulletShellSoundEmitter.SPAS12_BulletShell4_Sound
local SPAS12_BulletShell5_Sound = script.Parent.Parent.Parent.Handle.SFX.BulletShellSoundEmitter.SPAS12_BulletShell5_Sound
local SPAS12_BulletShell6_Sound = script.Parent.Parent.Parent.Handle.SFX.BulletShellSoundEmitter.SPAS12_BulletShell6_Sound

local SPAS12_Pump_Sound = script.Parent.Parent.Parent.Handle.SFX.PumpSoundEmitter.SPAS12_Pump_Sound

local SPAS12_Reload1_Sound = script.Parent.Parent.Parent.Handle.SFX.ReloadSoundEmitter.SPAS12_Reload1_Sound
local SPAS12_Noise1_Sound = script.Parent.Parent.Parent.Handle.SFX.ReloadSoundEmitter.SPAS12_Noise1_Sound
local SPAS12_Noise2_Sound = script.Parent.Parent.Parent.Handle.SFX.ReloadSoundEmitter.SPAS12_Noise2_Sound

local SPAS12_Shot1_Sound = script.Parent.Parent.Parent.Handle.SFX.ShotSoundEmitter.SPAS12_Shot1_Sound
local SPAS12_Shot2_Sound = script.Parent.Parent.Parent.Handle.SFX.ShotSoundEmitter.SPAS12_Shot2_Sound
local SPAS12_Shot3_Sound = script.Parent.Parent.Parent.Handle.SFX.ShotSoundEmitter.SPAS12_Shot3_Sound
local SPAS12_Shot4_Sound = script.Parent.Parent.Parent.Handle.SFX.ShotSoundEmitter.SPAS12_Shot4_Sound
local SPAS12_Shot5_Sound = script.Parent.Parent.Parent.Handle.SFX.ShotSoundEmitter.SPAS12_Shot5_Sound
local SPAS12_Shot6_Sound = script.Parent.Parent.Parent.Handle.SFX.ShotSoundEmitter.SPAS12_Shot6_Sound

local ClickSound = script.Parent.Parent.Parent.Handle.SFX.ReloadSoundEmitter.ClickSound

local SPAS12_Equip_Anim = Tool.CPU.Animations.SPAS12_Equip_Anim
local SPAS12_Idle_Anim = Tool.CPU.Animations.SPAS12_Idle_Anim
--

-- Values
local FuseStatusValue = script.Parent.Parent.Values.FuseStatusValue
local AmmoStatusValue = script.Parent.Parent.Values.AmmoStatusValue
local MagazineAmmoValue = script.Parent.Parent.Values.MagazineAmmoValue
local PocketAmmoValue = script.Parent.Parent.Values.PocketAmmoValue
local WaitValue = script.Parent.Parent.Values.WaitValue
local ReloadingValue = script.Parent.Parent.Values.ReloadingValue
--

-- Logic
local RandomIndex1 = 1
local RandomIndex2 = 1
local CanEvent = true
--

script.Parent.Parent.Parent.Equipped:Connect(function()
	SPAS12_Noise2_Sound:Play()
	
	local Character = Tool.Parent
	local Humanoid = Character.Humanoid
	
	SPAS12_Equip_Anim_Track = Humanoid:LoadAnimation(SPAS12_Equip_Anim)
	SPAS12_Equip_Anim_Track:Play()
	wait(0.4)
	SPAS12_Idle_Anim_Track = Humanoid:LoadAnimation(SPAS12_Idle_Anim)
	SPAS12_Idle_Anim_Track:Play()
end)

script.Parent.Parent.Parent.Unequipped:Connect(function()
	SPAS12_Noise2_Sound:Play()

	SPAS12_Equip_Anim_Track:Stop()
	SPAS12_Idle_Anim_Track:Stop()
end)

script.Parent.Parent.Other.TriggerSoundEvent.OnServerEvent:Connect(function()
	if AmmoStatusValue.Value == 0 and ReloadingValue.Value == 0 and FuseStatusValue.Value == 0 and MagazineAmmoValue.Value < 1 then
		ClickSound:Play()
	end
end)

script.Parent.Parent.Other.FireEvent.OnServerEvent:Connect(function(plr,part,pos,damage)
	if part then
		if part.Parent and part.Parent:FindFirstChild("Humanoid") then
			local humanoid = part.Parent.Humanoid
			
			humanoid:TakeDamage(damage)
		else
			local bullet = Instance.new("Part")
			bullet.Size = Vector3.new(0.1,0.1,0.1)
			bullet.Position = pos
			bullet.BrickColor = BrickColor.Black()
			bullet.Anchored = true
			bullet.CanTouch = false
			bullet.Parent = workspace
			game.Debris:AddItem(bullet,5)
		end
	end
end)

script.Parent.Parent.Parent.Activated:Connect(function()
	ReloadingValue.Value = 0
end)

script.Parent.Parent.Other.FireEvent.OnServerEvent:Connect(function()
	if FuseStatusValue.Value == 0 and AmmoStatusValue.Value == 1 and WaitValue.Value == 0 and ReloadingValue.Value == 0 then
		CanEvent = false
		AmmoStatusValue.Value = 0
		WaitValue.Value = 1
		SparksEffect.Transparency = 0
		PointLight.Enabled = true
		ParticleEmitter1.Enabled = true
		ParticleEmitter2.Enabled = true
		ParticleEmitter3.Enabled = true
		ParticleEmitter4.Enabled = true
		ParticleEmitter5.Enabled = true
		Smoke.Enabled = true
		MagazineAmmoValue.Value = MagazineAmmoValue.Value - 1
		RandomIndex1 = math.random(1, 6)
		if RandomIndex1 == 1 then
			SPAS12_Shot1_Sound:Play()
		end
		if RandomIndex1 == 2 then
			SPAS12_Shot2_Sound:Play()
		end
		if RandomIndex1 == 3 then
			SPAS12_Shot3_Sound:Play()
		end
		if RandomIndex1 == 4 then
			SPAS12_Shot4_Sound:Play()
		end
		if RandomIndex1 == 5 then
			SPAS12_Shot5_Sound:Play()
		end
		if RandomIndex1 == 6 then
			SPAS12_Shot6_Sound:Play()
		end
		wait(0.2)
		SparksEffect.Transparency = 1
		PointLight.Enabled = false
		ParticleEmitter1.Enabled = false
		ParticleEmitter2.Enabled = false
		ParticleEmitter3.Enabled = false
		ParticleEmitter4.Enabled = false
		ParticleEmitter5.Enabled = false
		wait(0.3)
		if MagazineAmmoValue.Value > 0 then
			AmmoStatusValue.Value = 1
		end
		SPAS12_Pump_Sound:Play()
		wait(0.5)
		WaitValue.Value = 0
		Smoke.Enabled = false
		RandomIndex2 = math.random(1, 6)
		if RandomIndex2 == 1 then
			SPAS12_BulletShell1_Sound:Stop()
			SPAS12_BulletShell1_Sound:Play()
		end
		if RandomIndex2 == 2 then
			SPAS12_BulletShell2_Sound:Stop()
			SPAS12_BulletShell2_Sound:Play()
		end
		if RandomIndex2 == 3 then
			SPAS12_BulletShell3_Sound:Stop()
			SPAS12_BulletShell3_Sound:Play()
		end
		if RandomIndex2 == 4 then
			SPAS12_BulletShell4_Sound:Stop()
			SPAS12_BulletShell4_Sound:Play()
		end
		if RandomIndex2 == 5 then
			SPAS12_BulletShell5_Sound:Stop()
			SPAS12_BulletShell5_Sound:Play()
		end
		if RandomIndex2 == 6 then
			SPAS12_BulletShell6_Sound:Stop()
			SPAS12_BulletShell6_Sound:Play()
		end
		CanEvent = true
		
		local SPAS12ShellClone = SPAS12Shell:Clone()
		SPAS12ShellClone.CanCollide = true
		SPAS12ShellClone.VectorForce.Enabled = true

		SPAS12ShellClone.Parent = workspace

		local ShellPos = script.Parent.Parent.Parent.Handle.SFX.ShellPos.Position
		SPAS12ShellClone.Position = Vector3.new(ShellPos.X, ShellPos.Y, ShellPos.Z)

		wait(0.1)
		SPAS12ShellClone.VectorForce.Enabled = false
		wait(10)
		SPAS12ShellClone.Transparency = 1
		SPAS12ShellClone.CanCollide = false
	end
end)

script.Parent.Parent.Other.ReloadEvent.OnServerEvent:Connect(function()
	if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 0 and CanEvent == true then
		CanEvent = false
		ReloadingValue.Value = 1
		SPAS12_Noise1_Sound:Play()
		wait(0.361)
		if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 then
			SPAS12_Reload1_Sound:Play()
			PocketAmmoValue.Value = PocketAmmoValue.Value - 1
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + 1
			wait(0.5)
			if ReloadingValue.Value == 0 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
			if MagazineAmmoValue.Value == 6 and ReloadingValue.Value == 1 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				ReloadingValue.Value = 0
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
		end
		if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 1 then
			SPAS12_Reload1_Sound:Play()
			PocketAmmoValue.Value = PocketAmmoValue.Value - 1
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + 1
			wait(0.5)
			if ReloadingValue.Value == 0 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
			if MagazineAmmoValue.Value == 6 and ReloadingValue.Value == 1 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				ReloadingValue.Value = 0
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
		end
		if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 1 then
			SPAS12_Reload1_Sound:Play()
			PocketAmmoValue.Value = PocketAmmoValue.Value - 1
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + 1
			wait(0.5)
			if ReloadingValue.Value == 0 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
			if MagazineAmmoValue.Value == 6 and ReloadingValue.Value == 1 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				ReloadingValue.Value = 0
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
		end
		if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 1 then
			SPAS12_Reload1_Sound:Play()
			PocketAmmoValue.Value = PocketAmmoValue.Value - 1
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + 1
			wait(0.5)
			if ReloadingValue.Value == 0 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
			if MagazineAmmoValue.Value == 6 and ReloadingValue.Value == 1 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				ReloadingValue.Value = 0
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
		end
		if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 1 then
			SPAS12_Reload1_Sound:Play()
			PocketAmmoValue.Value = PocketAmmoValue.Value - 1
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + 1
			wait(0.5)
			if ReloadingValue.Value == 0 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
			if MagazineAmmoValue.Value == 6 and ReloadingValue.Value == 1 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				ReloadingValue.Value = 0
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
		end
		if MagazineAmmoValue.Value < 6 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 1 then
			SPAS12_Reload1_Sound:Play()
			PocketAmmoValue.Value = PocketAmmoValue.Value - 1
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + 1
			wait(0.5)
			if ReloadingValue.Value == 0 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
			if MagazineAmmoValue.Value == 6 and ReloadingValue.Value == 1 then
				SPAS12_Noise2_Sound:Play()
				wait(1)
				CanEvent = true
				ReloadingValue.Value = 0
				if AmmoStatusValue.Value == 0 then
					SPAS12_Pump_Sound:Play()
					wait(1)
					AmmoStatusValue.Value = 1
				end
			end
		end
		
		if MagazineAmmoValue.Value > 0 and PocketAmmoValue.Value == 0 then
			SPAS12_Noise2_Sound:Play()
			wait(1)
			CanEvent = true
			ReloadingValue.Value = 0
			if AmmoStatusValue.Value == 0 then
				SPAS12_Pump_Sound:Play()
				wait(1)
				AmmoStatusValue.Value = 1
			end
		end
	end
end)
