local LoadingScreen = script.Parent
local LoadingLabel = script.Parent.Frame.Loading
local Buttons = LoadingScreen.Frame
local PlayButton = script.Parent.Frame.PlayButton

game.ReplicatedFirst:RemoveDefaultLoadingScreen()
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

repeat wait(1) until game:IsLoaded()
wait(5)
PlayButton.Visible = true
LoadingLabel:TweenPosition(UDim2.new(-0.06, 0, 0.969, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
wait(0.5)
PlayButton:TweenPosition(UDim2.new(0.5, 0, 0.74, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
wait(0.5)
LoadingLabel.TextTransparency = 1

PlayButton.MouseEnter:Connect(function()
	PlayButton:TweenSize(UDim2.new(0.116, 0, 0.054, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2, true)
end)

PlayButton.MouseLeave:Connect(function()
	PlayButton:TweenSize(UDim2.new(0.092, 0, 0.043, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2, true)
end)

PlayButton.MouseButton1Down:Connect(function()
	LoadingScreen.Frame:TweenPosition(UDim2.new(0, 0, 1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
	wait(0.5)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
	wait(0.5)
	LoadingScreen:Destroy()
end)
