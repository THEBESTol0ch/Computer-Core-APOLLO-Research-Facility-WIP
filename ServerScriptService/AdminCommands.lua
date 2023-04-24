game.Players.PlayerAdded:Connect(function(Player)
	if Player:GetRankInGroup(11755642) >= 250 then
		Player.Chatted:Connect(function(Message)
			local Split = Message:split(" ")
			if Split[2] == "Set_CRC_Integrity_To" then
				local Number = Split[3]
				workspace.CentralReactorCore.CentralCore.CPU.Values.IntegrityValue.Value = Number
			end
			
			if Message == ":A, Destroy Alpha Core" then
				workspace.CentralReactorCore.AlphaCore.CPU.Values.IntegrityValue.Value = 0
			end
			if Message == ":A, Destroy Beta Core" then
				workspace.CentralReactorCore.BetaCore.CPU.Values.IntegrityValue.Value = 0
			end
			if Message == ":A, Destroy Gamma Core" then
				workspace.CentralReactorCore.GammaCore.CPU.Values.IntegrityValue.Value = 0
			end
			if Message == ":A, Destroy Delta Core" then
				workspace.CentralReactorCore.DeltaCore.CPU.Values.IntegrityValue.Value = 0
			end
			
			if Message == ":A, Initiate Earthquake" then
				workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue.Value = "SHAKE"
			end
			
			if Message == ":A, Initiate Blackout" then
				game.ReplicatedStorage.GameValues.BlackControlValue.Value = "OUT"
			end
			if Message == ":A, Deactivate Blackout" then
				game.ReplicatedStorage.GameValues.BlackControlValue.Value = "IN"
			end
			
			if Message == ":A, Refuel Diesel Generators" then
				workspace.FacilityDieselsGenerators.FacilityDieselGenerator1.CPU.Values.GeneratorControlValue.Value = "START"
				wait(0.3)
				workspace.FacilityDieselsGenerators.FacilityDieselGenerator2.CPU.Values.GeneratorControlValue.Value = "START"
				wait(0.3)
				workspace.FacilityDieselsGenerators.FacilityDieselGenerator3.CPU.Values.GeneratorControlValue.Value = "START"
				wait(0.3)
				workspace.FacilityDieselsGenerators.FacilityDieselGenerator4.CPU.Values.GeneratorControlValue.Value = "START"
			end
			
			if Message == ":A, Destroy Random Pump" then
				workspace.PumpStationAlphaDamageSystem.CPU.Values.DestroyPumpValue.Value = true
			end
			if Message == ":A, Destroy Water Pump" then
				workspace.PumpStationAlphaDamageSystem.WaterPump_DamageEffect.CPU.Values.DestroyPumpValue.Value = true
				workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue.Value = "SHAKE"
			end
			if Message == ":A, Destroy Hot Water Pump" then
				workspace.PumpStationAlphaDamageSystem.HotWaterPump_DamageEffect.CPU.Values.DestroyPumpValue.Value = true
				workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue.Value = "SHAKE"
			end
			if Message == ":A, Destroy Fire Protection Water Pump" then
				workspace.PumpStationAlphaDamageSystem.FireProtectionWaterPump_DamageEffect.CPU.Values.DestroyPumpValue.Value = true
				workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue.Value = "SHAKE"
			end
			if Message == ":A, Destroy Coolant Pump" then
				workspace.PumpStationAlphaDamageSystem.CoolantPump_DamageEffect.CPU.Values.DestroyPumpValue.Value = true
				workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue.Value = "SHAKE"
			end
			
			if Message == ":A, Set Intercom Mode To 1" then
				workspace.FacilityIntercomSystem.CPU.Values.FacilityIntercomSystemModeValue.Value = 1
			end
			if Message == ":A, Set Intercom Mode To 2" then
				workspace.FacilityIntercomSystem.CPU.Values.FacilityIntercomSystemModeValue.Value = 2
			end
			if Message == ":A, Set Intercom Mode To 3" then
				workspace.FacilityIntercomSystem.CPU.Values.FacilityIntercomSystemModeValue.Value = 3
			end
			
			if Message == ":A, Turn On Surface Alarm" then
				game.SoundService.Ambients.BMAirRaidAmbientSound:Play()
			end
			if Message == ":A, Turn Off Surface Alarm" then
				game.SoundService.Ambients.BMAirRaidAmbientSound:Stop()
			end
			if Message == ":A, Turn On Facility Alarm 1" then
				game.SoundService.Ambients.FacilityAlarmAmbientSound1:Play()
			end
			if Message == ":A, Turn Off Facility Alarm 1" then
				game.SoundService.Ambients.FacilityAlarmAmbientSound1:Stop()
			end
			if Message == ":A, Turn On Facility Alarm 2" then
				game.SoundService.Ambients.FacilityAlarmAmbientSound2:Play()
			end
			if Message == ":A, Turn Off Facility Alarm 2" then
				game.SoundService.Ambients.FacilityAlarmAmbientSound2:Stop()
			end
			if Message == ":A, Turn On Facility Alarm 3" then
				game.SoundService.Ambients.FacilityAlarmAmbientSound3:Play()
			end
			if Message == ":A, Turn Off Facility Alarm 3" then
				game.SoundService.Ambients.FacilityAlarmAmbientSound3:Stop()
			end
			if Message == ":A, Turn On Facility Emergency Lamps" then
				workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "ON"
			end
			if Message == ":A, Turn Off Facility Emergency Lamps" then
				workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "FORCE OFF"
			end
			
			if Message == ":A, Close Facility Blast Doors" then
				game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "CLOSE"
			end
			if Message == ":A, Open Facility Blast Doors" then
				game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "OPEN"
			end
			
			if Message == ":A, Initiate Full Facility Containment Lockdown" then
				game.ReplicatedStorage.GameValues.BlackControlValue.Value = "OUT"
				game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "CLOSE"
				wait(3)
				game.SoundService.Ambients.FacilityAlarmAmbientSound2:Play()
				game.SoundService.Ambients.FacilityAlarmAmbientSound3:Play()
				workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "ON"
			end
			if Message == ":A, Deactivate Full Facility Containment Lockdown" then
				game.ReplicatedStorage.GameValues.BlackControlValue.Value = "IN"
				game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "OPEN"
				game.SoundService.Ambients.FacilityAlarmAmbientSound2:Stop()
				game.SoundService.Ambients.FacilityAlarmAmbientSound3:Stop()
				workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "OFF"
			end
			
			if Message == ":A, Disable Facility Transit System" then
				workspace.FacilityTransitSystem.CPU.Values.FacilityTransitSystemControlValue.Value = "DISABLE"
			end
			if Message == ":A, Enable Facility Transit System" then
				workspace.FacilityTransitSystem.CPU.Values.FacilityTransitSystemControlValue.Value = "ENABLE"
			end
			if Message == ":A, Set Transit Lighting Mode To STANDARD" then
				workspace.FacilityTransitSystem.CPU.Values.TransitLightingModeValue.Value = "STANDARD"
			end
			if Message == ":A, Set Transit Lighting Mode To RGB" then
				workspace.FacilityTransitSystem.CPU.Values.TransitLightingModeValue.Value = "RGB"
			end
			
			if Message == ":A, Call Military Forces" then
				game.ReplicatedStorage.GameValues.MilitaryForceControlValue.Value = "CALL"
			end
			if Message == ":A, Open Military Trucks" then
				game.ReplicatedStorage.GameValues.MilitaryForceControlValue.Value = "OPEN"
			end
			if Message == ":A, Call Off Military Forces" then
				game.ReplicatedStorage.GameValues.MilitaryForceControlValue.Value = "CALL OFF"
			end
			
			if Message == ":A, Give Me Ammo" then
				if Player.Backpack:FindFirstChild("SPAS12") then
					Player.Backpack:FindFirstChild("SPAS12").CPU.Values.PocketAmmoValue.Value = 30
				end
				if Player.Backpack:FindFirstChild("M4A1") then
					Player.Backpack:FindFirstChild("M4A1").CPU.Values.PocketAmmoValue.Value = 150
				end
				if Player.Backpack:FindFirstChild("HKUSPMatch") then
					Player.Backpack:FindFirstChild("HKUSPMatch").CPU.Values.PocketAmmoValue.Value = 150
				end
			end
			if Message == ":A, Give Me M4A1" then
				local M4A1 = game.ReplicatedStorage.M4A1
				local Backpack = Player.Backpack
				local M4A1Clone = M4A1:Clone()
				M4A1Clone.Parent = Backpack
			end
			if Message == ":A, Give Me HK USP Match" then
				local HKUSPMatch = game.ReplicatedStorage.HKUSPMatch
				local Backpack = Player.Backpack
				local HKUSPMatchClone = HKUSPMatch:Clone()
				HKUSPMatchClone.Parent = Backpack
			end
			if Message == ":A, Give Me SPAS-12" then
				local SPAS12 = game.ReplicatedStorage.SPAS12
				local Backpack = Player.Backpack
				local SPAS12Clone = SPAS12:Clone()
				SPAS12Clone.Parent = Backpack
			end
			
			if Message == ":A, Give Me A. Keycard" then
				local AKeycard = game.ReplicatedStorage.A_KeyCard
				local Backpack = Player.Backpack
				local AKeycardClone = AKeycard:Clone()
				AKeycardClone.Parent = Backpack
			end
			if Message == ":A, Give Me E. Keycard" then
				local EKeycard = game.ReplicatedStorage.E_KeyCard
				local Backpack = Player.Backpack
				local EKeycardClone = EKeycard:Clone()
				EKeycardClone.Parent = Backpack
			end
			if Message == ":A, Give Me S. O. Keycard" then
				local SOKeycard = game.ReplicatedStorage.SO_KeyCard
				local Backpack = Player.Backpack
				local SOKeycardClone = SOKeycard:Clone()
				SOKeycardClone.Parent = Backpack
			end
			
			if Message == ":A, Give Me Military Laptop" then
				local MilitaryLaptop = game.ReplicatedStorage.MilitaryLaptop
				local Backpack = Player.Backpack
				local MilitaryLaptopClone = MilitaryLaptop:Clone()
				MilitaryLaptopClone.Parent = Backpack
			end
			
			if Message == ":A, Give Me Blast Door Hack Tool" then
				local BlastDoorHackTool = game.ReplicatedStorage.BlastDoorHackTool
				local Backpack = Player.Backpack
				local BlastDoorHackToolClone = BlastDoorHackTool:Clone()
				BlastDoorHackToolClone.Parent = Backpack
			end
			
			if Message == ":A, Give Me Fuel Cell" then
				local FuelCell = game.ReplicatedStorage.FuelCell
				local Backpack = Player.Backpack
				local FuelCellClone = FuelCell:Clone()
				FuelCellClone.Parent = Backpack
			end
			if Message == ":A, Give Me Depleted Fuel Cell" then
				local DepletedFuelCell = game.ReplicatedStorage.DepletedFuelCell
				local Backpack = Player.Backpack
				local DepletedFuelCellClone = DepletedFuelCell:Clone()
				DepletedFuelCellClone.Parent = Backpack
			end
			if Message == ":A, Give Me Gas Can" then
				local GasCan = game.ReplicatedStorage.GasCan
				local Backpack = Player.Backpack
				local GasCanClone = GasCan:Clone()
				GasCanClone.Parent = Backpack
			end
			if Message == ":A, Give Me Empty Gas Can" then
				local EmptyGasCan = game.ReplicatedStorage.EmptyGasCan
				local Backpack = Player.Backpack
				local EmptyGasCanClone = EmptyGasCan:Clone()
				EmptyGasCanClone.Parent = Backpack
			end
			if Message == ":A, Give Me Flashlight" then
				local Flashlight = game.ReplicatedStorage.Flashlight
				local Backpack = Player.Backpack
				local FlashlightClone = Flashlight:Clone()
				FlashlightClone.Parent = Backpack
			end
		end)
	end
end)
