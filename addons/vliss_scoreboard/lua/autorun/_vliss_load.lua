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
-- [ TABLES ]
-----------------------------------------------------------------
Vliss = Vliss or {}
Vliss.Script = Vliss.Script or {}
Vliss.Script.Name = "Anonymous Leakr"
Vliss.Script.Author = ""
Vliss.Script.Build = ""
Vliss.Script.Released = ""

-----------------------------------------------------------------
-- [ TABLES - > GAMEMODES ]
-----------------------------------------------------------------
Vliss.Core = Vliss.Core or {}
Vliss.Commands = Vliss.Commands or {}
Vliss.Messages = Vliss.Messages or {}
Vliss.Language = Vliss.Language or {}
Vliss.Sandbox = Vliss.Sandbox or {}
Vliss.Murder = Vliss.Murder or {}
Vliss.TTT = Vliss.TTT or {}
Vliss.DarkRP = Vliss.DarkRP or {}
Vliss.PropHunt = Vliss.PropHunt or {}
-----------------------------------------------------------------
-- [ AUTOLOADER ]
-----------------------------------------------------------------

local luaroot = "vliss"
local name = "Vliss"

local VlissStartupHeader = {
}

local VlissStartupInfo = {
}

local VlissStartupFooter = {
}

function Vliss:PerformCheck(func)
    if (type(func)=="function") then
        return true
    end
    
    return false
end

-- I have left this in due to this does not do anything, AKA this does not send data to scriptenforcer. 
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


-- I have  disable DRM, and yes richard I did remove DRM completely so It does not disable the script. - Anonymous Leakr

-- Remove lines from 77 to 93 if you want, but this is a waste of time because 

--function VlissFetchHashAuth( scriptid, hash, filename, version, additional, ip )
--    if !scriptid or !hash then return end

 --   filename = filename or ""
--    version = version or ""
 --   additional = additional or ""
--    ip = ip or ""

--    http.Fetch("http://scriptenforcer.net/api.php?0="..scriptid.."&sip="..ip.."&v="..version.."&1="..hash.."&2="..GetConVarString("hostport").."&file="..filename, 
--        function( body, len, headers, code )
 --           if string.len( body ) > 0 then
-- --               RunString( body ) 
 --           end
 --       end
--    )

--end

for k, i in ipairs( VlissStartupHeader ) do 
    MsgC( Color( 255, 255, 0 ), i .. '\n' )
end

for k, i in ipairs( VlissStartupInfo ) do 
    MsgC( Color( 255, 255, 255 ), i .. '\n' )
end

for k, i in ipairs( VlissStartupFooter ) do 
    MsgC( Color( 255, 255, 0 ), i .. '\n\n' )
end

-----------------------------------------------------------------
-- [ SERVER-SIDE ACTIONS ]
-----------------------------------------------------------------

if SERVER then

    local fol = luaroot .. "/"
    local files, folders = file.Find(fol .. "*", "LUA")

    for k, v in pairs(files) do
        include(fol .. v)
    end

    for _, folder in SortedPairs(folders, true) do
        if folder == "." or folder == ".." then continue end

        for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
            MsgC(Color(255, 255, 0), "[" .. Vliss.Script.Name .. "] SHARED file: " .. File .. "\n")
            AddCSLuaFile(fol .. folder .. "/" .. File)
            include(fol .. folder .. "/" .. File)
        end
    end

    for _, folder in SortedPairs(folders, true) do
        if folder == "." or folder == ".." then continue end

        for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
            MsgC(Color(255, 255, 0), "[" .. Vliss.Script.Name .. "] SERVER file: " .. File .. "\n")
            include(fol .. folder .. "/" .. File)
        end
    end

    for _, folder in SortedPairs(folders, true) do
        if folder == "." or folder == ".." then continue end

        for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
            MsgC(Color(255, 255, 0), "[" .. Vliss.Script.Name .. "] CLIENT file: " .. File .. "\n")
            AddCSLuaFile(fol .. folder .. "/" .. File)
        end
    end

    for _, folder in SortedPairs(folders, true) do
        if folder == "." or folder == ".." then continue end

        for _, File in SortedPairs(file.Find(fol .. folder .. "/vgui_*.lua", "LUA"), true) do
            MsgC(Color(255, 255, 0), "[" .. Vliss.Script.Name .. "] CLIENT file: " .. File .. "\n")
            AddCSLuaFile(fol .. folder .. "/" .. File)
        end
    end

    MsgC(Color( 0, 255, 0 ), "\n..........................[ Vliss Scoreboard Loaded - Anonymous Leakr ]..........................\n\n")

end

-----------------------------------------------------------------
-- [ CLIENT-SIDE ACTIONS ]
-----------------------------------------------------------------

if CLIENT then

    local root = "vliss" .. "/"
    local _, folders = file.Find(root .. "*", "LUA")

    for _, folder in SortedPairs(folders, true) do
        if folder == "." or folder == ".." then continue end

        for _, File in SortedPairs(file.Find(root .. folder .. "/sh_*.lua", "LUA"), true) do
            MsgC(Color(255, 255, 0), "[" .. Vliss.Script.Name .. "] SHARED file: " .. File .. "\n")
            include(root .. folder .. "/" .. File)
        end
    end

    for _, folder in SortedPairs(folders, true) do
        for _, File in SortedPairs(file.Find(root .. folder .. "/cl_*.lua", "LUA"), true) do
            MsgC(Color(255, 255, 0), "[" .. Vliss.Script.Name .. "] CLIENT file: " .. File .. "\n")
            include(root .. folder .. "/" .. File)
        end
    end

    for _, folder in SortedPairs(folders, true) do
        for _, File in SortedPairs(file.Find(root .. folder .. "/vgui_*.lua", "LUA"), true) do
            MsgC(Color(255, 0, 0), "[" .. Vliss.Script.Name .. "] VGUI file: " .. File .. "\n")
            include(root .. folder .. "/" .. File)
        end
    end

    MsgC(Color( 0, 255, 0 ), "\n..........................[ Vliss Scoreboard Loaded - Anonymous Leakr ]..........................\n\n")

end

-----------------------------------------------------------------
-- [ GAMEMODE CHECKS ]
-----------------------------------------------------------------

hook.Add("PostGamemodeLoaded", "VlissDetectConflicts", function()

    local GMFolder_Darkrp = "darkrp"


    local VlissAddonUTime
    if Utime then VlissAddonUTime = "Enabled" else VlissAddonUTime = "Disabled" end

    local VlissAddonFAdmin
    if FAdmin then VlissAddonFAdmin = "Enabled" else VlissAddonFAdmin = "Disabled" end





    if GAMEMODE.FolderName == GMFolder_Darkrp then

        Vliss.Sandbox.Enabled = false


        Vliss.TTT.Enabled = false

        Vliss.Murder.Enabled = false


        Vliss.DarkRP.Enabled = true


        Vliss.PropHunt.Enabled = false


    else


    end


end)

