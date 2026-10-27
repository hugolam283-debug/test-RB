local you = game.Players.LocalPlayer
local playerGui = you.PlayerGui
local screenGuis = playerGui:FindFirstChild("PL TP")
if screenGuis then
	screenGuis:Destroy()
end
screenGuis = Instance.new("ScreenGui", playerGui)
screenGuis.ResetOnSpawn = false
screenGuis.Name = "PL TP"
local vote = false
local button = Instance.new("TextButton", screenGuis)
button.BackgroundTransparency = 0.5
button.Size = UDim2.new(0.1, 0, 0.1, 0)
button.Position = UDim2.new(0.1, 0, 0.1, 0)
button.TextScaled = true
button.Text = "Auto TP Enemy (Click)"
button.MouseButton1Click:Connect(function()
	vote = not vote
	button.Text = vote and "Auto TP Enemy On" or "Auto TP Enemy Off"
end)
while screenGuis.Parent do
	task.wait()
	local aggressors = workspace:FindFirstChild("Animal_Live") and workspace.Animal_Live:FindFirstChild("Aggressors")
	local character = you.Character
	local HumanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")		
	if vote == true and aggressors and HumanoidRootPart then
		local part = character:FindFirstChild("Part")
		if not part then
			part = Instance.new("Part", character)
			part.Size = Vector3.new(3, 0, 3)
			part.Anchored = true
			part.Transparency = 1
			part.Name = "Part"
		end
		for _, v in pairs(aggressors:GetDescendants()) do
			if v:IsA("MeshPart") then
				character.Humanoid:MoveTo(v.Position)
				task.wait(10)
				part.CFrame = v.CFrame * CFrame.new(-v.Size.Z / 3, v.Size.Y / 3, -v.Size.Z / 3)
				HumanoidRootPart.CFrame = part.CFrame * CFrame.new(0, 3, 0)
				break
			end
		end
	end
end
