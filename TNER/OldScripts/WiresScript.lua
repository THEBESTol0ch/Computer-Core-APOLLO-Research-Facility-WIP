local TweenService = game:GetService("TweenService")

local OverloadButton = workspace.OverloadConsole.EmergencyButton.Button

local FuelCapacityValue = workspace.FuelSystem.CPU.Values.FuelCapacityValue
local LeverPositionValue = workspace.ReactorSpeedLever.CPU.Values.LeverPositionValue

local Smoke1First = workspace.ThermonuclearReactor.Wires.Wires1.SmokeEmitters.SmokeEmitter1.Smoke
local Smoke2First = workspace.ThermonuclearReactor.Wires.Wires1.SmokeEmitters.SmokeEmitter2.Smoke
local RimFirst = workspace.ThermonuclearReactor.Wires.Wires1.Rim
local W1First = workspace.ThermonuclearReactor.Wires.Wires1.W1
local W2First = workspace.ThermonuclearReactor.Wires.Wires1.W2
local W3First = workspace.ThermonuclearReactor.Wires.Wires1.W3
local W4First = workspace.ThermonuclearReactor.Wires.Wires1.W4
local W5First = workspace.ThermonuclearReactor.Wires.Wires1.W5
local W6First = workspace.ThermonuclearReactor.Wires.Wires1.W6
local W7First = workspace.ThermonuclearReactor.Wires.Wires1.W7
local W8First = workspace.ThermonuclearReactor.Wires.Wires1.W8
local W9First = workspace.ThermonuclearReactor.Wires.Wires1.W9
local W10First = workspace.ThermonuclearReactor.Wires.Wires1.W10
local W11First = workspace.ThermonuclearReactor.Wires.Wires1.W11
local W12First = workspace.ThermonuclearReactor.Wires.Wires1.W12
local W13First = workspace.ThermonuclearReactor.Wires.Wires1.W13
local W14First = workspace.ThermonuclearReactor.Wires.Wires1.W14
local W15First = workspace.ThermonuclearReactor.Wires.Wires1.W15
local W16First = workspace.ThermonuclearReactor.Wires.Wires1.W16
local W17First = workspace.ThermonuclearReactor.Wires.Wires1.W17
local W18First = workspace.ThermonuclearReactor.Wires.Wires1.W18
local W19First = workspace.ThermonuclearReactor.Wires.Wires1.W19

local Smoke1Second = workspace.ThermonuclearReactor.Wires.Wires2.SmokeEmitters.SmokeEmitter1.Smoke
local Smoke2Second = workspace.ThermonuclearReactor.Wires.Wires2.SmokeEmitters.SmokeEmitter2.Smoke
local RimSecond = workspace.ThermonuclearReactor.Wires.Wires2.Rim
local W1Second = workspace.ThermonuclearReactor.Wires.Wires2.W1
local W2Second = workspace.ThermonuclearReactor.Wires.Wires2.W2
local W3Second = workspace.ThermonuclearReactor.Wires.Wires2.W3
local W4Second = workspace.ThermonuclearReactor.Wires.Wires2.W4
local W5Second = workspace.ThermonuclearReactor.Wires.Wires2.W5
local W6Second = workspace.ThermonuclearReactor.Wires.Wires2.W6
local W7Second = workspace.ThermonuclearReactor.Wires.Wires2.W7
local W8Second = workspace.ThermonuclearReactor.Wires.Wires2.W8
local W9Second = workspace.ThermonuclearReactor.Wires.Wires2.W9
local W10Second = workspace.ThermonuclearReactor.Wires.Wires2.W10
local W11Second = workspace.ThermonuclearReactor.Wires.Wires2.W11
local W12Second = workspace.ThermonuclearReactor.Wires.Wires2.W12
local W13Second = workspace.ThermonuclearReactor.Wires.Wires2.W13
local W14Second = workspace.ThermonuclearReactor.Wires.Wires2.W14
local W15Second = workspace.ThermonuclearReactor.Wires.Wires2.W15
local W16Second = workspace.ThermonuclearReactor.Wires.Wires2.W16
local W17Second = workspace.ThermonuclearReactor.Wires.Wires2.W17
local W18Second = workspace.ThermonuclearReactor.Wires.Wires2.W18
local W19Second = workspace.ThermonuclearReactor.Wires.Wires2.W19

