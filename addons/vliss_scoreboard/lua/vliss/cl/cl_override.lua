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

GM = GM or GAMEMODE
Vliss = Vliss or {}

local OverrideScoreboard = CreateClientConVar("FAdmin_OverrideScoreboard", 1, true, false)
CreateClientConVar("vliss_scoreboardtoggle", 0, true, false)

-----------------------------------------------------------------
-- [ DEFINE VLISS_SB_INIT ]
-----------------------------------------------------------------

vliss_sb_init = vliss_sb_init or nil

-----------------------------------------------------------------
-- [ REMOVE SCOREBOARD ]
-----------------------------------------------------------------

function Vliss:RemoveScoreboard()
    if vliss_sb_init then
        vliss_sb_init:Remove()
        vliss_sb_init = nil
    end
end

-----------------------------------------------------------------
-- [ CREATE SCOREBOARD ]
-----------------------------------------------------------------

function Vliss:CreateScoreboard()
    Vliss:RemoveScoreboard()
    vliss_sb_init = vgui.Create( "vliss_scoreboard" )
end

-----------------------------------------------------------------
-- [ THINK ]
-----------------------------------------------------------------

local nextThink = 0

hook.Add("Think", "ScoreboardToggle", function()

    if GetConVarNumber("vliss_scoreboardtoggle") != 1 then return end
    if nextThink > CurTime() then return end

    if input.IsKeyDown( KEY_TAB ) then
        if not IsValid( GetScoreboardPanel() ) then
            Vliss:CreateScoreboard()
            return
        end

        GetScoreboardPanel():SetVisible(not GetScoreboardPanel():IsVisible())
        nextThink = CurTime() + 0.2
    end

end )

-----------------------------------------------------------------
-- [ HOOK->ScoreboardShow ]
-----------------------------------------------------------------

hook.Add( "ScoreboardShow", "DarkRP_Override", function()

    if GetConVarNumber("vliss_scoreboardtoggle") == 1 then return false end
    ShowScoreboard = true

	if not vliss_sb_init then
    	Vliss:CreateScoreboard()
	end

    gui.EnableScreenClicker(true)
    vliss_sb_init:SetVisible(true)
    vliss_sb_init:UpdateScoreboard(true)
    vliss_sb_init:StartUpdateTimer()

    return true

end )

-----------------------------------------------------------------
-- [ HOOK->ScoreboardHide ]
-----------------------------------------------------------------

hook.Add( "ScoreboardHide", "DarkRP_Override_H", function()
    if GetConVarNumber("vliss_scoreboardtoggle") == 1 then return false end
    ShowScoreboard = false
    gui.EnableScreenClicker(false)

    if vliss_sb_init then
        vliss_sb_init:SetVisible(false)
    end

end )

function GetScoreboardPanel()
    return vliss_sb_init
end