-- Anti-skid: do not repost or claim this script as your own
-- Discord: if (!bitches) exit(1); or cyberseall
-- Username: cyberseall

pcall(function()
    workspace.StreamingEnabled = false
    if workspace:FindFirstChild("SimulationRadius") then
        workspace.SimulationRadius = 999999
    end
end)

local Players            = game:GetService("Players")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local WorkspaceService   = game:GetService("Workspace")
local TweenService       = game:GetService("TweenService")

local cyberseallPlayer   = Players.LocalPlayer
local cyberseallChar     = cyberseallPlayer.Character or cyberseallPlayer.CharacterAdded:Wait()
local cyberseallHrp      = cyberseallChar:WaitForChild("HumanoidRootPart")
local cyberseallHumanoid = cyberseallChar:WaitForChild("Humanoid")

-- INTERFACE UI STYLÉE PAR PROSTONE
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CyberseallBondGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = cyberseallPlayer:WaitForChild("PlayerGui")

local bondsCollected = Instance.new("TextLabel")
bondsCollected.Size = UDim2.new(1, -20, 0, 25)
bondsCollected.Position = UDim2.new(0, 10, 1, -85)
bondsCollected.BackgroundTransparency = 1
bondsCollected.TextColor3 = Color3.fromRGB(0, 255, 120)
bondsCollected.Font = Enum.Font.GothamBold
bondsCollected.TextSize = 14
bondsCollected.TextXAlignment = Enum.TextXAlignment.Left
bondsCollected.Text = "🎯 Bonds: 0/0"
bondsCollected.Parent = mainFrame

local timeElapsed = Instance.new("TextLabel")
timeElapsed.Size = UDim2.new(1, -20, 0, 25)
timeElapsed.Position = UDim2.new(0, 10, 1, -115)
timeElapsed.BackgroundTransparency = 1
timeElapsed.TextColor3 = Color3.fromRGB(255, 200, 0)
timeElapsed.Font = Enum.Font.GothamBold
timeElapsed.TextSize = 14
timeElapsed.TextXAlignment = Enum.TextXAlignment.Left
timeElapsed.Text = "⏱️ Temps: 0s"
timeElapsed.Parent = mainFrame

local efficiency = Instance.new("TextLabel")
efficiency.Size = UDim2.new(1, -20, 0, 25)
efficiency.Position = UDim2.new(0, 10, 1, -145)
efficiency.BackgroundTransparency = 1
efficiency.TextColor3 = Color3.fromRGB(0, 200, 255)
efficiency.Font = Enum.Font.GothamBold
efficiency.TextSize = 14
efficiency.TextXAlignment = Enum.TextXAlignment.Left
efficiency.Text = "⚡ Vitesse: 0/s"
efficiency.Parent = mainFrame

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 220)
mainFrame.Position = UDim2.new(0.5, -300, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

-- Ajout d'un effet de survol pour montrer que c'est draggable
mainFrame.MouseEnter:Connect(function()
    TweenService:Create(stroke, TweenInfo.new(0.3), {
        Transparency = 0.5
    }):Play()
end)

mainFrame.MouseLeave:Connect(function()
    TweenService:Create(stroke, TweenInfo.new(0.3), {
        Transparency = 0
    }):Play()
end)

local uiCorner = Instance.new("UICorner", mainFrame)
uiCorner.CornerRadius = UDim.new(0, 20)

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(0, 255, 120)
stroke.Thickness = 2.5

local glowEffect = Instance.new("ImageLabel")
glowEffect.Size = UDim2.new(1.2, 0, 1.2, 0)
glowEffect.Position = UDim2.new(-0.1, 0, -0.1, 0)
glowEffect.BackgroundTransparency = 1
glowEffect.Image = "rbxassetid://7639397340"
glowEffect.ImageColor3 = Color3.fromRGB(0, 255, 120)
glowEffect.ImageTransparency = 0.9
glowEffect.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 1, -60)
statusLabel.Position = UDim2.new(0, 10, 0, 10)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 28
statusLabel.Text = "🚀 Initialisation en cours...\n⚠️ Ne touchez à rien pendant le processus."
statusLabel.TextWrapped = true
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.Parent = mainFrame

