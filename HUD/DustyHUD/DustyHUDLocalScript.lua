local DustyHUD = script.Parent.DustyHUD
local FacilityDestructionEffectStatusValue = workspace.FacilityDestructionEffect.CPU.Values.FacilityDestructionEffectStatusValue
local BlackoutStatusValue = workspace.FacilityLight.CPU.Values.BlackoutStatusValue

FacilityDestructionEffectStatusValue.Changed:Connect(function()
	if FacilityDestructionEffectStatusValue.Value == 1 and BlackoutStatusValue.Value == 0 then
		DustyHUD.Visible = true
		DustyHUD:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
		DustyHUD:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
	end
	if FacilityDestructionEffectStatusValue.Value == 0 then
		wait(4)
		DustyHUD:TweenPosition(UDim2.new(-7, 0, -7, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
		DustyHUD:TweenSize(UDim2.new(15, 0, 15, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 5, false)
		wait(5)
		DustyHUD.Visible = false
	end
end)
