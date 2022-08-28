local TweenService = game:GetService("TweenService")

local Fan1 = script.Parent.AirSystem.AirlockFan1.Fan
local Fan2 = script.Parent.AirSystem.AirlockFan2.Fan
local FansSound = script.Parent.AirSystem.FanSoundEmitter.FansSound
local AirlockProcessSound = script.Parent.AirSystem.AirlockSoundEmitter.AirlockProcessSound
local SmokeSound = script.Parent.AirSystem.AirlockSoundEmitter.SmokeSound
local Smoke1 = script.Parent.AirSystem.SmokeEmitter1.Smoke
local Smoke2 = script.Parent.AirSystem.SmokeEmitter2.Smoke
local Smoke3 = script.Parent.AirSystem.SmokeEmitter3.Smoke

local BlastDoor1 = script.Parent.BlastDoors.BlastDoor1.BlastDoor.BlastDoor
local BlastDoor1PosOpen = script.Parent.BlastDoors.BlastDoor1.BlastDoor.BlastDoorPosOpen
local BlastDoor1PosClose = script.Parent.BlastDoors.BlastDoor1.BlastDoor.BlastDoorPosClose
local BlastDoor1OpenSound = script.Parent.BlastDoors.BlastDoor1.BlastDoor.SoundEmitter.BlastDoorOpenSound
local BlastDoor1CloseSound = script.Parent.BlastDoors.BlastDoor1.BlastDoor.SoundEmitter.BlastDoorCloseSound

local BlastDoor2 = script.Parent.BlastDoors.BlastDoor2.BlastDoor.BlastDoor
local BlastDoor2PosOpen = script.Parent.BlastDoors.BlastDoor2.BlastDoor.BlastDoorPosOpen
local BlastDoor2PosClose = script.Parent.BlastDoors.BlastDoor2.BlastDoor.BlastDoorPosClose
local BlastDoor2OpenSound = script.Parent.BlastDoors.BlastDoor2.BlastDoor.SoundEmitter.BlastDoorOpenSound
local BlastDoor2CloseSound = script.Parent.BlastDoors.BlastDoor2.BlastDoor.SoundEmitter.BlastDoorCloseSound

local Button1 = script.Parent.Buttons.Button1.Button
local Button2 = script.Parent.Buttons.Button2.Button
local Button3 = script.Parent.Buttons.Button3.Button
local Button4 = script.Parent.Buttons.Button4.Button

local ELMain = script.Parent.EmergencyLamps.EmergencyLampMain.Lamp
local EL11BD = script.Parent.EmergencyLamps.EmergencyLamp11BD.Lamp
local EL21BD = script.Parent.EmergencyLamps.EmergencyLamp21BD.Lamp
local EL12BD = script.Parent.EmergencyLamps.EmergencyLamp12BD.Lamp
local EL22BD = script.Parent.EmergencyLamps.EmergencyLamp22BD.Lamp

