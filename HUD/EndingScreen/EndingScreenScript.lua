-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local EndGameControlValue = game.ReplicatedStorage.GameValues.EndGameControlValue
--

-- Items
local Frame = script.Parent.Frame
local Stator = script.Parent.Frame.TweenParts.Stator
local Rotor = script.Parent.Frame.TweenParts.Rotor
local CircleBG = script.Parent.Frame.TweenParts.CircleBG
local ApolloCorp = script.Parent.Frame.TweenParts.ApolloCorp
local Rectangle = script.Parent.Frame.TweenParts.Rectangle
local RectangleBG = script.Parent.Frame.TweenParts.RectangleBG
local VersionLabel = script.Parent.Frame.TweenParts.VersionLabel
local Titles = script.Parent.Frame.TweenParts.Titles
--

local FrameAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local FrameProperties = {
	Transparency = 0
}

local FrameStart = TweenService:Create(Frame, FrameAnimationSettings, FrameProperties)

EndGameControlValue.Changed:Connect(function()
	if EndGameControlValue.Value == "END" then
		Frame.Visible = true
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
		FrameStart:Play()
		wait(4)
		ApolloCorp:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Elastic, 3, false)
		Stator:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Elastic, 3, false)
		Rotor:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Elastic, 3, false)
		Rectangle:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Elastic, 3, false)
		CircleBG:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Elastic, 3, false)
		wait(4)
		ApolloCorp:TweenSize(UDim2.new(0, 398, 0, 398), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 2, false)
		wait(3)
		Stator:TweenPosition(UDim2.new(0.497, 0, 0.269, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 2, false)
		Rotor:TweenPosition(UDim2.new(0.497, 0, 0.269, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 2, false)
		ApolloCorp:TweenPosition(UDim2.new(0.497, 0, 0.269, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 2, false)
		Rectangle:TweenPosition(UDim2.new(0.497, 0, 0.269, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 2, false)
		CircleBG:TweenPosition(UDim2.new(0.497, 0, 0.269, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 2, false)
		RectangleBG.BackgroundTransparency = 0
		wait(2)
		Titles:TweenPosition(UDim2.new(0.5, 0, -2, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 30, false)
		wait(5)
		Rectangle:TweenPosition(UDim2.new(0.495, 0, 0.479, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, false)
		wait(1)
		Rectangle:TweenSize(UDim2.new(0, 963, 0, 8), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, false)
		wait(24)
		VersionLabel:TweenPosition(UDim2.new(0.06, 0, 0.969, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, false)
		Rectangle:TweenSize(UDim2.new(0, 184, 0, 8), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, false)
		wait(1)
		Rectangle:TweenPosition(UDim2.new(0.497, 0, 0.269, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, false)
	end
end)
