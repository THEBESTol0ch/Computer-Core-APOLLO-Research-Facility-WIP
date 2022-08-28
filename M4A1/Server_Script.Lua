-- Main
local Tool = script.Parent.Parent.Parent
--

-- SFX
local M4A1Shell = game.ReplicatedStorage:WaitForChild("M4A1Shell")

local ParticleEmitter1 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter1
local ParticleEmitter2 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter2
local ParticleEmitter3 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter3
local ParticleEmitter4 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter4
local PointLight = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.PointLight

local SPAS12_BulletShell1_Sound = script.Parent.Parent.Parent.Handle.SFX.ShellSoundEmitter.SPAS12_BulletShell1_Sound
local SPAS12_BulletShell2_Sound = script.Parent.Parent.Parent.Handle.SFX.ShellSoundEmitter.SPAS12_BulletShell2_Sound
local SPAS12_BulletShell3_Sound = script.Parent.Parent.Parent.Handle.SFX.ShellSoundEmitter.SPAS12_BulletShell3_Sound

local M4A1_Reload_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.M4A1_Reload_Sound
local SPAS12_Noise2_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.SPAS12_Noise2_Sound

local M4A1_Shot1_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.M4A1_Shot1_Sound
local M4A1_Shot2_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.M4A1_Shot2_Sound
local M4A1_Shot3_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.M4A1_Shot3_Sound

local ClickSound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.ClickSound

local M4A1_Equip_Anim = Tool.CPU.Animations.M4A1_Equip_Anim
local M4A1_Idle_Anim = Tool.CPU.Animations.M4A1_Idle_Anim
--

-- Values
local FuseStatusValue = script.Parent.Parent.Values.FuseStatusValue
local MagazineAmmoValue = script.Parent.Parent.Values.MagazineAmmoValue
local PocketAmmoValue = script.Parent.Parent.Values.PocketAmmoValue
local WaitValue = script.Parent.Parent.Values.WaitValue
local ReloadingValue = script.Parent.Parent.Values.ReloadingValue
local ClipSizeValue = script.Parent.Parent.Values.ClipSizeValue
local NeedToReloadValue = script.Parent.Parent.Values.NeedToReloadValue
--

-- Logic
local RandomIndex1 = 1
local RandomIndex2 = 1
--

script.Parent.Parent.Parent.Equipped:Connect(function()
	SPAS12_Noise2_Sound:Play()
	
	local Character = Tool.Parent
	local Humanoid = Character.Humanoid
	
	M4A1_Equip_Anim_Track = Humanoid:LoadAnimation(M4A1_Equip_Anim)
	M4A1_Equip_Anim_Track:Play()
	wait(0.4)
	M4A1_Idle_Anim_Track = Humanoid:LoadAnimation(M4A1_Idle_Anim)
	M4A1_Idle_Anim_Track:Play()
end)

script.Parent.Parent.Parent.Unequipped:Connect(function()
	SPAS12_Noise2_Sound:Play()

	M4A1_Equip_Anim_Track:Stop()
	M4A1_Idle_Anim_Track:Stop()
end)

script.Parent.Parent.Other.TriggerSoundEvent.OnServerEvent:Connect(function()
	if ReloadingValue.Value == 0 and FuseStatusValue.Value == 0 and MagazineAmmoValue.Value < 1 then
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
			game.Debris:AddItem(bullet,10)
		end
	end
end)

script.Parent.Parent.Other.FireEvent.OnServerEvent:Connect(function()
	if FuseStatusValue.Value == 0 and MagazineAmmoValue.Value > 0 and WaitValue.Value == 0 and ReloadingValue.Value == 0 then
		PointLight.Enabled = true
		ParticleEmitter1.Enabled = true
		ParticleEmitter2.Enabled = true
		ParticleEmitter3.Enabled = true
		ParticleEmitter4.Enabled = true
		MagazineAmmoValue.Value = MagazineAmmoValue.Value - 1
		RandomIndex1 = math.random(1, 3)
		if RandomIndex1 == 1 then
			M4A1_Shot1_Sound:Stop()
			M4A1_Shot1_Sound:Play()
		end
		if RandomIndex1 == 2 then
			M4A1_Shot2_Sound:Stop()
			M4A1_Shot2_Sound:Play()
		end
		if RandomIndex1 == 3 then
			M4A1_Shot3_Sound:Stop()
			M4A1_Shot3_Sound:Play()
		end
		local M4A1ShellClone = M4A1Shell:Clone()
		M4A1ShellClone.CanCollide = true

		M4A1ShellClone.Parent = workspace

		local ShellPos = script.Parent.Parent.Parent.Handle.SFX.ShellPos.Position
		M4A1ShellClone.Position = Vector3.new(ShellPos.X, ShellPos.Y, ShellPos.Z)
		wait(0.1)
		PointLight.Enabled = false
		ParticleEmitter1.Enabled = false
		ParticleEmitter2.Enabled = false
		ParticleEmitter3.Enabled = false
		ParticleEmitter4.Enabled = false
		RandomIndex2 = math.random(1, 3)
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
		wait(10)
		M4A1ShellClone.Transparency = 1
		M4A1ShellClone.CanCollide = false
	end
end)

script.Parent.Parent.Other.ReloadEvent.OnServerEvent:Connect(function()
	if MagazineAmmoValue.Value < 30 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 0 and WaitValue.Value == 0 then
		ReloadingValue.Value = 1
		if MagazineAmmoValue.Value > 0 then
			M4A1_Reload_Sound:Play()
			wait(1.5)
			M4A1_Reload_Sound:Stop()
		end
		if MagazineAmmoValue.Value == 0 then
			M4A1_Reload_Sound:Play()
			wait(2)
		end
		NeedToReloadValue.Value = ClipSizeValue.Value - MagazineAmmoValue.Value
		if NeedToReloadValue.Value > PocketAmmoValue.Value then
			MagazineAmmoValue.Value = PocketAmmoValue.Value + MagazineAmmoValue.Value
			PocketAmmoValue.Value = 0
		end
		if NeedToReloadValue.Value < PocketAmmoValue.Value then
			MagazineAmmoValue.Value = MagazineAmmoValue.Value + NeedToReloadValue.Value
			PocketAmmoValue.Value = PocketAmmoValue.Value - NeedToReloadValue.Value
		end
		NeedToReloadValue.Value = 0
		ClipSizeValue.Value = 30
		SPAS12_Noise2_Sound:Play()
		ReloadingValue.Value = 0
	end
end)
