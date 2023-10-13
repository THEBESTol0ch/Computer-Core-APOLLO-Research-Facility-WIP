-- Values
local TransitStatusValue = script.Parent.Parent.Parent.Parent.CPU.Values.TransitStatusValue
--

-- Items
local WeldTrigger = script.Parent
--

WeldTrigger.Touched:Connect(function(Hit)
	if Hit.Parent:FindFirstChild("Humanoid") then
		local HumanoidRootPart = Hit.Parent.HumanoidRootPart
		local Weld = Instance.new("WeldConstraint")
		Weld.Part0 = HumanoidRootPart
		Weld.Part1 = WeldTrigger
		Weld.Parent = HumanoidRootPart
		repeat
			wait(1)
		until TransitStatusValue.Value == "ARRIVED" or TransitStatusValue.Value == "EMERGENCY STOP" or TransitStatusValue.Value == "PARKING MODE"
		Weld:Destroy()
	end
end)

TransitStatusValue.Changed:Connect(function()
	if TransitStatusValue.Value == "DEPARTING" or TransitStatusValue.Value == "MOVING" then
		wait(8)
		WeldTrigger.CanTouch = true
		wait(1)
		WeldTrigger.CanTouch = false
	end
end)
