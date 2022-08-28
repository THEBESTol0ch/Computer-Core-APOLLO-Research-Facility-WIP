-- Main
local Tool = script.Parent.Parent.Parent
--

-- SFX
local HKUSPMatchShell = game.ReplicatedStorage:WaitForChild("HKUSPMatchShell")

local ParticleEmitter1 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter1
local ParticleEmitter2 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter2
local ParticleEmitter3 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter3
local ParticleEmitter4 = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.ParticleEmitter4
local PointLight = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter.PointLight

local SPAS12_BulletShell1_Sound = script.Parent.Parent.Parent.Handle.SFX.ShellSoundEmitter.SPAS12_BulletShell1_Sound
local SPAS12_BulletShell2_Sound = script.Parent.Parent.Parent.Handle.SFX.ShellSoundEmitter.SPAS12_BulletShell2_Sound
local SPAS12_BulletShell3_Sound = script.Parent.Parent.Parent.Handle.SFX.ShellSoundEmitter.SPAS12_BulletShell3_Sound

local HKUSPMatch_Reload_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.HKUSPMatch_Reload_Sound
local SPAS12_Noise2_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.SPAS12_Noise2_Sound

local HKUSPMatch_Shot_Sound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.HKUSPMatch_Shot_Sound

local ClickSound = script.Parent.Parent.Parent.Handle.SFX.WeaponSoundEmitter.ClickSound

local HKUSPMatch_Equip_Anim = Tool.CPU.Animations.HKUSPMatch_Equip_Anim
local HKUSPMatch_Idle_Anim = Tool.CPU.Animations.HKUSPMatch_Idle_Anim
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
local RandomIndex = 1
--

script.Parent.Parent.Parent.Equipped:Connect(function()
	SPAS12_Noise2_Sound:Play()
	
	local Character = Tool.Parent
	local Humanoid = Character.Humanoid
	
	HKUSPMatch_Equip_Anim_Track = Humanoid:LoadAnimation(HKUSPMatch_Equip_Anim)
	HKUSPMatch_Equip_Anim_Track:Play()
	wait(0.4)
	HKUSPMatch_Idle_Anim_Track = Humanoid:LoadAnimation(HKUSPMatch_Idle_Anim)
	HKUSPMatch_Idle_Anim_Track:Play()
end)

script.Parent.Parent.Parent.Unequipped:Connect(function()
	SPAS12_Noise2_Sound:Play()

	HKUSPMatch_Equip_Anim_Track:Stop()
	HKUSPMatch_Idle_Anim_Track:Stop()
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
		HKUSPMatch_Shot_Sound:Play()
		local HKUSPMatchShellClone = HKUSPMatchShell:Clone()
		HKUSPMatchShellClone.CanCollide = true

		HKUSPMatchShellClone.Parent = workspace

		local ShellPos = script.Parent.Parent.Parent.Handle.SFX.ShellPos.Position
		HKUSPMatchShellClone.Position = Vector3.new(ShellPos.X, ShellPos.Y, ShellPos.Z)
		wait(0.1)
		PointLight.Enabled = false
		ParticleEmitter1.Enabled = false
		ParticleEmitter2.Enabled = false
		ParticleEmitter3.Enabled = false
		ParticleEmitter4.Enabled = false
		RandomIndex = math.random(1, 3)
		if RandomIndex == 1 then
			SPAS12_BulletShell1_Sound:Stop()
			SPAS12_BulletShell1_Sound:Play()
		end
		if RandomIndex == 2 then
			SPAS12_BulletShell2_Sound:Stop()
			SPAS12_BulletShell2_Sound:Play()
		end
		if RandomIndex == 3 then
			SPAS12_BulletShell3_Sound:Stop()
			SPAS12_BulletShell3_Sound:Play()
		end
		wait(10)
		HKUSPMatchShellClone.Transparency = 1
		HKUSPMatchShellClone.CanCollide = false
	end
end)

script.Parent.Parent.Other.ReloadEvent.OnServerEvent:Connect(function()
	if MagazineAmmoValue.Value < 17 and PocketAmmoValue.Value > 0 and ReloadingValue.Value == 0 and WaitValue.Value == 0 then
		ReloadingValue.Value = 1
		if MagazineAmmoValue.Value > 0 then
			HKUSPMatch_Reload_Sound:Play()
			wait(1.8)
			HKUSPMatch_Reload_Sound:Stop()
		end
		if MagazineAmmoValue.Value == 0 then
			HKUSPMatch_Reload_Sound:Play()
			wait(2.2)
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
		ClipSizeValue.Value = 17
		SPAS12_Noise2_Sound:Play()
		ReloadingValue.Value = 0
	end
end)
