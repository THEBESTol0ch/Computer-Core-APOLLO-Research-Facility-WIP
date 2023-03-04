-- Values
local TNERDriverStatusValue = script.Parent.Parent.Values.TNERDriverStatusValue
--

-- Items
local OrangeLamp = script.Parent.Parent.Parent.Rod.SmallLamp.Lamp
--

-- Sounds
local LampAlarm = script.Parent.Parent.Parent.Rod.SmallLamp.Lamp.AlarmSound7
--

-- Functions
function DoLamp(Lamp, Color, Mode)
	if Color == "Orange" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Neon orange")
			Lamp.Material = ("Neon")
			Lamp.PointLight.Enabled = true
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("CGA brown")
			Lamp.Material = ("Plastic")
			Lamp.PointLight.Enabled = false
		end
	end
end
function StartBlinking()
	repeat
		DoLamp(OrangeLamp, "Orange", "ON")
		LampAlarm:Play()
		wait(1)
		DoLamp(OrangeLamp, "Orange", "OFF")
		wait(1)
	until TNERDriverStatusValue.Value == "OFFLINE" or TNERDriverStatusValue.Value == "ONLINE"
end
--

TNERDriverStatusValue.Changed:Connect(function()
	if TNERDriverStatusValue.Value == "MOVING" then
		StartBlinking()
	end
end)