local SuperchargerStatusValue = workspace.ThermonuclearReactor.SuperchargerSystem.CPU.Values.SuperchargerStatusValue
local FESStatusValue = workspace.FuelEnrichmentSystem.CPU.Values.FESStatusValue
local FuseSystemStatusValue = workspace.FuseSystem.CPU.Values.FuseSystemStatusValue

local WireAnimationSettings = TweenInfo.new(
	40,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local WirePropertiesStart = {
	Color = Color3.fromRGB(170, 85, 0)
}

local WirePropertiesEnd = {
	Color = Color3.fromRGB(27, 42, 53)
}

local RimFirstStart = TweenService:Create(RimFirst, WireAnimationSettings, WirePropertiesStart)
local W1FirstStart = TweenService:Create(W1First, WireAnimationSettings, WirePropertiesStart)
local W2FirstStart = TweenService:Create(W2First, WireAnimationSettings, WirePropertiesStart)
local W3FirstStart = TweenService:Create(W3First, WireAnimationSettings, WirePropertiesStart)
local W4FirstStart = TweenService:Create(W4First, WireAnimationSettings, WirePropertiesStart)
local W5FirstStart = TweenService:Create(W5First, WireAnimationSettings, WirePropertiesStart)
local W6FirstStart = TweenService:Create(W6First, WireAnimationSettings, WirePropertiesStart)
local W7FirstStart = TweenService:Create(W7First, WireAnimationSettings, WirePropertiesStart)
local W8FirstStart = TweenService:Create(W8First, WireAnimationSettings, WirePropertiesStart)
local W9FirstStart = TweenService:Create(W9First, WireAnimationSettings, WirePropertiesStart)
local W10FirstStart = TweenService:Create(W10First, WireAnimationSettings, WirePropertiesStart)
local W11FirstStart = TweenService:Create(W11First, WireAnimationSettings, WirePropertiesStart)
local W12FirstStart = TweenService:Create(W12First, WireAnimationSettings, WirePropertiesStart)
local W13FirstStart = TweenService:Create(W13First, WireAnimationSettings, WirePropertiesStart)
local W14FirstStart = TweenService:Create(W14First, WireAnimationSettings, WirePropertiesStart)
local W15FirstStart = TweenService:Create(W15First, WireAnimationSettings, WirePropertiesStart)
local W16FirstStart = TweenService:Create(W16First, WireAnimationSettings, WirePropertiesStart)
local W17FirstStart = TweenService:Create(W17First, WireAnimationSettings, WirePropertiesStart)
local W18FirstStart = TweenService:Create(W18First, WireAnimationSettings, WirePropertiesStart)
local W19FirstStart = TweenService:Create(W19First, WireAnimationSettings, WirePropertiesStart)
local RimFirstEnd = TweenService:Create(RimFirst, WireAnimationSettings, WirePropertiesEnd)
local W1FirstEnd = TweenService:Create(W1First, WireAnimationSettings, WirePropertiesEnd)
local W2FirstEnd = TweenService:Create(W2First, WireAnimationSettings, WirePropertiesEnd)
local W3FirstEnd = TweenService:Create(W3First, WireAnimationSettings, WirePropertiesEnd)
local W4FirstEnd = TweenService:Create(W4First, WireAnimationSettings, WirePropertiesEnd)
local W5FirstEnd = TweenService:Create(W5First, WireAnimationSettings, WirePropertiesEnd)
local W6FirstEnd = TweenService:Create(W6First, WireAnimationSettings, WirePropertiesEnd)
local W7FirstEnd = TweenService:Create(W7First, WireAnimationSettings, WirePropertiesEnd)
local W8FirstEnd = TweenService:Create(W8First, WireAnimationSettings, WirePropertiesEnd)
local W9FirstEnd = TweenService:Create(W9First, WireAnimationSettings, WirePropertiesEnd)
local W10FirstEnd = TweenService:Create(W10First, WireAnimationSettings, WirePropertiesEnd)
local W11FirstEnd = TweenService:Create(W11First, WireAnimationSettings, WirePropertiesEnd)
local W12FirstEnd = TweenService:Create(W12First, WireAnimationSettings, WirePropertiesEnd)
local W13FirstEnd = TweenService:Create(W13First, WireAnimationSettings, WirePropertiesEnd)
local W14FirstEnd = TweenService:Create(W14First, WireAnimationSettings, WirePropertiesEnd)
local W15FirstEnd = TweenService:Create(W15First, WireAnimationSettings, WirePropertiesEnd)
local W16FirstEnd = TweenService:Create(W16First, WireAnimationSettings, WirePropertiesEnd)
local W17FirstEnd = TweenService:Create(W17First, WireAnimationSettings, WirePropertiesEnd)
local W18FirstEnd = TweenService:Create(W18First, WireAnimationSettings, WirePropertiesEnd)
local W19FirstEnd = TweenService:Create(W19First, WireAnimationSettings, WirePropertiesEnd)

local RimSecondStart = TweenService:Create(RimSecond, WireAnimationSettings, WirePropertiesStart)
local W1SecondStart = TweenService:Create(W1Second, WireAnimationSettings, WirePropertiesStart)
local W2SecondStart = TweenService:Create(W2Second, WireAnimationSettings, WirePropertiesStart)
local W3SecondStart = TweenService:Create(W3Second, WireAnimationSettings, WirePropertiesStart)
local W4SecondStart = TweenService:Create(W4Second, WireAnimationSettings, WirePropertiesStart)
local W5SecondStart = TweenService:Create(W5Second, WireAnimationSettings, WirePropertiesStart)
local W6SecondStart = TweenService:Create(W6Second, WireAnimationSettings, WirePropertiesStart)
local W7SecondStart = TweenService:Create(W7Second, WireAnimationSettings, WirePropertiesStart)
local W8SecondStart = TweenService:Create(W8Second, WireAnimationSettings, WirePropertiesStart)
local W9SecondStart = TweenService:Create(W9Second, WireAnimationSettings, WirePropertiesStart)
local W10SecondStart = TweenService:Create(W10Second, WireAnimationSettings, WirePropertiesStart)
local W11SecondStart = TweenService:Create(W11Second, WireAnimationSettings, WirePropertiesStart)
local W12SecondStart = TweenService:Create(W12Second, WireAnimationSettings, WirePropertiesStart)
local W13SecondStart = TweenService:Create(W13Second, WireAnimationSettings, WirePropertiesStart)
local W14SecondStart = TweenService:Create(W14Second, WireAnimationSettings, WirePropertiesStart)
local W15SecondStart = TweenService:Create(W15Second, WireAnimationSettings, WirePropertiesStart)
local W16SecondStart = TweenService:Create(W16Second, WireAnimationSettings, WirePropertiesStart)
local W17SecondStart = TweenService:Create(W17Second, WireAnimationSettings, WirePropertiesStart)
local W18SecondStart = TweenService:Create(W18Second, WireAnimationSettings, WirePropertiesStart)
local W19SecondStart = TweenService:Create(W19Second, WireAnimationSettings, WirePropertiesStart)
local RimSecondEnd = TweenService:Create(RimSecond, WireAnimationSettings, WirePropertiesEnd)
local W1SecondEnd = TweenService:Create(W1Second, WireAnimationSettings, WirePropertiesEnd)
local W2SecondEnd = TweenService:Create(W2Second, WireAnimationSettings, WirePropertiesEnd)
local W3SecondEnd = TweenService:Create(W3Second, WireAnimationSettings, WirePropertiesEnd)
local W4SecondEnd = TweenService:Create(W4Second, WireAnimationSettings, WirePropertiesEnd)
local W5SecondEnd = TweenService:Create(W5Second, WireAnimationSettings, WirePropertiesEnd)
local W6SecondEnd = TweenService:Create(W6Second, WireAnimationSettings, WirePropertiesEnd)
local W7SecondEnd = TweenService:Create(W7Second, WireAnimationSettings, WirePropertiesEnd)
local W8SecondEnd = TweenService:Create(W8Second, WireAnimationSettings, WirePropertiesEnd)
local W9SecondEnd = TweenService:Create(W9Second, WireAnimationSettings, WirePropertiesEnd)
local W10SecondEnd = TweenService:Create(W10Second, WireAnimationSettings, WirePropertiesEnd)
local W11SecondEnd = TweenService:Create(W11Second, WireAnimationSettings, WirePropertiesEnd)
local W12SecondEnd = TweenService:Create(W12Second, WireAnimationSettings, WirePropertiesEnd)
local W13SecondEnd = TweenService:Create(W13Second, WireAnimationSettings, WirePropertiesEnd)
local W14SecondEnd = TweenService:Create(W14Second, WireAnimationSettings, WirePropertiesEnd)
local W15SecondEnd = TweenService:Create(W15Second, WireAnimationSettings, WirePropertiesEnd)
local W16SecondEnd = TweenService:Create(W16Second, WireAnimationSettings, WirePropertiesEnd)
local W17SecondEnd = TweenService:Create(W17Second, WireAnimationSettings, WirePropertiesEnd)
local W18SecondEnd = TweenService:Create(W18Second, WireAnimationSettings, WirePropertiesEnd)
local W19SecondEnd = TweenService:Create(W19Second, WireAnimationSettings, WirePropertiesEnd)

OverloadButton.ClickDetector.MouseClick:Connect(function()
	if FuelCapacityValue.Value > 20 and LeverPositionValue.Value == 5 and SuperchargerStatusValue.Value == 1 and FESStatusValue.Value == 1 and FuseSystemStatusValue.Value == 0 then
		wait(9.5)
		RimFirstStart:Play()
		W1FirstStart:Play()
		W2FirstStart:Play()
		W3FirstStart:Play()
		W4FirstStart:Play()
		W5FirstStart:Play()
		W6FirstStart:Play()
		W7FirstStart:Play()
		W8FirstStart:Play()
		W9FirstStart:Play()
		W10FirstStart:Play()
		W11FirstStart:Play()
		W12FirstStart:Play()
		W13FirstStart:Play()
		W14FirstStart:Play()
		W15FirstStart:Play()
		W16FirstStart:Play()
		W17FirstStart:Play()
		W18FirstStart:Play()
		W19FirstStart:Play()

		RimSecondStart:Play()
		W1SecondStart:Play()
		W2SecondStart:Play()
		W3SecondStart:Play()
		W4SecondStart:Play()
		W5SecondStart:Play()
		W6SecondStart:Play()
		W7SecondStart:Play()
		W8SecondStart:Play()
		W9SecondStart:Play()
		W10SecondStart:Play()
		W11SecondStart:Play()
		W12SecondStart:Play()
		W13SecondStart:Play()
		W14SecondStart:Play()
		W15SecondStart:Play()
		W16SecondStart:Play()
		W17SecondStart:Play()
		W18SecondStart:Play()
		W19SecondStart:Play()
		wait(30)
		Smoke1First.Enabled = true
		Smoke2First.Enabled = true

		Smoke1Second.Enabled = true
		Smoke2Second.Enabled = true

		wait(42.5)
		RimFirstEnd:Play()
		W1FirstEnd:Play()
		W2FirstEnd:Play()
		W3FirstEnd:Play()
		W4FirstEnd:Play()
		W5FirstEnd:Play()
		W6FirstEnd:Play()
		W7FirstEnd:Play()
		W8FirstEnd:Play()
		W9FirstEnd:Play()
		W10FirstEnd:Play()
		W11FirstEnd:Play()
		W12FirstEnd:Play()
		W13FirstEnd:Play()
		W14FirstEnd:Play()
		W15FirstEnd:Play()
		W16FirstEnd:Play()
		W17FirstEnd:Play()
		W18FirstEnd:Play()
		W19FirstEnd:Play()

		RimSecondEnd:Play()
		W1SecondEnd:Play()
		W2SecondEnd:Play()
		W3SecondEnd:Play()
		W4SecondEnd:Play()
		W5SecondEnd:Play()
		W6SecondEnd:Play()
		W7SecondEnd:Play()
		W8SecondEnd:Play()
		W9SecondEnd:Play()
		W10SecondEnd:Play()
		W11SecondEnd:Play()
		W12SecondEnd:Play()
		W13SecondEnd:Play()
		W14SecondEnd:Play()
		W15SecondEnd:Play()
		W16SecondEnd:Play()
		W17SecondEnd:Play()
		W18SecondEnd:Play()
		W19SecondEnd:Play()
		wait(20)
		Smoke1First.Enabled = false
		Smoke2First.Enabled = false

		Smoke1Second.Enabled = false
		Smoke2Second.Enabled = false
	end
end)
