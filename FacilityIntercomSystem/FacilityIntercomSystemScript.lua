-- Values
local FacilityIntercomSystemStatusValue = script.Parent.Parent.Values.FacilityIntercomSystemStatusValue
local FacilityIntercomSystemModeValue = script.Parent.Parent.Values.FacilityIntercomSystemModeValue
local MilitaryForceStatusValue = game.ReplicatedStorage.GameValues.MilitaryForceStatusValue
local MilitaryForceCounterValue = game.ReplicatedStorage.GameValues.MilitaryForceCounterValue
local FacilitySystemsHackDevicesStatusValue = workspace.FacilitySystemsHackDevicesSystem.Values.FacilitySystemsHackDevicesStatusValue

local DestroyPumpValue = workspace.PumpStationAlphaDamageSystem.CPU.Values.DestroyPumpValue
local DamageReactorValue = workspace.CentralReactorCore.CPU.Values.DamageReactorValue
local AlphaCoreStatusValue = workspace.CentralReactorCore.AlphaCore.CPU.Values.CoreStatusValue
local BetaCoreStatusValue = workspace.CentralReactorCore.BetaCore.CPU.Values.CoreStatusValue
local GammaCoreStatusValue = workspace.CentralReactorCore.GammaCore.CPU.Values.CoreStatusValue
local DeltaCoreStatusValue = workspace.CentralReactorCore.DeltaCore.CPU.Values.CoreStatusValue

local CRCIntegrityValue = workspace.CentralReactorCore.CentralCore.CPU.Values.IntegrityValue
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
function OnCoreDetonationEvent()
	wait(5)
	if FacilityIntercomSystemModeValue.Value == 1 then
		FacilityIntercomSystemModeValue.Value = 2
	elseif FacilityIntercomSystemModeValue.Value == 2 then
		DoAnnouncement()
	elseif FacilityIntercomSystemModeValue.Value == 3 then
		DoCheck()
		IntercomAnnouncements.Special3.IntercomCoreDetonationDetected:Play()
		OccupyAirtime(8)
	end
end

function StartCounter(Time)
	MilitaryForceCounterValue.Value = Time
	repeat
		wait(1)
		MilitaryForceCounterValue.Value = MilitaryForceCounterValue.Value - 1
	until MilitaryForceCounterValue.Value == 0
end
--

MilitaryForceCounterValue.Changed:Connect(function()
	if MilitaryForceCounterValue.Value == 600 or MilitaryForceCounterValue.Value == 500 or MilitaryForceCounterValue.Value == 400 or MilitaryForceCounterValue.Value == 300 or MilitaryForceCounterValue.Value == 200 or MilitaryForceCounterValue.Value == 100 then
		DoCheck()
		IntercomAnnouncements.Special3.Countdown["Intercom"..MilitaryForceCounterValue.Value.."Seconds"]:Play()
		OccupyAirtime(6)
	end
end)

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
			if FacilityIntercomSystemModeValue.Value == 3 and FacilitySystemsHackDevicesStatusValue.Value == "HACK" then wait(30) end
			if FacilityIntercomSystemModeValue.Value == 3 and CRCIntegrityValue.Value == 0 then
				IntercomAnnouncements.Special3.IntercomCommunicationsFailure:Play()
				OccupyAirtime(4)
			end
			if FacilityIntercomSystemModeValue.Value == 3 and CRCIntegrityValue.Value == 0 then wait(30) end
			if FacilityIntercomSystemModeValue.Value == 3 and FacilitySystemsHackDevicesStatusValue.Value == "HACK" then
				IntercomAnnouncements.Special3.IntercomUnauthorizedDevice:Play()
				OccupyAirtime(10)
			end
			if FacilityIntercomSystemModeValue.Value == 3 and FacilitySystemsHackDevicesStatusValue.Value == "HACK" then wait(30) end
			if FacilityIntercomSystemModeValue.Value == 3 and CRCIntegrityValue.Value == 0 then
				IntercomAnnouncements.Special3.IntercomCentralReactorCoreDetonationImm:Play()
				OccupyAirtime(7)
			end
			if FacilityIntercomSystemModeValue.Value == 3 and CRCIntegrityValue.Value == 0 then wait(30) end
		until FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 2 or MilitaryForceStatusValue.Value == "DEPART"
	end
end)

MilitaryForceStatusValue.Changed:Connect(function()
	if MilitaryForceStatusValue.Value == "ARRIVED" then
		FacilityIntercomSystemModeValue.Value = 3
	elseif MilitaryForceStatusValue.Value == "DEPART" and not (CRCIntegrityValue.Value == 0) then
		FacilityIntercomSystemModeValue.Value = 1
	end
end)

DestroyPumpValue.Changed:Connect(function()
	if DestroyPumpValue.Value == true then
		wait(5)
		DoCheck()
		if FacilityIntercomSystemModeValue.Value == 1 or FacilityIntercomSystemModeValue.Value == 2 then
			IntercomAnnouncements.Special2.IntercomFloodingDetected:Play()
		elseif FacilityIntercomSystemModeValue.Value == 3 then
			IntercomAnnouncements.Special3.IntercomHighEnergyDetonationDetected:Play()
		end
		OccupyAirtime(8)
	end
end)

DamageReactorValue.Changed:Connect(function()
	if DamageReactorValue.Value == true then
		wait(5)
		if FacilityIntercomSystemModeValue.Value == 1 then
			FacilityIntercomSystemModeValue.Value = 2
		elseif FacilityIntercomSystemModeValue.Value == 2 then
			DoAnnouncement()
		elseif FacilityIntercomSystemModeValue.Value == 3 then
			DoCheck()
			IntercomAnnouncements.Special3.IntercomHighEnergyDetonationDetected:Play()
			OccupyAirtime(8)
		end
	end
end)

AlphaCoreStatusValue.Changed:Connect(function()
	if AlphaCoreStatusValue.Value == "ERROR" then
		OnCoreDetonationEvent()
	end
end)
BetaCoreStatusValue.Changed:Connect(function()
	if BetaCoreStatusValue.Value == "ERROR" then
		OnCoreDetonationEvent()
	end
end)
GammaCoreStatusValue.Changed:Connect(function()
	if GammaCoreStatusValue.Value == "ERROR" then
		OnCoreDetonationEvent()
	end
end)
DeltaCoreStatusValue.Changed:Connect(function()
	if DeltaCoreStatusValue.Value == "ERROR" then
		OnCoreDetonationEvent()
	end
end)

CRCIntegrityValue.Changed:Connect(function()
	if CRCIntegrityValue.Value == 0 then
		wait(30)
		StartCounter(200)
	end
end)
