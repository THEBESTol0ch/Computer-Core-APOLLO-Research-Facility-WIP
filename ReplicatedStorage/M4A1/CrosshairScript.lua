local MOUSE_ICON = "http://www.roblox.com/asset/?id=14057976785"

local Tool = script.Parent.Parent.Parent

local Mouse = nil

local function UpdateIcon()
	if Mouse then
		Mouse.Icon = Tool.Enabled and MOUSE_ICON
	end
end

local function OnEquipped(mouse)
	Mouse = mouse
	UpdateIcon()
end

local function OnChanged(property)
	if property == 'Enabled' then
		UpdateIcon()
	end
end

Tool.Equipped:connect(OnEquipped)
Tool.Changed:connect(OnChanged)
