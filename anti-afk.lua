-- ==========================================
-- SCRIPT ANTI-AFK CÓ GIAO DIỆN HIỂN THỊ
-- ==========================================

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Tự động ngăn chặn Idle Kick
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(0, 0))
end)

-- Tạo GUI nhỏ
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AntiAfkGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 70)
Frame.Position = UDim2.new(0, 20, 0, 20)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "🟢 Anti-AFK: BẬT"
Title.TextColor3 = Color3.fromRGB(0, 255, 127)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = Frame

local TimerLabel = Instance.new("TextLabel")
TimerLabel.Size = UDim2.new(1, 0, 0, 30)
TimerLabel.Position = UDim2.new(0, 0, 0, 30)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "Thời gian: 00:00:00"
TimerLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TimerLabel.Font = Enum.Font.Gotham
TimerLabel.TextSize = 13
TimerLabel.Parent = Frame

-- Bộ đếm thời gian
local seconds = 0
task.spawn(function()
    while task.wait(1) do
        seconds = seconds + 1
        local hrs = math.floor(seconds / 3600)
        local mins = math.floor((seconds % 3600) / 60)
        local secs = seconds % 60
        TimerLabel.Text = string.format("Thời gian: %02d:%02d:%02d", hrs, mins, secs)
    end
end)
