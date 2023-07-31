game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		wait(3)
		for _, Item in pairs(Character:GetChildren()) do
			if Item:IsA("Accessory") then
				local MeshPart = Item:FindFirstChildWhichIsA("MeshPart")
				MeshPart.CanCollide = false
				MeshPart.CanQuery = false
				MeshPart.CanTouch = false
			end
		end
		
		Character.ChildAdded:Connect(function(Child)
			if Child:IsA("Tool") and Child:FindFirstChild("BodyAttach") and Character.Humanoid.Health > 0 then
				local M6D = Instance.new("Motor6D")
				M6D.Parent = Character.RightHand -- Parent M6D to the tool
				M6D.Name = "ToolGrip"
				M6D.Part0 = Character.RightHand
				M6D.Part1 = Child.BodyAttach
				
				Character.RightHand:WaitForChild("RightGrip")
				Character.RightHand.RightGrip:Destroy()
			end
		end)
		
		Character.ChildRemoved:Connect(function(Child)
			if (Child.Name == "HKUSPMatch" or Child.Name == "M4A1" or Child.Name == "SPAS12") and Character.Humanoid.Health > 0 then
				Character.RightHand.ToolGrip:Destroy()
			end
		end)
	end)
end)
