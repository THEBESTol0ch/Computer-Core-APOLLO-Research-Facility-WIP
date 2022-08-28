local UserInputService = game:GetService("UserInputService")

local ParticleEmitter = script.Parent.Parent.Parent.Handle.SFX.ParticleEmitter
local plr = game.Players.LocalPlayer
local char = plr.Character
local mouse = plr:GetMouse()

local projectiles = 1
local spread = 0
local damage = 10

local ToolEquipped = false

function newbullet()
	local x = math.random(-spread*100,spread*100)/100
	local y = math.random(-spread*100,spread*100)/100

	local direction = (CFrame.new(ParticleEmitter.CFrame.p,mouse.Hit.p)*CFrame.Angles(math.rad(x),math.rad(y),0)).lookVector
	local ray = Ray.new(ParticleEmitter.CFrame.p,(direction).unit*999)
	local part,pos = workspace:FindPartOnRay(ray,char)

	if part then
		if part.Parent.Name ~= plr.Name then
			script.Parent.Parent.Other.FireEvent:FireServer(part,pos,damage)
		end
	end
end

script.Parent.Parent.Parent.Equipped:Connect(function(Mouse)
	ToolEquipped = true
	if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("M4A1HUD") then
		M4A1HUD = script.Parent.Parent.Parent.M4A1HUD:Clone()
		M4A1HUD.Parent = game:GetService("Players").LocalPlayer.PlayerGui
	end
	script.Parent.Parent.Parent.Activated:Connect(function()
		script.Parent.Parent.Other.TriggerSoundEvent:FireServer()
		if script.Parent.Parent.Values.FuseStatusValue.Value == 0 and script.Parent.Parent.Values.MagazineAmmoValue.Value > 0 and script.Parent.Parent.Values.WaitValue.Value == 0 and script.Parent.Parent.Values.ReloadingValue.Value == 0 then
			for i = 1,projectiles do
				newbullet()
			end
			wait(1)
		end
	end)
	UserInputService.InputBegan:Connect(function(Key)
		if Key.KeyCode == Enum.KeyCode.R then
			script.Parent.Parent.Other.ReloadEvent:FireServer()
		end
	end)
	while true do
		if ToolEquipped == true then
			M4A1HUD.ImageLabel.PocketAmmoLabel.Text = script.Parent.Parent.Values.PocketAmmoValue.Value
			M4A1HUD.ImageLabel.MagazineAmmoLabel.Text = script.Parent.Parent.Values.MagazineAmmoValue.Value	
		end
		wait(0.1)
	end
end)

script.Parent.Parent.Parent.Unequipped:Connect(function()
	ToolEquipped = false
	M4A1HUD:Destroy()
end)
