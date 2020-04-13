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
-- [ MURDER MODE SETTINGS ]
-----------------------------------------------------------------
-- These settings are for the MURDER GAMEMODE ONLY.
-- If you are using Vliss on another gamemode, then you should 
-- set Vliss.Murder.Enabled = false
-----------------------------------------------------------------

Vliss.Murder.Enabled = false -- Set this to true if Murder is your gamemode.
Vliss.Murder.StaffViewRealName = true -- Set to true to display real names to the right for STAFF ONLY.

Vliss.Murder.TeamPlayersLabel = "Players"
Vliss.Murder.TeamPlayersLabelColor = Color(255, 255, 255, 255)
Vliss.Murder.TeamPlayersLabelBgColor = Color( 0, 0, 0, 230 )
Vliss.Murder.TeamPlayersJoinBtnText = "Join"
Vliss.Murder.TeamPlayersJoinBtnColor = Color( 0, 0, 0, 255 )
Vliss.Murder.TeamPlayersJoinBtnTextColor = Color(255,255,255,255)

Vliss.Murder.TeamSpecLabel = "Spectators"
Vliss.Murder.TeamSpecLabelColor = Color(255, 255, 255, 255)
Vliss.Murder.TeamSpecLabelBgColor = Color( 0, 0, 0, 230 )
Vliss.Murder.TeamSpecJoinBtnText = "Join"
Vliss.Murder.TeamSpecJoinBtnColor = Color(0,0,0,255)
Vliss.Murder.TeamSpecJoinBtnTextColor = Color(255,255,255,255)
Vliss.Murder.AllowPlayerViewProfile = false  -- This will disable the button so players cannot see other player's profile links in murder.

Vliss.Murder.AdminFeatures = {
    ButtonContainerW = 450,
    ButtonContainerH = 100,
    ButtonActionW = 100,
    ButtonActionH = 25,
    ButtonNormalColor = Color(64, 105, 126, 190),
    ButtonHoverColor = Color(64, 105, 126, 240),
    ButtonTextColor = Color(255,255,255,255),
}

-----------------------------------------------------------------
-- [ PERMISSIONS - MURDER ]
-----------------------------------------------------------------
-- This section is IMPORTANT. Always remember that a person must 
-- be considered staff in the Vliss.Core.StaffGroups table in 
-- order for other permission tables to work.
-----------------------------------------------------------------
-- In order for ANY of the permissions to work, they MUST be 
-- considered a staff group that Vliss understands. This means 
-- that the group MUST be in the Vliss.Core.StaffGroups table
-- and set to TRUE for a group to be considered staff. If you
-- enable a permission in any other table that is not classified
-- as staff in the Vliss.Core.StaffGroups table, then they won't
-- get access.
--
-- Think of Vliss.Core.StaffGroups is the global ON or OFF 
-- switch. Turning a group off (false) in that table will revoke
-- all of their special Vliss permissions.
-----------------------------------------------------------------

Vliss.Murder.AccessViewIdentity = {
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["supervisor"] = true,
    ["operator"] = false, 
}

Vliss.Murder.AccessMovePlayer = {
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["supervisor"] = true,
    ["operator"] = true, 
}

Vliss.Murder.AccessForceMurderer = {
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["supervisor"] = true,
    ["operator"] = false, 
}

Vliss.Murder.AccessSpectate = {
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["supervisor"] = true,
    ["operator"] = false, 
}