-- Control

--

-- Values
local AlphaCoreIntegrityValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.IntegrityValue
local BetaCoreIntegrityValue = workspace.CentralReactorCore.BetaCore.CPU.Values.IntegrityValue
local GammaCoreIntegrityValue = workspace.CentralReactorCore.GammaCore.CPU.Values.IntegrityValue
local DeltaCoreIntegrityValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.IntegrityValue

local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.CoreStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.CoreStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.CoreStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.CoreStatusValue

local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue
local TemperatureValue = workspace.CentralReactorCore.CentralCore.CPU.Values.TemperatureValue
local IntegrityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.IntegrityValue
local EnergyCapacityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.EnergyCapacityValue
--

-- Items
local SoundEmitter = script.Parent.SoundEmitter
--

-- Logic
local CanEvent1 = true
local CanEvent2 = true
--

AlphaCoreIntegrityValue.Changed:Connect(function()
	if AlphaCoreIntegrityValue.Value <= 75 and AlphaCoreIntegrityValue.Value > 50 then
		SoundEmitter.AlphaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif AlphaCoreIntegrityValue.Value <= 50 and AlphaCoreIntegrityValue.Value > 25 then
		SoundEmitter.AlphaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif AlphaCoreIntegrityValue.Value <= 25 and AlphaCoreIntegrityValue.Value > 0 then
		SoundEmitter.AlphaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.AlphaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterWarningAlarm.Button.Material = ("Neon")
	elseif AlphaCoreIntegrityValue.Value <= 0 then
		SoundEmitter.AlphaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.AlphaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterWarningAlarm.Button.Material = ("Neon")
	end
end)

BetaCoreIntegrityValue.Changed:Connect(function()
	if BetaCoreIntegrityValue.Value <= 75 and BetaCoreIntegrityValue.Value > 50 then
		SoundEmitter.BetaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.BetaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif BetaCoreIntegrityValue.Value <= 50 and BetaCoreIntegrityValue.Value > 25 then
		SoundEmitter.BetaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.BetaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif BetaCoreIntegrityValue.Value <= 25 and BetaCoreIntegrityValue.Value > 0 then
		SoundEmitter.BetaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.BetaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.BetaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.BetaCoreMasterWarningAlarm.Button.Material = ("Neon")
	elseif BetaCoreIntegrityValue.Value <= 0 then
		SoundEmitter.BetaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.BetaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.BetaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.BetaCoreMasterWarningAlarm.Button.Material = ("Neon")
	end
end)

GammaCoreIntegrityValue.Changed:Connect(function()
	if GammaCoreIntegrityValue.Value <= 75 and GammaCoreIntegrityValue.Value > 50 then
		SoundEmitter.GammaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.GammaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif GammaCoreIntegrityValue.Value <= 50 and GammaCoreIntegrityValue.Value > 25 then
		SoundEmitter.GammaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.GammaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif GammaCoreIntegrityValue.Value <= 25 and GammaCoreIntegrityValue.Value > 0 then
		SoundEmitter.GammaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.GammaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.GammaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.GammaCoreMasterWarningAlarm.Button.Material = ("Neon")
	elseif GammaCoreIntegrityValue.Value <= 0 then
		SoundEmitter.GammaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.GammaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.GammaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.GammaCoreMasterWarningAlarm.Button.Material = ("Neon")
	end
end)

DeltaCoreIntegrityValue.Changed:Connect(function()
	if DeltaCoreIntegrityValue.Value <= 75 and DeltaCoreIntegrityValue.Value > 50 then
		SoundEmitter.DeltaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif DeltaCoreIntegrityValue.Value <= 50 and DeltaCoreIntegrityValue.Value > 25 then
		SoundEmitter.DeltaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterCautionAlarm.Button.Material = ("Neon")
	elseif DeltaCoreIntegrityValue.Value <= 25 and DeltaCoreIntegrityValue.Value > 0 then
		SoundEmitter.DeltaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.DeltaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterWarningAlarm.Button.Material = ("Neon")
	elseif DeltaCoreIntegrityValue.Value <= 0 then
		SoundEmitter.DeltaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterCautionAlarm.Button.Material = ("Neon")
		SoundEmitter.DeltaCoreMasterWarningAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterWarningAlarm.Button.Material = ("Neon")
	end
end)

