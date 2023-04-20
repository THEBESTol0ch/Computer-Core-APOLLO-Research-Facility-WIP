-- Values
local TransitStatusValue = script.Parent.Parent.Parent.CPU.Values.TransitStatusValue
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
		Weld.Parent = script.Parent
		repeat
			wait(0.1)
		until TransitStatusValue.Value == "ARRIVED"
		Weld:Destroy()
	end
end)
