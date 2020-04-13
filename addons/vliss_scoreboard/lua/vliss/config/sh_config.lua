
Vliss.Core.WorkshopEnabled = true
Vliss.Core.ResourcesEnabled = true



Vliss.Core.NetworkName = "RSG STARWARSRP"
Vliss.Core.HideSpectators = false   -- Set this to true if you don't want spectators shown on the scoreboard.
Vliss.Core.TeamMode = true           -- Set this to true if you want vliss to show players grouped in a team box. SHOULD BE TURNED OFF FOR MURDER.
Vliss.Core.TeamRowColor = Color( 25, 25, 25, 220 )  -- Color of team name row
Vliss.Core.TeamColoring = true      -- Set this to true if you want the player rows to reflect their team coloring.
Vliss.Core.AboutVlissEnabled = false



Vliss.Core.BackgroundBlurEnabled = true
Vliss.Core.BackgroundBlurPlyrowEnabled = true

Vliss.Core.BackgroundsEnable = false

Vliss.Core.Backgrounds = {
    "http://buzzgfx.com/wp-content/uploads/2014/06/main-background1.jpg",
    "http://images2.alphacoders.com/878/87822.jpg",
    "http://p1.pichost.me/i/52/1752357.jpg",
    "http://www.electricblueskies.com/wp/wp-content/uploads/2012/05/48-Half-Life-2-1080p-Wallpaper-Garrys-Mod-Highway-17-COAST-Landscape-Environment-scenery-set-piece-Bridge.jpg",
    "http://wallpaper-download.net/wallpapers/abstract-wallpapers-blue-bokeh-background-wallpaper-37238.jpg",
    "http://www.dailybackgrounds.com/wp-content/uploads/2015/01/half-life-2-wallpaper.jpg",
    "http://media.moddb.com/images/mods/1/12/11836/background010005.jpg"
}



-----------------------------------------------------------------
-- [ GUI SETTINGS ]
-----------------------------------------------------------------

Vliss.Core.ScoreboardScaleW = 0.85
Vliss.Core.ScoreboardScaleH = 0.85

Vliss.Core.NetworkNameColor = Color( 255, 255, 255, 255 )
Vliss.Core.PlayerRowInfoColor = Color( 255, 255, 255, 255)
Vliss.Core.MiddlePanelBGColor = Color( 16, 16, 16, 210 )
Vliss.Core.LeftMidPanelBGColor = Color( 0, 0, 0, 250 )
Vliss.Core.LeftTopPanelBGColor = Color( 0, 100, 200, 250 )
Vliss.Core.LeftTopButtonHoverColor = Color( 40, 0, 0, 255 )

-----------------------------------------------------------------
-- [ GROUP SETTINGS ]
-- Usergroup colors and naming
-----------------------------------------------------------------

Vliss.Core.UserGroupColoring = false  -- Set this to true if you want your user groups to have different coloring as defined below. 

Vliss.Core.UserGroupColors = {}
Vliss.Core.UserGroupColors["owner"] = Color( 255, 0, 0, 220 )
Vliss.Core.UserGroupColors["coowner"] = Color( 255, 0, 0, 220 )
Vliss.Core.UserGroupColors["superadmin"] = Color( 0, 80, 255, 220 )
Vliss.Core.UserGroupColors["admin"] = Color( 0, 125, 255, 220 )
Vliss.Core.UserGroupColors["user"] = Color( 5, 5, 5, 220 )
Vliss.Core.UserGroupColors["noaccess"] = Color( 5, 5, 5, 220 )

Vliss.Core.UserGroupTitles = {}
Vliss.Core.UserGroupTitles["owner"] = "Owner"
Vliss.Core.UserGroupTitles["coowner"] = "Co-Owner"
Vliss.Core.UserGroupTitles["superadmin"] = "Super Administrator"
Vliss.Core.UserGroupTitles["admin"] = "Administrator"
Vliss.Core.UserGroupTitles["user"] = "Guest"
Vliss.Core.UserGroupTitles["noaccess"] = "Guest"

