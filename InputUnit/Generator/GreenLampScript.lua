-- Values
local GeneratorStatusValue = script.Parent.Parent.Parent.CPU.Values.GeneratorStatusValue
local InfiniteModeValue = script.Parent.Parent.Parent.CPU.Values.InfiniteModeValue
--

-- Items
local GreenLamp = script.Parent.Parent.Parent.Control.LampSystem.GreenLamp
--

-- Sounds
local GeneratorBeepSound = script.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorBeepSound
--

-- Functions
function DoLamp(Lamp, Color, Mode)
	if Color == "Green" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Lime green")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Forest green")
			Lamp.Material = ("Plastic")
		end
	end
end
function StartIdleMode()
	repeat
		DoLamp(GreenLamp, "Green", "ON")
		GeneratorBeepSound:Play()
		wait(1.11)
		if GeneratorStatusValue.Value == "OFFLINE" then
			DoLamp(GreenLamp, "Green", "OFF")
		end
		wait(1.11)
	until GeneratorStatusValue.Value == "ONLINE"
end
--

wait(10)
StartIdleMode()

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "OFFLINE" and InfiniteModeValue.Value == true then
		wait(2)
		StartIdleMode()
	end
end)