local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(1, -20, 0, 30)
warningLabel.Position = UDim2.new(0, 10, 1, -55)
warningLabel.BackgroundTransparency = 1
warningLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
warningLabel.Font = Enum.Font.GothamBold
warningLabel.TextSize = 14
warningLabel.Text = "⚡ VERSION EXPÉRIMENTALE - UTILISEZ AVEC PRÉCAUTION ⚡"
warningLabel.Parent = mainFrame

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(0, 300, 0, 30)
creditLabel.Position = UDim2.new(1, -310, 1, -25)
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 16
creditLabel.TextXAlignment = Enum.TextXAlignment.Right
creditLabel.Text = "✨ Script créé par Prostone"
creditLabel.Parent = mainFrame

-- Animation d'apparition du panneau
TweenService:Create(mainFrame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.1
}):Play()

-- EXECUTOR
local cyberseallExecutor = "unknown"
pcall(function()
    if identifyexecutor then
        cyberseallExecutor = identifyexecutor():lower()
    end
end)

print("Running on executor:", cyberseallExecutor)

local cyberseallSuccess, cyberseallQueueCandidate = pcall(function()
    return (syn and syn.queue_on_teleport)
        or queue_on_teleport
        or (fluxus and fluxus.queue_on_teleport)
end)
local cyberseallQueueOnTp = cyberseallSuccess and cyberseallQueueCandidate or function(...) end

-- REMOTES
local cyberseallRemotesRoot1        = ReplicatedStorage:WaitForChild("Remotes")
local cyberseallRemotePromiseFolder = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("RemotePromise")
local cyberseallRemotesRoot2        = cyberseallRemotePromiseFolder:WaitForChild("Remotes")
local cyberseallEndDecisionRemote   = cyberseallRemotesRoot1:WaitForChild("EndDecision")

local cyberseallHasPromise = true
local cyberseallRemotePromiseMod
do
    local ok, mod = pcall(function()
        return require(cyberseallRemotePromiseFolder)
    end)
    if ok and mod then
        cyberseallRemotePromiseMod = mod
    else
        cyberseallHasPromise = false
        warn("RemotePromise not available – using direct remotes")
    end
end

if cyberseallExecutor:find("swift") then
    cyberseallHasPromise = false
    warn("Swift detected – disabling RemotePromise support")
end

-- ACTIVATE REMOTE
local cyberseallPossibleNames = { "C_ActivateObject", "S_C_ActivateObject" }
local cyberseallActivateName, cyberseallActivateRemote
for _, name in ipairs(cyberseallPossibleNames) do
    local candidate = cyberseallRemotesRoot2:FindFirstChild(name)
                   or cyberseallRemotesRoot1:FindFirstChild(name)
    if candidate then
        cyberseallActivateName   = name
        cyberseallActivateRemote = candidate
        break
    end
end
assert(cyberseallActivateRemote,
       "No Remote '" .. table.concat(cyberseallPossibleNames, ", ") .. "' found")

local cyberseallActivate
if cyberseallHasPromise and cyberseallRemotesRoot2:FindFirstChild(cyberseallActivateName) then
    cyberseallActivate = cyberseallRemotePromiseMod.new(cyberseallActivateName)
else
    if cyberseallActivateRemote:IsA("RemoteFunction") then
        cyberseallActivate = {
            InvokeServer = function(_, ...) return cyberseallActivateRemote:InvokeServer(...) end
        }
    elseif cyberseallActivateRemote:IsA("RemoteEvent") then
        cyberseallActivate = {
            InvokeServer = function(_, ...) return cyberseallActivateRemote:FireServer(...) end
        }
    else
        error(cyberseallActivateName .. " is not a RemoteFunction or RemoteEvent!")
    end
end

-- BOND DETECTION
local cyberseallBondData = {}
local cyberseallSeenKeys = {}

local function cyberseallRecordBonds()
    local runtime = WorkspaceService:WaitForChild("RuntimeItems")
    for _, item in ipairs(runtime:GetChildren()) do
        if item.Name:match("Bond") then
            local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
            if part then
                local key = ("%.1f_%.1f_%.1f"):format(
                    part.Position.X, part.Position.Y, part.Position.Z
                )
                if not cyberseallSeenKeys[key] then
                    cyberseallSeenKeys[key] = true
                    table.insert(cyberseallBondData, { item = item, pos = part.Position })
                end
            end
        end
    end
