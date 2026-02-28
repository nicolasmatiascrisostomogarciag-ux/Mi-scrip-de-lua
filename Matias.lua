-- FPS KILLER EXTREMO para ROBA UN BRAINROT (Steal a Brainrot) - 2026 MÁS LAG
-- Tú en móvil: menos impacto | Otros: PCs y móviles muertos

local button = script.Parent
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local isActive = false
local cooldown = false

-- SUBIDOS PARA MÁS LAG (prueba y baja si tu teléfono se calienta)
local PARTICLES = 1800       -- Móvil killer extremo
local BILLBOARDS = 900       -- UI lag brutal
local TRAILS = 200           -- Visual constante
local PARTS_DECALS = 1200    -- PC render/texturas masivo
local SOUNDS = 150           -- Audio troll fuerte
local BEAMS = 350            -- Draw calls PC
local OFFSET_MAX = 150       -- Lejos para tu culling

button.MouseButton1Click:Connect(function()
    if cooldown then return end
    cooldown = true
    
    isActive = not isActive
    
    if isActive then
        button.Text = "LAG EXTREMO ON 🔥🔥"
        print("LAG EXTREMO ACTIVADO - ¡Todos muertos en Roba un Brainrot!")
        task.spawn(startExtremeLag)
    else
        button.Text = "LAG OFF"
        print("LAG EXTREMO OFF")
        stopExtremeLag()
    end
    
    task.delay(10, function() cooldown = false end)  -- Cooldown largo para móvil
end)

local objects = {}

function startExtremeLag()
    stopExtremeLag()
    
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
    if not root then return end
    
    -- 1. PARTICLES EXTREMOS (overdraw GPU en trades/steals)
    for i = 1, PARTICLES do
        local p = Instance.new("ParticleEmitter")
        p.Texture = "rbxassetid://243098098"
        p.Rate = 180 + math.random(100, 200)
        p.Lifetime = NumberRange.new(18, 35)
        p.Speed = NumberRange.new(28, 65)
        p.SpreadAngle = Vector2.new(360, 360)
        p.Enabled = true
        p.Parent = workspace.Terrain or workspace
        p.StudsOffset = Vector3.new(math.random(-OFFSET_MAX, OFFSET_MAX), math.random(70, 180), math.random(-OFFSET_MAX, OFFSET_MAX))
        
        if i % 5 == 0 then
            p.Parent = root
            p.StudsOffset = Vector3.new(math.random(-7,7), math.random(6,18), math.random(-7,7))
        end
        table.insert(objects, p)
    end
    
    -- 2. BILLBOARDS MASIVOS (UI destructor en PvP/duels)
    for i = 1, BILLBOARDS do
        local bg = Instance.new("BillboardGui")
        bg.Size = UDim2.new(18 + math.random(0,15), 0, 18 + math.random(0,15), 0)
        bg.AlwaysOnTop = true
        bg.MaxDistance = 1000
        bg.LightInfluence = 0
        
        local txt = Instance.new("TextLabel", bg)
        txt.Size = UDim2.new(1,0,1,0)
        txt.BackgroundTransparency = math.random(1,7)/10
        txt.BackgroundColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
        txt.Text = "LAG EXTREMO ROBA BRAINROT x" .. i
        txt.TextScaled = true
        txt.TextColor3 = Color3.new(1,0,0)
        txt.Font = Enum.Font.Arcade
        
        bg.Adornee = root
        bg.StudsOffset = Vector3.new(math.random(-OFFSET_MAX, OFFSET_MAX), math.random(80, 200), math.random(-OFFSET_MAX, OFFSET_MAX))
        bg.Parent = player.PlayerGui
        
        table.insert(objects, bg)
    end
    
    -- 3. TRAILS (lag visual rainbow en movimiento)
    for i = 1, TRAILS do
        local a0 = Instance.new("Attachment", root)
        a0.Position = Vector3.new(math.random(-7,7), math.random(-7,7), math.random(-7,7))
        
        local a1 = Instance.new("Attachment", root)
        a1.Position = Vector3.new(math.random(-7,7), math.random(-7,7), math.random(-7,7))
        
        local t = Instance.new("Trail")
        t.Attachment0 = a0
        t.Attachment1 = a1
        t.Lifetime = 16 + math.random(0,10)
        t.WidthScale = NumberSequence.new(4, 0)
        t.Color = ColorSequence.new(Color3.fromRGB(math.random(50,255), math.random(50,255), math.random(50,255)))
        t.Enabled = true
        t.Parent = root
        
        table.insert(objects, t); table.insert(objects, a0); table.insert(objects, a1)
    end
    
    -- 4. PARTS + DECALS EXTREMOS (PC killer total)
    for i = 1, PARTS_DECALS do
        local part = Instance.new("Part")
        part.Size = Vector3.new(8,8,8)
        part.Position = root.Position + Vector3.new(math.random(-120,120), math.random(50,140), math.random(-120,120))
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 0.2 + math.random()/5
        part.BrickColor = BrickColor.Random()
        part.Parent = workspace
        
        local decal = Instance.new("Decal", part)
        decal.Texture = "rbxassetid://"..math.random(100000000, 999999999)
        decal.Face = Enum.NormalId.Front
        
        table.insert(objects, part); table.insert(objects, decal)
    end
    
    -- 5. SOUNDS MASIVOS (audio lag para todos)
    for i = 1, SOUNDS do
        local snd = Instance.new("Sound")
        snd.SoundId = "rbxassetid://131961136"  -- Molesto, cambia si quieres otro
        snd.Volume = 0.6 + math.random()/3
        snd.PlaybackSpeed = 0.5 + math.random()*2
        snd.Looped = true
        snd.Parent = workspace
        snd:Play()
        table.insert(objects, snd)
    end
    
    -- 6. BEAMS EXTREMOS (draw calls PC brutales)
    local atts = {}
    for i = 1, BEAMS * 2 do
        local att = Instance.new("Attachment")
        att.Parent = workspace.Terrain or workspace
        att.Position = root.Position + Vector3.new(math.random(-140,140), math.random(40,150), math.random(-140,140))
        table.insert(objects, att)
        table.insert(atts, att)
    end
    
    for i = 1, BEAMS do
        local beam = Instance.new("Beam")
        beam.Attachment0 = atts[i]
        beam.Attachment1 = atts[i + BEAMS] or atts[1]
        beam.Width0 = 4 + math.random(0,5)
        beam.Width1 = 4 + math.random(0,5)
        beam.Color = ColorSequence.new(Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255)))
        beam.Transparency = NumberSequence.new(math.random(0,0.7))
        beam.Parent = workspace
        table.insert(objects, beam)
    end
    
    print("LAG EXTREMO ROBA BRAINROT: \~" .. #objects .. " objetos - ¡Caos total!")
end

function stopExtremeLag()
    for _, obj in ipairs(objects) do
        pcall(function()
            if obj:IsA("Sound") then obj:Stop() end
            obj:Destroy()
        end)
    end
    objects = {}
end

player.CharacterRemoving:Connect(stopExtremeLag)
game:BindToClose(stopExtremeLag)
