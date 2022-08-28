local TweenService = game:GetService("TweenService")

local Trap = script.Parent.Parent.Parent.Frame
local TrapPos1 = script.Parent.Parent.Parent.TrapPos1
local TrapPos2 = script.Parent.Parent.Parent.TrapPos2
local TrapPos3 = script.Parent.Parent.Parent.TrapPos3
local TrapTrigger = script.Parent.Parent.Parent.TrapTrigger

local TrapControlValue = script.Parent.Parent.Values.TrapControlValue
local DoorStatusValue = workspace.ComputerCoreApollo.Door.CPU.Values.DoorStatusValue

local BridgeStatusLabel = workspace.ApolloMonitor.Lines.BridgeStatus.SurfaceGui.TextLabel

local TrapMoveForward = {
	CFrame = TrapPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local TrapMoveBackward = {
	CFrame = TrapPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local TrapMoveMiddle = {
	CFrame = TrapPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local TrapAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local TrapMoveForward = TweenService:Create(Trap, TrapAnimationSettings, TrapMoveForward)
local TrapMoveBackward = TweenService:Create(Trap, TrapAnimationSettings, TrapMoveBackward)
local TrapMoveMiddle = TweenService:Create(Trap, TrapAnimationSettings, TrapMoveMiddle)

local CanOpen = true

TrapTrigger.Touched:Connect(function()
	if CanOpen == true then
		CanOpen = false
		TrapControlValue.Value = 1
		wait(4)
		CanOpen = true
		if DoorStatusValue.Value == 0 then
			TrapControlValue.Value = 3
		end
		if DoorStatusValue.Value == 1 then
			TrapControlValue.Value = 2
		end
	end
end)

while true do
	if TrapControlValue.Value == 2 then
		TrapControlValue.Value = 4
		TrapMoveMiddle:Play()
		BridgeStatusLabel.Text = ("POS2")
		BridgeStatusLabel.TextColor3 = Color3.new(0, 1, 0)
	end
	if TrapControlValue.Value == 3 then
		TrapControlValue.Value = 4
		TrapMoveForward:Play()
		BridgeStatusLabel.Text = ("POS3")
		BridgeStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	if TrapControlValue.Value == 1 then
		TrapControlValue.Value = 4
		TrapMoveBackward:Play()
		BridgeStatusLabel.Text = ("POS1")
		BridgeStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	wait(0.1)
end
