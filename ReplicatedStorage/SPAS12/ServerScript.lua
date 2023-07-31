-- Control
local Tool = script.Parent.Parent.Parent
local CPU = Tool:WaitForChild("CPU")
--

-- Values
local Values = CPU:WaitForChild("Values")
local ReloadingValue = Values.ReloadingValue
local InventoryMaxAmmoValue = Values.InventoryMaxAmmoValue
local InventoryAmmoValue = Values.InventoryAmmoValue
local MagMaxAmmoValue = Values.MagMaxAmmoValue
local MagAmmoValue = Values.MagAmmoValue
local BulletPerShotValue = Values.BulletPerShotValue
local HeadDamageValue = Values.HeadDamageValue
local TorsoDamageValue = Values.TorsoDamageValue
local LimbDamageValue = Values.LimbDamageValue
local RangeValue = Values.RangeValue
--

-- Items
local Emitter = Tool:WaitForChild("Emitter")
--

-- Sounds
local ClickSound = Emitter.ClickSound
local EquipSound = Emitter.SPAS12_Noise2_Sound

local BoltOutSound = Emitter[Tool.Name.."_BoltOut_Sound"]
local BoltInSound = Emitter[Tool.Name.."_BoltIn_Sound"]
local MagInSound = Emitter[Tool.Name.."_MagIn_Sound"]
--

-- Remote Events
local RemoteEvents = CPU:WaitForChild("RemoteEvents")
local ReloadStartEvent = RemoteEvents.ReloadStartEvent
local ReloadEndEvent = RemoteEvents.ReloadEndEvent
local EquipEvent = RemoteEvents.EquipEvent
local UnequipEvent = RemoteEvents.UnequipEvent
local FireEvent = RemoteEvents.FireEvent
local BoltOutEvent = RemoteEvents.BoltOutEvent
local BoltInEvent = RemoteEvents.BoltInEvent
local MagInEvent = RemoteEvents.MagInEvent
local AddAmmoEvent = RemoteEvents.AddAmmoEvent
--

-- Logic
local Params = RaycastParams.new()
local FirstReload = true
--

