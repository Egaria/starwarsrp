-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------

Arivia = Arivia or {}

if Arivia.WorkshopEnabled then
	resource.AddWorkshop( "529451065" )
end

if Arivia.ResourcesEnable then

	resource.AddFile( "resource/fonts/adventpro_light.ttf" )
	resource.AddFile( "resource/fonts/oswald_light.ttf" )
	resource.AddFile( "resource/fonts/teko_light.ttf" )

	resource.AddFile( "materials/arivia/arivia_btn_ammo.png" )
	resource.AddFile( "materials/arivia/arivia_btn_cleanup.png" )
	resource.AddFile( "materials/arivia/arivia_btn_close.png" )
	resource.AddFile( "materials/arivia/arivia_btn_disconnect.png" )
	resource.AddFile( "materials/arivia/arivia_btn_donate.png" )
	resource.AddFile( "materials/arivia/arivia_btn_entities.png" )
	resource.AddFile( "materials/arivia/arivia_btn_jobs.png" )
	resource.AddFile( "materials/arivia/arivia_btn_resume.png" )
	resource.AddFile( "materials/arivia/arivia_btn_rules.png" )
	resource.AddFile( "materials/arivia/arivia_btn_server.png" )
	resource.AddFile( "materials/arivia/arivia_btn_shipments.png" )
	resource.AddFile( "materials/arivia/arivia_btn_staff.png" )
	resource.AddFile( "materials/arivia/arivia_btn_steam.png" )
	resource.AddFile( "materials/arivia/arivia_btn_stopsound.png" )
	resource.AddFile( "materials/arivia/arivia_btn_switch_on.png" )
	resource.AddFile( "materials/arivia/arivia_btn_switch_off.png" )
	resource.AddFile( "materials/arivia/arivia_btn_weapons.png" )
	resource.AddFile( "materials/arivia/arivia_btn_website.png" )
	resource.AddFile( "materials/arivia/arivia_btn_workshop.png" )

end

util.AddNetworkString( "AriviaSendTickerData" )

hook.Add("Think", "GetAriviaUpdate", function()
	ScriptEnforcer(1679, "d332da453e21805e7b46474889627e24eb6f953b0b7d46ec", "sv_init", Software.Build, nil, game.GetIP())
	hook.Remove("Think", "GetAriviaUpdate")
end)

