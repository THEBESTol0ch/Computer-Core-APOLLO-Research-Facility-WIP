-- Control
local TweenService = game:GetService("TweenService")
local AirlockDoor = script.Parent
local Button1 = AirlockDoor.Button_1.Button
local Button2 = AirlockDoor.Button_2.Button
--

-- Items
local Rods = AirlockDoor.Rods
local RodPositions = Rods.Positions

local UpRod_1 = Rods.UpRod_1
local UpRod_2 = Rods.UpRod_2
local UpRod_3 = Rods.UpRod_3
local UpRodOpenPos = RodPositions.UpRodOpenPos
local UpRodsOpenPos = RodPositions.UpRodsOpenPos
local UpRodClosePos = RodPositions.UpRodClosePos
local UpRodsClosePos = RodPositions.UpRodsClosePos

local DownRod_1 = Rods.DownRod_1
local DownRod_2 = Rods.DownRod_2
local DownRod_3 = Rods.DownRod_3
local DownRodOpenPos = RodPositions.DownRodOpenPos
local DownRodsOpenPos = RodPositions.DownRodsOpenPos
local DownRodClosePos = RodPositions.DownRodClosePos
local DownRodsClosePos = RodPositions.DownRodsClosePos

local LeftDoor = AirlockDoor.LeftDoor.MainFrame
local LeftDoorOpenPos = AirlockDoor.LeftDoor.Positions.DoorOpenPos
local LeftDoorClosePos = AirlockDoor.LeftDoor.Positions.DoorClosePos

local RightDoor = AirlockDoor.RightDoor.MainFrame
local RightDoorOpenPos = AirlockDoor.RightDoor.Positions.DoorOpenPos
local RightDoorClosePos = AirlockDoor.RightDoor.Positions.DoorClosePos

local Gears = AirlockDoor.Gears
local GearPositions = Gears.Positions

local LeftUpGear = Gears.LeftUpGear
local LeftUpGearOpenPos = GearPositions.LeftUpGearOpenPos
local LeftUpGearClosePos = GearPositions.LeftUpGearClosePos

local RightUpGear = Gears.RightUpGear
local RightUpGearOpenPos = GearPositions.RightUpGearOpenPos
local RightUpGearClosePos = GearPositions.RightUpGearClosePos

local LeftDownGear = Gears.LeftDownGear
local LeftDownGearOpenPos = GearPositions.LeftDownGearOpenPos
local LeftDownGearClosePos = GearPositions.LeftDownGearClosePos

local RightDownGear = Gears.RightDownGear
local RightDownGearOpenPos = GearPositions.RightDownGearOpenPos
local RightDownGearClosePos = GearPositions.RightDownGearClosePos
--

-- Sounds
local OpenSound = AirlockDoor.SoundEmitter.AirlockDoorOpenSound
local CloseSound = AirlockDoor.SoundEmitter.AirlockDoorCloseSound
--

-- Logic
local CanEvent = true
local DoorClosed = true

local RodsAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In,
	0,
	false,
	0
)

