-- Tạo UI và các thành phần
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo khung chứa menu
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0, 100, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)  -- Màu nền cho khung
frame.Parent = screenGui

-- Thêm TextLabel cho tên menu
local menuTitle = Instance.new("TextLabel")
menuTitle.Text = "My Browser Menu"  -- Tên menu
menuTitle.Size = UDim2.new(0, 300, 0, 30)
menuTitle.BackgroundColor3 = Color3.fromRGB(0, 128, 255)  -- Màu nền tiêu đề
menuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
menuTitle.TextScaled = true
menuTitle.TextAlign = Enum.TextAnchor.MiddleCenter
menuTitle.Parent = frame

-- Tạo nút "Go to Google"
local browserButton = Instance.new("TextButton")
browserButton.Text = "Go to Google"
browserButton.Size = UDim2.new(0, 300, 0, 40)
browserButton.Position = UDim2.new(0, 0, 0, 40)
browserButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
browserButton.TextColor3 = Color3.fromRGB(255, 255, 255)
browserButton.TextScaled = true
browserButton.Parent = frame

-- Tạo ô nhập tìm kiếm
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 300, 0, 40)
searchBox.Position = UDim2.new(0, 0, 0, 80)
searchBox.PlaceholderText = "Search a website..."
searchBox.Parent = frame

-- Xử lý chức năng mở Google
browserButton.MouseButton1Click:Connect(function()
    local searchQuery = searchBox.Text
    local url = "https://www.google.com/search?q=" .. searchQuery
    print("Opening: " .. url)
    -- Tại đây, bạn có thể thực hiện hành động khác để mở trang web, nhưng Roblox không hỗ trợ trình duyệt web trực tiếp.
end)

-- Tạo khả năng di chuyển UI với cảm ứng
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Tạo khả năng thay đổi kích thước menu
local resizing = false
local initialSize, initialTouchPos

-- Chạm vào góc để thay đổi kích thước
local resizeCorner = Instance.new("TextButton")
resizeCorner.Size = UDim2.new(0, 20, 0, 20)
resizeCorner.Position = UDim2.new(1, -20, 1, -20)
resizeCorner.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
resizeCorner.Text = "+"
resizeCorner.TextColor3 = Color3.fromRGB(255, 255, 255)
resizeCorner.Parent = frame

resizeCorner.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        resizing = true
        initialSize = frame.Size
        initialTouchPos = input.Position
    end
end)

resizeCorner.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - initialTouchPos
        local newSize = UDim2.new(0, initialSize.X.Offset + delta.X, 0, initialSize.Y.Offset + delta.Y)
        frame.Size = newSize
    end
end)

resizeCorner.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        resizing = false
    end
end)

-- Tạo chức năng ẩn/hiện UI
local toggleButton = Instance.new("TextButton")
toggleButton.Text = "Toggle Menu"
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 0, 0, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true
toggleButton.Parent = screenGui

toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
