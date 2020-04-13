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
-- [ ICONS ]
-----------------------------------------------------------------

local VlissBtnClose = "vliss/vliss_btn_close.png"
local VlissIconStatusDead = "vliss/vliss_plystatus_dead.png"
local VlissIconActionMuted = "vliss/vliss_btn_speakmute.png"
local VlissIconActionUnmuted = "vliss/vliss_btn_speakenabled.png"
local VlissIconActionProfile = "vliss/vliss_btn_steam.png"
local VlissIconActionCopyID = "vliss/vliss_btn_copy.png"
local VlissIconActionCopyIP = "vliss/vliss_btn_ipaddress.png"

-----------------------------------------------------------------
-- [ INIT ]
-----------------------------------------------------------------

local PANEL = {}

function PANEL:Init()

    local ply = self.ply

    self.cols = {}
    self.sandboxlabels = {}

    self:SetText("")

    self.avatar = vgui.Create("AvatarImage", self)
    self.avatar:SetSize(32, 32)
    self.avatar:SetPos(4, 4)
    self.avatar:Dock(LEFT)
    self.avatar:DockMargin(3, 3, 3, 3)

    self.picture = vgui.Create("DButton", self)
    self.picture:SetSize(34, 34)
    self.picture:SetPos(3, 3)
    self.picture:SetText("")
    self.picture:DockMargin(3, 3, 3, 3)
    self.picture:Dock(LEFT)

    self.avatarbutton = vgui.Create("DButton", self)
    self.avatarbutton:SetText("")
    self.avatarbutton:SetSize(32, 32)
    self.avatarbutton:SetPos(2, 2)
    self.avatarbutton.Paint = function() end

    self.name = vgui.Create("DLabel", self)

    self.rank = vgui.Create("DLabel", self)
    self.rank:SetVisible(false)

    self.Realname = vgui.Create("DLabel", self)
    self.KDRatio = vgui.Create("DLabel", self)

    if Vliss.ColumnKillSkullEnabled and !Vliss.Murder.Enabled then
        self.healthstatus = vgui.Create("DButton", self)
        self.healthstatus:SetText("")

        self.healthstatus.Paint = function()
            local is_dead = Material(VlissIconStatusDead, "noclamp smooth")

            if IsValid(self.ply) and not self.ply:Alive() and Vliss.TTT.Enabled then
                local group = ScoreGroup(self.ply)
                if group ~= 3 then return end
                surface.SetDrawColor(Vliss.ColumnKillSkullColor or Color( 255, 255, 255, 255 ))
                surface.SetMaterial(is_dead)
                surface.DrawTexturedRect(0, 0, 22, 22)
            elseif IsValid(self.ply) and not self.ply:Alive() and !Vliss.TTT.Enabled then
                surface.SetDrawColor(Vliss.ColumnKillSkullColor or Color( 255, 255, 255, 255 ))
                surface.SetMaterial(is_dead)
                surface.DrawTexturedRect(0, 0, 22, 22)
            end
        end
    end

    if !Vliss.Murder.Enabled and !Vliss.PropHunt.Enabled then 
        self:AddColumn(Vliss.Language.ping, function(ply) return "" end)

        for k, v in pairs(Vliss.CustomColumns) do
            if v.enabled then
                self:AddColumn(v.name, v.func, v.width)
            end
        end
    end

end

-----------------------------------------------------------------
-- [ PANEL:ADDCOLUMN ]
-----------------------------------------------------------------

function PANEL:AddColumn(label, func, width)
    self.cols = self.cols or {}
    local lbl = vgui.Create("DLabel", self)
    lbl.GetPlayerText = func
    lbl:SetFont("VlissFontColName")
    lbl:SetTextColor(Vliss.Core.PlayerRowInfoColor or Color(255, 255, 255, 255))
    lbl.IsHeading = false
    lbl.Width = width or 55
    table.insert(self.cols, lbl)

    return lbl
end


-----------------------------------------------------------------
-- [ PANEL:SETPLAYER ]
-----------------------------------------------------------------

function PANEL:SetPlayer(pl)

    if not IsValid( pl ) then return end

    self.avatar:SetPlayer(pl)
    for i = 1, #self.cols do
        self.cols[i]:SetText(self.cols[i].GetPlayerText(pl, self.cols[i]))
    end

    self.avatarbutton.DoClick = function()
        if IsValid(pl) then
            pl:ShowProfile()
        end
    end

    if Vliss.Murder.Enabled then
    	self.KDRatio:SetVisible(false)
        if pl:GetBystanderName() and pl:Team() == 2 then
            self.name:SetText(pl:GetBystanderName())
            if Vliss.Murder.StaffViewRealName and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) then 
                self.Realname:SetText(pl:Nick())
                self.Realname:SetVisible(true)
                self.Realname:SetContentAlignment( 6 )
            else
                self.Realname:SetVisible(false)
            end 
            if Vliss.Core.UseSpiffyAvatars then
                self.avatar:SetVisible(false)
                self.picture:SetVisible(true)
            else
                self.name:DockMargin( 5, 0, 0, 0)
                self.avatar:SetVisible(false)
                self.picture:SetVisible(false)
            end
        else
            self.name:SetText(pl:Nick())
            self.Realname:SetVisible(false)
            self.avatar:SetVisible(true)
            self.picture:SetVisible(false)
        end
	elseif Vliss.PropHunt.Enabled then
        self.name:SetText(pl:Nick())
        self.name:DockMargin( 5, 0, 0, 0)
        self.rank:SetText(Vliss.Core.UserGroupTitles[pl:GetUserGroup()] and Vliss.Core.UserGroupTitles[pl:GetUserGroup()] or pl:GetUserGroup())
    	self.rank:SetVisible(true)
        self.KDRatio:SetText(pl:Frags() .. ":" .. pl:Deaths())
        self.KDRatio:SetContentAlignment( 6 )
        self.Realname:SetVisible(false)
        if Vliss.Core.UseSpiffyAvatars then
            self.picture:SetVisible(true)
            self.avatar:SetVisible(false)
        else
            self.picture:SetVisible(false)
            self.avatar:SetVisible(true)
        end
    else
        self.name:SetText(pl:Nick())
        self.KDRatio:SetVisible(false)
        self.Realname:SetVisible(false)
        if Vliss.Core.UseSpiffyAvatars then
            self.picture:SetVisible(true)
            self.avatar:SetVisible(false)
        else
            self.picture:SetVisible(false)
            self.avatar:SetVisible(true)
        end
    end

    self.name:SetTextColor(Vliss.Core.PlayerRowInfoColor or Color(255, 255, 255, 255))
    self.name:SetFont("VlissFontColName")

    self.KDRatio:SetTextColor(Vliss.Core.PlayerRowInfoColor or Color(255, 255, 255, 255))
    self.KDRatio:SetFont("VlissFontColKDRatio")
    self.KDRatio:SetWide(110)

    self.Realname:SetTextColor(Vliss.Core.PlayerRowInfoColor or Color(255, 255, 255, 255))
    self.Realname:SetFont("VlissFontColRealName")
    self.Realname:SetWide(165)

    self.column = {}
    self:LayoutColumns()
    self.bg = Color( 5, 5, 5, 220 )

end

