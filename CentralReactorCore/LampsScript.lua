-- Items
local Lamps = script.Parent.Lamps
--

while true do
	for _, RedLamp in pairs(Lamps:GetChildren()) do
		RedLamp.RedLamp.PointLight.Enabled = false
		RedLamp.RedLamp.Material = ("Metal")
	end
	wait(2)
	for _, RedLamp in pairs(Lamps:GetChildren()) do
		RedLamp.RedLamp.PointLight.Enabled = true
		RedLamp.RedLamp.Material = ("Neon")
	end
	wait(2)
end
