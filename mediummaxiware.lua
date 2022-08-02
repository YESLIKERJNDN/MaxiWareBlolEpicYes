local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "MaxiWare V1.3", HidePremium = false, IntroEnabled = false,  SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


local Section = Tab:AddSection({
	Name = "- Main Scripts"
})

OrionLib:MakeNotification({
	Name = "Enjoy Maxiware..!",
	Content = "Fixing Color Picker , Making Prem Systems [WARNING]: THIS SCRIPT IS STILL UNDER CONSTRUCTION. ",
	Image = "rbxassetid://4483345998",
	Time = 15
})

Tab:AddButton({
	Name = "Fly",
	Callback = function()
      	local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

localplayer = plr

if workspace:FindFirstChild("Core") then
workspace.Core:Destroy()
end

local Core = Instance.new("Part")
Core.Name = "Core"
Core.Size = Vector3.new(0.05, 0.05, 0.05)

spawn(function()
Core.Parent = workspace
local Weld = Instance.new("Weld", Core)
Weld.Part0 = Core
Weld.Part1 = localplayer.Character.LowerTorso
Weld.C0 = CFrame.new(0, 0, 0)
end)

workspace:WaitForChild("Core")

local torso = workspace.Core
flying = true
local speed=10
local keys={a=false,d=false,w=false,s=false}
local e1
local e2
local function start()
local pos = Instance.new("BodyPosition",torso)
local gyro = Instance.new("BodyGyro",torso)
pos.Name="EPIXPOS"
pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
pos.position = torso.Position
gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
gyro.cframe = torso.CFrame
repeat
wait()
localplayer.Character.Humanoid.PlatformStand=true
local new=gyro.cframe - gyro.cframe.p + pos.position
if not keys.w and not keys.s and not keys.a and not keys.d then
speed=5
end
if keys.w then
new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
speed=speed+0
end
if keys.s then
new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
speed=speed+0
end
if keys.d then
new = new * CFrame.new(speed,0,0)
speed=speed+0
end
if keys.a then
new = new * CFrame.new(-speed,0,0)
speed=speed+0
end
if speed>10 then
speed=5
end
pos.position=new.p
if keys.w then
gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
elseif keys.s then
gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
else
gyro.cframe = workspace.CurrentCamera.CoordinateFrame
end
until flying == false
if gyro then gyro:Destroy() end
if pos then pos:Destroy() end
flying=false
localplayer.Character.Humanoid.PlatformStand=false
speed=10
end
e1=mouse.KeyDown:connect(function(key)
if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
if key=="w" then
keys.w=true
elseif key=="s" then
keys.s=true
elseif key=="a" then
keys.a=true
elseif key=="d" then
keys.d=true
elseif key=="x" then
if flying==true then
flying=false
else
flying=true
start()
end
end
end)
e2=mouse.KeyUp:connect(function(key)
if key=="w" then
keys.w=false
elseif key=="s" then
keys.s=false
elseif key=="a" then
keys.a=false
elseif key=="d" then
keys.d=false
end
end)
start()
  	end    
})

Tab:AddButton({
	Name = "Tool Reach",
	Callback = function()
      		for i, v in pairs(game:GetService "Players".LocalPlayer.Character:GetChildren()) do
    if v:isA("Tool") then
        local a = Instance.new("SelectionBox", v.Handle)
        a.Adornee = v.Handle
        v.Handle.Size = Vector3.new(50, 50, 50)
        v.Handle.Transparency = 1
        lplayer.Character.Humanoid:UnequipTools()
    end
end
  	end    
})

Tab:AddButton({
	Name = "Show Usernames!",
	Callback = function()
      		  for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character then
                if v.Character:FindFirstChild("Humanoid") then
                    v.Character:FindFirstChild("Humanoid").DisplayName = v.Name 
                end
            end
        end
    

  	end    
})

Tab:AddButton({
	Name = "Force Reset",
	Callback = function()
      		for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v:Destroy()
        end
    end

  	end    
})

Tab:AddButton({
	Name = "Rejoin",
	Callback = function()
      		 game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)

  	end    
})


Tab:AddButton({
	Name = "Trash-Talk [Y]",
	Callback = function()
      	local words = {
    'ur bad',
    'seed',
    'im not locking ur just bad',
    'kid im not locking XDXDXDXD ur just bad',
    'sad',
    'sonned',
    'how did u fail to get me',
}

local player = game.Players.LocalPlayer
local keybind = 'y'

local event = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest

player:GetMouse().KeyDown:connect(function(key)
    if key == keybind then
        event:FireServer(words[math.random(#words)], "All")
    end
end)
  	end    
})

Tab:AddButton({
	Name = "No Recoil!",
	Callback = function()
      		local CurrentFocus = game:GetService("Workspace").CurrentCamera.CFrame
    game:GetService("Workspace").CurrentCamera:Destroy()
    local Instance = Instance.new("Camera", game:GetService("Workspace"))
    Instance.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    Instance.CameraType = Enum.CameraType.Custom
    Instance.CFrame = CurrentFocus
  	end    
})
      
Tab:AddButton({
	Name = "Free Fists [Q]",
	Callback = function()
      		local localPlayer       = game:GetService("Players").LocalPlayer
local localCharacter    = localPlayer.Character
local Mouse             = localPlayer:GetMouse()
local FistControl       = false
local LeftFist          = localCharacter.LeftHand
local RightFist         = localCharacter.RightHand


local uis = game:GetService("UserInputService")


local loopFunction = function()
	LeftFist.CFrame  = CFrame.new(Mouse.Hit.p)
	RightFist.CFrame = CFrame.new(Mouse.Hit.p)
end

local Loop

local Start = function()
	Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction)
end

local Pause = function()
	Loop:Disconnect()
end


uis.InputBegan:connect(function(Key)
	if (Key.KeyCode == Enum.KeyCode.Q) then
		if (FistControl == false) then
			FistControl = true
			Start()
			pcall(function()
				localCharacter.RightHand.RightWrist:Remove()
				localCharacter.LeftHand.LeftWrist:Remove()
			end)
		elseif (FistControl == true) then
			FistControl = false
			Pause()
			local rightwrist  = Instance.new("Motor6D")
			rightwrist.Name   = "RightWrist"
			rightwrist.Parent = localCharacter.RightHand
			rightwrist.C0     = CFrame.new(1.18422506e-07, -0.5009287, -6.81715525e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			rightwrist.C1     = CFrame.new(3.55267503e-07, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			rightwrist.Part0  = localCharacter.RightLowerArm
			rightwrist.Part1  = localCharacter.RightHand

			local leftwrist   = Instance.new("Motor6D")
			leftwrist.Name    = "LeftWrist"
			leftwrist.Parent  = localCharacter.LeftHand
			leftwrist.C0      = CFrame.new(0.000475466368, -0.5009287, 7.59417072e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			leftwrist.C1      = CFrame.new(0.000475821638, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			leftwrist.Part0   = localCharacter.LeftLowerArm
			leftwrist.Part1   = localCharacter.LeftHand
		end
	end
end)
  	end    
})

Tab:AddButton({
	Name = "Fake Acronix Macro [V]",
	Callback = function()
      	repeat wait() until game:IsLoaded() 

getgenv().Fix = true

getgenv().TeclasWS = {
    ["tecla1"] = "M", -- speed +5
    ["tecla2"] = "N", -- speed -5
    ["tecla3"] = "V" -- toggle  
}



-- // servicios
local MININOS_DOXXEADOS = game:GetService("Players")
local AUDIOS_LOUD_DE_TRAP = game:GetService("StarterGui") or "son una mierda"

-- // objetos
local neonazi = MININOS_DOXXEADOS.LocalPlayer
local esvastica = neonazi:GetMouse()

-- // variables
local lista_de_victimas_de_drizzy = getrenv()._G
local da_hood_rblxm_REAL = getrawmetatable(game)
local CP = da_hood_rblxm_REAL.__newindex
local CP_DE_DRIZZY = da_hood_rblxm_REAL.__index
local velocidad_de_cum = 122
local es_pedofilo = true

-- // funciones para acortar codigo :]
function anunciar_atentado_terrorista(fecha_del_atentado)
    AUDIOS_LOUD_DE_TRAP:SetCore("SendNotification",{
        Title="AcroNix Ontop",
        Text=fecha_del_atentado,
        Icon="https://www.roblox.com/library/1331725226/LETTER-A-LETTER-A-LETTER-A-LETTER-A?Category=Decals&SortType=Relevance&SortAggregation=AllTime&SearchKeyword=letter%20A&CreatorId=0&Page=1&Position=1&SearchId=61894a9f-1969-4dad-b71e-16466e860ae7"
       })
end


getgenv().TECHWAREWALKSPEED_LOADED = true


wait(1.5)


anunciar_atentado_terrorista("Welcome"..TeclasWS.tecla3.."")

-- // conexión
esvastica.KeyDown:Connect(function(el_impostor)
    if el_impostor:lower() == TeclasWS.tecla1:lower() then
        velocidad_de_cum = velocidad_de_cum + 1
        anunciar_atentado_terrorista(" (speed =   "..tostring(velocidad_de_cum)..")")
    elseif el_impostor:lower() == TeclasWS.tecla2:lower() then
        velocidad_de_cum = velocidad_de_cum - 1
        anunciar_atentado_terrorista(" (speed =  "..tostring(velocidad_de_cum)..")")
    elseif el_impostor:lower() == TeclasWS.tecla3:lower() then
        if es_pedofilo then
            es_pedofilo = false
            anunciar_atentado_terrorista("Acronix OFF")
        else
            es_pedofilo = true
            anunciar_atentado_terrorista("Acronix ON")
        end
    end
end)

-- // mi parte favorita: metametodos
setreadonly(da_hood_rblxm_REAL,false)
da_hood_rblxm_REAL.__index = newcclosure(function(BEST_ON_TOP,IS_GARBAGE)
    local esPedofilo = checkcaller()
    if IS_GARBAGE == "WalkSpeed" and not esPedofilo then
        return lista_de_victimas_de_drizzy.CurrentWS
    end
    return CP_DE_DRIZZY(BEST_ON_TOP,IS_GARBAGE)
end)
da_hood_rblxm_REAL.__newindex = newcclosure(function(kaias,ip,logger)
    local unNeonazi = checkcaller()
    if es_pedofilo then
        if ip == "WalkSpeed" and logger ~= 0 and not unNeonazi then
            return CP(kaias,ip,velocidad_de_cum)
        end
    end
    return CP(kaias,ip,logger)
end)
setreadonly(da_hood_rblxm_REAL,true)

repeat wait() until game:IsLoaded()
local Players = game:service('Players')
local Player = Players.LocalPlayer

repeat wait() until Player.Character

local userInput = game:service('UserInputService')
local runService = game:service('RunService')

local Multiplier = -0.22
local Enabled = false
local whentheflashnoiq

userInput.InputBegan:connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.LeftBracket then
        Multiplier = Multiplier + 0.01
        print(Multiplier)
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.LeftBracket) do
            wait()
            Multiplier = Multiplier + 0.01
            print(Multiplier)
        end
    end

    if Key.KeyCode == Enum.KeyCode.RightBracket then
        Multiplier = Multiplier - 0.01
        print(Multiplier)
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.RightBracket) do
            wait()
            Multiplier = Multiplier - 0.01
            print(Multiplier)
        end
    end

    if Key.KeyCode == Enum.KeyCode.P then
        Enabled = not Enabled
        if Enabled == true then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
                game:GetService("RunService").Stepped:waitn()
            until Enabled == true
        end
    end
end)

if Fix == true then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/youtubetutorials123/helo/main/123"))()
end
  	end    
})
  	
local Tab = Window:MakeTab({
	Name = "Side Scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "-Side Scripts"
})

Tab:AddButton({
	Name = "Pp-Bat",
	Callback = function()
      		local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local k = game.Workspace.Ignored.Shop["[Bat] - $250"]
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
        wait(.2)
        fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
        toolf = game.Players.LocalPlayer.Backpack:WaitForChild("[Bat]")
        toolf.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("[Bat]")
        game.Players.LocalPlayer.Character:WaitForChild("[Bat]").Grip = CFrame.new(-2.4000001, -0.699999988, 0, 0, 1, -0, -1, 0, -0, 0, 0, 1)
        game.Players.LocalPlayer.Character:WaitForChild("[Bat]").GripForward = Vector3.new(0, -1, -0)
        game.Players.LocalPlayer.Character:WaitForChild("[Bat]").GripPos = Vector3.new(1.2111, 1.11114, 1.8111)
        game.Players.LocalPlayer.Character:WaitForChild("[Bat]").GripUp = Vector3.new(-500000, 404, 5000000)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
    end
  	end    
})

Tab:AddButton({
	Name = "No Bullet Delay!",
	Callback = function()
      		local ReplicatedStorage = game.ReplicatedStorage
local Network = game.Network
local Delay = ReplicatedStorage.BulletHole.Delay

Delay.Position:Destroy()
Delay.Position = 0


  	end    
})

Tab:AddButton({
	Name = "Anti Stomp [K]",
	Callback = function()
      		game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "k" then
    for L_170_forvar0, L_171_forvar1 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if L_171_forvar1:IsA("BasePart") then
            L_171_forvar1:Destroy()
        end
    end
    end
end)


  	end    
})

Tab:AddButton({
	Name = "No Slowdown!",
	Callback = function()
      		local mt = getrawmetatable(game)
local backup
backup = hookfunction(mt.__newindex, newcclosure(function(self, key, value)
if key == "WalkSpeed" and value < 16 then
value = 16
end
return backup(self, key, value)
end))
	
  	   

  	end    
})

Tab:AddButton({
	Name = "Cframe UI [V]!",
	Callback = function()
      		local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Speed", "DarkTheme")

local speed = Window:NewTab("Speed")
local rs = speed:NewSection("CFrame Speed")
rs:NewButton("CFrame Guns FIX", "ButtonInfo", function()
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                wait(0.1)
                if child:FindFirstChild("LocalScript") then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
end)
rs:NewButton("CFrame Speed (X)", "ButtonInfo", function()
    	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 0.5
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.X then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end)
rs:NewSlider("CFrame Speed ", "SliderInfo", 5, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().Multiplier = s
end)
rs:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.v , function()
	Library.ToggleUI()
end)
  	end    
})


Tab:AddButton({
	Name = "FPS Booster!",
	Callback = function()
      		local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end

end
})

local Tab = Window:MakeTab({
	Name = "Aimlocks",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "-Streamable Locks"
})

Tab:AddButton({
	Name = "Streamable Lock V1 [C]!",
	Callback = function()
      		getgenv().OldAimPart = "UpperTorso"
getgenv().AimPart = "UpperTorso" -- For R15 Games: {UpperTorso, LowerTorso, HumanoidRootPart, Head} | For R6 Games: {Head, Torso, HumanoidRootPart}  
    getgenv().AimlockKey = "c"
    getgenv().AimRadius = 30 -- How far away from someones character you want to lock on at
    getgenv().ThirdPerson = true 
    getgenv().FirstPerson = true
    getgenv().TeamCheck = false -- Check if Target is on your Team (True means it wont lock onto your teamates, false is vice versa) (Set it to false if there are no teams)
    getgenv().PredictMovement = true -- Predicts if they are moving in fast velocity (like jumping) so the aimbot will go a bit faster to match their speed 
    getgenv().PredictionVelocity = 6.612
    getgenv().CheckIfJumped = true
    getgenv().Smoothness = true
    getgenv().SmoothnessAmount = 0.025

    local Players, Uis, RService, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"RunService", game:GetService"StarterGui";
    local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new;
    local Aimlock, MousePressed, CanNotify = true, false, false;
    local AimlockTarget;
    local OldPre;
    

    
    getgenv().WorldToViewportPoint = function(P)
        return Camera:WorldToViewportPoint(P)
    end
    
    getgenv().WorldToScreenPoint = function(P)
        return Camera.WorldToScreenPoint(Camera, P)
    end
    
    getgenv().GetObscuringObjects = function(T)
        if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then 
            local RayPos = workspace:FindPartOnRay(RNew(
                T[getgenv().AimPart].Position, Client.Character.Head.Position)
            )
            if RayPos then return RayPos:IsDescendantOf(T) end
        end
    end
    
    getgenv().GetNearestTarget = function()
        -- Credits to whoever made this, i didnt make it, and my own mouse2plr function kinda sucks
        local players = {}
        local PLAYER_HOLD  = {}
        local DISTANCES = {}
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= Client then
                table.insert(players, v)
            end
        end
        for i, v in pairs(players) do
            if v.Character ~= nil then
                local AIM = v.Character:FindFirstChild("Head")
                if getgenv().TeamCheck == true and v.Team ~= Client.Team then
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                elseif getgenv().TeamCheck == false and v.Team == Client.Team then 
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                end
            end
        end
        
        if unpack(DISTANCES) == nil then
            return nil
        end
        
        local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
        if L_DISTANCE > getgenv().AimRadius then
            return nil
        end
        
        for i, v in pairs(PLAYER_HOLD) do
            if v.diff == L_DISTANCE then
                return v.plr
            end
        end
        return nil
    end
    
    Mouse.KeyDown:Connect(function(a)
        if not (Uis:GetFocusedTextBox()) then 
            if a == AimlockKey and AimlockTarget == nil then
                pcall(function()
                    if MousePressed ~= true then MousePressed = true end 
                    local Target;Target = GetNearestTarget()
                    if Target ~= nil then 
                        AimlockTarget = Target
                    end
                end)
            elseif a == AimlockKey and AimlockTarget ~= nil then
                if AimlockTarget ~= nil then AimlockTarget = nil end
                if MousePressed ~= false then 
                    MousePressed = false 
                end
            end
        end
    end)
    
    RService.RenderStepped:Connect(function()
        if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        end
        if Aimlock == true and MousePressed == true then 
            if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then 
                if getgenv().FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().PredictMovement == true then
                            if getgenv().Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                                
                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                            end
                        elseif getgenv().PredictMovement == false then 
                            if getgenv().Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)

                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                            end
                        end
                    end
                end
            end
        end
         if CheckIfJumped == true then
       if AimlockTarget.Character.HuDDDDDDDDDDWmanoid.FloorMaterial == Enum.Material.Air then
    
           getgenv().AimPart = "UpperTorso"
       else
         getgenv().AimPart = getgenv().OldAimPart

       end
    end
end)
  	end    
})

Tab:AddButton({
	Name = "Streamable Lock [TENAKI] [Q]",
	Callback = function()
      		getgenv().AimingSettings = {
    Aimbot = {
        Radius = 45,
        Hitbox = "Head",
        CameraMode = true,
        MouseMode = false,
        HitAirshots = false,
        AutoPrediction = false,
        NotificationMode = false,
        Keybind = Enum.KeyCode.Q,
        PredictionAmount = 0.165,



        Smoothing = {
        Enabled = true,
        Amount = 0.030
    },
 }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Tenakii/tenaaki/main/genericaimbot.v.2.0.0"))()

  	end    
})

local Section = Tab:AddSection({
	Name = "Streamproof Silent Aim"
})

Tab:AddButton({
	Name = "Streamable Silent Aim",
	Callback = function()
      		loadstring(game:HttpGet("https://gist.githubusercontent.com/diegxw/46748ae27e8a4630619d85ea1e13dc5e/raw/5225600f4150f87646b8d20088a1da9f100aaa06/settingsV2"))()
DaHoodSettings.Prediction = 0.1437
Aiming.TargetPart = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart", "RightFoot", "LeftFoot"}
Aiming.FOV = 9.4
Aiming.FOVSides = 25
Aiming.HitChance = 110
Aiming.ShowFOV = false
  	end    
})

Tab:AddButton({
	Name = "Streamproof Silent Aim!",
	Callback = function()
      		 local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/VvAH1Bcry", true))()
                            Aiming.TeamCheck(false)
                             
                            
                            local Workspace = game:GetService("Workspace")
                            local Players = game:GetService("Players")
                            local RunService = game:GetService("RunService")
                            local UserInputService = game:GetService("UserInputService")
                            
                            
                            local LocalPlayer = Players.LocalPlayer
                            local Mouse = LocalPlayer:GetMouse()
                            local CurrentCamera = Workspace.CurrentCamera
                            
                            local DaHoodSettings = {
                                SilentAim = true,
                                AimLock = false,
                                Prediction = 0.131,
                                AimLockKeybind = Enum.KeyCode.E
                            }
                            getgenv().DaHoodSettings = DaHoodSettings
                            
                            
                            function Aiming.Check()
                            -------------
                                if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
                                    return false
                                end
                            
                                -- // Check if downed
                                local Character = Aiming.Character(Aiming.Selected)
                                local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
                                local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
                            
                                -- // Check B
                                if (KOd or Grabbed) then
                                    return false
                                end
                            
                                -- //
                                return true
                            end
                            
                            -- // Hook
                            local __index
                            __index = hookmetamethod(game, "__index", function(t, k)
                                -- // Check if it trying to get our mouse's hit or target and see if we can use it
                                if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
                                    local SelectedPart = Aiming.SelectedPart
                            
                                    -- // Hit/Target
                                    if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
                                        -- // Hit to account prediction
                                        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
                            
                                        -- // Return modded val
                                        return (k == "Hit" and Hit or SelectedPart)
                                    end
                                end
                            
                                -- // Return
                                return __index(t, k)
                            end)
                            
                            -- // Aimlock
                            RunService:BindToRenderStep("AimLock", 0, function()
                                if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then
                                    -- // Vars
                                    local SelectedPart = Aiming.SelectedPart
                            
                                    -- // Hit to account prediction
                                    local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
                            
                                    CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)
                                end
                                end)
  	end    
})

Tab:AddButton({
	Name = "Silent Special Aim [Q]!",
	Callback = function()
      		local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

--[[
JOIN DISCORD.GG/LOCKS
BEST LOCKS !
YOUTUBE:JustAimlock

]]
-- Toggle
getgenv().Target = true
-- Configuration
getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 0.178
getgenv().ChatMode = false
getgenv().NotifMode = true
    getgenv().PartMode = true
    getgenv().AirshotFunccc = true
    getgenv().Partz = "HumanoidRootPart"
getgenv().AutoPrediction = true
--
    _G.Types = {
        Ball = Enum.PartType.Ball,
        Block = Enum.PartType.Block, 
        Cylinder = Enum.PartType.Cylinder
    }
    
    --variables                 
    	local Tracer = Instance.new("Part", game.Workspace)
    Tracer.Name = "gay"	
    Tracer.Anchored = true		
    Tracer.CanCollide = false
    Tracer.Transparency = 0.8
    Tracer.Parent = game.Workspace	
    Tracer.Shape = _G.Types.Block
    Tracer.Size = Vector3.new(6,6,6)
    Tracer.Color = Color3.fromRGB(32, 28, 52)
    
    
    --
    local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Runserv = game:GetService("RunService")

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(32, 28, 52)
circle.Thickness = 0
circle.NumSides = 732
circle.Radius = 250
circle.Thickness = 0
circle.Transparency = 0.7
circle.Visible = true
circle.Filled = false

Runserv.RenderStepped:Connect(function()
    circle.Position = Vector2.new(mouse.X,mouse.Y+35)
end)
    
    	local guimain = Instance.new("Folder", game.CoreGui)
    	local CC = game:GetService"Workspace".CurrentCamera
    local LocalMouse = game.Players.LocalPlayer:GetMouse()
    	local Locking = false
    
    	
    --
    if getgenv().valiansh == true then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "Valiant",
                   Text = "Already Loaded!",
                   Duration = 5
        
                   })
        return
    end
    
    getgenv().valiansh = true
    
        local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(keygo,ok)
           if (not ok) then
           if (keygo.KeyCode == getgenv().Key) then
               if getgenv().Target == true then
               Locking = not Locking
               
               if Locking then
               Plr =  getClosestPlayerToCursor()
                if getgenv().ChatMode then
        local A_1 = "Target: "..tostring(Plr.Character.Humanoid.DisplayName) local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
        	end	
               if getgenv().NotifMode then

				Notify({
					Description = "Target: "..tostring(Plr.Character.Humanoid.DisplayName);
					Title = "discord.gg/locks Silent Aimbot";
					Duration = 5;
					});  

    
 
    end
    elseif not Locking then
         if getgenv().ChatMode then
        local A_1 = "Unlocked!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
        	end	
        if getgenv().NotifMode then
			Notify({
				Description = "Unlocked";
				Title = "discord.gg/locks Silent Aimbot";
				Duration = 5;
				});  
           elseif getgenv().Target == false then
			Notify({
				Description = "Target isn't enabled";
				Title = "Silent Aimbot";
				Duration = 5;
				}); 
               
               end
                  
 
 end     end   
