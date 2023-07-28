-- // Usage

--[[

local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/loader_library/src.lua"))()

Loader:Create({
    Name = "Evolution",
    ImageID = "rbxassetid://14222444137",
    SaveKey = true,
    Callback = function(EnteredKey) 
        if EnteredKey == "xzisthebest" then 
            print("Whitelisted")
        else
            print("Invalid Key")
        end
        Loader:Destroy("Evolution")
    end,
})

]]


-- // Loader Library

local Loader = {}

function dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

function Loader:Create(info)
	local name = info.Name
	local image = info.ImageID
	local savekey = info.SaveKey
	local callback = info.Callback 
	
	if game.CoreGui:FindFirstChild(name) then
		game.CoreGui:FindFirstChild(name):Destroy()
	end
	
	if isfile(name..".key") then
		writefile(name..".key")
	end
	-- // UI
	
	local Login = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Image = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local AuthKey = Instance.new("Frame")
	local TextBox = Instance.new("TextBox")
	local Hidden = Instance.new("TextLabel")
	local UICorner_2 = Instance.new("UICorner")
	local ImageButton = Instance.new("ImageButton")
	local Load = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")

	Login.Name = name
	Login.Parent = game.CoreGui
	Login.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Login
	Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.320512831, 0, 0.360148519, 0)
	Main.Size = UDim2.new(0, 447, 0, 113)

	UICorner.Parent = Main

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(42, 42, 42))}
	UIGradient.Rotation = 90
	UIGradient.Parent = Main

	Image.Name = "Image"
	Image.Parent = Main
	Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Image.BackgroundTransparency = 1.000
	Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Image.BorderSizePixel = 0
	Image.Position = UDim2.new(0.0134228189, 0, 0.0240963846, 0)
	Image.Size = UDim2.new(0, 28, 0, 28)
	Image.Image = image

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.140939593, 0, 0.0240963846, 0)
	Title.Size = UDim2.new(0, 321, 0, 28)
	Title.Font = Enum.Font.Gotham
	Title.Text = name.." Login"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 16.000

	AuthKey.Name = "AuthKey"
	AuthKey.Parent = Main
	AuthKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	AuthKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AuthKey.BorderSizePixel = 0
	AuthKey.Position = UDim2.new(0.0850111842, 0, 0.332265407, 0)
	AuthKey.Size = UDim2.new(0, 371, 0, 25)

	TextBox.Parent = AuthKey
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 1.000
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.086170949, 0, 0, 0)
	TextBox.Size = UDim2.new(0, 335, 0, 25)
	TextBox.Font = Enum.Font.Gotham
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(25, 25, 25)
	TextBox.TextSize = 14.000
	TextBox.TextTransparency = 1.000
	TextBox.TextXAlignment = Enum.TextXAlignment.Left

	Hidden.Name = "Hidden"
	Hidden.Parent = TextBox
	Hidden.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Hidden.BackgroundTransparency = 1.000
	Hidden.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Hidden.BorderSizePixel = 0
	Hidden.Position = UDim2.new(-0.00588788232, 0, 0, 0)
	Hidden.Size = UDim2.new(0, 337, 0, 25)
	Hidden.Font = Enum.Font.Gotham
	Hidden.Text = "Key"
	Hidden.TextColor3 = Color3.fromRGB(255, 255, 255)
	Hidden.TextSize = 14.000
	Hidden.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = AuthKey

	ImageButton.Parent = AuthKey
	ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BackgroundTransparency = 1.000
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(0.0404312685, 0, 0.479999989, 0)
	ImageButton.Size = UDim2.new(0, 15, 0, 15)
	ImageButton.Image = "rbxassetid://10723416652"

	Load.Name = "Load"
	Load.Parent = Main
	Load.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	Load.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Load.BorderSizePixel = 0
	Load.Position = UDim2.new(0.275167793, 0, 0.610854983, 0)
	Load.Size = UDim2.new(0, 200, 0, 34)
	Load.Font = Enum.Font.Gotham
	Load.Text = "Login"
	Load.TextColor3 = Color3.fromRGB(255, 255, 255)
	Load.TextSize = 14.000

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = Load

	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		Hidden.Text = string.rep('•', #TextBox.text)
	end)
	
	
	Load.MouseButton1Click:Connect(function()
		if savekey then
			writefile(name..".key",TextBox.Text)
		end
		task.spawn(callback,TextBox.Text)
	end)
	
	if savekey then
		TextBox.Text = readfile(name..".key")
	end

	dragify(Main)
	
end

function Loader:Delete(name)
	if game.CoreGui:FindFirstChild(name) then
		game.CoreGui:FindFirstChild(name):Destroy()
	else
		error("[Loader]: Could not be found.")
	end
end

return Loader
