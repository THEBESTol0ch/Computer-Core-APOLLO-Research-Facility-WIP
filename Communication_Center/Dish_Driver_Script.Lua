local TweenService = game:GetService("TweenService")

local DishDriverStatusValue = script.Parent.Parent.Parent.CPU.Values.DishDriverStatusValue
local DishDriverControlValue = script.Parent.Parent.Parent.CPU.Values.DishDriverControlValue
local Lamp1ControlValue = script.Parent.Parent.Parent.CPU.Values.Lamp1ControlValue
local Lamp2ControlValue = script.Parent.Parent.Parent.CPU.Values.Lamp2ControlValue
local LampsControlValue = script.Parent.Parent.Parent.CPU.Values.LampsControlValue

local HeadSmallLamp = script.Parent.Parent.Parent.Head.SmallLamp.Lamp
local HeadMainFrame = script.Parent.Parent.Parent.Head.MainFrame
local HeadMainFramePos1 = script.Parent.Parent.Parent.Head.Pos1
local HeadMainFramePos2 = script.Parent.Parent.Parent.Head.Pos2
local HeadMainFramePos3 = script.Parent.Parent.Parent.Head.Pos3

local FakeRotorMainFrame = script.Parent.Parent.Parent.FakeRotor.MainFrame
local FakeRotorFrame = script.Parent.Parent.Parent.FakeRotor.Frame
local FakeRotorMainFramePos1 = script.Parent.Parent.Parent.FakeRotor.Pos1
local FakeRotorMainFramePos2 = script.Parent.Parent.Parent.FakeRotor.Pos2
local FakeRotorMainFramePos3 = script.Parent.Parent.Parent.FakeRotor.Pos3
local FakeRotorMainFramePos4 = script.Parent.Parent.Parent.FakeRotor.Pos4

local FakeRails = script.Parent.Parent.Parent.FakeRails.Rails
local FakeRailsPos1 = script.Parent.Parent.Parent.FakeRails.Pos1
local FakeRailsPos2 = script.Parent.Parent.Parent.FakeRails.Pos2
local FakeRailsPos3 = script.Parent.Parent.Parent.FakeRails.Pos3

local RotorMainFrame = script.Parent.Parent.Parent.Rotor.MainFrame
local RotorFrame = script.Parent.Parent.Parent.Rotor.Frame

local Pipe = script.Parent.Parent.Parent.Pipe.Pipe
local PipePos1 = script.Parent.Parent.Parent.Pipe.Pos1
local PipePos2 = script.Parent.Parent.Parent.Pipe.Pos2
local PipePos3 = script.Parent.Parent.Parent.Pipe.Pos3
local PipePos4 = script.Parent.Parent.Parent.Pipe.Pos4

local DishDriverStartSound = script.Parent.Parent.Parent.Emitter.DishDriverStartSound
local DishDriverLoopSound = script.Parent.Parent.Parent.Emitter.DishDriverLoopSound
local DishDriverStopSound = script.Parent.Parent.Parent.Emitter.DishDriverStopSound

local CombustionChamber = script.Parent.Parent.Parent.CombustionChamber
local CombustionChamberSpotlight = script.Parent.Parent.Parent.Emitter.SpotLight

local SmallGear = workspace.DishGearDriver.SmallGearSystem.Gear.Rotor
local LargeGear = workspace.DishGearDriver.LargeGearSystem.Gear.Rotor

local Lable = workspace.SatelliteDishMaintenanceMonitor.Monitor.Lines.DishDriver.SurfaceGui.TextLabel

