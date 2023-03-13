-- Control
local OverloadButton = workspace.OverloadConsole.EmergencyButton.Button
local Lever = workspace.ReactorSpeedLever.Lever.Trigger
--

-- Parts
local LeftPartOfReactor = workspace.ThermonuclearReactor.Flywheels.LeftFlywheel.LeftPartOfReactor
local RightPartOfReactor = workspace.ThermonuclearReactor.Flywheels.RightFlywheel.RightPartOfReactor

local Lightning1 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning1
local Lightning2 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning2
local Lightning3 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning3
local Lightning4 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning4
local Lightning5 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning5
local Lightning6 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning6
local Lightning7 = workspace.ThermonuclearReactor.Lightning.MainLightning.Lightning7
--

-- Sounds
local FlyWheelRotatingSoundVeryHigh = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundVeryHigh
local FlyWheelRotatingSoundHigh = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundHigh
local FlyWheelRotatingSoundNormal = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundNormal
local FlyWheelRotatingSoundLow = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundLow
local FlyWheelRotatingSoundVeryLow = workspace.ThermonuclearReactor.SoundEmitter.FlyWheelRotatingSoundVeryLow
local ElectricDischargeSound1 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound1
local ElectricDischargeSound2 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound2
local ElectricDischargeSound3 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound3
local ElectricDischargeSound4 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound4
local ElectricDischargeSound5 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound5
local ElectricDischargeSound6 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound6
local ElectricDischargeSound7 = workspace.ThermonuclearReactor.SoundEmitter.ElectricDischargeSound7
--

-- Values
local ReactorStatusValue = workspace.ThermonuclearReactor.CPU.Values.ReactorStatusValue
local ReactorTemperatureValue = workspace.ThermonuclearReactor.CPU.Values.ReactorTemperatureValue
local RPMValue = workspace.ThermonuclearReactor.CPU.Values.RPMValue
local OutputEnergyValue = workspace.ThermonuclearReactor.CPU.Values.OutputEnergyValue
local FuelCapacityValue = workspace.FuelSystem.CPU.Values.FuelCapacityValue
local LeverPositionValue = script.Parent.Parent.Values.LeverPositionValue
local SuperchargerStatusValue = workspace.ThermonuclearReactor.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.FuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.FuseSystem.CPU.Values.FuseSystemStatusValue
--

-- Logic
local LeverAtCriticalPos = false

local ElectricalDischarge1 = false
local ElectricalDischarge2 = false
local ElectricalDischarge3 = false
local ElectricalDischarge4 = false
local ElectricalDischarge5 = false
--

-- Lever Moving To Pos 5 Forward
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 5 and LeverAtCriticalPos == false then
		LeverAtCriticalPos = true
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 27
		RightPartOfReactor.HingeConstraint.AngularVelocity = 27
		FlyWheelRotatingSoundVeryHigh:Play()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = true
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(0.2)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(0.2)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.2)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(0.2)
		until
		ElectricalDischarge5 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 5 and LeverAtCriticalPos == false then
		repeat
			RPMValue.Value = RPMValue.Value + 1874
			wait(0.1)
		until
		RPMValue.Value > 21904 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 5 and LeverAtCriticalPos == false then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value + 84
			wait(0.1)
		until
		OutputEnergyValue.Value > 2944 or ReactorStatusValue.Value == 0
	end
end)
--

-- Lever Moving To Pos 4 Forward
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 4 then
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 25
		RightPartOfReactor.HingeConstraint.AngularVelocity = 25
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Play()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = true
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(0.2)
		until
		ElectricalDischarge4 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 4 then
		repeat
			RPMValue.Value = RPMValue.Value + 1874
			wait(0.1)
		until
		RPMValue.Value > 18650 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 4 then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value + 84
			wait(0.1)
		until
		OutputEnergyValue.Value > 1472 or ReactorStatusValue.Value == 0
	end
end)
--

-- Lever Moving To Pos 3 Forward
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 3 then
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 10
		RightPartOfReactor.HingeConstraint.AngularVelocity = 10
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Play()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = true
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.7)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.5)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(1)
		until
		ElectricalDischarge3 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 3 then
		repeat
			RPMValue.Value = RPMValue.Value + 1874
			wait(0.1)
		until
		RPMValue.Value > 16578 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 3 then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value + 84
			wait(0.1)
		until
		OutputEnergyValue.Value > 736 or ReactorStatusValue.Value == 0
	end
end)
--

-- Lever Moving To Pos 2 Forward
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 2 then
		LeverAtCriticalPos = false
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 6
		RightPartOfReactor.HingeConstraint.AngularVelocity = 6
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Play()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = true
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(1.1)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.5)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(1.1)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.8)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(1.1)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.6)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(1.1)
		until
		ElectricalDischarge2 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 2 then
		repeat
			RPMValue.Value = RPMValue.Value + 1874
			wait(0.1)
		until
		RPMValue.Value > 14987 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.MouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 2 then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value + 84
			wait(0.1)
		until
		OutputEnergyValue.Value > 368 or ReactorStatusValue.Value == 0
	end
end)
--



