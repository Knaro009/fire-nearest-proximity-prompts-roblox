local lp = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")

_G.fireamount = 350

local pxps = {}
local pxppositions = {}

for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
	if v:IsA("ProximityPrompt") and v.Parent:IsA("BasePart") then
		table.insert(pxps, v)
		table.insert(pxppositions, v.Parent)
	end
end

local function nearestpxps(part)
	local nearest = {}
	
	for i,pxpp in pairs(pxppositions) do
		if (part.Position - pxpp.Position).Magnitude < 15 then
			table.insert(nearest, pxps[i])
		end
	end
	return nearest
end

uis.InputBegan:Connect(function(inp)
	if inp.KeyCode == Enum.KeyCode.Q then
		for i,v in pairs(nearestpxps(lp.Character.HumanoidRootPart)) do
			spawn(function()
				for i = 1,_G.fireamount do
					fireproximityprompt(v)
				end
			end)
		end	
	end
end)