end
end
end)
	
	function getClosestPlayerToCursor()
		local closestPlayer
		local shortestDistance = circle.Radius

		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
				local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer
	end
--
if getgenv().PartMode then
	game:GetService"RunService".Stepped:connect(function()
		if Locking and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
			Tracer.CFrame = CFrame.new(Plr.Character.LowerTorso.Position+(Plr.Character.LowerTorso.Velocity*Prediction))
		else
			Tracer.CFrame = CFrame.new(0, 9999, 0)

		end
	end)
end

    
    
    --
	local rawmetatable = getrawmetatable(game)
	local old = rawmetatable.__namecall
	setreadonly(rawmetatable, false)
	rawmetatable.__namecall = newcclosure(function(...)
		local args = {...}
		if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
			return old(unpack(args))
		end
		return old(...)
	end)


if getgenv().AirshotFunccc == true then

            if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().Partz = "RightFoot"
            else
                Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                    if new == Enum.HumanoidStateType.Freefall then
                    getgenv().Partz = "RightFoot"
                    else
                        getgenv().Partz = "LowerTorso"
                    end
                end)
            end
end
---
	while wait() do
	if getgenv().AutoPrediction == true then
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
        if ping < 130 then
            getgenv().Prediction = 0.151
        elseif ping < 125 then
            getgenv().Prediction = 0.149
        elseif ping < 110 then
            getgenv().Prediction = 0.146
        elseif ping < 105 then
            getgenv().Prediction = 0.138
        elseif ping < 90 then
            getgenv().Prediction = 0.136
        elseif ping < 80 then
            getgenv().Prediction = 0.134
        elseif ping < 70 then
            getgenv().Prediction = 0.131
        elseif ping < 60 then
            getgenv().Prediction = 0.1229
        elseif ping < 50 then
            getgenv().Prediction = 0.1225
        elseif ping < 40 then
            getgenv().Prediction = 0.1256
        end
	end
    end

  	end    
})

  local Section = Tab:AddSection({
	Name = "Cam Locks"
})

Tab:AddButton({
	Name = "Normal Cam Lock [WITH FOV] [Q] [P]!",
	Callback = function()
      		--.gg/lock 

getgenv().Prediction = 0.15038
getgenv().AimPart = "HumanoidRootPart"
getgenv().Key = "Q"
getgenv().DisableKey = "P"

getgenv().FOV = true
getgenv().ShowFOV = false
getgenv().FOVSize = 55

--// Variables (Service)

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local GS = game:GetService("GuiService")
local SG = game:GetService("StarterGui")

--// Variables (regular)

local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local Camera = WS.CurrentCamera
local GetGuiInset = GS.GetGuiInset

local AimlockState = true
local Locked
local Victim

local SelectedKey = getgenv().Key
local SelectedDisableKey = getgenv().DisableKey

--// Notification function

function Notify(tx)
    SG:SetCore("SendNotification", {
        Title = "Cam Lock Enabled | .gg/thusky",
        Text = tx,
        Duration = 5
    })
end

--// Check if aimlock is loaded

if getgenv().Loaded == true then
    Notify("Aimlock is already loaded!")
    return
end

getgenv().Loaded = true

--// FOV Circle

local fov = Drawing.new("Circle")
fov.Filled = false
fov.Transparency = 1
fov.Thickness = 1
fov.Color = Color3.fromRGB(255, 255, 0)
fov.NumSides = 1000

--// Functions

function update()
    if getgenv().FOV == true then
        if fov then
            fov.Radius = getgenv().FOVSize * 2
            fov.Visible = getgenv().ShowFOV
            fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)

            return fov
        end
    end
end

function WTVP(arg)
    return Camera:WorldToViewportPoint(arg)
end

function WTSP(arg)
    return Camera.WorldToScreenPoint(Camera, arg)
end

function getClosest()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil
        
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(getgenv().AimPart) and notKO and notGrabbed then
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            
            if (getgenv().FOV) then
                if (fov.Radius > magnitude and magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            else
                if (magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
    end
    return closestPlayer
end
 
--// Checks if key is down

Mouse.KeyDown:Connect(function(k)
    SelectedKey = SelectedKey:lower()
    SelectedDisableKey = SelectedDisableKey:lower()
    if k == SelectedKey then
        if AimlockState == true then
            Locked = not Locked
            if Locked then
                Victim = getClosest()

                Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))
            else
                if Victim ~= nil then
                    Victim = nil

                    Notify("Unlocked!")
                end
            end
        else
            Notify("Aimlock is not enabled!")
        end
    end
    if k == SelectedDisableKey then
        AimlockState = not AimlockState
    end
end)

--// Loop update FOV and loop camera lock onto target

RS.RenderStepped:Connect(function()
    update()
    if AimlockState == true then
        if Victim ~= nil then
            Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity*getgenv().Prediction)
        end
    end
end)
	while wait() do
        if getgenv().AutoPrediction == true then
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
            if ping < 225 then
            getgenv().Prediction = 1.4
        elseif ping < 215 then
            getgenv().Prediction = 1.2
	    elseif ping < 205 then
            getgenv().Prediction = 1.0
	    elseif ping < 190 then
            getgenv().Prediction = 0.10
        elseif ping < 180 then
            getgenv().Prediction = 0.12
	    elseif ping < 170 then
            getgenv().Prediction = 0.15
	    elseif ping < 160 then
            getgenv().Prediction = 0.18
	    elseif ping < 150 then
            getgenv().Prediction = 0.110
        elseif ping < 140 then
            getgenv().Prediction = 0.113
        elseif ping < 130 then
            getgenv().Prediction = 0.116
        elseif ping < 120 then
            getgenv().Prediction = 0.120
        elseif ping < 110 then
            getgenv().Prediction = 0.124
        elseif ping < 105 then
            getgenv().Prediction = 0.127
        elseif ping < 90 then
            getgenv().Prediction = 0.130
        elseif ping < 80 then
            getgenv().Prediction = 0.133
        elseif ping < 70 then
            getgenv().Prediction = 0.136
        elseif ping < 60 then
            getgenv().Prediction = 0.15038
        elseif ping < 50 then
            getgenv().Prediction = 0.15038
        elseif ping < 40 then
            getgenv().Prediction = 0.145
        elseif ping < 30 then
            getgenv().Prediction = 0.155
        elseif ping < 20 then
            getgenv().Prediction = 0.157
        end
        end
	end

  	end    
})

local Section = Tab:AddSection({
	Name = "OP Dot Locks"
})

Tab:AddButton({
	Name = "OP Dot Lock [E]",
	Callback = function()
      		local settings = {
    main = {
        DotEnabled = true, -- leave this true thusky pooh ;)
        Prediction = 0.11621,
        Part = "LowerTorso",
        Key = "E",
        Notifications = true,
        AirshotFunc = false
    },
    Dot = {
        Show = true,
        Color = Color3.fromRGB(128, 0, 128),
        Size = Vector3.new(0.9, 1.2, 0.9)
    }
}






local CurrentCamera = game:GetService "Workspace".CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Plr = game.Players.LocalPlayer

local Part = Instance.new("Part", game.Workspace)
Part.Anchored = true
Part.CanCollide = false
Part.Parent = game.Workspace
Part.Shape = Enum.PartType.Ball
Part.Size = settings.Dot.Size
Part.Color = settings.Dot.Color

if settings.Dot.Show == true then
    Part.Transparency = 0
else
    Part.Transparency = 1
end

Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (settings.main.Key) then
        if settings.main.DotEnabled == true then
            settings.main.DotEnabled = false
            if settings.main.Notifications == true then
                Plr = FindClosestUser()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Private Script",
                    Text = "No longer locked on"
                })
            end
        else
            Plr = FindClosestUser()
            settings.main.DotEnabled = true
            if settings.main.Notifications == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Private Script",
                    Text = "Locked on to:" .. tostring(Plr.Character.Humanoid.DisplayName)
                })
            end
        end
    end
end)

function FindClosestUser()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
            v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

RunService.Stepped:connect(function()
    if settings.main.DotEnabled and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
        Part.CFrame = CFrame.new(Plr.Character[settings.main.Part].Position +
                                     (Plr.Character.LowerTorso.Velocity * settings.main.Prediction))
    else
        Part.CFrame = CFrame.new(0, 9999, 0)

    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if settings.main.DotEnabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = Plr.Character[settings.main.Part].Position +
                      (Plr.Character[settings.main.Part].Velocity * settings.main.Prediction)
        return old(unpack(args))
    end
    return old(...)
end)


if settings.main.AirshotFunc == true then
    if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        settings.main.Part = "RightFoot"
    else
        Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
            if new == Enum.HumanoidStateType.Freefall then
                settings.main.Part = "RightFoot"
            else
                settings.main.Part = "LowerTorso"
            end
        end)
    end
end


  	end    
})

Tab:AddButton({
	Name = "Pink Dot [T]",
	Callback = function()
      		local Settings = {
    rewrittenmain = {
        Enabled = true,
        Key = "T",
        DOT = true,
        AIRSHOT = true,
        NOTIF = false,
        AUTOPRED = false,
        FOV = math.huge,
        RESOVLER = false
    }
}

local SelectedPart = "HumanoidRootPart"
local Prediction = true
local PredictionValue = 0.1413


    local AnchorCount = 0
    local MaxAnchor = 50

    local CC = game:GetService"Workspace".CurrentCamera
    local accomidationfactor = 0.11
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
    local enabled = false
    local Plr

    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = Settings.rewrittenmain.DOT
        local a = Instance.new("Frame", e)
        if Settings.rewrittenmain.DOT == true then
        a.Size = UDim2.new(1, 0, 1, 0)
        else
        a.Size = UDim2.new(0, 0, 0, 0)
        end
        if Settings.rewrittenmain.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
        else
        a.Transparency = 1
        a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if Settings.rewrittenmain.DOT == false then
        g.CornerRadius = UDim.new(0, 0)
        else
        g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end

    
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(107, 184, 255), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)


        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end

    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end

    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)

    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if Settings.rewrittenmain.DOT == true then
        placemarker.Size = Vector3.new(8, 8, 8)
        else
        placemarker.Size = Vector3.new(0, 0, 0)
        end
        placemarker.Transparency = 0.75
        if Settings.rewrittenmain.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(232, 186, 200), 0.40, 0)
        end
    end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
            if enabled == true then
                enabled = false
                if Settings.rewrittenmain.NOTIF == true then
                    Plr = getClosestPlayerToCursor()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "";
                    Text = "Unlocked :)",
                    Duration = 5
                })
            end
            else
                Plr = getClosestPlayerToCursor()
                enabled = true
                if Settings.rewrittenmain.NOTIF == true then

                    game.StarterGui:SetCore("SendNotification", {
                        Title = "";
                        Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                        Duration = 5
                    })

                end
            end
        end
    end)



    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = Settings.rewrittenmain.FOV

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end

    local pingvalue = nil;
    local split = nil;
    local ping = nil;

    game:GetService"RunService".Stepped:connect(function()
        if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
            placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
        if Settings.rewrittenmain.AUTOPRED == true then
             pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
             split = string.split(pingvalue,'(')
             ping = tonumber(split[1])
            if ping < 130 then
                PredictionValue = 0.151
            elseif ping < 125 then
                PredictionValue = 0.149
            elseif ping < 110 then
                PredictionValue = 0.146
            elseif ping < 105 then
                PredictionValue = 0.138
            elseif ping < 90 then
                PredictionValue = 0.136
            elseif ping < 80 then
                PredictionValue = 0.134
            elseif ping < 70 then
                PredictionValue = 0.131
            elseif ping < 60 then
                PredictionValue = 0.1229
            elseif ping < 50 then
                PredictionValue = 0.1225
            elseif ping < 40 then
                PredictionValue = 0.1256
            end
        end
    end)

    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then

            -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
            --[[
            if Settings.rewrittenmain.AIRSHOT == true then
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                    
                    --// Airshot
                    args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)

                else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)

                end
            else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
            end
            ]]
            if Prediction == true then
                
            args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)

            else

            args[3] = Plr.Character[SelectedPart].Position

            end

            return old(unpack(args))
        end
        return old(...)
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
        if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then
            
            if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                
                --// Airshot

                --// Anchor Check

                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end

                SelectedPart = "LeftFoot"

            else
                --// Anchor Check

                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end

                SelectedPart = "HumanoidRootPart"

            end
            else

                --// Anchor Check

                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end

                SelectedPart = "HumanoidRootPart"
            end

        else
                SelectedPart = "HumanoidRootPart"
        end
    end)
  	end    
})

Tab:AddButton({
	Name = "Black Dot Lock [F]",
	Callback = function()
      		-- 69+ 0.129145

-- 69- 0.11934
local CC = game:GetService'Workspace'.CurrentCamera
local Plr
local enabled = false
local accomidationfactor = 0.1324
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 0.4
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(30, 30)
    return(e)
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild("LowerTorso"), Color3.fromRGB(0, 76, 153), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("LowerTorso") end)
    
	local TextLabel = Instance.new("TextLabel", handler)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 14
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name
	TextLabel.ZIndex = 10
	
	spawn(function()
        while wait() do
            if player.Character then
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
            end
        end
	end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    guimain[player.Name]:Destroy()
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
    placemarker.Transparency = 10
    makemarker(placemarker, placemarker, Color3.fromRGB(0, 0, 0), 0.55, 0)
end)    

mouse.KeyDown:Connect(function(k)
    if k ~= "F" then return end
    if enabled then
        enabled = false
       -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        enabled = true 
        Plr = getClosestPlayerToCursor()
        --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end    
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer
end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
			placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
			return old(unpack(args))
		end
		return old(...)
	end)

  	end    
})

local Tab = Window:MakeTab({
	Name = "Fun Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Korblox W Headless (client)",
	Callback = function()
      		game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
end
---------------HeadLess Above-----------------------------
---------------NON FE -----------------------------
---------------Korblox Below-----------------------------
local ply = game.Players.LocalPlayer
local chr = ply.Character
chr.RightLowerLeg.MeshId = "902942093"
chr.RightLowerLeg.Transparency = "1"
chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
chr.RightFoot.MeshId = "902942089"
chr.RightFoot.Transparency = "1"
	
  	  
	end
  })
  
  Tab:AddButton({
	Name = "Autoclicker [V]",
	Callback = function()
      		local time = 0.01 --decrease if too slow increase if too fast

click = false
m = game.Players.LocalPlayer:GetMouse()
m.KeyDown:connect(function(key)
if key == "v" then
if click == true then click = false
elseif
click == false then click = true

while click == true do 
wait(time)
mouse1click()
end
end
end
end)

  	end    
})

Tab:AddButton({
	Name = "Auto Farm!",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/Zx061kiT", true))()

  	end    
})



  



Tab:AddButton({
	Name = "Insta Fat",
	Callback = function()
      		game.Players.LocalPlayer.Character.Humanoid.BodyDepthScale:Destroy()
        game.Players.LocalPlayer.Character.Humanoid.BodyWidthScale:Destroy()
  	end    
})



Tab:AddButton({
	Name = "Animations",
	Callback = function()
      		while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
game.Players.LocalPlayer.Character.Humanoid.Jump = false
    end
end 



  Tab:AddButton({
	Name = "Animation Gamepass",
	Callback = function()
      		  -- // clone
            for _, v in next, game:GetService("CoreGui"):GetChildren() do
                if (v.Name:match("FreeAnimationPack")) then
                    v:Destroy()
                end
            end
        
            -- // Instances
            local FreeAnimationPack = Instance.new("ScreenGui")
            local AnimationPack = Instance.new("TextButton")
            local Animations = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local Lean = Instance.new("TextButton")
            local Lay = Instance.new("TextButton")
            local Dance1 = Instance.new("TextButton")
            local Dance2 = Instance.new("TextButton")
            local Greet = Instance.new("TextButton")
            local ChestPump = Instance.new("TextButton")
            local Praying = Instance.new("TextButton")
            local Stop = Instance.new("TextButton")
            local UniversalAnimation = Instance.new("Animation")
        
            -- // Utility
            function stopTracks()
                for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    if (v.Animation.AnimationId:match("rbxassetid")) then
                        v:Stop()
                    end
                end
            end
        
            function loadAnimation(id)
                if UniversalAnimation.AnimationId == id then
                    stopTracks()
                    UniversalAnimation.AnimationId = "1"
                else
                    UniversalAnimation.AnimationId = id
                    local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
                    animationTrack:Play()
                end
            end
        

            FreeAnimationPack.Name = "FreeAnimationPack"
            FreeAnimationPack.Parent = game.CoreGui
            FreeAnimationPack.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
            AnimationPack.Name = "AnimationPack"
            AnimationPack.Parent = FreeAnimationPack
            AnimationPack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AnimationPack.BorderSizePixel = 0
            AnimationPack.Position = UDim2.new(0, 0, 0.388007045, 0)
            AnimationPack.Size = UDim2.new(0, 100, 0, 20)
            AnimationPack.Font = Enum.Font.SourceSansBold
            AnimationPack.Text = "Animations"
            AnimationPack.TextColor3 = Color3.fromRGB(0, 0, 0)
            AnimationPack.TextSize = 18.000
            AnimationPack.MouseButton1Click:Connect(function()
                if (Animations.Visible == false) then
                    Animations.Visible = true
                end
            end)
        
            Animations.Name = "Animations"
            Animations.Parent = AnimationPack
            Animations.Active = true
            Animations.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            Animations.Position = UDim2.new(-0.104712225, 0, -1.54173493, 0)
            Animations.Size = UDim2.new(0, 120, 0, 195)
            Animations.Visible = false
            Animations.CanvasPosition = Vector2.new(0, 60.0000305)
            Animations.CanvasSize = UDim2.new(0, 0, 1, 235)
        
            UIListLayout.Parent = Animations
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 2)
        
            Lean.Name = "Lean"
            Lean.Parent = Animations
            Lean.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Lean.Size = UDim2.new(1, 0, 0, 30)
            Lean.Font = Enum.Font.SourceSansBold
            Lean.Text = "Lean"
            Lean.TextColor3 = Color3.fromRGB(0, 0, 0)
            Lean.TextSize = 14.000
            Lean.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3152375249")
            end)
        
            Lay.Name = "Lay"
            Lay.Parent = Animations
            Lay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Lay.Size = UDim2.new(1, 0, 0, 30)
            Lay.Font = Enum.Font.SourceSansBold
            Lay.Text = "Lay"
            Lay.TextColor3 = Color3.fromRGB(0, 0, 0)
            Lay.TextSize = 14.000
            Lay.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3152378852")
            end)
        
            Dance1.Name = "Dance1"
            Dance1.Parent = Animations
            Dance1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dance1.Size = UDim2.new(1, 0, 0, 30)
            Dance1.Font = Enum.Font.SourceSansBold
            Dance1.Text = "Dance1"
            Dance1.TextColor3 = Color3.fromRGB(0, 0, 0)
            Dance1.TextSize = 14.000
            Dance1.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189773368")
            end)
        
            Dance2.Name = "Dance2"
            Dance2.Parent = Animations
            Dance2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dance2.Size = UDim2.new(1, 0, 0, 30)
            Dance2.Font = Enum.Font.SourceSansBold
            Dance2.Text = "Dance2"
            Dance2.TextColor3 = Color3.fromRGB(0, 0, 0)
            Dance2.TextSize = 14.000
            Dance2.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189776546")
            end)
        
            Greet.Name = "Greet"
            Greet.Parent = Animations
            Greet.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Greet.Size = UDim2.new(1, 0, 0, 30)
            Greet.Font = Enum.Font.SourceSansBold
            Greet.Text = "Greet"
            Greet.TextColor3 = Color3.fromRGB(0, 0, 0)
            Greet.TextSize = 14.000
            Greet.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189777795")
            end)
        
            ChestPump.Name = "ChestPump"
            ChestPump.Parent = Animations
            ChestPump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ChestPump.Size = UDim2.new(1, 0, 0, 30)
            ChestPump.Font = Enum.Font.SourceSansBold
            ChestPump.Text = "Chest Pump"
            ChestPump.TextColor3 = Color3.fromRGB(0, 0, 0)
            ChestPump.TextSize = 14.000
            ChestPump.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189779152")
            end)
        
            Praying.Name = "Praying"
            Praying.Parent = Animations
            Praying.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Praying.Size = UDim2.new(1, 0, 0, 30)
            Praying.Font = Enum.Font.SourceSansBold
            Praying.Text = "Praying"
            Praying.TextColor3 = Color3.fromRGB(0, 0, 0)
            Praying.TextSize = 14.000
            Praying.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3487719500")
            end)
        
            Stop.Name = "Stop"
            Stop.Parent = Animations
            Stop.BackgroundColor3 = Color3.fromRGB(255, 112, 112)
            Stop.Size = UDim2.new(1, 0, 0, 30)
            Stop.Font = Enum.Font.SourceSansBold
            Stop.Text = "Stop Animation"
            Stop.TextColor3 = Color3.fromRGB(0, 0, 0)
            Stop.TextSize = 14.000
            Stop.MouseButton1Click:Connect(function()
                stopTracks()
            end)
            --close gui
            local plr = game.Players.LocalPlayer
        
            plr:GetMouse().KeyDown:Connect(function(K)
                if K == "p" then
                    Animations.Visible = false
                end
            end)
        warn("loaded")
        
       

  	end    
})
	

  	    



 end
 
})

local Tab = Window:MakeTab({
	Name = "Extras",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Masked-Names",
	Callback = function()
      	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType ~= Enum.HumanoidDisplayDistanceType.Viewer then
			v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
		end
	end

  	end    
})

Tab:AddButton({
	Name = "Invisible-Mask!",
	Callback = function()
      		 local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
        wait(.2)
        fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
        toolf = game.Players.LocalPlayer.Backpack:WaitForChild("Mask")
        toolf.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("Mask")
        game:GetService("VirtualUser"):ClickButton1(Vector2.new())
        game.Players.LocalPlayer.Character:WaitForChild("In-gameMask")
        game.Players.LocalPlayer.Character["In-gameMask"].Handle:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
    end
  	end    
})

