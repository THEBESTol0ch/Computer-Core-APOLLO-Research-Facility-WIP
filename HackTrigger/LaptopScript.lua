-- Control
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local Trigger = script.Parent.Parent.Parent.Trigger
local HackTrigger = script.Parent.Parent.Parent.Parent.HackTrigger
--

-- Values
local LaptopStatusValue = script.Parent.Parent.Values.LaptopStatusValue
local HackTimeValue = script.Parent.Parent.Values.HackTimeValue
--

-- Items
local Hinge = script.Parent.Parent.Parent.Monitor.Hinge
local MainFrame = script.Parent.Parent.Parent.MainFrame
local Frame = script.Parent.Parent.Parent.Monitor.Frame
--

-- Sounds
local SPAS12_Noise2_Sound = script.Parent.Parent.Parent.SPAS12_Noise2_Sound
--

-- Logic
local LaptopClosed = true
--

-- Monitoring
local LineTextLabel = script.Parent.Parent.Parent.Monitor.Lines.Line.SurfaceGui.TextLabel
local HeaderTextLabel = script.Parent.Parent.Parent.Monitor.Lines.Header.SurfaceGui.TextLabel
local LoginFrame = script.Parent.Parent.Parent.Monitor.Lines.Login.Frame
local PasswordFrame = script.Parent.Parent.Parent.Monitor.Lines.Password.Frame
local LoginLetters = script.Parent.Parent.Parent.Monitor.Lines.Login.Letters
local PasswordLetters = script.Parent.Parent.Parent.Monitor.Lines.Password.Letters
--

local MonitorOpenAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local MonitorCloseAnimationSettings = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

