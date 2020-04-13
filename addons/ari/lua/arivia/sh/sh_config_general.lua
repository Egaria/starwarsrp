-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------
--
-- Best viewed in Sublime Text Editor
-- http://www.sublimetext.com/3
--
-----------------------------------------------------------------

-----------------------------------------------------------------
-- [ WORKSHOP / FASTDL RESOURCES ]
-----------------------------------------------------------------
-- Set [Arivia.ResourcesEnable] to false if you do not wish 
-- for the server to force players to download the 
-- resources/materials.
-----------------------------------------------------------------
-- Set [Arivia.WorkshopEnabled] to false if you do not wish
-- for the server to force clients to download the resources 
-- from the workshop.
-----------------------------------------------------------------

Arivia.ResourcesEnable = true
Arivia.WorkshopEnabled = true

-----------------------------------------------------------------
-- Background Settings
-- 
-- These settings are for background functionality
-----------------------------------------------------------------

Arivia.BackgroundsEnable = true
Arivia.Backgrounds = {
    "http://buzzgfx.com/wp-content/uploads/2014/06/main-background1.jpg",
    "http://images2.alphacoders.com/878/87822.jpg",
    "http://p1.pichost.me/i/52/1752357.jpg",
    "http://7-themes.com/data_images/out/34/6886301-blue-bokeh-wallpaper.jpg",
    "http://7-themes.com/data_images/out/71/7015945-lights-bokeh-photo.jpg"
}

-----------------------------------------------------------------
-- [ F4 VISUAL SETTINGS ]
-- 
-- These settings change the look of the F4 menu.
-----------------------------------------------------------------

Arivia.NetworkNameDisplayed = true                              -- Display a network name on top of F4 menu?
Arivia.NetworkName = "Welcome to RSG StarWarsRP"                   -- Network name to display if above option enabled
Arivia.NetworknameColor = Color( 255, 255, 255, 255 )           -- Color for network name text

Arivia.PlayerMoneyColor = Color( 255, 255, 255, 255 )           -- Color for player money
Arivia.PlayerJobColor = Color( 255, 255, 255, 255 )             -- Color for player job color

Arivia.MiddlePanelBlur = true                                   -- Enable panel blur on middle panel?
Arivia.MiddlePanelBackgroundColor = Color( 16, 16, 16, 210 )    -- Middle panel background color

Arivia.LeftMidPanelBlur = true
Arivia.LeftMidPanelBackgroundColor = Color( 0, 0, 0, 250 )

Arivia.LeftTopPanelBackgroundColor = Color( 128, 0, 0, 250 )
Arivia.LeftTopButtonHoverColor = Color( 40, 0, 0, 255 )

Arivia.CloseButtonColor = Color( 255, 255, 255, 255 )           -- Color for the close button in the top right

-----------------------------------------------------------------
-- [ PANEL REGENERATION ]
--
-- This is really for debugging purposes.
-- Regenerates the panel completely each time it's opened. Therefore
-- whatever panel the user is on prior to closing the menu will not
-- be saved as it cannot remember.
--
-- By default this is turned OFF (false)
-----------------------------------------------------------------

Arivia.InitRegenPanel = false

-----------------------------------------------------------------
-- [ CLOCK ]
--
-- Properties for the clock in the bottom left.
-----------------------------------------------------------------
--
-- ClockEnabled     :: Enable/Disable clock
-- ClockFormat      :: Default format for clock
-- ClockColor       :: Color of clock text
--
-----------------------------------------------------------------

Arivia.ClockEnabled = true
Arivia.ClockFormat = "%a, %I:%M:%S %p"
Arivia.ClockColor = Color( 255, 255, 255, 255 )

-----------------------------------------------------------------
-- [ LEVELING SYSTEM ]
--
-- This works for the DarkRP leveling system located at
-- https://github.com/vrondakis/Leveling-System
--
-- Will display the level required for a job / entity
-----------------------------------------------------------------

