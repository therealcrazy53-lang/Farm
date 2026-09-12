-- [[ GhostyFy Ultimate 50M AFK Farm ]] --

pcall(function()
    if queue_on_teleport then
        queue_on_teleport([[
            task.wait(3)
            loadstring(game:HttpGet("AQUÍ_VAS_A_PONER_TU_ENLACE_RAW"))()
        ]])
    end
end)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

print("--- [ GHOSTYFY: AFK Farm 50M Activo ] ---")

task.spawn(function()
    while true do
        local character = Player.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        
        if hrp then
            local stages = {}
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and string.find(string.lower(obj.Name), "stage") then
                    table.insert(stages, obj)
                end
            end
            
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
