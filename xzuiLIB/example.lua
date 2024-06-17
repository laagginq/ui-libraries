-- // Library & Window
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xzuiLIB/src.lua"))()
local Window = Library:Create({Name = "xz TEST",Ver = "Build 1.0.0",Folder = "YouScriptHub", Key = Enum.KeyCode.RightShift})

-- // Tabs
local Tab1 = Window:Tab({Name = "Tab 1", ShowOnStartup = true})
local Tab2 = Window:Tab({Name = "Tab 2", ShowOnStartup = false})

-- // Elements
Tab1:Label({Text = "Label"})

Tab1:Button({Text = "Button", Callback = function()
	print("Button clicked")
end})

Tab1:Dropdown({Flag = "Dropdown", Text = "Dropdown", Value = 1, Values = {"1","2","3"}, Callback = function(v)
	print(v.." Selected")
end})

Tab1:Slider({Flag = "Slider", Text = "Slider", Min = 25, Def = 50, Max = 100, Suffix = "%", Callback = function(v)
	print(v)
end})

Tab1:Toggle({Flag = "Toggle", Text = "Toggle", Default = true, Callback = function(v)
	print(v)
end})

Tab1:Input({Flag = "Input", Text = "Input", Default = "Yea nigga", PlaceHolder = "Input text here", Callback = function(v)
	print(v)
end})

-- // Print all the flags 

task.wait(0.1)

for i,v in pairs(Flags) do 
    print(i,v)
end
