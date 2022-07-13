local WindowTable = {RainbowColorValue = 0, HueSelectionPosition = 0}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")	
local CloseBind = Enum.KeyCode.RightControl

coroutine.wrap(
	function()
		while wait() do
			WindowTable.RainbowColorValue = WindowTable.RainbowColorValue + 1 / 255
			WindowTable.HueSelectionPosition = WindowTable.HueSelectionPosition + 1

			if WindowTable.RainbowColorValue >= 1 then
				WindowTable.RainbowColorValue = 0
			end

			if WindowTable.HueSelectionPosition == 93 then
				WindowTable.HueSelectionPosition = 0
			end
		end
	end
)()

local WindowTable = {}

function WindowTable:Window(Htitle,GMtitle,toclose)
	local Library = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local MainFrameGlow = Instance.new("Frame")
	local MainFrameGlow1 = Instance.new("ImageLabel")
	local MainFrameGlow2 = Instance.new("ImageLabel")
	local LeftFrame = Instance.new("Frame")
	local LeftFrameBtn = Instance.new("TextButton")
	local LeftFrameBtnIcon = Instance.new("ImageLabel")
	local MainTabs = Instance.new("Frame")
	local MainTabsBtn = Instance.new("TextButton")
	local MainTabsBtnTitle = Instance.new("TextLabel")
	local MainTabsBtnIcon = Instance.new("ImageLabel")
	local Shapes = Instance.new("Frame")
	local Triangle = Instance.new("ImageLabel")
	local Square = Instance.new("ImageLabel")
	local Circle = Instance.new("ImageLabel")
	local SecondaryTabs = Instance.new("Frame")
	local AllTabs = Instance.new("ScrollingFrame")
	local TabsListing = Instance.new("UIListLayout")
	local TabsPadding = Instance.new("UIPadding")
	local Title = Instance.new("TextLabel")
	local ShadowFrame = Instance.new("TextButton")
	local AllPages = Instance.new("Frame")
	local MainFrameCorner = Instance.new("UICorner")
	local LeftFrameCorner = Instance.new("UICorner")
	local LeftFrameLine = Instance.new("Frame")

	LeftFrameLine.Name = "LeftFrameLine"
	LeftFrameLine.Parent = LeftFrame
	LeftFrameLine.BackgroundColor3 = Color3.fromRGB(31, 28, 54)
	LeftFrameLine.BorderSizePixel = 0
	LeftFrameLine.Position = UDim2.new(0.954999983, 0, 0, 0)
	LeftFrameLine.Size = UDim2.new(0, 52, 0, 331)
	LeftFrameLine.ZIndex = 3

	MainFrameCorner.CornerRadius = UDim.new(0, 3)
	MainFrameCorner.Name = "MainFrameCorner"
	MainFrameCorner.Parent = MainFrame

	LeftFrameCorner.CornerRadius = UDim.new(0, 3)
	LeftFrameCorner.Name = "LeftFrameCorner"
	LeftFrameCorner.Parent = LeftFrame
	CloseBind = toclose or Enum.KeyCode.RightControl
	local fs = false
	local uitoggled = false
	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == CloseBind then
				if uitoggled == false then
					TweenService:Create(
						MainFrame,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 0, 0, 0)}
					):Play()
					TweenService:Create(
						MainFrameGlow,
						TweenInfo.new(.32, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 0, 0, 0)}
					):Play()
					TweenService:Create(
						MainFrameGlow1,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{ImageTransparency = 1}
					):Play()
					TweenService:Create(
						MainFrameGlow2,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{ImageTransparency = 1}
					):Play()
					wait(.35)
					ShadowFrame.Visible = false
					uitoggled = true
				else
					if LeftFrame.Size == UDim2.new(0, 144,0, 331) then
						TweenService:Create(
							LeftFrame,
							TweenInfo.new(.0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 41,0, 331)}
						):Play()
						TweenService:Create(
							LeftFrameBtnIcon,
							TweenInfo.new(.0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Rotation = 270}
						):Play()
						TweenService:Create(
							SecondaryTabs,
							TweenInfo.new(.0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 144,0, 0)}
						):Play()
						TweenService:Create(
							MainTabsBtnIcon,
							TweenInfo.new(.0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Rotation = 270}
						):Play()
					end
					TweenService:Create(
						MainFrame,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 448, 0, 331)}
					):Play()
					TweenService:Create(
						MainFrameGlow,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 448, 0, 331)}
					):Play()
					TweenService:Create(
						MainFrameGlow1,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						MainFrameGlow2,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					MainFrameGlow.Visible = true
					uitoggled = false
				end
			end
		end)
	Library.Name = "Library"
	Library.Parent = game.CoreGui
	Library.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Library.ResetOnSpawn = false
	Library.IgnoreGuiInset = false

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = MainFrameGlow
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(21, 18, 45)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0,0.5, 0)
	MainFrame.Size = UDim2.new(0, 0, 0, 0)
	MainFrame.ClipsDescendants = true
	MainFrame.BackgroundTransparency = 0
	
	MainFrameGlow.Name = "MainFrameGlow"
	MainFrameGlow.Parent = Library
	MainFrameGlow.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrameGlow.BackgroundColor3 = Color3.fromRGB(21, 18, 45)
	MainFrameGlow.BackgroundTransparency = 1.000
	MainFrameGlow.BorderSizePixel = 0
	MainFrameGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrameGlow.Size = UDim2.new(0, 0, 0, 0)

	MainFrameGlow1.Name = "MainFrameGlow1"
	MainFrameGlow1.Parent = MainFrameGlow
	MainFrameGlow1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainFrameGlow1.BackgroundTransparency = 1.000
	MainFrameGlow1.Position = UDim2.new(0, -15, 0, -15)
	MainFrameGlow1.Size = UDim2.new(1, 30, 1, 30)
	MainFrameGlow1.ZIndex = 0
	MainFrameGlow1.Image = "rbxassetid://5028857084"
	MainFrameGlow1.ImageColor3 = Color3.fromRGB(21, 20, 45)
	MainFrameGlow1.ScaleType = Enum.ScaleType.Slice
	MainFrameGlow1.SliceCenter = Rect.new(24, 24, 276, 276)
	MainFrameGlow1.ImageTransparency = 1

	MainFrameGlow2.Name = "MainFrameGlow2"
	MainFrameGlow2.Parent = MainFrameGlow
	MainFrameGlow2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainFrameGlow2.BackgroundTransparency = 1.000
	MainFrameGlow2.Position = UDim2.new(0, -15, 0, -15)
	MainFrameGlow2.Size = UDim2.new(1, 30, 1, 30)
	MainFrameGlow2.ZIndex = 0
	MainFrameGlow2.Image = "rbxassetid://5028857084"
	MainFrameGlow2.ImageColor3 = Color3.fromRGB(21, 20, 45)
	MainFrameGlow2.ScaleType = Enum.ScaleType.Slice
	MainFrameGlow2.SliceCenter = Rect.new(24, 24, 276, 276)
	MainFrameGlow2.ImageTransparency = 1
	
	TweenService:Create(
		MainFrame,
		TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Size = UDim2.new(0, 448, 0, 331)}
	):Play()
	TweenService:Create(
		MainFrameGlow,
		TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Size = UDim2.new(0, 448, 0, 331)}
	):Play()
	TweenService:Create(
		MainFrameGlow1,
		TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{ImageTransparency = 0}
	):Play()
	TweenService:Create(
		MainFrameGlow2,
		TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{ImageTransparency = 0}
	):Play()
	
	local pagesFolder = Instance.new("Folder")

	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = AllPages
	
	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = MainFrame
	LeftFrame.BackgroundColor3 = Color3.fromRGB(31, 28, 54)
	LeftFrame.BorderSizePixel = 0
	LeftFrame.ClipsDescendants = true
	LeftFrame.Size = UDim2.new(0, 41, 0, 331)
	LeftFrame.ZIndex = 3
	LeftFrame.Visible = true

	LeftFrameBtn.Name = "LeftFrameBtn"
	LeftFrameBtn.Parent = LeftFrame
	LeftFrameBtn.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
	LeftFrameBtn.BackgroundTransparency = 1.000
	LeftFrameBtn.BorderSizePixel = 0
	LeftFrameBtn.Position = UDim2.new(0, 0, 0.00999999978, 0)
	LeftFrameBtn.Size = UDim2.new(0, 41, 0, 41)
	LeftFrameBtn.ZIndex = 3
	LeftFrameBtn.AutoButtonColor = false
	LeftFrameBtn.Font = Enum.Font.SourceSans
	LeftFrameBtn.Text = ""
	LeftFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	LeftFrameBtn.TextSize = 14.000

	LeftFrameBtnIcon.Name = "LeftFrameBtnIcon"
	LeftFrameBtnIcon.Parent = LeftFrameBtn
	LeftFrameBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftFrameBtnIcon.BackgroundTransparency = 1.000
	LeftFrameBtnIcon.Position = UDim2.new(0.14204666, 0, 0.145281106, 0)
	LeftFrameBtnIcon.Rotation = 270.000
	LeftFrameBtnIcon.Selectable = true
	LeftFrameBtnIcon.Size = UDim2.new(0, 27, 0, 27)
	LeftFrameBtnIcon.ZIndex = 3
	LeftFrameBtnIcon.Image = "rbxassetid://5844057859"

	MainTabs.Name = "MainTabs"
	MainTabs.Parent = LeftFrame
	MainTabs.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainTabs.BackgroundTransparency = 1.000
	MainTabs.BorderSizePixel = 0
	MainTabs.Position = UDim2.new(0, 0, 0.136999995, 0)
	MainTabs.Size = UDim2.new(0, 41, 0, 41)
	MainTabs.ZIndex = 3
	MainTabs.Visible = true

	MainTabsBtn.Name = "MainTabsBtn"
	MainTabsBtn.Parent = MainTabs
	MainTabsBtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
	MainTabsBtn.BackgroundTransparency = 1.000
	MainTabsBtn.Position = UDim2.new(1.04878044, 0, 0.126829565, 0)
	MainTabsBtn.Size = UDim2.new(0, 101, 0, 29)
	MainTabsBtn.ZIndex = 3
	MainTabsBtn.AutoButtonColor = false
	MainTabsBtn.Font = Enum.Font.Gotham
	MainTabsBtn.Text = ""
	MainTabsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainTabsBtn.TextSize = 14.000
	MainTabsBtn.TextXAlignment = Enum.TextXAlignment.Left

	MainTabsBtnTitle.Name = "MainTabsBtnTitle"
	MainTabsBtnTitle.Parent = MainTabsBtn
	MainTabsBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainTabsBtnTitle.BackgroundTransparency = 1.000
	MainTabsBtnTitle.Position = UDim2.new({0, 0},0, 0)
	MainTabsBtnTitle.Size = UDim2.new(0.744, 0,1, 0)
	MainTabsBtnTitle.ZIndex = 3
	MainTabsBtnTitle.Font = Enum.Font.Gotham
	MainTabsBtnTitle.Text = GMtitle
	MainTabsBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainTabsBtnTitle.TextSize = 13.000
	MainTabsBtnTitle.TextWrapped = true
	MainTabsBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

	MainTabsBtnIcon.Name = "MainTabsBtnIcon"
	MainTabsBtnIcon.Parent = MainTabsBtn
	MainTabsBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainTabsBtnIcon.BackgroundTransparency = 1.000
	MainTabsBtnIcon.Position = UDim2.new(0.744000018, 0, 0.128000006, 0)
	MainTabsBtnIcon.Rotation = 270.000
	MainTabsBtnIcon.Selectable = true
	MainTabsBtnIcon.Size = UDim2.new(0, 21, 0, 21)
	MainTabsBtnIcon.ZIndex = 3
	MainTabsBtnIcon.Image = "rbxassetid://5844057859"

	Shapes.Name = "Shapes"
	Shapes.Parent = MainTabs
	Shapes.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
	Shapes.BackgroundTransparency = 1.000
	Shapes.BorderSizePixel = 0
	Shapes.Selectable = true
	Shapes.Size = UDim2.new(0, 41, 0, 41)
	Shapes.ZIndex = 3

	Triangle.Name = "Triangle"
	Triangle.Parent = Shapes
	Triangle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Triangle.BackgroundTransparency = 1.000
	Triangle.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Triangle.Position = UDim2.new(0.423999995, 0, 0.270999998, 0)
	Triangle.Size = UDim2.new(0, 8, 0, 8)
	Triangle.ZIndex = 3
	Triangle.Image = "http://www.roblox.com/asset/?id=2288924051"

	Square.Name = "Square"
	Square.Parent = Shapes
	Square.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Square.BackgroundTransparency = 1.000
	Square.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Square.Position = UDim2.new(0.285780489, 0, 0.49642849, 0)
	Square.Size = UDim2.new(0, 8, 0, 8)
	Square.ZIndex = 3
	Square.Image = "http://www.roblox.com/asset/?id=5118326498"

	Circle.Name = "Circle"
	Circle.Parent = Shapes
	Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Circle.BackgroundTransparency = 1.000
	Circle.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Circle.Position = UDim2.new(0.515999973, 0, 0.495999992, 0)
	Circle.Size = UDim2.new(0, 8, 0, 8)
	Circle.ZIndex = 3
	Circle.Image = "http://www.roblox.com/asset/?id=6631155345"

	SecondaryTabs.Name = "SecondaryTabs"
	SecondaryTabs.Parent = MainTabs
	SecondaryTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SecondaryTabs.BackgroundTransparency = 1.000
	SecondaryTabs.ClipsDescendants = true
	SecondaryTabs.Position = UDim2.new(0, 0,0.976, 0)
	SecondaryTabs.Size = UDim2.new(0, 144, 0, 0)
	SecondaryTabs.ZIndex = 3

	AllTabs.Name = "AllTabs"
	AllTabs.Parent = SecondaryTabs
	AllTabs.Active = true
	AllTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AllTabs.BackgroundTransparency = 1.000
	AllTabs.BorderSizePixel = 0
	AllTabs.Size = UDim2.new(1.13194442, 0, 1, 0)
	AllTabs.AutomaticCanvasSize = Enum.AutomaticSize.Y
	AllTabs.CanvasSize = UDim2.new(0, 0, 0, 0)
	AllTabs.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	AllTabs.ScrollBarImageTransparency = 0
	AllTabs.ScrollBarThickness = 2
	AllTabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

	TabsListing.Name = "TabsListing"
	TabsListing.Parent = AllTabs
	TabsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabsListing.SortOrder = Enum.SortOrder.LayoutOrder
	TabsListing.Padding = UDim.new(0, 1)

	TabsPadding.Name = "TabsPadding"
	TabsPadding.Parent = AllTabs
	TabsPadding.PaddingRight = UDim.new(0, 19)

	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.13, 0,0.009, 0)
	Title.Size = UDim2.new(0, 210, 0, 43)
	Title.Font = Enum.Font.Gotham
	Title.Text = "| " .. Htitle .. " |"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 19.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextTransparency = 0

	ShadowFrame.Name = "ShadowFrame"
	ShadowFrame.Parent = MainFrame
	ShadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ShadowFrame.BackgroundTransparency = 1.000
	ShadowFrame.BorderSizePixel = 0
	ShadowFrame.Size = UDim2.new(0, 448, 0, 331)
	ShadowFrame.Position = UDim2.new(0, 0, 0, 0)
	ShadowFrame.Visible = false
	ShadowFrame.ZIndex = 2
	ShadowFrame.AutoButtonColor = false
	ShadowFrame.Font = Enum.Font.SourceSans
	ShadowFrame.Text = ""
	ShadowFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
	ShadowFrame.TextSize = 14.000

	AllPages.Name = "AllPages"
	AllPages.Parent = MainFrame
	AllPages.BackgroundColor3 = Color3.fromRGB(24, 21, 48)
	AllPages.BorderSizePixel = 0
	AllPages.Position = UDim2.new(0.123, 0,0.139, 0)
	AllPages.Size = UDim2.new(0, 381, 0, 271)
	AllPages.BackgroundTransparency = 0
	AllPages.Visible = true
	
	local tog3 = false

	LeftFrameBtn.MouseButton1Click:Connect(function()
		tog3 = not tog3
		if LeftFrame.Size == UDim2.new(0, 41,0, 331) then
			tog3 = true
		end
		if tog3 then
			ShadowFrame.Visible = true
			TweenService:Create(
				LeftFrame,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 144,0, 331)}
			):Play()
			TweenService:Create(
				ShadowFrame,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0.68}
			):Play()
			TweenService:Create(
				LeftFrameBtnIcon,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Rotation = 90}
			):Play()
			wait(.16)
			TweenService:Create(
				SecondaryTabs,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 144,0, 172)}
			):Play()
			TweenService:Create(
				MainTabsBtnIcon,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Rotation = 360}
			):Play()
		else
			TweenService:Create(
				LeftFrame,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 41,0, 331)}
			):Play()
			TweenService:Create(
				ShadowFrame,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			TweenService:Create(
				LeftFrameBtnIcon,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Rotation = 270}
			):Play()
			TweenService:Create(
				SecondaryTabs,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 144,0, 0)}
			):Play()
			TweenService:Create(
				MainTabsBtnIcon,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Rotation = 270}
			):Play()
			wait(.35)
			ShadowFrame.Visible = false
		end
	end)
	local function YLNRBC_fake_script() -- MainTabsBtn.MainTabsBtnScript 
		local script = Instance.new('LocalScript', MainTabsBtn)

		local TweenService = game:GetService("TweenService")

		local MainTabs = script.Parent.Parent.MainTabsBtn.Parent.Parent.MainTabs

		local tog2 = true

		script.Parent.MouseButton1Click:Connect(function()
			if LeftFrame.Size == UDim2.new(0, 41,0, 331) then
				tog3 = false
			end
			tog2 = not tog2
			if tog2 then
				TweenService:Create(
					MainTabsBtnIcon,
					TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{Rotation = 360}
				):Play()
				TweenService:Create(
					SecondaryTabs,
					TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 144,0, 172)}
				):Play()
			else
				TweenService:Create(
					MainTabsBtnIcon,
					TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{Rotation = 270}
				):Play()
				TweenService:Create(
					SecondaryTabs,
					TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 144,0, 0)}
				):Play()
			end
		end)
	end
	coroutine.wrap(YLNRBC_fake_script)()
	
	local function NSSL_fake_script() -- MainFrameGlow.MainFrameGlowDrag 
		local script = Instance.new('LocalScript', MainFrameGlow)

		local UIS = game:GetService("UserInputService")
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

		dragify(script.Parent)
	end
	coroutine.wrap(NSSL_fake_script)()

	local Tabs = {}

	function Tabs:Tab(tabname)
		local tabname = tabname or "New Tab"
		local TabBtn = Instance.new("TextButton")
		local TabBtnGradient = Instance.new("UIGradient")
		local TabBtnCorner = Instance.new("UICorner")
		local TabBtnTitle = Instance.new("TextLabel")
		local TabBtnCircle = Instance.new("ImageLabel")
		local NewPages = Instance.new("ScrollingFrame")
		local ElementListing = Instance.new("UIListLayout")
		local ElementPadding = Instance.new("UIPadding")

		if fs == false then
			fs = true
			TabBtn.BackgroundTransparency = 0
			NewPages.Visible = true
		end

		TabBtn.Name = "TabBtn"
		TabBtn.Parent = AllTabs
		TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabBtn.BackgroundTransparency = 1.000
		TabBtn.Position = UDim2.new(0, 0, 0.348017633, 0)
		TabBtn.Size = UDim2.new(0, 138, 0, 28)
		TabBtn.ZIndex = 3
		TabBtn.AutoButtonColor = false
		TabBtn.Font = Enum.Font.SourceSans
		TabBtn.Text = ""
		TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabBtn.TextSize = 14.000
		TabBtn.MouseButton1Click:Connect(function()
			for i, v in next, pagesFolder:GetChildren() do
				if v.Name == "NewPages" then
					TweenService:Create(
						v,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 393,0, 0)}
					):Play()
					v.ScrollBarThickness = 0
				end 
			end
			for i, v in next, AllTabs:GetChildren() do
				if v.Name == "TabBtn" then
					TweenService:Create(
						v,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						TabBtn,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
				end
			end
			TweenService:Create(
				NewPages,
				TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 393,0, 263)}
			):Play()
			NewPages.Visible = true
			wait(.35)
			NewPages.ScrollBarThickness = 2
		end)


		TabBtnGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27, 96, 186)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(19, 101, 190))}
		TabBtnGradient.Name = "TabBtnGradient"
		TabBtnGradient.Parent = TabBtn

		TabBtnCorner.CornerRadius = UDim.new(0, 2)
		TabBtnCorner.Name = "TabBtnCorner"
		TabBtnCorner.Parent = TabBtn

		TabBtnTitle.Name = "TabBtnTitle"
		TabBtnTitle.Parent = TabBtn
		TabBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabBtnTitle.BackgroundTransparency = 1.000
		TabBtnTitle.Position = UDim2.new(0.280303031, 0, 0, 0)
		TabBtnTitle.Size = UDim2.new(0.719696999, 0, 1, 0)
		TabBtnTitle.ZIndex = 3
		TabBtnTitle.Font = Enum.Font.Gotham
		TabBtnTitle.Text = tabname
		TabBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabBtnTitle.TextSize = 13.000
		TabBtnTitle.TextWrapped = true
		TabBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

		TabBtnCircle.Name = "TabBtnCircle"
		TabBtnCircle.Parent = TabBtn
		TabBtnCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabBtnCircle.BackgroundTransparency = 1.000
		TabBtnCircle.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TabBtnCircle.Position = UDim2.new(0.099, 0,0.427, 0)
		TabBtnCircle.Size = UDim2.new(0, 4, 0, 4)
		TabBtnCircle.ZIndex = 3
		TabBtnCircle.Image = "http://www.roblox.com/asset/?id=6631155345"

		NewPages.Name = "NewPages"
		NewPages.Parent = pagesFolder
		NewPages.ClipsDescendants = true
		NewPages.Active = true
		NewPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NewPages.BackgroundTransparency = 1.000
		NewPages.BorderSizePixel = 0
		NewPages.Size = UDim2.new(0, 393,0, 0)
		NewPages.Position = UDim2.new(-0.004, 0,0.01, 0)
		NewPages.ScrollBarThickness = 0
		NewPages.ScrollBarImageTransparency = 0
		NewPages.AutomaticCanvasSize = Enum.AutomaticSize.Y
		NewPages.CanvasSize = UDim2.new(0, 0, 1, 0)
		NewPages.Visible = false

		ElementListing.Name = "ElementListing"
		ElementListing.Parent = NewPages
		ElementListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ElementListing.SortOrder = Enum.SortOrder.LayoutOrder
		ElementListing.Padding = UDim.new(0, 2)

		ElementPadding.Name = "ElementPadding"
		ElementPadding.Parent = NewPages
		ElementPadding.PaddingRight = UDim.new(0, 10)

		local ElementHandler = {}

		function ElementHandler:Button(btnText, callback)
			btnText = btnText or "Text Button"
			callback = callback or function() end

			local Button = Instance.new("TextButton")
			local ButtonTitle = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = NewPages
			Button.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 375, 0, 32)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Button.MouseButton1Click:Connect(function()
				callback()
				TweenService:Create(
					ButtonTitle,
					TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{TextSize = 12}
				):Play()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 353, 0, 28)}
				):Play()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(27, 96, 186)}
				):Play()
				wait(.2)
				TweenService:Create(
					ButtonTitle,
					TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{TextSize = 14}
				):Play()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
				):Play()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 375, 0, 32)}
				):Play()
			end)
			
			Button.MouseEnter:Connect(
				function(enter)
					TweenService:Create(
						Button,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
					):Play()
				end
			)

			Button.MouseLeave:Connect(
				function(enter)
					TweenService:Create(
						Button,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
					):Play()
				end
			)
			
			ButtonTitle.Name = "ButtonTitle"
			ButtonTitle.Parent = Button
			ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.BackgroundTransparency = 1.000
			ButtonTitle.Size = UDim2.new(1, 0, 1, 0)
			ButtonTitle.Font = Enum.Font.Gotham
			ButtonTitle.Text = btnText
			ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.TextSize = 14.000
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
		end

		function ElementHandler:Toggle(togInfo, callback)
			togInfo = togInfo or "Toggle"
			callback = callback or function() end
			local tog = false

			local ToggleBtn = Instance.new("TextButton")
			local ToggleTitle = Instance.new("TextLabel")
			local ToggleBox = Instance.new("Frame")
			local ToggleBoxCorner = Instance.new("UICorner")

			ToggleBtn.Name = "ToggleBtn"
			ToggleBtn.Parent = NewPages
			ToggleBtn.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			ToggleBtn.BorderSizePixel = 0
			ToggleBtn.Size = UDim2.new(0, 375, 0, 32)
			ToggleBtn.AutoButtonColor = false
			ToggleBtn.Font = Enum.Font.SourceSans
			ToggleBtn.Text = ""
			ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleBtn.TextSize = 14.000
			ToggleBtn.MouseButton1Click:Connect(function()
				tog = not tog
				callback(tog)
				if tog then
					TweenService:Create(
						ToggleBox,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(135, 128, 176)}
					):Play()
				else
					TweenService:Create(
						ToggleBox,
						TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(74, 68, 94)}
					):Play()
				end
			end)
			
			ToggleBtn.MouseEnter:Connect(
				function(enter)
					TweenService:Create(
						ToggleBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
					):Play()
				end
			)

			ToggleBtn.MouseLeave:Connect(
				function(enter)
					TweenService:Create(
						ToggleBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
					):Play()
				end
			)
			
			ToggleTitle.Name = "ToggleTitle"
			ToggleTitle.Parent = ToggleBtn
			ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.BackgroundTransparency = 1.000
			ToggleTitle.Position = UDim2.new(0.03763441, 0, 0, 0)
			ToggleTitle.Size = UDim2.new(0.962365568, 0, 1, 0)
			ToggleTitle.Font = Enum.Font.Gotham
			ToggleTitle.Text = togInfo
			ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.TextSize = 14.000
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

			ToggleBox.Name = "ToggleBox"
			ToggleBox.Parent = ToggleBtn
			ToggleBox.BackgroundColor3 = Color3.fromRGB(74, 68, 94)
			ToggleBox.Position = UDim2.new(0.927419364, 0, 0.15625, 0)
			ToggleBox.Size = UDim2.new(0, 21, 0, 21)

			ToggleBoxCorner.CornerRadius = UDim.new(0, 6)
			ToggleBoxCorner.Name = "ToggleBoxCorner"
			ToggleBoxCorner.Parent = ToggleBox
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
		end

		function ElementHandler:Slider(text,min,max,start,callback)
			local SliderFunc = {}
			local dragging = false
			local Slider = Instance.new("TextButton")
			local SliderTitle = Instance.new("TextLabel")
			local SlideFrame = Instance.new("Frame")
			local CurrentValueFrame = Instance.new("Frame")
			local SlideCircle = Instance.new("ImageButton")
			local ArrowBtn = Instance.new("ImageButton")
			local ArrowIco = Instance.new("ImageLabel")
			local Value = Instance.new("TextLabel")
			local ValueCorner = Instance.new("UICorner")
			local SlideFrameCorner = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = NewPages
			Slider.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			Slider.ClipsDescendants = false
			Slider.Position = UDim2.new(0, 372, 0, 51)
			Slider.Size = UDim2.new(0, 375, 0, 51)
			Slider.AutoButtonColor = false
			Slider.Font = Enum.Font.SourceSans
			Slider.Text = ""
			Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider.TextSize = 14.000
			Slider.BorderSizePixel = 0
			
			Slider.MouseEnter:Connect(
				function(enter)
					TweenService:Create(
						Slider,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
					):Play()
				end
			)

			Slider.MouseLeave:Connect(
				function(enter)
					TweenService:Create(
						Slider,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
					):Play()
				end
			)

			SliderTitle.Name = "SliderTitle"
			SliderTitle.Parent = Slider
			SliderTitle.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
			SliderTitle.BackgroundTransparency = 1.000
			SliderTitle.Position = UDim2.new(0.038, 0,-0.181, 0)
			SliderTitle.Size = UDim2.new(0.962, 0,1, 0)
			SliderTitle.Font = Enum.Font.Gotham
			SliderTitle.Text = text
			SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.TextSize = 14.000
			SliderTitle.TextTransparency = 0
			SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

			SlideFrame.Name = "SlideFrame"
			SlideFrame.Parent = SliderTitle
			SlideFrame.BackgroundColor3 = Color3.fromRGB(74, 68, 94)
			SlideFrame.BorderSizePixel = 0
			SlideFrame.Position = UDim2.new(0.003, 0,0.945, 0)
			SlideFrame.Size = UDim2.new(0, 340,0, 3)
			SlideFrame.BackgroundTransparency = 0

			SlideFrameCorner.Name = "SlideFrameCorner"
			SlideFrameCorner.Parent = SlideFrame

			CurrentValueFrame.Name = "CurrentValueFrame"
			CurrentValueFrame.Parent = SlideFrame
			CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CurrentValueFrame.BorderSizePixel = 0
			CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

			SlideCircle.Name = "SlideCircle"
			SlideCircle.Parent = SlideFrame
			SlideCircle.BackgroundColor3 = Color3.fromRGB(124, 37, 255)
			SlideCircle.BackgroundTransparency = 1.000
			SlideCircle.Position = UDim2.new((start or 0)/max, -6,-0.93499995, 0)
			SlideCircle.Size = UDim2.new(0, 8, 0, 8)
			SlideCircle.Image = "rbxassetid://3570695787"
			SlideCircle.ImageColor3 = Color3.fromRGB(255, 255, 255)

			Value.Name = "Value"
			Value.Parent = SliderTitle
			Value.AnchorPoint = Vector2.new(1, 0.5)
			Value.BackgroundColor3 = Color3.fromRGB(74, 68, 94)
			Value.BackgroundTransparency = 0
			Value.Position = UDim2.new(0.983, 0,0.484, 0)
			Value.Size = UDim2.new(0, 38, 0, 21)
			Value.Font = Enum.Font.Gotham
			Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 14.000
			Value.TextTransparency = 0
			Value.TextXAlignment = Enum.TextXAlignment.Center

			Value.Changed:Connect(function(ep)
				if ep then
					Value:TweenSize(UDim2.new(0, Value.TextBounds.X + 18, 0, 21), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .4, true)
				end
			end)

			if Value.Size == UDim2.new(0, 38, 0, 24) then
				Value.Size = UDim2.new(0, 38, 0, 21)
			end

			ValueCorner.CornerRadius = UDim.new(0, 4)
			ValueCorner.Name = "ValueCorner"
			ValueCorner.Parent = Value  

			ArrowBtn.MouseButton1Click:Connect(function()
				print("")
			end)

			local function move(input)
				local pos =
					UDim2.new(
						math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
						-6,
						-0.93499995,
						0
					)
				local pos1 =
					UDim2.new(
						math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
						0,
						0,
						3
					)
				CurrentValueFrame:TweenSize(pos1, "Out", "Quart", .4, true)
				SlideCircle:TweenPosition(pos, "Out", "Quart", .4, true)
				local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
				Value.Text = tostring(value)
				pcall(callback, value)
			end
			SlideCircle.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end
			)
			SlideCircle.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end
			)
			game:GetService("UserInputService").InputChanged:Connect(
			function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
				end
			end
			)
			function SliderFunc:Change(tochange)
				CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 3)
				SlideCircle.Position = UDim2.new((tochange or 0)/max, -6,-0.93499995, 0)
				Value.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
				pcall(callback,tochange)
			end
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
			return SliderFunc
		end

		function ElementHandler:Line()
			local LineFrame = Instance.new("Frame")
			local Line = Instance.new("Frame")
			local LineList = Instance.new("UIListLayout")

			LineFrame.Name = "LineFrame"
			LineFrame.Parent = NewPages
			LineFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			LineFrame.BackgroundTransparency = 1.000
			LineFrame.BorderSizePixel = 0
			LineFrame.Position = UDim2.new(0.0118110236, 0, 0.129277572, 0)
			LineFrame.Size = UDim2.new(0, 372, 0, 12)

			Line.Name = "Line"
			Line.Parent = LineFrame
			Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0.0241935477, 0, 0.4375, 0)
			Line.Size = UDim2.new(0, 365, 0, 1)
			Line.BackgroundTransparency = 0.1

			LineList.Name = "LineList"
			LineList.Parent = LineFrame
			LineList.HorizontalAlignment = Enum.HorizontalAlignment.Center
			LineList.SortOrder = Enum.SortOrder.LayoutOrder
			LineList.VerticalAlignment = Enum.VerticalAlignment.Center
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
		end
		
		function ElementHandler:Label(text)
			local Label = Instance.new("Frame")
			local LabelText = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = NewPages
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 375, 0, 32)

			LabelText.Name = "LabelText"
			LabelText.Parent = Label
			LabelText.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			LabelText.BorderSizePixel = 0
			LabelText.Size = UDim2.new(1, 0, 1, 0)
			LabelText.Font = Enum.Font.Gotham
			LabelText.Text = text
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 14.000
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
		end
		
		function ElementHandler:Dropdown(text, list, callback)
			local DropToggled = false
			local ItemCount = 0
			local DropdownFrameSize = 0
			local ItemFrameSize = 0
			local Selected = text

			local Dropdown = Instance.new("TextButton")
			local DropdownTitle = Instance.new("TextLabel")
			local DropToggle = Instance.new("ImageButton")

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = NewPages
			Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
			Dropdown.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			Dropdown.BorderSizePixel = 0
			Dropdown.Position = UDim2.new(-0.436928689, 0, 0.696994126, 0)
			Dropdown.Size = UDim2.new(0, 375, 0, 32)
			Dropdown.AutoButtonColor = false
			Dropdown.Font = Enum.Font.Gotham
			Dropdown.Text = ""
			Dropdown.TextColor3 = Color3.fromRGB(195, 195, 195)
			Dropdown.TextSize = 14.000

			Dropdown.MouseEnter:Connect(
				function(enter)
					TweenService:Create(
						Dropdown,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
					):Play()
				end
			)

			Dropdown.MouseLeave:Connect(
				function(enter)
					TweenService:Create(
						Dropdown,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
					):Play()
				end
			)

			DropdownTitle.Name = "DropdownTitle"
			DropdownTitle.Parent = Dropdown
			DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.BackgroundTransparency = 1.000
			DropdownTitle.Position = UDim2.new(0.03763441, 0, 0, 0)
			DropdownTitle.Size = UDim2.new(0.962365568, 0, 1, 0)
			DropdownTitle.Font = Enum.Font.Gotham
			DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.TextSize = 14.000
			DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
			DropdownTitle.TextTransparency = 0
			DropdownTitle.Text = text

			DropToggle.Name = "DropToggle"
			DropToggle.Parent = Dropdown
			DropToggle.BackgroundTransparency = 1.000
			DropToggle.Position = UDim2.new(0.926, 0,0.135, 0)
			DropToggle.Size = UDim2.new(0, 23, 0, 23)
			DropToggle.ZIndex = 2
			DropToggle.Rotation = 90
			DropToggle.Image = "rbxassetid://5844057859"
			DropToggle.ImageColor3 = Color3.fromRGB(255, 255, 255)
			DropToggle.ImageRectOffset = Vector2.new(0, 0)
			DropToggle.ImageRectSize = Vector2.new(0, 0)

			local DropItemHolder = Instance.new("ScrollingFrame")
			local DropItemHolderUIList = Instance.new("UIListLayout")

			DropItemHolder.Name = "DropItemHolder"
			DropItemHolder.Parent = NewPages
			DropItemHolder.Active = true
			DropItemHolder.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			DropItemHolder.BackgroundTransparency = 0
			DropItemHolder.BorderSizePixel = 0
			DropItemHolder.Position = UDim2.new(0, 0, 0.202399909, 0)
			DropItemHolder.Size = UDim2.new(0, 375, 0, 0)
			DropItemHolder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropItemHolder.ScrollBarThickness = 2
			DropItemHolder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			DropItemHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
			DropItemHolder.ClipsDescendants = true
			DropItemHolder.Visible = false

			DropItemHolderUIList.Name = "DropItemHolderUIList"
			DropItemHolderUIList.Parent = DropItemHolder
			DropItemHolderUIList.SortOrder = Enum.SortOrder.LayoutOrder
			DropItemHolderUIList.Padding = UDim.new(0, 0)
			DropItemHolderUIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

			Dropdown.MouseButton1Click:Connect(
				function()
					if DropToggled == false then
						DropToggled = not DropToggled
						TweenService:Create(
							DropToggle,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Rotation = 0}
						):Play()
						DropdownTitle.Text = Selected
						DropItemHolder.Visible = true
						DropItemHolder:TweenSize(
							UDim2.new(0, 375, 0, DropdownFrameSize),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							0.5,
							true
						)
						repeat
							wait()
						until DropItemHolder.Size == UDim2.new(0, 375, 0, DropdownFrameSize)
						NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
					else
						DropToggled = not DropToggled
						TweenService:Create(
							DropToggle,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Rotation = 90}
						):Play()
						DropdownTitle.Text = text
						DropItemHolder:TweenSize(
							UDim2.new(0, 375, 0, 0),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							0.5,
							true
						)
						wait(.05)
						DropItemHolder.Visible = false
						repeat
							wait()
						until DropItemHolder.Size == UDim2.new(0, 375, 0, 0)
						NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
					end
				end
			)

			for i, v in next, list do
				ItemCount = ItemCount + 1
				local Option = Instance.new("TextButton")

				Option.Name = "Option"
				Option.Parent = DropItemHolder
				Option.AnchorPoint = Vector2.new(0.5, 0.5)
				Option.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
				Option.BorderSizePixel = 0
				Option.BorderColor3 = Color3.fromRGB(24, 21, 48)
				Option.Position = UDim2.new(0.494680852, 0, 0.147959188, 0)
				Option.Size = UDim2.new(0, 375, 0, 30)
				Option.AutoButtonColor = false
				Option.Font = Enum.Font.Gotham
				Option.TextColor3 = Color3.fromRGB(195, 195, 195)
				Option.TextSize = 14.000
				Option.Text = v
				Option.TextTransparency = 0

				if ItemCount <= 3 then
					DropdownFrameSize = DropdownFrameSize + 32
					ItemFrameSize = ItemFrameSize + 27
				elseif ItemCount >= 4 then
					DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropItemHolderUIList.AbsoluteContentSize.Y)
				end

				Option.MouseEnter:Connect(
					function()
						TweenService:Create(
							Option,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
						):Play()
						TweenService:Create(
							Option,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)}
						):Play()
					end
				)

				Option.MouseLeave:Connect(
					function()
						TweenService:Create(
							Option,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
						):Play()
						TweenService:Create(
							Option,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(195, 195, 195)}
						):Play()
					end
				)

				Option.MouseButton1Click:Connect(
					function()
						DropToggled = not DropToggled
						TweenService:Create(
							DropToggle,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{Rotation = 90}
						):Play()
						DropdownTitle.Text = text
						Selected = v
						pcall(callback, v)
						DropItemHolder:TweenSize(
							UDim2.new(0, 375, 0, 0),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							0.5,
							true
						)
						wait(.05)
						DropItemHolder.Visible = false
						repeat
							wait()
						until DropItemHolder.Size == UDim2.new(0, 375, 0, 0)
						NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
					end
				)
			end
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
		end
		
		function ElementHandler:Colorpicker(text, preset, callback)
			local ColorPickerToggled = false
			local OldToggleColor = Color3.fromRGB(0, 0, 0)
			local OldColor = Color3.fromRGB(0, 0, 0)
			local OldColorSelectionPosition = nil
			local OldHueSelectionPosition = nil
			local ColorH, ColorS, ColorV = 1, 1, 1
			local RainbowColorPicker = false
			local ColorPickerInput = nil
			local ColorInput = nil
			local HueInput = nil

			local Colorpicker = Instance.new("TextButton")
			local ColorPickerTitle = Instance.new("TextLabel")
			local CurrentColor = Instance.new("Frame")
			local ColorUICorner = Instance.new("UICorner")

			Colorpicker.Name = "Colorpicker"
			Colorpicker.Parent = NewPages
			Colorpicker.AnchorPoint = Vector2.new(0.5, 0.5)
			Colorpicker.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			Colorpicker.Position = UDim2.new(-0.436928689, 0, 0.696994126, 0)
			Colorpicker.Size = UDim2.new(0, 375, 0, 32)
			Colorpicker.AutoButtonColor = false
			Colorpicker.Font = Enum.Font.Gotham
			Colorpicker.BorderSizePixel = 0
			Colorpicker.Text = ""
			Colorpicker.TextColor3 = Color3.fromRGB(195, 195, 195)
			Colorpicker.TextSize = 14.000
			
			Colorpicker.MouseEnter:Connect(
				function(enter)
					TweenService:Create(
						Colorpicker,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
					):Play()
				end
			)

			Colorpicker.MouseLeave:Connect(
				function(enter)
					TweenService:Create(
						Colorpicker,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
					):Play()
				end
			)
			
			ColorPickerTitle.Name = "ColorPickerTitle"
			ColorPickerTitle.Parent = Colorpicker
			ColorPickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorPickerTitle.BackgroundTransparency = 1.000
			ColorPickerTitle.Position = UDim2.new(0.03763441, 0, 0, 0)
			ColorPickerTitle.Size = UDim2.new(0.962365568, 0, 1, 0)
			ColorPickerTitle.Font = Enum.Font.Gotham
			ColorPickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ColorPickerTitle.TextSize = 14.000
			ColorPickerTitle.TextXAlignment = Enum.TextXAlignment.Left
			ColorPickerTitle.Text = text

			CurrentColor.Name = "CurrentColor"
			CurrentColor.Parent = Colorpicker
			CurrentColor.BackgroundColor3 = preset
			CurrentColor.Position = UDim2.new(0.927419364, 0, 0.15625, 0)
			CurrentColor.Size = UDim2.new(0, 21, 0, 21)

			ColorUICorner.CornerRadius = UDim.new(0, 6)
			ColorUICorner.Name = "ColorUICorner"
			ColorUICorner.Parent = CurrentColor
			local ColorpickerFrame = Instance.new("TextButton")
			local Hue = Instance.new("ImageLabel")
			local huecorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			local HueSelection = Instance.new("ImageLabel")
			local Color = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			local ColorSelection = Instance.new("ImageLabel")
			local Confirm = Instance.new("TextButton")
			local ButtonUICorner = Instance.new("UICorner")
			local RainbowToggle = Instance.new("TextButton")
			local RainbowToggleUICorner = Instance.new("UICorner")
			local RainbowTitle = Instance.new("TextLabel")
			local RainbowStatus = Instance.new("Frame")
			local RainbowStatusUICorner = Instance.new("UICorner")

			ColorpickerFrame.Name = "ColorpickerFrame"
			ColorpickerFrame.Parent = NewPages
			ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			ColorpickerFrame.Position = UDim2.new(0.0457920805, 0, 0.685394764, 0)
			ColorpickerFrame.Size = UDim2.new(0, 375, 0, 0)
			ColorpickerFrame.Visible = false
			ColorpickerFrame.AutoButtonColor = false
			ColorpickerFrame.BorderSizePixel = 0
			ColorpickerFrame.ClipsDescendants = true

			Hue.Name = "Hue"
			Hue.Parent = ColorpickerFrame
			Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hue.Position = UDim2.new(0, 240, 0, 9)
			Hue.Size = UDim2.new(0, 30, 0, 93)

			huecorner.CornerRadius = UDim.new(0, 3)
			huecorner.Name = "huecorner"
			huecorner.Parent = Hue

			UIGradient.Color =
				ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}
			UIGradient.Rotation = 270
			UIGradient.Parent = Hue

			HueSelection.Name = "HueSelection"
			HueSelection.Parent = Hue
			HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HueSelection.BackgroundTransparency = 1.000
			HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
			HueSelection.Size = UDim2.new(0, 18, 0, 18)
			HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
			HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)

			Color.Name = "Color"
			Color.Parent = ColorpickerFrame
			Color.BackgroundColor3 = preset
			Color.Position = UDim2.new(0, 8, 0, 9)
			Color.Size = UDim2.new(0, 219, 0, 93)
			Color.ZIndex = 10
			Color.Image = "rbxassetid://4155801252"

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Color

			ColorSelection.Name = "ColorSelection"
			ColorSelection.Parent = Color
			ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorSelection.ZIndex = 25
			ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorSelection.BackgroundTransparency = 1.000
			ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
			ColorSelection.Size = UDim2.new(0, 18, 0, 18)
			ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
			ColorSelection.ScaleType = Enum.ScaleType.Fit

			Confirm.Name = "Confirm"
			Confirm.Parent = ColorpickerFrame
			Confirm.AnchorPoint = Vector2.new(0.5, 0.5)
			Confirm.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			Confirm.Position = UDim2.new(0.86292477, 0, 0.211035922, 0)
			Confirm.Size = UDim2.new(0, 98, 0, 29)
			Confirm.AutoButtonColor = false
			Confirm.Font = Enum.Font.Gotham
			Confirm.Text = "Confirm"
			Confirm.TextColor3 = Color3.fromRGB(195, 195, 195)
			Confirm.TextSize = 14.000
			
			Confirm.MouseEnter:Connect(
				function()
					TweenService:Create(
						Confirm,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(33, 31, 56)}
					):Play()
					TweenService:Create(
						Confirm,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255, 255, 255)}
					):Play()
				end
			)

			Confirm.MouseLeave:Connect(
				function()
					TweenService:Create(
						Confirm,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(29, 26, 53)}
					):Play()
					TweenService:Create(
						Confirm,
						TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(195, 195, 195)}
					):Play()
				end
			)

			ButtonUICorner.CornerRadius = UDim.new(0, 6)
			ButtonUICorner.Name = "ButtonUICorner"
			ButtonUICorner.Parent = Confirm

			RainbowToggle.Name = "RainbowToggle"
			RainbowToggle.Parent = ColorpickerFrame
			RainbowToggle.AnchorPoint = Vector2.new(0.5, 0.5)
			RainbowToggle.BackgroundColor3 = Color3.fromRGB(29, 26, 53)
			RainbowToggle.Position = UDim2.new(0.84592477, 0, 0.498795807, 0)
			RainbowToggle.Size = UDim2.new(0, 80, 0, 29)
			RainbowToggle.AutoButtonColor = false
			RainbowToggle.Font = Enum.Font.Gotham
			RainbowToggle.Text = ""
			RainbowToggle.TextColor3 = Color3.fromRGB(195, 195, 195)
			RainbowToggle.TextSize = 14.000
			RainbowToggle.Visible = false

			RainbowToggleUICorner.CornerRadius = UDim.new(0, 6)
			RainbowToggleUICorner.Name = "RainbowToggleUICorner"
			RainbowToggleUICorner.Parent = RainbowToggle

			RainbowTitle.Name = "RainbowTitle"
			RainbowTitle.Parent = RainbowToggle
			RainbowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RainbowTitle.BackgroundTransparency = 1.000
			RainbowTitle.Position = UDim2.new(0.0244399179, 0, 0.068965517, 0)
			RainbowTitle.Size = UDim2.new(0.962365568, 0, 1, 0)
			RainbowTitle.Font = Enum.Font.Gotham
			RainbowTitle.Text = "Rainbow"
			RainbowTitle.TextColor3 = Color3.fromRGB(195, 195, 195)
			RainbowTitle.TextSize = 14.000
			RainbowTitle.TextXAlignment = Enum.TextXAlignment.Left

			RainbowStatus.Name = "RainbowStatus"
			RainbowStatus.Parent = RainbowToggle
			RainbowStatus.BackgroundColor3 = Color3.fromRGB(74, 68, 94)
			RainbowStatus.Position = UDim2.new(0.927419364, 0, 0.15625, 0)
			RainbowStatus.Size = UDim2.new(0, 21, 0, 21)

			RainbowStatusUICorner.CornerRadius = UDim.new(0, 6)
			RainbowStatusUICorner.Name = "RainbowStatusUICorner"
			RainbowStatusUICorner.Parent = RainbowStatus

			local function UpdateColorPicker(nope)
				CurrentColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
				Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

				pcall(callback, CurrentColor.BackgroundColor3)
			end

			ColorH =
				1 -
				(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
					Hue.AbsoluteSize.Y)
			ColorS =
				(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
					Color.AbsoluteSize.X)
			ColorV =
				1 -
				(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
					Color.AbsoluteSize.Y)

			CurrentColor.BackgroundColor3 = preset
			Color.BackgroundColor3 = preset
			pcall(callback, CurrentColor.BackgroundColor3)

			Color.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then
							return
						end

						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput =
							RunService.RenderStepped:Connect(
								function()
								local ColorX =
									(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
										Color.AbsoluteSize.X)
								local ColorY =
									(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
										Color.AbsoluteSize.Y)

								ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end
							)
					end
				end
			)

			Color.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end
			)

			Hue.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then
							return
						end

						if HueInput then
							HueInput:Disconnect()
						end

						HueInput =
							RunService.RenderStepped:Connect(
								function()
								local HueY =
									(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
										Hue.AbsoluteSize.Y)

								HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end
							)
					end
				end
			)

			Hue.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end
			)

			RainbowToggle.MouseButton1Down:Connect(
				function()
					RainbowColorPicker = not RainbowColorPicker

					if ColorInput then
						ColorInput:Disconnect()
					end

					if HueInput then
						HueInput:Disconnect()
					end

					if RainbowColorPicker then
						TweenService:Create(
							RainbowStatus,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(135, 128, 1768)}
						):Play()

						OldToggleColor = CurrentColor.BackgroundColor3
						OldColor = Color.BackgroundColor3
						OldColorSelectionPosition = ColorSelection.Position
						OldHueSelectionPosition = HueSelection.Position

						while RainbowColorPicker do
							CurrentColor.BackgroundColor3 = Color3.fromHSV(WindowTable.RainbowColorValue, 1, 1)
							Color.BackgroundColor3 = Color3.fromHSV(WindowTable.RainbowColorValue, 1, 1)

							ColorSelection.Position = UDim2.new(1, 0, 0, 0)
							HueSelection.Position = UDim2.new(0.48, 0, 0, WindowTable.HueSelectionPosition)

							pcall(callback, CurrentColor.BackgroundColor3)
							wait()
						end
					elseif not RainbowColorPicker then
						TweenService:Create(
							RainbowStatus,
							TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(74, 68, 94)}
						):Play()
						CurrentColor.BackgroundColor3 = OldToggleColor
						Color.BackgroundColor3 = OldColor

						ColorSelection.Position = OldColorSelectionPosition
						HueSelection.Position = OldHueSelectionPosition

						pcall(callback, CurrentColor.BackgroundColor3)
					end
				end
			)

			Colorpicker.MouseButton1Click:Connect(
				function()
					if ColorPickerToggled == false then
						ColorPickerToggled = not ColorPickerToggled
						ColorpickerFrame.Visible = true
						ColorpickerFrame:TweenSize(
							UDim2.new(0, 375, 0, 111),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							0.1,
							true
						)
						repeat
							wait()
						until ColorpickerFrame.Size == UDim2.new(0, 375, 0, 111)
						NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
					else
						ColorPickerToggled = not ColorPickerToggled
						ColorpickerFrame:TweenSize(
							UDim2.new(0, 375, 0, 0),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							0.1	,
							true
						)
						wait(.05)
						ColorpickerFrame.Visible = false
						repeat
							wait()
						until ColorpickerFrame.Size == UDim2.new(0, 375, 0, 0)
						NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
					end
				end
			)

			Confirm.MouseButton1Click:Connect(
				function()
					ColorPickerToggled = not ColorPickerToggled
					ColorpickerFrame:TweenSize(
						UDim2.new(0, 375, 0, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						0.1,
						true
					)
					wait(.05)
					ColorpickerFrame.Visible = false
					repeat
						wait()
					until ColorpickerFrame.Size == UDim2.new(0, 375, 0, 0)
					NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
				end
			)
			NewPages.CanvasSize = UDim2.new(0, 0, 0, ElementListing.AbsoluteContentSize.Y)
		end

		return ElementHandler

	end
	
	function Tabs:TabLine(txt)
		local TabLine = Instance.new("TextLabel")

		TabLine.Name = "TabLine"
		TabLine.Parent = AllTabs
		TabLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabLine.BackgroundTransparency = 1.000
		TabLine.Position = UDim2.new(0.081368126, 0, 0.168604657, 0)
		TabLine.Size = UDim2.new(0, 116, 0, 28)
		TabLine.ZIndex = 3
		TabLine.Font = Enum.Font.GothamSemibold
		TabLine.Text = txt
		TabLine.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabLine.TextSize = 14.000
		TabLine.TextWrapped = true
		TabLine.TextXAlignment = Enum.TextXAlignment.Left
	end

	return Tabs
end
return WindowTable
