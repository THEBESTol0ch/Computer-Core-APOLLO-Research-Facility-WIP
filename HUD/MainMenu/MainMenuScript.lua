script.Parent.Menu.Draggable = true

-- Control
local MenuButton = script.Parent.MenuButton
local CloseButton = script.Parent.Menu.CloseButton
local GuideButton = script.Parent.Menu.Buttons.GuideButton
local TeamsButton = script.Parent.Menu.Buttons.TeamsButton
local OptionsButton = script.Parent.Menu.Buttons.OptionsButton
local DevLogButton = script.Parent.Menu.Buttons.DevLogButton
local CreditsButton = script.Parent.Menu.Buttons.CreditsButton
--

-- Items
local Title = script.Parent.Menu.Title
local Menu = script.Parent.Menu
local Logo = script.Parent.Menu.Decoration.Logo
local TeamsTab = script.Parent.Menu.TeamsTab
local OptionsTab = script.Parent.Menu.OptionsTab
local DevLogTab = script.Parent.Menu.DevLogTab
local CreditsTab = script.Parent.Menu.CreditsTab
--

-- Values
local EndGameControlValue = game.ReplicatedStorage.GameValues.EndGameControlValue
--

-- Logic
local MenuOpened = false
--

-- Functions
function HideAllTabs()
	Title.Text = ""
	Logo.Visible = false
	TeamsTab.Visible = false
	OptionsTab.Visible = false
	DevLogTab.Visible = false
	CreditsTab.Visible = false
end
function OpenMenu()
	if MenuOpened == false then
		Menu.Visible = true
		MenuOpened = true
		Menu:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
	else
		MenuOpened = false
		Menu:TweenPosition(UDim2.new(0.5, 0, -0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
		wait(0.5)
		HideAllTabs()
		Logo.Visible = true
		Menu.Visible = false
	end
end
function CloseMenu()
	if MenuOpened == false then
		Menu.Visible = true
		MenuOpened = true
		Menu:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
	else
		MenuOpened = false
		Menu:TweenPosition(UDim2.new(0.5, 0, -0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, false)
		wait(0.5)
		HideAllTabs()
		Logo.Visible = true
		Menu.Visible = false
	end
end
--

MenuButton.MouseButton1Down:Connect(function()
	OpenMenu()
end)

CloseButton.MouseButton1Down:Connect(function()
	CloseMenu()
end)

GuideButton.MouseButton1Down:Connect(function()
	CloseMenu()
end)

TeamsButton.MouseButton1Down:Connect(function()
	HideAllTabs()
	TeamsTab.Visible = true
	Title.Text = "TEAMS"
end)

OptionsButton.MouseButton1Down:Connect(function()
	HideAllTabs()
	OptionsTab.Visible = true
	Title.Text = "OPTIONS"
end)

DevLogButton.MouseButton1Down:Connect(function()
	HideAllTabs()
	DevLogTab.Visible = true
	Title.Text = "DEV-LOG"
end)

CreditsButton.MouseButton1Down:Connect(function()
	HideAllTabs()
	CreditsTab.Visible = true
	Title.Text = "CREDITS"
end)

EndGameControlValue.Changed:Connect(function()
	if EndGameControlValue.Value == "END" then
		MenuButton.Visible = false
	end
end)
