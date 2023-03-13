-- Values
local SuperchargerStatusValue = workspace.TNER.SuperchargerSystem.CPU.Values.SuperchargerStatusValue

local FESStatusValue = workspace.TNERFuelEnrichmentSystem.CPU.Values.FESStatusValue
local FEM1StatusValue = workspace.TNERFuelEnrichmentSystem.FEM1.CPU.Values.FEMStatusValue
local FEM2StatusValue = workspace.TNERFuelEnrichmentSystem.FEM2.CPU.Values.FEMStatusValue
local FEM3StatusValue = workspace.TNERFuelEnrichmentSystem.FEM3.CPU.Values.FEMStatusValue

local FuseSystemStatusValue = workspace.TNERFuseSystem.CPU.Values.FuseSystemStatusValue
local Fuse1StatusValue = workspace.TNERFuseSystem.Fuse1.CPU.Values.FuseStatusValue
local Fuse2StatusValue = workspace.TNERFuseSystem.Fuse2.CPU.Values.FuseStatusValue
local Fuse3StatusValue = workspace.TNERFuseSystem.Fuse3.CPU.Values.FuseStatusValue
local Fuse4StatusValue = workspace.TNERFuseSystem.Fuse4.CPU.Values.FuseStatusValue

local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
--

-- Items
local SCIP = script.Parent.SCIP

local FESIP = script.Parent.FESIP

local FSIP = script.Parent.FSIP

local LPIP = script.Parent.LPIP
--

-- Functions
function DoLamp(Lamp, Color, Mode)
	if Color == "Red" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Really red")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Crimson")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Green" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Lime green")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("Forest green")
			Lamp.Material = ("Plastic")
		end
	elseif Color == "Orange" then
		if Mode == "ON" then
			Lamp.BrickColor = BrickColor.new("Neon orange")
			Lamp.Material = ("Neon")
		elseif Mode == "OFF" then
			Lamp.BrickColor = BrickColor.new("CGA brown")
			Lamp.Material = ("Plastic")
		end
	end
end
--

SuperchargerStatusValue.Changed:Connect(function()
	if SuperchargerStatusValue.Value == "ONLINE" then
		DoLamp(SCIP.Indicator1, "Orange", "ON")
		DoLamp(SCIP.Indicator2, "Green", "ON")
	else
		DoLamp(SCIP.Indicator1, "Orange", "OFF")
		DoLamp(SCIP.Indicator2, "Green", "OFF")
	end
end)

FESStatusValue.Changed:Connect(function()
	if FESStatusValue.Value == "ONLINE" then
		DoLamp(FESIP.Indicator4, "Green", "ON")
	else
		DoLamp(FESIP.Indicator4, "Green", "OFF")
	end
end)
FEM1StatusValue.Changed:Connect(function()
	if FEM1StatusValue.Value == "ONLINE" then
		DoLamp(FESIP.Indicator1, "Orange", "ON")
	else
		DoLamp(FESIP.Indicator1, "Orange", "OFF")
	end
end)
FEM2StatusValue.Changed:Connect(function()
	if FEM2StatusValue.Value == "ONLINE" then
		DoLamp(FESIP.Indicator2, "Orange", "ON")
	else
		DoLamp(FESIP.Indicator2, "Orange", "OFF")
	end
end)
FEM3StatusValue.Changed:Connect(function()
	if FEM3StatusValue.Value == "ONLINE" then
		DoLamp(FESIP.Indicator3, "Orange", "ON")
	else
		DoLamp(FESIP.Indicator3, "Orange", "OFF")
	end
end)

FuseSystemStatusValue.Changed:Connect(function()
	if FuseSystemStatusValue.Value == "OFFLINE" then
		DoLamp(FSIP.Indicator5, "Green", "ON")
	else
		DoLamp(FSIP.Indicator5, "Green", "OFF")
	end
end)
Fuse1StatusValue.Changed:Connect(function()
	if Fuse1StatusValue.Value == "OFFLINE" then
		DoLamp(FSIP.Indicator1, "Orange", "ON")
	else
		DoLamp(FSIP.Indicator1, "Orange", "OFF")
	end
end)
Fuse2StatusValue.Changed:Connect(function()
	if Fuse2StatusValue.Value == "OFFLINE" then
		DoLamp(FSIP.Indicator2, "Orange", "ON")
	else
		DoLamp(FSIP.Indicator2, "Orange", "OFF")
	end
end)
Fuse3StatusValue.Changed:Connect(function()
	if Fuse3StatusValue.Value == "OFFLINE" then
		DoLamp(FSIP.Indicator3, "Orange", "ON")
	else
		DoLamp(FSIP.Indicator3, "Orange", "OFF")
	end
end)
Fuse4StatusValue.Changed:Connect(function()
	if Fuse4StatusValue.Value == "OFFLINE" then
		DoLamp(FSIP.Indicator4, "Orange", "ON")
	else
		DoLamp(FSIP.Indicator4, "Orange", "OFF")
	end
end)

LeverPositionValue.Changed:Connect(function()
	if LeverPositionValue.Value == 5 then
		DoLamp(LPIP.Indicator1, "Orange", "ON")
		DoLamp(LPIP.Indicator2, "Green", "ON")
	else
		DoLamp(LPIP.Indicator1, "Orange", "OFF")
		DoLamp(LPIP.Indicator2, "Green", "OFF")
	end
end)
