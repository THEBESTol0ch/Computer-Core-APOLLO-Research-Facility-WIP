-- Values
local TNERFuse5StatusValue = script.Parent.Parent.CPU.Values.TNERFuse5StatusValue
--

-- Items
local Lightning = script.Parent.Lightning.Lightning
local LightningPositions = script.Parent.Lightning.Positions
local LightningBeam1 = script.Parent.Connector1.Beam
local LightningBeam2 = script.Parent.Connector2.Beam
--

-- Functions
function DoLightning()
	if TNERFuse5StatusValue.Value == "ONLINE" then
		Lightning.PointLight.Enabled = true
		LightningBeam1.Transparency = 0
		repeat
			Lightning.Transparency = 0
			LightningBeam2.Transparency = 0
			local RandomIndex = math.random(1, 4)
			Lightning.Position = LightningPositions["Pos"..RandomIndex].Position
			Lightning.Orientation = LightningPositions["Pos"..RandomIndex].Orientation
			wait(0.05)
			Lightning.Transparency = 1
			LightningBeam2.Transparency = 1
			wait(0.05)
		until TNERFuse5StatusValue.Value == "SHUT DOWN"
		LightningBeam1.Transparency = 1
		Lightning.PointLight.Enabled = false
	end
end
--

DoLightning()

TNERFuse5StatusValue.Changed:Connect(function()
	DoLightning()
end)
