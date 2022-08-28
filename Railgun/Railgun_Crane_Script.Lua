local TweenService = game:GetService("TweenService")

local WheelBase = script.Parent.WheelBase.Frame.WheelBase
local WheelBasePos1 = script.Parent.WheelBase.Frame.WheelBasePos1
local WheelBasePos2 = script.Parent.WheelBase.Frame.WheelBasePos2

local Crane = script.Parent.Crane.Crane
local CranePos1 = script.Parent.Crane.CranePos1
local CranePos2 = script.Parent.Crane.CranePos2
local CranePos3 = script.Parent.Crane.CranePos3

local Hook = script.Parent.Hook.Hook
local HookPos1 = script.Parent.Hook.HookPos1
local HookPos2 = script.Parent.Hook.HookPos2
local HookPos3 = script.Parent.Hook.HookPos3
local HookPos4 = script.Parent.Hook.HookPos4
local HookPos5 = script.Parent.Hook.HookPos5
local HookPos6 = script.Parent.Hook.HookPos6

local CraneProjectile = script.Parent.Hook.CraneProjectile
local ReloadProjectile1 = workspace.ReloadProjectileAS.ReloadProjectile1
local ReloadProjectile2 = workspace.ReloadProjectileAS.ReloadProjectile2
local ElevatorProjectile = workspace.Railgun.ProjectileElevator.Elevator.ElevatorProjectile
local ReloadButton = workspace.RailgunConsole.Button1.Button

local WheelBaseMove1 = {
	CFrame = WheelBasePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local WheelBaseMove2 = {
	CFrame = WheelBasePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local CraneMove1 = {
	CFrame = CranePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local CraneMove2 = {
	CFrame = CranePos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local CraneMove3 = {
	CFrame = CranePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local CraneMove4 = {
	CFrame = CranePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local HookMove1 = {
	CFrame = HookPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HookMove2 = {
	CFrame = HookPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HookMove3 = {
	CFrame = HookPos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HookMove4 = {
	CFrame = HookPos5.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HookMove5 = {
	CFrame = HookPos6.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HookMove6 = {
	CFrame = HookPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local WheelBaseAnimationSettings = TweenInfo.new(
	10,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local CraneAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local WheelBaseMove1 = TweenService:Create(WheelBase, WheelBaseAnimationSettings, WheelBaseMove1)
local WheelBaseMove2 = TweenService:Create(WheelBase, WheelBaseAnimationSettings, WheelBaseMove2)

local CraneMove1 = TweenService:Create(Crane, WheelBaseAnimationSettings, CraneMove1)
local CraneMove2 = TweenService:Create(Crane, CraneAnimationSettings, CraneMove2)
local CraneMove3 = TweenService:Create(Crane, CraneAnimationSettings, CraneMove3)
local CraneMove4 = TweenService:Create(Crane, WheelBaseAnimationSettings, CraneMove4)

local HookMove1 = TweenService:Create(Hook, WheelBaseAnimationSettings, HookMove1)
local HookMove2 = TweenService:Create(Hook, CraneAnimationSettings, HookMove2)
local HookMove3 = TweenService:Create(Hook, CraneAnimationSettings, HookMove3)
local HookMove4 = TweenService:Create(Hook, CraneAnimationSettings, HookMove4)
local HookMove5 = TweenService:Create(Hook, CraneAnimationSettings, HookMove5)
local HookMove6 = TweenService:Create(Hook, WheelBaseAnimationSettings, HookMove6)

ReloadButton.ClickDetector.MouseClick:Connect(function()
	ReloadButton.ClickDetector.MaxActivationDistance = 0
	WheelBaseMove1:Play()
	CraneMove1:Play()
	HookMove1:Play()
	wait(11)
	HookMove2:Play()
	wait(4)
	CraneProjectile.Transparency = 0
	wait(1)
	HookMove3:Play()
	wait(5)
	HookMove4:Play()
	CraneMove2:Play()
	wait(5)
	HookMove5:Play()
	wait(13)
	CraneProjectile.Transparency = 1
	ElevatorProjectile.Transparency = 0
	HookMove4:Play()
	wait(5)
	CraneMove3:Play()
	HookMove3:Play()
	wait(5)
	WheelBaseMove2:Play()
	CraneMove4:Play()
	HookMove6:Play()
end)

ReloadButton.ClickDetector.MouseClick:Connect(function()
	wait(15)
	if ReloadProjectile1.ReloadProjectile1Value.Value == 1 then
		ReloadProjectile1.Transparency = 1
	end
	if ReloadProjectile2.ReloadProjectile2Value.Value == 1 then
		ReloadProjectile2.Transparency = 1
	end
end)
