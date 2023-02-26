-- Control
local LeftButton = script.Parent.Dots.LeftButton
local RightButton = script.Parent.Dots.RightButton
--

-- Items
local ImageLabel = script.Parent.ImageLabel
local Dots = {
	script.Parent.Dots.Dot1,
	script.Parent.Dots.Dot2,
	script.Parent.Dots.Dot3,
	script.Parent.Dots.Dot4,
}
local IDs = {
	"rbxassetid://12561031713",
	"rbxassetid://12561033047",
	"rbxassetid://12564285629",
	"rbxassetid://12564289042",
}
--

-- Values
local CurrentSlideValue = script.Parent.CurrentSlideValue
--

-- Functions
function MakeAllDotsGrey()
	for _, Dot in ipairs(Dots) do
		Dot.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
	end
end
--

LeftButton.MouseButton1Down:Connect(function()
	if CurrentSlideValue.Value > 1 then
		CurrentSlideValue.Value = CurrentSlideValue.Value - 1
	end
end)

RightButton.MouseButton1Down:Connect(function()
	if CurrentSlideValue.Value < #Dots then
		CurrentSlideValue.Value = CurrentSlideValue.Value + 1
	end
end)

CurrentSlideValue.Changed:Connect(function()
	MakeAllDotsGrey()
	local Dot = script.Parent.Dots["Dot" .. tostring(CurrentSlideValue.Value)]
	Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

	local ID = IDs[CurrentSlideValue.Value]
	ImageLabel.Image = ID
end)