-----------------------------------------------------------------
-- [ GUI - STAFF CARD ]
-----------------------------------------------------------------
-- The staff card is displayed on the "View Staff" page.
-- Each staff member that shows on that page is kept within 
-- a container called the "Staff Card". The settings below
-- allow you to modify the cosmetics of this feature.
-----------------------------------------------------------------

Vliss.Core.StaffCardBlur = false
Vliss.Core.StaffCardBGUseRankColor = true                       -- Use rank color for staff card background color?
Vliss.Core.StaffCardBGColor = Color( 0, 0, 0, 230 ) 
Vliss.Core.StaffCardNameColor = Color( 255, 255, 255, 255 )     -- Text color for player name
Vliss.Core.StaffCardRankColor = Color( 255, 255, 255, 255 )     -- Text color for rank name

-----------------------------------------------------------------
-- [ GUI - THOSE LITTLE LINES ]
-----------------------------------------------------------------
-- These are the little cosmetic lines to the top right and 
-- bottom left of each button. You can customize their color
-- and legnth here.
-----------------------------------------------------------------

Vliss.Core.ButtonLinedrawLength = 15
Vliss.Core.ButtonLinedrawColor = Color( 255, 255, 255, 255 )

-----------------------------------------------------------------
-- [ GUI - COMMAND BOX ]
-----------------------------------------------------------------
-- These settings deal with the command box colors.
-- The command box is the box that appears when you click on a 
-- players name in the scoreboard and the box at the bottom 
-- appears.
-----------------------------------------------------------------

Vliss.Core.CBoxLineColor = Color( 255, 255, 255, 255 )
Vliss.Core.CBoxAllowedBGColor = Color( 0, 100, 200, 200 )
Vliss.Core.CBoxDeniedBGColor = Color( 0, 100, 200, 0 )
Vliss.Core.CBoxTextColor = Color( 255, 255, 255, 255 )
Vliss.Core.CBoxMoneyTextColor = Color( 76, 146, 255 )
Vliss.Core.CBoxCloseButtonColor = Color( 255, 255, 255, 255 )

-----------------------------------------------------------------
-- [ CUSTOM WIDGET ]
-----------------------------------------------------------------
-- These settings control the custom widget to the bottom left
-- of Vliss. It was originally used for just displaying a clock
-- but as time goes on, it will have multiple purposes.
-----------------------------------------------------------------
-- [ Vliss.Core.WidgetEnabled ]
--
-- Determines if the widget should show or not.
--      Default: %a, %I:%M:%S %p
-----------------------------------------------------------------
-- [ Vliss.Core.WidgetClockFormat ]
--
-- If the clock widget is enabled, then this setting determines 
-- how the clock will display the date/time.
-- 
-- For a list of what formats you can use, visit:
-- http://www.gammon.com.au/scripts/doc.php?lua=os.date
-----------------------------------------------------------------
-- [ Vliss.Core.WidgetType ]
--
-- This setting determines how will show in the widget.
--      Vliss.Core.WidgetType = 1   :: Displays a clock
--      Vliss.Core.WidgetType = 2   :: Current map / # of players
-----------------------------------------------------------------
-- [ Vliss.Core.WidgetTextColor ]
--
-- Just determines what color the text should be. 
--      Default: Color( 255,255,255,255 ) - White
-----------------------------------------------------------------

Vliss.Core.WidgetEnabled = true
Vliss.Core.WidgetType = 2 -- 1: clock | 2: map+player count
Vliss.Core.WidgetClockFormat = "%a, %I:%M:%S %p"
Vliss.Core.WidgetTextColor = Color( 255, 255, 255, 255 )

