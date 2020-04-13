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
--  Server Listings
-----------------------------------------------------------------

Arivia.ServersEnabled = true                                 -- Should server row even display?
Arivia.ServerButtonColor = Color(15, 15, 15, 0)
Arivia.ServerButtonHoverColor = Color(255, 255, 255, 220)
Arivia.ServerButtonTextColor = Color(255, 255, 255, 255)
Arivia.ServerButtonHoverTextColor = Color(0, 0, 0, 255)
Arivia.UseServerIconsWithText = true                         -- This shows the icons with text.
Arivia.UseServerIconsOnly = false                            -- This will show the icons only, without the text counterpart. The above option OVERRIDES this, so please turn that off first.

Arivia.Servers = {
    {
        hostname = "RGaming DarkRP server",
        icon = "arivia/arivia_btn_server.png",
        ip = "213.47.253.38:27015"
    },
    
}