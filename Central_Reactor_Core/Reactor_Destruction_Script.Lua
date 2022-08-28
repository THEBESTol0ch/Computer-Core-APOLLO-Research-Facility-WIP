local CRCDamagedModule1ControlValue = workspace.CRCDamagedModule1.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule1StatusValue = workspace.CRCDamagedModule1.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule2ControlValue = workspace.CRCDamagedModule2.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule2StatusValue = workspace.CRCDamagedModule2.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule3ControlValue = workspace.CRCDamagedModule3.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule3StatusValue = workspace.CRCDamagedModule3.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule4ControlValue = workspace.CRCDamagedModule4.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule4StatusValue = workspace.CRCDamagedModule4.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule5ControlValue = workspace.CRCDamagedModule5.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule5StatusValue = workspace.CRCDamagedModule5.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule6ControlValue = workspace.CRCDamagedModule6.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule6StatusValue = workspace.CRCDamagedModule6.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule7ControlValue = workspace.CRCDamagedModule7.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule7StatusValue = workspace.CRCDamagedModule7.CPU.Values.CRCDamagedModuleStatusValue
local CRCDamagedModule8ControlValue = workspace.CRCDamagedModule8.CPU.Values.CRCDamagedModuleControlValue
local CRCDamagedModule8StatusValue = workspace.CRCDamagedModule8.CPU.Values.CRCDamagedModuleStatusValue

local FacilityIntercomSystemModeValue = workspace.FacilityIntercomSystem.CPU.Values.FacilityIntercomSystemModeValue

local IntegrityValue = script.Parent.Parent.Values.IntegrityValue

local RandomIndex = 1

local CanEvent = true

while true do
	if IntegrityValue.Value == 75 or IntegrityValue.Value == 50 or IntegrityValue.Value == 25 or IntegrityValue.Value == 0 and CanEvent == true then
		RandomIndex = math.random(1, 8)
		if RandomIndex == 1 and CRCDamagedModule1StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule1ControlValue.Value = 1
		end
		if RandomIndex == 2 and CRCDamagedModule2StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule2ControlValue.Value = 1
		end
		if RandomIndex == 3 and CRCDamagedModule3StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule3ControlValue.Value = 1
		end
		if RandomIndex == 4 and CRCDamagedModule4StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule4ControlValue.Value = 1
		end
		if RandomIndex == 5 and CRCDamagedModule5StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule5ControlValue.Value = 1
		end
		if RandomIndex == 6 and CRCDamagedModule6StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule6ControlValue.Value = 1
		end
		if RandomIndex == 7 and CRCDamagedModule7StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule7ControlValue.Value = 1
		end
		if RandomIndex == 8 and CRCDamagedModule8StatusValue.Value == 0 and CanEvent == true then
			CanEvent = false
			CRCDamagedModule8ControlValue.Value = 1
		end
		wait(10)
		if FacilityIntercomSystemModeValue.Value == 1 then
			FacilityIntercomSystemModeValue.Value = 2
		end
	end
	if IntegrityValue.Value == 70 or IntegrityValue.Value == 45 or IntegrityValue.Value == 20 and CanEvent == false then
		CanEvent = true
	end
	wait(0.1)
end
