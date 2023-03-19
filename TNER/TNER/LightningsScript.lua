-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local Values = script.Parent.Parent.Values
local TNERStatusValue = Values.TNERStatusValue
local LeverPositionValue = workspace.TNERPullLever.CPU.Values.LeverPositionValue
local PreviousLeverPositionValue = workspace.TNERPullLever.CPU.Values.PreviousLeverPositionValue
local TNERStartUpTime = Values.TNERStartUpTime
local TNEROverloadStartUpTime = Values.TNEROverloadStartUpTime
local TNEROverloadDelayTime = Values.TNEROverloadDelayTime
--

-- Items
local Lightning = script.Parent.Parent.Parent.Lightning
--

-- Sounds
local SoundEmitter = script.Parent.Parent.Parent.SoundEmitter
--

-- Logic
local InvertedLeverPositionValue = 3
local InvertedLeverPositionMultiplier = 3.5
local SpreadValue = 2
--

local RoundLightningAnimationSettings = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

-- Functions
function DoLightning(Class, Mode, Side)
	if Class == "LargeLightning" then
		Lightning.MainLightnings.LargeLightning.Orientation = Lightning.MainLightnings.Positions[Class.."Pos"..math.random(1, 4)].Orientation
		Lightning.MainLightnings.LargeLightning.Transparency = 0
		Lightning.MainLightnings.LargeLightning.PointLight.Enabled = true
		wait(0.1)
		Lightning.MainLightnings.LargeLightning.Transparency = 1
		Lightning.MainLightnings.LargeLightning.PointLight.Enabled = false
	elseif Class == "Lightning" then
		local RandomIndex = math.random(1, 7)
		Lightning.MainLightnings.Lightning.Position = Lightning.MainLightnings.Positions[Class.."Pos"..RandomIndex].Position
		Lightning.MainLightnings.Lightning.Orientation = Lightning.MainLightnings.Positions[Class.."Pos"..RandomIndex].Orientation
		Lightning.MainLightnings.Lightning.Transparency = 0
		Lightning.MainLightnings.Lightning.PointLight.Enabled = true
		if not (TNERStatusValue.Value == "OVERLOAD") then SoundEmitter["ElectricDischargeSound"..RandomIndex]:Play() end
		wait(0.05)
		Lightning.MainLightnings.Lightning.Transparency = 1
		Lightning.MainLightnings.Lightning.PointLight.Enabled = false
	elseif Class == "RoundLightning" then
		if Mode == "COMPRESS" then
			TweenService:Create(Lightning.RoundLightning[Side.."Lightning"].Lightning1, RoundLightningAnimationSettings, { Size = Lightning.RoundLightning.SizeValues.LightningSizeValue2.Value, Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos2.Position }):Play()
			TweenService:Create(Lightning.RoundLightning[Side.."Lightning"].Lightning2, RoundLightningAnimationSettings, { Size = Lightning.RoundLightning.SizeValues.LightningSizeValue2.Value, Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos2.Position }):Play()
		elseif Mode == "RETURN" then
			Lightning.RoundLightning[Side.."Lightning"].Lightning1.Size = Lightning.RoundLightning.SizeValues.LightningSizeValue1.Value
			Lightning.RoundLightning[Side.."Lightning"].Lightning1.Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos1.Position
			Lightning.RoundLightning[Side.."Lightning"].Lightning2.Size = Lightning.RoundLightning.SizeValues.LightningSizeValue1.Value
			Lightning.RoundLightning[Side.."Lightning"].Lightning2.Position = Lightning.RoundLightning[Side.."Lightning"].Positions.LightningPos1.Position
		end
	end
end
function RepeatLightningSequence()
	repeat
		if LeverPositionValue.Value == 5 then
			InvertedLeverPositionValue = 1
		elseif LeverPositionValue.Value == 4 then
			InvertedLeverPositionValue = 2
		elseif LeverPositionValue.Value == 3 then
			InvertedLeverPositionValue = 3
		elseif LeverPositionValue.Value == 2 then
			InvertedLeverPositionValue = 4
		elseif LeverPositionValue.Value == 1 then
			InvertedLeverPositionValue = 5
		end
		local Num1 = InvertedLeverPositionValue * InvertedLeverPositionMultiplier - SpreadValue
		local Num2 = InvertedLeverPositionValue * InvertedLeverPositionMultiplier + SpreadValue
		DoLightning("Lightning")
		wait(math.random(Num1, Num2) / 10)
	until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "OVERLOAD"
end
--

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(TNERStartUpTime.Value)
		RepeatLightningSequence()
		if TNERStatusValue.Value == "OVERLOAD" then
			wait(TNEROverloadDelayTime.Value + TNEROverloadStartUpTime.Value)
			repeat
				DoLightning("Lightning")
			until TNERStatusValue.Value == "SHUT DOWN"
		end
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(10.955)
		DoLightning("LargeLightning")
		wait(1.342)
		DoLightning("LargeLightning")
		wait(0.518)
		DoLightning("LargeLightning")
		wait(0.329)
		DoLightning("LargeLightning")
	end
end)

TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(15.3)
		repeat
			DoLightning("RoundLightning", "COMPRESS", "Left")
			wait(0.3)
			DoLightning("RoundLightning", "RETURN", "Left")
			wait(0.01)
		until TNERStatusValue.Value == "ONLINE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(15.45)
		repeat
			DoLightning("RoundLightning", "COMPRESS", "Right")
			wait(0.3)
			DoLightning("RoundLightning", "RETURN", "Right")
			wait(0.01)
		until TNERStatusValue.Value == "ONLINE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "POWER ON" then
		wait(15.3)
		repeat
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 0
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 0
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 1
			wait(0.01)
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 0
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 0
			wait(0.01)
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 1
		until TNERStatusValue.Value == "ONLINE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(TNEROverloadDelayTime.Value + TNEROverloadStartUpTime.Value)
		repeat
			DoLightning("RoundLightning", "COMPRESS", "Left")
			wait(0.3)
			DoLightning("RoundLightning", "RETURN", "Left")
			wait(0.01)
		until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "UNSTABLE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(TNEROverloadDelayTime.Value + TNEROverloadStartUpTime.Value + 0.15)
		repeat
			DoLightning("RoundLightning", "COMPRESS", "Right")
			wait(0.3)
			DoLightning("RoundLightning", "RETURN", "Right")
			wait(0.01)
		until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "UNSTABLE"
	end
end)
TNERStatusValue.Changed:Connect(function()
	if TNERStatusValue.Value == "OVERLOAD" then
		wait(TNEROverloadDelayTime.Value + TNEROverloadStartUpTime.Value)
		repeat
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 0
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 0
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 1
			wait(0.01)
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 0
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 0
			wait(0.01)
			Lightning.RoundLightning.LeftLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.LeftLightning.Lightning2.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning1.Transparency = 1
			Lightning.RoundLightning.RightLightning.Lightning2.Transparency = 1
		until TNERStatusValue.Value == "SHUT DOWN" or TNERStatusValue.Value == "UNSTABLE"
	end
end)
