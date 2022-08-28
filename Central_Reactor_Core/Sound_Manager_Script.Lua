local CentralReactorCoreStatusValue = workspace.CentralReactorCore.CentralCore.CPU.Values.CentralReactorCoreStatusValue

local CentralCoreOverchargedSound = workspace.CentralReactorCore.CentralCore.SoundEmitter.CentralCoreOverchargedSound
local CentralCoreLastPhaseAmbient = workspace.CentralReactorCore.CentralCore.SoundEmitter.CentralCoreLastPhaseAmbient
local CentralReactorCoreAlarmSound = workspace.CentralReactorCore.CentralCore.SoundEmitter.CentralReactorCoreAlarmSound

local CanEvent1 = true
local CanEvent2 = true

while true do
	if CentralReactorCoreStatusValue.Value == 3 and CanEvent1 == true then
		CanEvent1 = false
		CentralCoreOverchargedSound:Play()
	end
	if CentralReactorCoreStatusValue.Value == 5 and CanEvent2 == true then
		CanEvent2 = false
		CentralCoreLastPhaseAmbient:Play()
		CentralReactorCoreAlarmSound.Looped = true
		CentralReactorCoreAlarmSound:Play()
		wait(8)
		CentralReactorCoreAlarmSound.Looped = false
	end
	if CentralReactorCoreStatusValue.Value == 1 then
		CanEvent1 = true
		CanEvent2 = true
	end
	wait(0.1)
end
