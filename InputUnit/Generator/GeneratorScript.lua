-- Control
local Lever = script.Parent.Parent.Parent.Control.Switch.Handle
local Button = script.Parent.Parent.Parent.Control.Button.Button
--

-- Values
local GeneratorStatusValue = script.Parent.Parent.Parent.CPU.Values.GeneratorStatusValue
local InfiniteModeValue = script.Parent.Parent.Parent.CPU.Values.InfiniteModeValue
--

-- Items
local Lamps = {
	script.Parent.Parent.Parent.Control.LampSystem.Lamp1,
	script.Parent.Parent.Parent.Control.LampSystem.Lamp2,
	script.Parent.Parent.Parent.Control.LampSystem.Lamp3,	
}

local GreenLamp = script.Parent.Parent.Parent.Control.LampSystem.GreenLamp
local OrangeLamp = script.Parent.Parent.Parent.Control.LampSystem.OrangeLamp.Lamp
local RedLamp = script.Parent.Parent.Parent.Control.LampSystem.RedLamp.Lamp
--

-- Sounds
local GeneratorStarterSounds = {
	script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorStarter1Sound,
	script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorStarter2Sound,
	script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorStarter3Sound,	
}

local GeneratorStartSound = script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorStartSound
local GeneratorWorkSound = script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorWorkSound
local GeneratorEndSound = script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorEndSound
--

-- Logic
local StarterCount = 0
--

-- Functions
function DoLamp(Lamp, Color, Mode)
	if Color == "Red" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Really red")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Crimson")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Green" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Lime green")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Forest green")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Orange" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Neon orange")
			Lamp.Material = ("Neon")
			Lamp.SpotLight.Enabled = true
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("CGA brown")
			Lamp.Material = ("Plastic")
			Lamp.SpotLight.Enabled = false
		end
	end
end
--

Lever.ClickDetector.MouseClick:Connect(function()
	if StarterCount < 3 then
		Lever.ClickDetector.MaxActivationDistance = 0
		StarterCount = StarterCount + 1
		local GeneratorStarterSound = GeneratorStarterSounds[StarterCount]
		GeneratorStarterSound:Play()
		wait(1)
		local Lamp = Lamps[StarterCount]
		Lamp.Material = ("Neon")
		if StarterCount < 3 then
			wait(1)
			Lever.ClickDetector.MaxActivationDistance = 10
		else
			Button.ClickDetector.MaxActivationDistance = 10
		end
	end
end)

Button.ClickDetector.MouseClick:Connect(function()
	if GeneratorStatusValue.Value == "OFFLINE" then
		GeneratorStatusValue.Value = "ONLINE"
		Button.ClickDetector.MaxActivationDistance = 0
		DoLamp(OrangeLamp, "Orange", "OFF")
		DoLamp(RedLamp, "Red", "ON")
		DoLamp(GreenLamp, "Green", "ON")
		GeneratorStartSound:Play()
		wait(GeneratorStartSound.TimeLength)
		GeneratorWorkSound:Play()
		Button.ClickDetector.MaxActivationDistance = 10
	elseif GeneratorStatusValue.Value == "ONLINE" then
		GeneratorStatusValue.Value = "OFFLINE"
		Button.ClickDetector.MaxActivationDistance = 0
		GeneratorWorkSound:Stop()
		GeneratorEndSound:Play()
		for _, Object in pairs(Lamps) do
			Object.Material = ("Metal")
		end
		DoLamp(GreenLamp, "Green", "OFF")
		wait(2)
		if InfiniteModeValue.Value == true then
			StarterCount = 0
			Lever.ClickDetector.MaxActivationDistance = 10
			DoLamp(OrangeLamp, "Orange", "ON")
			DoLamp(RedLamp, "Red", "OFF")
		end
	end
end)
