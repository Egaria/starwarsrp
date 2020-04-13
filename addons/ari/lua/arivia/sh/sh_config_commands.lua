-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4
-- @release     10.23.2015
-----------------------------------------------------------------
--
-- Best viewed in Sublime Text Editor
-- http://www.sublimetext.com/3
--
-----------------------------------------------------------------

-----------------------------------------------------------------
-- [ COMMANDS / CONTROL BUTTONS ]
-- 
-- These are pretty much set for your own specifications based 
-- on what features your server has. I like to use a certain
-- color scheme for the buttons, so if you would like the same;
-- I've listed the colors below:
--
-- Red              Color( 124, 51, 50, 190 )
-- Yellow/Gold      Color( 163, 135, 79, 190 )
-- Blue             Color( 64, 105, 126, 190 )
-- Fuschia          Color( 145, 71, 101, 190 )
-- Green            Color( 72, 112, 58, 190 )
-- Brown            Color( 112, 87, 58, 190 )
--
-----------------------------------------------------------------

Arivia.Controls = {
    {
        control = "Q",
        description = "Context Menu",
        color = Color(124, 51, 50, 190),
        colorHover = Color(124, 51, 50, 240),
        enabled = true,
        func = function()
            RunConsoleCommand("+menu_context")
        end
    },
    {
        control = "Z",
        description = "Undo",
        color = Color(163, 135, 79, 190),
        colorHover = Color(163, 135, 79, 240),
        enabled = true,
        func = function()
            RunConsoleCommand("undo")
        end
    },
    {
        control = "C",
        description = "PAC Editor",
        color = Color(64, 105, 126, 190),
        colorHover = Color(64, 105, 126, 240),
        enabled = true,
        func = function()
            RunConsoleCommand("+menu")
        end
    },
    {
        control = "F4",
        description = "Pointshop",
        color = Color(145, 71, 101, 190),
        colorHover = Color(145, 71, 101, 240),
        enabled = true,
        func = function()
            RunConsoleCommand("+menu")
        end
    },
    {
        control = "F7",
        description = "Leaderboard",
        color = Color(72, 112, 58, 190),
        colorHover = Color(72, 112, 58, 240),
        enabled = true,
        func = function()
            RunConsoleCommand("+menu")
        end
    },
    {
        control = "F8",
        description = "Suggestions",
        color = Color(112, 87, 58, 190),
        colorHover = Color(112, 87, 58, 240),
        enabled = true,
        func = function()
            RunConsoleCommand("+menu")
        end
    }
}