Tab:AddButton({
	Name = "Bike-Fly!",
	Callback = function()
      		local speed = 20
	local old
	local Plr = game.Players.LocalPlayer
	local wheels = {}
	local control = {q=false,e=false,w=false,a=false,s=false,d=false}
	local Mouse = Plr:GetMouse()

	Mouse.KeyDown:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=true
		end
	end)

	Mouse.KeyUp:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=false
		end
	end)

	while game.RunService.Stepped:wait() do
		local seat = (Plr.Character or Plr.CharacterAdded:wait()):WaitForChild("Humanoid").SeatPart
		if Plr.PlayerGui:FindFirstChild("MainScreenGui") and Plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and Plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
			Plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
		else
			local c = Plr.PlayerGui.MainScreenGui.Bar.HP
			local g = c:Clone()
			g.Name = "Speed"
			g.Position = UDim2.new(0.5, 0, 1, -120)
			g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
			g.Picture.Image.Image = "rbxassetid://181035717"
			g.TextLabel.Text = "Speed"
			g.Parent = c.Parent
		end
		if seat ~= nil and seat:IsDescendantOf(game.Workspace.Vehicles) then
			if seat ~= old then
				if old then
					old.Vel:Destroy()
					old.Gyro:Destroy()
				end
				old = seat
				for i = 1, 2 do
					if wheels[i] then
						wheels[i][2].Parent = wheels[i][1]
					end
					local wheel = seat.Parent.Wheel
					wheels[i] = {seat.Parent, wheel}
					wheel:remove()
				end
				local gyro = Instance.new("BodyGyro", seat)
				gyro.Name = "Gyro"
				local pos = Instance.new("BodyVelocity", seat)
				pos.Name = "Vel"
				gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				pos.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			else 
				seat.Gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				local vel = CFrame.new(0, 0, 0)
				if control.w then
					vel = vel * CFrame.new(0, 0, -speed)
				end
				if control.s then
					vel = vel * CFrame.new(0, 0, speed)
				end
				if control.a then
					vel = vel * CFrame.new(-speed, 0, 0)
				end
				if control.d then
					vel = vel * CFrame.new(speed, 0, 0)
				end
				seat.Vel.Velocity = (seat.CFrame*vel).p - seat.CFrame.p
			end
		end
		if control.e and speed<100 then
			speed = speed + 1
		end
		if control.q and speed > 0 then
			speed = speed - 1
		end
	end
  	end    
})
  	
Tab:AddButton({
	Name = "Animation Gamepass",
	Callback = function()
      		  -- // clone
            for _, v in next, game:GetService("CoreGui"):GetChildren() do
                if (v.Name:match("FreeAnimationPack")) then
                    v:Destroy()
                end
            end
        
            -- // Instances
            local FreeAnimationPack = Instance.new("ScreenGui")
            local AnimationPack = Instance.new("TextButton")
            local Animations = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local Lean = Instance.new("TextButton")
            local Lay = Instance.new("TextButton")
            local Dance1 = Instance.new("TextButton")
            local Dance2 = Instance.new("TextButton")
            local Greet = Instance.new("TextButton")
            local ChestPump = Instance.new("TextButton")
            local Praying = Instance.new("TextButton")
            local Stop = Instance.new("TextButton")
            local UniversalAnimation = Instance.new("Animation")
        
            -- // Utility
            function stopTracks()
                for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    if (v.Animation.AnimationId:match("rbxassetid")) then
                        v:Stop()
                    end
                end
            end
        
            function loadAnimation(id)
                if UniversalAnimation.AnimationId == id then
                    stopTracks()
                    UniversalAnimation.AnimationId = "1"
                else
                    UniversalAnimation.AnimationId = id
                    local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
                    animationTrack:Play()
                end
            end
        

            FreeAnimationPack.Name = "FreeAnimationPack"
            FreeAnimationPack.Parent = game.CoreGui
            FreeAnimationPack.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
            AnimationPack.Name = "AnimationPack"
            AnimationPack.Parent = FreeAnimationPack
            AnimationPack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AnimationPack.BorderSizePixel = 0
            AnimationPack.Position = UDim2.new(0, 0, 0.388007045, 0)
            AnimationPack.Size = UDim2.new(0, 100, 0, 20)
            AnimationPack.Font = Enum.Font.SourceSansBold
            AnimationPack.Text = "Animations"
            AnimationPack.TextColor3 = Color3.fromRGB(0, 0, 0)
            AnimationPack.TextSize = 18.000
            AnimationPack.MouseButton1Click:Connect(function()
                if (Animations.Visible == false) then
                    Animations.Visible = true
                end
            end)
        
            Animations.Name = "Animations"
            Animations.Parent = AnimationPack
            Animations.Active = true
            Animations.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
            Animations.Position = UDim2.new(-0.104712225, 0, -1.54173493, 0)
            Animations.Size = UDim2.new(0, 120, 0, 195)
            Animations.Visible = false
            Animations.CanvasPosition = Vector2.new(0, 60.0000305)
            Animations.CanvasSize = UDim2.new(0, 0, 1, 235)
        
            UIListLayout.Parent = Animations
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 2)
        
            Lean.Name = "Lean"
            Lean.Parent = Animations
            Lean.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Lean.Size = UDim2.new(1, 0, 0, 30)
            Lean.Font = Enum.Font.SourceSansBold
            Lean.Text = "Lean"
            Lean.TextColor3 = Color3.fromRGB(0, 0, 0)
            Lean.TextSize = 14.000
            Lean.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3152375249")
            end)
        
            Lay.Name = "Lay"
            Lay.Parent = Animations
            Lay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Lay.Size = UDim2.new(1, 0, 0, 30)
            Lay.Font = Enum.Font.SourceSansBold
            Lay.Text = "Lay"
            Lay.TextColor3 = Color3.fromRGB(0, 0, 0)
            Lay.TextSize = 14.000
            Lay.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3152378852")
            end)
        
            Dance1.Name = "Dance1"
            Dance1.Parent = Animations
            Dance1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dance1.Size = UDim2.new(1, 0, 0, 30)
            Dance1.Font = Enum.Font.SourceSansBold
            Dance1.Text = "Dance1"
            Dance1.TextColor3 = Color3.fromRGB(0, 0, 0)
            Dance1.TextSize = 14.000
            Dance1.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189773368")
            end)
        
            Dance2.Name = "Dance2"
            Dance2.Parent = Animations
            Dance2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dance2.Size = UDim2.new(1, 0, 0, 30)
            Dance2.Font = Enum.Font.SourceSansBold
            Dance2.Text = "Dance2"
            Dance2.TextColor3 = Color3.fromRGB(0, 0, 0)
            Dance2.TextSize = 14.000
            Dance2.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189776546")
            end)
        
            Greet.Name = "Greet"
            Greet.Parent = Animations
            Greet.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Greet.Size = UDim2.new(1, 0, 0, 30)
            Greet.Font = Enum.Font.SourceSansBold
            Greet.Text = "Greet"
            Greet.TextColor3 = Color3.fromRGB(0, 0, 0)
            Greet.TextSize = 14.000
            Greet.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189777795")
            end)
        
            ChestPump.Name = "ChestPump"
            ChestPump.Parent = Animations
            ChestPump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ChestPump.Size = UDim2.new(1, 0, 0, 30)
            ChestPump.Font = Enum.Font.SourceSansBold
            ChestPump.Text = "Chest Pump"
            ChestPump.TextColor3 = Color3.fromRGB(0, 0, 0)
            ChestPump.TextSize = 14.000
            ChestPump.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3189779152")
            end)
        
            Praying.Name = "Praying"
            Praying.Parent = Animations
            Praying.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Praying.Size = UDim2.new(1, 0, 0, 30)
            Praying.Font = Enum.Font.SourceSansBold
            Praying.Text = "Praying"
            Praying.TextColor3 = Color3.fromRGB(0, 0, 0)
            Praying.TextSize = 14.000
            Praying.MouseButton1Click:Connect(function()
                stopTracks()
                loadAnimation("rbxassetid://3487719500")
            end)
        
            Stop.Name = "Stop"
            Stop.Parent = Animations
            Stop.BackgroundColor3 = Color3.fromRGB(255, 112, 112)
            Stop.Size = UDim2.new(1, 0, 0, 30)
            Stop.Font = Enum.Font.SourceSansBold
            Stop.Text = "Stop Animation"
            Stop.TextColor3 = Color3.fromRGB(0, 0, 0)
            Stop.TextSize = 14.000
            Stop.MouseButton1Click:Connect(function()
                stopTracks()
            end)
            --close gui
            local plr = game.Players.LocalPlayer
        
            plr:GetMouse().KeyDown:Connect(function(K)
                if K == "p" then
                    Animations.Visible = false
                end
            end)
        warn("loaded")
        
       

  	end    
})

 Tab:AddButton({
	Name = "Anti-AFK!",
	Callback = function()
      	wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti AFK Script"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Made by Maxiware | pro"
_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox Tried to kick you but we didnt let them kick you"wait(2)ab.Text="Status : Active"end)
  	end    
})

Tab:AddButton({
	Name = "C-Frame Speed",
	Callback = function()
      		Speed = 50 -- Change

_G.Speed = true 
You = game.Players.LocalPlayer.Name
UIS = game:GetService("UserInputService")

while _G.Speed do
   if UIS:IsKeyDown(Enum.KeyCode.W) then
       game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,-Speed)
   end;
   if UIS:IsKeyDown(Enum.KeyCode.A) then
       game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(-Speed,0,0)
   end;
   if UIS:IsKeyDown(Enum.KeyCode.S) then
       game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(0,0,Speed)
   end;
   if UIS:IsKeyDown(Enum.KeyCode.D) then
       game:GetService("Workspace")[You].HumanoidRootPart.CFrame = game:GetService("Workspace")[You].HumanoidRootPart.CFrame * CFrame.new(Speed,0,0)
   end;
wait()
end
 

  	end    
})

Tab:AddButton({
	Name = "Yun Aimbot",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/3eVRY4B4"))()
getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 1.36
getgenv().AirshotFunccc = false
getgenv().Tracer = false
getgenv().Partz = "LowerTorso" -- LowerTorso, HumanoidRootPart,Head,UpperTorso
getgenv().Notificationmode = false

local guimain = Instance.new("Folder", game.CoreGui)
local CC = game:GetService "Workspace".CurrentCamera
local LocalMouse = game.Players.LocalPlayer:GetMouse()
local Locking = false
local cc = game:GetService("Workspace").CurrentCamera
local gs = game:GetService("GuiService")
local ggi = gs.GetGuiInset
local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()

local Tracer = Drawing.new("Line")
Tracer.Visible = false
Tracer.Color = Color3.fromRGB(255, 20, 88)
Tracer.Thickness = 1
Tracer.Transparency = 1

function x(tt, tx, cc)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = tt,
            Text = tx,
            Duration = cc
        }
    )
end

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(
    function(keygo, ok)
        if (not ok) then
            if (keygo.KeyCode == getgenv().Key) then
                if getgenv().loltoggle then
                    Locking = not Locking
                    if Locking then
                        Plr = getClosestPlayerToCursor()
                        if getgenv().Notificationmode then
                            x("Yun", "" .. Plr.Character.Humanoid.DisplayName, 3)
                        end
                    elseif not Locking then
                        if getgenv().Notificationmode then
                            x("Yun", "Unlocked", 3)
                        end
                    end
                end
            end
        end
    end
)
function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = 137

    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                v.Character.Humanoid.Health ~= 0 and
                v.Character:FindFirstChild("LowerTorso")
         then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

local rawmetatable = getrawmetatable(game)
local old = rawmetatable.__namecall
setreadonly(rawmetatable, false)
rawmetatable.__namecall =
    newcclosure(
    function(...)
        local args = {...}
        if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] =
                Plr.Character[getgenv().Partz].Position + (Plr.Character[getgenv().Partz].Velocity * Prediction / 10)
            return old(unpack(args))
        end
        return old(...)
    end
)

getgenv().OldAimPart = "LowerTorso"
getgenv().AimPart = "LowerTorso" -- For R15 Games: {UpperTorso, LowerTorso, HumanoidRootPart, Head} | For R6 Games: {Head, Torso, HumanoidRootPart}
getgenv().AimlockKey = "q"
getgenv().AimRadius = 30 -- How far away from someones character you want to lock on at
getgenv().ThirdPerson = true
getgenv().FirstPerson = true
getgenv().TeamCheck = false -- Check if Target is on your Team (True means it wont lock onto your teamates, false is vice versa) (Set it to false if there are no teams)
getgenv().PredictMovement = true -- Predicts if they are moving in fast velocity (like jumping) so the aimbot will go a bit faster to match their speed
getgenv().PredictionVelocity = 1.35
getgenv().CheckIfJumped = false
getgenv().Smoothness = false
getgenv().SmoothnessAmount = 0.0365
getgenv().lockautosetup = false
getgenv().airshotbonee = "RightFoot"
local Players, Uis, RService, SGui =
    game:GetService "Players",
    game:GetService "UserInputService",
    game:GetService "RunService",
    game:GetService "StarterGui"
local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 =
    Players.LocalPlayer,
    Players.LocalPlayer:GetMouse(),
    workspace.CurrentCamera,
    CFrame.new,
    Ray.new,
    Vector3.new,
    Vector2.new
local Aimlock, MousePressed, CanNotify = false, false, false
local AimlockTarget
local OldPre

getgenv().WorldToViewportPoint = function(P)
    return Camera:WorldToViewportPoint(P)
end

getgenv().WorldToScreenPoint = function(P)
    return Camera.WorldToScreenPoint(Camera, P)
end

getgenv().GetObscuringObjects = function(T)
    if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then
        local RayPos = workspace:FindPartOnRay(RNew(T[getgenv().AimPart].Position, Client.Character.Head.Position))
        if RayPos then
            return RayPos:IsDescendantOf(T)
        end
    end
end

