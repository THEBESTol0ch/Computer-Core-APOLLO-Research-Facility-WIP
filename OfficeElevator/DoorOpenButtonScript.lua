-- Control
local Button = script.Parent.Button
--

-- Values
local ElevatorStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorStatusValue
local ElevatorDoorControlValue = script.Parent.Parent.Parent.Parent.CPU.Values.ElevatorDoorControlValue
--

-- Sounds
local ButtonSound = script.Parent.SoundEmitter.ButtonSound
--

Button.ClickDetector.MouseClick:Connect(function()
	Button.ClickDetector.MaxActivationDistance = 0
	ButtonSound:Play()
	wait(0.3)
	if ElevatorStatusValue.Value == "CLOSED" then
		ElevatorDoorControlValue.Value = "OPEN"
	end
	wait(0.7)
	Button.ClickDetector.MaxActivationDistance = 10
end)
