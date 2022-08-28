local TweenService = game:GetService("TweenService")

local Handle1 = script.Parent.Handle1
local HandleHinge = script.Parent.PrimaryPart
local Handle2 = script.Parent.Handle2
local Handle2Pos = script.Parent.Handle2Pos
local LeverSound = script.Parent.SoundEmitter.LeverSound

local RedLamp = script.Parent.RedLamp.Lamp
local GreenLamp = script.Parent.GreenLamp.Lamp
local StatusLabel1 = workspace.AlphaCoreMonitor.Monitor.Lines.StatusLabel.SurfaceGui.TextLabel
local StatusLabel2 = workspace.AlphaCoreConsoleMonitor.Lines.StatusLabel.SurfaceGui.TextLabel
local StatusLabel3 = workspace.CRCPurgeSystemMonitor.Monitor.Lines.AlphaCoreStatusLabel.SurfaceGui.TextLabel
local StatusLabel4 = workspace.CRCPurgeSystemConsoleMonitor.Lines.AlphaCoreStatusLabel.SurfaceGui.TextLabel
local StatusLamp = workspace.CRCAdvancedLever.Lamps.Lamp1.Lamp

local DischargerStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerStatusValue
local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargerStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargerStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargerStatusValue
local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
local DischargeControlValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargeControlValue
local DischargeLockValue = workspace.CentralReactorCore.CentralCore.CPU.Values.DischargeLockValue

local AlphaDischargerPrimeStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.DischargerPrimeStatusValue
local BetaDischargerPrimeStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.DischargerPrimeStatusValue
local GammaDischargerPrimeStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.DischargerPrimeStatusValue
local DeltaDischargerPrimeStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.DischargerPrimeStatusValue

local AlphaKeyCapValue = workspace.AlphaCoreLockConsole.KWB1.CPU.Values.KeyCapValue
local BetaKeyCapValue = workspace.BetaCoreLockConsole.KWB1.CPU.Values.KeyCapValue
local GammaKeyCapValue = workspace.GammaCoreLockConsole.KWB1.CPU.Values.KeyCapValue
local DeltaKeyCapValue = workspace.DeltaCoreLockConsole.KWB1.CPU.Values.KeyCapValue

local CoreOverloadSound = workspace.CentralReactorCore.AlphaCore.SoundEmitter.CoreOverloadSound

local CRCPurgeAdvancedButton = workspace.CRCPurgeAdvancedButton.Button.Trigger

local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue

local Button = workspace.CRCConsole.EmergencyButton.Button

