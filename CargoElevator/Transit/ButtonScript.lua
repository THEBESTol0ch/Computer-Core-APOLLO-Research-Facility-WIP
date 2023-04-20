-- Control
local Button = script.Parent
--

-- Values
local TransitCurrentFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitCurrentStationValue
local TransitTargetFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitTargetStationValue
local TransitStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitStatusValue
--

-- Sounds
local TransitCallButtonSound = Button.TransitCallButtonSound
--

-- Logic
local StationNumber = script.Parent.Parent.Name:split("_")[2]
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	TransitCallButtonSound:Play()
	wait(1)
	if TransitStatusValue.Value == "OPENED" then
		TransitTargetFloorValue.Value = tonumber(StationNumber)
		if TransitCurrentFloorValue.Value ~= TransitTargetFloorValue.Value then Button.Material = "Neon" end
	end
	wait(1.3)
	Button.ClickDetector.MaxActivationDistance = 10
end)

TransitCurrentFloorValue.Changed:Connect(function()
	if TransitCurrentFloorValue.Value == TransitTargetFloorValue.Value then Button.Material = "Plastic" end
end)
