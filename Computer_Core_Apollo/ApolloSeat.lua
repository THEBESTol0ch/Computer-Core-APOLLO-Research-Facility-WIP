-- Control
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local Trigger = script.Parent.Monitor.Trigger
--

-- Values
local PlayerDismountedValue = workspace.PlayerDismountedValue
local CanRequestValue = game.ReplicatedStorage.ApolloRequests.CanRequestValue
local ApolloLaptopStatusValue = workspace.HackTriggers.ApolloHackTrigger.MilitaryLaptop.CPU.Values.LaptopStatusValue
--

-- Items
local Hinge = script.Parent.TransitSeat.Frame.Hinge
local Logo = script.Parent.Monitor.Logo.ApolloCorporationDecal
local AnswerTextLabel = script.Parent.Monitor.Lines.Answer.SurfaceGui.TextLabel
local PutTextLabel = script.Parent.Monitor.Lines.TextPut.SurfaceGui.TextLabel
local Seat = script.Parent.Parent.ApolloSeat.TransitSeat.Seats.Seat.Seat
--

-- Sounds
local SeatSound = script.Parent.TransitSeat.Frame.Hinge.SeatSound
local TerminalStartSound = script.Parent.Monitor.SoundEmitter.TerminalStartSound
local TerminalLoopSound = script.Parent.Monitor.SoundEmitter.TerminalLoopSound
local TerminalEndSound = script.Parent.Monitor.SoundEmitter.TerminalEndSound
local TerminalAttract1Sound = script.Parent.Monitor.SoundEmitter.TerminalAttract1Sound
local TerminalAttract2Sound = script.Parent.Monitor.SoundEmitter.TerminalAttract2Sound
local TerminalAttract3Sound = script.Parent.Monitor.SoundEmitter.TerminalAttract3Sound
local KeyPush1Sound = script.Parent.Monitor.SoundEmitter.KeyPush1Sound
local KeyPush2Sound = script.Parent.Monitor.SoundEmitter.KeyPush2Sound
local KeyPush3Sound = script.Parent.Monitor.SoundEmitter.KeyPush3Sound
local KeyPush4Sound = script.Parent.Monitor.SoundEmitter.KeyPush4Sound
local KeyPush5Sound = script.Parent.Monitor.SoundEmitter.KeyPush5Sound
local KeyPush6Sound = script.Parent.Monitor.SoundEmitter.KeyPush6Sound
local KeyPush7Sound = script.Parent.Monitor.SoundEmitter.KeyPush7Sound
local TerminalHackedSound = script.Parent.Monitor.SoundEmitter.TerminalHackedSound
--

-- Remote Events
local PlayerDismounted = game.ReplicatedStorage.PlayerDismounted

local WAYRE = game.ReplicatedStorage.ApolloRequests.WAYRE
local WITACRE = game.ReplicatedStorage.ApolloRequests.WITACRE
local WTIINRE = game.ReplicatedStorage.ApolloRequests.WTIINRE
local WHTSRE = game.ReplicatedStorage.ApolloRequests.WHTSRE
local WITCRCRE = game.ReplicatedStorage.ApolloRequests.WITCRCRE
local WIIRITCRCCRE = game.ReplicatedStorage.ApolloRequests.WIIRITCRCCRE
local WITNERRE = game.ReplicatedStorage.ApolloRequests.WITNERRE
local HMFSRE = game.ReplicatedStorage.ApolloRequests.HMFSRE
local SARE = game.ReplicatedStorage.ApolloRequests.SARE
local SBRE = game.ReplicatedStorage.ApolloRequests.SBRE
local SDRE = game.ReplicatedStorage.ApolloRequests.SDRE
local SCRE = game.ReplicatedStorage.ApolloRequests.SCRE
local LACRE = game.ReplicatedStorage.ApolloRequests.LACRE
local LBCRE = game.ReplicatedStorage.ApolloRequests.LBCRE
local LCCRE = game.ReplicatedStorage.ApolloRequests.LCCRE
local LDCRE = game.ReplicatedStorage.ApolloRequests.LDCRE

