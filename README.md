-- Create a ScreenGui to hold the UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame to hold the UI elements
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = screenGui

-- Create a label for the Discord link
local discordLinkLabel = Instance.new("TextLabel")
discordLinkLabel.Text = "https://discord.gg/ns3HNnxGU3"
discordLinkLabel.Size = UDim2.new(1, 0, 0, 30)
discordLinkLabel.Position = UDim2.new(0, 0, 0, 10)
discordLinkLabel.BackgroundTransparency = 1
discordLinkLabel.TextColor3 = Color3.new(1, 1, 1)
discordLinkLabel.TextSize = 18
discordLinkLabel.Font = Enum.Font.SourceSansBold
discordLinkLabel.Parent = frame

-- Create a "Join Discord" button
local joinDiscordButton = Instance.new("TextButton")
joinDiscordButton.Text = "Join Discord"
joinDiscordButton.Size = UDim2.new(1, 0, 0, 30)
joinDiscordButton.Position = UDim2.new(0, 0, 0, 50)
joinDiscordButton.BackgroundTransparency = 0.5
joinDiscordButton.BackgroundColor3 = Color3.new(0, 0, 0)
joinDiscordButton.TextColor3 = Color3.new(1, 1, 1)
joinDiscordButton.TextSize = 18
joinDiscordButton.Font = Enum.Font.SourceSansBold
joinDiscordButton.Parent = frame

-- Create an "X" button to close the UI
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundTransparency = 0.5
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = frame

-- Function to copy the Discord link to the clipboard
local function copyToClipboard()
    local Clipboard = require(game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Clipboard"))
    Clipboard.set("https://discord.gg/ns3HNnxGU3")
    print("Discord link copied to clipboard!")
end

-- Function to close the UI
local function closeUI()
    frame.Visible = false
end

-- Connect the "Join Discord" button to copy the link when clicked
joinDiscordButton.MouseButton1Click:Connect(copyToClipboard)

-- Connect the "X" button to close the UI when clicked
closeButton.MouseButton1Click:Connect(closeUI)

-- Function to toggle the UI visibility
local function toggleUIVisibility()
    frame.Visible = not frame.Visible
end

-- Connect the "B" key to toggle the UI visibility
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.B then
        toggleUIVisibility()
    end
end)
