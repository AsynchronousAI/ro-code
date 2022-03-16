local Gui = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local Gradient = Instance.new("ImageLabel")
local TextButton2 = Instance.new("TextButton")
local Gradient_2 = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Pattern = Instance.new("ImageLabel")
local UIGradient = Instance.new("UIGradient")

Gui.Name = "Gui"
Gui.Parent = script
Gui.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Gui.Size = UDim2.new(1, 0, 1, 0)

TextBox.Parent = Gui
TextBox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
TextBox.Position = UDim2.new(0.408884853, 0, 0.2729038, 0)
TextBox.Size = UDim2.new(0.176678449, 0, 0.121359222, 0)
TextBox.ZIndex = 5
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.GothamBold
TextBox.PlaceholderText = "Connection Code"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000

UICorner.Parent = TextBox

Gradient.Name = "Gradient"
Gradient.Parent = TextBox
Gradient.Active = true
Gradient.AnchorPoint = Vector2.new(0.5, 0.5)
Gradient.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Gradient.BackgroundTransparency = 1.000
Gradient.BorderSizePixel = 0
Gradient.Position = UDim2.new(0.5, 0, 0.5, 0)
Gradient.Size = UDim2.new(1, 40, 1, 25)
Gradient.ZIndex = 4
Gradient.Image = "rbxassetid://4437071557"
Gradient.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gradient.ImageTransparency = 0.700

TextButton2.Name = "TextButton2"
TextButton2.Parent = Gui
TextButton2.BackgroundColor3 = Color3.fromRGB(61, 175, 92)
TextButton2.Position = UDim2.new(0.408884853, 0, 0.444690228, 0)
TextButton2.Size = UDim2.new(0.176678449, 0, 0.121359222, 0)
TextButton2.ZIndex = 5
TextButton2.Font = Enum.Font.GothamBold
TextButton2.Text = "Connect"
TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton2.TextSize = 14.000

Gradient_2.Name = "Gradient"
Gradient_2.Parent = TextButton2
Gradient_2.Active = true
Gradient_2.AnchorPoint = Vector2.new(0.5, 0.5)
Gradient_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Gradient_2.BackgroundTransparency = 1.000
Gradient_2.BorderSizePixel = 0
Gradient_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Gradient_2.Size = UDim2.new(1, 40, 1, 25)
Gradient_2.ZIndex = 4
Gradient_2.Image = "rbxassetid://4437071557"
Gradient_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gradient_2.ImageTransparency = 0.700

UICorner_2.Parent = TextButton2

TextButton.Parent = Gui
TextButton.BackgroundColor3 = Color3.fromRGB(201, 198, 97)
TextButton.Position = UDim2.new(0.408884853, 0, 0.444690287, 0)
TextButton.Size = UDim2.new(0.176678449, 0, 0.121359222, 0)
TextButton.Visible = false
TextButton.ZIndex = 5
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "Settings"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

UICorner_3.Parent = TextButton

Pattern.Name = "Pattern"
Pattern.Parent = Gui
Pattern.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pattern.BackgroundTransparency = 1.000
Pattern.Size = UDim2.new(1, 0, 1, 0)
Pattern.Image = "rbxassetid://2151782136"
Pattern.ImageTransparency = 0.900
Pattern.ScaleType = Enum.ScaleType.Tile
Pattern.SliceCenter = Rect.new(0, 256, 0, 256)
Pattern.TileSize = UDim2.new(0, 30, 0, 50)

UIGradient.Rotation = 90
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.99), NumberSequenceKeypoint.new(1.00, 0.00)}
UIGradient.Parent = Pattern

return Gui