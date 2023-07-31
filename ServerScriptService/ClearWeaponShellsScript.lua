local WeaponShells = workspace.WeaponShells

WeaponShells.ChildAdded:Connect(function(Child)
	wait(5)
	Child:Destroy()
end)
