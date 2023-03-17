-- Values
local Values = script.Parent.Parent.Values
local TNERStatusValue = Values.TNERStatusValue
local TNEROverloadStartUpTime = Values.TNEROverloadStartUpTime
local TNEROverloadDelayTime = Values.TNEROverloadDelayTime
--

-- Items
local Lamps = script.Parent.Parent.Parent.Lamps
local EmergencyLamps = Lamps.EmergencyLamps
local SideLamps = Lamps.SideLamps.SideLamps
local BlueLamps = Lamps.BlueLamps.BlueLamps
local RedLamps = Lamps.RedLamps.RedLamps
--

-- Functions
function DoLamps(Class, Mode, Color, WaitTime)
	if Class == "EmergencyLamps" then
		if Mode == "ON" then
			for _, EmergencyLamp in pairs(EmergencyLamps:GetChildren()) do
				EmergencyLamp.Lamp.SpotLight.Enabled = true
				EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 5
			end
		elseif Mode == "OFF" then
			for _, EmergencyLamp in pairs(EmergencyLamps:GetChildren()) do
				EmergencyLamp.Lamp.SpotLight.Enabled = false
				EmergencyLamp.Lamp.HingeConstraint.AngularVelocity = 0
			end
		end
	elseif Class == "SideLamps" then
		if Mode == "ON" then
			for _, SideLamp in pairs(SideLamps:GetChildren()) do
				SideLamp.Material = ("Neon")
				SideLamp.BrickColor = BrickColor.new(Color)
			end
		elseif Mode == "OFF" then
			for _, SideLamp in pairs(SideLamps:GetChildren()) do
				SideLamp.Material = ("SmoothPlastic")
				SideLamp.BrickColor = BrickColor.new(Color)
			end
		end
	elseif Class == "BlueLamps" then
		if Mode == "ON" then
			for Count = 1, 7, 1 do
				if WaitTime > 0 then wait(WaitTime) end
				BlueLamps["BlueLamp"..Count].Material = ("Neon")
				BlueLamps["BlueLamp"..Count].BrickColor = BrickColor.new(Color)
			end
		elseif Mode == "OFF" then
			for Count = 7, 1, -1 do
				if WaitTime > 0 then wait(WaitTime) end
				BlueLamps["BlueLamp"..Count].Material = ("Metal")
				BlueLamps["BlueLamp"..Count].BrickColor = BrickColor.new(Color)
			end
		end
	elseif Class == "RedLamps" then
		if Mode == "ON" then
			for _, RedLamp in pairs(RedLamps:GetChildren()) do
				RedLamp.Material = ("Neon")
				RedLamp.BrickColor = BrickColor.new("Really red")
			end
		elseif Mode == "OFF" then
			for _, RedLamp in pairs(RedLamps:GetChildren()) do
				RedLamp.Material = ("Metal")
				RedLamp.BrickColor = BrickColor.new("Crimson")
			end
		end
	end
end
--

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" or TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "OVERLOAD" then
		DoLamps("EmergencyLamps", "ON")
	elseif TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "OFFLINE" or TNERStatusValue.Value == "COOLING" then
		DoLamps("EmergencyLamps", "OFF")
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		repeat
			for Count = 1, 4, 1 do
				DoLamps("SideLamps", "OFF", "Institutional white")
				SideLamps["SideLamp"..Count].Material = ("Neon")
				SideLamps["SideLamp"..Count].BrickColor = BrickColor.new("Electric blue")
				wait(0.3)
			end
		until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "UNSTABLE"
		DoLamps("SideLamps", "OFF", "Institutional white")
		if TNERStatusValue.Value == "UNSTABLE" then
			repeat
				DoLamps("SideLamps", "ON", "Electric blue")
				wait(1)
				DoLamps("SideLamps", "OFF", "Institutional white")
				wait(1)
			until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "OVERLOAD"
			wait(TNEROverloadDelayTime.Value)
			if TNERStatusValue.Value == "OVERLOAD" then
				DoLamps("SideLamps", "ON", "Really red")
			end
		end
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		if SideLamps.SideLamp1.BrickColor == BrickColor.new("Really red") then
			for Count = 0, 40, 1 do
				DoLamps("SideLamps", "ON", "Electric blue")
				wait(0.02)
				DoLamps("SideLamps", "ON", "Really red")
				wait(0.02)
			end
		end
		DoLamps("SideLamps", "OFF", "Institutional white")
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		DoLamps("BlueLamps", "ON", "Electric blue", 1)
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		if BlueLamps.BlueLamp1.BrickColor == BrickColor.new("Really red") then
			for Count = 0, 40, 1 do
				DoLamps("BlueLamps", "ON", "Electric blue", 0)
				wait(0.02)
				DoLamps("BlueLamps", "ON", "Really red", 0)
				wait(0.02)
			end
		end
		DoLamps("BlueLamps", "ON", "Electric blue", 0)
		DoLamps("BlueLamps", "OFF", "Deep blue", 1)
	elseif TNERStatusValue.Value == "UNSTABLE" then
		repeat
			DoLamps("BlueLamps", "OFF", "Deep blue", 0)
			wait(math.random(1, 15) / 10)
			if math.random(1, 2) == 1 then DoLamps("BlueLamps", "ON", "Electric blue", 0) else DoLamps("BlueLamps", "ON", "Really red", 0) end
			wait(math.random(1, 15) / 10)
		until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "OVERLOAD"
		DoLamps("BlueLamps", "ON", "Electric blue", 0)
		wait(TNEROverloadDelayTime.Value)
		if TNERStatusValue.Value == "OVERLOAD" then
			DoLamps("BlueLamps", "ON", "Really red", 0.02)
		else
			DoLamps("BlueLamps", "OFF", "Deep blue", 1)
		end
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" or TNERStatusValue.Value == "UNSTABLE" then
		repeat
			DoLamps("RedLamps", "ON")
			wait(1.2)
			DoLamps("RedLamps", "OFF")
			wait(1.2)
		until TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "OVERLOAD"
		wait(TNEROverloadDelayTime.Value)
		if TNERStatusValue.Value == "OVERLOAD" then
			DoLamps("RedLamps", "ON")
		end
	elseif TNERStatusValue.Value == "SHUT DOWN" then
		DoLamps("RedLamps", "OFF")
	end
end)
