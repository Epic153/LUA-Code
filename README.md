-- Create a ScreenGui to hold the UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame to hold the UI elements
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundTransparency = 0.7
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Create a label for the Discord link
local discordLinkLabel = Instance.new("TextLabel")
discordLinkLabel.Text = "Join our Discord!"
discordLinkLabel.Size = UDim2.new(1, 0, 0, 30)
discordLinkLabel.Position = UDim2.new(0, 0, 0, 10)
discordLinkLabel.BackgroundTransparency = 1
discordLinkLabel.TextColor3 = Color3.new(1, 1, 1)
discordLinkLabel.TextSize = 18
discordLinkLabel.Font = Enum.Font.GothamBold
discordLinkLabel.Parent = frame

-- Create a label for the Discord link URL
local discordLinkURL = Instance.new("TextLabel")
discordLinkURL.Text = "https://discord.gg/ns3HNnxGU3"
discordLinkURL.Size = UDim2.new(1, 0, 0, 30)
discordLinkURL.Position = UDim2.new(0, 0, 0, 50)
discordLinkURL.BackgroundTransparency = 1
discordLinkURL.TextColor3 = Color3.new(1, 1, 1)
discordLinkURL.TextSize = 14
discordLinkURL.Font = Enum.Font.Gotham
discordLinkURL.Parent = frame

-- Create a "Join Discord" button
local joinDiscordButton = Instance.new("TextButton")
joinDiscordButton.Text = "Join"
joinDiscordButton.Size = UDim2.new(0.8, 0, 0, 40)
joinDiscordButton.Position = UDim2.new(0.1, 0, 0, 90)
joinDiscordButton.BackgroundTransparency = 0.3
joinDiscordButton.BackgroundColor3 = Color3.new(0.1, 0.6, 1)
joinDiscordButton.TextColor3 = Color3.new(1, 1, 1)
joinDiscordButton.TextSize = 20
joinDiscordButton.Font = Enum.Font.GothamSemibold
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
closeButton.Font = Enum.Font.GothamBold
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
