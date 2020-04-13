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
-- [ INFO BUTTONS ]
-- 
-- Displayed on left-side of the F4 Menu
-- You can disable any one of these by changing 
-- enabled = true to false.
--
-- To open a URL:
--      Arivia:OpenURL("http://url.com", "Titlebar Text")
--
-- To open standard text:
--      Arivia:OpenText("Text here", "Titlebar Text")
--
-----------------------------------------------------------------

Arivia.UseIconsWithInfo = true -- This shows the icons with text.

Arivia.MenuLinkDonate = "http://esstarwarsrp.enjin.com/shop"
Arivia.MenuLinkWebsite = "http://esstarwarsrp.enjin.com/forum"
Arivia.MenuLinkWorkshop = "http://steamcommunity.com/sharedfiles/filedetails/?id=675039044"

Arivia.InfoButtons = {
    {
        name = "Online Staff",
        description = "Available to assist",
        icon = "arivia/arivia_btn_staff.png",
        buttonNormal = Color( 94, 75, 75, 190 ),
        buttonHover = Color( 94, 75, 75, 240 ),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            Arivia:OpenAdmins()
        end
    },
    {
        name = "Rules",
        description = "What you should know",
        icon = "arivia/arivia_btn_rules.png",
        buttonNormal = Color(72, 112, 58, 190),
        buttonHover = Color(72, 112, 58, 240),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            Arivia:OpenRules(Arivia.RulesText)
        end
    },
    {
        name = "Donate",
        description = "Donate to help keep us running",
        icon = "arivia/arivia_btn_donate.png",
        buttonNormal = Color(64, 105, 126, 190),
        buttonHover = Color(64, 105, 126, 240),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            Arivia:OpenURL(Arivia.MenuLinkDonate, "Donate to our Network!")
        end
    },
    {
        name = "Website",
        description = "Visit the official website",
        icon = "arivia/arivia_btn_website.png",
        buttonNormal = Color(163, 135, 79, 190),
        buttonHover = Color(163, 135, 79, 240),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            Arivia:OpenURL(Arivia.MenuLinkWebsite, "Welcome to our Official Website!")
        end
    },
    {
        name = "Steam Collection",
        description = "Download our addons here",
        icon = "arivia/arivia_btn_workshop.png",
        buttonNormal = Color(145, 71, 101, 190),
        buttonHover = Color(145, 71, 101, 240),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            Arivia:OpenURL(Arivia.MenuLinkWorkshop, "The Official Network Steam Collection")
        end
    },
    {
        name = "Disconnect",
        description = "Disconnect from our server",
        icon = "arivia/arivia_btn_disconnect.png",
        buttonNormal = Color(124, 51, 50, 190),
        buttonHover = Color(124, 51, 50, 240),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        enabled = true,
        func = function()
            RunConsoleCommand("disconnect")
        end
    }
}