local TOnFELRE = game.ReplicatedStorage.ApolloRequests.TOnFELRE
local TOffFELRE = game.ReplicatedStorage.ApolloRequests.TOffFELRE
local IBRE = game.ReplicatedStorage.ApolloRequests.IBRE
local DBRE = game.ReplicatedStorage.ApolloRequests.DBRE
local TOnSARE = game.ReplicatedStorage.ApolloRequests.TOnSARE
local TOffSARE = game.ReplicatedStorage.ApolloRequests.TOffSARE
local TOnFA1RE = game.ReplicatedStorage.ApolloRequests.TOnFA1RE
local TOffFA1RE = game.ReplicatedStorage.ApolloRequests.TOffFA1RE
local TOnFA2RE = game.ReplicatedStorage.ApolloRequests.TOnFA2RE
local TOffFA2RE = game.ReplicatedStorage.ApolloRequests.TOffFA2RE
local TOnFA3RE = game.ReplicatedStorage.ApolloRequests.TOnFA3RE
local TOffFA3RE = game.ReplicatedStorage.ApolloRequests.TOffFA3RE
local CFBDRE = game.ReplicatedStorage.ApolloRequests.CFBDRE
local OFBDRE = game.ReplicatedStorage.ApolloRequests.OFBDRE
local IFFCLRE = game.ReplicatedStorage.ApolloRequests.IFFCLRE
local DFFCLRE = game.ReplicatedStorage.ApolloRequests.DFFCLRE
local DTSRE = game.ReplicatedStorage.ApolloRequests.DTSRE
local ETSRE = game.ReplicatedStorage.ApolloRequests.ETSRE
--

-- Logic
local CD = 20
local CDStop = false
local SeatOnline = false
local RandomIndex = 0
--

local SeatAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local SeatTurnOn = TweenService:Create(Hinge, SeatAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})

