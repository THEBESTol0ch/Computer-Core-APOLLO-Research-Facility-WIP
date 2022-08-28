local TweenService = game:GetService("TweenService")

local AKeycardAllowed = true
local EKeycardAllowed = true
local SOKeycardAllowed = true

local Trigger = script.Parent.Trigger
local AKC = script.Parent.AKC
local SOKC = script.Parent.SOKC
local EKC = script.Parent.EKC
local KeyCardPos = script.Parent.KeyCardPos
local SoundEmitter = script.Parent.SoundEmitter
local KeyCardSound = script.Parent.SoundEmitter.KeyCardSound
local ConfirmingSound = script.Parent.SoundEmitter.ConfirmingSound
local RejectionSound = script.Parent.SoundEmitter.RejectionSound

local DoorValue = script.Parent.Parent.Door.DoorValue

local AKCIn = {
	CFrame = KeyCardPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local AKCOut = {
	CFrame = AKC.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local SOKCIn = {
	CFrame = KeyCardPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local SOKCOut = {
	CFrame = SOKC.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EKCIn = {
	CFrame = KeyCardPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local EKCOut = {
	CFrame = EKC.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local KeyCardAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local AKCIn = TweenService:Create(AKC, KeyCardAnimationSettings, AKCIn)
local AKCOut = TweenService:Create(AKC, KeyCardAnimationSettings, AKCOut)
local SOKCIn = TweenService:Create(SOKC, KeyCardAnimationSettings, SOKCIn)
local SOKCOut = TweenService:Create(SOKC, KeyCardAnimationSettings, SOKCOut)
local EKCIn = TweenService:Create(EKC, KeyCardAnimationSettings, EKCIn)
local EKCOut = TweenService:Create(EKC, KeyCardAnimationSettings, EKCOut)

script.Parent.Trigger.Touched:Connect(function(hit)
	if hit.Parent.Name == "A. Keycard" then
		if AKeycardAllowed == true then
			Trigger.CanTouch = false
			DoorValue.Value = 1
			AKC.Transparency = 0
			AKC.AdministrationKeyCardFront.Transparency = 0
			AKC.AdministrationKeyCardBack.Transparency = 0
			AKCIn:Play()
			KeyCardSound:Play()
			wait(0.5)
			ConfirmingSound:Play()
			wait(0.5)
			AKCOut:Play()
			wait(0.8)
			AKC.Transparency = 1
			AKC.AdministrationKeyCardFront.Transparency = 1
			AKC.AdministrationKeyCardBack.Transparency = 1
			Trigger.CanTouch = true
		else
			Trigger.CanTouch = false
			AKC.Transparency = 0
			AKC.AdministrationKeyCardFront.Transparency = 0
			AKC.AdministrationKeyCardBack.Transparency = 0
			AKCIn:Play()
			KeyCardSound:Play()
			wait(0.5)
			RejectionSound:Play()
			wait(0.5)
			AKCOut:Play()
			wait(0.8)
			AKC.Transparency = 1
			AKC.AdministrationKeyCardFront.Transparency = 1
			AKC.AdministrationKeyCardBack.Transparency = 1
			Trigger.CanTouch = true
		end
	end
end)

script.Parent.Trigger.Touched:Connect(function(hit)
	if hit.Parent.Name == "S.O. Keycard" then
		if SOKeycardAllowed == true then
			Trigger.CanTouch = false
			DoorValue.Value = 1
			SOKC.Transparency = 0
			SOKC.SecurityOfficerKeyCardFront.Transparency = 0
			SOKC.SecurityOfficerKeyCardBack.Transparency = 0
			SOKCIn:Play()
			KeyCardSound:Play()
			wait(0.5)
			ConfirmingSound:Play()
			wait(0.5)
			SOKCOut:Play()
			wait(0.8)
			SOKC.Transparency = 1
			SOKC.SecurityOfficerKeyCardFront.Transparency = 1
			SOKC.SecurityOfficerKeyCardBack.Transparency = 1
			Trigger.CanTouch = true
		else
			Trigger.CanTouch = false
			SOKC.Transparency = 0
			SOKC.SecurityOfficerKeyCardFront.Transparency = 0
			SOKC.SecurityOfficerKeyCardBack.Transparency = 0
			SOKCIn:Play()
			KeyCardSound:Play()
			wait(0.5)
			RejectionSound:Play()
			wait(0.5)
			SOKCOut:Play()
			wait(0.8)
			SOKC.Transparency = 1
			SOKC.SecurityOfficerKeyCardFront.Transparency = 1
			SOKC.SecurityOfficerKeyCardBack.Transparency = 1
			Trigger.CanTouch = true
		end
	end
end)

script.Parent.Trigger.Touched:Connect(function(hit)
	if hit.Parent.Name == "E. Keycard" then
		if EKeycardAllowed == true then
			Trigger.CanTouch = false
			DoorValue.Value = 1
			EKC.Transparency = 0
			EKC.EmployeeKeyCardFront.Transparency = 0
			EKC.EmployeeKeyCardBack.Transparency = 0
			EKCIn:Play()
			KeyCardSound:Play()
			wait(0.5)
			ConfirmingSound:Play()
			wait(0.5)
			EKCOut:Play()
			wait(0.8)
			EKC.Transparency = 1
			EKC.EmployeeKeyCardFront.Transparency = 1
			EKC.EmployeeKeyCardBack.Transparency = 1
			Trigger.CanTouch = true
		else
			Trigger.CanTouch = false
			EKC.Transparency = 0
			EKC.EmployeeKeyCardFront.Transparency = 0
			EKC.EmployeeKeyCardBack.Transparency = 0
			EKCIn:Play()
			KeyCardSound:Play()
			wait(0.5)
			RejectionSound:Play()
			wait(0.5)
			EKCOut:Play()
			wait(0.8)
			EKC.Transparency = 1
			EKC.EmployeeKeyCardFront.Transparency = 1
			EKC.EmployeeKeyCardBack.Transparency = 1
			Trigger.CanTouch = true
		end
	end
end)