-----------------------------------------------------------------
-- [ PANEL:LAYOUTCOLUMNS ]
-----------------------------------------------------------------

function PANEL:LayoutColumns()

    local cx = self:GetWide()

    if Vliss.ColumnStyleOCD then
        cx = cx - 10
    else
        cx = cx + 25
    end

    if !Vliss.Murder.Enabled then 
        for k, v in ipairs(self.cols) do
            v:SizeToContents()
            cx = cx - v.Width
            v:SetPos(cx - v:GetWide() / 2, 7)
        end
    end
end

-----------------------------------------------------------------
-- [ PANEL:PERFORMLAYOUT ]
-----------------------------------------------------------------

function PANEL:PerformLayout()

	if Vliss.PropHunt.Enabled then
		self.name:SetPos(45,3)
	    self.name:SizeToContents()
		self.rank:SetPos(46,19)
	    self.rank:SetWide(180)
	else
	    self.name:Dock(LEFT)
        self.name:SizeToContents()
	end

    self.KDRatio:Dock(RIGHT)
    self.KDRatio:DockMargin( 0, 4, 60, 0)

    self.Realname:Dock(RIGHT)
    self.Realname:DockMargin( 0, 0, 10, 0)

    if Vliss.ColumnKillSkullEnabled and !Vliss.Murder.Enabled then
    	if Vliss.PropHunt.Enabled then
        	self.healthstatus:Dock(RIGHT)
        else
        	self.healthstatus:Dock(LEFT)
        end
        self.healthstatus:DockMargin(0, 9, 0, 0)
        self.healthstatus:SizeToContents()
        self.healthstatus:SetSize(22, 22)
    end
end

-----------------------------------------------------------------
-- [ PANEL:PAINT ]
-----------------------------------------------------------------