local SeatTurnOff = TweenService:Create(Hinge, SeatAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

-- Functions
local function ClearSeat()
	for _, Object in pairs(Seat:GetChildren()) do
		Object:Destroy()
	end
end

local function StartCD()
	CD = 20
	CDStop = false
	repeat
		CD = CD - 1
		wait(1)
	until CD == 0 or CDStop == true
	if CD == 0 and SeatOnline == true then
		SeatOnline = false
		TerminalLoopSound:Stop()
		TerminalEndSound:Play()
		PlayerDismountedValue.Value = 1
		AnswerTextLabel.Visible = false
		PutTextLabel.Visible = false
		ClearSeat()
		wait(3)
		SeatTurnOff:Play()
		SeatSound:Stop()
		SeatSound.TimePosition = 0
		SeatSound:Play()
		wait(27)
		CanRequestValue.Value = true
		PlayerDismountedValue.Value = 0
		AnswerTextLabel.Visible = true
		PutTextLabel.Visible = true
		AnswerTextLabel.Text = ""
		PutTextLabel.Text = ""
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end

local function RandomTerminalAttractSound()
	RandomIndex = math.random(1, 3)
	if RandomIndex == 1 then
		TerminalAttract1Sound:Play()
	end
	if RandomIndex == 2 then
		TerminalAttract2Sound:Play()
	end
	if RandomIndex == 3 then
		TerminalAttract3Sound:Play()
	end
end

local function RandomKeyPushSound()
	RandomIndex = math.random(1, 7)
	if RandomIndex == 1 then
		KeyPush1Sound:Play()
	end
	if RandomIndex == 2 then
		KeyPush2Sound:Play()
	end
	if RandomIndex == 3 then
		KeyPush3Sound:Play()
	end
	if RandomIndex == 4 then
		KeyPush4Sound:Play()
	end
	if RandomIndex == 5 then
		KeyPush5Sound:Play()
	end
	if RandomIndex == 6 then
		KeyPush6Sound:Play()
	end
	if RandomIndex == 7 then
		KeyPush7Sound:Play()
	end
end

local function TypewriteU(Text)
	CDStop = true
	CanRequestValue.Value = false
	AnswerTextLabel.Text = ""
	for i = 1, #Text do
		PutTextLabel.Text = string.sub(Text, 1, i)
		RandomKeyPushSound()
		wait()
	end
end

local function TypewriteA(Text)
	RandomTerminalAttractSound()
	for i = 1, #Text do
		PutTextLabel.Text = string.sub(Text, 1, i)
		wait()
	end
	RandomTerminalAttractSound()
	CanRequestValue.Value = true
end

local function TypewriteRequestStatus(Text)
	local UnderlinedTextTemplate = "<u>%s</u>"
	RandomTerminalAttractSound()
	for i = 1, Text:len() do
		AnswerTextLabel.Text = UnderlinedTextTemplate:format(Text:sub(1, i))
		wait()
	end
end

local function ExecuteRequest(Player)
	if ApolloLaptopStatusValue.Value == "HACKED" or Player.Team == Teams["Administration"] then
		TypewriteRequestStatus("AFFIRMATIVE")
		wait(0.5)
		TypewriteA("THE OPERATION WAS COMPLETED SUCCESSFULLY.")
	else
		TypewriteRequestStatus("NEGATIVE")
		wait(0.5)
		TypewriteA("YOUR ACCESS LEVEL DOES NOT ALLOW YOU TO PERFORM THIS OPERATION.")
	end
end
--

ApolloLaptopStatusValue.Changed:Connect(function()
	if ApolloLaptopStatusValue.Value == "HACKED" then
		TerminalHackedSound:Play()
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	StartCD()
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	Trigger.ClickDetector.MaxActivationDistance = 0
	SeatOnline = true
	SeatTurnOn:Play()
	SeatSound:Play()
	Logo.Transparency = 0
	wait(3)
	if SeatOnline == true then
		TerminalStartSound:Play()
	end
	wait(2)
	Logo.Transparency = 1
	wait(1.5)
	if SeatOnline == true then
		TerminalLoopSound:Play()
	end
end)

PlayerDismounted.OnServerEvent:Connect(function()
	if SeatOnline == true then
		SeatOnline = false
		TerminalLoopSound:Stop()
		TerminalEndSound:Play()
		PlayerDismountedValue.Value = 1
		AnswerTextLabel.Visible = false
		PutTextLabel.Visible = false
		ClearSeat()
		wait(3)
		SeatTurnOff:Play()
		SeatSound:Stop()
		SeatSound.TimePosition = 0
		SeatSound:Play()
		wait(27)
		CanRequestValue.Value = true
		PlayerDismountedValue.Value = 0
		AnswerTextLabel.Visible = true
		PutTextLabel.Visible = true
		AnswerTextLabel.Text = ""
		PutTextLabel.Text = ""
		Trigger.ClickDetector.MaxActivationDistance = 10
	end
end)

WAYRE.OnServerEvent:Connect(function()
	TypewriteU("WHAT ARE YOU?")
	wait(1)
	TypewriteA("COMPUTER CORE «APOLLO» - SUPERCOMPUTER THAT MANAGES ALL THE SYSTEMS OF THIS AND OTHER «APOLLO» CORPORATION FACILITIES.")
	StartCD()
end)

WITACRE.OnServerEvent:Connect(function()
	TypewriteU("WHAT IS THE [APOLLO CORPORATION]?")
	wait(1)
	TypewriteA("«APOLLO» CORPORATION - IS A LARGE CORPORATION THAT CONDUCTS RESEARCH IN THE FIELD OF INNOVATIONS OF VARIOUS KINDS. YOU CAN WITNESS AMAZING DEVELOPMENTS AND MAYBE SOMETHING ELSE... [COMPUTER CORE «APOLLO» - RESEARCH FACILITY] - IS THE LARGEST RESEARCH FACILITY OF THE «APOLLO» CORPORATION.")
	StartCD()
end)

WTIINRE.OnServerEvent:Connect(function()
	TypewriteU("WHAT TIME IS IT NOW?")
	wait(1)
	TypewriteA("TODAY IS FRIDAY, JULY 22, 2020, 5:24.")
	StartCD()
end)

WHTSRE.OnServerEvent:Connect(function()
	TypewriteU("WHY HAS TIME STOPPED?")
	wait(1)
	TypewriteA("SUCH CONSEQUENCES WERE CAUSED BY AN ANOMALY IN SECTOR C, LABORATORY C CATEGORY, DATA ANALYSIS IN PROGRESS...")
	StartCD()
end)

WITCRCRE.OnServerEvent:Connect(function()
	TypewriteU("WHAT IS THE CENTRAL REACTOR CORE?")
	wait(1)
	TypewriteA("THIS REACTOR FEEDS THIS AND OTHER FACILITIES. MAIN FEATURE - CORRECT ENERGY DISTRIBUTION. REACTOR BASED ON THE PRINCIPLE OF A ZERO POINT ENERGY FIELD. THE REST DATA IS CLASSIFIED.")
	StartCD()
end)

WIIRITCRCCRE.OnServerEvent:Connect(function()
	TypewriteU("WHY IS IT RAINING IN THE CRC CHAMBER?")
	wait(1)
	TypewriteA("IT'S NOT RAIN, IN SIMPLE WORDS, IT'S CONDENSATION THAT FALLS FROM THE CEILING.")
	StartCD()
end)

WITNERRE.OnServerEvent:Connect(function()
	TypewriteU("WHAT IS T.N.E.R.?")
	wait(1)
	TypewriteA("THERMO NUCLEAR EXPERIMENTAL REACTOR - IT USES TRITIUM-BASED FUEL FOR WORK, WHEN THE REACTOR IS OVERLOADED, A HUGE AMOUNT OF ENERGY IS GENERATED. NOTE, AS A CONSEQUENCE OF OVERLOAD IS THE PRODUCTION OF DARK MATTER. THE REST DATA IS CLASSIFIED.")
	StartCD()
end)

HMFSRE.OnServerEvent:Connect(function()
	TypewriteU("HOW MANY FACILITY SECTORS?")
	wait(1)
	TypewriteA("4 - A, B, C, D.")
	StartCD()
end)

SARE.OnServerEvent:Connect(function()
	TypewriteU("SECTOR A?")
	wait(1)
	TypewriteA("SECTOR A - OFFICE COMPLEX, ENTRANCE ZONE. A FREE ZONE FOR VISITING, CALCULATIONS, ORDERS, COMMUNICATIONS.")
	StartCD()
end)

SBRE.OnServerEvent:Connect(function()
	TypewriteU("SECTOR B?")
	wait(1)
	TypewriteA("SECTOR B - MAINTENANCE SECTOR, ENGINEERING DECKS, THE REST DATA IS CLASSIFIED.")
	StartCD()
end)

SDRE.OnServerEvent:Connect(function()
	TypewriteU("SECTOR D?")
	wait(1)
	TypewriteA("SECTOR D - ADMINISTRATION COMPLEX, MANAGEMENT.")
	StartCD()
end)

SCRE.OnServerEvent:Connect(function()
	TypewriteU("SECTOR C?")
	wait(1)
	TypewriteA("SECTOR C - RESEARCH & DEVELOPMENT. CONTAINS: LABORATORY A CATEGORY, LABORATORY B CATEGORY, LABORATORY C CATEGORY, LABORATORY D CATEGORY.")
	StartCD()
end)

LACRE.OnServerEvent:Connect(function()
	TypewriteU("LABORATORY A CATEGORY?")
	wait(1)
	TypewriteA("LABORATORY A CATEGORY - NEW TECHNOLOGIES DEVELOPMENT.")
	StartCD()
end)

LBCRE.OnServerEvent:Connect(function()
	TypewriteU("LABORATORY B CATEGORY?")
	wait(1)
	TypewriteA("LABORATORY B CATEGORY - WEAPONS DEVELOPMENTS.")
	StartCD()
end)

LCCRE.OnServerEvent:Connect(function()
	TypewriteU("LABORATORY C CATEGORY?")
	wait(1)
	TypewriteA("LABORATORY C CATEGORY - RESEARCH ANOMALIES NATURE.")
	StartCD()
end)

LDCRE.OnServerEvent:Connect(function()
	TypewriteU("LABORATORY D CATEGORY?")
	wait(1)
	TypewriteA("LABORATORY D CATEGORY - USELESS DEVELOPMENTS, FOR EXAMPLE - WASHING MACHINE 2.0.")
	StartCD()
end)

TOnFELRE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN ON FACILITY EMERGENCY LAMPS")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "ON"
	end
	StartCD()
end)
TOffFELRE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN OFF FACILITY EMERGENCY LAMPS")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "OFF"
	end
	StartCD()
