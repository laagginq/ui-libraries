-- // shitlib ... xz#1111 no need for credits jst dont claim its yours :sob:
local Library = {}

local Player = game:GetService("Players").LocalPlayer
local TS, UIS, mouse = game:GetService("TweenService"), game:GetService("UserInputService"), Player:GetMouse()

local shit = {
	togglebind = Enum.KeyCode.RightShift,
	accent = Color3.fromRGB(106,90,205)
	
}


function Library:Create(name,subname,keybind)
	if game.CoreGui:FindFirstChild(name) then
		game.CoreGui:FindFirstChild(name):Destroy()
	end
	local xz = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local SubTitle = Instance.new("TextLabel")
	local TabsHolder = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local PageHolder = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")
	xz.Name = name
	xz.Parent = game.CoreGui
	xz.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Main.Name = "Main"
	Main.Parent = xz
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0, 192, 0, 224)
	Main.Size = UDim2.new(0, 645, 0, 366)
	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.00930232555, 0, 0, 0)
	Title.Size = UDim2.new(0, 179, 0, 34)
	Title.Font = Enum.Font.GothamBold
	Title.Text = name
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 24.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	SubTitle.Name = "SubTitle"
	SubTitle.Parent = Main
	SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SubTitle.BackgroundTransparency = 1.000
	SubTitle.Position = UDim2.new(0.00930232555, 0, 0.0928961784, 0)
	SubTitle.Size = UDim2.new(0, 179, 0, 18)
	SubTitle.Font = Enum.Font.Gotham
	SubTitle.Text = subname
	SubTitle.TextColor3 = Color3.fromRGB(157, 157, 157)
	SubTitle.TextSize = 12.000
	SubTitle.TextXAlignment = Enum.TextXAlignment.Left
	TabsHolder.Name = "TabsHolder"
	TabsHolder.Parent = Main
	TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabsHolder.BackgroundTransparency = 1.000
	TabsHolder.BorderSizePixel = 0
	TabsHolder.Position = UDim2.new(0.00930232555, 0, 0.158469945, 0)
	TabsHolder.Size = UDim2.new(0, 179, 0, 302)
	UIListLayout.Parent = TabsHolder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 8)
	PageHolder.Name = "PageHolder"
	PageHolder.Parent = Main
	PageHolder.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	PageHolder.BorderSizePixel = 0
	PageHolder.Position = UDim2.new(0.297674417, 0, 0.0191256832, 0)
	PageHolder.Size = UDim2.new(0, 447, 0, 353)
	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = PageHolder
	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Main
	
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
	
	dragify(Main)
	UIS.InputBegan:Connect(function(key,gp)
		if not gp then
			if key == Enum.KeyCode.RightShift then
				Main.Visible = not Main.Visible
			end
		end
	end)
	
	local Window = {}
	
	function Window:tab(tabname,showonstartup)
		local Tab = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		Tab.Name = "Tab"
		Tab.Parent = TabsHolder
		Tab.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 179, 0, 26)
		Tab.Font = Enum.Font.Gotham
		Tab.Text = tabname
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 14.000
		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Tab
		
		local Page = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local PageContainer = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		Page.Name = tabname
		Page.Parent = PageHolder
		Page.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
		Page.BorderSizePixel = 0
		Page.Size = UDim2.new(0, 447, 0, 353)
		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Page
		PageContainer.Name = "PageContainer"
		PageContainer.Parent = Page
		PageContainer.Active = true
		PageContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageContainer.BackgroundTransparency = 1.000
		PageContainer.BorderSizePixel = 0
		PageContainer.Position = UDim2.new(0.0134228189, 0, 0.0198300276, 0)
		PageContainer.Size = UDim2.new(0, 435, 0, 339)
		PageContainer.ScrollBarThickness = 0
		UIListLayout.Parent = PageContainer
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 8)
		
		if showonstartup then
			Page.Visible = true
			Tab.TextTransparency = 0
		else
			Page.Visible = false
			Tab.TextTransparency = 0.5
		end
		
		Tab.MouseButton1Click:Connect(function()
			for i,v in pairs(PageHolder:GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = false
				end
			end
			for x,z in pairs(TabsHolder:GetChildren()) do
				if z:IsA("TextButton") then
					z.TextTransparency = 0.5
				end
			end
			Page.Visible = true
			Tab.TextTransparency = 0
		end)
		
		local pageitems = {}
		
		function pageitems:label(text)
			local Label = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local LabelText = Instance.new("TextLabel")
			Label.Name = text
			Label.Parent = PageContainer
			Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 435, 0, 32)
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Label
			LabelText.Name = "LabelText"
			LabelText.Text = tostring(text)
			LabelText.Parent = Label
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.Position = UDim2.new(0.0137931034, 0, 0, 0)
			LabelText.Size = UDim2.new(0, 423, 0, 32)
			LabelText.Font = Enum.Font.Gotham
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 14.000
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
		end
		
		function pageitems:button(text,callback)
			local callback = callback or function() end
			
			local Button = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Button_2 = Instance.new("TextButton")
			Button.Name = text
			Button.Parent = PageContainer
			Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 435, 0, 32)
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Button
			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.Text = text
			Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.BackgroundTransparency = 1.000
			Button_2.Position = UDim2.new(0.0140000004, 0, 0, 0)
			Button_2.Size = UDim2.new(0, 423, 0, 32)
			Button_2.Font = Enum.Font.Gotham
			Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button_2.TextSize = 14.000
			Button_2.TextXAlignment = Enum.TextXAlignment.Left
			
			Button_2.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end
		
		function pageitems:toggle(text,state,callback)
			local callback = callback or function() end
			
			local toggled = state
			
			local Toggle = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Button = Instance.new("TextButton")
			local Toggle_2 = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			Toggle.Name = text
			Toggle.Parent = PageContainer
			Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 435, 0, 32)
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Toggle
			Button.Name = "Button"
			Button.Parent = Toggle
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BackgroundTransparency = 1.000
			Button.Position = UDim2.new(0.0140000004, 0, 0, 0)
			Button.Size = UDim2.new(0, 423, 0, 32)
			Button.Font = Enum.Font.Gotham
			Button.Text = text
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.TextXAlignment = Enum.TextXAlignment.Left
			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Toggle
			Toggle_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			Toggle_2.Position = UDim2.new(0.935000002, 0, 0.125, 0)
			Toggle_2.Size = UDim2.new(0, 24, 0, 24)
			Toggle_2.Image = "rbxassetid://10449228819"
			Toggle_2.ImageTransparency = 1

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Toggle_2
			
			if toggled == true then
				Toggle_2.ImageTransparency = 0
			elseif toggled == false then
				Toggle_2.ImageTransparency = 1
			end
			
			Button.MouseButton1Click:Connect(function()
				toggled = not toggled
				if toggled == true then
					Toggle_2.ImageTransparency = 0
				elseif toggled == false then
					Toggle_2.ImageTransparency = 1
				end
				pcall(callback, toggled)
			end)
		end
		
		function pageitems:input(text,placeholder,clearonreturn,callback)
			local callback = callback or function() end
			
			local Input = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local LabelText = Instance.new("TextLabel")
			local Input_2 = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")
			Input.Name = text
			Input.Parent = PageContainer
			Input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Input.BorderSizePixel = 0
			Input.Size = UDim2.new(0, 435, 0, 32)
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Input
			LabelText.Name = "LabelText"
			LabelText.Parent = Input
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.Position = UDim2.new(0.0137931034, 0, 0, 0)
			LabelText.Size = UDim2.new(0, 290, 0, 32)
			LabelText.Font = Enum.Font.Gotham
			LabelText.Text = text
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 14.000
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
			Input_2.Name = "Input"
			Input_2.Parent = Input
			Input_2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			Input_2.Position = UDim2.new(0.680459797, 0, 0.125, 0)
			Input_2.Size = UDim2.new(0, 134, 0, 24)
			Input_2.Font = Enum.Font.Gotham
			Input_2.Text = ""
			Input_2.PlaceholderText = placeholder or ""
			Input_2.ClearTextOnFocus = false
			Input_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Input_2.TextSize = 14.000
			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Input_2
			Input_2.FocusLost:Connect(function()
				pcall(callback, tostring(Input_2.Text))
				if clearonreturn then
					Input_2.Text = ""
				end
			end)
			
			
		end
		return pageitems

	end

	return Window

end

return Library
