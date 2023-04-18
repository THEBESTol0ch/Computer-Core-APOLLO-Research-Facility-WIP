-- Control
local Button = script.Parent.Button
--

-- Values
local TransitCurrentStationValue = script.Parent.Parent.Parent.Parent.Parent.CPU.Values.TransitCurrentStationValue
local TransitTargetStationValue = script.Parent.Parent.Parent.Parent.Parent.CPU.Values.TransitTargetStationValue
local TransitStatusValue = script.Parent.Parent.Parent.Parent.Parent.CPU.Values.TransitStatusValue
--

-- Sounds
local TransitCallButtonSound = script.Parent.Button.TransitCallButtonSound
--

-- Logic
local StationName = script.Parent.Parent.Parent.Parent.Name:split("_")[2]
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	TransitCallButtonSound:Play()
	wait(1.3)
	if TransitStatusValue.Value == "OPENED" then
		TransitTargetStationValue.Value = StationName
		if not (TransitCurrentStationValue.Value == TransitTargetStationValue.Value) then Button.BrickColor = BrickColor.new("Neon orange") end
	end
	wait(1)
	Button.ClickDetector.MaxActivationDistance = 10
end)

TransitStatusValue.Changed:Connect(function()
	if TransitStatusValue.Value == "OPENED" then
		if TransitCurrentStationValue.Value == StationName then
			Button.BrickColor = BrickColor.new("Forest green")
			Button.Material = ("Plastic")
		else
			Button.BrickColor = BrickColor.new("Forest green")
			Button.Material = ("Neon")
		end
	elseif TransitStatusValue.Value == "EMERGENCY STOP" then
		Button.BrickColor = BrickColor.new("Forest green")
		Button.Material = ("Plastic")
	elseif TransitStatusValue.Value == "PARKING MODE" then
		Button.BrickColor = BrickColor.new("Forest green")
		Button.Material = ("Plastic")
	end
end)