end)

IBRE.OnServerEvent:Connect(function(Player)
	TypewriteU("INITIATE BLACKOUT")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.ReplicatedStorage.GameValues.BlackControlValue.Value = "OUT"
	end
	StartCD()
end)
DBRE.OnServerEvent:Connect(function(Player)
	TypewriteU("DEACTIVATE BLACKOUT")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.ReplicatedStorage.GameValues.BlackControlValue.Value = "IN"
	end
	StartCD()
end)

TOnSARE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN ON SURFACE ALARM")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.BMAirRaidAmbientSound:Play()
	end
	StartCD()
end)
TOffSARE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN OFF SURFACE ALARM")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.BMAirRaidAmbientSound:Stop()
	end
	StartCD()
end)

TOnFA1RE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN ON FACILITY ALARM 1")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.FacilityAlarmAmbientSound1:Play()
	end
	StartCD()
end)
TOffFA1RE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN OFF FACILITY ALARM 1")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.FacilityAlarmAmbientSound1:Stop()
	end
	StartCD()
end)

TOnFA2RE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN ON FACILITY ALARM 2")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.FacilityAlarmAmbientSound2:Play()
	end
	StartCD()
end)
TOffFA2RE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN OFF FACILITY ALARM 2")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.FacilityAlarmAmbientSound2:Stop()
	end
	StartCD()
