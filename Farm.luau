-- [[ GhostyFy Ultimate 50M AFK Farm - Auto-Execute Blindado ]] --

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local Player = Players.LocalPlayer

-- El truco de Infinite Yield para auto-ejecutarse en cada reinicio/rejoin
local function injectSelf()
    pcall(function()
        local queueFunc = queue_on_teleport or (syn and syn.queue_on_teleport)
        if queueFunc then
            queueFunc([[
                task.wait(3)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/therealcrazy53-lang/Farm/main/Farm.luau"))()
            ]])
        end
    end)
end

-- Ejecutar la persistencia de inmediato
injectSelf()

print("--- [ GHOSTYFY: AFK Farm 50M Iniciado ] ---")

task.spawn(function()
    while true do
        local character = Player.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        
        if hrp then
            -- 1. Buscar todos los stages
            local stages = {}
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and string.find(string.lower(obj.Name), "stage") then
                    table.insert(stages, obj)
                end
            end
            
            -- Ordenar numéricamente (1 al 66)
            table.sort(stages, function(a, b)
                local numA = tonumber(string.match(a.Name, "%d+")) or 0
                local numB = tonumber(string.match(b.Name, "%d+")) or 0
                return numA < numB
            end)
            
            -- 2. Recorrer los stages a velocidad de 0.07s
            local reachedStage66 = false
            for _, stagePart in ipairs(stages) do
                local currentHrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if currentHrp and stagePart then
                    currentHrp.CFrame = stagePart.CFrame + Vector3.new(0, 3, 0)
                    
                    local stageNum = tonumber(string.match(stagePart.Name, "%d+"))
                    if stageNum and stageNum >= 66 then
                        reachedStage66 = true
                        task.wait(0.2)
                        break
                    end
                    
                    task.wait(0.07)
                end
            end
            
            -- 3. Llegar al final y tocar "mybloque"
            if reachedStage66 then
                task.wait(0.3)
                local bloquePart = nil
                
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and string.lower(obj.Name) == "mybloque" then
                        bloquePart = obj
                        break
                    end
                end
                
                if bloquePart then
                    local currentHrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                    if currentHrp then
                        currentHrp.CFrame = bloquePart.CFrame + Vector3.new(0, 3, 0)
                        task.wait(0.4)
                        
                        -- Activar Prompt o Touch de la Toolbox
                        for _, child in ipairs(bloquePart:GetDescendants()) do
                            if child:IsA("ProximityPrompt") then
                                fireproximityprompt(child)
                            elseif child:IsA("TouchTransmitter") then
                                firetouchinterest(currentHrp, bloquePart, 0)
                                firetouchinterest(currentHrp, bloquePart, 1)
                            end
                        end
                    end
                end
                task.wait(1)
            end
        end
        
        task.wait(0.5)
    end
end)
            
            table.sort(stages, function(a, b)
                local numA = tonumber(string.match(a.Name, "%d+")) or 0
                local numB = tonumber(string.match(b.Name, "%d+")) or 0
                return numA < numB
            end)
            
            local reachedStage66 = false
            for _, stagePart in ipairs(stages) do
                local currentHrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if currentHrp and stagePart then
                    currentHrp.CFrame = stagePart.CFrame + Vector3.new(0, 3, 0)
                    
                    local stageNum = tonumber(string.match(stagePart.Name, "%d+"))
                    if stageNum and stageNum >= 66 then
                        reachedStage66 = true
                        task.wait(0.2)
                        break
                    end
                    
                    task.wait(0.07)
                end
            end
            
            if reachedStage66 then
                task.wait(0.3)
                local bloquePart = nil
                
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and string.lower(obj.Name) == "mybloque" then
                        bloquePart = obj
                        break
                    end
                end
                
                if bloquePart then
                    local currentHrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                    if currentHrp then
                        currentHrp.CFrame = bloquePart.CFrame + Vector3.new(0, 3, 0)
                        task.wait(0.4)
                        
                        for _, child in ipairs(bloquePart:GetDescendants()) do
                            if child:IsA("ProximityPrompt") then
                                fireproximityprompt(child)
                            elseif child:IsA("TouchTransmitter") then
                                firetouchinterest(currentHrp, bloquePart, 0)
                                firetouchinterest(currentHrp, bloquePart, 1)
                            end
                        end
                    end
                end
                task.wait(1)
            end
        end
        
        task.wait(0.5)
    end
end)
