-- 加载 Kavo UI 库
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- 创建主窗口（标题，主题）
local Window = Library.CreateLib("我的脚本菜单", "DarkTheme")

-- 创建标签页
local MainTab = Window:NewTab("主要功能")
local SettingsTab = Window:NewTab("设置")

-- 在主要功能下创建分区
local PlayerSection = MainTab:NewSection("玩家功能")
local MiscSection = MainTab:NewSection("其他")

-- 在设置下创建分区
local ThemeSection = SettingsTab:NewSection("界面")

-- ===== 标签 =====
local infoLabel = PlayerSection:NewLabel("当前状态：就绪")
infoLabel:UpdateLabel("当前状态：已加载")

-- ===== 按钮 =====
PlayerSection:NewButton("点击测试", "点击后会在控制台输出信息", function()
    print("按钮被点击了")
    infoLabel:UpdateLabel("当前状态：按钮已点击")
end)

-- ===== 开关 =====
local infJumpEnabled = false
PlayerSection:NewToggle("无限跳跃", "开启后可以无限次跳跃", function(state)
    infJumpEnabled = state
    print("无限跳跃：" .. (state and "开启" or "关闭"))
end)

-- 无限跳跃的实现（简单版，通过监听跳跃请求）
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled then
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- ===== 滑动条 =====
PlayerSection:NewSlider("移动速度", "调整角色的行走速度", 200, 16, function(value)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = value
    end
    infoLabel:UpdateLabel("当前速度：" .. tostring(value))
end)

-- ===== 另一个按钮（辅助功能） =====
MiscSection:NewButton("重置角色", "重新生成你的角色", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").Health = 0
    end
end)

-- ===== 设置页的开关 =====
ThemeSection:NewToggle("隐藏菜单", "点击按钮或快捷键控制", function(state)
    if state then
        Library:ToggleUI()
    end
end)
