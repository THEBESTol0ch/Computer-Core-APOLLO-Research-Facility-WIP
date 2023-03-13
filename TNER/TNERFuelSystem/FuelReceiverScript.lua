-- Control
local TweenService = game:GetService("TweenService")
local FRButton = workspace[script.Parent.Parent.Parent.Name.."CapButton"].Button
local Trigger = script.Parent.Parent.Parent.Trigger
local FuelCellTrigger = script.Parent.Parent.Parent.FuelCellTrigger
--

-- Values
local FRStatusValue = script.Parent.Parent.Values.FRStatusValue
local LeverValue = workspace[script.Parent.Parent.Parent.Name.."PullLever"].CPU.Values.LeverValue
local FuelCapacityValue = script.Parent.Parent.Parent.Parent.CPU.Values.FuelCapacityValue
--

-- Items
local Connector = script.Parent.Parent.Parent.Connector.MainFrame.Connector
local ConnectorHinge = script.Parent.Parent.Parent.Connector.MainFrame.ConnectorHinge
local Locker = script.Parent.Parent.Parent.Locker.Frame.Locker
local LockerPos = script.Parent.Parent.Parent.Locker.LockerPos
local LeftGrappler = script.Parent.Parent.Parent.LeftGrappler.LeftGrappler
local LeftGrapplerHinge = script.Parent.Parent.Parent.LeftGrappler.LeftGrapplerHinge
local RightGrappler = script.Parent.Parent.Parent.RightGrappler.RightGrappler
local RightGrapplerHinge = script.Parent.Parent.Parent.RightGrappler.RightGrapplerHinge

local FuelCell = script.Parent.Parent.Parent.FuelCell
local FuelCellPosIn = script.Parent.Parent.Parent.FuelCellPosIn
local FuelCellPosOut = script.Parent.Parent.Parent.FuelCellPosOut
--

-- Sounds
local FuelCellInSound = script.Parent.Parent.Parent.SoundEmitter.FuelCellInSound
local FuelCellOutSound = script.Parent.Parent.Parent.SoundEmitter.FuelCellOutSound
local FuelInjectionSound = script.Parent.Parent.Parent.SoundEmitter.FuelInjectionSound
--

-- Monitoring
local FuelCellLable = workspace.FuelSystemMonitor.Monitor.Lines[script.Parent.Parent.Parent.Name.."Status"].SurfaceGui.TextLabel
--

local LeftRightGrapplerAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local ConnectorAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local LockerAnimationSettings = TweenInfo.new(
	0.7,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local FCAAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local LeftGrapplerOpen = TweenService:Create(LeftGrapplerHinge, LeftRightGrapplerAnimationSettings, {
	CFrame = LeftGrapplerHinge.CFrame * CFrame.Angles(math.rad(136.9), 0, 0)
})
local LeftGrapplerClose = TweenService:Create(LeftGrapplerHinge, LeftRightGrapplerAnimationSettings, {
	CFrame = LeftGrapplerHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})
local RightGrapplerOpen = TweenService:Create(RightGrapplerHinge, LeftRightGrapplerAnimationSettings, {
	CFrame = RightGrapplerHinge.CFrame * CFrame.Angles(math.rad(136.9), 0, 0)
})
local RightGrapplerClose = TweenService:Create(RightGrapplerHinge, LeftRightGrapplerAnimationSettings, {
	CFrame = RightGrapplerHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local ConnectorUp = TweenService:Create(ConnectorHinge, ConnectorAnimationSettings, {
	CFrame = ConnectorHinge.CFrame * CFrame.Angles(math.rad(75), 0, 0)
})
local ConnectorDown = TweenService:Create(ConnectorHinge, ConnectorAnimationSettings, {
	CFrame = ConnectorHinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local LockerUp = {
	CFrame = LockerPos.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local LockerDown = {
	CFrame = Locker.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FuelCellIn = {
	CFrame = FuelCellPosIn.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local FuelCellOut = {
	CFrame = FuelCellPosOut.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local FuelCellIn = TweenService:Create(FuelCell.Handle, FCAAnimationSettings, FuelCellIn)
local FuelCellOut = TweenService:Create(FuelCell.Handle, FCAAnimationSettings, FuelCellOut)
local LockerUp = TweenService:Create(Locker, LockerAnimationSettings, LockerUp)
local LockerDown = TweenService:Create(Locker, LockerAnimationSettings, LockerDown)

-- Functions
function DoFuelCell(Hide)
	for _, Item in pairs(FuelCell:GetChildren()) do
		if Hide == false then
			if Item.Name == "Image" then Item.RadiationHazardDecal.Transparency = 0 else Item.Transparency = 0 end
		else
			if Item.Name == "Image" then Item.RadiationHazardDecal.Transparency = 1 else Item.Transparency = 1 end
		end
	end
end
function DoMonitoring(Text, Color)
	FuelCellLable.Text = Text
	FuelCellLable.TextColor3 = Color
end
--

Trigger.Touched:Connect(function(Hit)
	if Hit.Parent.Name == "FuelCell" then
		Trigger.CanTouch = false
		local Player = game.Players:GetPlayerFromCharacter(Hit.Parent.Parent)
		local Tool = workspace[tostring(Player)][Hit.Parent.Name]
		Tool:Destroy()
		DoFuelCell(false)
		FuelCellIn:Play()
		wait(1)
		FuelCell.Handle.WeldConstraint.Enabled = true
		FuelCell.Handle.Anchored = false
		FRStatusValue.Value = "FUEL INSERTED"
	end
end)


LeverValue.Changed:Connect(function()
	if LeverValue.Value == "FULL" then
		FRStatusValue.Value = "LOADING"
		FuelCellInSound:Play()
		LeftGrapplerOpen:Play()
		RightGrapplerOpen:Play()
		wait(1.5)
		ConnectorUp:Play()
		wait(5.5)
		LockerUp:Play()
		wait(1.5)
		LeftGrapplerClose:Play()
		RightGrapplerClose:Play()
		wait(1)
		FRStatusValue.Value = "LOADED"
	else
		FRStatusValue.Value = "REMOVING"
		FuelCell.Solution.BrickColor = BrickColor.new("Dark stone grey")
		FuelCellOutSound:Play()
		LeftGrapplerOpen:Play()
		RightGrapplerOpen:Play()
		wait(3.5)
		LockerDown:Play()
		wait(1)
		ConnectorDown:Play()
		wait(4.9)
		LeftGrapplerClose:Play()
		RightGrapplerClose:Play()
		wait(1)
		FuelCell.Handle.Anchored = true
		FuelCell.Handle.WeldConstraint.Enabled = false
		FuelCellTrigger.ClickDetector.MaxActivationDistance = 10
		FRStatusValue.Value = "REMOVED"
	end
end)

FRButton.ClickDetector.MouseClick:Connect(function()
	if FRStatusValue.Value == "LOADED" then
		FuelInjectionSound:Play()
		DoMonitoring("INJECT", Color3.new(1, 0.666667, 0))
		wait(4.5)
		DoMonitoring("ONLINE", Color3.new(0, 1, 0))
		FuelCapacityValue.Value = FuelCapacityValue.Value + 33
		FRStatusValue.Value = "INJECTED"
	elseif FRStatusValue.Value == "INJECTED" then
		FuelInjectionSound:Play()
		DoMonitoring("OFFLINE", Color3.new(1, 0, 0))
		wait(2)
		FRStatusValue.Value = "DISINJECTED"
	end
end)

FuelCellTrigger.ClickDetector.MouseClick:Connect(function(Player)
	FuelCellTrigger.ClickDetector.MaxActivationDistance = 0
	FuelCellOut:Play()
	wait(1)
	DoFuelCell(true)
	local DepletedFuelCell = game.ReplicatedStorage.DepletedFuelCell
	local Backpack = Player.Backpack
	local DepletedFuelCellClone = DepletedFuelCell:Clone()
	DepletedFuelCellClone.Parent = Backpack
	wait(1)
	FuelCell.Solution.BrickColor = BrickColor.new("Medium green")
	Trigger.CanTouch = true
end)
