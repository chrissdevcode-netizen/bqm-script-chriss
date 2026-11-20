-- [[ BQM PVP PAID SCRIPT
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local TargetParent = (gethui and gethui()) or CoreGui or Player:WaitForChild("PlayerGui")

-- Limpiar
if TargetParent:FindFirstChild("BQMPvP_ChristmasUI") then
    TargetParent.BQMPvP_ChristmasUI:Destroy()
end

--  enlaces y script
local DISCORD_LINK = "https://discord.gg/TdhjJ2F5f"
local WHATSAPP_LINK = "https://whatsapp.com/channel/0029VbC12x4GufIzNYfrPh3R"
local SCRIPT_URL = "https://api.jnkie.com/api/v1/luascripts/public/aae843bc1912100d04455539744a47b23dd06246915ae03a7247c3cd19d62992/download"

-- ScreenGui Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BQMPvP_ChristmasUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

-- Contenedor Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 360, 0, 290)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -145)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 16, 22)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- Borde Neón 
local NeonStroke = Instance.new("UIStroke")
NeonStroke.Thickness = 2.5
NeonStroke.Color = Color3.fromRGB(255, 255, 255)
NeonStroke.Parent = MainFrame

local StrokeGradient = Instance.new("UIGradient")
StrokeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 40, 75)),   
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 215, 60)),  
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(30, 255, 120))   
})
StrokeGradient.Parent = NeonStroke

-- Animación de rotación
task.spawn(function()
    local rot = 0
    while MainFrame.Parent do
        rot = (rot + 1.5) % 360
        StrokeGradient.Rotation = rot
        task.wait(0.02)
    end
end)

-- Fondo con degradado sutil
local BgGradient = Instance.new("UIGradient")
BgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 14, 24)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 22, 18))
})
BgGradient.Rotation = 45
BgGradient.Parent = MainFrame

-- Contenedor de Partículas de Nieve / Luces
local ParticleContainer = Instance.new("Frame")
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.ZIndex = 1
ParticleContainer.Parent = MainFrame

local ParticleColors = {
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(255, 65, 95),
    Color3.fromRGB(50, 255, 140),
    Color3.fromRGB(255, 220, 80)
}

task.spawn(function()
    while MainFrame.Parent do
        local p = Instance.new("Frame")
        local size = math.random(3, 6)
        p.Size = UDim2.new(0, size, 0, size)
        p.Position = UDim2.new(math.random(), 0, -0.05, 0)
        p.BackgroundColor3 = ParticleColors[math.random(1, #ParticleColors)]
        p.BackgroundTransparency = math.random(2, 5) / 10
        p.BorderSizePixel = 0
        p.ZIndex = 1
        p.Parent = ParticleContainer

        local pCorner = Instance.new("UICorner")
        pCorner.CornerRadius = UDim.new(1, 0)
        pCorner.Parent = p

        local duration = math.random(25, 45) / 10
        local endX = p.Position.X.Scale + (math.random(-15, 15) / 100)
        local tween = TweenService:Create(p, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Position = UDim2.new(endX, 0, 1.08, 0),
            BackgroundTransparency = 1
        })
        tween:Play()
        tween.Completed:Connect(function()
            p:Destroy()
        end)

        task.wait(0.18)
    end
end)

-- Botón Cerrar (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(35, 20, 28)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 110)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.ZIndex = 3
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Título Principal: BQM PVP PAID SCRIPT
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 0, 34)
TitleLabel.Position = UDim2.new(0, 16, 0, 12)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🎄 BQM PVP PAID SCRIPT 🎄"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextSize = 17
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 2
TitleLabel.Parent = MainFrame

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 80, 100)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 245, 200)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(80, 255, 150))
})
TitleGradient.Parent = TitleLabel

-- Subtítulo
local SubLabel = Instance.new("TextLabel")
SubLabel.Size = UDim2.new(1, -32, 0, 22)
SubLabel.Position = UDim2.new(0, 16, 0, 54)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "INGRESA TU LICENCIA"
SubLabel.TextColor3 = Color3.fromRGB(200, 220, 210)
SubLabel.Font = Enum.Font.GothamBold
SubLabel.TextSize = 12
SubLabel.TextXAlignment = Enum.TextXAlignment.Left
SubLabel.ZIndex = 2
SubLabel.Parent = MainFrame

-- Caja de Texto para la Key
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -32, 0, 42)
KeyBox.Position = UDim2.new(0, 16, 0, 78)
KeyBox.BackgroundColor3 = Color3.fromRGB(22, 26, 35)
KeyBox.PlaceholderText = "Pega tu llave aquí..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 145)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.GothamSemibold
KeyBox.TextSize = 13
KeyBox.ClearTextOnFocus = false
KeyBox.ZIndex = 2
KeyBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 9)
BoxCorner.Parent = KeyBox

