-- Control
local TweenService = game:GetService("TweenService")
--

-- Values
local TNERFuse5StatusValue = script.Parent.Parent.Parent.CPU.Values.TNERFuse5StatusValue
--

-- Items
local Bubble = script.Parent.Bubble
local Matter = script.Parent.Matter
local Beam = script.Parent.Beam
--

local MatterAnimationSettings1 = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local MatterAnimationSettings2 = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local MatterAnimationSettings3 = TweenInfo.new(
	0.5,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)

local MatterPropertiesCondition1 = {
	Size = Vector3.new(1.4, 1.4, 1.4);
}
local MatterPropertiesCondition2 = {
	Size = Vector3.new(1, 1, 1);
}
local MatterPropertiesCondition3 = {
	Size = Vector3.new(0.2, 0.2, 0.2);
}
local BubblePropertiesCondition1 = {
	Size = Vector3.new(1.72, 1.72, 1.72);
}
local BubblePropertiesCondition2 = {
	Size = Vector3.new(1.4, 1.4, 1.4);
}
local BubblePropertiesCondition3 = {
	Size = Vector3.new(0.32, 0.32, 0.32);
}

local MatterStart1 = TweenService:Create(Matter, MatterAnimationSettings1, MatterPropertiesCondition2)
local MatterStart2 = TweenService:Create(Matter, MatterAnimationSettings2, MatterPropertiesCondition1)
local MatterStart3 = TweenService:Create(Matter, MatterAnimationSettings3, MatterPropertiesCondition3)
local BubbleStart1 = TweenService:Create(Bubble, MatterAnimationSettings1, BubblePropertiesCondition2)
local BubbleStart2 = TweenService:Create(Bubble, MatterAnimationSettings2, BubblePropertiesCondition1)
local BubbleStart3 = TweenService:Create(Bubble, MatterAnimationSettings3, BubblePropertiesCondition3)

-- Functions
function DoMatter()
	if TNERFuse5StatusValue.Value == "ONLINE" then
		Beam.Transparency = 0
		repeat
			MatterStart1:Play()
			BubbleStart1:Play()
			wait(2)
			MatterStart2:Play()
			BubbleStart2:Play()
			wait(3)
		until TNERFuse5StatusValue.Value == "SHUT DOWN"
		Beam.Transparency = 1
		MatterStart3:Play()
		BubbleStart3:Play()
	end
end
--

DoMatter()

TNERFuse5StatusValue.Changed:Connect(function()
	DoMatter()
end)