-- Lever Moving To Pos 4 Backward
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 4 then
		LeverAtCriticalPos = false
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 25
		RightPartOfReactor.HingeConstraint.AngularVelocity = 25
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Play()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = true
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(0.3)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(0.2)
		until
		ElectricalDischarge4 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 4 then
		repeat
			RPMValue.Value = RPMValue.Value - 937
			wait(0.1)
		until
		RPMValue.Value < 18650 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 4 then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value - 28
			wait(0.1)
		until
		OutputEnergyValue.Value < 1472 or ReactorStatusValue.Value == 0
	end
end)
--

-- Lever Moving To Pos 3 Backward
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 3 then
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 10
		RightPartOfReactor.HingeConstraint.AngularVelocity = 10
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Play()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = true
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.4)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.7)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(1)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.5)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(1)
		until
		ElectricalDischarge3 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 3 then
		repeat
			RPMValue.Value = RPMValue.Value - 937
			wait(0.1)
		until
		RPMValue.Value < 16578 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 3 then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value - 28
			wait(0.1)
		until
		OutputEnergyValue.Value < 736 or ReactorStatusValue.Value == 0
	end
end)
--

-- Lever Moving To Pos 2 Backward
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 2 then
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 6
		RightPartOfReactor.HingeConstraint.AngularVelocity = 6
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Play()
		FlyWheelRotatingSoundVeryLow:Stop()
		ElectricalDischarge1 = false
		ElectricalDischarge2 = true
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(1.1)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.5)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(1.1)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.8)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(1.1)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.6)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(1.1)
		until
		ElectricalDischarge2 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 2 then
		repeat
			RPMValue.Value = RPMValue.Value - 937
			wait(0.1)
		until
		RPMValue.Value < 14987 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 2 then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value - 28
			wait(0.1)
		until
		OutputEnergyValue.Value < 368 or ReactorStatusValue.Value == 0
	end
end)
--

-- Lever Moving To Pos 1 Backward
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 1 and LeverAtCriticalPos == false then
		LeverAtCriticalPos = true
		LeftPartOfReactor.HingeConstraint.AngularVelocity = 4
		RightPartOfReactor.HingeConstraint.AngularVelocity = 4
		FlyWheelRotatingSoundVeryHigh:Stop()
		FlyWheelRotatingSoundHigh:Stop()
		FlyWheelRotatingSoundNormal:Stop()
		FlyWheelRotatingSoundLow:Stop()
		FlyWheelRotatingSoundVeryLow:Play()
		ElectricalDischarge1 = true
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
		repeat
			ElectricDischargeSound1:Play()
			Lightning1.Transparency = 0
			Lightning1.PointLight.Enabled = true
			wait(0.1)
			Lightning1.Transparency = 1
			Lightning1.PointLight.Enabled = false
			wait(1.4)
			ElectricDischargeSound2:Play()
			Lightning2.Transparency = 0
			Lightning2.PointLight.Enabled = true
			wait(0.1)
			Lightning2.Transparency = 1
			Lightning2.PointLight.Enabled = false
			wait(0.8)
			ElectricDischargeSound3:Play()
			Lightning3.Transparency = 0
			Lightning3.PointLight.Enabled = true
			wait(0.1)
			Lightning3.Transparency = 1
			Lightning3.PointLight.Enabled = false
			wait(1.4)
			ElectricDischargeSound4:Play()
			Lightning4.Transparency = 0
			Lightning4.PointLight.Enabled = true
			wait(0.1)
			Lightning4.Transparency = 1
			Lightning4.PointLight.Enabled = false
			wait(0.11)
			ElectricDischargeSound5:Play()
			Lightning5.Transparency = 0
			Lightning5.PointLight.Enabled = true
			wait(0.1)
			Lightning5.Transparency = 1
			Lightning5.PointLight.Enabled = false
			wait(1.4)
			ElectricDischargeSound6:Play()
			Lightning6.Transparency = 0
			Lightning6.PointLight.Enabled = true
			wait(0.1)
			Lightning6.Transparency = 1
			Lightning6.PointLight.Enabled = false
			wait(0.9)
			ElectricDischargeSound7:Play()
			Lightning7.Transparency = 0
			Lightning7.PointLight.Enabled = true
			wait(0.1)
			Lightning7.Transparency = 1
			Lightning7.PointLight.Enabled = false
			wait(1.4)
		until
		ElectricalDischarge1 == false or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 1 and LeverAtCriticalPos == false then
		repeat
			RPMValue.Value = RPMValue.Value - 937
			wait(0.1)
		until
		RPMValue.Value < 9574 or ReactorStatusValue.Value == 0
	end
end)
Lever.ClickDetector.RightMouseClick:Connect(function()
	wait(0.2)
	if LeverPositionValue.Value == 1 and LeverAtCriticalPos == false then
		repeat
			OutputEnergyValue.Value = OutputEnergyValue.Value - 28
			wait(0.1)
		until
		OutputEnergyValue.Value < 184 or ReactorStatusValue.Value == 0
	end
end)
--

Lever.ClickDetector.MouseClick:Connect(function()
	if LeverAtCriticalPos == false then
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
	else
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
	end
end)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(5)
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
	end
end)

while true do
	if ReactorStatusValue.Value == 3 then
		ElectricalDischarge1 = false
		ElectricalDischarge2 = false
		ElectricalDischarge3 = false
		ElectricalDischarge4 = false
		ElectricalDischarge5 = false
	end
	wait(0.1)
end