AlphaCoreStatusValue.Changed:Connect(function()
	if AlphaCoreStatusValue.Value == "PRIMED" then
		SoundEmitter.AlphaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.AlphaCoreMasterCautionAlarm.Button.Material = ("Neon")
	end
end)

BetaCoreStatusValue.Changed:Connect(function()
	if BetaCoreStatusValue.Value == "PRIMED" then
		SoundEmitter.BetaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.BetaCoreMasterCautionAlarm.Button.Material = ("Neon")
	end
end)

GammaCoreStatusValue.Changed:Connect(function()
	if GammaCoreStatusValue.Value == "PRIMED" then
		SoundEmitter.GammaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.GammaCoreMasterCautionAlarm.Button.Material = ("Neon")
	end
end)

DeltaCoreStatusValue.Changed:Connect(function()
	if DeltaCoreStatusValue.Value == "PRIMED" then
		SoundEmitter.DeltaCoreMasterCautionAlarm:Play()
		script.Parent.Parent.DeltaCoreMasterCautionAlarm.Button.Material = ("Neon")
	end
end)

CentralReactorCoreStatusValue.Changed:Connect(function()
	SoundEmitter.ReactorStatusMasterWarningAlarm:Play()
	script.Parent.Parent.ReactorStatusMasterWarningAlarm.Button.Material = ("Neon")
end)

TemperatureValue.Changed:Connect(function()
	if TemperatureValue.Value > 3000 and CanEvent1 == true then
		CanEvent1 = false
		SoundEmitter.ReactorTemperatureMasterWarningAlarm:Play()
		script.Parent.Parent.ReactorTemperatureMasterWarningAlarm.Button.Material = ("Neon")
	elseif TemperatureValue.Value < 3000 then
		CanEvent1 = true
	end
end)

IntegrityValue.Changed:Connect(function()
	if IntegrityValue.Value == 75 then
		SoundEmitter.ReactorIntegrityMasterWarningAlarm:Play()
		script.Parent.Parent.ReactorIntegrityMasterWarningAlarm.Button.Material = ("Neon")
	elseif IntegrityValue.Value == 50 then
		SoundEmitter.ReactorIntegrityMasterWarningAlarm:Play()
		script.Parent.Parent.ReactorIntegrityMasterWarningAlarm.Button.Material = ("Neon")
	elseif IntegrityValue.Value == 25 then
		SoundEmitter.ReactorIntegrityMasterWarningAlarm:Play()
		script.Parent.Parent.ReactorIntegrityMasterWarningAlarm.Button.Material = ("Neon")
	elseif IntegrityValue.Value == 0 then
		SoundEmitter.ReactorIntegrityMasterWarningAlarm:Play()
		script.Parent.Parent.ReactorIntegrityMasterWarningAlarm.Button.Material = ("Neon")
		wait(20)
		SoundEmitter.EvacMasterWarningAlarm:Play()
		script.Parent.Parent.EvacMasterWarningAlarm.Button.Material = ("Neon")
	end
end)

EnergyCapacityValue.Changed:Connect(function()
	if EnergyCapacityValue.Value > 110000 and CanEvent2 == true then
		CanEvent2 = false
		SoundEmitter.EnergyCapacityMasterCautionAlarm:Play()
		script.Parent.Parent.EnergyCapacityMasterCautionAlarm.Button.Material = ("Neon")
	elseif EnergyCapacityValue.Value < 100000 then
		CanEvent2 = true
	end
end)