local MonitorOpen = TweenService:Create(Hinge, MonitorOpenAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(-120), 0, 0)
})
local MonitorClose = TweenService:Create(Hinge, MonitorCloseAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

-- Functions
function DoData(Mode, Item)
	if Mode == "PaintText" then
		for _, Object in pairs(LoginLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.TextColor3 = Item
		end
		for _, Object in pairs(PasswordLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.TextColor3 = Item
		end
	elseif Mode == "ChangeText" then
		for _, Object in pairs(LoginLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.Text = Item
		end
		for _, Object in pairs(PasswordLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.Text = Item
		end
	elseif Mode == "Visible" then
		for _, Object in pairs(LoginLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.Visible = Item
		end
		for _, Object in pairs(PasswordLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.Visible = Item
		end
	elseif Mode == "GetLogin" then
		for Count = 1, 9, 1 do
			local Letter = string.sub(Item, Count, Count)
			LoginLetters["Letter" .. Count].SurfaceGui.TextLabel.Text = Letter
			wait(0.1)
		end
	elseif Mode == "GetPassword" then
		for Count = 1, 9, 1 do
			local Letter = string.sub(Item, Count, Count)
			PasswordLetters["Letter" .. Count].SurfaceGui.TextLabel.Text = Letter
			wait(0.1)
		end
	elseif Mode == "GetTrueData" then
		for _, Object in pairs(LoginLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.Text = string.char(math.random(65, 90))
		end
		for _, Object in pairs(PasswordLetters:GetChildren()) do
			Object.SurfaceGui.TextLabel.Text = string.char(math.random(48, 57))
		end
		DoData("PaintText", Color3.new(0, 1, 0))
		LaptopStatusValue.Value = "HACKED"
	elseif Mode == "GetLoginAndPassword" then
		for Count = 1, HackTimeValue.Value * 2, 1 do
			if LaptopStatusValue.Value == "HACKING" then
				DoData("PaintText", Color3.new(1, 1, 1))
				wait(0.1)
				for _, Object in pairs(LoginLetters:GetChildren()) do
					Object.SurfaceGui.TextLabel.Text = string.char(math.random(65, 90))
				end
				for _, Object in pairs(PasswordLetters:GetChildren()) do
					Object.SurfaceGui.TextLabel.Text = string.char(math.random(48, 57))
				end
				wait(0.2)
				DoData("PaintText", Color3.new(1, 0, 0))
				wait(0.2)
			end
		end
		if LaptopStatusValue.Value == "HACKING" then
			DoData("GetTrueData")
		end
	end
end
function DoLaptop(Mode, Player)
	if Mode == "Delete" then
		Trigger.ClickDetector.MaxActivationDistance = 0
		MonitorClose:Play()
		wait(0.5)
		LaptopClosed = true
		LaptopStatusValue.Value = ""
		MainFrame.Transparency = 1
		Frame.Transparency = 1
		LineTextLabel.Visible = false
		HeaderTextLabel.Visible = false
		LoginFrame.Transparency = 1
		PasswordFrame.Transparency = 1
		DoData("Visible", false)
		DoData("PaintText", Color3.new(1, 1, 1))
		DoData("ChangeText", "-")
	elseif Mode == "Give" then
		DoLaptop("Delete")
		local MilitaryLaptop = game.ReplicatedStorage.MilitaryLaptop
		local Backpack = Player.Backpack
		local MilitaryLaptopClone = MilitaryLaptop:Clone()
		MilitaryLaptopClone.Parent = Backpack
		SPAS12_Noise2_Sound:Play()
		HackTrigger.CanTouch = true	
	end
end
--

Trigger.ClickDetector.MouseClick:Connect(function(Player)
	if Player.Team == Teams["Administration"] or Player.Team == Teams["Raiders"] or Player.Team == Teams["Maintenance"] or Player.Team == Teams["Scientists"] or Player.Team == Teams["Visitors"] then
		if LaptopStatusValue.Value == "LOADING" or LaptopStatusValue.Value == "HACKING" or LaptopStatusValue.Value == "" or LaptopStatusValue.Value == "LOADING COMPLETED" then
			if LaptopClosed == true then
				Trigger.ClickDetector.MaxActivationDistance = 0
				MonitorOpen:Play()
				wait(1)
				LaptopClosed = false
				Trigger.ClickDetector.MaxActivationDistance = 10
			end
		end
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function(Player)
	if Player.Team == Teams["Administration"] or Player.Team == Teams["Raiders"] or Player.Team == Teams["Maintenance"] or Player.Team == Teams["Scientists"] or Player.Team == Teams["Visitors"] then
		if LaptopStatusValue.Value == "LOADING" or LaptopStatusValue.Value == "HACKING" or LaptopStatusValue.Value == "" then
			if LaptopClosed == false then
				Trigger.ClickDetector.MaxActivationDistance = 0
				MonitorClose:Play()
				wait(0.5)
				LaptopClosed = true
				Trigger.ClickDetector.MaxActivationDistance = 10
			end
		end
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function(Player)
	if Player.Team == Teams["Administration"] or Player.Team == Teams["Raiders"] or Player.Team == Teams["Maintenance"] or Player.Team == Teams["Scientists"] or Player.Team == Teams["Visitors"] then
		if LaptopClosed == true and LaptopStatusValue.Value == "" then
			LaptopStatusValue.Value = "LOADING"
			wait(1.5)
			LineTextLabel.Visible = true
			wait(1)
			HeaderTextLabel.Visible = true
			HeaderTextLabel.Text = "LOADING"
			wait(10)
			HeaderTextLabel.Text = "LOGIN"
			LoginFrame.Transparency = 0
			PasswordFrame.Transparency = 0
			DoData("Visible", true)
			LaptopStatusValue.Value = "LOADING COMPLETED"
		end
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function(Player)
	if Player.Team == Teams["Administration"] or Player.Team == Teams["Raiders"] or Player.Team == Teams["Maintenance"] or Player.Team == Teams["Scientists"] or Player.Team == Teams["Visitors"] then
		if LaptopClosed == false and LaptopStatusValue.Value == "LOADING COMPLETED" then
			wait(0.5)
			LaptopStatusValue.Value = "HACKING"
			DoData("ChangeText", "-")
			DoData("PaintText", Color3.new(1, 1, 1))
			DoData("GetLogin", "QWERTY123")
			DoData("GetPassword", "123456789")
			DoData("PaintText", Color3.new(1, 0, 0))
			wait(1)
			DoData("ChangeText", "-")
			DoData("PaintText", Color3.new(1, 1, 1))
			DoData("GetLogin", "ADMIN1234")
			DoData("GetPassword", "987654321")
			DoData("PaintText", Color3.new(1, 0, 0))
			wait(1)
			DoData("ChangeText", "-")
			DoData("PaintText", Color3.new(1, 1, 1))
			DoData("GetLogin", "AAAAAAAAA")
			DoData("GetPassword", "111111111")
			DoData("PaintText", Color3.new(1, 0, 0))
			wait(1)
			DoData("ChangeText", "-")
			DoData("PaintText", Color3.new(1, 1, 1))
			DoData("GetLogin", "LOGIN1234")
			DoData("GetPassword", "PASSWORDD")
			DoData("PaintText", Color3.new(1, 0, 0))
			wait(2)
			DoData("GetLoginAndPassword")
		end
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function(Player)
	if Player.Team == Teams["Administration"] or Player.Team == Teams["Raiders"] or Player.Team == Teams["Maintenance"] or Player.Team == Teams["Scientists"] or Player.Team == Teams["Visitors"] then
		if LaptopStatusValue.Value == "HACKED" then
			DoLaptop("Give", Player)
		end
	end
end)

Trigger.ClickDetector.MouseClick:Connect(function(Player)
	if Player.Team == Teams["Security"] then
		DoLaptop("Give", Player)
	end
end)
