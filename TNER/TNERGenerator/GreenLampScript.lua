-- Values
local GeneratorStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.GeneratorStatusValue
local InfiniteModeValue = script.Parent.Parent.Parent.Parent.CPU.Values.InfiniteModeValue
--

-- Items
local GreenLamp = script.Parent
--

-- Sounds
local GeneratorBeepSound = script.Parent.Parent.Parent.Parent.Generator.SoundEmitter.GeneratorBeepSound
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
function StartIdleMode()
	repeat
		TurnOnGreenLamp()
		GeneratorBeepSound:Play()
		wait(1)
		if GeneratorStatusValue.Value == "OFFLINE" then
			TurnOffGreenLamp()
		end
		wait(1)
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