Arivia.LevelSystemEnabled = true

-----------------------------------------------------------------
-- [ STAFF PANEL ]
--
-- This will allow the F4 menu to display any staff that are
-- currently online. You can modify the colors of the cards.
-- As well as customize the name of the rank that will
-- appear with the card for that player.
-----------------------------------------------------------------
--
-- UserGroupColors  :: Colors for staff card box based on rank
-- UserGroupTitles  :: Allows you to rename a rank
-- StaffGroups      :: Specifies which ranks are considered "staff"
--
-----------------------------------------------------------------

Arivia.UserGroupColors = {}
Arivia.UserGroupColors["owner"] = Color( 200, 51, 50, 220 )
Arivia.UserGroupColors["superadmin"] = Color( 200, 51, 50, 220 )
Arivia.UserGroupColors["admin"] = Color( 72, 112, 58, 220 )
Arivia.UserGroupColors["CM"] = Color( 145, 71, 101, 220 )
Arivia.UserGroupColors["Head-Staff"] = Color( 171, 108, 44, 220 )
Arivia.UserGroupColors["mod"] = Color( 171, 108, 44, 220 )
Arivia.UserGroupColors["TMod"] = Color( 163, 135, 79, 220 )
Arivia.UserGroupColors["Mod"] = Color( 163, 135, 79, 220 )

Arivia.UserGroupTitles = {}
Arivia.UserGroupTitles["owner"] = "Owner"
Arivia.UserGroupTitles["superadmin"] = "Super Administrator"
Arivia.UserGroupTitles["admin"] = "Administrator"
Arivia.UserGroupTitles["CM"] = "Community Manager"
Arivia.UserGroupTitles["Mod"] = "Moderator"
Arivia.UserGroupTitles["mod"] = "Moderator"
Arivia.UserGroupTitles["Tmod"] = "Trial Moderator"
Arivia.UserGroupTitles["Head-Staff"] = "Head Of Staff"

Arivia.StaffGroups = { 
    "superadmin", 
    "admin", 
	"owner",
    "mod",
	"Mod",
	"TMod",
	"Head-Staff",
	"CM",
}

Arivia.StaffCardBlur = false
Arivia.StaffCardBackgroundUseRankColor = true                -- Use rank color for staff card background color?
Arivia.StaffCardBackgroundColor = Color( 0, 0, 0, 230 )      -- If Arivia.StaffCardBackgroundUseRankColor is FALSE - what do you want the card color to be?
Arivia.StaffCardNameColor = Color( 255, 255, 255, 255 )      -- Text color for player name
Arivia.StaffCardRankColor = Color( 255, 255, 255, 255 )      -- Text color for rank name

-----------------------------------------------------------------
-- [ LIST TITLE TRUNCATE ]
--
-- Sometimes titles are too long. Truncate takes a long string 
-- and replaces the last few characters with [...]
-- Adjust the settings below if you notice it is a bit off.
-----------------------------------------------------------------
--
-- TruncateEnabled  :: If the truncate feature is on or off
-- TruncateLength   :: How wide text must be before it truncates
--
-----------------------------------------------------------------

Arivia.TruncateEnabled = true
Arivia.TruncateLength = 170

-----------------------------------------------------------------
-- Browser Settings
-- 
-- How the internet browser will act when outside links 
-- are clicked.
-----------------------------------------------------------------

Arivia.BrowserColor = Color( 0, 0, 0, 240 ) -- Color to use for the custom browser window.

-----------------------------------------------------------------
--  Broadcasting System - Dont really need to touch
-----------------------------------------------------------------
Arivia.BCColorServer = Color(255, 255, 0)
Arivia.BCColorName = Color(77, 145, 255)
Arivia.BCColorMsg = Color(255, 255, 255)
Arivia.BCColorValue = Color(255, 0, 0)
Arivia.BCColorValue2 = Color(255, 166, 0)
Arivia.BCColorBind = Color(255, 255, 0)
