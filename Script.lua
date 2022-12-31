
local gameid = game.PlaceId

if(gameid == 6191637341) then
--Удаление стены
for i,v in pairs(game:GetService("Workspace")["Normal Map"]:GetDescendants()) do
	if v.Name == "Part" then
		if v.Color == Color3.fromRGB(255,255,0) then
			v:Destroy()
		end
	end
end
	--Приветствие
	local ScreenGui1 = Instance.new("ScreenGui")
local Frame4 = Instance.new("Frame")
local Never = Instance.new("TextLabel")
local Great = Instance.new("TextLabel")

--Properties:

ScreenGui1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui1.ResetOnSpawn = false

Frame4.Parent = ScreenGui1
Frame4.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Frame4.BorderColor3 = Color3.fromRGB(14, 105, 216)
Frame4.Position = UDim2.new(0.401778013, 0, 0.411111116, 0)
Frame4.Size = UDim2.new(0, 375, 0, 100)

Never.Name = "Never"
Never.Parent = Frame4
Never.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Never.BorderColor3 = Color3.fromRGB(42, 42, 42)
Never.Position = UDim2.new(0.0748460293, 0, 0.243599877, 0)
Never.Size = UDim2.new(0, 192, 0, 50)
Never.Font = Enum.Font.SourceSansSemibold
Never.Text = "Never"
Never.TextColor3 = Color3.fromRGB(170, 0, 255)
Never.TextSize = 68.000