local BoxStroke = Instance.new("UIStroke")
BoxStroke.Thickness = 1.5
BoxStroke.Color = Color3.fromRGB(60, 220, 130)
BoxStroke.Transparency = 0.4
BoxStroke.Parent = KeyBox

-- Botón Verificar
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -32, 0, 42)
SubmitBtn.Position = UDim2.new(0, 16, 0, 130)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(28, 195, 105)
SubmitBtn.Text = "🎁 VERIFICAR Y EJECUTAR 🎁"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBlack
SubmitBtn.TextSize = 14
SubmitBtn.ZIndex = 2
SubmitBtn.Parent = MainFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 9)
SubmitCorner.Parent = SubmitBtn

local SubmitGradient = Instance.new("UIGradient")
SubmitGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 40, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 190, 100))
})
SubmitGradient.Parent = SubmitBtn

-- Separador visual
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -32, 0, 1)
Divider.Position = UDim2.new(0, 16, 0, 184)
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BackgroundTransparency = 0.85
Divider.BorderSizePixel = 0
Divider.ZIndex = 2
Divider.Parent = MainFrame

-- F
local function CopyLinkWithFeedback(button, originalText, url)
    if setclipboard then
        setclipboard(url)
        button.Text = "✅ ¡LINK COPIADO!"
    else
        button.Text = "⚠️ EJECUTOR SIN CLIPBOARD"
    end
    task.delay(2, function()
        if button and button.Parent then
            button.Text = originalText
        end
    end)
end

-- Botón BUY KEY DISCORD
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Size = UDim2.new(1, -32, 0, 36)
DiscordBtn.Position = UDim2.new(0, 16, 0, 195)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.Text = "BUY KEY DISCORD"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.Font = Enum.Font.GothamBold
DiscordBtn.TextSize = 13
DiscordBtn.ZIndex = 2
DiscordBtn.Parent = MainFrame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 8)
DiscordCorner.Parent = DiscordBtn

DiscordBtn.MouseButton1Click:Connect(function()
    CopyLinkWithFeedback(DiscordBtn, "BUY KEY DISCORD", DISCORD_LINK)
end)

-- Botón JOIN WHATSAPP
local WhatsappBtn = Instance.new("TextButton")
WhatsappBtn.Size = UDim2.new(1, -32, 0, 36)
WhatsappBtn.Position = UDim2.new(0, 16, 0, 239)
WhatsappBtn.BackgroundColor3 = Color3.fromRGB(37, 211, 102)
WhatsappBtn.Text = "JOIN WHATSAPP"
WhatsappBtn.TextColor3 = Color3.fromRGB(15, 25, 20)
WhatsappBtn.Font = Enum.Font.GothamBlack
WhatsappBtn.TextSize = 13
WhatsappBtn.ZIndex = 2
WhatsappBtn.Parent = MainFrame

local WhatsappCorner = Instance.new("UICorner")
WhatsappCorner.CornerRadius = UDim.new(0, 8)
WhatsappCorner.Parent = WhatsappBtn

WhatsappBtn.MouseButton1Click:Connect(function()
    CopyLinkWithFeedback(WhatsappBtn, "JOIN WHATSAPP", WHATSAPP_LINK)
end)

--
SubmitBtn.MouseButton1Click:Connect(function()
    local inputKey = KeyBox.Text:gsub("%s+", "") 
    
    if inputKey == "" then
        SubmitBtn.Text = "❌ INGRESA UNA KEY PRIMERO"
        BoxStroke.Color = Color3.fromRGB(255, 50, 75)
        task.delay(1.5, function()
            if SubmitBtn and SubmitBtn.Parent then
                SubmitBtn.Text = "🎁 VERIFICAR Y EJECUTAR 🎁"
                BoxStroke.Color = Color3.fromRGB(60, 220, 130)
            end
        end)
        return
    end

    SubmitBtn.Text = "⏳ CARGANDO SCRIPT..."
    
    -- 
    local env = (getgenv and getgenv()) or _G
    env.SCRIPT_KEY = inputKey

    task.wait(0.3)
    ScreenGui:Destroy()

    -- Ejecutar el script remoto
    local ok, err = pcall(function()
        loadstring(game:HttpGet(SCRIPT_URL))()
    end)

    if not ok then
        warn("[BQM PVP] Error al cargar el script:", err)
    end
end)

-- Sistema para arrastrar la ventana
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

