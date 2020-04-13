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
-- [ PROPHUNT MODE SETTINGS ]
-----------------------------------------------------------------
-- These settings are for the PROPHUNT GAMEMODE ONLY.
-- If you are using Vliss on another gamemode, then you should 
-- set Vliss.PropHunt.Enabled = false
-----------------------------------------------------------------

Vliss.PropHunt.Enabled = false -- Set this to true if PropHunt is your gamemode.

-----------------------------------------------------------------
-- Pay careful attention: With this gamemode you must set the 
-- teams based on which version of PropHunt you are running.
-- If you are running a version of PropHunt other than what is
-- below. You'll have to find the team numbers. (Usually in 
-- shared.lua for this gamemode.)
-----------------------------------------------------------------
-- [ PropHunt by Andrew ]
--
-- Vliss.PropHunt.TeamHunters 		1
-- Vliss.PropHunt.TeamProps 		2
-- Vliss.PropHunt.TeamSpectators 	3
-----------------------------------------------------------------
-- [ PropHunters by Mechnical Mind ]
-- 
-- Vliss.PropHunt.TeamHunters 		2
-- Vliss.PropHunt.TeamProps 		3
-- Vliss.PropHunt.TeamSpectators 	1
-----------------------------------------------------------------

Vliss.PropHunt.TeamHunters = 1
Vliss.PropHunt.TeamProps = 2
Vliss.PropHunt.TeamSpectators = 3

-----------------------------------------------------------------
-- [ OTHER SETTINGS ]
-----------------------------------------------------------------

Vliss.PropHunt.TeamPropsTitle = "Props"
Vliss.PropHunt.TeamHuntersTitle = "Hunters"
Vliss.PropHunt.SpectatorsTitle = "Spectators"
Vliss.PropHunt.SpeclistBoxHeight = 35
Vliss.PropHunt.SpeclistBoxColor = Color( 0, 0, 0, 250 )
Vliss.PropHunt.SpeclistBoxBorderlineColor = Color( 255, 255, 255, 255 )
Vliss.PropHunt.SpeclistTitleTextColor = Color( 230, 25, 25, 255 )
Vliss.PropHunt.SpeclistPlayersTextColor = Color( 255, 255, 255, 255 )

Vliss.PropHunt.ForceTeamCooldown = 5

Vliss.PropHunt.AccessMovePlayer = {
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["supervisor"] = true,
    ["operator"] = true, 
}