-- Functions
function CreateBulletHole(Result, Humanoid)
	local BulletHole = Instance.new("Part")
	BulletHole.Size = Vector3.new(0.5, 0.5, 0.001)
	BulletHole.Anchored = true
	BulletHole.CanTouch = false
	BulletHole.CanCollide = false
	BulletHole.CanQuery = false
	BulletHole.Transparency = 1
	BulletHole.Parent = workspace.WeaponBulletHoles
	BulletHole.Position = Result.Position
	BulletHole.CFrame = CFrame.new(BulletHole.Position, BulletHole.Position + Result.Normal)
	BulletHole.CFrame = BulletHole.CFrame * CFrame.Angles(0, 0, math.random(1, 360))
	if Humanoid then
		local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Grass_Ice_Fabric_Pebble_"..math.random(1, 2).."Sound"]:Clone()
		Sound.Parent = BulletHole
		Sound:Play()
		local Emitter1 = game.ReplicatedStorage.BulletHoleStuff.BloodEmitter1:Clone()
		Emitter1.Parent = BulletHole
	else
		if Result.Material == Enum.Material.Grass or Result.Material == Enum.Material.Ice or Result.Material == Enum.Material.Fabric or Result.Material == Enum.Material.Pebble then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Grass_Ice_Fabric_Pebble_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		elseif Result.Material == Enum.Material.Sand then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Sand_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		elseif Result.Material == Enum.Material.Glass or Result.Material == Enum.Material.Neon then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Glass_Neon_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		elseif Result.Material == Enum.Material.Wood or Result.Material == Enum.Material.WoodPlanks then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Wood_WoodPlanks_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		elseif Result.Material == Enum.Material.Metal or Result.Material == Enum.Material.CorrodedMetal or Result.Material == Enum.Material.DiamondPlate then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Metal_CorrodedMetal_DiamondPlate_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		elseif Result.Material == Enum.Material.Water then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Water_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		elseif Result.Material == Enum.Material.Concrete or Result.Material == Enum.Material.Plastic or Result.Material == Enum.Material.SmoothPlastic or Result.Material == Enum.Material.Slate or Result.Material == Enum.Material.Foil or Result.Material == Enum.Material.Brick or Result.Material == Enum.Material.Granite or Result.Material == Enum.Material.Marble or Result.Material == Enum.Material.Cobblestone then
			local Sound = game.ReplicatedStorage.BulletHoleStuff["Bullet_Concrete_Plastic_SmoothPlastic_Slate_Foil_"..math.random(1, 2).."Sound"]:Clone()
			Sound.Parent = BulletHole
			Sound:Play()
		end

		if Result.Material == Enum.Material.Water then
			local Emitter1 = game.ReplicatedStorage.BulletHoleStuff.WaterParticleEmitter1:Clone()
			Emitter1.Parent = BulletHole
			local Emitter2 = game.ReplicatedStorage.BulletHoleStuff.WaterParticleEmitter2:Clone()
			Emitter2.Parent = BulletHole
		else
			local Emitter1 = game.ReplicatedStorage.BulletHoleStuff.WallParticleEmitter1:Clone()
			Emitter1.Parent = BulletHole
		end

		if Result.Material == Enum.Material.Pebble or Result.Material == Enum.Material.Slate or Result.Material == Enum.Material.Plastic or Result.Material == Enum.Material.SmoothPlastic or Result.Material == Enum.Material.Foil or Result.Material == Enum.Material.Metal or Result.Material == Enum.Material.CorrodedMetal or Result.Material == Enum.Material.DiamondPlate then
			local Decal = game.ReplicatedStorage.BulletHoleStuff.MetalDecal:Clone()
			Decal.Parent = BulletHole
		elseif Result.Material == Enum.Material.Concrete or Result.Material == Enum.Material.Brick or Result.Material == Enum.Material.Granite or Result.Material == Enum.Material.Marble or Result.Material == Enum.Material.Cobblestone then
			local Decal = game.ReplicatedStorage.BulletHoleStuff.ConcreteDecal:Clone()
			Decal.Parent = BulletHole
		elseif Result.Material == Enum.Material.Wood or Result.Material == Enum.Material.WoodPlanks then
			local Decal = game.ReplicatedStorage.BulletHoleStuff.WoodDecal:Clone()
			Decal.Parent = BulletHole
		elseif Result.Material == Enum.Material.Glass or Result.Material == Enum.Material.Neon then
			local Decal1 = game.ReplicatedStorage.BulletHoleStuff.GlassDecal1:Clone()
			Decal1.Parent = BulletHole
			local Decal2 = game.ReplicatedStorage.BulletHoleStuff.GlassDecal2:Clone()
			Decal2.Parent = BulletHole
		end
	end
end

function CreateShell()
	local Chamber = Tool.Chamber
	local Shell = game.ReplicatedStorage[Tool.Name.."Stuff"][Tool.Name.."Shell"]:Clone()
	Shell.Parent = workspace.WeaponShells
	Shell.CFrame = Chamber.CFrame
	Shell.Velocity = Chamber.CFrame.lookVector * (20 + math.random(1, 10))
	Shell.Orientation = Vector3.new(math.random(1, 360), math.random(1, 360), math.random(1, 360))
	wait(0.5)
	Shell["SPAS12_BulletShell"..math.random(1, 3).."_Sound"]:Play()
end

