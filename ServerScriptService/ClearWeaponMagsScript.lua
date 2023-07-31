local WeaponMags = workspace.WeaponMags

WeaponMags.ChildAdded:Connect(function(Child)
	wait(5)
	Child:Destroy()
end)
