-- Create the main UI elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabButton = Instance.new("TextButton")
local TabFrame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")

-- Parent to player's PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Set up the main frame
MainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Parent = ScreenGui

-- Set up the tab button
TabButton.Size = UDim2.new(0, 200, 0, 50)
TabButton.Position = UDim2.new(0.5, -100, 0, 0)
TabButton.Text = "Open Google"
TabButton.Parent = MainFrame

-- Set up the tab frame (simulated browser tab)
TabFrame.Size = UDim2.new(1, 0, 1, -50)
TabFrame.Position = UDim2.new(0, 0, 0, 50)
TabFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
TabFrame.Parent = MainFrame
TabFrame.Visible = false

-- Set up the text label (simulating the google.com webpage)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Text = "Simulated Google.com"
TextLabel.TextSize = 30
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Parent = TabFrame

-- Button click function to show the tab
TabButton.MouseButton1Click:Connect(function()
    TabFrame.Visible = true
    TextLabel.Text = "Welcome to Google.com (Simulated)"
end)
