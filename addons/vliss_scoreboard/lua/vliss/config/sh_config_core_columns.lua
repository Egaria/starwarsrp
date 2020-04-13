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
--  [ COLUMN CONFIGURATION ]
--  
--  This area allows you to setup the columns how you want.
--  The following list of items can be used for displaying data.
-- 
--  REMEMBER: Columns are sorted from RIGHT TO LEFT.
--
--  [GENERAL] ---------------------------------------------------
--
--  ply:Deaths()                (Number of deaths)
--  ply:Frags()                 (Number of kills)
--  ply:Health()                (Players current HP)
--  ply:GetUserGroup()          (User group player is in)
--  team.GetName( ply:Team() )  (Team -or job- assigned to player)
--
--  [TTT]  ------------------------------------------------------
--
--  math.Round( ply:GetBaseKarma() )  (Returns player karma)
--
-----------------------------------------------------------------

Vliss.ColumnKillSkullEnabled = true -- Enabled the skull to the right of a player who has died. False to disable.
Vliss.ColumnKillSkullColor = Color( 255, 255, 255, 255 ) -- Color of the skull. Default is white.
Vliss.ColumnSortBy = "teams" -- Set this to "teams", "kills" or "deaths" for valid functionality.
Vliss.ColumnStyleOCD = false

Vliss.CustomColumns = {}

Vliss.CustomColumns[2] = {
    enabled = true,
    name = "Deaths",
    width = 70,
    func = function(ply) return ply:Deaths() end
}

Vliss.CustomColumns[3] = {
    enabled = true,
    name = "Kills",
    width = 70,
    func = function(ply) return ply:Frags() end
}

Vliss.CustomColumns[4] = {
    enabled = false,
    name = "Health",
    width = 125,
    func = function(ply) return ply:Health() end
}

Vliss.CustomColumns[5] = {
    enabled = false,
    name = "Team", 
    width = 125,
    func = function(ply) return team.GetName(ply:Team()) end
}

Vliss.CustomColumns[6] = {
    enabled = true,
    name = "Rank", 
    width = 125,
    func = function(ply) return Vliss.Core.UserGroupTitles[ply:GetUserGroup()] and Vliss.Core.UserGroupTitles[ply:GetUserGroup()] or ply:GetUserGroup() end
}

-----------------------------------------------------------------
-- [ COLUMN - TTT ONLY ]
-- Displays the Karma for a player.
-----------------------------------------------------------------

hook.Add("PostGamemodeLoaded", "VlissTTTKarmaColumn", function()
    if GAMEMODE.FolderName == "terrortown" then
        Vliss.CustomColumns[7] = { 
            enabled = true,
            name = "Karma", 
            width = 100, 
            func = function(ply) return math.Round( ply:GetBaseKarma() ) end
        }
    end
end)
-----------------------------------------------------------------
-- [ COLUMN - DARKRP ONLY ]
-- Displays the Job for a player.
-----------------------------------------------------------------

hook.Add("PostGamemodeLoaded", "VlissDarkRPJobColumn", function()
    if GAMEMODE.FolderName == "darkrp" then
        Vliss.CustomColumns[8] = { 
            enabled = true,
            name = "Job", 
            width = 145, 
            func = function(ply) return team.GetName( ply:Team() ) end
        }
    end
end)

-----------------------------------------------------------------
-- [ COLUMN - UTIME]
-- Displays how many hours a player has on the server.
-----------------------------------------------------------------

hook.Add("InitPostEntity", "VlissUtimeColumn", function()
    if Utime then
        Vliss.CustomColumns[9] = {
            enabled = true,
            name = "Hours Played", 
            width = 125,
            func = function(ply) return math.floor( ( ply:GetUTime() + CurTime() - ply:GetUTimeStart() ) / 60 / 60 ) end
        }
    end
end)