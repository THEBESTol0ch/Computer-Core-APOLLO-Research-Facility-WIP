-- Control
local Trigger = script.Parent.Trigger
--

-- Items
local VentCap = script.Parent.VentCap
--

Trigger.Touched:Connect(function()
	Trigger.CanTouch = false
	wait(1)
	VentCap.Anchored = false
	wait(4)
	VentCap.Anchored = true
	wait(1)
	VentCap.Position = Vector3.new(-558.115, 441.883, 1199.476)
	VentCap.Orientation = Vector3.new(90, 180, 0)
	Trigger.CanTouch = true
end)
