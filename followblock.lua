--This goes inside the object that you want to have follow you
--For example: if I put this script in a part the part will be the pet
local pet = script.Parent

function givePet (player)
	if player then
		local character = player.Character
		if character then
			local humRootPart = character.HumanoidRootPart
			local newPet = pet:Clone ()
			newPet.Parent = character

			local bodyPos = Instance.new("BodyPosition", newPet)
			bodyPos.MaxForce = Vector3.new(math.huge, math.min, math.huge)

			local bodyGyro = Instance.new("BodyGyro", newPet)
			bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

			while wait() do
				bodyPos.Position = humRootPart.Position + Vector3.new(2, 2, 3)
				bodyGyro.CFrame = humRootPart.CFrame
			end
		end
	end
end

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		givePet(player)
	end)
end)
