local Rotor = script.Parent

while wait() do
	Rotor.Rotation = Rotor.Rotation + 1
	if Rotor.Rotation == 360 then
		Rotor.Rotation = 0
	end
end
