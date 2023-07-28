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
