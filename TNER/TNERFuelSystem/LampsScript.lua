-- Values
local FRStatusValue = script.Parent.Parent.Values.FRStatusValue
local ServerStatusValue = workspace.TNERSystemServer.Servers.FuelSystemServer.CPU.Values.ServerStatusValue
--

-- Items
local Lamps = script.Parent.Parent.Parent.Locker.Lamps
local BigLamp = script.Parent.Parent.Parent.Frame.BigLamp.BigLamp
--

-- Functions
function DoLamp(Lamp, Color, Mode)
	if Color == "Red" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Really red")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Cocoa")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Green" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Bright green")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Institutional white")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Persimmon" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Persimmon")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Institutional white")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Daisy orange" then
		if Mode == "ON" then
			BigLamp.BrickColor = BrickColor.new("Daisy orange")
			BigLamp.Material = ("Neon")
			BigLamp.PointLight.Enabled = true
		elseif Mode == "OFF" then
			BigLamp.BrickColor = BrickColor.new("Institutional white")
			BigLamp.Material = ("SmoothPlastic")
			BigLamp.PointLight.Enabled = false
		end
	end
end
function TurnOffRedLamps()
	for Count = 1, 6, 1 do DoLamp(Lamps["Lamp"..Count], "Red", "OFF") end
end
function StartBlinking(Lamp)
	if Lamp == "BigLamp" then
		repeat
			DoLamp(BigLamp, "Daisy orange", "ON")
			wait(0.5)
			DoLamp(BigLamp, "Daisy orange", "OFF")
			wait(0.5)
		until FRStatusValue.Value == "INJECTED" or FRStatusValue.Value == "REMOVED"
	elseif Lamp == "RedLamps" then
		repeat
			for Count = 1, 6, 1 do
				TurnOffRedLamps()
				DoLamp(Lamps["Lamp"..Count], "Red", "ON")
				wait(0.2)
			end
		until FRStatusValue.Value == "DISINJECTED"
		TurnOffRedLamps()
	end
end
--

FRStatusValue.Changed:Connect(function()
	if FRStatusValue.Value == "LOADING" or FRStatusValue.Value == "DISINJECTED" then
		StartBlinking("BigLamp")
	elseif FRStatusValue.Value == "INJECTED" then
		wait(1.1)
		DoLamp(BigLamp, "Green", "ON")
		StartBlinking("RedLamps")
	elseif FRStatusValue.Value == "REMOVED" then
		DoLamp(BigLamp, "Persimmon", "ON")
	end
end)

ServerStatusValue.Changed:Connect(function()
	if ServerStatusValue.Value == "ONLINE" then
		DoLamp(BigLamp, "Persimmon", "ON")
	end
end)
