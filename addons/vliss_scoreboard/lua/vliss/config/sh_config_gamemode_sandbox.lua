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
-- [ SANDBOX SETTINGS ]
-----------------------------------------------------------------
-- These settings are for the SANDBOX GAMEMODE ONLY.
-- If you are using Vliss on another gamemode, then you should 
-- set Vliss.Sandbox.Enabled = false
-----------------------------------------------------------------

Vliss.Sandbox.Enabled = false

-----------------------------------------------------------------
-- [ SANDBOX - OBJECT COUNTING ]
-----------------------------------------------------------------
-- This feature allows you to click on a player in Vliss, and see
-- exactly how much of each item they have spawned in at that 
-- time. (IE: Props, sents, NPCs, etc.)
-----------------------------------------------------------------
-- You can disable certain ones if they are not applicable to 
-- your server and modify other settings as desired.
-----------------------------------------------------------------

Vliss.Sandbox.CountList = {
    {
        enabled = true,
        name = "Props",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "props" ) end
    },
    {
        enabled = true,
        name = "Hoverballs",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "hoverballs" ) end
    },
    {
        enabled = true,
        name = "Thrusters",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "thrusters" ) end
    },
    {
        enabled = true,
        name = "Balloons",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "balloons" ) end
    },
    {
        enabled = true,
        name = "Buttons",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "buttons" ) end
    },
    {
        enabled = true,
        name = "Dynamite",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "dynamite" ) end
    },
    {
        enabled = true,
        name = "Sents",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "sents" ) end
    },
    {
        enabled = true,
        name = "Ragdolls",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "ragdolls" ) end
    },
    {
        enabled = true,
        name = "Effects",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "effects" ) end
    },
    {
        enabled = true,
        name = "Vehicles",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "vehicles" ) end
    },
    {
        enabled = true,
        name = "NPCs",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "npcs" ) end
    },
    {
        enabled = true,
        name = "Emitters",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "emitters" ) end
    },
    {
        enabled = true,
        name = "Lamps",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "lamps" ) end
    },
    {
        enabled = true,
        name = "Spawners",
        textColor = Color(255,255,255,255),
        buttonColor = Color(124, 51, 50, 190),
        buttonColorHover = Color(124, 51, 50, 240),
        func = function(ply) return ply:GetCount( "spawners" ) end
    }


}