-----------------------------------------------------------------
-- [ AVATAR SYSTEM ]
-----------------------------------------------------------------
-- This feature will replace standard player avatars with 
-- spiffy ones. 
-----------------------------------------------------------------
-- [MURDER]: Players won't have avatars by default, but enabling
-- this will at least put an avatar to the left of the player
-- and give it more of a visual enhancement.
-----------------------------------------------------------------
-- [OTHER GAMEMODES]: By default, players will display their
-- actual steam profile avatars. Using this will remove the 
-- profile picture for each player and use the random avatar
-- system.
-----------------------------------------------------------------

Vliss.Core.UseSpiffyAvatars = false

Vliss.Core.AvatarTable = { 
    "vliss/avatars/vliss_avatar_1.png",
    "vliss/avatars/vliss_avatar_2.png",
    "vliss/avatars/vliss_avatar_3.png",
    "vliss/avatars/vliss_avatar_4.png",
    "vliss/avatars/vliss_avatar_5.png",
    "vliss/avatars/vliss_avatar_6.png",
    "vliss/avatars/vliss_avatar_7.png",
    "vliss/avatars/vliss_avatar_8.png",
    "vliss/avatars/vliss_avatar_9.png",
    "vliss/avatars/vliss_avatar_10.png",
    "vliss/avatars/vliss_avatar_11.png",
    "vliss/avatars/vliss_avatar_12.png",
    "vliss/avatars/vliss_avatar_13.png",
    "vliss/avatars/vliss_avatar_14.png",
    "vliss/avatars/vliss_avatar_15.png",
    "vliss/avatars/vliss_avatar_16.png",
    "vliss/avatars/vliss_avatar_17.png",
    "vliss/avatars/vliss_avatar_18.png",
    "vliss/avatars/vliss_avatar_19.png",
    "vliss/avatars/vliss_avatar_20.png",
    "vliss/avatars/vliss_avatar_21.png"
}

-----------------------------------------------------------------
-- [ PERMISSIONS - CORE FEATURES ]
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
-- CAUTION: The setting Vliss.Core.AccessXferPlayer allows 
-- staff to TRANSFER a player to another server on your network 
-- from the list of servers you define. I HIGHLY recommend you
-- only set superadmins (owners) to be able to access this.
-- It is powerful - and staff can abuse it.
-----------------------------------------------------------------

Vliss.Core.StaffGroups = {
    ["superadmin"] = true, 
	["owner"] = true, 
    ["admin"] = true, 
    ["CM"] = true, 
    ["TMod"] = true,
	["Mod"] = true,
	["mod"] = true,
	["Head-Staff"] = true,
}

Vliss.Core.AccessXferPlayer = { 
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["CM"] = true, 
    ["TMod"] = true,
	["owner"] = true, 
	["Mod"] = true,
	["Head-Staff"] = true,
	["mod"] = true,
}
Vliss.Core.CopyPlayerSteamID = { 
    ["superadmin"] = true, 
    ["admin"] = true, 
    ["CM"] = true, 
	["owner"] = true, 
    ["TMod"] = true,
	["Mod"] = true,
	["Head-Staff"] = true,
	["mod"] = true,
} 

Vliss.Core.CopyPlayerIPAddress = { 
	["superadmin"] = true, 
    ["CM"] = true, 
	["owner"] = true, 
	["Head-Staff"] = true,
} 

-----------------------------------------------------------------
-- Browser Settings
-----------------------------------------------------------------
-- How the internet browser will act when outside links 
-- are clicked.
-----------------------------------------------------------------

Vliss.Core.BrowserColor = Color( 0, 0, 0, 240 )                  -- Color to use for the custom browser window.

-----------------------------------------------------------------
--  Broadcasting System - Dont really need to touch
-----------------------------------------------------------------
Vliss.Messages.BCColorName = Color(178, 237, 0)
Vliss.Messages.BCColorType = Color(255, 255, 0)
Vliss.Messages.BCColorMsg = Color(255, 255, 255)
Vliss.Messages.BCColorValue = Color(255, 0, 0)
Vliss.Messages.BCColorValue2 = Color(45, 147, 181)
Vliss.Messages.BCColorBind = Color(255, 255, 0)
