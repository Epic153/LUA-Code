local Library = {}

-- Define default properties for the UI elements
local defaultSettings = {
    Window = {
        Draggable = true,
        Resizable = true,
        MinWidth = 200,
        MinHeight = 150,
    },
    Button = {
        TextColor = Color3.fromRGB(255, 255, 255),
        BackgroundColor = Color3.fromRGB(85, 170, 255),
        Size = UDim2.new(0, 100, 0, 30),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
    },
    TextBox = {
        TextColor = Color3.fromRGB(0, 0, 0),
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(0, 150, 0, 30),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
    },
}

-- Create a new window with customizable settings
function Library.CreateWindow(name, parent, settings)
    settings = settings or {}
    local window = Instance.new("Frame")
    window.Name = name
    window.Size = UDim2.new(0, 300, 0, 200)
    window.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    window.BorderSizePixel = 0
    window.Position = UDim2.new(0.5, -150, 0.5, -100)
    window.AnchorPoint = Vector2.new(0.5, 0.5)

    local titleBar = Instance.new("Frame", window)
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0

    local titleText = Instance.new("TextLabel", titleBar)
    titleText.Size = UDim2.new(1, -10, 1, 0)
    titleText.Position = UDim2.new(0, 5, 0, 0)
    titleText.Text = name
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.Font = Enum.Font.SourceSans
    titleText.TextSize = 18
    titleText.TextXAlignment = Enum.TextXAlignment.Left

    if settings.Draggable then
        -- Make the window draggable
        local dragging
        titleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                local initialPosition = input.Position
                local initialOffset = window.Position - UDim2.new(0, initialPosition.X, 0, initialPosition.Y)
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local newPosition = UDim2.new(0, input.Position.X, 0, input.Position.Y) + initialOffset
                        window.Position = newPosition
                    end
                end)
            end
        end)
    end

    if settings.Resizable then
        -- Make the window resizable
        local resizing
        local initialSize
        local initialMouse
        window.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                resizing = true
                initialSize = window.Size
                initialMouse = input.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        resizing = false
                    end
                end)
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local delta = input.Position - initialMouse
                        window.Size = UDim2.new(0, math.max(settings.MinWidth or 0, initialSize.X.Offset + delta.X), 0, math.max(settings.MinHeight or 0, initialSize.Y.Offset + delta.Y))
                    end
                end)
            end
        end)
    end

    window.Parent = parent or game.Players.LocalPlayer.PlayerGui

    return window
end

-- Create a button with customizable settings
function Library.CreateButton(name, parent, settings)
    settings = settings or {}
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = settings.Text or name
    button.Size = settings.Size or defaultSettings.Button.Size
    button.Position = settings.Position or UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = settings.BackgroundColor or defaultSettings.Button.BackgroundColor
    button.TextColor3 = settings.TextColor or defaultSettings.Button.TextColor
    button.Font = settings.Font or defaultSettings.Button.Font
    button.TextSize = settings.TextSize or defaultSettings.Button.TextSize
    button.BorderSizePixel = 0
    button.Parent = parent or game.Players.LocalPlayer.PlayerGui

    return button
end

-- Create a text box with customizable settings
function Library.CreateTextBox(name, parent, settings)
    settings = settings or {}
    local textBox = Instance.new("TextBox")
    textBox.Name = name
    textBox.Size = settings.Size or defaultSettings.TextBox.Size
    textBox.Position = settings.Position or UDim2.new(0, 0, 0, 0)
    textBox.BackgroundColor3 = settings.BackgroundColor or defaultSettings.TextBox.BackgroundColor
    textBox.TextColor3 = settings.TextColor or defaultSettings.TextBox.TextColor
    textBox.Font = settings.Font or defaultSettings.TextBox.Font
    textBox.TextSize = settings.TextSize or defaultSettings.TextBox.TextSize
    textBox.BorderSizePixel = 0
    textBox.Parent = parent or game.Players.LocalPlayer.PlayerGui

    return textBox
end

return Library
