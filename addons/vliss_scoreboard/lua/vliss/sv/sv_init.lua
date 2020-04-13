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

Vliss = Vliss or {}
Vliss.Messages = Vliss.Messages or {}

if Vliss.Core.WorkshopEnabled then
	resource.AddWorkshop( "524266848" )
end

if Vliss.Core.ResourcesEnabled then

	resource.AddFile( "resource/fonts/adventpro_light.ttf" )
	resource.AddFile( "resource/fonts/oswald_light.ttf" )
	resource.AddFile( "resource/fonts/teko_light.ttf" )

	resource.AddFile( "materials/vliss/vliss_btn_cleanup.png" )
	resource.AddFile( "materials/vliss/vliss_btn_close.png" )
	resource.AddFile( "materials/vliss/vliss_btn_copy.png" )
	resource.AddFile( "materials/vliss/vliss_btn_decals.png" )
	resource.AddFile( "materials/vliss/vliss_btn_disconnect.png" )
	resource.AddFile( "materials/vliss/vliss_btn_donate.png" )
	resource.AddFile( "materials/vliss/vliss_btn_group.png" )
	resource.AddFile( "materials/vliss/vliss_btn_home.png" )
	resource.AddFile( "materials/vliss/vliss_btn_ipaddress.png" )
	resource.AddFile( "materials/vliss/vliss_btn_leftpanel_actions.png" )
	resource.AddFile( "materials/vliss/vliss_btn_leftpanel_controls.png" )
	resource.AddFile( "materials/vliss/vliss_btn_leftpanel_home.png" )
	resource.AddFile( "materials/vliss/vliss_btn_leftpanel_news.png" )
	resource.AddFile( "materials/vliss/vliss_btn_limits.png" )
	resource.AddFile( "materials/vliss/vliss_btn_mainmenu.png" )
	resource.AddFile( "materials/vliss/vliss_btn_motd.png" )
	resource.AddFile( "materials/vliss/vliss_btn_player_actions.png" )
	resource.AddFile( "materials/vliss/vliss_btn_rcon.png" )
	resource.AddFile( "materials/vliss/vliss_btn_resume.png" )
	resource.AddFile( "materials/vliss/vliss_btn_server.png" )
	resource.AddFile( "materials/vliss/vliss_btn_speakenabled.png" )
	resource.AddFile( "materials/vliss/vliss_btn_speakmute.png" )
	resource.AddFile( "materials/vliss/vliss_btn_staff.png" )
	resource.AddFile( "materials/vliss/vliss_btn_steam.png" )
	resource.AddFile( "materials/vliss/vliss_btn_stopsound.png" )
	resource.AddFile( "materials/vliss/vliss_btn_switch_off.png" )
	resource.AddFile( "materials/vliss/vliss_btn_switch_on.png" )
	resource.AddFile( "materials/vliss/vliss_btn_unban.png" )
	resource.AddFile( "materials/vliss/vliss_btn_weap.png" )
	resource.AddFile( "materials/vliss/vliss_btn_website.png" )
	resource.AddFile( "materials/vliss/vliss_btn_workshop.png" )
	resource.AddFile( "materials/vliss/vliss_plystatus_dead.png" )
	resource.AddFile( "materials/vliss/vliss_status_dead.png" )

	resource.AddFile( "materials/vliss/avatars/vliss_avatar_1.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_2.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_3.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_4.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_5.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_6.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_7.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_8.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_9.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_10.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_11.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_12.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_13.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_14.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_15.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_16.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_17.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_18.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_19.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_20.png" )
	resource.AddFile( "materials/vliss/avatars/vliss_avatar_21.png" )

end

-----------------------------------------------------------------
-- [ ADDITIONALS ]
-----------------------------------------------------------------

AddCSLuaFile( "vliss/cl/cl_override.lua" )

-----------------------------------------------------------------
-- [ NETWORK STRINGS ]
-----------------------------------------------------------------

util.AddNetworkString("VlissMessageSet")
util.AddNetworkString("VlissPlayerIP")
util.AddNetworkString("VlissActionPlayerXfer")

-----------------------------------------------------------------
-- [ SERVER SETTINGS ]
-----------------------------------------------------------------

function Vliss:SettingsSetup()

	if not file.Exists( "vliss", "DATA" ) then
		file.CreateDir( "vliss" )
	end

	if not file.Exists( "vliss/settings", "DATA" ) then
		file.CreateDir( "vliss/settings" )
	end

	if not file.Exists( "vliss/settings/config.txt", "DATA" ) then
		file.Write( "vliss/settings/config.txt", "" )
	end

end
Vliss:SettingsSetup()

-----------------------------------------------------------------
-- [ MESSAGE / BROADCAST FEATURE ]
-----------------------------------------------------------------

local Player = FindMetaTable( "Player" )
	
function Vliss:Broadcast(...)
	local args = {...}
	net.Start( "VlissMessageSet" )
	net.WriteTable( args )
	net.Broadcast()
