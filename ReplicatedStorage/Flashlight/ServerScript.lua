-- Control
local Tool = script.Parent.Parent.Parent
local CPU = Tool:WaitForChild("CPU")
--

-- Items
local Light = Tool.Light
--

-- Sounds
local ClickSound = Tool.Handle.FlashlightClickSound
local EquipSound = Tool.Handle.SPAS12_Noise2_Sound
--

-- Remote Events
local RemoteEvents = CPU:WaitForChild("RemoteEvents")
local EquipEvent = RemoteEvents.EquipEvent
local UnequipEvent = RemoteEvents.UnequipEvent
local FireEvent = RemoteEvents.FireEvent
--

-- Logic
local Enabled = false
--

-- Functions
function DoLight(Mode)
	ClickSound:Play()
	if Mode == "ON" then
		Light.SpotLight.Enabled = true
		Light.Material = ("Neon")
		Enabled = true
	elseif Mode == "OFF" then
		Light.SpotLight.Enabled = false
		Light.Material = ("SmoothPlastic")
		Enabled = false
	end
end
--

EquipEvent.OnServerEvent:Connect(function()
	EquipSound:Play()
end)

UnequipEvent.OnServerEvent:Connect(function()
	EquipSound:Play()
	if Enabled == true then
		DoLight("OFF")
	end
end)

FireEvent.OnServerEvent:Connect(function()
	ClickSound:Play()
	if Enabled == false then
		DoLight("ON")
	elseif Enabled == true then
		DoLight("OFF")
	end
end)
