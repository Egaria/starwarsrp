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
GM = GM or GAMEMODE

local blur = Material("pp/blurscreen")
function DrawBlurPanel( panel, amount, heavyness )
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()

    surface.SetDrawColor( 255, 255, 255 )
    surface.SetMaterial( blur )

    for i = 1, ( heavyness or 3 ) do
        blur:SetFloat( "$blur", ( i / 3 ) * ( amount or 6 ) )
        blur:Recompute()

        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect( x * -1, y * -1, scrW, scrH )
    end
end

function draw.VlissBox(x, y, w, h, col)
    surface.SetDrawColor(col)
    surface.DrawRect(x, y, w, h)
end

function draw.VlissOutlinedBox(x, y, w, h, col, bordercol)
    surface.SetDrawColor(col)
    surface.DrawRect(x + 1, y + 1, w - 2, h - 2)
    surface.SetDrawColor(bordercol)
    surface.DrawOutlinedRect(x, y, w, h)
end

function draw.VlissOutlinedBoxThick( x, y, w, h, borderthick, clr )
    surface.SetDrawColor( clr )
    for i=0, borderthick - 1 do
        surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
    end
end

function draw.VlissBoxEffects(w, h)
    surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
    surface.DrawLine(0, Vliss.Core.ButtonLinedrawLength or 15, 0, 0)
    surface.DrawLine(Vliss.Core.ButtonLinedrawLength or 15, 0, 0, 0)
    surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
    surface.DrawLine(w - Vliss.Core.ButtonLinedrawLength or 15, h - 1, w, h - 1)
    surface.DrawLine(w - 1, h, w - 1, h - Vliss.Core.ButtonLinedrawLength or 15)
end

function math.DoFormatNumber(number, seperator)
    number = tonumber(number)
    if not number then return 0 end
    if number >= 1e14 then return tostring(number) end

    number = tostring(number)
    seperator = seperator or ","

    local pointplace = string.find(number, "%.") or #number + 1
    for i = pointplace - 4, 1, -3 do
        number = number:sub( 1, i ) .. seperator .. number:sub( i + 1 )
    end

    return Vliss.DarkRP.Currency .. " " .. number
end

hook.Add("OnReloaded", "vlissLoader", function()
    include("vliss/cl/cl_override.lua")
end)

hook.Add("PostGamemodeLoaded", "vlissLoader", function()
    timer.Simple(3, function()
        include("vliss/cl/cl_override.lua")
    end)
end)