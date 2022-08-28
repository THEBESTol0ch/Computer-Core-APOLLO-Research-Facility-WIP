local TweenService = game:GetService("TweenService")

local Trigger = workspace.CRCPurgeAdvancedButton.Button.Trigger

local Lightning11 = script.Parent.PurgeLightning.Lightning1.Lightning1
local Lightning12 = script.Parent.PurgeLightning.Lightning1.Lightning2
local Lightning13 = script.Parent.PurgeLightning.Lightning1.Lightning3
local Lightning14 = script.Parent.PurgeLightning.Lightning1.Lightning4
local MainLightning11 = script.Parent.PurgeLightning.Lightning1.MainLightning
local Lightning21 = script.Parent.PurgeLightning.Lightning2.Lightning1
local Lightning22 = script.Parent.PurgeLightning.Lightning2.Lightning2
local Lightning23 = script.Parent.PurgeLightning.Lightning2.Lightning3
local Lightning24 = script.Parent.PurgeLightning.Lightning2.Lightning4
local MainLightning21 = script.Parent.PurgeLightning.Lightning2.MainLightning

local LightningPrimaryPart = script.Parent.PurgeLightning.LightningPrimaryPart
local Pos1 = script.Parent.PurgeLightning.Pos1
local Pos2 = script.Parent.PurgeLightning.Pos2

local Light1 = script.Parent.PurgeLightning.Lights.LightEmitter1.PointLight
local Light2 = script.Parent.PurgeLightning.Lights.LightEmitter2.PointLight
local Light3 = script.Parent.PurgeLightning.Lights.LightEmitter3.PointLight
local Light4 = script.Parent.PurgeLightning.Lights.LightEmitter4.PointLight
local Light5 = script.Parent.PurgeLightning.Lights.LightEmitter5.PointLight
local Light6 = script.Parent.PurgeLightning.Lights.LightEmitter6.PointLight
local Light7 = script.Parent.PurgeLightning.Lights.LightEmitter7.PointLight
local Light8 = script.Parent.PurgeLightning.Lights.LightEmitter8.PointLight
local Light9 = script.Parent.PurgeLightning.Lights.LightEmitter9.PointLight
local Light10 = script.Parent.PurgeLightning.Lights.LightEmitter10.PointLight
local Light11 = script.Parent.PurgeLightning.Lights.LightEmitter11.PointLight
local Light12 = script.Parent.PurgeLightning.Lights.LightEmitter12.PointLight

local Plasma = script.Parent.CentralCore.Hive.Plasma
local DeathTrigger = script.Parent.PurgeLightning.DeathTrigger
local CentralCorePurgeSound = script.Parent.PurgeLightning.SoundEmitter.CentralCorePurgeSound

local ElectricalDischarges = false

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

Trigger.ClickDetector.MouseClick:Connect(function()
	CentralCorePurgeSound:Play()
	wait(0.55)
	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown1:Play()
	wait(1.5)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()
	
	wait(2)
	
	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown1:Play()
	wait(1.5)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()
	
	wait(1.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown2:Play()
	wait(1.1)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()
	
	wait(0.5)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown3:Play()
	wait(0.9)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()
	
	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()
	
	wait(0.3)
	
	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.2)
	Plasma.Transparency = 0
	wait(0.2)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.4)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()

	wait(0.1)

	ElectricalDischarges = true
	Light1.Enabled = true
	Light2.Enabled = true
	Light3.Enabled = true
	Light4.Enabled = true
	Light5.Enabled = true
	Light6.Enabled = true
	Light7.Enabled = true
	Light8.Enabled = true
	Light9.Enabled = true
	Light10.Enabled = true
	Light11.Enabled = true
	Light12.Enabled = true
	DeathTrigger.CanTouch = true
	LightningDown4:Play()
	wait(0.2)
	PlasmaStart:Play()
	wait(0.2)
	ElectricalDischarges = false
	Light1.Enabled = false
	Light2.Enabled = false
	Light3.Enabled = false
	Light4.Enabled = false
	Light5.Enabled = false
	Light6.Enabled = false
	Light7.Enabled = false
	Light8.Enabled = false
	Light9.Enabled = false
	Light10.Enabled = false
	Light11.Enabled = false
	Light12.Enabled = false
	DeathTrigger.CanTouch = false
	wait(0.1)
	LightningUp:Play()
	
	wait(0.5)
	
	PlasmaEnd:Play()
	wait(5)
	Plasma.Size = Vector3.new(91.384, 91.384, 91.384)
end)

while true do
	if ElectricalDischarges == true then
		Lightning11.Transparency = 0
		Lightning12.Transparency = 0
		Lightning13.Transparency = 0
		Lightning14.Transparency = 0
		MainLightning11.Transparency = 0
		Lightning21.Transparency = 1
		Lightning22.Transparency = 1
		Lightning23.Transparency = 1
		Lightning24.Transparency = 1
		MainLightning21.Transparency = 1
		wait(0.01)
		Lightning11.Transparency = 1
		Lightning12.Transparency = 1
		Lightning13.Transparency = 1
		Lightning14.Transparency = 1
		MainLightning11.Transparency = 1
		Lightning21.Transparency = 0
		Lightning22.Transparency = 0
		Lightning23.Transparency = 0
		Lightning24.Transparency = 0
		MainLightning21.Transparency = 0
		wait(0.01)
	end
	if ElectricalDischarges == false then
		Lightning11.Transparency = 1
		Lightning12.Transparency = 1
		Lightning13.Transparency = 1
		Lightning14.Transparency = 1
		MainLightning11.Transparency = 1
		Lightning21.Transparency = 1
		Lightning22.Transparency = 1
		Lightning23.Transparency = 1
		Lightning24.Transparency = 1
		MainLightning21.Transparency = 1
	end
	wait(0.01)
end
