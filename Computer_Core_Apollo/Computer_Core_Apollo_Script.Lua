local TweenService = game:GetService("TweenService")

local Button = workspace.ApolloConsole.ApolloControl.EmergencyButton.Button
local Trigger = script.Parent.Parent.Parent.Interiror.Trigger

local Apollo = script.Parent.Parent.Parent.Frame
local ApolloPos1 = script.Parent.Parent.Parent.Pos1
local ApolloPos2 = script.Parent.Parent.Parent.Pos2

local ApolloMovingSound = script.Parent.Parent.Parent.Frame.ApolloMovingSound

local ApolloStatusValue = script.Parent.Parent.Values.ApolloStatusValue
local DoorControlValue = script.Parent.Parent.Parent.Door.CPU.Values.DoorControlValue
local KeyCapValue = workspace.ApolloConsole.ApolloControl.KWB1.CPU.Values.KeyCapValue
local CapControlValue = workspace.ApolloConsole.BridgeControl.CapControlValue
local DoorStatusValue = script.Parent.Parent.Parent.Door.CPU.Values.DoorStatusValue

local ApolloStatusLabel = workspace.ApolloMonitor.Lines.ApolloStatus.SurfaceGui.TextLabel

local ArtificalLight1 = workspace.ApolloChamber.ArtificalLights.ArtificalLight1.PointLight
local ArtificalLight2 = workspace.ApolloChamber.ArtificalLights.ArtificalLight2.PointLight
local ArtificalLight3 = workspace.ApolloChamber.ArtificalLights.ArtificalLight3.PointLight
local ArtificalLight4 = workspace.ApolloChamber.ArtificalLights.ArtificalLight4.PointLight
local ArtificalLight5 = workspace.ApolloChamber.ArtificalLights.ArtificalLight5.PointLight
local ArtificalLight6 = workspace.ApolloChamber.ArtificalLights.ArtificalLight6.PointLight
local ArtificalLight7 = workspace.ApolloChamber.ArtificalLights.ArtificalLight7.PointLight
local ArtificalLight8 = workspace.ApolloChamber.ArtificalLights.ArtificalLight8.PointLight
local ArtificalLight9 = workspace.ApolloChamber.ArtificalLights.ArtificalLight9.PointLight
local ArtificalLight10 = workspace.ApolloChamber.ArtificalLights.ArtificalLight10.PointLight
local ArtificalLight11 = workspace.ApolloChamber.ArtificalLights.ArtificalLight11.PointLight
local ArtificalLight12 = workspace.ApolloChamber.ArtificalLights.ArtificalLight12.PointLight
local ArtificalLight13 = workspace.ApolloChamber.ArtificalLights.ArtificalLight13.PointLight
local ArtificalLight14 = workspace.ApolloChamber.ArtificalLights.ArtificalLight14.PointLight
local ArtificalLight15 = workspace.ApolloChamber.ArtificalLights.ArtificalLight15.PointLight
local ArtificalLight16 = workspace.ApolloChamber.ArtificalLights.ArtificalLight16.PointLight
local ArtificalLight17 = workspace.ApolloChamber.ArtificalLights.ArtificalLight17.PointLight
local ArtificalLight18 = workspace.ApolloChamber.ArtificalLights.ArtificalLight18.PointLight
local ArtificalLight19 = workspace.ApolloChamber.ArtificalLights.ArtificalLight19.PointLight
local ArtificalLight20 = workspace.ApolloChamber.ArtificalLights.ArtificalLight20.PointLight
local ArtificalLight21 = workspace.ApolloChamber.ArtificalLights.ArtificalLight21.PointLight
local ArtificalLight22 = workspace.ApolloChamber.ArtificalLights.ArtificalLight22.PointLight
local ArtificalLight23 = workspace.ApolloChamber.ArtificalLights.ArtificalLight23.PointLight
local ArtificalLight24 = workspace.ApolloChamber.ArtificalLights.ArtificalLight24.PointLight
local ArtificalLight25 = workspace.ApolloChamber.ArtificalLights.ArtificalLight25.PointLight

