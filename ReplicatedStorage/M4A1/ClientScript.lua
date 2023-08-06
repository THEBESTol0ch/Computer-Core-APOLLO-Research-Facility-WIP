-- Control
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Tool = script.Parent.Parent.Parent
local CPU = Tool:WaitForChild("CPU")
--

-- Values
local Values = script.Parent.Parent:WaitForChild("Values")
local MagMaxAmmoValue = Values.MagMaxAmmoValue
local FirstReloadValue = Values.FirstReloadValue
local BoltOutValue = Values.BoltOutValue
local ReloadingValue = Values.ReloadingValue
local InventoryAmmoValue = Values.InventoryAmmoValue
local MagAmmoValue = Values.MagAmmoValue
local AimSpreadValue = Values.AimSpreadValue
local StandSpreadValue = Values.StandSpreadValue
local RunSpreadValue = Values.RunSpreadValue
local ToolEquippedValue = Values.ToolEquippedValue
local IdleSafeValue = Values.IdleSafeValue
local AimValue = Values.AimValue
local BlinkingValue = Values.BlinkingValue
local PlayerIn1stPersonValue = Character:WaitForChild("PlayerIn1stPersonValue")
--

-- Items
local Emitter = Tool:WaitForChild("Emitter")
local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local UpperTorso = Character:WaitForChild("UpperTorso")
local Waist = UpperTorso:WaitForChild("Waist")
local Head = Character:WaitForChild("Head")
local Neck = Head:WaitForChild("Neck")
local LeftUpperArm = Character:WaitForChild("LeftUpperArm")
local LeftShoulder = LeftUpperArm:WaitForChild("LeftShoulder")
local RightUpperArm = Character:WaitForChild("RightUpperArm")
local RightShoulder = RightUpperArm:WaitForChild("RightShoulder")
local HUD = CPU.Gui[Tool.Name.."Gui"]:Clone()
HUD.Parent = Player.PlayerGui
--

-- Remote Events
local RemoteEvents = CPU:WaitForChild("RemoteEvents")
local ReloadStartEvent = RemoteEvents.ReloadStartEvent
local ReloadEndEvent = RemoteEvents.ReloadEndEvent
local EquipEvent = RemoteEvents.EquipEvent
local UnequipEvent = RemoteEvents.UnequipEvent
local FireEvent = RemoteEvents.FireEvent
local BoltOutEvent = RemoteEvents.BoltOutEvent
local BoltIn1Event = RemoteEvents.BoltIn1Event
local BoltIn2Event = RemoteEvents.BoltIn2Event
local MagOutEvent = RemoteEvents.MagOutEvent
local MagInEvent = RemoteEvents.MagInEvent
local MagDropEvent = RemoteEvents.MagDropEvent
--

-- Animations
local Equip_Anim = script.Parent.Parent.Animations.Equip_Anim
local Equip_Anim_Track = Humanoid:LoadAnimation(Equip_Anim)
local Idle_Anim = script.Parent.Parent.Animations.Idle_Anim
local Idle_Anim_Track = Humanoid:LoadAnimation(Idle_Anim)
local IdleSafeStart_Anim = script.Parent.Parent.Animations.IdleSafeStart_Anim
local IdleSafeStart_Anim_Track = Humanoid:LoadAnimation(IdleSafeStart_Anim)
local IdleSafe_Anim = script.Parent.Parent.Animations.IdleSafe_Anim
local IdleSafe_Anim_Track = Humanoid:LoadAnimation(IdleSafe_Anim)
local Aim_Anim = script.Parent.Parent.Animations.Aim_Anim
local Aim_Anim_Track = Humanoid:LoadAnimation(Aim_Anim)
local Shot_Anim = script.Parent.Parent.Animations.Shot_Anim
local Shot_Anim_Track = Humanoid:LoadAnimation(Shot_Anim)
local ShotAim_Anim = script.Parent.Parent.Animations.ShotAim_Anim
local ShotAim_Anim_Track = Humanoid:LoadAnimation(ShotAim_Anim)
local BoltOutStart_Anim = script.Parent.Parent.Animations.BoltOutStart_Anim
local BoltOutStart_Anim_Track = Humanoid:LoadAnimation(BoltOutStart_Anim)
local BoltOut_Anim = script.Parent.Parent.Animations.BoltOut_Anim
local BoltOut_Anim_Track = Humanoid:LoadAnimation(BoltOut_Anim)
local BoltInStart_Anim = script.Parent.Parent.Animations.BoltInStart_Anim
local BoltInStart_Anim_Track = Humanoid:LoadAnimation(BoltInStart_Anim)
local Trigger_Anim = script.Parent.Parent.Animations.Trigger_Anim
local Trigger_Anim_Track = Humanoid:LoadAnimation(Trigger_Anim)
local Reload_Anim = script.Parent.Parent.Animations.Reload_Anim
local Reload_Anim_Track = Humanoid:LoadAnimation(Reload_Anim)
local FirstReload_Anim = script.Parent.Parent.Animations.FirstReload_Anim
local FirstReload_Anim_Track = Humanoid:LoadAnimation(FirstReload_Anim)
local BoltHit_Anim = script.Parent.Parent.Animations.BoltHit_Anim
local BoltHit_Anim_Track = Humanoid:LoadAnimation(BoltHit_Anim)
local Demo_Anim = script.Parent.Parent.Animations.Demo_Anim
local Demo_Anim_Track = Humanoid:LoadAnimation(Demo_Anim)
local CapOutStart_Anim = script.Parent.Parent.Animations.CapOutStart_Anim
local CapOutStart_Anim_Track = Humanoid:LoadAnimation(CapOutStart_Anim)
local CapOut_Anim = script.Parent.Parent.Animations.CapOut_Anim
local CapOut_Anim_Track = Humanoid:LoadAnimation(CapOut_Anim)
--