end

-- SCAN
local startTime = os.time()
print("=== Starting map scan ===")
statusLabel.Text = "📡 Scan de la map en cours...\n⏳ Veuillez patienter pendant l'analyse"
TweenService:Create(glowEffect, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1), {
    ImageTransparency = 0.7
}):Play()
local cyberseallScanTarget = CFrame.new(-424.448975, 26.055481, -49040.6562)
local cyberseallScanSteps = 50
for i = 1, cyberseallScanSteps do
    cyberseallHrp.CFrame = cyberseallHrp.CFrame:Lerp(cyberseallScanTarget, i/cyberseallScanSteps)
    task.wait(0.3)
    cyberseallRecordBonds()
    task.wait(0.1)
end
cyberseallHrp.CFrame = cyberseallScanTarget
task.wait(0.3)
cyberseallRecordBonds()

print(("→ %d Bonds found"):format(#cyberseallBondData))
if #cyberseallBondData == 0 then
    warn("No bonds found – check RuntimeItems")
    return
end

-- CHAIR
local cyberseallChair = WorkspaceService:WaitForChild("RuntimeItems"):FindFirstChild("Chair")
assert(cyberseallChair and cyberseallChair:FindFirstChild("Seat"), "Chair.Seat not found")
local cyberseallSeat = cyberseallChair.Seat

cyberseallSeat:Sit(cyberseallHumanoid)
task.wait(0.2)
local cyberseallSeatWorks = (cyberseallHumanoid.SeatPart == cyberseallSeat)

-- BOND COLLECTION LOOP
for index, cyberseallEntry in ipairs(cyberseallBondData) do
    local targetPos = cyberseallEntry.pos + Vector3.new(0, 2, 0)
    if cyberseallSeatWorks then
        cyberseallSeat:PivotTo(CFrame.new(targetPos))
        task.wait(0.1)
        if cyberseallHumanoid.SeatPart ~= cyberseallSeat then
            cyberseallSeat:Sit(cyberseallHumanoid)
            task.wait(0.1)
        end
    else
        cyberseallHrp.CFrame = CFrame.new(targetPos)
        task.wait(0.1)
    end

    local ok, err = pcall(function()
        cyberseallActivate:InvokeServer(cyberseallEntry.item)
    end)
    if not ok then
        warn("InvokeServer failed:", err)
    end

    task.wait(0.5)

    if not cyberseallEntry.item.Parent then
        local currentTime = os.time() - startTime
        local bondsPerSecond = index / (currentTime > 0 and currentTime or 1)
        local remainingBonds = #cyberseallBondData - index
        local estimatedTimeRemaining = math.ceil(remainingBonds / bondsPerSecond)
        
        print(("Bond %d/%d collected"):format(index, #cyberseallBondData))
        statusLabel.Text = ("🎯 Progression : %d/%d\n💫 Collection en cours...\n⏳ Temps restant estimé: %ds"):format(
            index, 
            #cyberseallBondData,
            estimatedTimeRemaining
        )
        bondsCollected.Text = string.format("🎯 Bonds: %d/%d", index, #cyberseallBondData)
        timeElapsed.Text = string.format("⏱️ Temps total: %ds | Temps/bond: %.1fs", currentTime, currentTime/index)
        efficiency.Text = string.format("⚡ Vitesse: %.1f bonds/s", bondsPerSecond)
        
        TweenService:Create(stroke, TweenInfo.new(0.5), {
            Color = Color3.fromRGB(0, 255, math.random(80, 255))
        }):Play()
    else
        warn("Not collected – timeout? Or check path!")
    end
end

cyberseallHumanoid:TakeDamage(999999)
cyberseallEndDecisionRemote:FireServer(false)
cyberseallQueueOnTp("PUT YOUR SCRIPT HERE")

statusLabel.Text = ("✅ Tous les Bonds (%d) ont été collectés.\nScript terminé."):format(#cyberseallBondData)
print("=== Script finished ===")
