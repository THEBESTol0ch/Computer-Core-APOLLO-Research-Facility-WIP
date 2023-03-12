-- RSU 09R74S
-- RSD 82S65D

-- Control
local KeyboardTrigger = workspace.TNERCodeComputer.TNERCodeKeyboard.KeyboardTrigger
--

-- Values
local TNERStatusValue = workspace.TNER.CPU.Values.TNERStatusValue
--

-- Items
local CodeLabel = script.Parent.Parent.Parent.Parent.TNERCodeMonitor.Lines.Code.SurfaceGui.TextLabel
local StripesLabel = script.Parent.Parent.Parent.Parent.TNERCodeMonitor.Lines.Stripes.SurfaceGui.TextLabel
local CodeSequences = {
	["OFFLINE"] = {
		{ WaitTime = 0.562, Code = "0", Stripes = "» «" },
		{ WaitTime = 0.250, Code = "09", Stripes = "»   «" },
		{ WaitTime = 0.277, Code = "09R", Stripes = "»    «" },
		{ WaitTime = 1.011, Code = "09R7", Stripes = "»     «" },
		{ WaitTime = 0.230, Code = "09R74", Stripes = "»       «" },
		{ WaitTime = 0.217, Code = "09R74S", Stripes = "»        «" },
		{ WaitTime = 0.436, Code = "CODE ACCEPTED", Color = Color3.new(0, 1, 0), Stripes = "" },
	},
	["ONLINE"] = {
		{ WaitTime = 0.562, Code = "8", Stripes = "» «" },
		{ WaitTime = 0.250, Code = "82", Stripes = "»   «" },
		{ WaitTime = 0.277, Code = "82S", Stripes = "»    «" },
		{ WaitTime = 1.011, Code = "82S6", Stripes = "»     «" },
		{ WaitTime = 0.230, Code = "82S65", Stripes = "»       «" },
		{ WaitTime = 0.217, Code = "82S65D", Stripes = "»        «" },
		{ WaitTime = 0.436, Code = "CODE ACCEPTED", Color = Color3.new(0, 1, 0), Stripes = "" },
	},
}
--

-- Functions
function ActivateCode(Sequence)
	for _, Step in pairs(CodeSequences[Sequence]) do
		wait(Step.WaitTime)
		CodeLabel.Text = Step.Code
		StripesLabel.Text = Step.Stripes
		if Step.Color then
			CodeLabel.TextColor3 = Step.Color
		end
	end
	wait(0.5)
	for Count = 0, 3, 1 do
		CodeLabel.Text = ("")
		wait(0.5)
		CodeLabel.Text = ("CODE ACCEPTED")
		wait(0.5)
	end
	wait(5)
	CodeLabel.Text = ""
	CodeLabel.TextColor3 = Color3.new(1, 1, 1)
	StripesLabel.Text = "»«"
end
--

KeyboardTrigger.ClickDetector.MouseClick:Connect(function()
	if TNERStatusValue.Value == "OFFLINE" then
		ActivateCode(TNERStatusValue.Value)
	elseif TNERStatusValue.Value == "ONLINE" or TNERStatusValue.Value == "MAINTENANCE MODE" then
		ActivateCode("ONLINE")
	end
end)
