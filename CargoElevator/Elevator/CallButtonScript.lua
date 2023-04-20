-- Control
local Button = script.Parent
--

-- Values
local ElevatorCurrentFloorValue = script.Parent.Parent.Parent.Parent.Parent.Parent.Elevator.CPU.Values.ElevatorCurrentStationValue
local ElevatorTargetFloorValue = script.Parent.Parent.Parent.Parent.Parent.Parent.Elevator.CPU.Values.ElevatorTargetStationValue
local ElevatorStatusValue = script.Parent.Parent.Parent.Parent.Parent.Parent.Elevator.CPU.Values.ElevatorStatusValue
--

-- Sounds
local ElevatorCallButtonSound = Button.TransitCallButtonSound
--

-- Logic
local StationNumber = script.Parent.Parent.Parent.Parent.Parent.Name:split("_")[2]
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	ElevatorCallButtonSound:Play()
	wait(1)
	if ElevatorStatusValue.Value == "OPENED" then
		ElevatorTargetFloorValue.Value = tonumber(StationNumber)
		if ElevatorCurrentFloorValue.Value ~= ElevatorTargetFloorValue.Value then Button.Material = "Neon" end
	end
	wait(1.3)
	Button.ClickDetector.MaxActivationDistance = 10
end)

ElevatorCurrentFloorValue.Changed:Connect(function()
	if ElevatorCurrentFloorValue.Value == ElevatorTargetFloorValue.Value then Button.Material = "Plastic" end
end)
