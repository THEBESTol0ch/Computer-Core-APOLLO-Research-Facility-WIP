local TweenService = game:GetService("TweenService")

local Button = script.Parent.Button
local ButtonPos = script.Parent.ButtonPos
local CapHinge = script.Parent.PrimaryPart
local Cap = script.Parent.Cap
local ButtonSound = script.Parent.SoundEmitter.ButtonSound

local KWB1 = script.Parent.Parent.KWB1.Key
local KWB2 = script.Parent.Parent.KWB2.Key
local KWB1Value = script.Parent.Parent.KWB1.KWB1Value
local KWB2Value = script.Parent.Parent.KWB2.KWB2Value
local TargetValue = workspace.RailgunConsole.EmergencyButton.TargetValue

local Alarm1 = workspace.RailgunSpeaker1.SoundEmitter.Alarm1
local Alarm2 = workspace.RailgunSpeaker2.SoundEmitter.Alarm1
local EL1 = workspace.RailgunEmergencyLamps.EmergencyLamp1.Lamp
local EL2 = workspace.RailgunEmergencyLamps.EmergencyLamp2.Lamp
local EL3 = workspace.RailgunEmergencyLamps.EmergencyLamp3.Lamp
local EL4 = workspace.RailgunEmergencyLamps.EmergencyLamp4.Lamp

local BlackoutStatusValue = workspace.FacilityLight.CPU.Values.BlackoutStatusValue

local ButtonAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local CapAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Bounce,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local ButtonDown = {
	CFrame = ButtonPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ButtonUp = {
	CFrame = Button.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local CapDown = TweenService:Create(CapHinge,  CapAnimationSettings, {
	CFrame = CapHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local CapUp = TweenService:Create(CapHinge,  CapAnimationSettings, {
	CFrame = CapHinge.CFrame * CFrame.Angles(math.rad(90), 0, 0)
})

local ButtonDown = TweenService:Create(Button, ButtonAnimationSettings, ButtonDown)
local ButtonUp = TweenService:Create(Button, ButtonAnimationSettings, ButtonUp)

local CanEvent1 = true
local CanEvent2 = true

Button.ClickDetector.MouseClick:Connect(function()
	if KWB1Value.Value == 4 and KWB2Value.Value == 4 and TargetValue.Value == 1 then
		Button.ClickDetector.MaxActivationDistance = 0
		ButtonDown:Play()
		ButtonSound:Play()
		wait(0.4)
		ButtonUp:Play()
		wait(0.3)
		CapDown:Play()
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if KWB1Value.Value == 4 and KWB2Value.Value == 4 and TargetValue.Value == 1 then
		wait(10)
		KWB1Value.Value = 2
		wait(0.1)
		KWB2Value.Value = 2
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	KWB1.ClickDetector.MaxActivationDistance = 0
	KWB2.ClickDetector.MaxActivationDistance = 0
	workspace.RailgunBlastDoor.BlastDoor.BlastDoorValue.Value = 0
	wait(7.15)
	workspace.FacilityLight.RailgunLight.SpotLightsPack1.MainSpotLight.Lamp.Material = ("Metal")
	workspace.FacilityLight.RailgunLight.SpotLightsPack1.MainSpotLight.Lamp.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack1.ArtificalLight.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack2.MainSpotLight.Lamp.Material = ("Metal")
	workspace.FacilityLight.RailgunLight.SpotLightsPack2.MainSpotLight.Lamp.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack2.ArtificalLight.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack3.MainSpotLight.Lamp.Material = ("Metal")
	workspace.FacilityLight.RailgunLight.SpotLightsPack3.MainSpotLight.Lamp.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack3.ArtificalLight.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack4.MainSpotLight.Lamp.Material = ("Metal")
	workspace.FacilityLight.RailgunLight.SpotLightsPack4.MainSpotLight.Lamp.PointLight.Enabled = false
	workspace.FacilityLight.RailgunLight.SpotLightsPack4.ArtificalLight.PointLight.Enabled = false
	Alarm1:Stop()
	Alarm2:Stop()
	EL1.SpotLight.Enabled = false
	EL1.HingeConstraint.AngularVelocity = 0
	EL2.SpotLight.Enabled = false
	EL2.HingeConstraint.AngularVelocity = 0
	EL3.SpotLight.Enabled = false
	EL3.HingeConstraint.AngularVelocity = 0
	EL4.SpotLight.Enabled = false
	EL4.HingeConstraint.AngularVelocity = 0
	wait(7)
	if BlackoutStatusValue.Value == 0 then
		workspace.FacilityLight.RailgunLight.SpotLightsPack1.MainSpotLight.Lamp.Material = ("Neon")
		workspace.FacilityLight.RailgunLight.SpotLightsPack1.MainSpotLight.Lamp.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack1.ArtificalLight.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack1.MainSpotLight.Lamp.SpotLightSound:Play()
		wait(1)
		workspace.FacilityLight.RailgunLight.SpotLightsPack2.MainSpotLight.Lamp.Material = ("Neon")
		workspace.FacilityLight.RailgunLight.SpotLightsPack2.MainSpotLight.Lamp.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack2.ArtificalLight.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack2.MainSpotLight.Lamp.SpotLightSound:Play()
		wait(1)
		workspace.FacilityLight.RailgunLight.SpotLightsPack3.MainSpotLight.Lamp.Material = ("Neon")
		workspace.FacilityLight.RailgunLight.SpotLightsPack3.MainSpotLight.Lamp.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack3.ArtificalLight.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack3.MainSpotLight.Lamp.SpotLightSound:Play()
		wait(1)
		workspace.FacilityLight.RailgunLight.SpotLightsPack4.MainSpotLight.Lamp.Material = ("Neon")
		workspace.FacilityLight.RailgunLight.SpotLightsPack4.MainSpotLight.Lamp.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack4.ArtificalLight.PointLight.Enabled = true
		workspace.FacilityLight.RailgunLight.SpotLightsPack4.MainSpotLight.Lamp.SpotLightSound:Play()
	end
	workspace.RailgunBlastDoor.BlastDoor.BlastDoorValue.Value = 1
end)

while true do
	if KWB1Value.Value == 3 or KWB2Value.Value == 3 or TargetValue.Value == 0 and CanEvent2 == true then
		Button.ClickDetector.MaxActivationDistance = 0
		CanEvent1 = true
		CanEvent2 = false
		CapDown:Play()
		Alarm1:Stop()
		Alarm2:Stop()
		EL1.SpotLight.Enabled = false
		EL1.HingeConstraint.AngularVelocity = 0
		EL2.SpotLight.Enabled = false
		EL2.HingeConstraint.AngularVelocity = 0
		EL3.SpotLight.Enabled = false
		EL3.HingeConstraint.AngularVelocity = 0
		EL4.SpotLight.Enabled = false
		EL4.HingeConstraint.AngularVelocity = 0
	end
	if KWB1Value.Value == 4 and KWB2Value.Value == 4 and TargetValue.Value == 1 and CanEvent1 == true then
		Button.ClickDetector.MaxActivationDistance = 10
		CanEvent1 = false
		CanEvent2 = true
		CapUp:Play()
		EL1.SpotLight.Enabled = true
		EL1.HingeConstraint.AngularVelocity = 5
		EL2.SpotLight.Enabled = true
		EL2.HingeConstraint.AngularVelocity = 5
		EL3.SpotLight.Enabled = true
		EL3.HingeConstraint.AngularVelocity = 5
		EL4.SpotLight.Enabled = true
		EL4.HingeConstraint.AngularVelocity = 5
		Alarm1:Play()
		wait(0.05)
		Alarm2:Play()
	end
	wait(0.1)
end