Great.Name = "Great"
Great.Parent = Frame4
Great.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Great.BorderColor3 = Color3.fromRGB(42, 42, 42)
Great.Position = UDim2.new(0.535271704, 0, 0.247310176, 0)
Great.Size = UDim2.new(0, 118, 0, 50)
Great.Font = Enum.Font.SourceSansSemibold
Great.Text = "Great"
Great.TextColor3 = Color3.fromRGB(13, 188, 42)
Great.TextSize = 68.000
	wait(2)
	ScreenGui1:Destroy()

	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

	local Window = Library.CreateLib("NeverGreat {Christmas} Weapon Simulator 2", "Midnight")


	local RunService = game:GetService("RunService")
	local Plr = game.Players.LocalPlayer
	local Mouse = Plr:GetMouse()
	
	_G.Safe = nil
	_G.Loop = false
	_G.Kill = false
	_G.Spam = false
	_G.InfiniteJumpEnabled = false



	local Tab = Window:NewTab("Main")

	local Section = Tab:NewSection("Main")

	Section:NewButton("AutoFram Method#1", "Hold the sword in your hands", function()

		while RunService.RenderStepped and wait() do
			for f = 1,5 do
				local Event = Plr.Character.sword.Handle.pr.RemoteEvent
				Event:FireServer()
			end
		end
	end)

	Section:NewButton("AutoFram Method#2", "Do not hold a sword in your hand", function()
		while RunService.RenderStepped and wait() do
			for g = 1,5 do
				local Event2 = game:GetService("Players").LocalPlayer.Backpack.sword.Handle.pr.RemoteEvent
				Event2:FireServer()
				end
		end
	end)

	Section:NewSlider("WalkSpeed", "WalkSpeed", 500, 16, function(s) -- 500 (MaxValue) | 16 (MinValue)
		Plr.Character.Humanoid.WalkSpeed = s
		Plr.Character.LocalScript.Disabled = true 
	end)

	Section:NewSlider("JumpPower", "JumpPower", 500, 50, function(j) -- 500 (MaxValue) | 50 (MinValue)
		Plr.Character.Humanoid.JumpPower = j
		Plr.Character.LocalScript.Disabled = true 
	end)

	Section:NewButton("Infinite jump", "Infinite jump", function()
	  if _G.InfiniteJumpEnabled == false then
		_G.InfiniteJumpEnabled = true
	  else _G.InfiniteJumpEnabled = false
	end
	game:GetService("UserInputService").JumpRequest:connect(function()
		if _G.InfiniteJumpEnabled then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)

	end)

	

	local Tab2 = Window:NewTab("PVP")

	local Section2 = Tab2:NewSection("PVP")

	players = {} -- Создаём таблицу players
	for key, player in pairs(game.Players:GetChildren()) do -- берем из game.Players все объекты
		if player ~= game.Players.LocalPlayer then -- если игрок - не ты
			table.insert(players, player.Name) -- суём в таблицу players имя игрока
		end
	end

	Section2:NewDropdown("Players", "Target", players, function(currentOption)
		if game.Players:FindFirstChild(currentOption) then -- Проверяет, есть ли в папке game.Players объект с именем currentoption (чел может ливнтуь, но в таблице дропдауне он останется)
			PvpPlayer = game.Players[currentOption]
		end
	end)

	Section2:NewButton("Attack Player", "Attack Player", function()
		local A_1 = PvpPlayer.Character.Humanoid
		local Event = Plr.Character.sword.Handle.dmg.RemoteEvent
		Event:FireServer(A_1)

	end)

	
	Section2:NewButton("Attack All Player", "Attack All Player", function()
		local Event = Plr.Character.sword.Handle.dmg.RemoteEvent
		if _G.Kill == false then
			_G.Kill = true
		else
			_G.Kill = false
		end
		
		while RunService.Stepped and _G.Kill == true and wait() do
			for key, childrik in pairs(game.Players:GetChildren()) do
				if childrik.Character and childrik.Character:FindFirstChild('Humanoid') then
					if childrik ~= Plr then
						Event:FireServer(childrik.Character.Humanoid)
					end
				end



			end
		end
	end)
	


	local Tab3 = Window:NewTab("Teleport")


	local Section3 = Tab3:NewSection("Teleport")

	players = {} -- Создаём таблицу players
	for key, player in pairs(game.Players:GetChildren()) do -- берем из game.Players все объекты
		if player ~= game.Players.LocalPlayer then -- если игрок - не ты
			table.insert(players, player.Name) -- суём в таблицу players имя игрока
		end
	end



	Section3:NewDropdown("Players", "Target", players, function(currentOption)
		if game.Players:FindFirstChild(currentOption) then -- Проверяет, есть ли в папке game.Players объект с именем currentoption (чел может ливнтуь, но в таблице дропдауне он останется)
			currentPlayer = game.Players[currentOption]
		end
	end)

	Section3:NewButton("Teleport to Player", "Teleport to Player", function()
		_G.Safe = false
		_G.Spam = false
		Plr.Character.HumanoidRootPart.CFrame = currentPlayer.Character.HumanoidRootPart.CFrame
	end)

	Section3:NewButton("Spam teleport to Player", "Spam teleport to Player", function()
		_G.Safe = false
		if _G.Spam == false then
			_G.Spam = true
			else 
				_G.Spam = false
				end
				while RunService.Stepped and _G.Spam == true and wait() do
		Plr.Character.HumanoidRootPart.CFrame = currentPlayer.Character.HumanoidRootPart.CFrame
				end

	end)

	Section3:NewButton("Teleport to map", "Teleport to map", function()
		_G.Spam = false
		_G.Safe = false
		Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-23.8123016, 4.50574017, -53.4612617, 0.974368036, -3.28998873e-08, 0.224959821, 3.27157501e-08, 1, 4.54617677e-09, -0.224959821, 2.93007996e-09, 0.974368036)
	end)

	Section3:NewButton("Teleport to Out Of Bounds", "Teleport to Out Of Bounds", function()
		_G.Spam = false
		_G.Safe = false
		Plr.Character.HumanoidRootPart.CFrame = CFrame.new(219.009216, 3.12002277, -540.7854, -0.930346966, 2.75241892e-08, 0.366680354, 4.40174119e-08, 1, 3.66184807e-08, -0.366680354, 5.02082145e-08, -0.930346966)
	end)

	Section3:NewButton("Teleport to SafeZone", "Teleport to SafeZone", function()
		_G.Spam = false
		wait()
		if  _G.Safe == false then
			_G.Safe = true
		else  _G.Safe = false

		end

		while wait() and _G.Safe == true do
			Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-26.3467789, 2670.30615, -62.9858551, 0.990268886, 2.22510739e-08, 0.139167085, -2.20039293e-08, 1, -3.31448735e-09, -0.139167085, 2.20011204e-10, 0.990268886)
		end
	end)




	local Tab4 = Window:NewTab("Misc")

	local Section4 = Tab4:NewSection("Misc")

	Section4:NewKeybind("ClosedMenu", "ClosedMenu", Enum.KeyCode.RightControl, function()
		Library:ToggleUI()
	end)

	Section4:NewButton("ReJoin Server", "Reconnect to this server", function()
		local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local Rejoin = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.424423546, 0, 0.42037037, 0)
