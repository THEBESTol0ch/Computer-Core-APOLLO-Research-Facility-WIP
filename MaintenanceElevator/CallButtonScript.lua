-- Control
local Button = script.Parent.Button
--

-- Values
local ElevatorCurrentFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorCurrentFloorValue
local ElevatorTargetFloorValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorTargetFloorValue
local ElevatorStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorStatusValue
local ElevatorDoorControlValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorDoorControlValue
--

-- Items
local GreenLamp = script.Parent.Parent.GreenLamp
local YellowLamp = script.Parent.Parent.YellowLamp
--

-- Sounds
local ButtonSound = script.Parent.Button.ButtonSound
local ButtonSoundAlarm = script.Parent.Button.ButtonSoundAlarm
--

-- Logic
local FloorNumber = script.Parent.Parent.Parent.Name:split("_")[2]
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
			ButtonSoundAlarm:Play()
		end
	end
	wait(0.7)
	Button.ClickDetector.MaxActivationDistance = 10
end)

ElevatorCurrentFloorValue.Changed:Connect(function()
	if ElevatorCurrentFloorValue.Value == ElevatorTargetFloorValue.Value then Button.Material = "Plastic" end
end)

ElevatorStatusValue.Changed:Connect(function()
	if ElevatorStatusValue.Value == "MOVING" then
		GreenLamp.Material = ("Plastic")
		GreenLamp.BrickColor = BrickColor.new("Forest green")
		repeat
			YellowLamp.Material = ("Neon")
			YellowLamp.BrickColor = BrickColor.new("Neon orange")
			wait(0.5)
			YellowLamp.Material = ("Plastic")
			YellowLamp.BrickColor = BrickColor.new("CGA brown")
			wait(0.5)
		until ElevatorStatusValue.Value == "ARRIVED"
		GreenLamp.Material = ("Neon")
		GreenLamp.BrickColor = BrickColor.new("Lime green")
	end
end)