local PipeMove1 = {
	CFrame = PipePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local PipeMove2 = {
	CFrame = PipePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local PipeMove3 = {
	CFrame = PipePos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local PipeMove4 = {
	CFrame = PipePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local PipeMove5 = {
	CFrame = PipePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local PipeMove6 = {
	CFrame = PipePos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local HeadMainFrameMove1 = {
	CFrame = HeadMainFramePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HeadMainFrameMove2 = {
	CFrame = HeadMainFramePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HeadMainFrameMove3 = {
	CFrame = HeadMainFramePos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local HeadMainFrameMove4 = {
	CFrame = HeadMainFramePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FakeRotorMainFrameMove1 = {
	CFrame = FakeRotorMainFramePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRotorMainFrameMove2 = {
	CFrame = FakeRotorMainFramePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRotorMainFrameMove3 = {
	CFrame = FakeRotorMainFramePos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRotorMainFrameMove4 = {
	CFrame = FakeRotorMainFramePos4.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRotorMainFrameMove5 = {
	CFrame = FakeRotorMainFramePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FakeRailsMove1 = {
	CFrame = FakeRailsPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRailsMove2 = {
	CFrame = FakeRailsPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRailsMove3 = {
	CFrame = FakeRailsPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRailsMove4 = {
	CFrame = FakeRailsPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FakeRailsMove5 = {
	CFrame = FakeRailsPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local S2AnimationSettings = TweenInfo.new(
	2,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local S3AnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local S5AnimationSettings = TweenInfo.new(
	5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local CombustionChamberAnimationSettings = TweenInfo.new(
	5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local CombustionChamberPropertiesStart = {
	Transparency = 0
}
local CombustionChamberSpotlightPropertiesStart = {
	Brightness = 40
}
local CombustionChamberPropertiesEnd = {
	Transparency = 1
}
local CombustionChamberSpotlightPropertiesEnd = {
	Brightness = 0
}

local PipeMove1 = TweenService:Create(Pipe, S2AnimationSettings, PipeMove1)
local PipeMove2 = TweenService:Create(Pipe, S5AnimationSettings, PipeMove2)
local PipeMove3 = TweenService:Create(Pipe, S3AnimationSettings, PipeMove3)
local PipeMove4 = TweenService:Create(Pipe, S3AnimationSettings, PipeMove4)
local PipeMove5 = TweenService:Create(Pipe, S5AnimationSettings, PipeMove5)
local PipeMove6 = TweenService:Create(Pipe, S2AnimationSettings, PipeMove6)

local HeadMainFrameMove1 = TweenService:Create(HeadMainFrame, S5AnimationSettings, HeadMainFrameMove1)
local HeadMainFrameMove2 = TweenService:Create(HeadMainFrame, S3AnimationSettings, HeadMainFrameMove2)
local HeadMainFrameMove3 = TweenService:Create(HeadMainFrame, S5AnimationSettings, HeadMainFrameMove3)
local HeadMainFrameMove4 = TweenService:Create(HeadMainFrame, S3AnimationSettings, HeadMainFrameMove4)

local FakeRotorMainFrameMove1 = TweenService:Create(FakeRotorMainFrame, S3AnimationSettings, FakeRotorMainFrameMove1)
local FakeRotorMainFrameMove2 = TweenService:Create(FakeRotorMainFrame, S2AnimationSettings, FakeRotorMainFrameMove2)
local FakeRotorMainFrameMove3 = TweenService:Create(FakeRotorMainFrame, S2AnimationSettings, FakeRotorMainFrameMove3)
local FakeRotorMainFrameMove4 = TweenService:Create(FakeRotorMainFrame, S3AnimationSettings, FakeRotorMainFrameMove4)
local FakeRotorMainFrameMove5 = TweenService:Create(FakeRotorMainFrame, S3AnimationSettings, FakeRotorMainFrameMove5)

local FakeRailsMove1 = TweenService:Create(FakeRails, S2AnimationSettings, FakeRailsMove1)
local FakeRailsMove2 = TweenService:Create(FakeRails, S2AnimationSettings, FakeRailsMove2)
local FakeRailsMove3 = TweenService:Create(FakeRails, S2AnimationSettings, FakeRailsMove3)
local FakeRailsMove4 = TweenService:Create(FakeRails, S3AnimationSettings, FakeRailsMove4)
local FakeRailsMove5 = TweenService:Create(FakeRails, S3AnimationSettings, FakeRailsMove5)

local CombustionChamberStart = TweenService:Create(CombustionChamber, CombustionChamberAnimationSettings, CombustionChamberPropertiesStart)
local CombustionChamberSpotlightStart = TweenService:Create(CombustionChamberSpotlight, CombustionChamberAnimationSettings, CombustionChamberSpotlightPropertiesStart)
local CombustionChamberEnd = TweenService:Create(CombustionChamber, CombustionChamberAnimationSettings, CombustionChamberPropertiesEnd)
local CombustionChamberSpotlightEnd = TweenService:Create(CombustionChamberSpotlight, CombustionChamberAnimationSettings, CombustionChamberSpotlightPropertiesEnd)

while true do
	if DishDriverControlValue.Value == 1 and DishDriverStatusValue.Value == 0 then
		DishDriverControlValue.Value = 3
		Lamp1ControlValue.Value = 1
		Lable.Text = ("STARTNING UP...")
		Lable.TextColor3 = Color3.new(1, 0.666667, 0)
		wait(5)
		PipeMove1:Play()
		wait(2.5)
		PipeMove2:Play()
		HeadMainFrameMove1:Play()
		wait(5.5)
		FakeRotorMainFrameMove1:Play()
		wait(3.5)
		FakeRotorMainFrameMove2:Play()
		FakeRailsMove1:Play()
		wait(2.5)
		FakeRotorMainFrameMove3:Play()
		FakeRailsMove2:Play()
		HeadMainFrameMove2:Play()
		PipeMove3:Play()
		DishDriverStartSound:Play()
		wait(3.5)
		FakeRotorMainFrame.Transparency = 1
		FakeRotorFrame.Transparency = 1
		FakeRails.Transparency = 1
		RotorMainFrame.Transparency = 0
		RotorFrame.Transparency = 0
		RotorMainFrame.HingeConstraint.AngularVelocity = -8
		SmallGear.HingeConstraint.AngularVelocity = 7
		LargeGear.HingeConstraint.AngularVelocity = 4
		Lamp1ControlValue.Value = 0
		Lamp2ControlValue.Value = 1
		LampsControlValue.Value = 1
		CombustionChamberStart:Play()
		CombustionChamberSpotlightStart:Play()
		DishDriverStatusValue.Value = 1
		Lable.Text = ("ONLINE")
		Lable.TextColor3 = Color3.new(0, 1, 0)
		wait(10.5)
		DishDriverLoopSound:Play()
	end
	if DishDriverControlValue.Value == 0 and DishDriverStatusValue.Value == 1 then
		DishDriverControlValue.Value = 3
		DishDriverStatusValue.Value = 0
		Lamp1ControlValue.Value = 1
		LampsControlValue.Value = 0
		Lable.Text = ("SHUTING DOWN...")
		Lable.TextColor3 = Color3.new(1, 0.666667, 0)
		wait(1)
		DishDriverLoopSound:Stop()
		DishDriverStopSound:Play()
		wait(1)
		CombustionChamberEnd:Play()
		CombustionChamberSpotlightEnd:Play()
		wait(11)
		RotorMainFrame.HingeConstraint.AngularVelocity = 0
		SmallGear.HingeConstraint.AngularVelocity = 0
		LargeGear.HingeConstraint.AngularVelocity = 0
		wait(3)
		Lamp2ControlValue.Value = 0
		FakeRotorMainFrame.Transparency = 0
		FakeRotorFrame.Transparency = 0
		FakeRails.Transparency = 0
		RotorMainFrame.Transparency = 1
		RotorFrame.Transparency = 1
		HeadMainFrameMove4:Play()
		PipeMove4:Play()
		FakeRotorMainFrameMove5:Play()
		FakeRailsMove4:Play()
		wait(3.5)
		FakeRotorMainFrameMove1:Play()
		FakeRailsMove5:Play()
		wait(3.5)
		FakeRotorMainFrameMove4:Play()
		wait(3.5)
		PipeMove5:Play()
		HeadMainFrameMove3:Play()
		wait(5.5)
		PipeMove6:Play()
		wait(2.5)
		Lamp1ControlValue.Value = 0
		Lable.Text = ("OFFLINE")
		Lable.TextColor3 = Color3.new(1, 0, 0)
	end
	wait(0.1)
end
