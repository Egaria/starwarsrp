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
-- [ MAIN TABS ]
--
-- The main tabs for the F4 menu. These are populated automatically
-- based on the setup of your DarkRP server.
--
-- NOTE: DO NOT DELETE ANY OF THESE. IF ITEMS DO NOT EXIST - THEY
-- WILL REMOVE THEMSELVES AUTOMATICALLY.
-----------------------------------------------------------------

Arivia.TabJobs = {
    name = "Jobs",
    description = "Earning your paycheck",
    icon = "arivia/arivia_btn_jobs.png",
    buttonColor = Color(64, 105, 126, 190),
    buttonHoverColor = Color(64, 105, 126, 240),
    unavailableDarken = true,
    unavailableColor = Color( 20, 20, 20, 200 ),
    showUnavailableJobs = true
}

Arivia.TabWeapons = {
    name = "Weapons",
    description = "The beauty of the 2nd amendment",
    icon = "arivia/arivia_btn_weapons.png",
    buttonColor = Color( 72, 112, 58, 190 ),
    buttonHoverColor = Color( 72, 112, 58, 240 ),
    unavailableDarken = true,
    unavailableColor = Color( 20, 20, 20, 200 )
}

Arivia.TabAmmo = {
    name = "Ammo",
    description = "Keeping your guns ready",
    icon = "arivia/arivia_btn_ammo.png",
    buttonColor = Color( 163, 135, 79, 190 ),
    buttonHoverColor = Color( 163, 135, 79, 240 ),
    unavailableDarken = true,
    unavailableColor = Color( 20, 20, 20, 200 )
}

Arivia.TabEntities = {
    name = "Entities",
    description = "Items for use in-world",
    icon = "arivia/arivia_btn_entities.png",
    buttonColor = Color( 124, 51, 50, 190 ),
    buttonHoverColor = Color( 124, 51, 50, 240 ),
    unavailableDarken = true,
    unavailableColor = Color( 20, 20, 20, 200 )
}

Arivia.TabVehicles = {
    name = "Vehicles",
    description = "Getting your permit",
    icon = "arivia/arivia_btn_vehicles.png",
    buttonColor = Color(64, 105, 126, 190),
    buttonHoverColor = Color(64, 105, 126, 240),
    unavailableDarken = true,
    unavailableColor = Color( 20, 20, 20, 200 )
}

Arivia.TabShipments = {
    name = "Shipments",
    description = "Extra things to help out",
    icon = "arivia/arivia_btn_shipments.png",
    buttonColor = Color( 145, 71, 101, 190 ),
    buttonHoverColor = Color( 145, 71, 101, 240 ),
    unavailableDarken = true,
    unavailableColor = Color( 20, 20, 20, 200 ),
    showUnavailableGuns = false
}
