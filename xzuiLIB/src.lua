
--[[
	i will fill this shit out later
]]


local Library = {}

local LocalPlayer = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Mouse = LocalPlayer:GetMouse()

getgenv().Flags = {}

function findIndex(optionTable, targetOption)
    for index, value in ipairs(optionTable) do
        if value == targetOption then
            return index
        end
    end
    return nil
end

function round(number)
    return math.floor(number * 100 + 0.5) / 100
end

function Library:Create(info)
	
	local WindowName = info.Name or info.name or info.WindowName or info.windowname or "xz ui library"
	local WindowVersion = info.Ver or info.ver or info.Version or info.version or "Build v1.0.0"
	local Folder = info.Folder or info.folder or WindowName
	local ToggleWindowBind = info.Bind or info.bind or info.Key or info.key or Enum.KeyCode.RightShift
	
	local xz_ui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Main_Title = Instance.new("TextButton")
	local SideMenu = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Main_Version = Instance.new("TextLabel")
	local MainFrame = Instance.new("Frame")

	UIListLayout.Parent = SideMenu
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	xz_ui.Name = WindowName
	xz_ui.Parent = game.CoreGui
	xz_ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = xz_ui
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BackgroundTransparency = 0.050
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.25, 0, 0.268914193, 0)
	Main.Size = UDim2.new(0, 697, 0, 360)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Main

	Main_Title.Name = "Main_Title"
	Main_Title.Parent = Main
	Main_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main_Title.BackgroundTransparency = 1.000
	Main_Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main_Title.BorderSizePixel = 0
	Main_Title.Position = UDim2.new(0.012912482, 0, 0, 0)
	Main_Title.Size = UDim2.new(0, 690, 0, 39)
	Main_Title.Font = Enum.Font.Code
	Main_Title.Text = WindowName
	Main_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main_Title.TextSize = 20.000
	Main_Title.TextXAlignment = Enum.TextXAlignment.Left

    UserInputService.InputBegan:Connect(function(k)
        if k.KeyCode == ToggleWindowBind then 
            Main.Visible = not Main.Visible
        end
    end)

	local dragging
    local dragStartOffset

    Main_Title.MouseButton1Down:Connect(function()
        dragging = true
        dragStartOffset = Main.Position - UDim2.new(0, Mouse.X, 0, Mouse.Y)
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local newPosition = UDim2.new(
                dragStartOffset.X.Scale, Mouse.X + dragStartOffset.X.Offset,
                dragStartOffset.Y.Scale, Mouse.Y + dragStartOffset.Y.Offset
            )
            TweenService:Create(Main, TweenInfo.new(0.01), {Position = newPosition}):Play()
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

	SideMenu.Name = "SideMenu"
	SideMenu.Parent = Main
	SideMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	SideMenu.BackgroundTransparency = 1.000
	SideMenu.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideMenu.BorderSizePixel = 0
	SideMenu.Position = UDim2.new(0.012912482, 0, 0.108333334, 0)
	SideMenu.Size = UDim2.new(0, 139, 0, 298)

	Main_Version.Name = "Main_Version"
	Main_Version.Parent = Main
	Main_Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main_Version.BackgroundTransparency = 1.000
	Main_Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main_Version.BorderSizePixel = 0
	Main_Version.Position = UDim2.new(0.012912482, 0, 0.936455309, 0)
	Main_Version.Size = UDim2.new(0, 148, 0, 22)
	Main_Version.Font = Enum.Font.Code
	Main_Version.Text = WindowVersion
	Main_Version.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main_Version.TextSize = 10.000
	Main_Version.TextXAlignment = Enum.TextXAlignment.Left

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Main
	MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrame.BackgroundTransparency = 1.000
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.225251079, 0, 0.108333334, 0)
	MainFrame.Size = UDim2.new(0, 533, 0, 312)
	
	local Window = {}

	function Window:Tab(info)
		local TabName = info.Name or info.name or info.Tabname or info.tabname or "Tab "..tostring(math.random(1,25))
		local ShowOnStartup = info.DefTab or info.deftab or info.showonstartup or info.ShowOnStartup or false
		
		local TabButton = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local Tab = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")

		TabButton.Name = TabName
		TabButton.Parent = SideMenu
		TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		TabButton.BackgroundTransparency = 0.050
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0, 139, 0, 31)
		TabButton.Font = Enum.Font.Code
		TabButton.Text = TabName
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 14.000

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = TabButton

		Tab.Name = TabName
		Tab.Parent = MainFrame
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.ClipsDescendants = false
		Tab.Selectable = false
		Tab.Size = UDim2.new(0, 533, 0, 312)
		Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
		Tab.ScrollBarThickness = 2
		Tab.Visible = ShowOnStartup
        Tab.AutomaticCanvasSize = Enum.AutomaticSize.Y

		UIListLayout_2.Parent = Tab
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 3)

		task.spawn(function()
			TabButton.MouseButton1Click:Connect(function()
				for index, tabs in pairs(MainFrame:GetChildren()) do 
					if tabs:IsA("ScrollingFrame") then 
						tabs.Visible = false
					end
				end
				Tab.Visible = true
			end)
		end)
		
		local PageItems = {}

		function PageItems:Label(info)
			local Text = info.Text or info.text or "Label"

			local Label = Instance.new("Frame")
			local LabelText = Instance.new("TextLabel")

			Label.Name = Text
			Label.Parent = Tab
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 533, 0, 31)
			
			LabelText.Name = "LabelText"
			LabelText.Parent = Label
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LabelText.BorderSizePixel = 0
			LabelText.Position = UDim2.new(0.023941813, 0, 0, 0)
			LabelText.Size = UDim2.new(0, 520, 0, 31)
			LabelText.Font = Enum.Font.Code
			LabelText.Text = Text
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 15.000
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
		end

		function PageItems:Button(info)
			local Text = info.Text or info.text or "Button"
			local Callback = info.Callback or info.CallBack or info.CB or info.callback or function() print(Text.." Clicked") end

			local Button = Instance.new("Frame")
			local ButtonDetector = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local ButtonText = Instance.new("TextLabel")

			Button.Name = Text
			Button.Parent = Tab
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 533, 0, 31)

			ButtonDetector.Name = "ButtonDetector"
			ButtonDetector.Parent = Button
			ButtonDetector.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			ButtonDetector.BackgroundTransparency = 0.050
			ButtonDetector.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonDetector.BorderSizePixel = 0
			ButtonDetector.Position = UDim2.new(0.941999972, 0, 0, 0)
			ButtonDetector.Size = UDim2.new(0, 31, 0, 31)
			ButtonDetector.Image = "rbxassetid://16081386298"

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ButtonDetector

			ButtonText.Name = "ButtonText"
			ButtonText.Parent = Button
			ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.BackgroundTransparency = 1.000
			ButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonText.BorderSizePixel = 0
			ButtonText.Position = UDim2.new(0.0239418708, 0, 0, 0)
			ButtonText.Size = UDim2.new(0, 488, 0, 31)
			ButtonText.Font = Enum.Font.Code
			ButtonText.Text = Text
			ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.TextSize = 15.000
			ButtonText.TextXAlignment = Enum.TextXAlignment.Left

			task.spawn(function()
				ButtonDetector.MouseButton1Click:Connect(function()
					pcall(Callback)
				end)
			end)
		end
		
		function PageItems:Dropdown(info)
			local Text = info.Text or info.text or "Dropdown"
            local Flag = info.Flag or info.flag or info.Pointer or info.pointer or TabName.."_"..Text
			local Value = info.Def or info.Default or info.Value or info.def or info.default or info.value or 1
			local Values = info.Values or info.Options or info.options or info.values or {"Option 1","Option 2","Option 3"}
			local Callback = info.Callback or info.CallBack or info.CB or info.callback or function() print(Text.." Clicked") end
			Flags[Flag] = Values[Value]

			local Dropdown = Instance.new("Frame")
			local DropdownDetector = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local DropdownText = Instance.new("TextLabel")
			local DropdownContent = Instance.new("ScrollingFrame")
			local UICorner_2 = Instance.new("UICorner")
			local UIListLayout44 = Instance.new("UIListLayout")

			Dropdown.Name = Text
			Dropdown.Parent = Tab
			Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Dropdown.BackgroundTransparency = 1.000
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.Size = UDim2.new(0, 533, 0, 31)
			Dropdown.ZIndex = 2

			DropdownDetector.Name = "DropdownDetector"
			DropdownDetector.Parent = Dropdown
			DropdownDetector.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			DropdownDetector.BackgroundTransparency = 0.050
			DropdownDetector.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownDetector.BorderSizePixel = 0
			DropdownDetector.Position = UDim2.new(0.941999972, 0, 0, 0)
			DropdownDetector.Size = UDim2.new(0, 31, 0, 31)
			DropdownDetector.Image = "rbxassetid://11552476728"

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = DropdownDetector

			DropdownText.Name = "DropdownText"
			DropdownText.Parent = Dropdown
			DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownText.BackgroundTransparency = 1.000
			DropdownText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownText.BorderSizePixel = 0
			DropdownText.Position = UDim2.new(0.0239418708, 0, 0, 0)
			DropdownText.Size = UDim2.new(0, 488, 0, 31)
			DropdownText.Font = Enum.Font.Code
			DropdownText.Text = Text..": "..Values[Value]
			DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownText.TextSize = 15.000
			DropdownText.TextXAlignment = Enum.TextXAlignment.Left

			DropdownContent.Name = "DropdownContent"
			DropdownContent.Parent = Dropdown
			DropdownContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			DropdownContent.BackgroundTransparency = 0.050
			DropdownContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownContent.BorderSizePixel = 0
			DropdownContent.ClipsDescendants = false
			DropdownContent.Position = UDim2.new(0.645104527, 0, 1, 0)
			DropdownContent.Selectable = false
			DropdownContent.Size = UDim2.new(0, 189, 0, 104)
			DropdownContent.Visible = false
			DropdownContent.ZIndex = 3
			DropdownContent.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropdownContent.ScrollBarThickness = 2

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = DropdownContent

			UIListLayout44.Parent = DropdownContent
			UIListLayout44.SortOrder = Enum.SortOrder.LayoutOrder

			task.spawn(function()
				DropdownDetector.MouseButton1Click:Connect(function()
					DropdownContent.Visible = not DropdownContent.Visible
				end)
			end)

			for index, val in pairs(Values) do 
				local DropdownOption = Instance.new("TextButton")
				local UICorner_3 = Instance.new("UICorner")
				DropdownOption.Name = val
				DropdownOption.Parent = DropdownContent
				DropdownOption.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				DropdownOption.BackgroundTransparency = 0.050
				DropdownOption.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropdownOption.BorderSizePixel = 0
				DropdownOption.Size = UDim2.new(0, 189, 0, 22)
				DropdownOption.Font = Enum.Font.Code
				DropdownOption.Text = val
				DropdownOption.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownOption.TextSize = 14.000

				UICorner_3.CornerRadius = UDim.new(0, 4)
				UICorner_3.Parent = DropdownOption

				task.spawn(function()
					DropdownOption.MouseButton1Click:Connect(function()
						pcall(Callback,val)
						DropdownContent.Visible = false
						Flags[Flag] = val
						DropdownText.Text = Text..": "..val
					end)
				end)
			end
		end
		
		function PageItems:Slider(info)
			local Text = info.Text or info.text or "Slider"
            local Flag = info.Flag or info.flag or info.Pointer or info.pointer or TabName.."_"..Text
			local Min = info.Min or info.min or info.Minimum or info.minimum or 1
			local Def = info.Def or info.def or info.Default or info.default or 50
			local Max = info.Max or info.max or info.Maximum or info.maxiumum or 100
			local Suffix = info.Suffix or info.suffix or info.Ending or info.ending or "%"
			local Callback = info.Callback or info.CallBack or info.CB or info.callback or function() print(Text.." Clicked") end
			Flags[Flag] = Def

			local Slider = Instance.new("Frame")
			local SliderText = Instance.new("TextLabel")
			local SliderBG = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local SliderButton = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = Tab
			Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider.BackgroundTransparency = 1.000
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0, 533, 0, 31)

			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderText.BorderSizePixel = 0
			SliderText.Position = UDim2.new(0.023941813, 0, 0, 0)
			SliderText.Size = UDim2.new(0, 279, 0, 31)
			SliderText.Font = Enum.Font.Code
			SliderText.Text = Text..": "..tostring(Def)..Suffix
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 15.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left

			SliderBG.Name = "SliderBG"
			SliderBG.Parent = Slider
			SliderBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			SliderBG.BackgroundTransparency = 0.050
			SliderBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderBG.BorderSizePixel = 0
			SliderBG.Position = UDim2.new(0.545966208, 0, 0, 0)
			SliderBG.Size = UDim2.new(0, 241, 0, 31)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = SliderBG

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = SliderBG
			SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.BorderSizePixel = 0
			SliderButton.Size = UDim2.new(0.05, 0, 1, 0)

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = SliderButton

			local function updateSlider(inputPosition)
				local sliderRange = SliderBG.AbsoluteSize.X - SliderButton.AbsoluteSize.X
				local relativePosition = inputPosition - SliderBG.AbsolutePosition.X
				local clampedPosition = math.clamp(relativePosition, 0, sliderRange)
				SliderButton.Position = UDim2.new(0, clampedPosition, 0, 0)
		
				local value = Min + (clampedPosition / sliderRange) * (Max - Min)
				Flags[Flag] = value
				SliderText.Text = Text .. ": " .. round(value) .. Suffix
		
				pcall(Callback,value)
			end

			SliderButton.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local connection
					connection = game:GetService("UserInputService").InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							updateSlider(input.Position.X)
						end
					end)
					SliderButton.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							connection:Disconnect()
						end
					end)
				end
			end)

			local defaultPosition = ((Def - Min) / (Max - Min)) * (SliderBG.AbsoluteSize.X - SliderButton.AbsoluteSize.X)
			SliderButton.Position = UDim2.new(0, defaultPosition, 0, 0)
		
		end

		function PageItems:Toggle(info)
			local Text = info.Text or info.text or "Toggle"
            local Flag = info.Flag or info.flag or info.Pointer or info.pointer or TabName.."_"..Text
			local Def = info.Def or info.def or info.Default or info.default or false
			local Callback = info.Callback or info.CallBack or info.CB or info.callback or function() print(Text.." Clicked") end
			Flags[Flag] = Def

			local Value = Def

			local Toggle = Instance.new("Frame")
			local ToggleDetector = Instance.new("ImageButton")
			local UICorner = Instance.new("UICorner")
			local ToggleText = Instance.new("TextLabel")

			Toggle.Name = Text
			Toggle.Parent = Tab
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 533, 0, 31)
			
			ToggleDetector.Name = "ToggleDetector"
			ToggleDetector.Parent = Toggle
			ToggleDetector.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			ToggleDetector.BackgroundTransparency = 0.050
			ToggleDetector.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleDetector.BorderSizePixel = 0
			ToggleDetector.Position = UDim2.new(0.941999972, 0, 0, 0)
			ToggleDetector.Size = UDim2.new(0, 31, 0, 31)
			ToggleDetector.Image = "rbxassetid://17184386129"

			if Value then 
				ToggleDetector.ImageTransparency = 0
			else
				ToggleDetector.ImageTransparency = 1
			end
				
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ToggleDetector
			
			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleText.BorderSizePixel = 0
			ToggleText.Position = UDim2.new(0.0239418708, 0, 0, 0)
			ToggleText.Size = UDim2.new(0, 488, 0, 31)
			ToggleText.Font = Enum.Font.Code
			ToggleText.Text = Text
			ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.TextSize = 15.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left
			
			task.spawn(function()
				ToggleDetector.MouseButton1Click:Connect(function()
					Value = not Value
					if Value then 
						ToggleDetector.ImageTransparency = 0
					else
						ToggleDetector.ImageTransparency = 1
					end
					pcall(Callback,Value)
					Flags[Flag] = Value
				end)
			end)
		end

		function PageItems:Input(info)
			local Text = info.Text or info.text or "Text Input"
            local Flag = info.Flag or info.flag or info.Pointer or info.pointer or TabName.."_"..Text
			local Def = info.Def or info.def or info.Default or info.default or ""
			local PlaceHolder = info.PlaceHolder or info.Placeholder or info.placeholder or "Text Input"
			local Callback = info.Callback or info.CallBack or info.CB or info.callback or function() print(Text.." Clicked") end
			Flags[Flag] = Def

			local Input = Instance.new("Frame")
			local InputText = Instance.new("TextLabel")
			local InputBG = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local InputTextValue = Instance.new("TextBox")

			Input.Name = Text
			Input.Parent = Tab
			Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Input.BackgroundTransparency = 1.000
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.Size = UDim2.new(0, 533, 0, 31)
			
			InputText.Name = "InputText"
			InputText.Parent = Input
			InputText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputText.BackgroundTransparency = 1.000
			InputText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputText.BorderSizePixel = 0
			InputText.Position = UDim2.new(0.023941813, 0, 0, 0)
			InputText.Size = UDim2.new(0, 279, 0, 31)
			InputText.Font = Enum.Font.Code
			InputText.Text = Text
			InputText.TextColor3 = Color3.fromRGB(255, 255, 255)
			InputText.TextSize = 15.000
			InputText.TextXAlignment = Enum.TextXAlignment.Left
			
			InputBG.Name = "InputBG"
			InputBG.Parent = Input
			InputBG.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			InputBG.BackgroundTransparency = 0.050
			InputBG.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputBG.BorderSizePixel = 0
			InputBG.Position = UDim2.new(0.545966208, 0, 0, 0)
			InputBG.Size = UDim2.new(0, 241, 0, 31)
			
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = InputBG
			
			InputTextValue.Name = "InputTextValue"
			InputTextValue.Parent = InputBG
			InputTextValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputTextValue.BackgroundTransparency = 1.000
			InputTextValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputTextValue.BorderSizePixel = 0
			InputTextValue.Size = UDim2.new(0, 241, 0, 31)
			InputTextValue.Font = Enum.Font.Code
			InputTextValue.PlaceholderText = PlaceHolder
			InputTextValue.Text = Def
			InputTextValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			InputTextValue.TextSize = 15.000

			task.spawn(function()
				InputTextValue.FocusLost:Connect(function()
					local TheText = InputTextValue.Text
					Flags[Flag] = TheText
					pcall(Callback,tostring(TheText))
					
				end)
			end)
		end
		return PageItems

	end

	return Window

end

return Library
