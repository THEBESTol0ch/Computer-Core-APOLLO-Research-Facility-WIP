-- Values
local FacilityIntercomSystemStatusValue = script.Parent.Parent.Values.FacilityIntercomSystemStatusValue
local FacilityIntercomSystemModeValue = script.Parent.Parent.Values.FacilityIntercomSystemModeValue
local MilitaryForceStatusValue = game.ReplicatedStorage.GameValues.MilitaryForceStatusValue
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue
--

-- Sounds
local IntercomAnnouncements = game.SoundService.IntercomAnnouncements
--

-- Functions
function DoCheck()
	repeat
		wait(0.1)
	until FacilityIntercomSystemStatusValue.Value == "ONLINE"
end
function StopSound()
	for _, Item in pairs(IntercomAnnouncements:GetDescendants()) do
		if Item:IsA("Sound") then Item:Stop() end
	end
end
function OccupyAirtime(Time)
	FacilityIntercomSystemStatusValue.Value = "PLAYING"
	wait(Time)
	FacilityIntercomSystemStatusValue.Value = "ONLINE"
end
function DoAnnouncement()
	DoCheck()
	local Announcements = IntercomAnnouncements[FacilityIntercomSystemModeValue.Value]:GetChildren()
	local Announcement = IntercomAnnouncements[FacilityIntercomSystemModeValue.Value]["IntercomAnnouncement"..math.random(1, #Announcements)]
	Announcement:Play()
	FacilityIntercomSystemStatusValue.Value = "PLAYING"
	repeat
		wait(0.1)
	until Announcement.IsPlaying == false
	FacilityIntercomSystemStatusValue.Value = "ONLINE"
end
--

FacilityIntercomSystemModeValue.Changed:Connect(function()
	StopSound()
	if FacilityIntercomSystemModeValue.Value == 1 then
		repeat
			if FacilityIntercomSystemModeValue.Value == 1 then DoAnnouncement() end
			if FacilityIntercomSystemModeValue.Value == 1 then wait(120) end
		until FacilityIntercomSystemModeValue.Value == 2 or FacilityIntercomSystemModeValue.Value == 3
	elseif FacilityIntercomSystemModeValue.Value == 2 then
		repeat
			if FacilityIntercomSystemModeValue.Value == 2 then DoAnnouncement() end
			if FacilityIntercomSystemModeValue.Value == 2 then wait(60) end
		until FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 3
	elseif FacilityIntercomSystemModeValue.Value == 3 then
		IntercomAnnouncements.Special3.IntercomSwitchOver:Play()
		OccupyAirtime(10)
		if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
			IntercomAnnouncements.Special3.IntercomUnauthorizedDevice:Play()
			OccupyAirtime(10)
		end
		repeat
			if FacilityIntercomSystemModeValue.Value == 3 then DoAnnouncement() end
			if FacilityIntercomSystemModeValue.Value == 3 then wait(30) end
			if FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
				IntercomAnnouncements.Special3.IntercomUnauthorizedDevice:Play()
				OccupyAirtime(10)
			end
			if FacilityIntercomSystemModeValue.Value == 3 then wait(30) end
		until FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 2
	end
end)

MilitaryForceStatusValue.Changed:Connect(function()
	if MilitaryForceStatusValue.Value == "ARRIVED" then
		FacilityIntercomSystemModeValue.Value = 3
	elseif MilitaryForceStatusValue.Value == "DEPART" then
		FacilityIntercomSystemModeValue.Value = 1
	end
end)

--workspace.PumpTestButton.ClickDetector.MouseClick:Connect(function()
--	wait(5)
--	DoCheck()
--	if FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 2 then
--		IntercomAnnouncements.Special2.IntercomFloodingDetected:Play()
--	elseif FacilityIntercomSystemModeValue.Value == 3 then
--		IntercomAnnouncements.Special3.IntercomHighEnergyDetonationDetected:Play()
--	end
--	OccupyAirtime(8)
--end)

--workspace.AlphaCoreTestButton.ClickDetector.MouseClick:Connect(function()
--	wait(5)
--	DoCheck()
--	if FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 2 then
--		DoAnnouncement()
--	elseif FacilityIntercomSystemModeValue.Value == 3 then
--		IntercomAnnouncements.Special3.IntercomCoreDetonationDetected:Play()
--	end
--	OccupyAirtime(8)
--end)

--workspace.CRCExplosionTestButton.ClickDetector.MouseClick:Connect(function()
--	wait(5)
--	DoCheck()
--	if FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 2 then
--		DoAnnouncement()
--	elseif FacilityIntercomSystemModeValue.Value == 3 then
--		IntercomAnnouncements.Special3.IntercomHighEnergyDetonationDetected:Play()
--	end
--	OccupyAirtime(8)
--end)