local SmallLamp1 = workspace.ApolloChamber.SmallLamps.Lamp1.Lamp
local SmallLamp2 = workspace.ApolloChamber.SmallLamps.Lamp2.Lamp
local SmallLamp3 = workspace.ApolloChamber.SmallLamps.Lamp3.Lamp
local SmallLamp4 = workspace.ApolloChamber.SmallLamps.Lamp4.Lamp
local SmallLamp5 = workspace.ApolloChamber.SmallLamps.Lamp5.Lamp
local SmallLamp6 = workspace.ApolloChamber.SmallLamps.Lamp6.Lamp
local SmallLamp7 = workspace.ApolloChamber.SmallLamps.Lamp7.Lamp
local SmallLamp8 = workspace.ApolloChamber.SmallLamps.Lamp8.Lamp
local SmallLamp9 = workspace.ApolloChamber.SmallLamps.Lamp9.Lamp
local SmallLamp10 = workspace.ApolloChamber.SmallLamps.Lamp10.Lamp
local SmallLamp11 = workspace.ApolloChamber.SmallLamps.Lamp11.Lamp
local SmallLamp12 = workspace.ApolloChamber.SmallLamps.Lamp12.Lamp

local LargeLamp1 = workspace.ApolloChamber.LargeLamps.Lamp1.Lamp
local LargeLamp2 = workspace.ApolloChamber.LargeLamps.Lamp2.Lamp
local LargeLamp3 = workspace.ApolloChamber.LargeLamps.Lamp3.Lamp
local LargeLamp4 = workspace.ApolloChamber.LargeLamps.Lamp4.Lamp
local LargeLamp5 = workspace.ApolloChamber.LargeLamps.Lamp5.Lamp
local LargeLamp6 = workspace.ApolloChamber.LargeLamps.Lamp6.Lamp
local LargeLamp7 = workspace.ApolloChamber.LargeLamps.Lamp7.Lamp
local LargeLamp8 = workspace.ApolloChamber.LargeLamps.Lamp8.Lamp
local LargeLamp9 = workspace.ApolloChamber.LargeLamps.Lamp9.Lamp
local LargeLamp10 = workspace.ApolloChamber.LargeLamps.Lamp10.Lamp
local LargeLamp11 = workspace.ApolloChamber.LargeLamps.Lamp11.Lamp
local LargeLamp12 = workspace.ApolloChamber.LargeLamps.Lamp12.Lamp

local Smoke1 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter1.Smoke
local Smoke2 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter2.Smoke
local Smoke3 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter3.Smoke
local Smoke4 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter4.Smoke
local Smoke5 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter5.Smoke
local Smoke6 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter6.Smoke
local Smoke7 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter7.Smoke
local Smoke8 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter8.Smoke
local Smoke9 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter9.Smoke
local Smoke10 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter10.Smoke
local Smoke11 = workspace.ApolloChamber.SmokeEmitters.SmokeEmitter11.Smoke