getgenv().GetNearestTarget = function()
    -- Credits to whoever made this, i didnt make it, and my own mouse2plr function kinda sucks
    local players = {}
    local PLAYER_HOLD = {}
    local DISTANCES = {}
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then
            table.insert(players, v)
        end
    end
    for i, v in pairs(players) do
        if v.Character ~= nil then
            local AIM = v.Character:FindFirstChild("Head")
            if getgenv().TeamCheck == true and v.Team ~= Client.Team then
                local DISTANCE =
                    (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local RAY =
                    Ray.new(
                    game.Workspace.CurrentCamera.CFrame.p,
                    (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE
                )
                local HIT, POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                local DIFF = math.floor((POS - AIM.Position).magnitude)
                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF
                table.insert(DISTANCES, DIFF)
            elseif getgenv().TeamCheck == false and v.Team == Client.Team then
                local DISTANCE =
                    (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local RAY =
                    Ray.new(
                    game.Workspace.CurrentCamera.CFrame.p,
                    (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE
                )
                local HIT, POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                local DIFF = math.floor((POS - AIM.Position).magnitude)
                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF
                table.insert(DISTANCES, DIFF)
            end
        end
    end

    if unpack(DISTANCES) == nil then
        return nil
    end

    local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
    if L_DISTANCE > getgenv().AimRadius then
        return nil
    end

    for i, v in pairs(PLAYER_HOLD) do
        if v.diff == L_DISTANCE then
            return v.plr
        end
    end
    return nil
end

Mouse.KeyDown:Connect(
    function(a)
        if not (Uis:GetFocusedTextBox()) then
            if a == AimlockKey and AimlockTarget == nil then
                pcall(
                    function()
                        if MousePressed ~= true then
                            MousePressed = true
                        end
                        local Target
                        Target = GetNearestTarget()
                        if Target ~= nil then
                            AimlockTarget = Target
                        end
                    end
                )
            elseif a == AimlockKey and AimlockTarget ~= nil then
                if AimlockTarget ~= nil then
                    AimlockTarget = nil
                end
                if MousePressed ~= false then
                    MousePressed = false
                end
            end
        end
    end
)

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

_G.TracerVisible = false
_G.TracerColor = Color3.fromRGB(255, 170, 0)
_G.TracerThickness = 1
_G.TracerTransparency = 1

_G.CircleSides = 3604
_G.CircleColor = Color3.fromRGB(255, 20, 88)
_G.CircleTransparency = 0.5
_G.CircleRadius = 80
_G.CircleFilled = false
_G.CircleVisible = false
_G.CircleThickness = 0

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(255, 20, 88)
circle.Thickness = 0.1
circle.Transparency = 0.5
circle.NumSides = 64
circle.Radius = 64
circle.Visible = false
circle.Filled = true
getgenv().autoclick = false
game:GetService("RunService").RenderStepped:Connect(
    function()
        if getgenv().autosetup == true then
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local split = string.split(pingvalue, " ")
            local ping = split[1]
            if tonumber(ping) < 30 then
                getgenv().Prediction = 1.14
            elseif tonumber(ping) <= 30 then
                if tonumber(ping) < 40 then
                    getgenv().Prediction = 1.16
                elseif tonumber(ping) <= 40 then
                    if tonumber(ping) < 50 then
                        getgenv().Prediction = 1.19
                    elseif tonumber(ping) <= 50 then
                        if tonumber(ping) < 70 then
                            getgenv().Prediction = 1.22
                        elseif tonumber(ping) <= 80 then
                            getgenv().Prediction = 1.38
                        elseif tonumber(ping) <= 80 then
                            getgenv().Prediction = 1.39
                        elseif tonumber(ping) <= 90 then
                            getgenv().Prediction = 1.42
                        elseif tonumber(ping) <= 150 then
                            getgenv().Prediction = 1.51
                        elseif tonumber(ping) >= 200 then
                            notif("yun", "your ping is above to 200 so settings might not be accurate", 3)
                            getgenv().Prediction = 1.69
                        end
                    end
                end
            end
        end

        circle.Position =
            Vector2.new(
            game:GetService("UserInputService"):GetMouseLocation().X,
            game:GetService("UserInputService"):GetMouseLocation().Y
        )
        circle.Radius = _G.CircleRadius
        circle.Filled = _G.CircleFilled
        circle.Color = _G.CircleColor
        circle.Visible = _G.CircleVisible
        circle.Radius = _G.CircleRadius
        circle.Transparency = _G.CircleTransparency
        circle.NumSides = _G.CircleSides
        circle.Thickness = _G.CircleThickness
        Tracer.Visible = _G.TracerVisible
        Tracer.Color = _G.TracerColor
        Tracer.Thickness = _G.TracerThickness
        Tracer.Transparency = _G.TracerTransparency
        if getgenv().AirshotFunccc == true then
            if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().Partz = "RightFoot"
            else
                Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(
                    function(old, new)
                        if new == Enum.HumanoidStateType.Freefall then
                            getgenv().Partz = "RightFoot"
                        else
                            getgenv().Partz = "LowerTorso"
                        end
                    end
                )
            end
        end

        if getgenv().Tracer == true and Locking then
            local Vector, OnScreen =
                cc:worldToViewportPoint(
                Plr.Character[getgenv().Partz].Position + (Plr.Character[getgenv().Partz].Velocity * Prediction / 10)
            )
            Tracer.Visible = true
            Tracer.From = Vector2.new(mouse.X, mouse.Y + ggi(gs).Y)
            Tracer.To = Vector2.new(Vector.X, Vector.Y)
        elseif getgenv().Tracer == false then
            Tracer.Visible = false
        end
        local CAimPart = AimlockTarget ~= nil and
            table.unpack(
            {
                AimlockTarget.Character.Humanoid.Jumping == true and AimlockTarget.Character[getgenv().airshotbonee] or
                    AimlockTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and
                        AimlockTarget.Character[getgenv().airshotbonee] or
                    AimlockTarget.Character[getgenv().AimPart]
            }
        )
        if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
            if
                (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or
                    (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1
             then
                CanNotify = true
            else
                CanNotify = false
            end
        elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then
                CanNotify = true
            else
                CanNotify = false
            end
        elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then
                CanNotify = true
            else
                CanNotify = false
            end
        end
        if Aimlock == true and MousePressed == true then
            if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then
                if getgenv().FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().PredictMovement == true then
                            if getgenv().Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main =
                                    CF(Camera.CFrame.p, CAimPart.Position + CAimPart.Velocity * PredictionVelocity / 10)

                                --// Making it work \\--
                                Camera.CFrame =
                                    Camera.CFrame:Lerp(
                                    Main,
                                    getgenv().SmoothnessAmount,
                                    Enum.EasingStyle.Elastic,
                                    Enum.EasingDirection.InOut
                                )
                            else
                                Camera.CFrame =
                                    CF(Camera.CFrame.p, CAimPart.Position + CAimPart.Velocity * PredictionVelocity / 10)
                            end
                        elseif getgenv().PredictMovement == false then
                            if getgenv().Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, CAimPart.Position)

                                --// Making it work \\--
                                Camera.CFrame =
                                    Camera.CFrame:Lerp(
                                    Main,
                                    getgenv().SmoothnessAmount,
                                    Enum.EasingStyle.Elastic,
                                    Enum.EasingDirection.InOut
                                )
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, CAimPart.Position)
                            end
                        end
                    end
                end
            end
        end
        if CheckIfJumped == true then
            if AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().AimPart = getgenv().airshotbonee
            else
                getgenv().AimPart = getgenv().OldAimPart
            end
        end

        if getgenv().autoclick then
            mouse1click()
            mouse1release()
        end
    end
)

getgenv().cframespeedtoggle = false
getgenv().speedvalue = 0.35
getgenv().Spinbot = false
getgenv().Jitter = false
getgenv().Layspinbot = false
getgenv().AntiAim1 = false
getgenv().AntiAim2 = false
getgenv().antistomplo = false
getgenv().autoreload = false
getgenv().autostomp = false
getgenv().antibag = false
getgenv().trashtalkl = false
getgenv().antilock = false
getgenv().antilockspeed = 0.260319
--
local Jit = math.random(30, 90)
local Angle = 60
_G.Save0 = game.Players.LocalPlayer.Character.Head.face.Texture
_G.Save1 = game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId
_G.Save2 = game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId
_G.Save3 = game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId

game:GetService("RunService").Heartbeat:Connect(
    function()
        if cframespeedtoggle == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                game.Players.LocalPlayer.Character.Humanoid.MoveDirection * speedvalue
        end
        if Spinbot then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
        end
        if Jitter then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
                CFrame.Angles(0, math.rad(Angle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0)
        end

        if AntiAim1 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -250
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
        end
        if AntiAim2 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.999, 0)
            wait(0.2)
        end
        if getgenv().antistomplo then
            if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v:Destroy()
                    end
                end
            end
        end
        if getgenv().AutoReloadx then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                if
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                        "Ammo"
                    )
                 then
                    if
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                            "Ammo"
                        ).Value <= 0
                     then
                        game:GetService("ReplicatedStorage").MainEvent:FireServer(
                            "Reload",
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                        )
                    end
                end
            end
        end
        if getgenv().autostomp then
            game.ReplicatedStorage.MainEvent:FireServer("Stomp")
        end
        if getgenv().antibag then
            game.Players.LocalPlayer.Character["Christmas_Sock"]:Destroy()
        end
        if getgenv().trashtalkl then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                "yun on top👑👑",
                "All"
            )
            wait(1)
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                ".gg/yun👑👑",
                "All"
            )
            wait(1)
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                "get tapped🦜🦜",
                "All"
            )
            wait(1)
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                "so free kid🆓🆓",
                "All"
            )
            wait(1)
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                "dog water🐶🐶🌊",
                "All"
            )
            wait(1)
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                "sit down🪑🪑🪑",
                "All"
            )
        end
        if getgenv().antilock then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                -game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().antilockspeed
        end
    end
)
function initLibrary()
    local folderName = "epic config folder"

    if not isfolder(folderName) then
        makefolder(folderName)
    end

    local gameConfigFolder = folderName .. "/" .. game.PlaceId

    if not isfolder(gameConfigFolder) then
        makefolder(gameConfigFolder)
    end

    local inputService = game:GetService("UserInputService")
    local tweenService = game:GetService("TweenService")
    local runService = game:GetService("RunService")
    local coreGui = game:GetService("CoreGui")

    local utility = {}

    function utility.create(class, properties)
        properties = properties or {}

        local obj = Instance.new(class)

        local forcedProperties = {
            AutoButtonColor = false
        }

        for prop, v in next, properties do
            obj[prop] = v
        end

        for prop, v in next, forcedProperties do
            pcall(
                function()
                    obj[prop] = v
                end
            )
        end

        return obj
    end

    function utility.change_color(color, amount)
        local r = math.clamp(math.floor(color.r * 255) + amount, 0, 255)
        local g = math.clamp(math.floor(color.g * 255) + amount, 0, 255)
        local b = math.clamp(math.floor(color.b * 255) + amount, 0, 255)

        return Color3.fromRGB(r, g, b)
    end

    function utility.get_rgb(color)
        local r = math.floor(color.r * 255)
        local g = math.floor(color.g * 255)
        local b = math.floor(color.b * 255)

        return r, g, b
    end

    function utility.tween(obj, info, properties, callback)
        local anim = tweenService:Create(obj, TweenInfo.new(unpack(info)), properties)
        anim:Play()

        if callback then
            anim.Completed:Connect(callback)
        end
    end

    function utility.drag(obj, dragSpeed)
        local start, objPosition, dragging

        obj.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    start = input.Position
                    objPosition = obj.Position
                end
            end
        )

        obj.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end
        )

        inputService.InputChanged:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                    utility.tween(
                        obj,
                        {dragSpeed},
                        {
                            Position = UDim2.new(
                                objPosition.X.Scale,
                                objPosition.X.Offset + (input.Position - start).X,
                                objPosition.Y.Scale,
                                objPosition.Y.Offset + (input.Position - start).Y
                            )
                        }
                    )
                end
            end
        )
    end

    function utility.get_center(sizeX, sizeY)
        return UDim2.new(0.5, -(sizeX / 2), 0.5, -(sizeY / 2))
    end

    function utility.hex_to_rgb(hex)
        return Color3.fromRGB(
            tonumber("0x" .. hex:sub(2, 3)),
            tonumber("0x" .. hex:sub(4, 5)),
            tonumber("0x" .. hex:sub(6, 7))
        )
    end

    function utility.rgb_to_hex(color)
        return string.format(
            "#%02X%02X%02X",
            math.clamp(color.R * 255, 0, 255),
            math.clamp(color.G * 255, 0, 255),
            math.clamp(color.B * 255, 0, 255)
        )
    end

    function utility.table(tbl)
        local oldtbl = tbl or {}
        local newtbl = {}
        local formattedtbl = {}

        for option, v in next, oldtbl do
            newtbl[option:lower()] = v
        end

        setmetatable(
            formattedtbl,
            {
                __newindex = function(t, k, v)
                    rawset(newtbl, k:lower(), v)
                end,
                __index = function(t, k, v)
                    return newtbl[k:lower()]
                end
            }
        )

        return formattedtbl
    end

    local library =
        utility.table {
        flags = {},
        toggled = true,
        color = Color3.fromRGB(255, 20, 88),
        keybind = Enum.KeyCode.RightShift,
        dragSpeed = 0.1
    }

    local coloredGradients = {}

    function library:SetColor(color)
        for _, obj in next, coloredGradients do
            obj.Color =
                ColorSequence.new {
                ColorSequenceKeypoint.new(0, color),
                ColorSequenceKeypoint.new(1, utility.change_color(color, -49))
            }
        end

        library.color = color
    end

    local gui = utility.create("ScreenGui")

    inputService.InputBegan:Connect(
        function(input)
            if input.KeyCode == library.keybind then
                library.toggled = not library.toggled
                gui.Enabled = library.toggled
            end
        end
    )

    if syn and syn.protect_gui then
        syn.protect_gui(gui)
    end

    gui.Parent = coreGui

    local flags = {
        toggles = {},
        boxes = {},
        sliders = {},
        dropdowns = {},
        multidropdowns = {},
        keybinds = {},
        colorpickers = {}
    }

    function library:LoadConfig(file)
        local str = readfile(gameConfigFolder .. "/" .. file .. ".cfg")
        local tbl = loadstring(str)()

        for flag, value in next, tbl.toggles do
            flags.toggles[flag](value)
        end

        for flag, value in next, tbl.boxes do
            flags.boxes[flag](value)
        end

        for flag, value in next, tbl.sliders do
            flags.sliders[flag](value)
        end

        for flag, value in next, tbl.dropdowns do
            flags.dropdowns[flag](value)
        end

        for flag, value in next, tbl.multidropdowns do
            flags.multidropdowns[flag](value)
        end

        for flag, value in next, tbl.keybinds do
            flags.keybinds[flag](value)
        end

        for flag, value in next, tbl.colorpickers do
            flags.colorpickers[flag](value)
        end
    end

    function library:SaveConfig(name)
        local configstr = "{toggles={"
        local count = 0

        for flag, _ in next, flags.toggles do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']=" .. tostring(library.flags[flag]) .. ","
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "},boxes={"

        count = 0
        for flag, _ in next, flags.boxes do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']='" .. tostring(library.flags[flag]) .. "',"
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "},sliders={"

        count = 0
        for flag, _ in next, flags.sliders do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']=" .. tostring(library.flags[flag]) .. ","
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "},dropdowns={"

        count = 0
        for flag, _ in next, flags.dropdowns do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']='" .. tostring(library.flags[flag]) .. "',"
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "},multidropdowns={"

        count = 0
        for flag, _ in next, flags.multidropdowns do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']={'" .. table.concat(library.flags[flag], "','") .. "'},"
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "},keybinds={"

        count = 0
        for flag, _ in next, flags.keybinds do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']=" .. tostring(library.flags[flag]) .. ","
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "},colorpickers={"

        count = 0
        for flag, _ in next, flags.colorpickers do
            count = count + 1
            configstr = configstr .. "['" .. flag .. "']=Color3.new(" .. tostring(library.flags[flag]) .. "),"
        end

        configstr = (count > 0 and configstr:sub(1, -2) or configstr) .. "}}"

        writefile(gameConfigFolder .. "/" .. name .. ".cfg", "return " .. configstr)
    end

    function library:Load(opts)
        local options = utility.table(opts)
        local name = options.name or "Epic UI Library"
        local sizeX = options.sizeX or 466
        local sizeY = options.sizeY or 350
        local color = options.color or Color3.fromRGB(255, 255, 255)
        local dragSpeed = options.dragSpeed or 0

        library.color = color

        local topbar =
            utility.create(
            "Frame",
            {
                ZIndex = 2,
                Size = UDim2.new(0, sizeX, 0, 26),
                Position = utility.get_center(sizeX, sizeY),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(22, 22, 22),
                Parent = gui
            }
        )

        utility.drag(topbar, dragSpeed)

        utility.create(
            "TextLabel",
            {
                ZIndex = 3,
                Size = UDim2.new(0, 0, 1, 0),
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 8, 0, 0),
                FontSize = Enum.FontSize.Size14,
                TextSize = 14,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Text = name,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = topbar
            }
        )

        local main =
            utility.create(
            "Frame",
            {
                Size = UDim2.new(1, 0, 0, 350),
                BorderColor3 = Color3.fromRGB(20, 20, 20),
                BackgroundColor3 = Color3.fromRGB(32, 32, 32),
                Parent = topbar
            }
        )

        local tabs =
            utility.create(
            "Frame",
            {
                ZIndex = 2,
                Size = UDim2.new(1, -8, 1, -64),
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 4, 0, 58),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Parent = main
            }
        )

        local tabToggles =
            utility.create(
            "Frame",
            {
                ZIndex = 2,
                Size = UDim2.new(1, 0, 0, 26),
                BorderColor3 = Color3.fromRGB(20, 20, 20),
                Position = UDim2.new(0, 0, 0, 26),
                BackgroundColor3 = Color3.fromRGB(26, 26, 26),
                Parent = main
            }
        )

        local tabTogglesHolder =
            utility.create(
            "Frame",
            {
                Size = UDim2.new(1, -12, 1, 0),
                Position = UDim2.new(0, 6, 0, 0),
                Parent = tabToggles
            }
        )

        utility.create(
            "UIListLayout",
            {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
                Parent = tabTogglesHolder
            }
        )

        local windowTypes = utility.table({count = 0})

        function windowTypes:Show()
            gui.Enabled = true
        end

        function windowTypes:Hide()
            gui.Enabled = false
        end

        function windowTypes:Tab(name)
            windowTypes.count = windowTypes.count + 1
            name = name or "Tab"

            local toggled = windowTypes.count == 1

            local tabToggle =
                utility.create(
                "TextButton",
                {
                    ZIndex = 3,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    FontSize = Enum.FontSize.Size14,
                    TextSize = 14,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Text = name,
                    Font = toggled and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                    Parent = tabTogglesHolder
                }
            )

            tabToggle.Size = UDim2.new(0, tabToggle.TextBounds.X + 12, 1, 0)

            local tab =
                utility.create(
                "Frame",
                {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Visible = toggled,
                    Parent = tabs
                }
            )

            local column1 =
                utility.create(
                "ScrollingFrame",
                {
                    Size = UDim2.new(0.5, -2, 1, 0),
                    BackgroundTransparency = 1,
                    Active = true,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    ScrollBarImageTransparency = 1,
                    ScrollBarThickness = 0,
                    Parent = tab
                }
            )

            local column1List =
                utility.create(
                "UIListLayout",
                {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 6),
                    Parent = column1
                }
            )

            column1List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    column1.CanvasSize = UDim2.new(0, 0, 0, column1List.AbsoluteContentSize.Y)
                end
            )

            local column2 =
                utility.create(
                "ScrollingFrame",
                {
                    Size = UDim2.new(0.5, -2, 1, 0),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 2, 0, 0),
                    Active = true,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
                    ScrollBarImageTransparency = 1,
                    ScrollBarThickness = 0,
                    CanvasPosition = Vector2.new(0, 150),
                    Parent = tab
                }
            )

            local column2List =
                utility.create(
                "UIListLayout",
                {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 6),
                    Parent = column2
                }
            )

            column2List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    column2.CanvasSize = UDim2.new(0, 0, 0, column2List.AbsoluteContentSize.Y)
                end
            )

            local function openTab()
                for _, obj in next, tabTogglesHolder:GetChildren() do
                    if obj:IsA("TextButton") then
                        obj.Font = Enum.Font.Gotham
                    end
                end

                tabToggle.Font = Enum.Font.GothamSemibold

                for _, obj in next, tabs:GetChildren() do
                    obj.Visible = false
                end

                tab.Visible = true
            end

            tabToggle.MouseButton1Click:Connect(openTab)

            local tabTypes = utility.table()

            function tabTypes:Open()
                openTab()
            end

            function tabTypes:Section(opts)
                local options = utility.table(opts)
                local name = options.name or "Section"
                local column = options.column or 1

                local columnFrame = column == 1 and column1 or column == 2 and column2

                local sectionHolder =
                    utility.create(
                    "Frame",
                    {
                        Size = UDim2.new(1, 0, 0, 26),
                        BackgroundTransparency = 1,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Parent = columnFrame
                    }
                )

                local section =
                    utility.create(
                    "Frame",
                    {
                        ZIndex = 2,
                        Size = UDim2.new(1, -2, 1, -2),
                        BorderColor3 = Color3.fromRGB(22, 22, 22),
                        Position = UDim2.new(0, 1, 0, 1),
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Parent = sectionHolder
                    }
                )

                local sectionTopbar =
                    utility.create(
                    "Frame",
                    {
                        ZIndex = 3,
                        Size = UDim2.new(1, 0, 0, 24),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
                        Parent = section
                    }
                )

                utility.create(
                    "TextLabel",
                    {
                        ZIndex = 3,
                        Size = UDim2.new(0, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 8, 0, 0),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        FontSize = Enum.FontSize.Size14,
                        TextSize = 13,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Text = name,
                        Font = Enum.Font.GothamSemibold,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Parent = sectionTopbar
                    }
                )

                local sectionContent =
                    utility.create(
                    "Frame",
                    {
                        Size = UDim2.new(1, -12, 1, -36),
                        Position = UDim2.new(0, 6, 0, 30),
                        BackgroundTransparency = 1,
                        Parent = section
                    }
                )

                local sectionContentList =
                    utility.create(
                    "UIListLayout",
                    {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 6),
                        Parent = sectionContent
                    }
                )

                sectionContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                    function()
                        sectionHolder.Size = UDim2.new(1, 0, 0, sectionContentList.AbsoluteContentSize.Y + 38)
                    end
                )

                local sectionTypes = utility.table()

                function sectionTypes:Show()
                    sectionHolder.Visible = true
                end

                function sectionTypes:Hide()
                    sectionHolder.Visible = false
                end

                function sectionTypes:Label(text)
                    local label =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 0, 14),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 8, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            Text = text,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = sectionContent
                        }
                    )

                    local labelTypes = utility.table()

                    function labelTypes:Show()
                        label.Visible = true
                    end

                    function labelTypes:Hide()
                        label.Visible = false
                    end

                    function labelTypes:Set(str)
                        label.Text = str
                    end

                    return labelTypes
                end

                function sectionTypes:SpecialLabel(text)
                    local specialLabel =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 5,
                            Size = UDim2.new(1, 0, 0, 14),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 8, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            Text = text,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.Gotham,
                            Parent = sectionContent
                        }
                    )

                    utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(1, 0, 0, 1),
                            Position = UDim2.new(0, 0, 0.5, 1),
                            BorderSizePixel = 0,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = specialLabel
                        }
                    )

                    local lineBlock =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 4,
                            Size = UDim2.new(0, specialLabel.TextBounds.X + 6, 0, 1),
                            Position = UDim2.new(0.5, -((specialLabel.TextBounds.X + 6) / 2), 0.5, 1),
                            BorderSizePixel = 0,
                            BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                            Parent = specialLabel
                        }
                    )

                    specialLabel:GetPropertyChangedSignal("TextBounds"):Connect(
                        function()
                            lineBlock.Size = UDim2.new(0, specialLabel.TextBounds.X + 6, 0, 1)
                            lineBlock.Position = UDim2.new(0.5, -((specialLabel.TextBounds.X + 6) / 2), 0.5, 1)
                        end
                    )

                    local specialLabelTypes = utility.table()

                    function specialLabelTypes:Show()
                        specialLabel.Visible = true
                    end

                    function specialLabelTypes:Hide()
                        specialLabel.Visible = false
                    end

                    function specialLabelTypes:Set(str)
                        specialLabel.Text = str
                    end

                    return specialLabelTypes
                end

                function sectionTypes:Button(opts)
                    local options = utility.table(opts)
                    local name = options.name
                    local callback = options.callback

                    local button =
                        utility.create(
                        "TextButton",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(1, 0, 0, 16),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Font = Enum.Font.Gotham,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Text = "",
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = sectionContent
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            },
                            Parent = button
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 4,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 8, 0, 0),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = button
                        }
                    )

                    local buttonTypes = utility.table()

                    button.MouseButton1Click:Connect(
                        function()
                            callback(buttonTypes)
                        end
                    )

                    function buttonTypes:Show()
                        button.Visible = true
                    end

                    function buttonTypes:Hide()
                        button.Visible = false
                    end

                    function buttonTypes:SetName(str)
                        title.Text = str
                    end

                    function buttonTypes:SetCallback(func)
                        callback = func
                    end

                    return buttonTypes
                end

                function sectionTypes:Toggle(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Toggle"
                    local flag = options.flag
                    local callback = options.callback or function()
                        end

                    local toggled = false

                    if flag then
                        library.flags[flag] = toggled
                    end

                    callback(toggled)

                    local toggle =
                        utility.create(
                        "TextButton",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            BackgroundTransparency = 1,
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                            Font = Enum.Font.SourceSans,
                            Parent = sectionContent
                        }
                    )

                    local icon =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 14, 1, -2),
                            BorderColor3 = Color3.fromRGB(37, 37, 37),
                            Position = UDim2.new(0, 0, 0, 1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = toggle
                        }
                    )

                    local iconGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            },
                            Parent = icon
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, 7, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(180, 180, 180),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = icon
                        }
                    )

                    local function toggleToggle()
                        toggled = not toggled

                        if toggled then
                            table.insert(coloredGradients, iconGradient)
                        else
                            table.remove(coloredGradients, table.find(coloredGradients, iconGradient))
                        end

                        local textColor = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                        local gradientColor
                        if toggled then
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, library.color),
                                ColorSequenceKeypoint.new(1, utility.change_color(library.color, -47))
                            }
                        else
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            }
                        end

                        iconGradient.Color = gradientColor
                        title.TextColor3 = textColor

                        if flag then
                            library.flags[flag] = toggled
                        end

                        callback(toggled)
                    end

                    toggle.MouseButton1Click:Connect(toggleToggle)

                    local toggleTypes = utility.table()

                    function toggleTypes:Show()
                        toggle.Visible = true
                    end

                    function toggleTypes:Hide()
                        toggle.Visible = false
                    end

                    function toggleTypes:SetName(str)
                        title.Text = str
                    end

                    function toggleTypes:Toggle(bool)
                        if toggled ~= bool then
                            toggleToggle()
                        end
                    end

                    if flag then
                        flags.toggles[flag] = function(bool)
                            if toggled ~= bool then
                                toggleToggle()
                            end
                        end
                    end

                    return toggleTypes
                end

                function sectionTypes:Box(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Box"
                    local placeholder = options.placeholder or "Box"
                    local default = options.default or ""
                    local boxType = options.type or "string"
                    local flag = options.flag
                    local callback = options.callback or function()
                        end

                    boxType = boxType:lower()

                    if boxType == "number" then
                        default = default:gsub("%D+", "")

                        if flag then
                            library.flags[flag] = tonumber(default)
                        end

                        callback(tonumber(default))
                    else
                        if flag then
                            library.flags[flag] = default
                        end

                        callback(default)
                    end

                    local boxHolder =
                        utility.create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 0, 36),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = sectionContent
                        }
                    )

                    local box =
                        utility.create(
                        "TextBox",
                        {
                            ZIndex = 4,
                            Size = UDim2.new(1, 0, 0, 16),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 0, 1, -16),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = default,
                            Font = Enum.Font.Gotham,
                            PlaceholderText = placeholder,
                            Parent = boxHolder
                        }
                    )

                    local bg =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(1, 0, 1, 0),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 0, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = box
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = bg
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = boxHolder
                        }
                    )

                    box:GetPropertyChangedSignal("Text"):Connect(
                        function()
                            if boxType == "number" then
                                box.Text = box.Text:gsub("%D+", "")
                            end
                        end
                    )

                    local boxTypes = utility.table()

                    function boxTypes:Show()
                        boxHolder.Visible = true
                    end

                    function boxTypes:Hide()
                        boxHolder.Visible = false
                    end

                    function boxTypes:SetName(str)
                        title.Text = str
                    end

                    function boxTypes:SetPlaceholder(str)
                        box.PlaceholderText = str
                    end

                    function boxTypes:Set(str)
                        if boxType == "string" then
                            box.Text = str

                            if flag then
                                library.flags[flag] = str
                            end

                            callback(str)
                        else
                            str = str:gsub("%D+", "")
                            box.Text = str

                            if flag then
                                library.flags[flag] = str
                            end

                            callback(tonumber(str))
                        end
                    end

                    box.FocusLost:Connect(
                        function()
                            boxTypes:Set(box.Text)
                        end
                    )

                    function boxTypes:SetType(str)
                        if str:lower() == "number" or str:lower() == "string" then
                            boxType = str:lower()
                        end
                    end

                    if flag then
                        flags.boxes[flag] = function(str)
                            if boxType == "string" then
                                box.Text = str

                                if flag then
                                    library.flags[flag] = str
                                end

                                callback(str)
                            else
                                str = str:gsub("%D+", "")
                                box.Text = str

                                if flag then
                                    library.flags[flag] = str
                                end

                                callback(tonumber(str))
                            end
                        end
                    end

                    return boxTypes
                end

                function sectionTypes:Slider(opts)
                    local options = utility.table(opts)
                    local min = options.min or 0
                    local max = options.max or 100
                    local valueText = options.valueText or "Slider: [VALUE]/" .. tostring(max)
                    local default = options.default or math.clamp(0, min, max)
                    local decimals = options.decimals or 0.1
                    local flag = options.flag
                    local callback = options.callback or function()
                        end

                    decimals = math.floor(10 ^ decimals)

                    if flag then
                        library.flags[flag] = default
                    end

                    callback(default)

                    local value = default

                    local sliding = false

                    local slider =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(1, 0, 0, 16),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 0, 1, -13),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = sectionContent
                        }
                    )

                    local fill =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 4,
                            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                            BorderSizePixel = 0,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = slider
                        }
                    )

                    local fillGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, library.color),
                                ColorSequenceKeypoint.new(1, utility.change_color(library.color, -47))
                            },
                            Parent = fill
                        }
                    )

                    table.insert(coloredGradients, fillGradient)

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            },
                            Parent = slider
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 5,
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = valueText:gsub("%[VALUE%]", tostring(default)),
                            Font = Enum.Font.Gotham,
                            Parent = slider
                        }
                    )

                    local function slide(input)
                        local sizeX =
                            math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                        fill.Size = UDim2.new(sizeX, 0, 1, 0)

                        value = math.floor((((max - min) * sizeX) + min) * decimals) / decimals
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))

                        if flag then
                            library.flags[flag] = value
                        end

                        callback(value)
                    end

                    slider.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                sliding = true
                                slide(input)
                            end
                        end
                    )

                    slider.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                sliding = false
                            end
                        end
                    )

                    inputService.InputChanged:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement then
                                if sliding then
                                    slide(input)
                                end
                            end
                        end
                    )

                    local sliderTypes = utility.table()

                    function sliderTypes:Show()
                        slider.Visible = true
                    end

                    function sliderTypes:Hide()
                        slider.Visible = false
                    end

                    function sliderTypes:SetValueText(str)
                        valueText = str
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))
                    end

                    function sliderTypes:Set(num)
                        num = math.floor(math.clamp(num, min, max) * decimals) / decimals
                        value = num
                        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)

                        if flag then
                            library.flags[flag] = value
                        end

                        callback(value)
                    end

                    function sliderTypes:SetMin(num)
                        min = num
                        value = math.floor(math.clamp(value, min, max) * decimals) / decimals
                        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)

                        if flag then
                            library.flags[flag] = value
                        end

                        callback(value)
                    end

                    function sliderTypes:SetMax(num)
                        max = num
                        value = math.floor(math.clamp(value, min, max) * decimals) / decimals
                        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)

                        if flag then
                            library.flags[flag] = value
                        end

                        callback(value)
                    end

                    if flag then
                        flags.sliders[flag] = function(num)
                            sliderTypes:Set(num)
                        end
                    end

                    return sliderTypes
                end

                function sectionTypes:ToggleSlider(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Toggle Slider"
                    local min = options.min or 0
                    local max = options.max or 100
                    local valueText = options.valueText or "Toggle Slider: [VALUE]/" .. tostring(max)
                    local default = options.default or math.clamp(0, min, max)
                    local decimals = options.decimals or 0
                    local toggleFlag = options.toggleFlag
                    local sliderFlag = options.sliderFlag
                    local toggleCallback = options.toggleCallback or function()
                        end
                    local sliderCallback = options.sliderCallback or function()
                        end

                    decimals = math.floor(10 ^ decimals)

                    local value = default
                    local toggled = false
                    local sliding = false

                    if sliderFlag then
                        library.flags[sliderFlag] = default
                    end

                    sliderCallback(default)

                    if toggleFlag then
                        library.flags[toggleFlag] = toggled
                    end

                    toggleCallback(toggled)

                    local toggleSliderHolder =
                        utility.create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 0, 35),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = sectionContent
                        }
                    )

                    local slider =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(1, 0, 0, 16),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 0, 1, -16),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = toggleSliderHolder
                        }
                    )

                    local fill =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 4,
                            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                            BorderSizePixel = 0,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = slider
                        }
                    )

                    local fillGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, library.color),
                                ColorSequenceKeypoint.new(1, utility.change_color(library.color, -47))
                            },
                            Parent = fill
                        }
                    )

                    table.insert(coloredGradients, fillGradient)

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = slider
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 5,
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = valueText:gsub("%[VALUE%]", tostring(default)),
                            Font = Enum.Font.Gotham,
                            Parent = slider
                        }
                    )

                    local toggle =
                        utility.create(
                        "TextButton",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 14,
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                            Font = Enum.Font.SourceSans,
                            Parent = toggleSliderHolder
                        }
                    )

                    local icon =
                        utility.create(
                        "TextButton",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 14, 1, -2),
                            BorderColor3 = Color3.fromRGB(37, 37, 37),
                            Position = UDim2.new(0, 0, 0, 1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Text = "",
                            Parent = toggle
                        }
                    )

                    local iconGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            },
                            Parent = icon
                        }
                    )

                    local toggleTitle =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, 7, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = icon
                        }
                    )

                    local function toggleToggle()
                        toggled = not toggled

                        if toggled then
                            table.insert(coloredGradients, iconGradient)
                        else
                            table.remove(coloredGradients, table.find(coloredGradients, iconGradient))
                        end

                        local textColor = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                        local gradientColor
                        if toggled then
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, library.color),
                                ColorSequenceKeypoint.new(1, utility.change_color(library.color, -47))
                            }
                        else
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            }
                        end

                        iconGradient.Color = gradientColor
                        toggleTitle.TextColor3 = textColor

                        if toggleFlag then
                            library.flags[toggleFlag] = toggled
                        end

                        toggleCallback(toggled)
                    end

                    toggle.MouseButton1Click:Connect(toggleToggle)

                    local function slide(input)
                        local sizeX =
                            math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                        fill.Size = UDim2.new(sizeX, 0, 1, 0)

                        value = math.floor((((max - min) * sizeX) + min) * decimals) / decimals
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))

                        if sliderFlag then
                            library.flags[sliderFlag] = value
                        end

                        sliderCallback(value)
                    end

                    slider.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                sliding = true
                                slide(input)
                            end
                        end
                    )

                    slider.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                sliding = false
                            end
                        end
                    )

                    inputService.InputChanged:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement then
                                if sliding then
                                    slide(input)
                                end
                            end
                        end
                    )

                    local toggleSliderTypes = utility.table()

                    function toggleSliderTypes:Show()
                        toggleSliderHolder.Visible = true
                    end

                    function toggleSliderTypes:Hide()
                        toggleSliderHolder.Visible = false
                    end

                    function toggleSliderTypes:SetValueText(str)
                        valueText = str
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))
                    end

                    function toggleSliderTypes:Set(num)
                        num = math.floor(math.clamp(num, min, max) * decimals) / decimals
                        value = num
                        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))

                        if sliderFlag then
                            library.flags[sliderFlag] = value
                        end

                        sliderCallback(value)
                    end

                    function toggleSliderTypes:SetMin(num)
                        min = num
                        value = math.floor(math.clamp(value, min, max) * decimals) / decimals
                        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))

                        if sliderFlag then
                            library.flags[sliderFlag] = value
                        end

                        sliderCallback(value)
                    end

                    function toggleSliderTypes:SetMax(num)
                        max = num
                        value = math.floor(math.clamp(value, min, max) * decimals) / decimals
                        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                        title.Text = valueText:gsub("%[VALUE%]", tostring(value))

                        if sliderFlag then
                            library.flags[sliderFlag] = value
                        end

                        sliderCallback(value)
                    end

                    function toggleSliderTypes:Toggle(bool)
                        if toggled ~= bool then
                            toggleToggle()
                        end
                    end

                    if toggleFlag then
                        flags.toggles[toggleFlag] = function(bool)
                            if toggled ~= bool then
                                toggleToggle()
                            end
                        end
                    end

                    if sliderFlag then
                        flags.sliders[sliderFlag] = function(num)
                            toggleSliderTypes:Set(num)
                        end
                    end

                    return toggleSliderTypes
                end

                function sectionTypes:Dropdown(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Dropdown"
                    local content = options.content or {}
                    local multiChoice = options.multiChoice or false
                    local default =
                        (options.default and table.find(content, options.default)) or (multiChoice and {} or nil)
                    local flag = options.flag
                    local callback = options.callback or function()
                        end

                    if flag then
                        library.flags[flag] = default
                    end
                    callback(default)

                    local opened = false

                    local current = default
                    local chosen = {}

                    local dropdownHolder =
                        utility.create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 0, 36),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = sectionContent
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = dropdownHolder
                        }
                    )

                    local open =
                        utility.create(
                        "TextButton",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(1, 0, 0, 16),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 0, 0, 20),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Text = "",
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = dropdownHolder
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = open
                        }
                    )

                    local value =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 4,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 8, 0, 0),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = (multiChoice and
                                (#default > 0 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180))) or
                                default and Color3.fromRGB(255, 255, 255) or
                                Color3.fromRGB(180, 180, 180),
                            Text = multiChoice and (#default > 0 and table.concat(default, ", ") or "NONE") or
                                (default or "NONE"),
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = open
                        }
                    )

                    local icon =
                        utility.create(
                        "ImageLabel",
                        {
                            ZIndex = 4,
                            Size = UDim2.new(0, 14, 0, 14),
                            Rotation = 180,
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, -16, 0, 1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Image = "http://www.roblox.com/asset/?id=8747047318",
                            Parent = open
                        }
                    )

                    local contentFrame =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 10,
                            Visible = false,
                            Size = UDim2.new(1, 0, 0, 0),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 0, 1, 3),
                            BackgroundColor3 = Color3.fromRGB(33, 33, 33),
                            Parent = open
                        }
                    )

                    local contentHolder =
                        utility.create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 1, -4),
                            Position = UDim2.new(0, 0, 0, 2),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = contentFrame
                        }
                    )

                    local contentList =
                        utility.create(
                        "UIListLayout",
                        {
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Parent = contentHolder
                        }
                    )

                    contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                        function()
                            contentFrame.Size = UDim2.new(1, 0, 0, contentList.AbsoluteContentSize.Y + 4)
                        end
                    )

                    local function openDropdown()
                        opened = not opened
                        icon.Rotation = opened and 0 or 180
                        contentFrame.Visible = opened
                        dropdownHolder.Size =
                            UDim2.new(
                            1,
                            0,
                            0,
                            opened and dropdownHolder.AbsoluteSize.Y + contentFrame.AbsoluteSize.Y + 3 or 36
                        )
                    end

                    local function selectObj(obj, padding, bool)
                        for i, v in next, contentHolder:GetChildren() do
                            if v:IsA("TextButton") then
                                v:FindFirstChildOfClass("UIPadding").PaddingLeft = UDim.new(0, 6)
                                v.Font = Enum.Font.Gotham
                            end
                        end

                        obj.Font = bool and Enum.Font.GothamSemibold or Enum.Font.Gotham
                        padding.PaddingLeft = bool and UDim.new(0, 10) or UDim.new(0, 6)
                        value.TextColor3 = bool and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                    end

                    local function multiSelectObj(obj, padding, bool)
                        obj.Font = bool and Enum.Font.GothamSemibold or Enum.Font.Gotham
                        padding.PaddingLeft = bool and UDim.new(0, 10) or UDim.new(0, 6)
                    end

                    open.MouseButton1Click:Connect(openDropdown)

                    for _, opt in next, content do
                        local option =
                            utility.create(
                            "TextButton",
                            {
                                Name = opt,
                                ZIndex = 11,
                                Size = UDim2.new(1, 0, 0, 14),
                                BackgroundTransparency = 1,
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                FontSize = Enum.FontSize.Size12,
                                TextSize = 12,
                                TextColor3 = Color3.fromRGB(255, 255, 255),
                                Text = tostring(opt),
                                Font = current == opt and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Parent = contentHolder
                            }
                        )

                        local optionPadding =
                            utility.create(
                            "UIPadding",
                            {
                                PaddingLeft = current == opt and UDim.new(0, 10) or UDim.new(0, 6),
                                Parent = option
                            }
                        )

                        option.MouseButton1Click:Connect(
                            function()
                                if not multiChoice then
                                    if current ~= opt then
                                        current = opt
                                        selectObj(option, optionPadding, true)
                                        value.Text = opt

                                        if flag then
                                            library.flags[flag] = opt
                                        end

                                        callback(opt)
                                    else
                                        current = nil
                                        selectObj(option, optionPadding, false)
                                        value.Text = "NONE"

                                        if flag then
                                            library.flags[flag] = nil
                                        end

                                        callback(nil)
                                    end
                                else
                                    if not table.find(chosen, opt) then
                                        table.insert(chosen, opt)

                                        multiSelectObj(option, optionPadding, true)
                                        value.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        value.Text = table.concat(chosen, ", ")

                                        if flag then
                                            library.flags[flag] = chosen
                                        end

                                        callback(chosen)
                                    else
                                        table.remove(chosen, table.find(chosen, opt))

                                        multiSelectObj(option, optionPadding, false)
                                        value.TextColor3 =
                                            #chosen > 0 and Color3.fromRGB(255, 255, 255) or
                                            Color3.fromRGB(180, 180, 180)
                                        value.Text = #chosen > 0 and table.concat(chosen, ", ") or "NONE"

                                        if flag then
                                            library.flags[flag] = chosen
                                        end

                                        callback(chosen)
                                    end
                                end
                            end
                        )
                    end

                    local dropdownTypes = utility.table()

                    function dropdownTypes:Show()
                        dropdownHolder.Visible = true
                    end

                    function dropdownTypes:Hide()
                        dropdownHolder.Visible = false
                    end

                    function dropdownTypes:SetName(str)
                        title.Text = str
                    end

                    function dropdownTypes:Set(opt)
                        if opt then
                            if typeof(opt) == "string" then
                                if table.find(content, opt) then
                                    if not multiChoice then
                                        current = opt
                                        selectObj(
                                            contentHolder:FindFirstChild(opt),
                                            contentHolder:FindFirstChild(opt):FindFirstChildOfClass("UIPadding"),
                                            true
                                        )
                                        value.Text = opt

                                        if flag then
                                            library.flags[flag] = opt
                                        end

                                        callback(opt)
                                    else
                                        table.insert(chosen, opt)

                                        multiSelectObj(
                                            contentHolder:FindFirstChild(opt),
                                            contentHolder:FindFirstChild(opt):FindFirstChildOfClass("UIPadding"),
                                            true
                                        )
                                        value.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        value.Text = table.concat(chosen, ", ")

                                        if flag then
                                            library.flags[flag] = chosen
                                        end

                                        callback(chosen)
                                    end
                                end
                            elseif multiChoice then
                                table.clear(chosen)
                                chosen = opt

                                for i, v in next, opt do
                                    if contentHolder:FindFirstChild(v) then
                                        multiSelectObj(
                                            contentHolder:FindFirstChild(v),
                                            contentHolder:FindFirstChild(v):FindFirstChildOfClass("UIPadding"),
                                            true
                                        )

                                        value.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        value.Text = table.concat(chosen, ", ")
                                    end
                                end
                            end
                        else
                            if not multiChoice then
                                current = nil

                                for i, v in next, contentHolder:GetChildren() do
                                    if v:IsA("TextButton") then
                                        v:FindFirstChildOfClass("UIPadding").PaddingLeft = UDim.new(0, 6)
                                        v.Font = Enum.Font.Gotham
                                    end
                                end

                                value.Text = "NONE"
                                value.TextColor3 = Color3.fromRGB(180, 180, 180)

                                if flag then
                                    library.flags[flag] = nil
                                end

                                callback(nil)
                            elseif multiChoice then
                                table.clear(chosen)

                                for i, v in next, contentHolder:GetChildren() do
                                    if v:IsA("TextButton") then
                                        v:FindFirstChildOfClass("UIPadding").PaddingLeft = UDim.new(0, 6)
                                        v.Font = Enum.Font.GothamSemiBold
                                    end
                                end

                                value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                value.Text = "NONE"

                                if flag then
                                    library.flags[flag] = chosen
                                end

                                callback(chosen)
                            end
                        end
                    end

                    function dropdownTypes:Add(opt)
                        table.insert(content, opt)

                        local option =
                            utility.create(
                            "TextButton",
                            {
                                Name = opt,
                                ZIndex = 11,
                                Size = UDim2.new(1, 0, 0, 14),
                                BackgroundTransparency = 1,
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                FontSize = Enum.FontSize.Size12,
                                TextSize = 12,
                                TextColor3 = Color3.fromRGB(255, 255, 255),
                                Text = tostring(opt),
                                Font = current == opt and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Parent = contentHolder
                            }
                        )

                        local optionPadding =
                            utility.create(
                            "UIPadding",
                            {
                                PaddingLeft = current == opt and UDim.new(0, 10) or UDim.new(0, 6),
                                Parent = option
                            }
                        )

                        option.MouseButton1Click:Connect(
                            function()
                                if not multiChoice then
                                    if current ~= opt then
                                        current = opt
                                        selectObj(option, optionPadding, true)
                                        value.Text = opt

                                        if flag then
                                            library.flags[flag] = opt
                                        end

                                        callback(opt)
                                    else
                                        current = nil
                                        selectObj(option, optionPadding, false)
                                        value.Text = "NONE"

                                        if flag then
                                            library.flags[flag] = nil
                                        end

                                        callback(nil)
                                    end
                                else
                                    if not table.find(chosen, opt) then
                                        table.insert(chosen, opt)

                                        multiSelectObj(option, optionPadding, true)
                                        value.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        value.Text = table.concat(chosen, ", ")

                                        if flag then
                                            library.flags[flag] = chosen
                                        end

                                        callback(chosen)
                                    else
                                        table.remove(chosen, table.find(chosen, opt))

                                        multiSelectObj(option, optionPadding, false)
                                        value.TextColor3 =
                                            #chosen > 0 and Color3.fromRGB(255, 255, 255) or
                                            Color3.fromRGB(180, 180, 180)
                                        value.Text = #chosen > 0 and table.concat(chosen, ", ") or "NONE"

                                        if flag then
                                            library.flags[flag] = chosen
                                        end

                                        callback(chosen)
                                    end
                                end
                            end
                        )
                    end

                    function dropdownTypes:Remove(opt)
                        if table.find(content, opt) then
                            if not multiChoice then
                                if current == opt then
                                    dropdownTypes:Set(nil)
                                end

                                if contentHolder:FindFirstChild(opt) then
                                    contentHolder:FindFirstChild(opt):Destroy()
                                end
                            else
                                if table.find(chosen, opt) then
                                    table.remove(chosen, table.find(chosen, opt))
                                    value.TextColor3 =
                                        #chosen > 0 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                                    value.Text = #chosen > 0 and table.concat(chosen, ", ") or "NONE"
                                end

                                if contentHolder:FindFirstChild(opt) then
                                    contentHolder:FindFirstChild(opt):Destroy()
                                end
                            end
                        end
                    end

                    function dropdownTypes:Refresh(tbl)
                        content = tbl
                        for _, opt in next, contentHolder:GetChildren() do
                            if opt:IsA("TextButton") then
                                opt:Destroy()
                            end
                        end

                        dropdownTypes:Set(nil)

                        for _, opt in next, content do
                            local option =
                                utility.create(
                                "TextButton",
                                {
                                    Name = opt,
                                    ZIndex = 11,
                                    Size = UDim2.new(1, 0, 0, 14),
                                    BackgroundTransparency = 1,
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    FontSize = Enum.FontSize.Size12,
                                    TextSize = 12,
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Text = tostring(opt),
                                    Font = current == opt and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    Parent = contentHolder
                                }
                            )

                            local optionPadding =
                                utility.create(
                                "UIPadding",
                                {
                                    PaddingLeft = current == opt and UDim.new(0, 10) or UDim.new(0, 6),
                                    Parent = option
                                }
                            )

                            option.MouseButton1Click:Connect(
                                function()
                                    if not multiChoice then
                                        if current ~= opt then
                                            current = opt
                                            selectObj(option, optionPadding, true)
                                            value.Text = opt

                                            if flag then
                                                library.flags[flag] = opt
                                            end

                                            callback(opt)
                                        else
                                            current = nil
                                            selectObj(option, optionPadding, false)
                                            value.Text = "NONE"

                                            if flag then
                                                library.flags[flag] = nil
                                            end

                                            callback(nil)
                                        end
                                    else
                                        if not table.find(chosen, opt) then
                                            table.insert(chosen, opt)

                                            multiSelectObj(option, optionPadding, true)
                                            value.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            value.Text = table.concat(chosen, ", ")

                                            if flag then
                                                library.flags[flag] = chosen
                                            end

                                            callback(chosen)
                                        else
                                            table.remove(chosen, table.find(chosen, opt))

                                            multiSelectObj(option, optionPadding, false)
                                            value.TextColor3 =
                                                #chosen > 0 and Color3.fromRGB(255, 255, 255) or
                                                Color3.fromRGB(180, 180, 180)
                                            value.Text = #chosen > 0 and table.concat(chosen, ", ") or "NONE"

                                            if flag then
                                                library.flags[flag] = chosen
                                            end

                                            callback(chosen)
                                        end
                                    end
                                end
                            )
                        end
                    end

                    if flag then
                        if not multiChoice then
                            flags.dropdowns[flag] = function(opt)
                                dropdownTypes:Set(opt)
                            end
                        else
                            flags.multidropdowns[flag] = function(opt)
                                dropdownTypes:Set(opt)
                            end
                        end
                    end

                    return dropdownTypes
                end

                function sectionTypes:Keybind(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Keybind"
                    local default = options.default
                    local blacklist = options.blacklist or {}
                    local flag = options.flag
                    local callback = options.callback or function()
                        end

                    if flag then
                        library.flags[flag] = default
                    end

                    local keys = {
                        [Enum.KeyCode.LeftShift] = "Left Shift",
                        [Enum.KeyCode.RightShift] = "Right Shft",
                        [Enum.KeyCode.LeftControl] = "Left Ctrl",
                        [Enum.KeyCode.RightControl] = "Right Ctrl",
                        [Enum.KeyCode.LeftAlt] = "Left Alt",
                        [Enum.KeyCode.RightAlt] = "Right Alt",
                        [Enum.KeyCode.CapsLock] = "CapsLock",
                        [Enum.KeyCode.One] = "1",
                        [Enum.KeyCode.Two] = "2",
                        [Enum.KeyCode.Three] = "3",
                        [Enum.KeyCode.Four] = "4",
                        [Enum.KeyCode.Five] = "5",
                        [Enum.KeyCode.Six] = "6",
                        [Enum.KeyCode.Seven] = "7",
                        [Enum.KeyCode.Eight] = "8",
                        [Enum.KeyCode.Nine] = "9",
                        [Enum.KeyCode.Zero] = "0",
                        [Enum.KeyCode.KeypadOne] = "Num 1",
                        [Enum.KeyCode.KeypadTwo] = "Num 2",
                        [Enum.KeyCode.KeypadThree] = "Num 3",
                        [Enum.KeyCode.KeypadFour] = "Num 4",
                        [Enum.KeyCode.KeypadFive] = "Num 5",
                        [Enum.KeyCode.KeypadSix] = "Num 6",
                        [Enum.KeyCode.KeypadSeven] = "Num 7",
                        [Enum.KeyCode.KeypadEight] = "Num 8",
                        [Enum.KeyCode.KeypadNine] = "Num 9",
                        [Enum.KeyCode.KeypadZero] = "Num 0",
                        [Enum.KeyCode.Minus] = "-",
                        [Enum.KeyCode.Equals] = "=",
                        [Enum.KeyCode.Tilde] = "~",
                        [Enum.KeyCode.LeftBracket] = "[",
                        [Enum.KeyCode.RightBracket] = "]",
                        [Enum.KeyCode.RightParenthesis] = ")",
                        [Enum.KeyCode.LeftParenthesis] = "(",
                        [Enum.KeyCode.Semicolon] = ";",
                        [Enum.KeyCode.Quote] = "'",
                        [Enum.KeyCode.BackSlash] = "\\",
                        [Enum.KeyCode.Comma] = ";",
                        [Enum.KeyCode.Period] = ".",
                        [Enum.KeyCode.Slash] = "/",
                        [Enum.KeyCode.Asterisk] = "*",
                        [Enum.KeyCode.Plus] = "+",
                        [Enum.KeyCode.Period] = ".",
                        [Enum.KeyCode.Backquote] = "`",
                        [Enum.UserInputType.MouseButton1] = "Mouse 1",
                        [Enum.UserInputType.MouseButton2] = "Mouse 2",
                        [Enum.UserInputType.MouseButton3] = "Mouse 3"
                    }

                    local keyChosen = default

                    local keybind =
                        utility.create(
                        "TextButton",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 14,
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                            Font = Enum.Font.SourceSans,
                            Parent = sectionContent
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = keybind
                        }
                    )

                    local value =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, 0, 0, 0),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(180, 180, 180),
                            Text = default and (keys[default] or tostring(default):gsub("Enum.KeyCode.", "")) or "NONE",
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Right,
                            Parent = keybind
                        }
                    )

                    keybind.MouseButton1Click:Connect(
                        function()
                            value.Text = "..."
                            value.TextColor3 = Color3.fromRGB(255, 255, 255)

                            local binding
                            binding =
                                inputService.InputBegan:Connect(
                                function(input)
                                    local key = keys[input.KeyCode] or keys[input.UserInputType]
                                    value.Text = (keys[key] or tostring(input.KeyCode):gsub("Enum.KeyCode.", ""))
                                    value.TextColor3 = Color3.fromRGB(180, 180, 180)

                                    if input.UserInputType == Enum.UserInputType.Keyboard then
                                        if not table.find(blacklist, input.KeyCode) then
                                            keyChosen = input.KeyCode

                                            if flag then
                                                library.flags[flag] = input.KeyCode
                                            end

                                            binding:Disconnect()
                                        else
                                            keyChosen = nil
                                            value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            value.Text = "NONE"

                                            if flag then
                                                library.flags[flag] = nil
                                            end

                                            binding:Disconnect()
                                        end
                                    else
                                        if not table.find(blacklist, input.UserInputType) then
                                            keyChosen = input.UserInputType

                                            if flag then
                                                library.flags[flag] = input.UserInputType
                                            end

                                            binding:Disconnect()
                                        else
                                            keyChosen = nil
                                            value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            value.Text = "NONE"

                                            if flag then
                                                library.flags[flag] = nil
                                            end

                                            binding:Disconnect()
                                        end
                                    end
                                end
                            )
                        end
                    )

                    inputService.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                if input.KeyCode == keyChosen then
                                    callback(keyChosen)
                                end
                            else
                                if input.UserInputType == keyChosen then
                                    callback(keyChosen)
                                end
                            end
                        end
                    )

                    local keybindTypes = utility.table()

                    function keybindTypes:Show()
                        keybind.Visible = true
                    end

                    function keybindTypes:Hide()
                        keybind.Visible = false
                    end

                    function keybindTypes:SetName(str)
                        title.Text = str
                    end

                    function keybindTypes:Set(newKey)
                        if typeof(newKey) == "EnumItem" then
                            if not table.find(blacklist, newKey) then
                                local key = keys[newKey]
                                value.Text = (keys[key] or tostring(newKey):gsub("Enum.KeyCode.", ""))
                                value.TextColor3 = Color3.fromRGB(180, 180, 180)

                                keyChosen = newKey

                                if flag then
                                    library.flags[flag] = newKey
                                end
                            else
                                keyChosen = nil
                                value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                value.Text = "NONE"

                                if flag then
                                    library.flags[flag] = nil
                                end
                            end
                        end
                    end

                    if flag then
                        flags.keybinds[flag] = function(key)
                            keybindTypes:Set(key)
                        end
                    end

                    return keybindTypes
                end

                function sectionTypes:ToggleKeybind(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Toggle Keybind"
                    local default = options.default
                    local blacklist = options.blacklist or {}
                    local toggleFlag = options.toggleFlag
                    local keybindFlag = options.keybindFlag
                    local toggleCallback = options.toggleCallback or function()
                        end
                    local keybindCallback = options.keybindCallback or function()
                        end

                    local keys = {
                        [Enum.KeyCode.LeftShift] = "Left Shift",
                        [Enum.KeyCode.RightShift] = "Right Shft",
                        [Enum.KeyCode.LeftControl] = "Left Ctrl",
                        [Enum.KeyCode.RightControl] = "Right Ctrl",
                        [Enum.KeyCode.LeftAlt] = "Left Alt",
                        [Enum.KeyCode.RightAlt] = "Right Alt",
                        [Enum.KeyCode.CapsLock] = "CapsLock",
                        [Enum.KeyCode.One] = "1",
                        [Enum.KeyCode.Two] = "2",
                        [Enum.KeyCode.Three] = "3",
                        [Enum.KeyCode.Four] = "4",
                        [Enum.KeyCode.Five] = "5",
                        [Enum.KeyCode.Six] = "6",
                        [Enum.KeyCode.Seven] = "7",
                        [Enum.KeyCode.Eight] = "8",
                        [Enum.KeyCode.Nine] = "9",
                        [Enum.KeyCode.Zero] = "0",
                        [Enum.KeyCode.KeypadOne] = "Num 1",
                        [Enum.KeyCode.KeypadTwo] = "Num 2",
                        [Enum.KeyCode.KeypadThree] = "Num 3",
                        [Enum.KeyCode.KeypadFour] = "Num 4",
                        [Enum.KeyCode.KeypadFive] = "Num 5",
                        [Enum.KeyCode.KeypadSix] = "Num 6",
                        [Enum.KeyCode.KeypadSeven] = "Num 7",
                        [Enum.KeyCode.KeypadEight] = "Num 8",
                        [Enum.KeyCode.KeypadNine] = "Num 9",
                        [Enum.KeyCode.KeypadZero] = "Num 0",
                        [Enum.KeyCode.Minus] = "-",
                        [Enum.KeyCode.Equals] = "=",
                        [Enum.KeyCode.Tilde] = "~",
                        [Enum.KeyCode.LeftBracket] = "[",
                        [Enum.KeyCode.RightBracket] = "]",
                        [Enum.KeyCode.RightParenthesis] = ")",
                        [Enum.KeyCode.LeftParenthesis] = "(",
                        [Enum.KeyCode.Semicolon] = ";",
                        [Enum.KeyCode.Quote] = "'",
                        [Enum.KeyCode.BackSlash] = "\\",
                        [Enum.KeyCode.Comma] = ";",
                        [Enum.KeyCode.Period] = ".",
                        [Enum.KeyCode.Slash] = "/",
                        [Enum.KeyCode.Asterisk] = "*",
                        [Enum.KeyCode.Plus] = "+",
                        [Enum.KeyCode.Period] = ".",
                        [Enum.KeyCode.Backquote] = "`",
                        [Enum.UserInputType.MouseButton1] = "Mouse 1",
                        [Enum.UserInputType.MouseButton2] = "Mouse 2",
                        [Enum.UserInputType.MouseButton3] = "Mouse 3"
                    }

                    local toggled = false
                    local keyChosen = default

                    if toggleFlag then
                        library.flags[toggleFlag] = toggled
                    end

                    if keybindFlag then
                        library.flags[keybindFlag] = default
                    end

                    local toggleKeybind =
                        utility.create(
                        "TextButton",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 14,
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                            Font = Enum.Font.SourceSans,
                            Parent = sectionContent
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 21, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = toggleKeybind
                        }
                    )

                    local icon =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 14, 1, -2),
                            BorderColor3 = Color3.fromRGB(37, 37, 37),
                            Position = UDim2.new(0, 0, 0, 1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = toggleKeybind
                        }
                    )

                    local iconGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = icon
                        }
                    )

                    local value =
                        utility.create(
                        "TextButton",
                        {
                            ZIndex = 3,
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(180, 180, 180),
                            Text = default and (keys[default] or tostring(default):gsub("Enum.KeyCode.", "")) or "NONE",
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Right,
                            Parent = toggleKeybind
                        }
                    )

                    value.Size = UDim2.new(0, value.TextBounds.X, 1, 0)
                    value.Position = UDim2.new(1, -value.TextBounds.X, 0, 0)

                    local function toggleToggle()
                        toggled = not toggled

                        if toggled then
                            table.insert(coloredGradients, iconGradient)
                        else
                            table.remove(coloredGradients, table.find(coloredGradients, iconGradient))
                        end

                        local textColor = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                        local gradientColor
                        if toggled then
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, library.color),
                                ColorSequenceKeypoint.new(1, utility.change_color(library.color, -47))
                            }
                        else
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            }
                        end

                        iconGradient.Color = gradientColor
                        title.TextColor3 = textColor

                        if toggleFlag then
                            library.flags[toggleFlag] = toggled
                        end

                        toggleCallback(toggled)
                    end

                    toggleKeybind.MouseButton1Click:Connect(toggleToggle)

                    value.MouseButton1Click:Connect(
                        function()
                            value.Text = "..."
                            value.Size = UDim2.new(0, value.TextBounds.X, 1, 0)
                            value.Position = UDim2.new(1, -value.TextBounds.X, 0, 0)
                            value.TextColor3 = Color3.fromRGB(255, 255, 255)

                            local binding
                            binding =
                                inputService.InputBegan:Connect(
                                function(input)
                                    local key = keys[input.KeyCode] or keys[input.UserInputType]
                                    value.Text = (keys[key] or tostring(input.KeyCode):gsub("Enum.KeyCode.", ""))
                                    value.Size = UDim2.new(0, value.TextBounds.X, 1, 0)
                                    value.Position = UDim2.new(1, -value.TextBounds.X, 0, 0)
                                    value.TextColor3 = Color3.fromRGB(180, 180, 180)

                                    if input.UserInputType == Enum.UserInputType.Keyboard then
                                        if not table.find(blacklist, input.KeyCode) then
                                            keyChosen = input.KeyCode

                                            if keybindFlag then
                                                library.flags[keybindFlag] = input.KeyCode
                                            end

                                            binding:Disconnect()
                                        else
                                            keyChosen = nil
                                            value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            value.Text = "NONE"
                                            value.Size = UDim2.new(0, value.TextBounds.X, 1, 0)
                                            value.Position = UDim2.new(1, -value.TextBounds.X, 0, 0)

                                            if keybindFlag then
                                                library.flags[keybindFlag] = nil
                                            end

                                            binding:Disconnect()
                                        end
                                    else
                                        if not table.find(blacklist, input.UserInputType) then
                                            keyChosen = input.UserInputType

                                            if keybindFlag then
                                                library.flags[keybindFlag] = input.UserInputType
                                            end

                                            binding:Disconnect()
                                        else
                                            keyChosen = nil
                                            value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                            value.Text = "NONE"
                                            value.Size = UDim2.new(0, value.TextBounds.X, 1, 0)
                                            value.Position = UDim2.new(1, -value.TextBounds.X, 0, 0)

                                            if keybindFlag then
                                                library.flags[keybindFlag] = nil
                                            end

                                            binding:Disconnect()
                                        end
                                    end
                                end
                            )
                        end
                    )

                    inputService.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                if input.KeyCode == keyChosen then
                                    toggleToggle()
                                    keybindCallback(keyChosen)
                                end
                            else
                                if input.UserInputType == keyChosen then
                                    toggleToggle()
                                    keybindCallback(keyChosen)
                                end
                            end
                        end
                    )

                    local toggleKeybindTypes = utility.table()

                    function toggleKeybindTypes:Show()
                        keybind.Visible = true
                    end

                    function toggleKeybindTypes:Hide()
                        keybind.Visible = false
                    end

                    function toggleKeybindTypes:SetName(str)
                        title.Text = str
                    end

                    function toggleKeybindTypes:Toggle(bool)
                        if toggled ~= bool then
                            toggleToggle()
                        end
                    end

                    function toggleKeybindTypes:Set(newKey)
                        if typeof(newKey) == "EnumItem" then
                            if not table.find(blacklist, newKey) then
                                local key = keys[newKey]
                                value.Text = (keys[key] or tostring(newKey):gsub("Enum.KeyCode.", ""))
                                value.Size = UDim2.new(0, value.TextBounds.X, 1, 0)
                                value.Position = UDim2.new(1, -value.TextBounds.X, 0, 0)
                                value.TextColor3 = Color3.fromRGB(180, 180, 180)

                                keyChosen = newKey

                                if keybindFlag then
                                    library.flags[keybindFlag] = newKey
                                end
                            else
                                keyChosen = nil
                                value.TextColor3 = Color3.fromRGB(180, 180, 180)
                                value.Text = "NONE"

                                if keybindFlag then
                                    library.flags[keybindFlag] = nil
                                end
                            end
                        end
                    end

                    if keybindFlag then
                        flags.keybinds[keybindFlag] = function(key)
                            toggleKeybindTypes:Set(key)
                        end
                    end

                    if toggleFlag then
                        flags.toggles[toggleFlag] = function(bool)
                            toggleKeybindTypes:Toggle(bool)
                        end
                    end

                    return toggleKeybindTypes
                end

                function sectionTypes:ColorPicker(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Color Picker"
                    local default = options.default or Color3.fromRGB(255, 255, 255)
                    local flag = options.flag
                    local callback = options.callback or function()
                        end

                    local open = false
                    local hue, sat, val = default:ToHSV()

                    local slidingHue = false
                    local slidingSaturation = false

                    local hsv = Color3.fromHSV(hue, sat, val)

                    if flag then
                        library.flags[flag] = default
                    end

                    callback(default)

                    local colorPickerHolder =
                        utility.create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            Position = UDim2.new(0, 0, 0, 0),
                            BackgroundTransparency = 1,
                            Parent = sectionContent
                        }
                    )

                    local colorPicker =
                        utility.create(
                        "TextButton",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 14,
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                            Font = Enum.Font.SourceSans,
                            Parent = colorPickerHolder
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = colorPicker
                        }
                    )

                    local icon =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 22, 0, 14),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(1, -22, 0, 1),
                            BackgroundColor3 = default,
                            Parent = colorPicker
                        }
                    )

                    local iconGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 105, 105))
                            },
                            Parent = icon
                        }
                    )

                    local picker =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 12,
                            Visible = false,
                            Size = UDim2.new(1, -8, 0, 183),
                            ClipsDescendants = true,
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 12, 1, 3),
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                            Parent = colorPicker
                        }
                    )

                    local saturationFrame =
                        utility.create(
                        "ImageLabel",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(1, -29, 0, 130),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 5, 0, 5),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 4),
                            Image = "http://www.roblox.com/asset/?id=8630797271",
                            Parent = picker
                        }
                    )

                    local saturationPicker =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 15,
                            Size = UDim2.new(0, 4, 0, 4),
                            Position = UDim2.new(0, 5, 0, 5),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            BorderSizePixel = 1,
                            Parent = saturationFrame
                        }
                    )

                    local hueFrame =
                        utility.create(
                        "ImageLabel",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(0, 14, 0, 130),
                            ClipsDescendants = true,
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, -19, 0, 5),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 4),
                            ScaleType = Enum.ScaleType.Crop,
                            Image = "http://www.roblox.com/asset/?id=8630799159",
                            Parent = picker
                        }
                    )

                    local huePicker =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 15,
                            Size = UDim2.new(1, 0, 0, 2),
                            Position = UDim2.new(0, 0, 0, 10),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            BorderSizePixel = 1,
                            Parent = hueFrame
                        }
                    )

                    local rgb =
                        utility.create(
                        "TextBox",
                        {
                            ZIndex = 14,
                            Size = UDim2.new(1, -10, 0, 16),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 5, 1, -42),
                            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                            PlaceholderColor3 = Color3.fromRGB(180, 180, 180),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = table.concat({utility.get_rgb(default)}, ", "),
                            ClearTextOnFocus = false,
                            Font = Enum.Font.Gotham,
                            PlaceholderText = "R,  G,  B",
                            Parent = picker
                        }
                    )

                    local bg =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(1, 0, 1, 0),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = rgb
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = bg
                        }
                    )

                    local hex =
                        utility.create(
                        "TextBox",
                        {
                            ZIndex = 14,
                            Size = UDim2.new(1, -10, 0, 16),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 5, 1, -21),
                            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                            PlaceholderColor3 = Color3.fromRGB(180, 180, 180),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = utility.rgb_to_hex(default),
                            ClearTextOnFocus = false,
                            Font = Enum.Font.Gotham,
                            PlaceholderText = utility.rgb_to_hex(default),
                            Parent = picker
                        }
                    )

                    local bg =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(1, 0, 1, 0),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = hex
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = bg
                        }
                    )

                    local function openPicker()
                        open = not open
                        picker.Visible = open
                        colorPickerHolder.Size =
                            UDim2.new(1, 0, 0, open and colorPicker.AbsoluteSize.Y + picker.AbsoluteSize.Y + 3 or 16)
                    end

                    colorPicker.MouseButton1Click:connect(openPicker)

                    local function updateHue(input)
                        local sizeY =
                            1 -
                            math.clamp((input.Position.Y - hueFrame.AbsolutePosition.Y) / hueFrame.AbsoluteSize.Y, 0, 1)
                        local posY =
                            math.clamp(
                            ((input.Position.Y - hueFrame.AbsolutePosition.Y) / hueFrame.AbsoluteSize.Y) *
                                hueFrame.AbsoluteSize.Y,
                            0,
                            hueFrame.AbsoluteSize.Y - 2
                        )
                        huePicker.Position = UDim2.new(0, 0, 0, posY)

                        hue = sizeY

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        hsv = Color3.fromHSV(hue, sat, val)
                        saturationFrame.BackgroundColor3 = hsv
                        icon.BackgroundColor3 = hsv

                        if flag then
                            library.flags[flag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        callback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    hueFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingHue = true
                                updateHue(input)
                            end
                        end
                    )

                    hueFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingHue = false
                            end
                        end
                    )

                    inputService.InputChanged:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement then
                                if slidingHue then
                                    updateHue(input)
                                end
                            end
                        end
                    )

                    local function updateSatVal(input)
                        local sizeX =
                            math.clamp(
                            (input.Position.X - saturationFrame.AbsolutePosition.X) / saturationFrame.AbsoluteSize.X,
                            0,
                            1
                        )
                        local sizeY =
                            1 -
                            math.clamp(
                                (input.Position.Y - saturationFrame.AbsolutePosition.Y) / saturationFrame.AbsoluteSize.Y,
                                0,
                                1
                            )
                        local posY =
                            math.clamp(
                            ((input.Position.Y - saturationFrame.AbsolutePosition.Y) / saturationFrame.AbsoluteSize.Y) *
                                saturationFrame.AbsoluteSize.Y,
                            0,
                            saturationFrame.AbsoluteSize.Y - 4
                        )
                        local posX =
                            math.clamp(
                            ((input.Position.X - saturationFrame.AbsolutePosition.X) / saturationFrame.AbsoluteSize.X) *
                                saturationFrame.AbsoluteSize.X,
                            0,
                            saturationFrame.AbsoluteSize.X - 4
                        )

                        saturationPicker.Position = UDim2.new(0, posX, 0, posY)

                        sat = sizeX
                        val = sizeY

                        hsv = Color3.fromHSV(hue, sat, val)

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        saturationFrame.BackgroundColor3 = hsv
                        icon.BackgroundColor3 = hsv

                        if flag then
                            library.flags[flag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        callback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    saturationFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingSaturation = true
                                updateSatVal(input)
                            end
                        end
                    )

                    saturationFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingSaturation = false
                            end
                        end
                    )

                    inputService.InputChanged:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement then
                                if slidingSaturation then
                                    updateSatVal(input)
                                end
                            end
                        end
                    )

                    local colorPickerTypes = utility.table()

                    function colorPickerTypes:Show()
                        colorPickerHolder.Visible = true
                    end

                    function colorPickerTypes:Hide()
                        colorPickerHolder.Visible = false
                    end

                    function colorPickerTypes:SetName(str)
                        title.Text = str
                    end

                    function colorPickerTypes:SetRGB(color)
                        hue, sat, val = color:ToHSV()
                        hsv = Color3.fromHSV(hue, sat, val)

                        saturationFrame.BackgroundColor3 = hsv
                        icon.BackgroundColor3 = hsv
                        saturationPicker.Position =
                            UDim2.new(
                            0,
                            (math.clamp(sat * saturationFrame.AbsoluteSize.X, 0, saturationFrame.AbsoluteSize.X - 4)),
                            0,
                            (math.clamp(
                                (1 - val) * saturationFrame.AbsoluteSize.Y,
                                0,
                                saturationFrame.AbsoluteSize.Y - 4
                            ))
                        )
                        huePicker.Position =
                            UDim2.new(
                            0,
                            0,
                            0,
                            math.clamp((1 - hue) * hueFrame.AbsoluteSize.Y, 0, hueFrame.AbsoluteSize.Y - 4)
                        )

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        if flag then
                            library.flags[flag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        callback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    function colorPickerTypes:SetHex(hexValue)
                        color = utility.hex_to_rgb(hexValue)

                        hue, sat, val = color:ToHSV()
                        hsv = Color3.fromHSV(hue, sat, val)

                        saturationFrame.BackgroundColor3 = hsv
                        icon.BackgroundColor3 = hsv
                        saturationPicker.Position =
                            UDim2.new(
                            0,
                            (math.clamp(sat * saturationFrame.AbsoluteSize.X, 0, saturationFrame.AbsoluteSize.X - 4)),
                            0,
                            (math.clamp(
                                (1 - val) * saturationFrame.AbsoluteSize.Y,
                                0,
                                saturationFrame.AbsoluteSize.Y - 4
                            ))
                        )
                        huePicker.Position =
                            UDim2.new(
                            0,
                            0,
                            0,
                            math.clamp((1 - hue) * hueFrame.AbsoluteSize.Y, 0, hueFrame.AbsoluteSize.Y - 4)
                        )

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        if flag then
                            library.flags[flag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        callback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    rgb.FocusLost:Connect(
                        function()
                            local _, amount = rgb.Text:gsub(", ", "")
                            if amount == 2 then
                                local values = rgb.Text:split(", ")
                                local r, g, b =
                                    math.clamp(values[1], 0, 255),
                                    math.clamp(values[2], 0, 255),
                                    math.clamp(values[3], 0, 255)
                                colorPickerTypes:SetRGB(Color3.fromRGB(r, g, b))
                            else
                                rgb.Text =
                                    math.floor((hsv.r * 255) + 0.5) ..
                                    ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                            end
                        end
                    )

                    hex.FocusLost:Connect(
                        function()
                            if hex.Text:find("#") and hex.Text:len() == 7 then
                                colorPickerTypes:SetHex(hex.Text)
                            else
                                hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                            end
                        end
                    )

                    hex:GetPropertyChangedSignal("Text"):Connect(
                        function()
                            if hex.Text == "" then
                                hex.Text = "#"
                            end
                        end
                    )

                    if flag then
                        flags.colorpickers[flag] = function(color)
                            colorPickerTypes:SetRGB(color)
                        end
                    end

                    return colorPickerTypes
                end

                function sectionTypes:ToggleColorPicker(opts)
                    local options = utility.table(opts)
                    local name = options.name or "Toggle Color Picker"
                    local default = options.default or Color3.fromRGB(255, 255, 255)
                    local toggleFlag = options.toggleFlag
                    local colorPickerFlag = options.colorPickerFlag
                    local toggleCallback = options.toggleCallback or function()
                        end
                    local colorPickerCallback = options.colorPickerCallback or function()
                        end

                    local open = false
                    local toggled = false
                    local hue, sat, val = default:ToHSV()

                    local slidingHue = false
                    local slidingSaturation = false

                    local hsv = Color3.fromHSV(hue, sat, val)

                    if colorPickerFlag then
                        library.flags[colorPickerFlag] = default
                    end

                    colorPickerCallback(default)

                    if toggleFlag then
                        library.flags[toggleFlag] = toggled
                    end

                    toggleCallback(false)

                    local toggleColorPickerHolder =
                        utility.create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            Position = UDim2.new(0, 0, 0, 0),
                            BackgroundTransparency = 1,
                            Parent = sectionContent
                        }
                    )

                    local colorPicker =
                        utility.create(
                        "TextButton",
                        {
                            Size = UDim2.new(1, 0, 0, 16),
                            BackgroundTransparency = 1,
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 14,
                            TextColor3 = Color3.fromRGB(0, 0, 0),
                            Font = Enum.Font.SourceSans,
                            Parent = toggleColorPickerHolder
                        }
                    )

                    local icon =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 14, 1, -2),
                            BorderColor3 = Color3.fromRGB(37, 37, 37),
                            Position = UDim2.new(0, 0, 0, 1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = colorPicker
                        }
                    )

                    local iconGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = icon
                        }
                    )

                    local colorPickerIcon =
                        utility.create(
                        "TextButton",
                        {
                            ZIndex = 3,
                            Text = "",
                            Size = UDim2.new(0, 22, 0, 14),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(1, -22, 0, 1),
                            BackgroundColor3 = default,
                            Parent = colorPicker
                        }
                    )

                    local colorPickerIconGradient =
                        utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 105, 105))
                            },
                            Parent = colorPickerIcon
                        }
                    )

                    local title =
                        utility.create(
                        "TextLabel",
                        {
                            ZIndex = 3,
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, 7, 0, 0),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            FontSize = Enum.FontSize.Size14,
                            TextSize = 13,
                            TextColor3 = Color3.fromRGB(180, 180, 180),
                            Text = name,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Parent = icon
                        }
                    )

                    local picker =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 12,
                            Visible = false,
                            Size = UDim2.new(1, -8, 0, 183),
                            ClipsDescendants = true,
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 12, 1, 3),
                            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
                            Parent = colorPicker
                        }
                    )

                    local saturationFrame =
                        utility.create(
                        "ImageLabel",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(1, -29, 0, 130),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            Position = UDim2.new(0, 5, 0, 5),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 4),
                            Image = "http://www.roblox.com/asset/?id=8630797271",
                            Parent = picker
                        }
                    )

                    local saturationPicker =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 15,
                            Size = UDim2.new(0, 4, 0, 4),
                            Position = UDim2.new(0, 5, 0, 5),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            BorderSizePixel = 1,
                            Parent = saturationFrame
                        }
                    )

                    local hueFrame =
                        utility.create(
                        "ImageLabel",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(0, 14, 0, 130),
                            ClipsDescendants = true,
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(1, -19, 0, 5),
                            BackgroundColor3 = Color3.fromRGB(255, 0, 4),
                            ScaleType = Enum.ScaleType.Crop,
                            Image = "http://www.roblox.com/asset/?id=8630799159",
                            Parent = picker
                        }
                    )

                    local huePicker =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 15,
                            Size = UDim2.new(1, 0, 0, 2),
                            Position = UDim2.new(0, 0, 0, 10),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                            BorderSizePixel = 1,
                            Parent = hueFrame
                        }
                    )

                    local rgb =
                        utility.create(
                        "TextBox",
                        {
                            ZIndex = 14,
                            Size = UDim2.new(1, -10, 0, 16),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 5, 1, -42),
                            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                            PlaceholderColor3 = Color3.fromRGB(180, 180, 180),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = table.concat({utility.get_rgb(default)}, ", "),
                            ClearTextOnFocus = false,
                            Font = Enum.Font.Gotham,
                            PlaceholderText = "R,  G,  B",
                            Parent = picker
                        }
                    )

                    local bg =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(1, 0, 1, 0),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = rgb
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = bg
                        }
                    )

                    local hex =
                        utility.create(
                        "TextBox",
                        {
                            ZIndex = 14,
                            Size = UDim2.new(1, -10, 0, 16),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 5, 1, -21),
                            BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                            PlaceholderColor3 = Color3.fromRGB(180, 180, 180),
                            FontSize = Enum.FontSize.Size12,
                            TextSize = 12,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Text = utility.rgb_to_hex(default),
                            ClearTextOnFocus = false,
                            Font = Enum.Font.Gotham,
                            PlaceholderText = utility.rgb_to_hex(default),
                            Parent = picker
                        }
                    )

                    local bg =
                        utility.create(
                        "Frame",
                        {
                            ZIndex = 13,
                            Size = UDim2.new(1, 0, 1, 0),
                            BorderColor3 = Color3.fromRGB(22, 22, 22),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Parent = hex
                        }
                    )

                    utility.create(
                        "UIGradient",
                        {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(32, 32, 32), Color3.fromRGB(17, 17, 17)),
                            Parent = bg
                        }
                    )

                    local function toggleToggle()
                        toggled = not toggled

                        if toggled then
                            table.insert(coloredGradients, iconGradient)
                        else
                            table.remove(coloredGradients, table.find(coloredGradients, iconGradient))
                        end

                        local textColor = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                        local gradientColor
                        if toggled then
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, library.color),
                                ColorSequenceKeypoint.new(1, utility.change_color(library.color, -47))
                            }
                        else
                            gradientColor =
                                ColorSequence.new {
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 32)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 17, 17))
                            }
                        end

                        iconGradient.Color = gradientColor
                        title.TextColor3 = textColor

                        if toggleFlag then
                            library.flags[toggleFlag] = toggled
                        end

                        toggleCallback(toggled)
                    end

                    colorPicker.MouseButton1Click:Connect(toggleToggle)

                    local function openPicker()
                        open = not open
                        picker.Visible = open
                        toggleColorPickerHolder.Size =
                            UDim2.new(1, 0, 0, open and colorPicker.AbsoluteSize.Y + picker.AbsoluteSize.Y + 3 or 16)
                    end

                    colorPickerIcon.MouseButton1Click:connect(openPicker)

                    local function updateHue(input)
                        local sizeY =
                            1 -
                            math.clamp((input.Position.Y - hueFrame.AbsolutePosition.Y) / hueFrame.AbsoluteSize.Y, 0, 1)
                        local posY =
                            math.clamp(
                            ((input.Position.Y - hueFrame.AbsolutePosition.Y) / hueFrame.AbsoluteSize.Y) *
                                hueFrame.AbsoluteSize.Y,
                            0,
                            hueFrame.AbsoluteSize.Y - 2
                        )
                        huePicker.Position = UDim2.new(0, 0, 0, posY)

                        hue = sizeY

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        hsv = Color3.fromHSV(hue, sat, val)
                        saturationFrame.BackgroundColor3 = hsv
                        colorPickerIcon.BackgroundColor3 = hsv

                        if colorPickerFlag then
                            library.flags[colorPickerFlag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        colorPickerCallback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    hueFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingHue = true
                                updateHue(input)
                            end
                        end
                    )

                    hueFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingHue = false
                            end
                        end
                    )

                    inputService.InputChanged:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement then
                                if slidingHue then
                                    updateHue(input)
                                end
                            end
                        end
                    )

                    local function updateSatVal(input)
                        local sizeX =
                            math.clamp(
                            (input.Position.X - saturationFrame.AbsolutePosition.X) / saturationFrame.AbsoluteSize.X,
                            0,
                            1
                        )
                        local sizeY =
                            1 -
                            math.clamp(
                                (input.Position.Y - saturationFrame.AbsolutePosition.Y) / saturationFrame.AbsoluteSize.Y,
                                0,
                                1
                            )
                        local posY =
                            math.clamp(
                            ((input.Position.Y - saturationFrame.AbsolutePosition.Y) / saturationFrame.AbsoluteSize.Y) *
                                saturationFrame.AbsoluteSize.Y,
                            0,
                            saturationFrame.AbsoluteSize.Y - 4
                        )
                        local posX =
                            math.clamp(
                            ((input.Position.X - saturationFrame.AbsolutePosition.X) / saturationFrame.AbsoluteSize.X) *
                                saturationFrame.AbsoluteSize.X,
                            0,
                            saturationFrame.AbsoluteSize.X - 4
                        )

                        saturationPicker.Position = UDim2.new(0, posX, 0, posY)

                        sat = sizeX
                        val = sizeY

                        hsv = Color3.fromHSV(hue, sat, val)

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        saturationFrame.BackgroundColor3 = hsv
                        colorPickerIcon.BackgroundColor3 = hsv

                        if colorPickerFlag then
                            library.flags[colorPickerFlag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        colorPickerCallback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    saturationFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingSaturation = true
                                updateSatVal(input)
                            end
                        end
                    )

                    saturationFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                slidingSaturation = false
                            end
                        end
                    )

                    inputService.InputChanged:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseMovement then
                                if slidingSaturation then
                                    updateSatVal(input)
                                end
                            end
                        end
                    )

                    local toggleColorPickerTypes = utility.table()

                    function toggleColorPickerTypes:Show()
                        toggleColorPickerHolder.Visible = true
                    end

                    function toggleColorPickerTypes:Hide()
                        toggleColorPickerHolder.Visible = false
                    end

                    function toggleColorPickerTypes:SetName(str)
                        title.Text = str
                    end

                    function toggleColorPickerTypes:Toggle(bool)
                        if toggled ~= bool then
                            toggleToggle()
                        end
                    end

                    function toggleColorPickerTypes:SetRGB(color)
                        hue, sat, val = color:ToHSV()
                        hsv = Color3.fromHSV(hue, sat, val)

                        saturationFrame.BackgroundColor3 = hsv
                        colorPickerIcon.BackgroundColor3 = hsv
                        saturationPicker.Position =
                            UDim2.new(
                            0,
                            (math.clamp(sat * saturationFrame.AbsoluteSize.X, 0, saturationFrame.AbsoluteSize.X - 4)),
                            0,
                            (math.clamp(
                                (1 - val) * saturationFrame.AbsoluteSize.Y,
                                0,
                                saturationFrame.AbsoluteSize.Y - 4
                            ))
                        )
                        huePicker.Position =
                            UDim2.new(
                            0,
                            0,
                            0,
                            math.clamp((1 - hue) * hueFrame.AbsoluteSize.Y, 0, hueFrame.AbsoluteSize.Y - 4)
                        )

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        if colorPickerFlag then
                            library.flags[colorPickerFlag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        colorPickerCallback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    function toggleColorPickerTypes:SetHex(hexValue)
                        color = utility.hex_to_rgb(hexValue)

                        hue, sat, val = color:ToHSV()
                        hsv = Color3.fromHSV(hue, sat, val)

                        saturationFrame.BackgroundColor3 = hsv
                        colorPickerIcon.BackgroundColor3 = hsv
                        saturationPicker.Position =
                            UDim2.new(
                            0,
                            (math.clamp(sat * saturationFrame.AbsoluteSize.X, 0, saturationFrame.AbsoluteSize.X - 4)),
                            0,
                            (math.clamp(
                                (1 - val) * saturationFrame.AbsoluteSize.Y,
                                0,
                                saturationFrame.AbsoluteSize.Y - 4
                            ))
                        )
                        huePicker.Position =
                            UDim2.new(
                            0,
                            0,
                            0,
                            math.clamp((1 - hue) * hueFrame.AbsoluteSize.Y, 0, hueFrame.AbsoluteSize.Y - 4)
                        )

                        rgb.Text =
                            math.floor((hsv.r * 255) + 0.5) ..
                            ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                        hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))

                        if colorPickerFlag then
                            library.flags[colorPickerFlag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
                        end

                        colorPickerCallback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                    end

                    rgb.FocusLost:Connect(
                        function()
                            local _, amount = rgb.Text:gsub(", ", "")
                            if amount == 2 then
                                local values = rgb.Text:split(", ")
                                local r, g, b =
                                    math.clamp(values[1], 0, 255),
                                    math.clamp(values[2], 0, 255),
                                    math.clamp(values[3], 0, 255)
                                toggleColorPickerTypes:SetRGB(Color3.fromRGB(r, g, b))
                            else
                                rgb.Text =
                                    math.floor((hsv.r * 255) + 0.5) ..
                                    ", " .. math.floor((hsv.g * 255) + 0.5) .. ", " .. math.floor((hsv.b * 255) + 0.5)
                            end
                        end
                    )

                    hex.FocusLost:Connect(
                        function()
                            if hex.Text:find("#") and hex.Text:len() == 7 then
                                toggleColorPickerTypes:SetHex(hex.Text)
                            else
                                hex.Text = utility.rgb_to_hex(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
                            end
                        end
                    )

                    hex:GetPropertyChangedSignal("Text"):Connect(
                        function()
                            if hex.Text == "" then
                                hex.Text = "#"
                            end
                        end
                    )

                    if colorPickerFlag then
                        flags.colorpickers[colorPickerFlag] = function(color)
                            toggleColorPickerTypes:SetRGB(color)
                        end
                    end

                    if toggleFlag then
                        flags.toggles[toggleFlag] = function(bool)
                            toggleColorPickerTypes:Toggle(bool)
                        end
                    end

                    return toggleColorPickerTypes
                end

                return sectionTypes
            end

            return tabTypes
        end

        return windowTypes
    end

    return library
end
local library = initLibrary()
local lib = library:Load({name = "Yun.gay", sizeX = 378, sizeY = 498, color = Color3.fromRGB(255, 20, 88)})
local MainTab = lib:Tab("Main")
local LegitTab = lib:Tab("Legit")
local MiscTab = lib:Tab("Misc")
local VisualsTab = lib:Tab("Visuals")
local tab = lib:Tab("Configs")

local MainSec1 = MainTab:Section {name = "Ragebot", column = 1}
local MainSec2 = MainTab:Section {name = "FOV", column = 2}
local MainSec3 = MainTab:Section {name = "Tracer", column = 2}
local LegitSec1 = LegitTab:Section {name = "Aimbot", column = 1}
local MiscSec1 = MiscTab:Section {name = "Anti Aim", column = 1}
local MiscSec2 = MiscTab:Section {name = "Character", column = 2}
local MiscSec3 = MiscTab:Section {name = "Shopping", column = 1}
local MiscSec4 = MiscTab:Section {name = "Animating", column = 2}
local VisualsSec = VisualsTab:Section {name = "Esp", column = 1}
local VisualsSec2 = VisualsTab:Section {name = "Chams", column = 1}
local VisualsSec3 = VisualsTab:Section {name = "Character", column = 2}

local sec = tab:Section {name = "Configs", column = 1}
local configs = {}
local configFolder = "epic config folder/" .. game.PlaceId
for i, v in next, listfiles(configFolder) do
    local newconfig = v:gsub(configFolder .. "\\", "")
    newconfig = newconfig:gsub(".cfg", "")
    table.insert(configs, newconfig)
end
local dropdown =
    sec:Dropdown {
    Name = "Configs",
    Content = configs,
    flag = "configchosen"
}

local button =
    sec:Button {
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags.configchosen)
    end
}

local button =
    sec:Button {
    Name = "Delete Config",
    Callback = function()
        delfile(configFolder .. "\\" .. library.flags.configchosen .. ".cfg")
        local configs = {}

        for i, v in next, listfiles(configFolder) do
            local newconfig = v:gsub(configFolder .. "\\", "")
            newconfig = newconfig:gsub(".cfg", "")
            table.insert(configs, newconfig)
        end

        dropdown:Refresh(configs)
    end
}

local configName = ""

local box =
    sec:Box {
    Name = "Config Name",
    Placeholder = "config",
    callback = function(e)
        configName = e
    end
}

local button =
    sec:Button {
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(configName)
        local configs = {}

        for i, v in next, listfiles(configFolder) do
            local newconfig = v:gsub(configFolder .. "\\", "")
            newconfig = newconfig:gsub(".cfg", "")
            table.insert(configs, newconfig)
        end

        dropdown:Refresh(configs)
    end
}

local Nomiam =
    sec:ColorPicker {
    Name = "Library Color",
    Default = Color3.fromRGB(255, 20, 88),
    Flag = "Namzzzz",
    callback = function(e)
        library:SetColor(e)
    end
}
local tog =
    MainSec1:Toggle {
    Name = "Ragebot",
    flag = "Toggle1",
    callback = function(e)
        getgenv().loltoggle = e
    end
}
local xdddddd =
    MainSec1:Keybind {
    name = "Bind",
    default = Enum.KeyCode.Q,
    blacklist = {Enum.KeyCode.A},
    flag = "keyboinned",
    callback = function(e)
        getgenv().Key = e
    end
}
local gayslider =
    MainSec1:Slider {
    Name = "Ye",
    Default = 1.37,
    Min = 0.5,
    Max = 5,
    Decimals = 3,
    Flag = "XDDDDDDD",
    callback = function(e)
        getgenv().Prediction = e
    end
}
gayslider:SetValueTexT("Prediction: [VALUE]/5")
local drop =
    MainSec1:dropdown {
    name = "Bone",
    content = {"Head", "Torso", "Penis", "Feet"},
    multichoice = false,
    callback = function(State)
        if State == "Head" then
            getgenv().Partz = "Head"
        elseif State == "Torso" then
            getgenv().Partz = "HumanoidRootPart"
        elseif State == "Penis" then
            getgenv().Partz = "LowerTorso"
        elseif State == "Feet" then
            getgenv().Partz = "RightFoot"
        end
    end,
    flag = "noooooooooooooooooooo"
}

local tog =
    MainSec1:Toggle {
    Name = "Ping base",
    flag = "lorisiscoolguys",
    callback = function(e)
        getgenv().autosetup = e
    end
}

local tog =
    MainSec1:Toggle {
    Name = "Notification Mode",
    flag = "frrr",
    callback = function(e)
        getgenv().Notificationmode = e
    end
}
MainSec1:Toggle {
    Name = "Airshot Func",
    flag = "Wif-i",
    callback = function(e)
        getgenv().AirshotFunccc = e
    end
}

local wasdwasdwa =
    MainSec1:Toggle {
    Name = "Tracer Mode",
    flag = "wasdwasd",
    callback = function(e)
        getgenv().Tracer = e
    end
}
MainSec1:dropdown {
    name = "Airshot Bone",
    content = {"Head", "Torso", "Penis", "Feet"},
    multichoice = false,
    callback = function(State)
        if State == "Head" then
            getgenv().airshotpart = "Head"
        elseif State == "Torso" then
            getgenv().airshotpart = "HumanoidRootPart"
        elseif State == "Penis" then
            getgenv().airshotpart = "LowerTorso"
        elseif State == "Feet" then
            getgenv().airshotpart = "RightFoot"
        end
    end,
    flag = "farter"
}
MainSec2:Toggle {
    Name = "Show FOV",
    flag = "yesfrrr",
    callback = function(e)
        _G.CircleVisible = e
    end
}
local fovsizeslider =
    MainSec2:Slider {
    Name = "FOV Size",
    Default = 80,
    Min = 1,
    Max = 500,
    Flag = "niggzzz",
    callback = function(e)
        _G.CircleRadius = e
    end
}
fovsizeslider:SetValueTexT("FOV Size: [VALUE]/1000")
local fovthicknessyea =
    MainSec2:Slider {
    Name = "FOV Thickness",
    Default = 0,
    Min = 0.1,
    Max = 3000,
    Decimals = 5,
    Flag = "niggzzz",
    callback = function(e)
        _G.CircleThickness = e
    end
}
fovthicknessyea:SetValueTexT("FOV Thickness: [VALUE]/3000")
local fovtransparnecy =
    MainSec2:Slider {
    Name = "FOV Transparency",
    Default = 0.5,
    Min = 0.1,
    Max = 1,
    Decimals = 1,
    Flag = "aaaaaaaaaaaaaaaa",
    callback = function(e)
        _G.CircleTransparency = e
    end
}
fovtransparnecy:SetValueTexT("FOV Transparency: [VALUE]/1")
MainSec2:Toggle {
    Name = "FOV Filled",
    flag = "aaaaaa",
    callback = function(e)
        _G.CircleFilled = e
    end
}
MainSec2:dropdown {
    name = "FOV Shape",
    content = {"Circle", "Hexagon", "Triangle", "Pentagon", "Heptagon", "Octagon", "Quadrilateral", "Nonagon"},
    multichoice = false,
    callback = function(State)
        if State == "Circle" then
            _G.CircleSides = 350
        elseif State == "Hexagon" then
            _G.CircleSides = 6
        elseif State == "Triangle" then
            _G.CircleSides = 3
        elseif State == "Pentagon" then
            _G.CircleSides = 5
        elseif State == "Heptagon" then
            _G.CircleSides = 7
        elseif State == "Octagon" then
            _G.CircleSides = 8
        elseif State == "Quadrilateral" then
            _G.CircleSides = 4
        elseif State == "Nonagon" then
            _G.CircleSides = 9
        end
    end
}

local dadadadadadada =
    MainSec2:ColorPicker {
    Name = "FOV Colour",
    Default = Color3.fromRGB(255, 20, 88),
    Flag = "lorisisgay",
    callback = function(e)
        _G.CircleColor = e
    end
}
LegitSec1:Toggle {
    Name = "Aimbot",
    flag = "Kiddddddd",
    callback = function(e)
        Aimlock = e
    end
}
local pasttwonc =
    LegitSec1:Slider {
    Name = "Ye",
    Default = 1.37,
    Min = 0.5,
    Max = 5,
    Decimals = 3,
    Flag = "lololol",
    callback = function(e)
        getgenv().PredictionVelocity = e
    end
}
pasttwonc:SetValueTexT("Prediction: [VALUE]/5")

LegitSec1:Box {
    Name = "Aimbot Bind",
    Placeholder = "q",
    callback = function(e)
        AimlockKey = e
    end
}
LegitSec1:dropdown {
    name = "Bone",
    content = {"Head", "Torso", "Penis"},
    multichoice = false,
    callback = function(State)
        if State == "Head" then
            getgenv().AimPart = "Head"
            getgenv().OldAimPart = "Head"
        elseif State == "Torso" then
            getgenv().AimPart = "HumanoidRootPart"
            getgenv().OldAimPart = "HumanoidRootPart"
        elseif State == "Penis" then
            getgenv().AimPart = "LowerTorso"
            Getgenv().OldAimPart = "LowerTorso"
        end
    end,
    flag = "nooooooooooo"
}
LegitSec1:Toggle {
    Name = "Airshot Func",
    flag = "loldasa",
    callback = function(e)
        CheckIfJumped = e
    end
}
LegitSec1:dropdown {
    name = "Airshot Bone",
    content = {"Head", "Torso", "Penis"},
    multichoice = false,
    callback = function(State)
        if State == "Head" then
            getgenv().airshotbonee = "Head"
        elseif State == "Torso" then
            getgenv().airshotbonee = "HumanoidRootPart"
        elseif State == "Penis" then
            getgenv().airshotbonee = "LowerTorso"
        end
    end,
    flag = "xxxxx"
}
LegitSec1:Toggle {
    Name = "Aim Assist",
    flag = "looool",
    callback = function(e)
        getgenv().Smoothness = e
    end
}
local smoothing_slider =
    LegitSec1:Slider {
    Name = "Aim Assist Strength",
    Default = 0.0365,
    Min = 0.05,
    Max = 1,
    Decimals = 25,
    Flag = "lololol",
    callback = function(e)
        getgenv().SmoothnessAmount = e
    end
}
smoothing_slider:SetValueTexT("Smoothness: [VALUE]/1")

local cluea =
    MiscSec1:Toggle {
    Name = "Spinbot",
    flag = "noonez",
    callback = function(e)
        getgenv().Spinbot = e
    end
}

local ftw =
    MiscSec1:Toggle {
    Name = "Jitter",
    flag = "decxa",
    callback = function(e)
        getgenv().Jitter = e
    end
}
MiscSec1:Toggle {
    Name = "Lay",
    flag = "yeayea",
    callback = function(e)
        if e then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=3152378852"
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId =
                "http://www.roblox.com/asset/?id=3152378852"
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                "http://www.roblox.com/asset/?id=3152378852"
        else
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId = _G.Save1
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId = _G.Save2
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = _G.Save3
        end
    end
}

MiscSec1:Toggle {
    Name = "Anti-Lock",
    flag = "Nopez",
    callback = function(e)
        getgenv().antilock = e
    end
}
local checka =
    MiscSec1:Slider {
    Name = "Speed",
    Default = 0.26,
    Min = 0,
    Max = 0.60,
    Decimals = 2,
    Flag = "moooooo",
    callback = function(e)
        getgenv().antilockspeed = e
    end
}
checka:SetValueTexT("Anti Lock Speed: [VALUE]/0.6")
MiscSec1:SpecialLabel("Blatant Anti Aim")
MiscSec1:Toggle {
    Name = "Spin Blatant AA",
    flag = "thepoop",
    callback = function(e)
        getgenv().AntiAim1 = e
    end
}
MiscSec1:Toggle {
    Name = "Slingshot AA",
    flag = "aaaaaaaz",
    callback = function(e)
        getgenv().AntiAim2 = e
    end
}
local bitchass =
    MiscSec1:togglekeybind {
    name = "CFrame Speed",
    default = Enum.KeyCode.Z,
    keybindflag = "niggaaaaaaaaaaaa",
    toggleflag = "iudr",
    blacklist = {Enum.KeyCode.A},
    togglecallback = function(e)
        getgenv().cframespeedtoggle = e
    end
}
local sdadwasdsa =
    MiscSec1:Slider {
    Name = "Speed Value",
    Default = 0.35,
    Min = 0,
    Max = 5,
    Decimals = 2,
    Flag = "niggzzz",
    callback = function(e)
        getgenv().speedvalue = e
    end
}
sdadwasdsa:SetValueTexT("CFrame Speed Value: [VALUE]/5")

MiscSec2:Toggle {
    Name = "Anti Slowdown",
    flag = "loooldapo",
    callback = function(jjsplcoit)
        antislow = jjsplcoit
        repeat
            wait(0.1)
            local player = game.Players.LocalPlayer
            local DeletePart =
                player.Character.BodyEffects.Movement:FindFirstChild("NoJumping") or
                player.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") or
                player.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed")
            if DeletePart then
                DeletePart:Destroy()
            end
            if player.Character.BodyEffects.Reload.Value == true then
                player.Character.BodyEffects.Reload.Value = false
            end
        until antislow == false
    end
}

MiscSec2:Toggle {
    Name = "Anti Bag",
    flag = "xxxxxx",
    callback = function(e)
        getgenv().antibag = e
    end
}
MiscSec2:Toggle {
    Name = "Trash Talk",
    flag = "neverr",
    callback = function(e)
        getgenv().trashtalkl = e
    end
}
local Abcd =
    MiscSec2:Toggle {
    Name = "Anti Stomp",
    flag = "z",
    callback = function(e)
        getgenv().antistomplo = e
    end
}
MiscSec2:Toggle {
    Name = "Auto Stomp",
    flag = "lepoop",
    callback = function(e)
        getgenv().autostomp = e
    end
}
local feeeel =
    MiscSec2:Toggle {
    Name = "Auto Reload",
    flag = "zzzzz",
    callback = function(e)
        getgenv().AutoReloadx = e
    end
}
local getaway =
    MiscSec2:Toggle {
    Name = "SuperHuman",
    flag = "ooolol",
    callback = function(e)
        getgenv().es_pedofilo = e
    end
}

MiscSec4:dropdown {
    name = "Idle Animation",
    content = {"Borock", "Zombie", "Werewolf", "Ninja", "Ud'zal", "Mage", "Toy"},
    multichoice = false,
    callback = function(State)
        if State == "Borock" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=3293641938"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=3710131919"
        elseif State == "Zombie" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=616158929"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=616160636"
        elseif State == "Werewolf" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=1083195517"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=1083214717"
        elseif State == "Ninja" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=656117400"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=656118341"
        elseif State == "Ud'zal" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=3303162274"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=3303162274"
        elseif State == "Mage" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=707742142"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=707855907"
        elseif State == "Toy" then
            game.Players.LocalPlayer.Character.Animate.idle.Animation1.AnimationId =
                "http://www.roblox.com/asset/?id=782841498"
            game.Players.LocalPlayer.Character.Animate.idle.Animation2.AnimationId =
                "http://www.roblox.com/asset/?id=782841498"
        end
    end
}
MiscSec4:dropdown {
    name = "Walk Animation",
    content = {"Zombie", "Werewolf", "Ninja", "Mage", "Toy"},
    multichoice = false,
    callback = function(State)
        if State == "Zombie" then
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                "http://www.roblox.com/asset/?id=616168032"
        elseif State == "Werewolf" then
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                "http://www.roblox.com/asset/?id=1083178339"
        elseif State == "Ninja" then
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                "http://www.roblox.com/asset/?id=656121766"
        elseif State == "Mage" then
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                "http://www.roblox.com/asset/?id=707897309"
        elseif State == "Toy" then
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId =
                "http://www.roblox.com/asset/?id=782843345"
        end
    end
}

MiscSec4:dropdown {
    name = "Run Animation",
    content = {"Zombie", "Werewolf", "Ninja", "Mage", "Toy"},
    multichoice = false,
    callback = function(State)
        if State == "Zombie" then
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId =
                "http://www.roblox.com/asset/?id=616163682"
        elseif State == "Werewolf" then
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId =
                "http://www.roblox.com/asset/?id=1083216690"
        elseif State == "Ninja" then
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId =
                "http://www.roblox.com/asset/?id=656118852"
        elseif State == "Mage" then
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId =
                "http://www.roblox.com/asset/?id=707861613"
        elseif State == "Toy" then
            game.Players.LocalPlayer.Character.Animate.run.RunAnim.AnimationId =
                "http://www.roblox.com/asset/?id=782842708"
        end
    end
}
MiscSec4:dropdown {
    name = "Jump Animation",
    content = {"Zombie", "Werewolf", "Ninja", "Mage", "Toy", "OldSchool"},
    multichoice = false,
    callback = function(State)
        if State == "Zombie" then
            game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                "http://www.roblox.com/asset/?id=616161997"
        elseif State == "Werewolf" then
            game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                "http://www.roblox.com/asset/?id=1083218792"
        elseif State == "Ninja" then
            game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                "http://www.roblox.com/asset/?id=656117878"
        elseif State == "Mage" then
            game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                "http://www.roblox.com/asset/?id=707853694"
        elseif State == "Toy" then
            game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                "http://www.roblox.com/asset/?id=782847020"
        elseif State == "OldSchool" then
            game.Players.LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId =
                "http://www.roblox.com/asset/?id=5319841935"
        end
    end
}
MiscSec4:dropdown {
    name = "Fall Animation",
    content = {"Zombie", "Werewolf", "Ninja", "Mage", "Toy", "OldSchool"},
    multichoice = false,
    callback = function(State)
        if State == "Zombie" then
            game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                "http://www.roblox.com/asset/?id=616157476"
        elseif State == "Werewolf" then
            game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                "http://www.roblox.com/asset/?id=1083189019"
        elseif State == "Ninja" then
            game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                "http://www.roblox.com/asset/?id=656115606"
        elseif State == "Mage" then
            game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                "http://www.roblox.com/asset/?id=707829716"
        elseif State == "Toy" then
            game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                "http://www.roblox.com/asset/?id=782846423"
        elseif State == "OldSchool" then
            game.Players.LocalPlayer.Character.Animate.fall.FallAnim.AnimationId =
                "http://www.roblox.com/asset/?id=5319839762"
        end
    end
}
MiscSec3:dropdown {
    name = "Auto-Buy",
    content = {"Revolver", "DB", "SMG", "AK-47", "LMG", "Glock", "Silencer", "RPG", "Flamethrower", "Taser"},
    multichoice = false,
    callback = function(State)
        if State == "Revolver" then
            plr = game:GetService "Players".LocalPlayer
            local gunName = "[Revolver] - $1300"
            local k = game.Workspace.Ignored.Shop[gunName]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "DB" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "SMG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[SMG] - $750"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "AK-47" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[AK47] - $2250"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "LMG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[LMG] - $3750"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Glock" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Glock] - $500"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Glock] - $500"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Glock] - $500"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Silencer" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Silencer] - $550"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Silencer] - $550"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Silencer] - $550"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "RPG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[RPG] - $6000"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Flamethrower" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Flamethrower] - $25000"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Taser" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Taser] - $1250"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taser] - $1250"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taser] - $1250"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}
