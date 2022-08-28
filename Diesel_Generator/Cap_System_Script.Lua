local TweenService = game:GetService("TweenService")

local Button = script.Parent.Parent.Control.Button.Button

local FuelCapacityLabel = script.Parent.Parent.Control.Monitor.Lines.FuelCapacity.SurfaceGui.TextLabel
local FuelCapacityValue = script.Parent.Parent.CPU.Values.FuelCapacityValue

local Cap1 = script.Parent.Cap1
local Cap2 = script.Parent.Cap2
local Trigger = script.Parent.Trigger
local CapSound = script.Parent.Cap1.CapSound

local GasCan = script.Parent.GasCan
local GasCanDrainSound = script.Parent.GasCan.GasCanDrainSound
local Pos1 = script.Parent.Pos1
local Pos2 = script.Parent.Pos2
local Pos3 = script.Parent.Pos3

local GasCanMove1 = {
	CFrame = Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local GasCanMove2 = {
	CFrame = Pos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local GasCanMove3 = {
	CFrame = Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local GasCanMove4 = {
	CFrame = Pos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local GasCanAnimationSettings1 = TweenInfo.new(
	1.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local GasCanAnimationSettings2 = TweenInfo.new(
	6.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local GasCanAnimationSettings3 = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local GasCanMove1 = TweenService:Create(GasCan, GasCanAnimationSettings1, GasCanMove1)
local GasCanMove2 = TweenService:Create(GasCan, GasCanAnimationSettings2, GasCanMove2)
local GasCanMove3 = TweenService:Create(GasCan, GasCanAnimationSettings3, GasCanMove3)
local GasCanMove4 = TweenService:Create(GasCan, GasCanAnimationSettings3, GasCanMove4)

local CapClosed = true

Cap1.ClickDetector.MouseClick:Connect(function()
	if CapClosed == true then
		Cap1.ClickDetector.MaxActivationDistance = 0
		Cap2.ClickDetector.MaxActivationDistance = 0
		Cap1.Transparency = 1
		Cap2.Transparency = 0
		CapSound:Play()
		if FuelCapacityValue.Value == 0 then
			Trigger.CanTouch = true
		end
		wait(1)
		CapClosed = false
		Cap1.ClickDetector.MaxActivationDistance = 10
		Cap2.ClickDetector.MaxActivationDistance = 10
	end
end)

Cap1.ClickDetector.MouseClick:Connect(function()
	if CapClosed == false then
		Cap1.ClickDetector.MaxActivationDistance = 0
		Cap2.ClickDetector.MaxActivationDistance = 0
		Cap1.Transparency = 0
		Cap2.Transparency = 1
		CapSound:Play()
		Trigger.CanTouch = false
		wait(1)
		CapClosed = true
		Cap1.ClickDetector.MaxActivationDistance = 10
	end
end)

Cap2.ClickDetector.MouseClick:Connect(function()
	Cap1.ClickDetector.MaxActivationDistance = 0
	Cap2.ClickDetector.MaxActivationDistance = 0
	Cap1.Transparency = 0
	Cap2.Transparency = 1
	CapSound:Play()
	Trigger.CanTouch = false
	wait(1)
	CapClosed = true
	Cap1.ClickDetector.MaxActivationDistance = 10
end)

Trigger.Touched:connect(function(Hit)
	if Hit.Parent and Hit.Parent:FindFirstChild("GasCan") and game.Players:GetPlayerFromCharacter(Hit.Parent) then
		local Player = game.Players:GetPlayerFromCharacter(Hit.Parent)
		for i,v in pairs(Player.Backpack:GetChildren()) do
			if v.Name:sub(1,6) == "GasCan" then
				v:Destroy()
				Trigger.CanTouch = false
				Cap1.ClickDetector.MaxActivationDistance = 0
				Cap2.ClickDetector.MaxActivationDistance = 0
				GasCan.Transparency = 0
				wait(0.1)
				GasCanDrainSound:Play()
				GasCanMove1:Play()
				wait(1.5)
				GasCanMove2:Play()
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 3
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 2
				wait(0.5)
				GasCanMove3:Play()
				wait(0.5)
				GasCanMove4:Play()
				wait(0.6)
				GasCan.Transparency = 1
				local EmptyGasCan = game.ReplicatedStorage.EmptyGasCan
				local Backpack = Player.Backpack
				local EmptyGasCanClone = EmptyGasCan:Clone()
				EmptyGasCanClone.Parent = Backpack
				wait(1)
				if FuelCapacityValue.Value < 100 then
					Trigger.CanTouch = true
					Cap1.ClickDetector.MaxActivationDistance = 10
					Cap2.ClickDetector.MaxActivationDistance = 10
				else
					Button.ClickDetector.MaxActivationDistance = 10
					Cap1.ClickDetector.MaxActivationDistance = 10
					Cap2.ClickDetector.MaxActivationDistance = 10
				end
			end
		end
		for i,v in pairs(Hit.Parent:GetChildren()) do
			if v.Name:sub(1,6) == "GasCan" then
				v:Destroy()
				Trigger.CanTouch = false
				Cap1.ClickDetector.MaxActivationDistance = 0
				Cap2.ClickDetector.MaxActivationDistance = 0
				GasCan.Transparency = 0
				wait(0.1)
				GasCanDrainSound:Play()
				GasCanMove1:Play()
				wait(1.5)
				GasCanMove2:Play()
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 5
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 3
				wait(1)
				FuelCapacityValue.Value = FuelCapacityValue.Value + 2
				wait(0.5)
				GasCanMove3:Play()
				wait(0.5)
				GasCanMove4:Play()
				wait(0.6)
				GasCan.Transparency = 1
				local EmptyGasCan = game.ReplicatedStorage.EmptyGasCan
				local Backpack = Player.Backpack
				local EmptyGasCanClone = EmptyGasCan:Clone()
				EmptyGasCanClone.Parent = Backpack
				wait(1)
				if FuelCapacityValue.Value < 100 then
					Trigger.CanTouch = true
					Cap1.ClickDetector.MaxActivationDistance = 10
					Cap2.ClickDetector.MaxActivationDistance = 10
				else
					Button.ClickDetector.MaxActivationDistance = 10
					Cap1.ClickDetector.MaxActivationDistance = 10
					Cap2.ClickDetector.MaxActivationDistance = 10
				end
			end
		end
	end
end)
