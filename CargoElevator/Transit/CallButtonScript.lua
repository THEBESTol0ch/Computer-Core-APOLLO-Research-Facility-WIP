-- Control
local Button = script.Parent
local Side = Button.Parent.Name:split("_")[1]
--

-- Values
local TransitCurrentFloorValue = script.Parent.Parent.Parent.Parent.Parent.Parent[Side.."_Transit"].CPU.Values.TransitCurrentStationValue
local TransitTargetFloorValue = script.Parent.Parent.Parent.Parent.Parent.Parent[Side.."_Transit"].CPU.Values.TransitTargetStationValue
local TransitStatusValue = script.Parent.Parent.Parent.Parent.Parent.Parent[Side.."_Transit"].CPU.Values.TransitStatusValue
--

-- Sounds
local TransitCallButtonSound = Button.TransitCallButtonSound
--

-- Logic
local StationNumber = script.Parent.Parent.Parent.Parent.Parent.Name:split("_")[2]
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
