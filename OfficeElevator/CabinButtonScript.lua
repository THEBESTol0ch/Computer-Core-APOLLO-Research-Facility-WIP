-- Control
local Button = script.Parent.Button
--

-- Values
local ElevatorCurrentFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorCurrentFloorValue
local ElevatorTargetFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorTargetFloorValue
local ElevatorStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorStatusValue
--

-- Sounds
local ButtonSound = script.Parent.SoundEmitter.ButtonSound
--

-- Logic
local FloorNumber = script.Parent.Name:split("_")[2]
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonSound:Play()
	wait(0.3)
	if ElevatorStatusValue.Value == "CLOSED" or ElevatorStatusValue.Value == "OPENED" then
		ElevatorTargetFloorValue.Value = FloorNumber
		if ElevatorCurrentFloorValue.Value ~= ElevatorTargetFloorValue.Value then Button.Material = "Neon" end
	end
	wait(0.7)
	Button.ClickDetector.MaxActivationDistance = 10
end)

ElevatorCurrentFloorValue.Changed:Connect(function()
	if ElevatorCurrentFloorValue.Value == ElevatorTargetFloorValue.Value then Button.Material = "Plastic" end
end)