end)

TOnFA3RE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN ON FACILITY ALARM 3")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.FacilityAlarmAmbientSound3:Play()
	end
	StartCD()
end)
TOffFA3RE.OnServerEvent:Connect(function(Player)
	TypewriteU("TURN OFF FACILITY ALARM 3")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.SoundService.Ambients.FacilityAlarmAmbientSound3:Stop()
	end
	StartCD()
end)

CFBDRE.OnServerEvent:Connect(function(Player)
	TypewriteU("CLOSE FACILITY BLAST DOORS")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "CLOSE"
	end
	StartCD()
end)
OFBDRE.OnServerEvent:Connect(function(Player)
	TypewriteU("OPEN FACILITY BLAST DOORS")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "OPEN"
	end
	StartCD()
end)

IFFCLRE.OnServerEvent:Connect(function(Player)
	TypewriteU("INITIATE FULL FACILITY CONTAINMENT LOCKDOWN")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.ReplicatedStorage.GameValues.BlackControlValue.Value = "OUT"
		game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "CLOSE"
		wait(3)
		game.SoundService.Ambients.FacilityAlarmAmbientSound2:Play()
		game.SoundService.Ambients.FacilityAlarmAmbientSound3:Play()
		workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "ON"
	end
	StartCD()
end)
DFFCLRE.OnServerEvent:Connect(function(Player)
	TypewriteU("DEACTIVATE FULL FACILITY CONTAINMENT LOCKDOWN")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		game.ReplicatedStorage.GameValues.BlackControlValue.Value = "IN"
		game.ReplicatedStorage.GameValues.BlastDoorsControlValue.Value = "OPEN"
		game.SoundService.Ambients.FacilityAlarmAmbientSound2:Stop()
		game.SoundService.Ambients.FacilityAlarmAmbientSound3:Stop()
		workspace.FacilityLight.CPU.Values.EmergencyLightingControlValue.Value = "OFF"
	end
	StartCD()
end)

DTSRE.OnServerEvent:Connect(function(Player)
	TypewriteU("DISABLE FACILITY TRANSIT SYSTEM")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		workspace.FacilityTransitSystem.CPU.Values.FacilityTransitSystemControlValue.Value = "DISABLE"
	end
	StartCD()
end)
ETSRE.OnServerEvent:Connect(function(Player)
	TypewriteU("ENABLE FACILITY TRANSIT SYSTEM")
	wait(1)
	ExecuteRequest(Player)
	if PutTextLabel.Text == "THE OPERATION WAS COMPLETED SUCCESSFULLY." then
		workspace.FacilityTransitSystem.CPU.Values.FacilityTransitSystemControlValue.Value = "ENABLE"
	end
	StartCD()
end)