MiscSec3:dropdown {
    name = "Auto-Buy Ammo",
    content = {"Revolver", "DB", "SMG", "AK-47", "LMG", "Glock", "Silencer", "RPG", "Flamethrower"},
    multichoice = false,
    callback = function(State)
        if State == "Revolver" then
            local plr = game:GetService "Players".LocalPlayer
            local gunName = "12 [Revolver Ammo] - $75"
            local k = game.Workspace.Ignored.Shop[gunName]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "DB" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "SMG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "AK-47" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "LMG" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Glock" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Silencer" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "RPG" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Flamethrower" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}

MiscSec3:dropdown {
    name = "Auto-Buy Melees",
    content = {"Knife", "Bat", "Shovel", "Pitchfork", "Stopsign"},
    multichoice = false,
    callback = function(State)
        if State == "Knife" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Knife] - $150"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Knife] - $150"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Knife] - $150"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Bat" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Bat] - $250"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Bat] - $250"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Bat] - $250"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Shovel" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Shovel] - $320"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Shovel] - $320"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Shovel] - $320"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Pitchfork" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Pitchfork] - $320"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Pitchfork] - $320"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Pitchfork] - $320"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Stopsign" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[StopSign] - $300"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[StopSign] - $300"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[StopSign] - $300"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}