-- Logic
local Speed = 0
local NeckC0 = Neck.C0
local LeftShoulderC0 = LeftShoulder.C0
local RightShoulderC0 = RightShoulder.C0
--

local AimAnimationSettingsStart = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local AimAnimationSettingsEnd = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local AimSpreadAnimationSettings = TweenInfo.new(
	0.1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local MagBackgroundAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local AimPropertiesStart = {
	FieldOfView = 30
}
local AimPropertiesEnd = {
	FieldOfView = 70
}

local MagBackgroundPropertiesStart = {
	BackgroundColor3 = Color3.fromRGB(255, 69, 72)
}
local MagBackgroundPropertiesEnd = {
	BackgroundColor3 = Color3.fromRGB(255, 255, 255)
}

-- Functions
function YieldPlayAnimation(AnimationTrack)
	AnimationTrack:Play()
	AnimationTrack.Stopped:Wait()
end

function ResetAim()
	AimValue.Value = false
	TweenService:Create(Camera, AimAnimationSettingsEnd, AimPropertiesEnd):Play()
	Aim_Anim_Track:Stop()
	if ToolEquippedValue.Value == true and AimValue.Value == false then Idle_Anim_Track:Play() end
end

function ResetPlayer()
	Neck.C0 = NeckC0 * CFrame.Angles(0, 0, 0)
	LeftShoulder.C0 = LeftShoulderC0 * CFrame.Angles(0, 0, 0)
	RightShoulder.C0 = RightShoulderC0 * CFrame.Angles(0, 0, 0)
end

function DoIdle(Mode)
	if Mode == "STANDARD" then
		IdleSafeValue.Value = false
		IdleSafe_Anim_Track:Stop()
		Idle_Anim_Track:Play()
	elseif Mode == "SAFE" then
		IdleSafeValue.Value = true
		ResetPlayer()
		Idle_Anim_Track:Stop()
		YieldPlayAnimation(IdleSafeStart_Anim_Track)
		IdleSafe_Anim_Track:Play()
	end
end

function StartBlink()
	if MagAmmoValue.Value < MagMaxAmmoValue.Value / 4 and BlinkingValue.Value == false then
		BlinkingValue.Value = true
		repeat
			TweenService:Create(HUD.MagBackground, MagBackgroundAnimationSettings, MagBackgroundPropertiesStart):Play()
			wait(1)
			TweenService:Create(HUD.MagBackground, MagBackgroundAnimationSettings, MagBackgroundPropertiesEnd):Play()
			wait(1)
		until MagAmmoValue.Value > MagMaxAmmoValue.Value / 4
		BlinkingValue.Value = false
	end
end
--

Tool.Equipped:Connect(function()
	HUD.Enabled = true
	HUD.InventoryAmmoLabel.Text = InventoryAmmoValue.Value
	HUD.MagAmmoLabel.Text = MagAmmoValue.Value
	StartBlink()
	EquipEvent:FireServer()
	YieldPlayAnimation(Equip_Anim_Track)
	Idle_Anim_Track:Play()
	ToolEquippedValue.Value = true
	DoIdle("STANDARD")
	repeat
		if ToolEquippedValue.Value == true and Speed < 2 and PlayerIn1stPersonValue.Value == false and IdleSafeValue.Value == false then
			wait(2)
			if ToolEquippedValue.Value == true and Speed < 2 and PlayerIn1stPersonValue.Value == false and IdleSafeValue.Value == false then
				DoIdle("SAFE")
			end
		end
		if ToolEquippedValue.Value == true and Speed > 2 and IdleSafeValue.Value == true then
			DoIdle("STANDARD")
		end
		wait(0.1)
	until ToolEquippedValue.Value == false
end)

Tool.Unequipped:Connect(function()
	ToolEquippedValue.Value = false
	BoltOutValue.Value = false
	UnequipEvent:FireServer()
	HUD.Enabled = false
	Equip_Anim_Track:Stop()
	Idle_Anim_Track:Stop()
	IdleSafeStart_Anim_Track:Stop()
	IdleSafe_Anim_Track:Stop()
	Aim_Anim_Track:Stop()
	Shot_Anim_Track:Stop()
	ShotAim_Anim_Track:Stop()
	Reload_Anim_Track:Stop()
	BoltOut_Anim_Track:Stop()
	BoltHit_Anim_Track:Stop()
	Demo_Anim_Track:Stop()
	TweenService:Create(Camera, AimAnimationSettingsEnd, AimPropertiesEnd):Play()
	ResetPlayer()
	if AimValue.Value == true then ResetAim() end
end)

InventoryAmmoValue.Changed:Connect(function()
	HUD.InventoryAmmoLabel.Text = InventoryAmmoValue.Value
end)

MagAmmoValue.Changed:Connect(function()
	HUD.MagAmmoLabel.Text = MagAmmoValue.Value
	StartBlink()
	if MagAmmoValue.Value == 0 then
		YieldPlayAnimation(BoltOutStart_Anim_Track)
		BoltOut_Anim_Track:Play()
		BoltOutEvent:FireServer()
		BoltOutValue.Value = true
	elseif MagAmmoValue.Value > 0 and BoltOutValue.Value == true then
		BoltOut_Anim_Track:Stop()
		BoltInStart_Anim_Track:Play()
		BoltOutValue.Value = false
		BoltHit_Anim_Track:Play()
	end
end)

PlayerIn1stPersonValue.Changed:Connect(function()
	if ToolEquippedValue.Value == true and PlayerIn1stPersonValue.Value == true and IdleSafeValue.Value == true then
		DoIdle("STANDARD")
	elseif PlayerIn1stPersonValue.Value == false then
		if AimValue.Value == true then ResetAim() end
	end
end)

UserInputService.InputBegan:Connect(function(Input)
	local InputType = Input.UserInputType
	if InputType == Enum.UserInputType.MouseButton1 then
		if ToolEquippedValue.Value == true and ReloadingValue.Value == false then
			Demo_Anim_Track:Stop()
			Trigger_Anim_Track:Play()
			FireEvent:FireServer(Mouse.Target, Mouse.Hit, Speed)
			if MagAmmoValue.Value > 0 then
				local X = 0
				local Y = 0
				if AimValue.Value == true then
					ShotAim_Anim_Track:Play()
					X = math.rad(math.random(-AimSpreadValue.Value, AimSpreadValue.Value) / 10)
					Y = math.rad(math.random(-AimSpreadValue.Value, AimSpreadValue.Value) / 10)
				elseif AimValue.Value == false and Speed < 2 then
					Shot_Anim_Track:Play()
					X = math.rad(math.random(-StandSpreadValue.Value, StandSpreadValue.Value) / 10)
					Y = math.rad(math.random(-StandSpreadValue.Value, StandSpreadValue.Value) / 10)
				elseif Speed > 2 then
					X = math.rad(math.random(-RunSpreadValue.Value, RunSpreadValue.Value) / 10)
					Y = math.rad(math.random(-RunSpreadValue.Value, RunSpreadValue.Value) / 10)
				end
				TweenService:Create(Camera, AimSpreadAnimationSettings, { CFrame = Camera.CFrame * CFrame.Angles(X, Y, 0) }):Play()
				if IdleSafeValue.Value == true then DoIdle("STANDARD") end
			end
		end
	end
	if InputType == Enum.UserInputType.MouseButton2 then
		if ToolEquippedValue.Value == true and PlayerIn1stPersonValue.Value == true and AimValue.Value == false and Speed < 2 and ReloadingValue.Value == false then
			AimValue.Value = true
			Demo_Anim_Track:Stop()
			TweenService:Create(Camera, AimAnimationSettingsStart, AimPropertiesStart):Play()
			wait(0.1)
			if AimValue.Value == true then Aim_Anim_Track:Play() end
		end
	end
	if Input.KeyCode == Enum.KeyCode.R then
		if ToolEquippedValue.Value == true and ReloadingValue.Value == false and InventoryAmmoValue.Value > 0 and MagAmmoValue.Value < MagMaxAmmoValue.Value then
			Demo_Anim_Track:Stop()
			if AimValue.Value == true then ResetAim() end
			ReloadStartEvent:FireServer()
			YieldPlayAnimation(Reload_Anim_Track)
			if FirstReloadValue.Value == true  then YieldPlayAnimation(FirstReload_Anim_Track) end
			ReloadEndEvent:FireServer()
		end
	end
	if Input.KeyCode == Enum.KeyCode.F then
		if ToolEquippedValue.Value == true and ReloadingValue.Value == false and AimValue.Value == false then
			Demo_Anim_Track:Stop()
			Demo_Anim_Track:Play()
		end
	end
end)    

UserInputService.InputEnded:Connect(function(Input)
	local InputType = Input.UserInputType
	if InputType == Enum.UserInputType.MouseButton2 then
		if AimValue.Value == true then ResetAim() end
	end
end)

RunService.RenderStepped:connect(function()
	Speed = Character.PrimaryPart.Velocity.Magnitude
	if ToolEquippedValue.Value == true and IdleSafeValue.Value == false then
		if Humanoid.Sit == false then HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position, Vector3.new(Mouse.Hit.p.x, HumanoidRootPart.Position.Y, Mouse.Hit.p.z)) end
		Neck.C0 = NeckC0 * CFrame.Angles(math.asin(Mouse.Origin.lookVector.Y), 0, 0)
		LeftShoulder.C0 = LeftShoulderC0 * CFrame.Angles(math.asin(Mouse.Origin.lookVector.Y), 0, 0)
		RightShoulder.C0 = RightShoulderC0 * CFrame.Angles(math.asin(Mouse.Origin.lookVector.Y), 0, 0)
		if AimValue.Value == true and Speed > 2 then
			ResetAim()
		end
	end
end)

