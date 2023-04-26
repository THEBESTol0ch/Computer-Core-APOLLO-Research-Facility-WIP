-- Control
local TweenService = game:GetService("TweenService")
local Trigger = workspace.CRCPurgeAdvancedButton.Button.Trigger
--

-- Values
local ElectricalDischargesValue = script.Parent.Parent.Values.ElectricalDischargesValue
--

-- Items
local Lightning1 = script.Parent.Parent.Parent.PurgeLightning.Lightning1
local Lightning2 = script.Parent.Parent.Parent.PurgeLightning.Lightning2
local Lights = script.Parent.Parent.Parent.PurgeLightning.Lights
local LightningPrimaryPart = script.Parent.Parent.Parent.PurgeLightning.LightningPrimaryPart
local Pos1 = script.Parent.Parent.Parent.PurgeLightning.Pos1
local Pos2 = script.Parent.Parent.Parent.PurgeLightning.Pos2
local Plasma = script.Parent.Parent.Parent.CentralCore.Hive.Plasma
local DeathTrigger = script.Parent.Parent.Parent.PurgeLightning.DeathTrigger.DeathTriggerScript
--

-- Sounds
local CentralCorePurgeSound = script.Parent.Parent.Parent.PurgeLightning.SoundEmitter.CentralCorePurgeSound
--

-- Logic
local ElectricalDischarges = false
--

local LightningUp = {
	CFrame = Pos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LightningDown = {
	CFrame = Pos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local LightningReturnAnimationSettings = TweenInfo.new(
	0,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LightningAnimationSettings1 = TweenInfo.new(
	1.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LightningAnimationSettings2 = TweenInfo.new(
	1.1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LightningAnimationSettings3 = TweenInfo.new(
	0.9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LightningAnimationSettings4 = TweenInfo.new(
	0.4,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local PlasmaAnimationSettingsStart = TweenInfo.new(
	1.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local PlasmaAnimationSettingsEnd = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local PlasmaPropertiesStart = {
	Size = Vector3.new(215.384, 215.384, 215.384);
	Transparency = 0
}
local PlasmaPropertiesEnd = {
	Transparency = 1
}

local LightningUp = TweenService:Create(LightningPrimaryPart, LightningReturnAnimationSettings, LightningUp)
local LightningDown1 = TweenService:Create(LightningPrimaryPart, LightningAnimationSettings1, LightningDown)
local LightningDown2 = TweenService:Create(LightningPrimaryPart, LightningAnimationSettings2, LightningDown)
local LightningDown3 = TweenService:Create(LightningPrimaryPart, LightningAnimationSettings3, LightningDown)
local LightningDown4 = TweenService:Create(LightningPrimaryPart, LightningAnimationSettings4, LightningDown)
local PlasmaStart = TweenService:Create(Plasma, PlasmaAnimationSettingsStart, PlasmaPropertiesStart)
local PlasmaEnd = TweenService:Create(Plasma, PlasmaAnimationSettingsEnd, PlasmaPropertiesEnd)

-- Functions
function DoLights(Mode)
	if Mode == "ON" then
		for _, Object in pairs(Lights:GetChildren()) do
			Object.PointLight.Enabled = true
		end
	elseif Mode == "OFF" then
		for _, Object in pairs(Lights:GetChildren()) do
			Object.PointLight.Enabled = false
		end
	end
end

function DoLightnings(Mode, Class)
	if Mode == "ON" then
		if Class == "1" then
			for _, Object in pairs(Lightning1:GetChildren()) do
				Object.Transparency = 0
			end
		elseif Class == "2" then
			for _, Object in pairs(Lightning2:GetChildren()) do
				Object.Transparency = 0
			end
		end
	elseif Mode == "OFF" then
		if Class == "1" then
			for _, Object in pairs(Lightning1:GetChildren()) do
				Object.Transparency = 1
			end
		elseif Class == "2" then
			for _, Object in pairs(Lightning2:GetChildren()) do
				Object.Transparency = 1
			end
		end
	end
end

function DoLightningDown(Mode)
	if Mode == "1" then
		ElectricalDischarges = true
		DoLights("ON")
		DeathTrigger.Enabled = true
		LightningDown1:Play()
		wait(1.5)
		ElectricalDischarges = false
		DoLights("OFF")
		DeathTrigger.Enabled = false
		wait(0.1)
		LightningUp:Play()
	elseif Mode == "2" then
		ElectricalDischarges = true
		DoLights("ON")
		DeathTrigger.Enabled = true
		LightningDown2:Play()
		wait(1.1)
		ElectricalDischarges = false
		DoLights("OFF")
		DeathTrigger.Enabled = false
		wait(0.1)
		LightningUp:Play()
	elseif Mode == "3" then
		ElectricalDischarges = true
		DoLights("ON")
		DeathTrigger.Enabled = true
		LightningDown3:Play()
		wait(0.9)
		Plasma.Transparency = 0
		ElectricalDischarges = false
		DoLights("OFF")
		DeathTrigger.Enabled = false
		wait(0.1)
		LightningUp:Play()
	elseif Mode == "4" then
		ElectricalDischarges = true
		DoLights("ON")
		DeathTrigger.Enabled = true
		LightningDown4:Play()
		wait(0.4)
		ElectricalDischarges = false
		DoLights("OFF")
		DeathTrigger.Enabled = false
		wait(0.1)
		LightningUp:Play()
	elseif Mode == "5" then
		ElectricalDischarges = true
		DoLights("ON")
		DeathTrigger.Enabled = true
		LightningDown4:Play()
		wait(0.2)
		PlasmaStart:Play()
		wait(0.2)
		ElectricalDischarges = false
		DoLights("OFF")
		DeathTrigger.Enabled = false
		wait(0.1)
		LightningUp:Play()

		wait(0.5)

		PlasmaEnd:Play()
		wait(5)
		Plasma.Size = Vector3.new(91.384, 91.384, 91.384)
	end
end
--

Trigger.ClickDetector.MouseClick:Connect(function()
	CentralCorePurgeSound:Play()
	wait(0.55)
	DoLightningDown("1")
	wait(2)
	DoLightningDown("1")
	wait(1.1)
	DoLightningDown("2")
	wait(0.5)
	DoLightningDown("3")
	wait(0.1)
	DoLightningDown("4")
	wait(0.3)
	for Counter = 0, 13, 1 do
		DoLightningDown("4")
		wait(0.1)
	end
	DoLightningDown("5")
end)

while true do
	if ElectricalDischarges == true then
		DoLightnings("ON", "1")
		DoLightnings("OFF", "2")
		wait(0.01)
		DoLightnings("OFF", "1")
		DoLightnings("ON", "2")
		wait(0.01)
	end
	if ElectricalDischarges == false then
		DoLightnings("OFF", "1")
		DoLightnings("OFF", "2")
	end
	wait(0.01)
end