MiscSec3:dropdown {
    name = "Auto-Buy Food",
    content = {"Chicken", "Pizza", "Hotdog", "Taco", "Hamburger", "Donut", "Lettuce"},
    multichoice = false,
    callback = function(State)
        if State == "Chicken" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Chicken] - $7"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Pizza" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Pizza] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Hotdog" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[HotDog] - $8"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[HotDog] - $8"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[HotDog] - $8"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Taco" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Taco] - $2"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Hamburger" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Hamburger] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Donut" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Donut] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Donut] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Donut] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Lettuce" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Lettuce] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lettuce] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lettuce] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}
MiscSec3:dropdown {
    name = "Auto-Buy Drinks",
    content = {"Cranberry", "Lemonade", "Starblox"},
    multichoice = false,
    callback = function(State)
        if State == "Cranberry" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Cranberry] - $3"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Cranberry] - $3"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Cranberry] - $3"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Lemonade" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Lemonade] - $3"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lemonade] - $3"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lemonade] - $3"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Starblox" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Starblox Latte] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Starblox Latte] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Starblox Latte] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}

MiscSec3:dropdown {
    name = "Auto-Buy Bikes",
    content = {"Solo", "Duo"},
    multichoice = false,
    callback = function(State)
        if State == "Solo" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[SoloBike] - $25"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[SoloBike] - $25"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[SoloBike] - $25"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Duo" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[DuoBike] - $75"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[DuoBike] - $75"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[DuoBike] - $75"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}
MiscSec3:dropdown {
    name = "Auto-Buy Masks",
    content = {"Surgeon", "Riot", "Hockey", "Ninja", "Skull", "Paintball", "Breathing"},
    multichoice = false,
    callback = function(State)
        if State == "Surgeon" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Riot" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Riot Mask] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Riot Mask] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Riot Mask] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Hockey" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Hockey Mask] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Hockey Mask] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Hockey Mask] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Ninja" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Ninja Mask] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Ninja Mask] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Ninja Mask] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Skull" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Skull Mask] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Skull Mask] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Skull Mask] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Paintball" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Paintball Mask] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Paintball Mask] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Paintball Mask] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Breathing" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Breathing Mask] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Breathing Mask] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Breathing Mask] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}
