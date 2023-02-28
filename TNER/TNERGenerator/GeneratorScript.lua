-- Control
local Lever = script.Parent.Parent.Parent.Control.SwitchWithHandle.Handle
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
local OrangeLamp = script.Parent.Parent.Parent.Control.LampSystem.OrangeLamp
local RedLamp = script.Parent.Parent.Parent.Control.LampSystem.RedLamp
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
function TurnOnGreenLamp()
	GreenLamp.Material = ("Neon")
	GreenLamp.BrickColor = BrickColor.new("Lime green")
end
function TurnOffGreenLamp()
	GreenLamp.Material = ("Metal")
	GreenLamp.BrickColor = BrickColor.new("Forest green")
end
function TurnOnRedLamp()
	RedLamp.Material = ("Neon")
	RedLamp.BrickColor = BrickColor.new("Really red")
end
function TurnOffRedLamp()
	RedLamp.Material = ("Metal")
	RedLamp.BrickColor = BrickColor.new("Maroon")
end
function TurnOnOrangeLamp()
	OrangeLamp.Material = ("Neon")
	OrangeLamp.SpotLight.Enabled = true
end
function TurnOffOrangeLamp()
	OrangeLamp.Material = ("Metal")
	OrangeLamp.SpotLight.Enabled = false
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
		TurnOffOrangeLamp()
		TurnOnRedLamp()
		TurnOnGreenLamp()
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
		TurnOffGreenLamp()
		wait(2)
		if InfiniteModeValue.Value == true then
			StarterCount = 0
			Lever.ClickDetector.MaxActivationDistance = 10
			TurnOnOrangeLamp()
			TurnOffRedLamp()
		end
	end
end)