local BlastDoor1Open = {
	CFrame = BlastDoor1PosOpen.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BlastDoor1Close = {
	CFrame = BlastDoor1PosClose.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local BlastDoor2Open = {
	CFrame = BlastDoor2PosOpen.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local BlastDoor2Close = {
	CFrame = BlastDoor2PosClose.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local BlastDoorsAnimationSettings = TweenInfo.new(
	5.9,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local BlastDoor1Open = TweenService:Create(BlastDoor1, BlastDoorsAnimationSettings, BlastDoor1Open)
local BlastDoor1Close = TweenService:Create(BlastDoor1, BlastDoorsAnimationSettings, BlastDoor1Close)

local BlastDoor2Open = TweenService:Create(BlastDoor2, BlastDoorsAnimationSettings, BlastDoor2Open)
local BlastDoor2Close = TweenService:Create(BlastDoor2, BlastDoorsAnimationSettings, BlastDoor2Close)

local BlastDoor1Status = false
local BlastDoor2Status = true

Button1.ClickDetector.MouseClick:Connect(function()
	if BlastDoor1Status == false and BlastDoor2Status == true then
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor2Close:Play()
		BlastDoor2CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		wait(5.9)
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		BlastDoor2Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor1Open:Play()
		BlastDoor1OpenSound:Play()
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		BlastDoor1Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	else
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor1Close:Play()
		BlastDoor1CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		wait(5.9)
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		BlastDoor1Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor2Open:Play()
		BlastDoor2OpenSound:Play()
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		BlastDoor2Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	end
end)

Button2.ClickDetector.MouseClick:Connect(function()
	if BlastDoor1Status == false and BlastDoor2Status == true then
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor2Close:Play()
		BlastDoor2CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		wait(5.9)
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		BlastDoor2Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor1Open:Play()
		BlastDoor1OpenSound:Play()
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		BlastDoor1Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	else
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor1Close:Play()
		BlastDoor1CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		wait(5.9)
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		BlastDoor1Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor2Open:Play()
		BlastDoor2OpenSound:Play()
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		BlastDoor2Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	end
end)

Button3.ClickDetector.MouseClick:Connect(function()
	if BlastDoor1Status == false and BlastDoor2Status == true then
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor2Close:Play()
		BlastDoor2CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		wait(5.9)
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		BlastDoor2Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor1Open:Play()
		BlastDoor1OpenSound:Play()
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		BlastDoor1Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	else
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor1Close:Play()
		BlastDoor1CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		wait(5.9)
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		BlastDoor1Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor2Open:Play()
		BlastDoor2OpenSound:Play()
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		BlastDoor2Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	end
end)

Button4.ClickDetector.MouseClick:Connect(function()
	if BlastDoor1Status == false and BlastDoor2Status == true then
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor2Close:Play()
		BlastDoor2CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		wait(5.9)
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		BlastDoor2Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor1Open:Play()
		BlastDoor1OpenSound:Play()
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		BlastDoor1Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	else
		Button1.ClickDetector.MaxActivationDistance = 0
		Button2.ClickDetector.MaxActivationDistance = 0
		Button3.ClickDetector.MaxActivationDistance = 0
		Button4.ClickDetector.MaxActivationDistance = 0
		BlastDoor1Close:Play()
		BlastDoor1CloseSound:Play()
		ELMain.HingeConstraint.AngularVelocity = 5
		ELMain.SpotLight.Enabled = true
		EL11BD.HingeConstraint.AngularVelocity = 5
		EL11BD.SpotLight.Enabled = true
		EL21BD.HingeConstraint.AngularVelocity = 5
		EL21BD.SpotLight.Enabled = true
		wait(5.9)
		EL11BD.HingeConstraint.AngularVelocity = 0
		EL11BD.SpotLight.Enabled = false
		EL21BD.HingeConstraint.AngularVelocity = 0
		EL21BD.SpotLight.Enabled = false
		BlastDoor1Status = false
		wait(1.1)
		SmokeSound:Play()
		AirlockProcessSound:Play()
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		FansSound:Play()
		wait(1)
		Fan1.HingeConstraint.AngularVelocity = -5
		Fan2.HingeConstraint.AngularVelocity = 5
		wait(3)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		wait(4)
		Fan1.HingeConstraint.AngularVelocity = 0
		Fan2.HingeConstraint.AngularVelocity = 0
		wait(2)
		BlastDoor2Open:Play()
		BlastDoor2OpenSound:Play()
		EL12BD.HingeConstraint.AngularVelocity = 5
		EL12BD.SpotLight.Enabled = true
		EL22BD.HingeConstraint.AngularVelocity = 5
		EL22BD.SpotLight.Enabled = true
		BlastDoor2Status = true
		wait(5.7)
		ELMain.HingeConstraint.AngularVelocity = 0
		ELMain.SpotLight.Enabled = false
		EL12BD.HingeConstraint.AngularVelocity = 0
		EL12BD.SpotLight.Enabled = false
		EL22BD.HingeConstraint.AngularVelocity = 0
		EL22BD.SpotLight.Enabled = false
		Button1.ClickDetector.MaxActivationDistance = 10
		Button2.ClickDetector.MaxActivationDistance = 10
		Button3.ClickDetector.MaxActivationDistance = 10
		Button4.ClickDetector.MaxActivationDistance = 10
	end
end)