MiscSec3:dropdown {
    name = "Auto-Buy Phones",
    content = {
        "Gray iPhone",
        "Yellow iPhone",
        "Pink iPhone",
        "Pink Phone",
        "Orange Phone",
        "Old Phone",
        "Original Phone"
    },
    multichoice = false,
    callback = function(State)
        if State == "Gray iPhone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[iPhone] - $600"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[iPhone] - $600"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[iPhone] - $600"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Yellow iPhone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[iPhoneG] - $600"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[iPhoneG] - $600"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[iPhoneG] - $600"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Pink iPhone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[iPhoneP] - $600"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[iPhoneP] - $600"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[iPhoneP] - $600"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Pink Phone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[PinkPhone] - $400"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[PinkPhone] - $400"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[PinkPhone] - $400"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Orange Phone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Orange Phone] - $400"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Orange Phone] - $400"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Orange Phone] - $400"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Old Phone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Old Phone] - $100"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Old Phone] - $100"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Old Phone] - $100"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Original Phone" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Original Phone] - $50"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Original Phone] - $50"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Original Phone] - $50"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end
}
local ESP = loadstring(game:HttpGet("https://pastebin.com/raw/U2HwmEyF"))()
VisualsSec:Toggle {
    Name = "Enable Esp",
    flag = "Headshot1",
    callback = function(e)
        ESP.Enabled = e
    end
}
VisualsSec:Toggle {
    Name = "Enable Boxes",
    flag = "Headshot3",
    callback = function(e)
        ESP.Boxes = e
    end
}
VisualsSec:Toggle {
    Name = "Enable Tracers",
    flag = "Headshot4",
    callback = function(e)
        ESP.Tracers = e
    end
}
VisualsSec:Toggle {
    Name = "Enable Info",
    flag = "Headshot2",
    callback = function(e)
        ESP.Names = e
    end
}
VisualsSec:ColorPicker {
    Name = "ESP Color",
    Default = Color3.fromRGB(255, 255, 255),
    Flag = "Headshot5",
    callback = function(e)
        ESP.Color = e
    end
}
local Godsz =
    MainSec3:ColorPicker {
    Name = "Tracer Color",
    Default = Color3.fromRGB(255, 20, 88),
    Flag = "Godss",
    callback = function(ep)
        _G.TracerColor = ep
    end
}
local TracerTransparency1 =
    MainSec3:Slider {
    Name = "Tracer Transparency",
    Default = 1,
    Min = 0.1,
    Max = 1,
    Decimals = 1,
    Flag = "Blood$pill",
    callback = function(e)
        _G.TracerTransparency = e
    end
}
TracerTransparency1:SetValueTexT("Tracer Transparency: [VALUE]/1")

