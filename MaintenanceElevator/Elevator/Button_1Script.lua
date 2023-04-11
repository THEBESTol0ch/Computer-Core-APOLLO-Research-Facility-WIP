-- Control
local Button = script.Parent.Button
--

-- Values
local ElevatorCurrentFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorCurrentFloorValue
local ElevatorTargetFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorTargetFloorValue
local ElevatorStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorStatusValue
local ElevatorDoorControlValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorDoorControlValue
--

-- Sounds
local ButtonSound = Button.ButtonSound	
--

-- Logic
local FloorNumber = script.Parent.Name:split("_")[2]
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonSound:Play()
	wait(0.3)
	if ElevatorCurrentFloorValue.Value == tonumber(FloorNumber) and ElevatorStatusValue.Value == "CLOSED" then
		ElevatorDoorControlValue.Value = "OPEN"
	elseif ElevatorStatusValue.Value == "CLOSED" or ElevatorStatusValue.Value == "OPENED" then
		ElevatorTargetFloorValue.Value = tonumber(FloorNumber)
		if ElevatorCurrentFloorValue.Value ~= ElevatorTargetFloorValue.Value then
			Button.Material = "Neon"
			Button.ButtonSoundAlarm:Play()
		end
	end
	wait(0.7)
	Button.ClickDetector.MaxActivationDistance = 10
end)

ElevatorCurrentFloorValue.Changed:Connect(function()
	if ElevatorCurrentFloorValue.Value == ElevatorTargetFloorValue.Value then Button.Material = "Plastic" end
end)
