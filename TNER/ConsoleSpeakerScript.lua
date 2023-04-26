-- Control

--

-- Values
local SuperchargerStatusValue = workspace.TNER.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.TNERFuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.TNERFuseSystem.CPU.Values.FuseSystemStatusValue
local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
local TemperatureValue = workspace.TNER.CPU.Values.TemperatureValue
local FuelCapacityValue = workspace.TNERFuelSystem.CPU.Values.FuelCapacityValue
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
local TNERFuse5StatusValue = workspace.TNERFuse5.CPU.Values.TNERFuse5StatusValue
--

-- Items
local SoundEmitter = script.Parent.SoundEmitter
--

-- Logic
local CanEvent1 = true
--

SuperchargerStatusValue.Changed:Connect(function()
	if SuperchargerStatusValue.Value == "ONLINE" then
		SoundEmitter.MasterCautionAlarm1:Play()
		script.Parent.Parent.MasterCautionAlarm1.Button.Material = ("Neon")
	end
end)

FESStatusValue.Changed:Connect(function()
	if FESStatusValue.Value == "ONLINE" then
		SoundEmitter.MasterCautionAlarm2:Play()
		script.Parent.Parent.MasterCautionAlarm2.Button.Material = ("Neon")
	end
end)

FuseSystemStatusValue.Changed:Connect(function()
	if FuseSystemStatusValue.Value == "OFFLINE" then
		SoundEmitter.MasterCautionAlarm3:Play()
		script.Parent.Parent.MasterCautionAlarm3.Button.Material = ("Neon")
	end
end)

TNERFuse5StatusValue.Changed:Connect(function()
	if TNERFuse5StatusValue.Value == "SHUT DOWN" then
		SoundEmitter.MasterCautionAlarm4:Play()
		script.Parent.Parent.MasterCautionAlarm4.Button.Material = ("Neon")
	end
end)

FuelCapacityValue.Changed:Connect(function()
	if FuelCapacityValue.Value == 10 then
		SoundEmitter.MasterCautionAlarm5:Play()
		script.Parent.Parent.MasterCautionAlarm5.Button.Material = ("Neon")
	end
end)

TemperatureValue.Changed:Connect(function()
	if TemperatureValue.Value > 3500 and CanEvent1 == true then
		CanEvent1 = false
		SoundEmitter.MasterWarningAlarm1:Play()
		script.Parent.Parent.MasterWarningAlarm1.Button.Material = ("Neon")
	elseif TemperatureValue.Value < 3500 then
		CanEvent1 = true
	end
end)

LeverPositionValue.Changed:Connect(function()
	if LeverPositionValue.Value == 5 then
		SoundEmitter.MasterWarningAlarm3:Play()
		script.Parent.Parent.MasterWarningAlarm3.Button.Material = ("Neon")
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "UNSTABLE" then
		SoundEmitter.MasterWarningAlarm5:Play()
		script.Parent.Parent.MasterWarningAlarm5.Button.Material = ("Neon")
	elseif TNERStatusValue.Value == "OVERLOAD" then
		SoundEmitter.MasterWarningAlarm5:Play()
		script.Parent.Parent.MasterWarningAlarm5.Button.Material = ("Neon")
	end
end)