end

function Player:PlayerMsg(...)
	local args = {...}
	net.Start( "VlissMessageSet" )
	net.WriteTable( args )
	net.Send( self )
end

-----------------------------------------------------------------
-- [ JOIN TEAM ]
-- 
-- Controls the buttons on Vlisss which allow you to join 
-- whichever team you want.
-----------------------------------------------------------------

concommand.Add("vliss_jointeam", function (ply, com, args)

	if #args < 1 then return end

	if ( ply.timerLastChanged or 0 ) > CurTime() then
		ply:PlayerMsg( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[PRIVATE] ", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), "You must wait ", Vliss.Messages.BCColorValue2 or Color(45, 147, 181), math.Round(ply.timerLastChanged - CurTime()) .." more seconds", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), " before changing teams again.")
		return 
	end

	local curTeam = ply:Team()
	local newTeam = tonumber(args[1] or "") or 0
	if newTeam != curTeam then
		ply:SetTeam(newTeam)
		ply:KillSilent()
		Vliss:Broadcast( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[SERVER] ", Vliss.Messages.BCColorValue or Color( 255, 0, 0 ), ply:Nick(), Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), " has switched teams.")
		ply.timerLastChanged = CurTime() + ( Vliss.PropHunt.ForceTeamCooldown or 5 )
	end

end)

-----------------------------------------------------------------
-- [ FORCE TEAM SWITCH ]
-- 
-- This will allow an admin to force a teamswitch on another
-- player via the scoreboard.
-----------------------------------------------------------------

concommand.Add("vliss_forcemovetoteam", function (ply, com, args)

	if #args < 1 then return end

	if not Vliss.PropHunt.AccessMovePlayer[string.lower(ply:GetUserGroup())] then
		ply:PlayerMsg( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[PRIVATE] ", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), "You don't have permission to do this.")
		return
	end

	local ent = Entity(tonumber(args[1]) or -1)
	if !IsValid(ent) || !ent:IsPlayer() then return end

	if ( ply.timerLastChanged or 0 ) > CurTime() then
		ply:PlayerMsg( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[PRIVATE] ", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), "You must wait ", Vliss.Messages.BCColorValue2 or Color(45, 147, 181), math.Round(ply.timerLastChanged - CurTime()) .." more seconds", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), " before doing this.")
		return 
	end

	local curTeam = ent:Team()
	local newTeam = tonumber(args[2] or "") or 0
	if newTeam != curTeam then
		ent:SetTeam(newTeam)
		ent:KillSilent()
		Vliss:Broadcast( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[SERVER] ", Vliss.Messages.BCColorValue or Color( 255, 0, 0 ), ply:Nick(), Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), " forced team-switch on player ", Vliss.Messages.BCColorValue2 or Color(45, 147, 181), ent:Nick())
		ply.timerLastChanged = CurTime() + ( Vliss.PropHunt.ForceTeamCooldown or 5 )
	end

end)

net.Receive("VlissActionPlayerXfer", function( len, ply )

	if not (Vliss.Core.StaffGroups[string.lower(ply:GetUserGroup())] and Vliss.Core.AccessXferPlayer[string.lower(ply:GetUserGroup())]) then
		ply:PlayerMsg( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[PRIVATE] ", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), "You don't have permission to do this.")
		return 
	end
	
	local targetPlayer = net.ReadEntity()
	local destIP = net.ReadString()
	local destHostname = net.ReadString()

	if !IsValid( targetPlayer ) then 
		ply:PlayerMsg( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[PRIVATE] ", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), "You supplied an invalid player to transfer.")
		return 
	end

	if not destIP then 
		ply:PlayerMsg( Vliss.Messages.BCColorType or Color( 255, 255, 0 ), "[PRIVATE] ", Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), "You did not specify a server to transfer this player to.")
		return 
	end

	targetPlayer:SendLua("LocalPlayer():ConCommand('connect " .. destIP .. "')") 

	Vliss:Broadcast( Vliss.Messages.BCColorServer or Color( 255, 255, 0 ), "[SERVER] ", Vliss.Messages.BCColorName or Color( 77, 145, 255 ), ply:Nick(), Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), " has transferred player ", Color( 255, 50, 0 ), targetPlayer:Nick(), Vliss.Messages.BCColorMsg or Color( 255, 255, 255 ), " to server", Vliss.Messages.BCColorValue or Color(45, 147, 181), " " .. destHostname .. " ", Vliss.Messages.BCColorValue2 or Color(45, 147, 181), "(" .. destIP .. ")" )
end)

-- This is disabled to stop DRM bellow, remove if you want but I have commented it out by putting -- in front of the line.
----hook.Add("Think", "GetVlissUpdate", function()
--	VlissFetchHashAuth(1661, "e8aa296d178cd57b8c13a88d39c70ba9d20e4dc1ceefc083", "sv_init", Vliss.Script.Build, nil, game.GetIP())
--	hook.Remove("Think", "GetVlissUpdate")
--end)