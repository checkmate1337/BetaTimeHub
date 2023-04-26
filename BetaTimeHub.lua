local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "BETA TimeHub",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by Its Show Time",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/bm6k4zrj7T", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "Join The Discord server",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"hellblvde"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("Main")

local Button = Tab:CreateButton({
   Name = "Esp Players",
   Callback = function()
   while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(255,48,48)
                    esp.AlwaysOnTop = false
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
   end,
})

local Button = Tab:CreateButton({
   Name = "island esp",
   Callback = function()
       Camera = game:GetService("Workspace").CurrentCamera
         RunService = game:GetService("RunService")
         camera = workspace.CurrentCamera
         Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
      
         function GetPoint(vector3)
            local vector, onScreen = camera:WorldToViewportPoint(vector3)
            return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
         end
      
         function MakeESPi(name, pos)
            local Displayi = Drawing.new("Text")
            local GetPi = GetPoint(pos)
            coroutine.resume(coroutine.create(function()
               local Distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - pos).Magnitude
               if getgenv().IslandESP and GetPi[2] then
                  Displayi.Visible = true
                  Displayi.Size = 16
                  Displayi.Position = GetPoint(pos + Vector3.new(0,3,0))[1]
                  Displayi.Center = true
                  Displayi.Outline = true
                  Displayi.OutlineColor = Color3.fromRGB(0, 31, 10)
                  Displayi.Color = Color3.fromRGB(93, 255, 28)
                  Displayi.Text = name.. " [" .. math.floor((pos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) .. "]"
               else
                  Displayi.Visible = false
               end
               RunService.RenderStepped:Wait()
               Displayi:Remove()
            end))
         end
      
         local locations = {
            {
               "Town of Beginnings", Vector3.new(965.813, 9.3792, 1193.66)
            },
            {
               "Marine Fort F-1", Vector3.new(2903.81, 19.8525, -992.64)
            },
            {
               "Sandora", Vector3.new(-1312.52, 11.2798, 1159.75)
            },
            {
               "Shells Town", Vector3.new(-555.405, 8.31007, -4444.5)
            },
            {
               "Island Of Zou", Vector3.new(-4350.31, 8.35266, -2552.52)
            },
            {
               "Baratie", Vector3.new(-3902.05, 7.71404, -5515.66)
            },
            {
               "Orange Town", Vector3.new(-6919.07, 8.03144, -5349.92)
            },
            {
               "Mysterious Cliff", Vector3.new(2200.65, 8.35073, -8593.66)
            },
            {
               "Roca Island", Vector3.new(5112.48, 5.67623, -4893.96)
            },
            {
               "Colosseum", Vector3.new(-2019.94, 8.17096, -7672.47)
            },
            {
               "Sphinx Island", Vector3.new(-6561.8, 43.4117, -9933.17)
            },
            {
               "Arlong Park", Vector3.new( 476.883, 14.2324, -13084.8)
            },
            {
               "Land of the Sky", Vector3.new(8116.27, 8.9139, -9818.94)
            },
            {
               "Gravitos Fort", Vector3.new(2609, 9.14529, -15366.6)
            },
            {
               "Fishman Cave ", Vector3.new(5682.35, 5.62546, -16459.9)
            },
            {
               "Marine Base G-1", Vector3.new(-9772.59, 18.8261, -14688.4)
            },
            {
               "Coco Island ", Vector3.new(-4253.72, 9.13279, -15532.2)
            },
            {
               "Shrine", Vector3.new(-12186, -10.6763, -18545.9)
            },
            {
               "Kori Island", Vector3.new(-6702.16, 7.48236, 1841.65)
            },
            {
               "Reverse Mountain", Vector3.new(-14313.3, 10.8181, -9464.9)
            }
         }
         
         while RunService.RenderStepped:Wait() do
            for i, v in ipairs(locations) do
               MakeESPi(locations[i][1], locations[i][2])
            end
         end
      end
   
})