local ApolloMoveUp = {
	CFrame = ApolloPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ApolloMoveDown = {
	CFrame = ApolloPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local ApolloAnimationSettings = TweenInfo.new(
	11,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local ApolloMoveUp = TweenService:Create(Apollo, ApolloAnimationSettings, ApolloMoveUp)
local ApolloMoveDown = TweenService:Create(Apollo, ApolloAnimationSettings, ApolloMoveDown)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 0 then
		ApolloMovingSound.TimePosition = 0
		ApolloMovingSound:Play()
		wait(22)
		ApolloMoveUp:Play()
		DoorControlValue.Value = 1
		ApolloStatusLabel.Text = ("MOVING...")
		ApolloStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		wait(11)
		Trigger.CanTouch = false
		ApolloStatusValue.Value = 1
		ApolloStatusLabel.Text = ("ACCESS MODE")
		ApolloStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
		CapControlValue.Value = 1
		wait(20)
		KeyCapValue.Value = 1
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 1 then
		CapControlValue.Value = 0
		Trigger.CanTouch = true
		wait(0.5)
		ApolloStatusValue.Value = 0
		if DoorStatusValue.Value == 0 then
			DoorControlValue.Value = 3
			wait(5)
			ApolloMovingSound.TimePosition = 17
			ApolloMovingSound:Play()
			wait(5)
			ApolloMoveDown:Play()
			DoorControlValue.Value = 0
			ApolloStatusLabel.Text = ("MOVING...")
			ApolloStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
			wait(11)
			ApolloStatusLabel.Text = ("STABLE")
			ApolloStatusLabel.TextColor3 = Color3.new(0, 1, 0)
			wait(20)
			KeyCapValue.Value = 1
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 1 then
		if DoorStatusValue.Value == 1 then
			ApolloMovingSound.TimePosition = 17
			ApolloMovingSound:Play()
			wait(5)
			ApolloMoveDown:Play()
			DoorControlValue.Value = 0
			ApolloStatusLabel.Text = ("MOVING...")
			ApolloStatusLabel.TextColor3 = Color3.new(1, 0.666667, 0)
			wait(11)
			ApolloStatusLabel.Text = ("STABLE")
			ApolloStatusLabel.TextColor3 = Color3.new(0, 1, 0)
			wait(20)
			KeyCapValue.Value = 1
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 0 then
		SmallLamp1.Material = ("Neon")
		wait(0.5)
		SmallLamp2.Material = ("Neon")
		wait(0.5)
		SmallLamp3.Material = ("Neon")
		wait(0.5)
		SmallLamp4.Material = ("Neon")
		ArtificalLight1.Enabled = true
		ArtificalLight2.Enabled = true
		ArtificalLight3.Enabled = true
		ArtificalLight4.Enabled = true
		ArtificalLight5.Enabled = true
		ArtificalLight6.Enabled = true
		wait(0.5)
		SmallLamp5.Material = ("Neon")
		wait(0.5)
		SmallLamp6.Material = ("Neon")
		wait(0.5)
		SmallLamp7.Material = ("Neon")
		wait(0.5)
		SmallLamp8.Material = ("Neon")
		ArtificalLight7.Enabled = true
		ArtificalLight8.Enabled = true
		ArtificalLight9.Enabled = true
		ArtificalLight10.Enabled = true
		ArtificalLight11.Enabled = true
		ArtificalLight12.Enabled = true
		wait(0.5)
		SmallLamp9.Material = ("Neon")
		wait(0.5)
		SmallLamp10.Material = ("Neon")
		wait(0.5)
		SmallLamp11.Material = ("Neon")
		wait(0.5)
		SmallLamp12.Material = ("Neon")
		ArtificalLight13.Enabled = true
		ArtificalLight14.Enabled = true
		ArtificalLight15.Enabled = true
		ArtificalLight16.Enabled = true
		ArtificalLight17.Enabled = true
		ArtificalLight18.Enabled = true
		wait(0.5)
		LargeLamp1.Material = ("Neon")
		wait(0.5)
		LargeLamp2.Material = ("Neon")
		wait(0.5)
		LargeLamp3.Material = ("Neon")
		wait(0.5)
		LargeLamp4.Material = ("Neon")
		ArtificalLight19.Enabled = true
		ArtificalLight20.Enabled = true
		ArtificalLight21.Enabled = true
		ArtificalLight22.Enabled = true
		ArtificalLight23.Enabled = true
		ArtificalLight24.Enabled = true
		ArtificalLight25.Enabled = true
		wait(0.5)
		LargeLamp5.Material = ("Neon")
		wait(0.5)
		LargeLamp6.Material = ("Neon")
		wait(0.5)
		LargeLamp7.Material = ("Neon")
		wait(0.5)
		LargeLamp8.Material = ("Neon")
		wait(0.5)
		LargeLamp9.Material = ("Neon")
		wait(0.5)
		LargeLamp10.Material = ("Neon")
		wait(0.5)
		LargeLamp11.Material = ("Neon")
		wait(0.5)
		LargeLamp12.Material = ("Neon")
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 0 then
		wait(21)
		Smoke1.Enabled = true
		Smoke2.Enabled = true
		Smoke3.Enabled = true
		Smoke4.Enabled = true
		Smoke5.Enabled = true
		Smoke6.Enabled = true
		Smoke7.Enabled = true
		Smoke8.Enabled = true
		Smoke9.Enabled = true
		Smoke10.Enabled = true
		Smoke11.Enabled = true
		wait(14)
		Smoke1.Enabled = false
		Smoke2.Enabled = false
		Smoke3.Enabled = false
		Smoke4.Enabled = false
		Smoke5.Enabled = false
		Smoke6.Enabled = false
		Smoke7.Enabled = false
		Smoke8.Enabled = false
		Smoke9.Enabled = false
		Smoke10.Enabled = false
		Smoke11.Enabled = false
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 1 then
		if DoorStatusValue.Value == 0 then
			wait(20)
			SmallLamp1.Material = ("Metal")
			wait(0.5)
			SmallLamp2.Material = ("Metal")
			wait(0.5)
			SmallLamp3.Material = ("Metal")
			wait(0.5)
			SmallLamp4.Material = ("Metal")
			ArtificalLight1.Enabled = false
			ArtificalLight2.Enabled = false
			ArtificalLight3.Enabled = false
			ArtificalLight4.Enabled = false
			ArtificalLight5.Enabled = false
			ArtificalLight6.Enabled = false
			wait(0.5)
			SmallLamp5.Material = ("Metal")
			wait(0.5)
			SmallLamp6.Material = ("Metal")
			wait(0.5)
			SmallLamp7.Material = ("Metal")
			wait(0.5)
			SmallLamp8.Material = ("Metal")
			ArtificalLight7.Enabled = false
			ArtificalLight8.Enabled = false
			ArtificalLight9.Enabled = false
			ArtificalLight10.Enabled = false
			ArtificalLight11.Enabled = false
			ArtificalLight12.Enabled = false
			wait(0.5)
			SmallLamp9.Material = ("Metal")
			wait(0.5)
			SmallLamp10.Material = ("Metal")
			wait(0.5)
			SmallLamp11.Material = ("Metal")
			wait(0.5)
			SmallLamp12.Material = ("Metal")
			ArtificalLight13.Enabled = false
			ArtificalLight14.Enabled = false
			ArtificalLight15.Enabled = false
			ArtificalLight16.Enabled = false
			ArtificalLight17.Enabled = false
			ArtificalLight18.Enabled = false
			wait(0.5)
			LargeLamp1.Material = ("Metal")
			wait(0.5)
			LargeLamp2.Material = ("Metal")
			wait(0.5)
			LargeLamp3.Material = ("Metal")
			wait(0.5)
			LargeLamp4.Material = ("Metal")
			ArtificalLight19.Enabled = false
			ArtificalLight20.Enabled = false
			ArtificalLight21.Enabled = false
			ArtificalLight22.Enabled = false
			ArtificalLight23.Enabled = false
			ArtificalLight24.Enabled = false
			ArtificalLight25.Enabled = false
			wait(0.5)
			LargeLamp5.Material = ("Metal")
			wait(0.5)
			LargeLamp6.Material = ("Metal")
			wait(0.5)
			LargeLamp7.Material = ("Metal")
			wait(0.5)
			LargeLamp8.Material = ("Metal")
			wait(0.5)
			LargeLamp9.Material = ("Metal")
			wait(0.5)
			LargeLamp10.Material = ("Metal")
			wait(0.5)
			LargeLamp11.Material = ("Metal")
			wait(0.5)
			LargeLamp12.Material = ("Metal")
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 1 then
		if DoorStatusValue.Value == 1 then
			wait(15)
			SmallLamp1.Material = ("Metal")
			wait(0.5)
			SmallLamp2.Material = ("Metal")
			wait(0.5)
			SmallLamp3.Material = ("Metal")
			wait(0.5)
			SmallLamp4.Material = ("Metal")
			ArtificalLight1.Enabled = false
			ArtificalLight2.Enabled = false
			ArtificalLight3.Enabled = false
			ArtificalLight4.Enabled = false
			ArtificalLight5.Enabled = false
			ArtificalLight6.Enabled = false
			wait(0.5)
			SmallLamp5.Material = ("Metal")
			wait(0.5)
			SmallLamp6.Material = ("Metal")
			wait(0.5)
			SmallLamp7.Material = ("Metal")
			wait(0.5)
			SmallLamp8.Material = ("Metal")
			ArtificalLight7.Enabled = false
			ArtificalLight8.Enabled = false
			ArtificalLight9.Enabled = false
			ArtificalLight10.Enabled = false
			ArtificalLight11.Enabled = false
			ArtificalLight12.Enabled = false
			wait(0.5)
			SmallLamp9.Material = ("Metal")
			wait(0.5)
			SmallLamp10.Material = ("Metal")
			wait(0.5)
			SmallLamp11.Material = ("Metal")
			wait(0.5)
			SmallLamp12.Material = ("Metal")
			ArtificalLight13.Enabled = false
			ArtificalLight14.Enabled = false
			ArtificalLight15.Enabled = false
			ArtificalLight16.Enabled = false
			ArtificalLight17.Enabled = false
			ArtificalLight18.Enabled = false
			wait(0.5)
			LargeLamp1.Material = ("Metal")
			wait(0.5)
			LargeLamp2.Material = ("Metal")
			wait(0.5)
			LargeLamp3.Material = ("Metal")
			wait(0.5)
			LargeLamp4.Material = ("Metal")
			ArtificalLight19.Enabled = false
			ArtificalLight20.Enabled = false
			ArtificalLight21.Enabled = false
			ArtificalLight22.Enabled = false
			ArtificalLight23.Enabled = false
			ArtificalLight24.Enabled = false
			ArtificalLight25.Enabled = false
			wait(0.5)
			LargeLamp5.Material = ("Metal")
			wait(0.5)
			LargeLamp6.Material = ("Metal")
			wait(0.5)
			LargeLamp7.Material = ("Metal")
			wait(0.5)
			LargeLamp8.Material = ("Metal")
			wait(0.5)
			LargeLamp9.Material = ("Metal")
			wait(0.5)
			LargeLamp10.Material = ("Metal")
			wait(0.5)
			LargeLamp11.Material = ("Metal")
			wait(0.5)
			LargeLamp12.Material = ("Metal")
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 1 then
		if DoorStatusValue.Value == 0 then
			wait(9)
			Smoke1.Enabled = true
			Smoke2.Enabled = true
			Smoke3.Enabled = true
			Smoke4.Enabled = true
			Smoke5.Enabled = true
			Smoke6.Enabled = true
			Smoke7.Enabled = true
			Smoke8.Enabled = true
			Smoke9.Enabled = true
			Smoke10.Enabled = true
			Smoke11.Enabled = true
			wait(11)
			Smoke1.Enabled = false
			Smoke2.Enabled = false
			Smoke3.Enabled = false
			Smoke4.Enabled = false
			Smoke5.Enabled = false
			Smoke6.Enabled = false
			Smoke7.Enabled = false
			Smoke8.Enabled = false
			Smoke9.Enabled = false
			Smoke10.Enabled = false
			Smoke11.Enabled = false
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if ApolloStatusValue.Value == 1 then
		if DoorStatusValue.Value == 1 then
			wait(4)
			Smoke1.Enabled = true
			Smoke2.Enabled = true
			Smoke3.Enabled = true
			Smoke4.Enabled = true
			Smoke5.Enabled = true
			Smoke6.Enabled = true
			Smoke7.Enabled = true
			Smoke8.Enabled = true
			Smoke9.Enabled = true
			Smoke10.Enabled = true
			Smoke11.Enabled = true
			wait(11)
			Smoke1.Enabled = false
			Smoke2.Enabled = false
			Smoke3.Enabled = false
			Smoke4.Enabled = false
			Smoke5.Enabled = false
			Smoke6.Enabled = false
			Smoke7.Enabled = false
			Smoke8.Enabled = false
			Smoke9.Enabled = false
			Smoke10.Enabled = false
			Smoke11.Enabled = false
		end
	end
end)
