-- Values
local FEMStatusValue = script.Parent.Parent.Values.FEMStatusValue
local GeneratorStatusValue = workspace.TNERGenerator.CPU.Values.GeneratorStatusValue
--

-- Items
local Lamp = script.Parent.Parent.Parent.MovingConnector.SmallLamp.Lamp
--

-- Functions
function TurnOffLights()
	Lamp.RedLight.Enabled = false
	Lamp.OrangeLight.Enabled = false
	Lamp.GreenLight.Enabled = false
end
function DoLamp(Lamp, Color, Mode)
	if Color == "Red" then
		if Mode == "ON" then
			TurnOffLights()
			Lamp.BrickColor = BrickColor.new("Really red")
			Lamp.Material = ("Neon")
			Lamp[Color.."Light"].Enabled = true
		elseif Mode == "OFF" then
			TurnOffLights()
			Lamp.BrickColor = BrickColor.new("Crimson")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Orange" then
		if Mode == "ON" then
			TurnOffLights()
			Lamp.BrickColor = BrickColor.new("Neon orange")
			Lamp.Material = ("Neon")
			Lamp[Color.."Light"].Enabled = true
		elseif Mode == "OFF" then
			TurnOffLights()
			Lamp.BrickColor = BrickColor.new("CGA brown")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Green" then
		if Mode == "ON" then
			TurnOffLights()
			Lamp.BrickColor = BrickColor.new("Lime green")
			Lamp.Material = ("Neon")
			Lamp[Color.."Light"].Enabled = true
		elseif Mode == "OFF" then
			TurnOffLights()
			Lamp.BrickColor = BrickColor.new("Forest green")
			Lamp.Material = ("Plastic")
		end
	end
end
function StartBlinking()
	repeat
		if FEMStatusValue.Value == "ENGAGE" or FEMStatusValue.Value == "DISENGAGE" then DoLamp(Lamp, "Orange", "ON") end
		wait(1)
		if FEMStatusValue.Value == "ENGAGE" or FEMStatusValue.Value == "DISENGAGE" then DoLamp(Lamp, "Orange", "OFF") end
		wait(1)
	until FEMStatusValue.Value == "ONLINE" or FEMStatusValue.Value == "OFFLINE"
end
--

FEMStatusValue.Changed:Connect(function()
	if FEMStatusValue.Value == "ENGAGE" or FEMStatusValue.Value == "DISENGAGE" then
		StartBlinking()
	end
	if FEMStatusValue.Value == "ONLINE" then
		DoLamp(Lamp, "Green", "ON")
	elseif FEMStatusValue.Value == "OFFLINE" then
		DoLamp(Lamp, "Red", "ON")
	end
end)

GeneratorStatusValue.Changed:Connect(function()
	if GeneratorStatusValue.Value == "ONLINE" then
		DoLamp(Lamp, "Red", "ON")
	end
end)