local DoorOpenAnimationSettings = TweenInfo.new(
	2.2,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local DoorCloseAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local UpRod_1OpenAnim = TweenService:Create(UpRod_1, RodsAnimationSettings, { CFrame = UpRodOpenPos.CFrame })
local UpRod_1CloseAnim = TweenService:Create(UpRod_1, RodsAnimationSettings, { CFrame = UpRodClosePos.CFrame })

local UpRod_2OpenAnim = TweenService:Create(UpRod_2, RodsAnimationSettings, { CFrame = UpRodsOpenPos.CFrame })
local UpRod_2CloseAnim = TweenService:Create(UpRod_2, RodsAnimationSettings, { CFrame = UpRodsClosePos.CFrame })

local UpRod_3OpenAnim = TweenService:Create(UpRod_3, RodsAnimationSettings, { CFrame = UpRodsOpenPos.CFrame })
local UpRod_3CloseAnim = TweenService:Create(UpRod_3, RodsAnimationSettings, { CFrame = UpRodsClosePos.CFrame })

local DownRod_1OpenAnim = TweenService:Create(DownRod_1, RodsAnimationSettings, { CFrame = DownRodOpenPos.CFrame })
local DownRod_1CloseAnim = TweenService:Create(DownRod_1, RodsAnimationSettings, { CFrame = DownRodClosePos.CFrame })

local DownRod_2OpenAnim = TweenService:Create(DownRod_2, RodsAnimationSettings, { CFrame = DownRodsOpenPos.CFrame })
local DownRod_2CloseAnim = TweenService:Create(DownRod_2, RodsAnimationSettings, { CFrame = DownRodsClosePos.CFrame })

local DownRod_3OpenAnim = TweenService:Create(DownRod_3, RodsAnimationSettings, { CFrame = DownRodsOpenPos.CFrame })
local DownRod_3CloseAnim = TweenService:Create(DownRod_3, RodsAnimationSettings, { CFrame = DownRodsClosePos.CFrame })

local LeftDoorOpenAnim = TweenService:Create(LeftDoor, DoorOpenAnimationSettings, { CFrame = LeftDoorOpenPos.CFrame })
local LeftDoorCloseAnim = TweenService:Create(LeftDoor, DoorCloseAnimationSettings, { CFrame = LeftDoorClosePos.CFrame })

local RightDoorOpenAnim = TweenService:Create(RightDoor, DoorOpenAnimationSettings, { CFrame = RightDoorOpenPos.CFrame })
local RightDoorCloseAnim = TweenService:Create(RightDoor, DoorCloseAnimationSettings, { CFrame = RightDoorClosePos.CFrame })

local LeftUpGearOpenAnim = TweenService:Create(LeftUpGear, DoorOpenAnimationSettings, { CFrame = LeftUpGearOpenPos.CFrame })
local LeftUpGearCloseAnim = TweenService:Create(LeftUpGear, DoorCloseAnimationSettings, { CFrame = LeftUpGearClosePos.CFrame })

local RightUpGearOpenAnim = TweenService:Create(RightUpGear, DoorOpenAnimationSettings, { CFrame = RightUpGearOpenPos.CFrame })
local RightUpGearCloseAnim = TweenService:Create(RightUpGear, DoorCloseAnimationSettings, { CFrame = RightUpGearClosePos.CFrame })

local LeftDownGearOpenAnim = TweenService:Create(LeftDownGear, DoorOpenAnimationSettings, { CFrame = LeftDownGearOpenPos.CFrame })
local LeftDownGearCloseAnim = TweenService:Create(LeftDownGear, DoorCloseAnimationSettings, { CFrame = LeftDownGearClosePos.CFrame })

local RightDownGearOpenAnim = TweenService:Create(RightDownGear, DoorOpenAnimationSettings, { CFrame = RightDownGearOpenPos.CFrame })
local RightDownGearCloseAnim = TweenService:Create(RightDownGear, DoorCloseAnimationSettings, { CFrame = RightDownGearClosePos.CFrame })
--

-- Functions
function DoDoor()
	if CanEvent then
		CanEvent = false
		if DoorClosed then
			OpenSound:Play()
			
			UpRod_1OpenAnim:Play()
			DownRod_1OpenAnim:Play()
			wait(0.1)
			UpRod_2OpenAnim:Play()
			DownRod_2OpenAnim:Play()
			wait(0.1)
			UpRod_3OpenAnim:Play()
			DownRod_3OpenAnim:Play()
			wait(0.2)
			LeftDoorOpenAnim:Play()
			RightDoorOpenAnim:Play()
			
			LeftUpGearOpenAnim:Play()
			RightUpGearOpenAnim:Play()
			LeftDownGearOpenAnim:Play()
			RightDownGearOpenAnim:Play()
			
			DoorClosed = false
		elseif DoorClosed == false then
			CloseSound:Play()
			
			LeftDoorCloseAnim:Play()
			RightDoorCloseAnim:Play()
			
			LeftUpGearCloseAnim:Play()
			RightUpGearCloseAnim:Play()
			LeftDownGearCloseAnim:Play()
			RightDownGearCloseAnim:Play()
			wait(1.4)
			UpRod_1CloseAnim:Play()
			DownRod_1CloseAnim:Play()
			wait(0.1)
			UpRod_2CloseAnim:Play()
			DownRod_2CloseAnim:Play()
			wait(0.1)
			UpRod_3CloseAnim:Play()
			DownRod_3CloseAnim:Play()
			
			DoorClosed = true
		end
		CanEvent = true
	end
end
--

Button1.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)

Button2.ClickDetector.MouseClick:Connect(function()
	DoDoor()
end)