Frame.Size = UDim2.new(0, 326, 0, 118)
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(56, 56, 56)
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.120

Rejoin.Name = "Rejoin"
Rejoin.Parent = ScreenGui
Rejoin.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Rejoin.BorderColor3 = Color3.fromRGB(56, 56, 56)
Rejoin.Position = UDim2.new(0.460656613, 0, 0.44108966, 0)
Rejoin.Size = UDim2.new(0, 200, 0, 73)
Rejoin.Font = Enum.Font.SourceSans
Rejoin.Text = "Rejoin..."
Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
Rejoin.TextSize = 66.000
wait(1)
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)
 local Tab5 = Window:NewTab("Event") 
 
 local Section5 = Tab5:NewSection("Event")

 Section5:NewButton("Teleport all candies and gifts to me", "Do not use if weak pc", function()
    for cand,can in pairs (game:GetService("Workspace").CandyCanes:GetDescendants()) do
        if can.Name == "Handle" then
           can.CFrame = Plr.Character.HumanoidRootPart.CFrame 
            end
    end
end)

	--Анти даун система
	Instance.new("Part",game:GetService("Workspace"))
	game:GetService("Workspace").Part.Name = "Wall_1"
	game:GetService("Workspace").Wall_1.Anchored = true
	game:GetService("Workspace").Wall_1.CFrame = CFrame.new(-595.397583, 3.12002277, -410.966949, -0.254438758, -2.11989679e-08, 0.967088878, -9.15805671e-08, 1, -2.17423501e-09, -0.967088878, -8.91197587e-08, -0.254438758)
	game:GetService("Workspace").Wall_1.Size = Vector3.new(2048,2048,2)
	Instance.new("Part",game:GetService("Workspace"))
	game:GetService("Workspace").Part.Name = "Wall_2"
	game:GetService("Workspace").Wall_2.Anchored = true
	game:GetService("Workspace").Wall_2.CFrame = CFrame.new(70.6307983, 3.12002277, 431.303284, -0.979937255, -1.52820263e-08, -0.199306354, -1.57578519e-08, 1, 8.01179456e-10, 0.199306354, 3.92574551e-09, -0.979937255)
	game:GetService("Workspace").Wall_2.Size = Vector3.new(2048,2048,10)
	Instance.new("Part",game:GetService("Workspace"))
	game:GetService("Workspace").Part.Name = "Wall_3"
	game:GetService("Workspace").Wall_3.Anchored = true
	game:GetService("Workspace").Wall_3.CFrame = CFrame.new(360.8526, 3.12002277, -160.76181, 0.190806001, 3.53287959e-08, -0.981627762, 1.26080302e-08, 1, 3.84407279e-08, 0.981627762, -1.97111145e-08, 0.190806001)
	game:GetService("Workspace").Wall_3.Size = Vector3.new(2048,2048,8)
	Instance.new("Part",game:GetService("Workspace"))
	game:GetService("Workspace").Part.Name = "Wall_4"
	game:GetService("Workspace").Wall_4.Anchored = true
	game:GetService("Workspace").Wall_4.CFrame = CFrame.new(266.544525, 3.12002325, -598.026672, 0.976301253, -1.2449588e-08, 0.216415972, 1.43221008e-08, 1, -7.08402803e-09, -0.216415972, 1.00156772e-08, 0.976301253)
	game:GetService("Workspace").Wall_4.Size = Vector3.new(2048,2048,4)
	game:GetService("Workspace").Wall_1.Transparency = 1
	game:GetService("Workspace").Wall_2.Transparency = 1
	game:GetService("Workspace").Wall_3.Transparency = 1
	game:GetService("Workspace").Wall_4.Transparency = 1

else 
	game:service('Players').LocalPlayer:Kick('Scripts for this game are not yet in the database')
end
