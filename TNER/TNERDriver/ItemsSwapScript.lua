-- Values
local TNERDriverStatusValue = script.Parent.Parent.Values.TNERDriverStatusValue
--

-- Items
local AdvancedLeverFake = script.Parent.Parent.Parent.Rod.AdvancedLeverFake
local AdvancedLever = script.Parent.Parent.Parent.AdvancedLever
local SwitchFake = script.Parent.Parent.Parent.Rod.SwitchFake
local Switch = script.Parent.Parent.Parent.Switch
--

TNERDriverStatusValue.Changed:Connect(function()
	if TNERDriverStatusValue.Value == "ONLINE" then
		AdvancedLeverFake.Lever.Frame.Transparency = 1
		AdvancedLeverFake.Lever.Handle.Transparency = 1
		AdvancedLeverFake.Lever.Handle.Size = Vector3.new(0.1, 0.1, 0.1)
		AdvancedLeverFake.Lever.Rod.Transparency = 1
		AdvancedLeverFake.Handle.Transparency = 1
		AdvancedLeverFake.Hinge.Transparency = 1
		AdvancedLever.Lever.Frame.Transparency = 0
		AdvancedLever.Lever.Handle.Transparency = 0
		AdvancedLever.Lever.Rod.Transparency = 0
		AdvancedLever.Handle.Transparency = 0
		AdvancedLever.Hinge.Transparency = 0
		
		SwitchFake.Handle.Transparency = 1
		SwitchFake.Handle.Size = Vector3.new(0.1, 0.1, 0.1)
		Switch.Handle.Transparency = 0
	else
		AdvancedLeverFake.Lever.Frame.Transparency = 0
		AdvancedLeverFake.Lever.Handle.Transparency = 0
		AdvancedLeverFake.Lever.Handle.Size = Vector3.new(0.831, 0.11, 0.11)
		AdvancedLeverFake.Lever.Rod.Transparency = 0
		AdvancedLeverFake.Handle.Transparency = 0
		AdvancedLeverFake.Hinge.Transparency = 0
		AdvancedLever.Lever.Frame.Transparency = 1
		AdvancedLever.Lever.Handle.Transparency = 1
		AdvancedLever.Lever.Rod.Transparency = 1
		AdvancedLever.Handle.Transparency = 1
		AdvancedLever.Hinge.Transparency = 1

		SwitchFake.Handle.Transparency = 0
		SwitchFake.Handle.Size = Vector3.new(0.661, 0.153, 0.112)
		Switch.Handle.Transparency = 1
	end
end)
