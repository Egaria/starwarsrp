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
-- [ FONTS ]
-----------------------------------------------------------------

surface.CreateFont("VlissFontCloseGUI", {
    size = 14,
    weight = 700,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontBrowserTitle", {
    size = 26,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontNetworkName", {
    size = 34,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("VlissFontOnlineStaff", {
    size = 34,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("VlissFontServerInfo", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontServerStaffCount", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontPlayerName", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontStandardText", {
    size = 16,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontColName", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontColRealName", {
    size = 18,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontColKDRatio", {
    size = 42,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontSandboxItemLabel", {
    size = 11,
    weight = 500,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontSandboxItemAmt", {
    size = 12,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontControlKey", {
    size = 46,
    weight = 200,
    antialias = true,
    shadow = true,
    font = "Teko Light"
})

surface.CreateFont("VlissFontControlDesc", {
    size = 22,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontCardPlayerName", {
    size = 26,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontCardSteamID", {
    size = 18,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontCardRank", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontPlayername", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontRPMoney", {
    size = 34,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontSteamID", {
    size = 26,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontClock", {
    size = 34,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontMenuItem", {
    size = 25,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontButtonItem", {
    size = 18,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissFontMenuSubinfo", {
    size = 16,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("VlissAboutText", {
    size = 28,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissAboutUpdateText", {
    size = 16,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissAboutUpdateResultText", {
    size = 14,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontStandardAbout", {
    size = 15,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontAboutSInfo", {
    size = 15,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontAboutUpdateText", {
    size = 40,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontConfirmTitle", {
    size = 32,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("VlissFontConfirmText", {
    size = 14,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontConfirmBText", {
    size = 26,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontConfirmButton", {
    size = 14,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontPHSpecTitle", {
    size = 14,
    weight = 500,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontPHSpecList", {
    size = 14,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("VlissFontTTTRemaining", {
    size = 14,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})