local Handle2Down = {
	CFrame = Handle2Pos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local Handle2Up = {
	CFrame = Handle2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LeverAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeverDown = TweenService:Create(HandleHinge, LeverAnimationSettings, {
	CFrame = HandleHinge.CFrame * CFrame.Angles(math.rad(-79.89), 0, 0)
})
local LeverUp = TweenService:Create(HandleHinge, LeverAnimationSettings, {
	CFrame = HandleHinge.CFrame * CFrame.Angles(math.rad(-0), 0, 0)
})

local Handle2Down = TweenService:Create(Handle2, LeverAnimationSettings, Handle2Down)
local Handle2Up = TweenService:Create(Handle2, LeverAnimationSettings, Handle2Up)

local CanEvent1 = true
local CanEvent2 = true

Handle1.ClickDetector.MouseClick:Connect(function()
	Handle1.ClickDetector.MaxActivationDistance = 0
	DischargeLockValue.Value = 1
	AlphaKeyCapValue.Value = 2
	AlphaCoreStatusValue.Value = 3
	BetaCoreStatusValue.Value = 3
	GammaCoreStatusValue.Value = 3
	DeltaCoreStatusValue.Value = 3
	LeverDown:Play()
	Handle2Down:Play()
	LeverSound:Play()
	wait(1)
	LeverUp:Play()
	Handle2Up:Play()
	RedLamp.Material = ("Neon")
	GreenLamp.Material = ("Plastic")
	
	CoreOverloadSound:Play()
	StatusLabel1.Text = ("PRIMING")
	StatusLabel1.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel2.Text = ("PRIMING")
	StatusLabel2.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel3.Text = ("PRIMING")
	StatusLabel3.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel4.Text = ("PRIMING")
	StatusLabel4.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(8.1)
	CentralReactorCoreStatusValue.Value = CentralReactorCoreStatusValue.Value + 1
	AlphaDischargerPrimeStatusValue.Value = 1
	AlphaCoreStatusValue.Value = 2
	BetaCoreStatusValue.Value = 2
	GammaCoreStatusValue.Value = 2
	DeltaCoreStatusValue.Value = 2
	DischargeControlValue.Value = 1
	StatusLabel1.Text = ("PRIMED")
	StatusLabel1.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel2.Text = ("PRIMED")
	StatusLabel2.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel3.Text = ("PRIMED")
	StatusLabel3.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel4.Text = ("PRIMED")
	StatusLabel4.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLamp.BrickColor = BrickColor.new("Neon orange")
	DischargeLockValue.Value = 0
	wait(1)
	if AlphaDischargerPrimeStatusValue.Value == 0 then
		AlphaKeyCapValue.Value = 1
	end
	if BetaDischargerPrimeStatusValue.Value == 0 then
		BetaKeyCapValue.Value = 1
	end
	if GammaDischargerPrimeStatusValue.Value == 0 then
		GammaKeyCapValue.Value = 1
	end
	if DeltaDischargerPrimeStatusValue.Value == 0 then
		DeltaKeyCapValue.Value = 1
	end
end)

CRCPurgeAdvancedButton.ClickDetector.MouseClick:Connect(function()
	StatusLabel1.Text = ("PURGE IN PROGRESS")
	StatusLabel1.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel2.Text = ("PURGE IN PROGRESS")
	StatusLabel2.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel3.Text = ("PURGE IN PROGRESS")
	StatusLabel3.TextColor3 = Color3.new(1, 0.666667, 0)
	StatusLabel4.Text = ("PURGE IN PROGRESS")
	StatusLabel4.TextColor3 = Color3.new(1, 0.666667, 0)
	wait(19.4)
	CanEvent2 = true
end)

Button.ClickDetector.MouseClick:Connect(function()
	CanEvent2 = false
end)

while true do
	if EnergyCapacityValue.Value >= 110000 and CanEvent1 == true and AlphaCoreStatusValue.Value >= 1 and BetaCoreStatusValue.Value >= 1 and GammaCoreStatusValue.Value >= 1 and DeltaCoreStatusValue.Value >= 1 then
		CanEvent1 = false
		StatusLabel1.Text = ("READY TO PRIME")
		StatusLabel1.TextColor3 = Color3.new(1, 0.666667, 0)
		StatusLabel2.Text = ("READY TO PRIME")
		StatusLabel2.TextColor3 = Color3.new(1, 0.666667, 0)
		StatusLabel3.Text = ("READY TO PRIME")
		StatusLabel3.TextColor3 = Color3.new(1, 0.666667, 0)
		StatusLabel4.Text = ("READY TO PRIME")
		StatusLabel4.TextColor3 = Color3.new(1, 0.666667, 0)
	end
	if EnergyCapacityValue.Value < 100000 and CanEvent1 == false then
		CanEvent1 = true
		StatusLabel1.Text = ("ONLINE")
		StatusLabel1.TextColor3 = Color3.new(0, 1, 0)
		StatusLabel2.Text = ("ONLINE")
		StatusLabel2.TextColor3 = Color3.new(0, 1, 0)
		StatusLabel3.Text = ("ONLINE")
		StatusLabel3.TextColor3 = Color3.new(0, 1, 0)
		StatusLabel4.Text = ("ONLINE")
		StatusLabel4.TextColor3 = Color3.new(0, 1, 0)
	end
	if CentralReactorCoreStatusValue.Value == 0 and CanEvent2 == true then
		StatusLabel1.Text = ("OFFLINE")
		StatusLabel1.TextColor3 = Color3.new(1, 0, 0)
		StatusLabel2.Text = ("OFFLINE")
		StatusLabel2.TextColor3 = Color3.new(1, 0, 0)
		StatusLabel3.Text = ("OFFLINE")
		StatusLabel3.TextColor3 = Color3.new(1, 0, 0)
		StatusLabel4.Text = ("OFFLINE")
		StatusLabel4.TextColor3 = Color3.new(1, 0, 0)
	end
	wait(0.1)
end
