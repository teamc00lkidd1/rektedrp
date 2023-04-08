local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/teamc00lkidd1/rektedrp/main/uiengine.lua"))()

local name = "RektedRP"

if identifyexecutor then
    name = name .. " - " .. identifyexecutor()
end

local WindowOptions = {
    min_size = Vector2.new(500, 400),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true
}

local Window = library:AddWindow(name, WindowOptions)
local trol = Window:AddTab("Main")

local Box = trol:AddTextBox("Text", nil, {["clear"] = false})
trol:AddSwitch(
    "Loop Name All",
    function(on)
        _G.LoopNameAllEnabled = on
    end
)
trol:AddSwitch(
    "Loop Spam F3X Logs",
    function(on)
        _G.F3xLogSpamEnabled = on
    end
)
trol:AddSwitch(
    "Invisfling",
    function(on)
        if on == true then
            local ch = game:GetService("Players").LocalPlayer.Character
            local prt = Instance.new("Model")
            prt.Parent = game:GetService("Players").LocalPlayer.Character
            local z1 = Instance.new("Part")
            z1.Name = "Torso"
            z1.CanCollide = false
            z1.Anchored = true
            local z2 = Instance.new("Part")
            z2.Name = "Head"
            z2.Parent = prt
            z2.Anchored = true
            z2.CanCollide = false
            local z3 = Instance.new("Humanoid")
            z3.Name = "Humanoid"
            z3.Parent = prt
            z1.Position = Vector3.new(0, 9999, 0)
            game:GetService("Players").LocalPlayer.Character = prt
            wait(3)
            game:GetService("Players").LocalPlayer.Character = ch
            wait(3)
            local Hum = Instance.new("Humanoid")
            z2:Clone()
            Hum.Parent = game:GetService("Players").LocalPlayer.Character
            local root = getRoot(game:GetService("Players").LocalPlayer.Character)
            for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if v ~= root and v.Name ~= "Humanoid" then
                    v:Destroy()
                end
            end
            root.Transparency = 0
            root.Color = Color3.new(1, 1, 1)
            local invisflingStepped
            invisflingStepped =
                game:GetService("RunService").Stepped:Connect(
                function()
                    if
                        game:GetService("Players").LocalPlayer.Character and
                            getRoot(game:GetService("Players").LocalPlayer.Character)
                     then
                        getRoot(game:GetService("Players").LocalPlayer.Character).CanCollide = false
                    else
                        invisflingStepped:Disconnect()
                    end
                end
            )
            repeat
                wait()
            until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
                getRoot(game:GetService("Players").LocalPlayer.Character) and
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            repeat
                wait()
            until mouse
            if flyKeyDown or flyKeyUp then
                flyKeyDown:Disconnect()
                flyKeyUp:Disconnect()
            end

            local T = getRoot(game:GetService("Players").LocalPlayer.Character)
            local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            local SPEED = 0

            local function FLY()
                FLYING = true
                local BG = Instance.new("BodyGyro")
                local BV = Instance.new("BodyVelocity")
                BG.P = 9e4
                BG.Parent = T
                BV.Parent = T
                BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                BG.cframe = T.CFrame
                BV.velocity = Vector3.new(0, 0, 0)
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
                spawn(
                    function()
                        repeat
                            wait()
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand =
                                    true
                            end
                            if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                                SPEED = 50
                            elseif
                                not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or
                                    CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0
                             then
                                SPEED = 0
                            end
                            if
                                (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or
                                    (CONTROL.Q + CONTROL.E) ~= 0
                             then
                                BV.velocity =
                                    ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) +
                                    ((workspace.CurrentCamera.CoordinateFrame *
                                        CFrame.new(
                                            CONTROL.L + CONTROL.R,
                                            (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                            0
                                        ).p) -
                                        workspace.CurrentCamera.CoordinateFrame.p)) *
                                    SPEED
                                lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                            elseif
                                (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and
                                    (CONTROL.Q + CONTROL.E) == 0 and
                                    SPEED ~= 0
                             then
                                BV.velocity =
                                    ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) +
                                    ((workspace.CurrentCamera.CoordinateFrame *
                                        CFrame.new(
                                            lCONTROL.L + lCONTROL.R,
                                            (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                            0
                                        ).p) -
                                        workspace.CurrentCamera.CoordinateFrame.p)) *
                                    SPEED
                            else
                                BV.velocity = Vector3.new(0, 0, 0)
                            end
                            BG.cframe = workspace.CurrentCamera.CoordinateFrame
                        until not FLYING
                        CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                        lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                        SPEED = 0
                        BG:Destroy()
                        BV:Destroy()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand =
                                false
                        end
                    end
                )
            end
            flyKeyDown =
                mouse.KeyDown:connect(
                function(KEY)
                    if KEY:lower() == "w" then
                        CONTROL.F = 1
                    elseif KEY:lower() == "s" then
                        CONTROL.B = -1
                    elseif KEY:lower() == "a" then
                        CONTROL.L = -1
                    elseif KEY:lower() == "d" then
                        CONTROL.R = 1
                    elseif KEY:lower() == "e" then
                        CONTROL.Q = 2
                    elseif KEY:lower() == "q" then
                        CONTROL.E = -2
                    end
                end
            )
            flyKeyUp =
                mouse.KeyUp:Connect(
                function(KEY)
                    if KEY:lower() == "w" then
                        CONTROL.F = 0
                    elseif KEY:lower() == "s" then
                        CONTROL.B = 0
                    elseif KEY:lower() == "a" then
                        CONTROL.L = 0
                    elseif KEY:lower() == "d" then
                        CONTROL.R = 0
                    elseif KEY:lower() == "e" then
                        CONTROL.Q = 0
                    elseif KEY:lower() == "q" then
                        CONTROL.E = 0
                    end
                end
            )
            FLY()
            workspace.CurrentCamera.CameraSubject = root
            local bambam = Instance.new("BodyThrust")
            bambam.Parent = getRoot(game:GetService("Players").LocalPlayer.Character)
            bambam.Force = Vector3.new(99999, 99999 * 10, 99999)
            bambam.Location = getRoot(game:GetService("Players").LocalPlayer.Character).Position
        else
            local char = game:GetService("Players").LocalPlayer.Character
            if char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid"):ChangeState(15)
            end
            char:ClearAllChildren()
            local newChar = Instance.new("Model")
            newChar.Parent = workspace
            game:GetService("Players").LocalPlayer.Character = newChar
            wait()
            game:GetService("Players").LocalPlayer.Character = char
            newChar:Destroy()
        end
    end
)
trol:AddSwitch(
    "Spam",
    function(on)
        _G.SpamOn = on
        while _G.SpamOn do
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                Box.Text,
                "All"
            )
            wait(2.2)
        end
    end
)
local log
for i, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
    if v.Name == "AddLog" and v:IsA("RemoteEvent") then
        log = v
    end
end
game:GetService("RunService").RenderStepped:connect(function()
    if _G.LoopNameAllEnabled then
        for i, v in pairs(workspace:GetDescendants()) do
            if v:IsA("RemoteEvent") and v.Parent.ClassName == "Model" and v.Parent.Parent.ClassName == "Model" then
                v:FireServer(Box.Text)
            end
        end
    end
    if _G.F3xLogSpamEnabled then
        if log == nil then return end
        log:FireServer({
            ["Text"] = Box.Text,
            ["Count"] = 1,
            ["F3XHistoryLog"] = {
                ["ToolName"] = "delete",
                ["Apply"] = function()end
            }
        })
    end
end)