FirstReload_Anim_Track:GetMarkerReachedSignal("BoltOut"):Connect(function()
	BoltOutEvent:FireServer()
end)

FirstReload_Anim_Track:GetMarkerReachedSignal("BoltIn"):Connect(function()
	BoltIn1Event:FireServer()
end)

Reload_Anim_Track:GetMarkerReachedSignal("MagOut"):Connect(function()
	MagOutEvent:FireServer()
end)

Reload_Anim_Track:GetMarkerReachedSignal("MagIn"):Connect(function()
	MagInEvent:FireServer()
end)

Demo_Anim_Track:GetMarkerReachedSignal("MagOut"):Connect(function()
	MagOutEvent:FireServer()
end)

Demo_Anim_Track:GetMarkerReachedSignal("MagIn"):Connect(function()
	MagInEvent:FireServer()
end)

Reload_Anim_Track:GetMarkerReachedSignal("MagDrop"):Connect(function()
	MagDropEvent:FireServer()
end)

FirstReload_Anim_Track:GetMarkerReachedSignal("BoltOut"):Connect(function()
	YieldPlayAnimation(CapOutStart_Anim_Track)
	CapOut_Anim_Track:Play()
end)

BoltHit_Anim_Track:GetMarkerReachedSignal("BoltIn"):Connect(function()
	BoltIn2Event:FireServer()
end)

Humanoid.Died:Connect(function()
	if AimValue.Value == true then ResetAim() end
	script.Enabled = false
end)

FirstReloadValue.Changed:Connect(function()
	if FirstReloadValue.Value == true then
		CapOut_Anim_Track:Stop()
	end
end)