function PANEL:Paint(w, h)
    local ply = self.ply

    if not IsValid(ply) then return end

    if !ply.VlissAvatarImage then
        local avatarTotals = table.Random( Vliss.Core.AvatarTable )
        local avatarImageSet = Material(avatarTotals, "noclamp smooth")
        ply.VlissAvatarImage = avatarImageSet
    end

    if ply.VlissAvatarImage then

        self.picture.Paint = function()
            local avatarDefault = Material("vliss/avatars/vliss_avatar1.png", "noclamp smooth")
            surface.SetDrawColor(Vliss.ColumnKillSkullColor or Color( 255, 255, 255, 255 ))
            surface.SetMaterial(ply.VlissAvatarImage or avatarDefault)
            surface.DrawTexturedRect(0, 0, 34, 34)
        end

    end

    if Vliss.Core.TeamColoring then
        if not IsValid(self.ply) then return end

        local col = team.GetColor(self.ply:Team())

        if Vliss.TTT.Enabled then
            local group = ScoreGroup(self.ply)

            if group == 1 then
                col = Vliss.TTT.ColorTerrorist or Color(25, 200, 25, 200)
            elseif group == 2 then
                col = Vliss.TTT.ColorMIA or Color(130, 190, 130, 200)
            elseif group == 3 then
                col = Vliss.TTT.ColorDead or Color(130, 170, 10, 200)
            elseif group == 4 then
                col = Vliss.TTT.ColorSpec or Color(200, 200, 0, 200)
            end

            if self.ply:IsDetective() then
                col = Vliss.TTT.ColorDetective or Color(25, 25, 200, 200)
            elseif self.ply:IsTraitor() then
                col = Vliss.TTT.ColorTraitor or Color(200, 25, 25, 200)
            end
        end

        draw.VlissOutlinedBox(0, 0, w, h, Color(col.r, col.g, col.b, col.a) or Color(5, 5, 5, 220), Color(15, 15, 15, 100))
    elseif Vliss.Core.UserGroupColoring then
        local col = Vliss.Core.UserGroupColors[self.ply:GetUserGroup()] or self.bg
        draw.VlissOutlinedBox(0, 0, w, h, Color(col.r, col.g, col.b, col.a) or Color(5, 5, 5, 220), Color(15, 15, 15, 100))
    else
        draw.VlissOutlinedBox(0, 0, w, h, Color(5, 5, 5, 220), Color(15, 15, 15, 100))
    end

    if !Vliss.Murder.Enabled or ( Vliss.Murder.Enabled and ply:Team() != 2 ) then

        local pingx, pingy = self:GetWide()

        if Vliss.ColumnStyleOCD then
            pingx, pingy = pingx - 70, 15
        else
            pingx, pingy = pingx - 40, 15
        end

        if ply:IsValid() then
            if ply:Ping() < 100 then
                draw.RoundedBox(0, pingx, pingy + 8, 4, 4, Color(0, 255, 0, 255))
                draw.RoundedBox(0, pingx + 5, pingy + 4, 4, 8, Color(0, 255, 0, 255))
                draw.RoundedBox(0, pingx + 10, pingy, 4, 12, Color(0, 255, 0, 255))
            elseif ply:Ping() < 225 then
                draw.RoundedBox(0, pingx, pingy + 8, 4, 4, Color(255, 255, 0, 255))
                draw.RoundedBox(0, pingx + 5, pingy + 4, 4, 8, Color(255, 255, 0, 255))
                draw.RoundedBox(0, pingx + 10, pingy, 4, 12, Color(155, 155, 155, 255))
            else
                draw.RoundedBox(0, pingx, pingy + 8, 4, 4, Color(255, 0, 0, 255))
                draw.RoundedBox(0, pingx + 5, pingy + 4, 4, 8, Color(155, 155, 155, 255))
                draw.RoundedBox(0, pingx + 10, pingy, 4, 12, Color(155, 155, 155, 255))
            end

            draw.DrawText(ply:Ping(), "VlissFontCloseGUI", pingx + 17, pingy, Vliss.Core.PlayerRowInfoColor or Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
        end

    end

end

-----------------------------------------------------------------
-- [ PANEL:DOSCOREBOARDACTIONPOPUP ]
-----------------------------------------------------------------

function PANEL:DoSecondaryMenuPanel(ply)

    local PlayerlistMenu = DermaMenu()
    if not IsValid(ply) then return end
    if not IsValid(LocalPlayer()) then return end

    -----------------------------------------------------------------
    -- [OPTION] : DarkRP Money
    -----------------------------------------------------------------

    if Vliss.DarkRP.Enabled and ply:getDarkRPVar("money") then

         self.OptionTitle = DarkRP.formatMoney(ply:getDarkRPVar("money")) or 0
         self.OptionDarkrpMoney = PlayerlistMenu:AddOption( self.OptionTitle )
         self.OptionDarkrpMoney:SetIcon("icon16/money.png")

         PlayerlistMenu:AddSpacer()

     end

    -----------------------------------------------------------------
    -- [OPTION] : Mute/unmute player
    -----------------------------------------------------------------

    if ply != LocalPlayer() then
        self.OptionTitleMute = Vliss.Language.mute_player
        if ply:IsMuted() then
            self.OptionTitleMute = Vliss.Language.unmute_player
        end
        self.OptionMute = PlayerlistMenu:AddOption( self.OptionTitleMute )
        self.OptionMute:SetIcon("icon16/sound_mute.png")
        function self.OptionMute:DoClick()
            if IsValid(ply) then ply:SetMuted(!ply:IsMuted()) end
        end
        PlayerlistMenu:AddSpacer()
    end

    -----------------------------------------------------------------
    -- [OPTION] : Copy Information
    -----------------------------------------------------------------

    if Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin() then

        net.Start("VlissPlayerIP")
        net.WriteEntity(ply)
        net.SendToServer()
        net.Receive("VlissPlayerIP", function()
            local ent = net.ReadString()
            local ip = net.ReadString()
            VlissFetchIPFiltered = tostring(string.sub(tostring(ip), 1, string.len(tostring(ip)) - 6))
        end)

        if VlissFetchIPFiltered and ply:SteamID() and ply:SteamID64() then

            self.OptionInformation, InformationCategory = PlayerlistMenu:AddSubMenu( Vliss.Language.information )
            InformationCategory:SetIcon("icon16/information.png")

            if ply:IsPlayer() and IsValid(ply) and not ply:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerSteamID[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then
                self.OptionInformation:AddOption( "[" .. Vliss.Language.steam32 .. "] " .. ply:SteamID(), function( ) 
                    SetClipboardText(ply:SteamID())
                end ) 
            end  

            if ply:IsPlayer() and IsValid(ply) and not ply:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerSteamID[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then
                self.OptionInformation:AddOption( "[" .. Vliss.Language.steam64 .. "] " .. ply:SteamID64(), function( ) 
                    SetClipboardText(ply:SteamID64())
                end ) 
            end  

            if ply:IsPlayer() and IsValid(ply) and not ply:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerIPAddress[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then

                self.OptionInformation:AddOption( "[" .. Vliss.Language.ip_address .. "] " .. VlissFetchIPFiltered, function( ) 
                    SetClipboardText(VlissFetchIPFiltered)
                end ) 

            end  

        end

    end

    if Vliss.DarkRP.Enabled and FAdmin and (FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "SetAccess") or LocalPlayer():IsSuperAdmin()) then

        self.OptionSetAccess, AccessCategory = PlayerlistMenu:AddSubMenu( Vliss.Language.set_access )
        AccessCategory:SetIcon("icon16/user_go.png")
        for k,v in SortedPairsByMemberValue(FAdmin.Access.Groups, "ADMIN", true) do
            self.OptionSetAccess:AddOption(k, function()
                if not IsValid(ply) then return end
                RunConsoleCommand("_FAdmin", "setaccess", ply:UserID(), k)
            end)
        end

    end

    if Vliss.DarkRP.Enabled and FAdmin and (FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "SetTeam") or LocalPlayer():IsSuperAdmin()) then

        self.OptionSetTeam, TeamsCategory = PlayerlistMenu:AddSubMenu( Vliss.Language.set_team )
        TeamsCategory:SetIcon("icon16/group.png")
        for k,v in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
            local uid = ply:UserID()
            self.OptionSetTeam:AddOption(v.Name, function() RunConsoleCommand("_FAdmin", "setteam", uid, k) end)
        end

        PlayerlistMenu:AddSpacer()

    end

    -----------------------------------------------------------------
    -- [OPTION] : Manage tab admin scripts (Ulx, Evolve, etc)
    -----------------------------------------------------------------
    -- [Admin Support]
    -----------------------------------------------------------------
    --      -> ULX
    --      -> Evolve
    --      -> FAdmin
    -----------------------------------------------------------------

    if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) then

        self.OptionManage, ManageCategory = PlayerlistMenu:AddSubMenu( Vliss.Language.manage )
        ManageCategory:SetIcon("icon16/wand.png")

        PlayerlistMenu:AddSpacer()

        local tab = (ULib and Vliss.Commands.Ulx) or (evolve and Vliss.Commands.Evolve) or {}
        local cmd = (ULib and "ulx") or (evolve and "ev") or "wtfnoadminmod"

        for k, v in pairs(tab) do
            self.OptionManage:AddOption( v.name, function( ) 
                if !LocalPlayer():IsAdmin() then return end
                LocalPlayer():ConCommand(cmd .. " " .. v.cmd .. " \"" .. ply:Nick() .. "\"")
            end )   
        end

    end

    -----------------------------------------------------------------
    -- [OPTION] [MURDER MODE] : Misc commands for gamemode
    -----------------------------------------------------------------
    --      Show Identity
    --      Move to Team
    --      Force Murderer Next Round
    --      Spectate Player
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled and ply:Team() == 2 then

        if Vliss.Murder.AccessViewIdentity[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin() then

            self.ButtonOptionShowIdentity = PlayerlistMenu:AddOption( Vliss.Language.show_identity )
            self.ButtonOptionShowIdentity:SetIcon( "icon16/vcard.png" )
            function self.ButtonOptionShowIdentity:DoClick()
                RunConsoleCommand("vliss_showidentity", ply:EntIndex())
            end

        end

        if Vliss.Murder.AccessMovePlayer[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin() then

            self.ButtonOptionMovePlayer = PlayerlistMenu:AddOption( Vliss.Language.move_to_spectators )
            self.ButtonOptionMovePlayer:SetIcon( "icon16/status_busy.png" )
            function self.ButtonOptionMovePlayer:DoClick()
                RunConsoleCommand("mu_movetospectate", ply:EntIndex())
            end

        end

        if Vliss.Murder.AccessForceMurderer[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin() then

            self.ButtonOptionForceMurderer = PlayerlistMenu:AddOption( Vliss.Language.force_murderer_next_round )
            self.ButtonOptionForceMurderer:SetIcon( "icon16/delete.png" )
            function self.ButtonOptionForceMurderer:DoClick()
                RunConsoleCommand("mu_forcenextmurderer", ply:EntIndex())
            end

        end

        if Vliss.Murder.AccessSpectate[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin() then

            if ply:Alive() then
                self.ButtonOptionSpectate = PlayerlistMenu:AddOption( Vliss.Language.spectate_player )
                self.ButtonOptionSpectate:SetIcon( "icon16/status_online.png" )
                function self.ButtonOptionSpectate:DoClick()
                    RunConsoleCommand("mu_spectate", ply:EntIndex())
                end
            end

        end

    end

    -----------------------------------------------------------------
    -- [OPTION] [PROPHUNT MODE] : Misc commands for gamemode
    -----------------------------------------------------------------

    if Vliss.PropHunt.Enabled then

        if (Vliss.PropHunt.AccessMovePlayer[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) and (ply:Team() == Vliss.PropHunt.TeamHunters) then

            self.ButtonOptionMovePlayer = PlayerlistMenu:AddOption( Vliss.Language.move_to_props )
            self.ButtonOptionMovePlayer:SetIcon( "icon16/status_busy.png" )
            function self.ButtonOptionMovePlayer:DoClick()
                RunConsoleCommand("vliss_forcemovetoteam", ply:EntIndex(), Vliss.PropHunt.TeamProps)
            end

		elseif (Vliss.PropHunt.AccessMovePlayer[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) and (ply:Team() == Vliss.PropHunt.TeamProps) then

            self.ButtonOptionMovePlayer = PlayerlistMenu:AddOption( Vliss.Language.move_to_hunters )
            self.ButtonOptionMovePlayer:SetIcon( "icon16/status_busy.png" )
            function self.ButtonOptionMovePlayer:DoClick()
                RunConsoleCommand("vliss_forcemovetoteam", ply:EntIndex(), Vliss.PropHunt.TeamHunters)
            end

        end

    end

    -----------------------------------------------------------------
    -- [OPTION] : Transfer to Server
    -----------------------------------------------------------------

    if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.AccessXferPlayer[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then

        if ply:IsPlayer() and IsValid(ply) and not ply:IsBot() then
            self.OptionXfer, AccessServers = PlayerlistMenu:AddSubMenu( Vliss.Language.transfer_to_server )
            AccessServers:SetIcon("icon16/arrow_undo.png")
            for k, v in pairs(Vliss.Servers) do
                self.OptionXfer:AddOption(v.hostname, function()
                    net.Start( "VlissActionPlayerXfer" )
                    net.WriteEntity( ply )
                    net.WriteString( v.ip )
                    net.WriteString( v.hostname )
                    net.SendToServer()
                end)
            end
        end

    end

    PlayerlistMenu:Open()

end

-----------------------------------------------------------------
-- [ PANEL:DOCLICK ]
-----------------------------------------------------------------
-- If a player row is clicked, this will determine what 
-- actions to perform on that player.
-----------------------------------------------------------------

function PANEL:DoClick()

    local pl = self.ply
    local ply = pl

    if Vliss.DarkRP.Enabled and FAdmin then FAdmin.ScoreBoard.Player.Player = ply end
    if not IsValid(pl) then return end

    local scoreboard = GetScoreboardPanel()

    if IsValid(Vliss_PanelPlayer) then Vliss_PanelPlayer:Remove() end

    VlissPlayerList:SetSize(scoreboard.w - 10, scoreboard.h - 278)
    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
        VlissSpectatorList:SetSize(scoreboard.w - 10, scoreboard.h - 278)
        if not Vliss_PanelAltContainer:IsVisible() then Vliss_PanelAltContainer:SetVisible(true) end
    end

    if !Vliss.Murder.Enabled and !Vliss.PropHunt.Enabled and IsValid(Vliss_PanelInnerBottom) then
        Vliss_PanelPlayer = vgui.Create("DPanel", Vliss_PanelInnerBottom)
    elseif (Vliss.Murder.Enabled or Vliss.PropHunt.Enabled) and IsValid(Vliss_PanelAltContainer) then
        Vliss_PanelPlayer = vgui.Create("DPanel", Vliss_PanelAltContainer)
    end

    -----------------------------------------------------------------
    -- [ PLAYER PANEL ]
    -----------------------------------------------------------------
    -- Actual container for each player when clicked. Provides 
    -- actions to perform on that player.
    -----------------------------------------------------------------

    Vliss_PanelPlayer:SetWide(scoreboard.w - 205)
    Vliss_PanelPlayer:Dock(BOTTOM)
    Vliss_PanelPlayer:SetTall(100)
    Vliss_PanelPlayer.UpdatePlayerData = function() end
    Vliss_PanelPlayer.SetOpen = function() end
    Vliss_PanelPlayer.Paint = function(self, w, h)
        if Vliss.Core.BackgroundBlurPlyrowEnabled then
            DrawBlurPanel(self, 2)
        end
        draw.RoundedBox(0, 0, 0, w, h, Color(16, 16, 16, 210))
    end

    Vliss_PanelPlayer:InvalidateLayout()

    Vliss_PanelPlayer.Think = function(self)
        if not IsValid(pl) then self:Remove() end
    end

    self.PanelContainer = vgui.Create("DPanel", Vliss_PanelPlayer)
    self.PanelContainer:Dock(FILL)
    self.PanelContainer.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
    end

    if Vliss.TTT.Enabled then
        if not self.info then
            local g = ScoreGroup(pl)

            if g == GROUP_TERROR and pl ~= LocalPlayer() then
                self.info = vgui.Create("TTTScorePlayerInfoTags", Vliss_PanelPlayer)
                self.info:SetWide(600)
                self.info:SetPlayer(pl)
                self.info:SetPos(-50, 38)
            elseif g == GROUP_FOUND or g == GROUP_NOTFOUND then
                self.info = vgui.Create("TTTScorePlayerInfoSearch", Vliss_PanelPlayer)
                self.info:SetPlayer(pl)
                self.info:SetPos(200, 0)
                self.info:SetSize(500, self.info:GetTall())
                self:InvalidateLayout()
            end
        else
            self:InvalidateLayout()
        end
    end

    -----------------------------------------------------------------
    -- [ MURDER MODE ]
    -----------------------------------------------------------------
    -- Different avatar setup.
    -- If player on team 'Player' (team 2)
    --      [x] Generate random avatar to others can't tell who it is.
    -- If player on team 'Spectator' (team 1)
    --      [x] Show player's normal avatar. No need to hide.
    -- If player is not in murder mode, then display normal avatar.
    -----------------------------------------------------------------
    -- Yes. This code needs to be cleaned up. Was in a rush with 
    -- updates. Def needs optimized.
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled then

        if Vliss.Murder.Enabled and pl:Team() == 2 then

            self.PanelPlayerAvatar = vgui.Create("DButton", self.PanelContainer)
            self.PanelPlayerAvatar:SetSize(64, 64)
            self.PanelPlayerAvatar:SetText("")
            self.PanelPlayerAvatar:Dock(LEFT)
            self.PanelPlayerAvatar:DockMargin(3, 3, 3, 3)

            if !pl.VlissAvatarImage then
                local avatarTotals = table.Random( Vliss.Core.AvatarTable )
                local avatarImageSet = Material( avatarTotals, "noclamp smooth" )
                pl.VlissAvatarImage = avatarImageSet
            end

            self.PanelPlayerAvatar.Paint = function()
                local avatarDefault = Material("vliss/avatars/vliss_avatar1.png", "noclamp smooth")
                surface.SetDrawColor(Vliss.ColumnKillSkullColor or Color(255,255,255,255))
                surface.SetMaterial(pl.VlissAvatarImage)
                surface.DrawTexturedRect(0, 0, 64, 64)
            end

        else

            self.PanelPlayerAvatar = vgui.Create("AvatarImage", self.PanelContainer)
            self.PanelPlayerAvatar:SetSize(64, 64)
            self.PanelPlayerAvatar:Dock(LEFT)
            self.PanelPlayerAvatar:DockMargin(3, 3, 3, 3)
            self.PanelPlayerAvatar:SetPlayer(pl, 64)

        end

    else

        self.PanelPlayerAvatar = vgui.Create("AvatarImage", self.PanelContainer)
        self.PanelPlayerAvatar:SetSize(64, 64)
        self.PanelPlayerAvatar:SetPlayer(pl, 64)
        self.PanelPlayerAvatar:SetPos(2, 2)

    end

    self.PanelPlayerInfoBox = vgui.Create("DPanel", self.PanelContainer)
    self.PanelPlayerInfoBox:Dock(LEFT)
    self.PanelPlayerInfoBox:DockMargin(5, 0, 0, 0)
    self.PanelPlayerInfoBox:SetWide(200)
    self.PanelPlayerInfoBox.Paint = function() end

    self.PanelPlayerName = vgui.Create("DLabel", self.PanelPlayerInfoBox)
    if !Vliss.DarkRP.Murder then
        self.PanelPlayerName:SetPos(68, 0)
    else
        self.PanelPlayerName:SetPos(0, 0)
    end
    self.PanelPlayerName:SetFont("VlissFontPlayername")
    self.PanelPlayerName:SetWide(150)
    self.PanelPlayerName:SetTall(24)

    if Vliss.DarkRP.Enabled and FAdmin then
        self.PanelPlayerMoney = vgui.Create("DLabel", self.PanelPlayerInfoBox)
        self.PanelPlayerMoney:SetPos(67, 21)
        self.PanelPlayerMoney:SetFont("VlissFontRPMoney")
        self.PanelPlayerMoney:SetColor(Vliss.Core.CBoxMoneyTextColor or Color( 76, 146, 255 ))
        self.PanelPlayerMoney:SetWide(150)
        self.PanelPlayerMoney:SetTall(24)  
        self.PanelPlayerMoney:SetText(DarkRP.formatMoney(pl:getDarkRPVar("money")) or 0)
    elseif Vliss.DarkRP.Enabled then
        self.PanelPlayerMoney = vgui.Create("DLabel", self.PanelPlayerInfoBox)
        self.PanelPlayerMoney:SetPos(67, 21)
        self.PanelPlayerMoney:SetFont("VlissFontRPMoney")
        self.PanelPlayerMoney:SetColor(Vliss.Core.CBoxMoneyTextColor or Color( 76, 146, 255 ))
        self.PanelPlayerMoney:SetWide(150)
        self.PanelPlayerMoney:SetTall(24)  
        self.PanelPlayerMoney:SetText(DarkRP.formatMoney(pl:getDarkRPVar("money")) or 0)
    end

    -----------------------------------------------------------------
    -- [ MURDER MODE ]
    -----------------------------------------------------------------
    -- If player on 'Player' Team; then display bystander name. 
    -- If player is spectator - then display Steam name.
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled and pl:Team() == 2 then
        self.PanelPlayerName:SetText(pl:GetBystanderName())
    else
        self.PanelPlayerName:SetText(pl:Nick())
    end

    -----------------------------------------------------------------
    -- [ DARKRP MODE ]
    -----------------------------------------------------------------
    -- If DarkRP mode enabled - display FAdmin system
    -----------------------------------------------------------------

    if Vliss.DarkRP.Enabled and FAdmin then

        local ButtonActionW = Vliss.DarkRP.FAdminActions.ButtonActionW or 300
        local ButtonActionH = Vliss.DarkRP.FAdminActions.ButtonActionH or 25
        local ButtonLabelW = ButtonActionW - 10
        local ButtonNormalColor = Vliss.DarkRP.FAdminActions.ButtonNormalColor or Color(64, 105, 126, 190)
        local ButtonHoverColor = Vliss.DarkRP.FAdminActions.ButtonHoverColor or Color(64, 105, 126, 240)
        local ButtonToggledColor = Vliss.DarkRP.FAdminActions.ButtonToggledColor or Color(4, 80, 4, 190)
        local ButtonToggledHoverColor = Vliss.DarkRP.FAdminActions.ButtonToggledHoverColor or Color(4, 80, 4, 240)

        self.PanelFAdminActions = vgui.Create( "DPanel", self.PanelContainer )
        self.PanelFAdminActions:SetSize( Vliss.DarkRP.FAdminActions.ButtonActionW, Vliss.DarkRP.FAdminActions.ButtonContainerH or 100 )
        self.PanelFAdminActions:Dock(FILL)
        self.PanelFAdminActions.Paint = function() end

        self.LayoutFAdminActions = vgui.Create("DIconLayout", self.PanelFAdminActions)
        self.LayoutFAdminActions:Dock(FILL)
        self.LayoutFAdminActions:DockMargin(7, 5, 0, 0)
        self.LayoutFAdminActions:SetSpaceY(5)
        self.LayoutFAdminActions:SetSpaceX(5)

        for k, v in pairs(Vliss.Commands.DarkRP) do

            if not v.Enabled then continue end
            if not FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), v.Permission, pl) then continue end

            self.ButtonOptionShowIdentity = self.LayoutFAdminActions:Add("Button")
            self.ButtonOptionShowIdentity:SetSize(ButtonActionW, ButtonActionH)
            self.ButtonOptionShowIdentity:SetText("")

            local itemLabel = vgui.Create("DLabel", self.ButtonOptionShowIdentity)
            itemLabel:Dock(RIGHT)
            itemLabel:DockMargin(5,5,5,5)
            itemLabel:SetFont("VlissFontSandboxItemLabel")
            itemLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
            if v.CheckState and ply:FAdmin_GetGlobal(v.CheckState) then
                itemLabel:SetText(v.NameReverse)
                self.ButtonOptionShowIdentity.Paint = function(self, w, h)
                    local color = ButtonToggledColor
                    if self:IsHovered() or self:IsDown() then
                        color = ButtonToggledHoverColor
                    end
                    draw.RoundedBox(4, 0, 0, w, h, color)
                end
            else
                itemLabel:SetText(v.NameStart)
                self.ButtonOptionShowIdentity.Paint = function(self, w, h)
                    local color = ButtonNormalColor
                    if self:IsHovered() or self:IsDown() then
                        color = ButtonHoverColor
                    end
                    draw.RoundedBox(4, 0, 0, w, h, color)
                end
            end
            itemLabel:SetSize( ButtonLabelW, ButtonActionH )

            function self.ButtonOptionShowIdentity:DoClick()
                if (v.CheckState and not v.IsSpecial) then
                    if not ply:FAdmin_GetGlobal(v.CheckState) then
                        RunConsoleCommand("_FAdmin", v.CommandStart, pl:UserID())
                        itemLabel:SetText(v.NameReverse)
                        self.Paint = function(self, w, h)
                            local color = ButtonToggledColor
                            if self:IsHovered() or self:IsDown() then
                                color = ButtonToggledHoverColor
                            end
                            draw.RoundedBox(4, 0, 0, w, h, color)
                        end
                    else
                        RunConsoleCommand("_FAdmin", v.CommandReverse, pl:UserID())
                        itemLabel:SetText(v.NameStart)
                        self.Paint = function(self, w, h)
                            local color = ButtonNormalColor
                            if self:IsHovered() or self:IsDown() then
                                color = ButtonHoverColor
                            end
                            draw.RoundedBox(4, 0, 0, w, h, color)
                        end
                    end                
                else
                    RunConsoleCommand("_FAdmin", v.CommandStart, pl:UserID())
                end
            end

        end


    elseif Vliss.Sandbox.Enabled then

        self.PanelSandboxCounters = vgui.Create( "DPanel", self.PanelContainer )
        self.PanelSandboxCounters:SetSize( 550, 100 )
        self.PanelSandboxCounters:Dock(LEFT)
        self.PanelSandboxCounters.Paint = function()end

        self.LayoutSandboxCounters = vgui.Create("DIconLayout", self.PanelSandboxCounters)
        self.LayoutSandboxCounters:Dock(FILL)
        self.LayoutSandboxCounters:DockMargin(7, 5, 0, 0)
        self.LayoutSandboxCounters:SetSpaceY(5)
        self.LayoutSandboxCounters:SetSpaceX(5)

        for k, v in pairs(Vliss.Sandbox.CountList) do
            if v.enabled then
                self:AddSandboxLabel(v.name, v.func, v.buttonColor, v.buttonColorHover, v.textColor)
            end
        end

        if istable(self.sandboxlabels) then
            for i = 1, #self.sandboxlabels do
                local counterItem = self.sandboxlabels[i].GetPlayerText(pl, self.sandboxlabels[i])
                self.sandboxlabels[i].Paint = function(self,w,h)
                    draw.SimpleText(counterItem, "VlissFontSandboxItemAmt", w, h/2, txtColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                end
            end
        end

    end

    -----------------------------------------------------------------
    -- [ MURDER MODE ]
    -- If player is on 'Player' Team - setup special buttons
    -----------------------------------------------------------------
    -- [ ADDITIONAL ADMIN BUTTONS ]
    -----------------------------------------------------------------
    --      Show Identity
    --      Move to Team
    --      Force Murderer Next Round
    --      Spectate Player
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled and pl:Team() == 2 then

        local ButtonActionW = Vliss.Murder.AdminFeatures.ButtonActionW or 100
        local ButtonActionH = Vliss.Murder.AdminFeatures.ButtonActionH or 25
        local ButtonLabelW = ButtonActionW - 10
        local ButtonNormalColor = Vliss.Murder.AdminFeatures.ButtonNormalColor or Color(64, 105, 126, 190)
        local ButtonHoverColor = Vliss.Murder.AdminFeatures.ButtonHoverColor or Color(64, 105, 126, 240)

        self.PanelMurderActions = vgui.Create( "DPanel", self.PanelContainer )
        self.PanelMurderActions:SetSize( Vliss.Murder.AdminFeatures.ButtonContainerW or 450, Vliss.Murder.AdminFeatures.ButtonContainerH or 100 )
        self.PanelMurderActions:Dock(RIGHT)
        self.PanelMurderActions.Paint = function() end

        self.LayoutMurderActions = vgui.Create("DIconLayout", self.PanelMurderActions)
        self.LayoutMurderActions:Dock(FILL)
        self.LayoutMurderActions:DockMargin(7, 5, 0, 0)
        self.LayoutMurderActions:SetSpaceY(5)
        self.LayoutMurderActions:SetSpaceX(5)

        -----------------------------------------------------------------
        -- [ MURDER MODE ] Admin Option :: Show Identity
        -----------------------------------------------------------------

        if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Murder.AccessViewIdentity[string.lower(LocalPlayer():GetUserGroup())]) or LocalPlayer():IsSuperAdmin() then

            self.ButtonOptionShowIdentity = self.LayoutMurderActions:Add("Button")
            self.ButtonOptionShowIdentity:SetSize(ButtonActionW, ButtonActionH)
            self.ButtonOptionShowIdentity:SetText("")
            self.ButtonOptionShowIdentity.Paint = function(self, w, h)
                local color = ButtonNormalColor

                if self:IsHovered() or self:IsDown() then
                    color = ButtonHoverColor
                end

                draw.RoundedBox(4, 0, 0, w, h, color)
            end
            function self.ButtonOptionShowIdentity.DoClick()
                RunConsoleCommand("vliss_showidentity", pl:EntIndex())
            end

            local itemLabel = vgui.Create("DLabel", self.ButtonOptionShowIdentity)
            itemLabel:Dock(RIGHT)
            itemLabel:DockMargin(5,5,5,5)
            itemLabel:SetFont("VlissFontSandboxItemLabel")
            itemLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
            itemLabel:SetText(Vliss.Language.show_identity)
            itemLabel:SetSize( ButtonLabelW, ButtonActionH )

        end

        -----------------------------------------------------------------
        -- [ MURDER MODE ] Admin Option :: Move Team
        -----------------------------------------------------------------

        if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Murder.AccessMovePlayer[string.lower(LocalPlayer():GetUserGroup())]) or LocalPlayer():IsSuperAdmin() then

            local optionMoveTeam = self.LayoutMurderActions:Add("Button")
            optionMoveTeam:SetSize(ButtonActionW, ButtonActionH)
            optionMoveTeam:SetText("")
            optionMoveTeam.Paint = function(self, w, h)
                local color = ButtonNormalColor

                if self:IsHovered() or self:IsDown() then
                    color = ButtonHoverColor
                end

                draw.RoundedBox(4, 0, 0, w, h, color)
            end
            function optionMoveTeam.DoClick()
                RunConsoleCommand("mu_movetospectate", pl:EntIndex())
            end

            local itemLabel = vgui.Create("DLabel", optionMoveTeam)
            itemLabel:Dock(LEFT)
            itemLabel:DockMargin(5,5,5,5)
            itemLabel:SetFont("VlissFontSandboxItemLabel")
            itemLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
            itemLabel:SetText(Vliss.Language.move_to_spectators)
            itemLabel:SetSize( ButtonLabelW, ButtonActionH )

        end

        -----------------------------------------------------------------
        -- [ MURDER MODE ] Admin Option :: Move Team
        -----------------------------------------------------------------

        if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Murder.AccessForceMurderer[string.lower(LocalPlayer():GetUserGroup())]) or LocalPlayer():IsSuperAdmin() then

            local optionForceMurderer = self.LayoutMurderActions:Add("Button")
            optionForceMurderer:SetSize(ButtonActionW, ButtonActionH)
            optionForceMurderer:SetText("")
            optionForceMurderer.Paint = function(self, w, h)
                local color = ButtonNormalColor

                if self:IsHovered() or self:IsDown() then
                    color = ButtonHoverColor
                end

                draw.RoundedBox(4, 0, 0, w, h, color)
            end
            function optionForceMurderer.DoClick()
                RunConsoleCommand("mu_forcenextmurderer", pl:EntIndex())
            end

            local itemLabel = vgui.Create("DLabel", optionForceMurderer)
            itemLabel:Dock(LEFT)
            itemLabel:DockMargin(5,5,5,5)
            itemLabel:SetFont("VlissFontSandboxItemLabel")
            itemLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
            itemLabel:SetText(Vliss.Language.force_murderer_next_round)
            itemLabel:SetSize( ButtonLabelW, ButtonActionH )

        end

        -----------------------------------------------------------------
        -- [ MURDER MODE ] Admin Option :: Spectate Player
        -----------------------------------------------------------------

        if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Murder.AccessSpectate[string.lower(LocalPlayer():GetUserGroup())]) or LocalPlayer():IsSuperAdmin() then

            local optionSpectatePlayer = self.LayoutMurderActions:Add("Button")
            optionSpectatePlayer:SetSize(ButtonActionW, ButtonActionH)
            optionSpectatePlayer:SetText("")
            optionSpectatePlayer.Paint = function(self, w, h)
                local color = ButtonNormalColor

                if self:IsHovered() or self:IsDown() then
                    color = ButtonHoverColor
                end

                draw.RoundedBox(4, 0, 0, w, h, color)
            end
            function optionSpectatePlayer.DoClick()
                RunConsoleCommand("mu_spectate", pl:EntIndex())
            end

            local itemLabel = vgui.Create("DLabel", optionSpectatePlayer)
            itemLabel:Dock(LEFT)
            itemLabel:DockMargin(5,5,5,5)
            itemLabel:SetFont("VlissFontSandboxItemLabel")
            itemLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
            itemLabel:SetText(Vliss.Language.spectate_player)
            itemLabel:SetSize( ButtonLabelW, ButtonActionH )

        end

    end

    -----------------------------------------------------------------
    -- [ MUTE OPTION ] Allows a player to mute/unmute another player.
    -----------------------------------------------------------------

    local buttonPlayerMute = vgui.Create("DButton", Vliss_PanelPlayer)
    buttonPlayerMute:SetText("")
    buttonPlayerMute:SetSize(28, 28)
    if Vliss.DarkRP.Enabled and FAdmin then
        buttonPlayerMute:SetPos(5, 66)
    else
        buttonPlayerMute:SetPos(70, 39)
    end
    buttonPlayerMute.Paint = function(self, w, h)
        local playerMuted = Material(VlissIconActionMuted, "noclamp smooth")
        local playerUnmuted = Material(VlissIconActionUnmuted, "noclamp smooth")

        if pl ~= LocalPlayer() and pl:IsPlayer() and IsValid(pl) and not pl:IsBot() then
            if pl:IsMuted() then
                surface.SetDrawColor(Color(255, 255, 255, 255))
                surface.SetMaterial(playerMuted)
                surface.DrawTexturedRect(3, 7, 17, 17)
                buttonPlayerMute:SetTooltip(Vliss.Language.unmute_player)
            else
                surface.SetDrawColor(Color(255, 255, 255, 255))
                surface.SetMaterial(playerUnmuted)
                surface.DrawTexturedRect(3, 7, 17, 17)
                buttonPlayerMute:SetTooltip(Vliss.Language.mute_player)
            end
        else
            surface.SetDrawColor(Color(255, 255, 255, 25))
            surface.SetMaterial(playerUnmuted)
            surface.DrawTexturedRect(3, 7, 17, 17)
            buttonPlayerMute:SetTooltip(Vliss.Language.disabled)
        end

        if self:IsHovered() or self:IsDown() then
            color = buttonHover
            txtColor = textHover
        end
    end

    buttonPlayerMute.DoClick = function()
        if IsValid(pl) then
            pl:SetMuted(not pl:IsMuted())
        end
    end

    -----------------------------------------------------------------
    -- [ PROFILE OPTION ] Displays a steam icon that is clickable 
    -- which takes the viewer to the player's steam profile.
    -----------------------------------------------------------------
    -- [ MURDER MODE ] : If script is in Muder Mode, the profile 
    -- link will ONLY be clickable if the viewer is staff, they 
    -- have permissions within Vliss.Core.StaffGroups or 
    -- Vliss.Murder.AllowPlayerViewProfile is set to true. 
    -----------------------------------------------------------------

    local buttonPlayerProfile = vgui.Create("DButton", Vliss_PanelPlayer)
    buttonPlayerProfile:SetText("")
    buttonPlayerProfile:SetSize(28, 28)
    if Vliss.DarkRP.Enabled and FAdmin then
        buttonPlayerProfile:SetPos(35, 66)
    else
        buttonPlayerProfile:SetPos(100, 39)
    end
    buttonPlayerProfile:SetTooltip(Vliss.Language.view_steam_profile)
    buttonPlayerProfile.Paint = function(self, w, h)
        local playerSteamProfile = Material(VlissIconActionProfile, "noclamp smooth")

        if !Vliss.Murder.Enabled or (Vliss.Murder.Enabled and Vliss.Murder.AllowPlayerViewProfile) or (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) then
            if pl:IsPlayer() and IsValid(pl) and not pl:IsBot() then
                surface.SetDrawColor(Color(255, 255, 255, 255))
                surface.SetMaterial(playerSteamProfile)
                surface.DrawTexturedRect(3, 7, 17, 17)
            else
                surface.SetDrawColor(Color(255, 255, 255, 25))
                surface.SetMaterial(playerSteamProfile)
                surface.DrawTexturedRect(3, 7, 17, 17)
            end
        else
            surface.SetDrawColor(Color(255, 255, 255, 25))
            surface.SetMaterial(playerSteamProfile)
            surface.DrawTexturedRect(3, 7, 17, 17)
            buttonPlayerProfile:SetTooltip(Vliss.Language.disabled)
        end

        if self:IsHovered() or self:IsDown() then
            color = buttonHover
            txtColor = textHover
        end
    end

    if (Vliss.Murder.Enabled and Vliss.Murder.AllowPlayerViewProfile) or (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) or (!Vliss.Murder.Enabled) then
        buttonPlayerProfile.DoClick = function()
            if IsValid(pl) then
                pl:ShowProfile()
            end
        end
    end

    local buttonPlayerCopySteamid = vgui.Create("DButton", Vliss_PanelPlayer)
    buttonPlayerCopySteamid:SetText("")
    buttonPlayerCopySteamid:SetSize(28, 28)
    if Vliss.DarkRP.Enabled and FAdmin then
        buttonPlayerCopySteamid:SetPos(65, 66)
    else
        buttonPlayerCopySteamid:SetPos(130, 39)
    end
    buttonPlayerCopySteamid:SetTooltip(Vliss.Language.copy_player_steamid)
    buttonPlayerCopySteamid.Paint = function(self, w, h)
        local playerSteamCopy = Material(VlissIconActionCopyID, "noclamp smooth")

        if pl:IsPlayer() and IsValid(pl) and not pl:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerSteamID[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then
            surface.SetDrawColor(Color(255, 255, 255, 255))
            surface.SetMaterial(playerSteamCopy)
            surface.DrawTexturedRect(3, 7, 17, 17)
        else
            surface.SetDrawColor(Color(255, 255, 255, 25))
            surface.SetMaterial(playerSteamCopy)
            surface.DrawTexturedRect(3, 7, 17, 17)
        end

        if self:IsHovered() or self:IsDown() then
            color = buttonHover
            txtColor = textHover
        end
    end

    buttonPlayerCopySteamid.DoClick = function()
        if pl:IsPlayer() and IsValid(pl) and not pl:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerSteamID[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then
            SetClipboardText(pl:SteamID())
        end
    end

    local buttonPlayerCopyIP = vgui.Create("DButton", Vliss_PanelPlayer)
    buttonPlayerCopyIP:SetText("")
    buttonPlayerCopyIP:SetSize(28, 28)
    if Vliss.DarkRP.Enabled and FAdmin then
        buttonPlayerCopyIP:SetPos(95, 66)
    else
        buttonPlayerCopyIP:SetPos(160, 39)
    end
    buttonPlayerCopyIP:SetTooltip(Vliss.Language.copy_player_ip_address)
    buttonPlayerCopyIP.Paint = function(self, w, h)
        local playerIPCopy = Material(VlissIconActionCopyIP, "noclamp smooth")

        if pl:IsPlayer() and IsValid(pl) and not pl:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerIPAddress[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then
            surface.SetDrawColor(Color(255, 255, 255, 255))
            surface.SetMaterial(playerIPCopy)
            surface.DrawTexturedRect(3, 7, 17, 17)
        else
            surface.SetDrawColor(Color(255, 255, 255, 25))
            surface.SetMaterial(playerIPCopy)
            surface.DrawTexturedRect(3, 7, 17, 17)
        end

        if self:IsHovered() or self:IsDown() then
            color = buttonHover
            txtColor = textHover
        end
    end

    buttonPlayerCopyIP.DoClick = function()
        if pl:IsPlayer() and not pl:IsBot() and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] and Vliss.Core.CopyPlayerIPAddress[string.lower(LocalPlayer():GetUserGroup())]) or (LocalPlayer():IsSuperAdmin()) then
            net.Receive("VlissPlayerIP", function()
                local ent = net.ReadString()
                --if not IsValid(ent) then return end
                local ip = net.ReadString()
                local plyIPFiltered = tostring(string.sub(tostring(ip), 1, string.len(tostring(ip)) - 6))
                SetClipboardText(plyIPFiltered)
            end)

            net.Start("VlissPlayerIP")
            net.WriteEntity(pl)
            net.SendToServer()
        end
    end

    if (!Vliss.DarkRP.Enabled) or (Vliss.DarkRP.Enabled and !FAdmin) then 

        self.Commands = vgui.Create("DIconLayout", Vliss_PanelPlayer)
        self.Commands:Dock(BOTTOM)
        self.Commands:SetTall(30)
        self.Commands.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.CBoxDeniedBGColor or Color( 0, 100, 200, 0 ))
            surface.SetDrawColor(Vliss.Core.CBoxLineColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(0, 0, w, 0)
            draw.DrawText(Vliss.Language.no_additional_access, "VlissFontServerInfo", 5, 5, Vliss.Core.CBoxTextColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT)
        end
        
        if (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) and (evolve or ULib) then

            self.Commands.Paint = function(self, w, h)
                draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.CBoxAllowedBGColor or Color( 0, 100, 200, 250 ))
                surface.SetDrawColor(Vliss.Core.CBoxLineColor or Color( 255, 255, 255, 255 ))
                surface.DrawLine(0, 0, w, 0)
                draw.DrawText(Vliss.Language.commands, "VlissFontServerInfo", 5, 5, Vliss.Core.CBoxTextColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT)
            end

            local tab = (ULib and Vliss.Commands.Ulx) or (evolve and Vliss.Commands.Evolve) or (Exsto and Vliss.Commands.Exsto) or {}
            local cmd = (ULib and "ulx") or (evolve and "ev") or (exsto and "exsto") or "wtfnoadminmod"

            for k, v in pairs(tab) do
                self.commandButton = vgui.Create("DButton", self.Commands)
                self.commandButton:SetText("")
                self.commandButton:SetFont("VlissFontServerInfo")
                self.commandButton:Dock(RIGHT)
                self.commandButton.DoClick = v.clickfunc or function(self)
                    LocalPlayer():ConCommand(cmd .. " " .. v.cmd .. " \"" .. pl:Nick() .. "\"")
                end
                self.commandButton.Paint = function(self, w, h)
                    surface.SetFont("VlissFontServerInfo")
                    local color = Color(255, 255, 255, 255)

                    if self:IsHovered() or self:IsDown() then
                        color = Color(50, 150, 255, 255)
                    end

                    draw.DrawText(v.name, "VlissFontServerInfo", w / 2, 5, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    surface.SetTextColor(Color(255, 255, 255, 255))
                end

                local sizex, _ = surface.GetTextSize(v.name)
                self.commandButton:SetWide(sizex + 20)
            end
        end

    end

    self.ButtonClose = vgui.Create("DButton", Vliss_PanelPlayer)
    self.ButtonClose:SetColor(Vliss.Core.CBoxCloseButtonColor or Color( 255, 255, 255, 255 ))
    self.ButtonClose:SetFont("VlissFontCloseGUI")
    self.ButtonClose:Dock(RIGHT)
    self.ButtonClose:SetText("")
    self.ButtonClose:SetSize(32, 32)
    self.ButtonClose.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(16, 16, 16, 210))
        surface.SetDrawColor(Vliss.Core.CBoxCloseButtonColor or Color( 255, 255, 255, 255 ))
        surface.SetMaterial(Material(VlissBtnClose))
        surface.DrawTexturedRect(0, 10, 16, 16)
    end
    self.ButtonClose.DoClick = function()
        if IsValid(Vliss_PanelPlayer) then
            Vliss_PanelPlayer:MoveTo(0, Vliss_PanelPlayer:GetWide() - 30, 1, 0, 2)

            timer.Create("PanelPlayer_SlideDown", 0.5, 1, function()
                Vliss_PanelPlayer:Remove()
                VlissPlayerList:SetSize(scoreboard.w - 10, scoreboard.h - 170)
                if Vliss.Murder.Enabled then
                    if IsValid(Vliss_PanelAltContainer) then
                        Vliss_PanelAltContainer:SetVisible(false)
                    end
                    Vliss_PanelAltContainer:InvalidateParent()
                    VlissSpectatorList:SetSize(scoreboard.w - 10, scoreboard.h - 170)
                end
            end)
        end
    end

end

-----------------------------------------------------------------
-- [ SANDBOX MODE - ADD SANDBOX LABEL ]
-----------------------------------------------------------------
-- Adds each item that needs to be counted. IE: Sents, Props, 
-- NPCs, Vehicles, etc.
-----------------------------------------------------------------

function PANEL:AddSandboxLabel(label, func, buttonColor, buttonColorH, textColor)
    self.sandboxlabels = self.sandboxlabels or {}

    local itemButton = self.LayoutSandboxCounters:Add("Button")
    itemButton:SetSize(70, 25)
    itemButton:SetText("")
    itemButton.Paint = function(self, w, h)
        local color = buttonColor or Color(25, 25, 25, 200)

        if self:IsHovered() or self:IsDown() then
            color = buttonColorH or Color(35, 35, 35, 200)
        end

        draw.RoundedBox(4, 0, 0, w, h, color)
    end

    local itemLabel = vgui.Create("DLabel", itemButton)
    itemLabel:Dock(LEFT)
    itemLabel:DockMargin(5,5,5,5)
    itemLabel:SetFont("VlissFontSandboxItemLabel")
    itemLabel:SetTextColor(textColor or Color(255, 255, 255, 255))
    itemLabel:SetText(label)

    local lbl = vgui.Create("DLabel", itemButton)
    lbl:Dock(RIGHT)
    lbl:DockMargin(5,5,5,5)
    lbl:SetText("")
    lbl:SetTextColor(textColor or Color(255, 255, 255, 255))
    lbl.GetPlayerText = func
    lbl:SetFont("VlissFontSandboxItemAmt")
    lbl.IsHeading = false

    table.insert(self.sandboxlabels, lbl)

    return lbl
end

-----------------------------------------------------------------
-- [ RIGHT CLICK ACTION ]
-----------------------------------------------------------------
-- Launches Secondary Menu when panel of each player has been
-- right clicked on. Conditional gamemode options available 
-- within PANEL:DoSecondaryMenuPanel
-----------------------------------------------------------------
-- [ NOTE ] : Vliss.Commands.SecondaryMenuEnabled MUST BE 
-- ENABLED FOR THE PANEL IT WORK.
-----------------------------------------------------------------

function PANEL:DoRightClick()
    local pl = self.ply
    if not IsValid(pl) then return end
    local scoreboard = GetScoreboardPanel()
    PANEL:DoSecondaryMenuPanel(pl)

end

-----------------------------------------------------------------
-- [ VGUI.REGISTER ]
-----------------------------------------------------------------

vgui.Register("vliss_playerrow", PANEL, "DButton")