function CastRay(Hit, Count)
	local Origin = Emitter.Position
	local Stop = (Hit.Position - Origin).Unit * RangeValue.Value
	if Count > 1 then
		Stop = Stop + Vector3.new(math.random(-600, 600) / 10, math.random(-600, 600) / 10, math.random(-600, 600) / 10)
	end
	local Result = workspace:Raycast(Origin, Stop, Params)
	local Damage = 0
	if Result then
		local Target = Result.Instance
		local Humanoid = Target.Parent:FindFirstChild("Humanoid")
		if Humanoid then
			if Target.Name == "LeftFoot" or Target.Name == "LeftLowerLeg" or Target.Name == "LeftUpperLeg" or Target.Name == "RightFoot" or Target.Name == "RightLowerLeg" or Target.Name == "RightUpperLeg" or Target.Name == "LeftHand" or Target.Name == "LeftLowerArm" or Target.Name == "LeftUpperArm" or Target.Name == "RightHand" or Target.Name == "RightLowerArm" or Target.Name == "RightUpperArm" then
				Damage = LimbDamageValue.Value
			elseif Target.Name == "LowerTorso" or Target.Name == "UpperTorso" then
				Damage = TorsoDamageValue.Value
			elseif Target.Name == "Head" then
				Damage = HeadDamageValue.Value
			end
			Humanoid:TakeDamage(Damage)					
			CreateBulletHole(Result, Humanoid)
		elseif Target:IsA("Part") or Target:IsA("UnionOperation") or Target:IsA("Terrain") or Target:IsA("MeshPart") or Target:IsA("TrussPart") then
			CreateBulletHole(Result, Humanoid)
		end
		if Target.Name == "BrokenGlass" then
			for _, Item in pairs(Target:GetChildren()) do
				if Item:IsA("Decal") then
					Item.Transparency = 1
				end
			end
			Target["Decal"..math.random(1, 6)].Transparency = 0
			Target.DamagedValue.Value = true
		end
	end
end

function Shoot(Player, Target, Hit)
	ClickSound:Play()
	if MagAmmoValue.Value > 0 then
		local Character = Tool.Parent
		MagAmmoValue.Value = MagAmmoValue.Value - 1
		local ClonedShotSound = game.ReplicatedStorage[Tool.Name.."Stuff"][Tool.Name.."_Shot"..math.random(1, 1).."_Sound"]:Clone()
		ClonedShotSound.Parent = Emitter
		ClonedShotSound:Destroy()
		for Count = 1, BulletPerShotValue.Value, 1 do
			CastRay(Hit, Count)
		end
		Emitter.ParticleEmitter1.Enabled = true
		Emitter.ParticleEmitter2.Enabled = true
		Emitter.ParticleEmitter3.Enabled = true
		Emitter.ParticleEmitter4.Enabled = true
		Emitter.SpotLight.Enabled = true
		wait(0.1)
		Emitter.ParticleEmitter1.Enabled = false
		Emitter.ParticleEmitter2.Enabled = false
		Emitter.ParticleEmitter3.Enabled = false
		Emitter.ParticleEmitter4.Enabled = false
		Emitter.SpotLight.Enabled = false
	end
end

function DoAnimationBullet(Mode)
	if Mode == "HIDE" then
		Tool.AnimationBullet.Transparency = 1
		Tool.AnimationBullet.BulletFrame.Transparency = 1
	elseif Mode == "SHOW" then
		Tool.AnimationBullet.Transparency = 0
		Tool.AnimationBullet.BulletFrame.Transparency = 0
	end
end
--

ReloadingValue.Changed:Connect(function()
	if ReloadingValue.Value == true then
		DoAnimationBullet("SHOW")
	end
end)

MagAmmoValue.Changed:Connect(function()
	if MagAmmoValue.Value == 0 then
		DoAnimationBullet("HIDE")
	elseif MagAmmoValue.Value > 0 then
		DoAnimationBullet("SHOW")
	end
end)

EquipEvent.OnServerEvent:Connect(function()
	EquipSound:Play()
end)

UnequipEvent.OnServerEvent:Connect(function()
	EquipSound:Play()
end)

ReloadStartEvent.OnServerEvent:Connect(function()
	ReloadingValue.Value = true
end)

ReloadEndEvent.OnServerEvent:Connect(function()
	ReloadingValue.Value = false
end)

FireEvent.OnServerEvent:Connect(Shoot)

BoltOutEvent.OnServerEvent:Connect(function()
	BoltOutSound:Play()
	if FirstReload == false then
		CreateShell()
	end
	FirstReload = false
end)

BoltInEvent.OnServerEvent:Connect(function()
	BoltInSound:Play()
end)

MagInEvent.OnServerEvent:Connect(function()
	MagInSound:Play()
end)

AddAmmoEvent.OnServerEvent:Connect(function()
	InventoryAmmoValue.Value = InventoryAmmoValue.Value - 1
	MagAmmoValue.Value = MagAmmoValue.Value + 1
end)
