--  _      _____  ___   _   __ ___________  ________   __
-- | |    |  ___|/ _ \ | | / /|  ___|  _  \ | ___ \ \ / /
-- | |    | |__ / /_\ \| |/ / | |__ | | | | | |_/ /\ V / 
-- | |    |  __||  _  ||    \ |  __|| | | | | ___ \ \ /  
-- | |____| |___| | | || |\  \| |___| |/ /  | |_/ / | |  
-- \_____/\____/\_| |_/\_| \_/\____/|___/   \____/  \_/                                                                                                            
--    ___      .__   __.   ______   .__   __. ____    ____ .___  ___.   ______    __    __       _______.    __       _______     ___       __  ___ .______      
--     /   \     |  \ |  |  /  __  \  |  \ |  | \   \  /   / |   \/   |  /  __  \  |  |  |  |     /       |   |  |     |   ____|   /   \     |  |/  / |   _  \     
--    /  ^  \    |   \|  | |  |  |  | |   \|  |  \   \/   /  |  \  /  | |  |  |  | |  |  |  |    |   (----`   |  |     |  |__     /  ^  \    |  '  /  |  |_)  |    
--   /  /_\  \   |  . `  | |  |  |  | |  . `  |   \_    _/   |  |\/|  | |  |  |  | |  |  |  |     \   \       |  |     |   __|   /  /_\  \   |    <   |      /     
--  /  _____  \  |  |\   | |  `--'  | |  |\   |     |  |     |  |  |  | |  `--'  | |  `--'  | .----)   |      |  `----.|  |____ /  _____  \  |  .  \  |  |\  \----.
-- /__/     \__\ |__| \__|  \______/  |__| \__|     |__|     |__|  |__|  \______/   \______/  |_______/       |_______||_______/__/     \__\ |__|\__\ | _| `._____|
-----------------------------------------------------------------
-- [ HOME BUTTONS ]
-----------------------------------------------------------------
-- Displayed on left-side of scoreboard
-- You can disable any one of these by changing 
-- enabled = true to false.
--
-- To open a URL:
--      Vliss:OpenURL("http://url.com", "Titlebar Text")
--
-- To open standard text:
--      Vliss:OpenText("Text here", "Titlebar Text")
--
-----------------------------------------------------------------

Vliss.UseMenuIconsWithText = true

Vliss.MenuLinkDonate = "http://facepunch.com/"
Vliss.MenuLinkWebsite = "http://facepunch.com/"
Vliss.MenuLinkWorkshop = "http://facepunch.com/"

Vliss.Buttons = {
    {
        name = "Website",
        description = "Visit the our official website",
        icon = "vliss/vliss_btn_website.png",
        buttonNormal = Color(50, 130, 255, 250),
        buttonHover = Color(50, 150, 255, 250),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            Vliss:OpenURL("URL HERE", "Name for title")
        end
    }
}

-----------------------------------------------------------------
-- [ ACTION BUTTONS ]
-----------------------------------------------------------------
-- Displayed on left-side of scoreboard
-----------------------------------------------------------------

Vliss.Actions = {
    {
        name = "Cleanup Props",
        description = "Remove all your props",
        icon = "vliss/vliss_btn_cleanup.png",
        buttonNormal = Color(50, 130, 255, 250),
        buttonHover = Color(50, 130, 255, 250),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            RunConsoleCommand("gmod_cleanup")
        end
    },
    {
        name = "Stop Sound",
        description = "Clear local sounds",
        icon = "vliss/vliss_btn_stopsound.png",
        buttonNormal = Color(50, 130, 255, 250),
        buttonHover = Color(50, 130, 255, 250),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            RunConsoleCommand("stopsound")
        end
    }
}

-----------------------------------------------------------------
-- [ CONTROL BUTTONS ]
-----------------------------------------------------------------
-- These are pretty much set for your own specifications based 
-- on what features your server has. I like to use a certain
-- color scheme for the buttons, so if you would like the same;
-- I've listed the colors below:
-----------------------------------------------------------------
-- Red              Color( 124, 51, 50, 190 )
-- Yellow/Gold      Color( 163, 135, 79, 190 )
-- Blue             Color( 64, 105, 126, 190 )
-- Fuschia          Color( 145, 71, 101, 190 )
-- Green            Color( 72, 112, 58, 190 )
-- Brown            Color( 112, 87, 58, 190 )
-----------------------------------------------------------------
-- You can also execute commands on players by forcing them to 
-- run a say command. It's the same as them doing an actin
-- themself.
-- RunConsoleCommand("say", "/placelaws")
-----------------------------------------------------------------

Vliss.Controls = {
    {
        control = "Q",
        description = "Context Menu",
        color = Color(255, 0, 0, 250),
        colorHover = Color(255, 0, 0, 250),
        enabled = true,
        func = function()
            RunConsoleCommand("+menu_context")

            if vliss_sb_init then vliss_sb_init:SetVisible(false) end
        end
    },
    {
        control = "Z",
        description = "Undo",
        color = Color(255, 0, 0, 250),
        colorHover = Color(255, 0, 0, 250),
        enabled = true,
        func = function()
            RunConsoleCommand("undo")
        end
    }
}
