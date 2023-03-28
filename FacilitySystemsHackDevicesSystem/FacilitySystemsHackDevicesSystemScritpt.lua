-- Values
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue

local Fuse5HackDeviceValue = workspace.HackTriggers.Fuse5HackTrigger.MilitaryLaptop.CPU.Values.LaptopStatusValue
--

-- Functions
function DoCheck()
	if Fuse5HackDeviceValue.Value == "HACKING" then
		FacilitySystemsHackDevicesStatusValue.Value = "HACK"
	elseif Fuse5HackDeviceValue.Value == "" then
		FacilitySystemsHackDevicesStatusValue.Value = "CLEAR"
	end
end
--

Fuse5HackDeviceValue.Changed:Connect(function()
	DoCheck()
end)
