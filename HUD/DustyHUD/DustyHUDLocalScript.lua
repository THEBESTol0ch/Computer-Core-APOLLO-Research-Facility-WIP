-- Values
local FacilityDestructionEffectValue = workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectValue
--

-- Items
local DustyHUD = script.Parent.DustyHUD
--

FacilityDestructionEffectValue.Changed:Connect(function()
	if FacilityDestructionEffectValue.Value == "SHAKING" then
		DustyHUD.Visible = true
		DustyHUD:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
		DustyHUD:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
	elseif FacilityDestructionEffectValue.Value == "SHAKED" then
		wait(4)
		DustyHUD:TweenPosition(UDim2.new(-7, 0, -7, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
		DustyHUD:TweenSize(UDim2.new(15, 0, 15, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
		wait(5)
		DustyHUD.Visible = false
	end
end)