local TracerThicknsa =
    MainSec3:Slider {
    Name = "Tracer Thickness",
    Default = 1,
    Min = 0.1,
    Max = 10,
    Decimals = 5,
    Flag = "Bloodz",
    callback = function(e)
        _G.TracerThickness = e
    end
}
TracerThicknsa:SetValueTexT("Tracer Thickness: [VALUE]/10")

VisualsSec2:Toggle {
    Name = "Gun Chams",
    flag = "Whatsurnrame",
    callback = function(e)
        if e then
            local Client = game.GetService(game, "Players").LocalPlayer
            Client.Character:FindFirstChildOfClass("Tool").Default.Material = Enum.Material.ForceField
        else
            local Client = game.GetService(game, "Players").LocalPlayer
            Client.Character:FindFirstChildOfClass("Tool").Default.Material = Enum.Material.Plastic
        end
    end
}

VisualsSec3:Toggle {
    Name = "Blizzard Beast Mode",
    flag = "Whatsurnrame",
    callback = function(e)
        if e then
            game.Players.LocalPlayer.Character.Head.face.Texture = "rbxassetid://127959433"
        else
            game.Players.LocalPlayer.Character.Head.face.Texture = _G.Save0
        end
    end
}
VisualsSec3:Toggle {
    Name = "Super Super Happy Face",
    flag = "Weird_a",
    callback = function(e)
        if e then
            game.Players.LocalPlayer.Character.Head.face.Texture = "rbxassetid://494290547"
        else
            game.Players.LocalPlayer.Character.Head.face.Texture = _G.Save0
        end
    end
}
VisualsSec3:Toggle {
    Name = "Beast Mode",
    flag = "Weird_a1",
    callback = function(e)
        if e then
            game.Players.LocalPlayer.Character.Head.face.Texture = "rbxassetid://209712379"
        else
            game.Players.LocalPlayer.Character.Head.face.Texture = _G.Save0
        end
    end
}
VisualsSec3:Toggle {
    Name = "Playful Vampire",
    flag = "Weird_a2",
    callback = function(e)
        if e then
            game.Players.LocalPlayer.Character.Head.face.Texture = "rbxassetid://2409281591"
        else
            game.Players.LocalPlayer.Character.Head.face.Texture = _G.Save0
        end
    end
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/idkdudeicode/stf/main/stf"))()

Tab:AddButton({
	Name = "Anti-Aim",
	Callback = function()
      		IsFirstPerson = false
ShiftHeld = false
WHeld = false
SHeld = false
AHeld = false
DHeld = false -- LMFAO
local gcheck = true
urspeed = 0.05 -- The lower it is the faster. So don't worry about it being minus 1


function ChangeFaster(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.N and gameProcessedEvent == false then        
urspeed = urspeed - 0.025
    end
end
 


function ChangeSlower(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.M and gameProcessedEvent == false then        
urspeed = urspeed + 0.025
    end
end
 


function GChecker(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.T and gameProcessedEvent == false then        
if gcheck == false then
gcheck = true
elseif gcheck == true then
gcheck = false
end

    end
end
 
game:GetService("UserInputService").InputBegan:connect(GChecker)



function PressShift(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.LeftShift and gameProcessedEvent == false and gcheck == true then
        ShiftHeld = true
    end
end

function ReleaseShift(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.LeftShift then
        ShiftHeld = false
    end
end


function PressW(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.W and gameProcessedEvent == false and gcheck == true then
        WHeld = true
    end
end

function ReleaseW(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.W then
        WHeld = false
    end
end

function PressS(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.S and gameProcessedEvent == false and gcheck == true then
        SHeld = true
    end
end

function ReleaseS(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.S then
        SHeld = false
    end
end


function PressA(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.A and gameProcessedEvent == false and gcheck == true then
        AHeld = true
    end
end

function ReleaseA(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.A then
        AHeld = false
    end
end


function PressD(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.D and gameProcessedEvent == false and gcheck == true then
        DHeld = true
    end
end

function ReleaseD(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.D then
        DHeld = false
    end
end

function CheckFirst(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.UserInputType.MouseWheel then
        if (player.Character.Head.CFrame.p - workspace.CurrentCamera.CFrame.p).magnitude < 0.6 then
            IsFirstPerson = true
	elseif (player.Character.Head.CFrame.p - workspace.CurrentCamera.CFrame.p).magnitude > 0.6 then
	    IsFirstPerson = false
        end
    end
end

game:GetService("UserInputService").InputBegan:connect(PressShift)
game:GetService("UserInputService").InputEnded:connect(ReleaseShift)

game:GetService("UserInputService").InputBegan:connect(PressW)
game:GetService("UserInputService").InputEnded:connect(ReleaseW)

game:GetService("UserInputService").InputBegan:connect(PressS)
game:GetService("UserInputService").InputEnded:connect(ReleaseS)

game:GetService("UserInputService").InputBegan:connect(PressA)
game:GetService("UserInputService").InputEnded:connect(ReleaseA)

game:GetService("UserInputService").InputBegan:connect(PressD)
game:GetService("UserInputService").InputEnded:connect(ReleaseD)

game:GetService("UserInputService").InputChanged:connect(CheckFirst)

game:GetService("UserInputService").InputBegan:connect(ChangeFaster)
game:GetService("UserInputService").InputBegan:connect(ChangeSlower)


game:GetService('RunService').Stepped:connect(function()
if ShiftHeld == true then

if WHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-urspeed)
end

if SHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,urspeed)
end

if DHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(urspeed,0,0)
end

if AHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(-urspeed,0,0)
end


end
end)

repeat
    wait()
until game:IsLoaded()
local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall =
    newcclosure(
    function(self, ...)
        local args = {...}
        if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(self) == "MainEvent" then
            if tostring(getcallingscript()) ~= "Framework" then
                return
            end
        end
        if not checkcaller() and getnamecallmethod() == "Kick" then
            return
        end
        return namecall(self, unpack(args))
    end
)
  	end    
})

  	end    
})

local Tab = Window:MakeTab({
	Name = "Cuztomize UI",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})

local Tab = Window:MakeTab({
	Name = "God Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "God Mode!",
	Callback = function()
      		local localPlayer = game:GetService('Players').LocalPlayer;
                local localCharacter = localPlayer.Character;
                localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
                local newCharacter = localPlayer.CharacterAdded:Wait();
                local spoofFolder = Instance.new('Folder');
                spoofFolder.Name = 'FULLY_LOADED_CHAR';
                spoofFolder.Parent = newCharacter;
                newCharacter:WaitForChild('RagdollConstraints'):Destroy();
                local spoofValue = Instance.new('BoolValue', newCharacter);
                spoofValue.Name = 'RagdollConstraints';
                local name = game.Players.LocalPlayer.Name
                local lol =    game.Workspace:WaitForChild(name)
                local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
                lol.Parent = game.Workspace.Players
                game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
                game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
                
	end})

Tab:AddButton({
	Name = "Normal FOV [BUGGY DONT TOUCH]",
	Callback = function()
 circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(32, 28, 52)
circle.Thickness = 0
circle.NumSides = 732
circle.Radius = 60
circle.Thickness = 0
circle.Transparency = 0.7
circle.Visible = true
circle.Filled = false

Tab:AddButton({
	Name = "Filled FOV (Big)!",
	Callback = function()
      		circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(32, 28, 52)
circle.Thickness = 0
circle.NumSides = 732
circle.Radius = 140
circle.Thickness = 0
circle.Transparency = 0.7
circle.Visible = true
circle.Filled = true

	end 
  
  
  
  })
	end})

local Tab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Admin-Base",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-797.15, -39.6189, -887.957)

	end})
	
	Tab:AddButton({
	Name = "Food Shop [Bank]",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(298.477, 49.3129, -615.231)
  	end    
})

Tab:AddButton({
	Name = "Food Shop [Taco]",
	Callback = function()
      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(583.96, 51.0917, -479.596)

  	  

  	end    
})

Tab:AddButton({
	Name = "Food Shop [Hamburger]",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-279.501, 22.6801, -803.887)
  	end    
})

Tab:AddButton({
	Name = "Gun Shop [UpHill]",
	Callback = function()
      	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.925, 48.1008, -621.23)
  	end    
})

Tab:AddButton({
	Name = "Gun Shop [Armor]",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-580.27, 8.34504, -734.832)
  	end    
})

Tab:AddButton({
	Name = "Bank [Roof]",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-438.689, 39.0127, -284.731)
  	end    
})

Tab:AddButton({
	Name = "Police Station",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-263.919, 21.8302, -112.858)
  	end    
})

Tab:AddButton({
	Name = "Fire Station",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-129.534, 27.842, -113.062)
  	end    
})

Tab:AddButton({
	Name = "Church",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205.53, 21.7803, -80.2361)
  	end    
})

Tab:AddButton({
	Name = "Casino",
	Callback = function()
      		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-904.457, 24.7803, -156.994)
  	end   
})