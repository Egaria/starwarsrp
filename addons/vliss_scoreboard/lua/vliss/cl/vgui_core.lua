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

local PANEL = {}

-----------------------------------------------------------------
-- [ MATERIALS ]
-----------------------------------------------------------------

local VlissBtnClose = "vliss/vliss_btn_close.png"
local VlissButtonToggleOff = "vliss/vliss_btn_switch_off.png"
local VlissButtonToggleOn = "vliss/vliss_btn_switch_on.png"
local VlissBtnLimits = "vliss/vliss_btn_limits.png"

-----------------------------------------------------------------
-- [ NETWORK RECEIVERS ]
-----------------------------------------------------------------

net.Receive("VlissMessageSet", function( len ) 
	local msg = net.ReadTable()
	chat.AddText( unpack( msg ) )
end)

-----------------------------------------------------------------
-- [ ABOUT VLISS ]
-----------------------------------------------------------------
-- Various information related to vliss. I would appreciate 
-- you leaving all of this intact, as it does help support the 
-- developer. However I'm not going to force you to keep it.
-----------------------------------------------------------------

function PANEL:VlissProductInformation()
    self.PanelAV = vgui.Create( 'vliss_panel_about', self.PanelRight )
    self.PanelAV:Dock(FILL)
    self.PanelAV:DockMargin(10, 10, 10, 10)
end

-----------------------------------------------------------------
-- [ DARKRP: SERVER SETTINGS ]
-----------------------------------------------------------------
-- As of v1.2: This is for DarkRP as the original scoreboard had.
-- It allows the admin to manage certain aspects of the server
-- in regards to toggling Player VS Player, global godmode etc.
-- Later, it will include features for sandbox and other 
-- gamemodes as well.
-----------------------------------------------------------------

function PANEL:VlissServerSettings()
    if !Vliss.DarkRP.Enabled then return end
    self.PanelServerSettings = vgui.Create( 'vliss_panel_serversettings', self.PanelRight )
    self.PanelServerSettings:Dock(FILL)
    self.PanelServerSettings:DockMargin(10, 10, 10, 10)
end

-----------------------------------------------------------------
-- [ BUILD ADMINLIST ]
-----------------------------------------------------------------
-- This builds the list of staff members on the server so 
-- everyone can see the current staff online.
-----------------------------------------------------------------

function PANEL:BuildAdminList()

	if IsValid(self.LayoutAdminsList) then self.LayoutAdminsList:Remove() end

    self.LayoutAdminsList = vgui.Create("DIconLayout", self.PanelIBAdminList)
    self.LayoutAdminsList:Dock(FILL)
    self.LayoutAdminsList:SetPos(0, 0)
    self.LayoutAdminsList:SetSpaceY(5)
    self.LayoutAdminsList:SetSpaceX(5)

    local countAdminOnline = 0

    for k, v in ipairs(player.GetAll()) do
        if !Vliss.Core.StaffGroups[string.lower(v:GetUserGroup())] then continue end

        if not v:SteamID() or v:SteamID() == "NULL" then
            playerSteamID = Vliss.Language.no_steamid
        else
            playerSteamID = v:SteamID()
        end

        self.PanelAdminsList = self.LayoutAdminsList:Add("DPanel")
        self.PanelAdminsList:SetSize(275, 72)
        self.PanelAdminsList.Paint = function(self, w, h)
            if Vliss.Core.StaffCardBlur then
                DrawBlurPanel(self, 3)
            end

            if Vliss.Core.StaffCardBGUseRankColor then
                draw.RoundedBox(5, 0, 0, w, h, Vliss.Core.UserGroupColors[v:GetUserGroup()] and Vliss.Core.UserGroupColors[v:GetUserGroup()] or Vliss.Core.StaffCardBGColor or Color( 0, 0, 0, 230 ))
            else
                draw.RoundedBox(5, 0, 0, w, h, Vliss.Core.StaffCardBGColor or Color( 0, 0, 0, 230 ))
            end
        end

        self.AvatarAdmin = vgui.Create("AvatarImage", self.PanelAdminsList)
        self.AvatarAdmin:SetSize(64, 64)
        self.AvatarAdmin:SetPos(4, 4)
        self.AvatarAdmin:SetPlayer(v, 64)

        self.LabelAdminNick = vgui.Create("DLabel", self.PanelAdminsList)
        self.LabelAdminNick:SetText(v:Nick())
        self.LabelAdminNick:SetPos(75, 3)
        self.LabelAdminNick:SetWide(self.PanelAdminsList:GetWide() - 110)
        self.LabelAdminNick:SetTall(25)
        self.LabelAdminNick:SetFont("VlissFontCardPlayerName")
        self.LabelAdminNick:SetTextColor(Vliss.Core.StaffCardNameColor or Color(255, 255, 255, 255))

        self.LabelAdminRank = vgui.Create("DLabel", self.PanelAdminsList)
        self.LabelAdminRank:SetText(Vliss.Core.UserGroupTitles[v:GetUserGroup()] and Vliss.Core.UserGroupTitles[v:GetUserGroup()] or v:GetUserGroup())
        self.LabelAdminRank:SetPos(75, 30)
        self.LabelAdminRank:SetFont("VlissFontCardRank")
        self.LabelAdminRank:SetTextColor(Vliss.Core.StaffCardRankColor or Color(255, 255, 255, 255))
        self.LabelAdminRank:SizeToContents()

        self.ButtonAdminViewProfile = vgui.Create("DButton", self.PanelAdminsList)
        self.ButtonAdminViewProfile:SetText("")
        self.ButtonAdminViewProfile:SetSize(190, 50)
        self.ButtonAdminViewProfile:SetPos(self.PanelAdminsList:GetWide() - 30, 0)
        self.ButtonAdminViewProfile.Paint = function(self, w, h)
            local ImgStaffSteamProfile = Material("vliss/vliss_btn_steam.png", "noclamp smooth")
            local ButtonAlpha = 25

            if v:IsPlayer() and IsValid(v) and not v:IsBot() then
                ButtonAlpha = 255
            end

            surface.SetDrawColor(Color(255, 255, 255, ButtonAlpha))
            surface.SetMaterial(ImgStaffSteamProfile)
            surface.DrawTexturedRect(3, 7, 19, 19)

            if self:IsHovered() or self:IsDown() then
                color = buttonHover
                txtColor = textHover
            end
        end
        self.ButtonAdminViewProfile.DoClick = function()
            if IsValid(v) then
                v:ShowProfile()
            end
        end

        countAdminOnline = countAdminOnline + 1

    end

    self.PanelInnerTopAdmins.Paint = function(self, w, h)
        draw.SimpleText(Vliss.Language.online_staff, "VlissFontOnlineStaff", 18, 45, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(countAdminOnline .. " " .. Vliss.Language.staff, "VlissFontServerStaffCount", w - 20, 45, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.DrawLine(w - 20, 58, 15, 58)
    end

end

-----------------------------------------------------------------
-- [ INIT POST - TTT TIME/ROUND REMAINING ]
-----------------------------------------------------------------
-- Need to localize this in the next update.
-----------------------------------------------------------------

hook.Add("InitPostEntity", "VlissInit", function()
    if Vliss.TTT.Enabled then

        local GetPTranslation = LANG.GetParamTranslation
        local function TTTCalcRemainingTime()
           local rounds_remaining = math.max(0, GetGlobalInt("ttt_rounds_left", 6))
           local time_remaining = math.floor(math.max(0, ((GetGlobalInt("ttt_time_limit_minutes") or 60) * 60) - CurTime()))

           local h = math.floor(time_remaining / 3600)
           time_remaining = time_remaining - math.floor(h * 3600)
           local m = math.floor(time_remaining / 60)
           time_remaining = time_remaining - math.floor(m * 60)
           local s = math.floor(time_remaining)

           return rounds_remaining, string.format("%02i:%02i:%02i", h, m, s)
        end

        timer.Create( "TTTUpdateRemaining", 0.5, 0, function()
            local r, t = TTTCalcRemainingTime()
            Vliss_TTTRemaining = GetPTranslation("sb_mapchange", {num = r, time = t})
        end)

    end
end)

-----------------------------------------------------------------
-- [ PANEL: INIT ]
-----------------------------------------------------------------

function PANEL:Init()

    self.w, self.h = ScrW() * Vliss.Core.ScoreboardScaleW or 0.90, ScrH() * Vliss.Core.ScoreboardScaleH or 0.90
    self:SetSize(self.w, self.h)
    self:Center()
    self:MakePopup()
	self:SetMouseInputEnabled(true)
	self:SetKeyboardInputEnabled(false)
    self.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- [ BACKGROUND CONTAINER ]
    ----------------------------------------------------------------- 

    if Vliss.Core.BackgroundsEnable then
        dhtmlBackground = vgui.Create("DHTML", self)
        dhtmlBackground:SetSize(ScrW(), ScrH())
        dhtmlBackground:SetScrollbars(false)
        dhtmlBackground:SetHTML([[
            <body style="overflow: hidden; height: auto; width: auto;">
                <img src="]] .. table.Random(Vliss.Core.Backgrounds) .. [[" style="position: absolute; height: auto; width: auto; top: -50%; left: -50%; bottom: -50%; right: -50%; margin: auto;">
            </body>
        ]])
        dhtmlBackground.Paint = function(self, w, h) end
    end

    -----------------------------------------------------------------
    -- [ LEFT CONTAINER ]
    ----------------------------------------------------------------- 

    self.PanelLeft = vgui.Create("DPanel", self)
    self.PanelLeft:Dock(LEFT)
    self.PanelLeft:DockMargin(0, 0, 0, 0)
    self.PanelLeft:SetWide(200)
    self.PanelLeft.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- [ LEFT TOP CONTAINER ]
    -----------------------------------------------------------------

    self.PanelLeftTop = vgui.Create("DPanel", self.PanelLeft)
    if Vliss.Core.BackgroundsEnable then
        self.PanelLeftTop:Dock(FILL)
    else
        self.PanelLeftTop:Dock(TOP)
    end
    self.PanelLeftTop:DockMargin(0, 0, 0, 0)
    self.PanelLeftTop:SetSize(200, 50)
    self.PanelLeftTop.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- [ TAB CONTAINER ]
    -----------------------------------------------------------------

    self.PanelLeftTabs = vgui.Create("DPanel", self.PanelLeft)
    self.PanelLeftTabs:Dock(TOP)
    self.PanelLeftTabs:DockMargin(0, 0, 0, 0)
    self.PanelLeftTabs:SetSize(200, 40)
    self.PanelLeftTabs.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.LeftTopPanelBGColor or Color( 0, 100, 200, 250 ))
    end

    -----------------------------------------------------------------
    -- [ TABS ]
    -----------------------------------------------------------------
    -- These are the tabs that lead to the (by default, 3) different 
    -- sections of Vliss. The home, actions, and controls tabs.
    -- I haven't fully decided how I want the system to work so for
    -- now there's a table within the code. Later I'll make it to 
    -- allow owners of the script to create their own tabs.
    -----------------------------------------------------------------

    Vliss.Core.Tabs = {
        {
            enabled = true,
            name = "",
            tooltip = "Home Tab",
            icon = "vliss/vliss_btn_leftpanel_home.png",
            textColor = Color(255,255,255,255),
            func = function() 
                self.PanelTabActionContent:SetVisible(false)
                self.PanelTabControlsContent:SetVisible(false)
                self.PanelTabHomeContent:SetVisible(true)
            end
        },
        {
            enabled = true,
            name = "",
            tooltip = "Actions Tab",
            icon = "vliss/vliss_btn_leftpanel_actions.png",
            textColor = Color(255,255,255,255),
            func = function() 
                self.PanelTabHomeContent:SetVisible(false)
                self.PanelTabControlsContent:SetVisible(false)
                self.PanelTabActionContent:SetVisible(true)
            end
        },
        {
            enabled = true,
            name = "",
            tooltip = "Controls Tab",
            icon = "vliss/vliss_btn_leftpanel_controls.png",
            textColor = Color(255,255,255,255),
            func = function()
                self.PanelTabHomeContent:SetVisible(false)
                self.PanelTabActionContent:SetVisible(false)
                self.PanelTabControlsContent:SetVisible(true)
            end
        },
    }

    for k, v in pairs(Vliss.Core.Tabs) do
        if v.enabled then
            local TabIconSize = 20

            self.ButtonTabsList = vgui.Create("DButton", self.PanelLeftTabs)
            self.ButtonTabsList:Dock(LEFT)
            self.ButtonTabsList:DockMargin(20, 3, 0, 0)
            self.ButtonTabsList:SetSize(40, 40)
            self.ButtonTabsList:SetText("")
            self.ButtonTabsList:SetVisible(true)
            self.ButtonTabsList:SetTooltip(v.tooltip)
            self.ButtonTabsList.Paint = function(self, w, h)
                local mat = Material(v.icon, "noclamp smooth")
                local color = Color(255, 255, 255, 255)

                if self:IsHovered() or self:IsDown() then
                    color = Vliss.Core.LeftTopButtonHoverColor or Color( 40, 0, 0, 255 )
                end

                surface.SetDrawColor(color)
                surface.SetMaterial(mat)
                surface.DrawTexturedRect(8, 8, TabIconSize, TabIconSize)

                draw.SimpleText(v.name, "VlissFontClock", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            self.ButtonTabsList.DoClick = v.func
        end
    end

    -----------------------------------------------------------------
    -- [ TABS CONTENT ]
    -----------------------------------------------------------------

    self.PanelTabHomeContent = vgui.Create( 'vliss_panel_tab_home', self.PanelLeft )
    self.PanelTabHomeContent:Dock(FILL)
    self.PanelTabHomeContent:SetWide(200)

    -- This section is next. Re-write this so that buttons are pulled from a table with the needed actions.
    -- Going to put these into a panel so the visual aspects are only called once.

    self.PanelTabActionContent = vgui.Create("DPanel", self.PanelLeft)
    self.PanelTabActionContent:Dock(FILL)
    self.PanelTabActionContent:DockMargin(0, 0, 0, 0)
    self.PanelTabActionContent:SetWide(200)
    self.PanelTabActionContent:SetVisible(false)
    self.PanelTabActionContent.Paint = function(self, w, h)
        if Vliss.Core.LeftMidPanelBlur then
            DrawBlurPanel(self, 3)
        end
        draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.LeftMidPanelBGColor or Color( 0, 0, 0, 250 ))
    end

    -----------------------------------------------------------------
    -- BUTTON: Toggle Scoreboard
    -----------------------------------------------------------------
    self.ButtonToggleScoreboard = vgui.Create("DButton", self.PanelTabActionContent)
    self.ButtonToggleScoreboard:SetText("")
    self.ButtonToggleScoreboard:Dock(TOP)
    self.ButtonToggleScoreboard:DockMargin(5,5,5,0)
    self.ButtonToggleScoreboard:SetSize(190, 50)

    local mat = false

    if Vliss.UseMenuIconsWithText then
        mat = Material("vliss/vliss_btn_mainmenu.png", "noclamp smooth")
        self.ButtonToggleScoreboard:SetSize(self.ButtonToggleScoreboard:GetWide(), self.ButtonToggleScoreboard:GetTall())
    elseif Vliss.UseServerIconsOnly then
        mat = Material("vliss/vliss_btn_mainmenu.png", "noclamp smooth")
        self.ButtonToggleScoreboard:SetSize(64, self.ButtonToggleScoreboard:GetTall())
    end

    self.ButtonToggleScoreboard.Paint = function(self, w, h)
        local buttonNormal = Color(124, 51, 50, 190)
        local buttonHover = Color(124, 51, 50, 240)
        local textNormal = Color(255, 255, 255, 255)
        local textHover = Color(255, 255, 255, 255)
        local buttonText = Vliss.Language.toggle_off
        local buttonDesc = Vliss.Language.set_toggle_on
        local material = Material(VlissButtonToggleOn, "noclamp smooth")
        local widthAdjust = 15

        if GetConVarNumber("vliss_scoreboardtoggle") == 1 then
            buttonNormal = Color(64, 200, 126, 190)
            buttonHover = Color(64, 220, 126, 240)
            buttonText = Vliss.Language.toggle_on
            buttonDesc = Vliss.Language.set_toggle_off
            material = Material(VlissButtonToggleOff, "noclamp smooth")
        end

        local color = buttonNormal
        local txtColor = textNormal
        if self:IsHovered() or self:IsDown() then
            color = buttonHover
            txtColor = textHover
        end

        surface.SetDrawColor(color)
        surface.DrawRect(0, 0, w, h)
        draw.VlissBoxEffects(w, h)

        if Vliss.UseMenuIconsWithText and material then
            widthAdjust = 36
            surface.SetDrawColor(txtColor)
            surface.SetMaterial(material)
            surface.DrawTexturedRect(6, 12, 24, 24)
        end

        draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", widthAdjust, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(string.upper(buttonDesc), "VlissFontMenuSubinfo", widthAdjust, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    end

    self.ButtonToggleScoreboard.DoClick = function()
        local cmd = "1"

        if GetConVarNumber("vliss_scoreboardtoggle") == 1 then
            cmd = "0"
        end

        RunConsoleCommand("vliss_scoreboardtoggle", cmd)
        GetScoreboardPanel():SetVisible(false)
        gui.EnableScreenClicker(false)
    end

    -----------------------------------------------------------------
    -- [ BUTTON : TOGGLE ADMIN VIEW ]
    -- Toggles the admin list for the server.
    -----------------------------------------------------------------
    self.ButtonToggleAdminView = vgui.Create("DButton", self.PanelTabActionContent)
    self.ButtonToggleAdminView:SetText("")
    self.ButtonToggleAdminView:SetSize(190, 50)
    self.ButtonToggleAdminView:Dock(TOP)
    self.ButtonToggleAdminView:DockMargin(5,5,5,0)

    local mat = false

    if Vliss.UseMenuIconsWithText then
        mat = Material("vliss/vliss_btn_mainmenu.png", "noclamp smooth")
        self.ButtonToggleAdminView:SetSize(self.ButtonToggleAdminView:GetWide(), self.ButtonToggleAdminView:GetTall())
    elseif Vliss.UseServerIconsOnly then
        mat = Material("vliss/vliss_btn_mainmenu.png", "noclamp smooth")
        self.ButtonToggleAdminView:SetSize(64, self.ButtonTabCustom:GetTall())
    end

    self.ButtonToggleAdminView.Paint = function(self, w, h)
        local buttonNormal = Color(124, 51, 50, 190)
        local buttonHover = Color(124, 51, 50, 240)
        local textNormal = Color(255, 255, 255, 255)
        local textHover = Color(255, 255, 255, 255)
        local buttonText = Vliss.Language.staff_view
        local buttonDesc = Vliss.Language.view_online_staff
        local material = Material(VlissButtonToggleOn, "noclamp smooth")
        local widthAdjust = 15

        if IsValid(Vliss_PanelInnerBottom) and not Vliss_PanelInnerBottom:IsVisible() then
            buttonNormal = Color(64, 200, 126, 190)
            buttonHover = Color(64, 220, 126, 240)
            buttonText = Vliss.Language.scoreboard_view
            buttonDesc = Vliss.Language.view_all_players
            material = Material(VlissButtonToggleOff, "noclamp smooth")
        end

        local color = buttonNormal
        local txtColor = textNormal
        if self:IsHovered() or self:IsDown() then
            color = buttonHover
            txtColor = textHover
        end

        surface.SetDrawColor(color)
        surface.DrawRect(0, 0, w, h)
        draw.VlissBoxEffects(w, h)

        if Vliss.UseMenuIconsWithText and material then
            widthAdjust = 36
            surface.SetDrawColor(txtColor)
            surface.SetMaterial(material, "noclamp smooth")
            surface.DrawTexturedRect(6, 12, 24, 24)
        end

        draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", widthAdjust, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(string.upper(buttonDesc), "VlissFontMenuSubinfo", widthAdjust, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    end

    self.ButtonToggleAdminView.DoClick = function()
        if IsValid(self.PanelIBAdminList) then
            self.PanelIBAdminList:SetVisible(false)
        end

        if IsValid(GetScoreboardPanel()) and Vliss_PanelInnerBottom:IsVisible() then
            Vliss_PanelInnerBottom:SetVisible(false)
            self.PanelInnerTop:SetVisible(false)
            if IsValid(self.PanelTTTCalc) then self.PanelTTTCalc:SetVisible(false) end
            self.PanelIBAdminList:SetVisible(true)
            self.PanelInnerTopAdmins:SetVisible(true)
        elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelAV) and self.PanelAV:IsVisible() then
            self.PanelAV:SetVisible(false)
            self.PanelInnerTop:SetVisible(false)
            if IsValid(self.PanelTTTCalc) then self.PanelTTTCalc:SetVisible(false) end
            self.PanelIBAdminList:SetVisible(true)
            self.PanelInnerTopAdmins:SetVisible(true)
        elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelServerSettings) and self.PanelServerSettings:IsVisible() then
            self.PanelServerSettings:SetVisible(false)
            self.PanelInnerTop:SetVisible(false)
          	if IsValid(self.PanelTTTCalc) then self.PanelTTTCalc:SetVisible(false) end
            self.PanelIBAdminList:SetVisible(true)
            self.PanelInnerTopAdmins:SetVisible(true)
        else
            self.PanelInnerTopAdmins:SetVisible(false)
            self.PanelIBAdminList:SetVisible(false)
            self.PanelInnerTop:SetVisible(true)
            if IsValid(self.PanelTTTCalc) then self.PanelTTTCalc:SetVisible(true) end
            Vliss_PanelInnerBottom:SetVisible(true)
        end
    end

    -----------------------------------------------------------------
    -- [ BUTTON : TOGGLE SCOREBOARD ]
    -----------------------------------------------------------------
    -- Scoreboard has two modes, toggle and tap. This button allows 
    -- a player to decide how they want to activate the scoreboard
    -- and sets a Convar for that player.
    -----------------------------------------------------------------

    if FAdmin and (Vliss.Core.StaffGroups[string.lower(LocalPlayer():GetUserGroup())] or LocalPlayer():IsSuperAdmin()) then

        self.ButtonServerSettings = vgui.Create("DButton", self.PanelTabActionContent)
        self.ButtonServerSettings:SetText("")
        self.ButtonServerSettings:SetSize(190, 50)
        self.ButtonServerSettings:Dock(TOP)
        self.ButtonServerSettings:DockMargin(5,5,5,0)
        if Vliss.DarkRP.Enabled then
            self.ButtonServerSettings:SetVisible(true)
        else
            self.ButtonServerSettings:SetVisible(false)
        end
        
        local mat = false

        if Vliss.UseMenuIconsWithText then
            mat = Material("vliss/vliss_btn_mainmenu.png", "noclamp smooth")
            self.ButtonServerSettings:SetSize(self.ButtonServerSettings:GetWide(), self.ButtonServerSettings:GetTall())
        elseif Vliss.UseServerIconsOnly then
            mat = Material("vliss/vliss_btn_mainmenu.png", "noclamp smooth")
            self.ButtonServerSettings:SetSize(64, self.ButtonServerSettings:GetTall())
        end

        self.ButtonServerSettings.Paint = function(self, w, h)
            local buttonNormal = Color(64, 105, 126, 190)
            local buttonHover = Color(64, 105, 126, 240)
            local textNormal = Color(255, 255, 255, 255)
            local textHover = Color(255, 255, 255, 255)
            local buttonText = Vliss.Language.server_settings
            local buttonDesc = Vliss.Language.server_settings_desc
            local material = Material(VlissBtnLimits, "noclamp smooth")
            local widthAdjust = 15

            local color = buttonNormal
            local txtColor = textNormal
            if self:IsHovered() or self:IsDown() then
                color = buttonHover
                txtColor = textHover
            end

            surface.SetDrawColor(color)
            surface.DrawRect(0, 0, w, h)
            draw.VlissBoxEffects(w, h)

            if Vliss.UseMenuIconsWithText and material then
                widthAdjust = 36
                surface.SetDrawColor(txtColor)
                surface.SetMaterial(material)
                surface.DrawTexturedRect(6, 12, 24, 24)
            end

            draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", widthAdjust, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText(string.upper(buttonDesc), "VlissFontMenuSubinfo", widthAdjust, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        end

        self.ButtonServerSettings.DoClick = function()
            if IsValid(self.PanelServerSettings) then
                self.PanelServerSettings:Remove()
            end
            self:VlissServerSettings()
            if IsValid(GetScoreboardPanel()) and Vliss_PanelInnerBottom:IsVisible() then
                Vliss_PanelInnerBottom:SetVisible(false)
                self.PanelInnerTop:SetVisible(false)
                self.PanelServerSettings:SetVisible(true)
            elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelIBAdminList) and self.PanelIBAdminList:IsVisible() then
                self.PanelInnerTopAdmins:SetVisible(false)
                self.PanelIBAdminList:SetVisible(false)
                self.PanelInnerTop:SetVisible(false)
                self.PanelServerSettings:SetVisible(true)
            elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelAV) and self.PanelAV:IsVisible() then
                self.PanelAV:SetVisible(false)
                self.PanelInnerTop:SetVisible(false)
                self.PanelServerSettings:SetVisible(true)
            else
                self.PanelServerSettings:SetVisible(false)
                self.PanelInnerTop:SetVisible(true)
                Vliss_PanelInnerBottom:SetVisible(true)
            end
        end

    end

    -----------------------------------------------------------------
    -- [ BUTTON : ACTIONS ]
    -----------------------------------------------------------------
    -- Action buttons allow users to perform certain actions on 
    -- themselves. Typically this would be anything related to 
    -- cleaning up their props, local stopsound, or whatever else
    -- you can think of.
    -----------------------------------------------------------------
    for k, v in pairs(Vliss.Actions) do
        if v.enabled then
            self.ButtonTabCustom = vgui.Create("DButton", self.PanelTabActionContent)
            self.ButtonTabCustom:SetText("")
            self.ButtonTabCustom:SetSize(190, 50)
            self.ButtonTabCustom:Dock(TOP)
            self.ButtonTabCustom:DockMargin(5,5,5,0)
            local mat = false

            if v.icon and Vliss.UseMenuIconsWithText then
                mat = Material(v.icon, "noclamp smooth")
                self.ButtonTabCustom:SetSize(self.ButtonTabCustom:GetWide(), self.ButtonTabCustom:GetTall())
            elseif v.icon and Vliss.UseServerIconsOnly then
                mat = Material(v.icon, "noclamp smooth")
                self.ButtonTabCustom:SetSize(64, self.ButtonTabCustom:GetTall())
            end

            self.ButtonTabCustom.Paint = function(self, w, h)
                local color = v.buttonNormal
                local txtColor = v.textNormal
                local widthAdjust = 15

                if self:IsHovered() or self:IsDown() then
                    color = v.buttonHover
                    txtColor = v.textHover
                end

                surface.SetDrawColor(color)
                surface.DrawRect(0, 0, w, h)
                draw.VlissBoxEffects(w, h)
                if Vliss.UseMenuIconsWithText and mat then
                    widthAdjust = 36
                    surface.SetDrawColor(txtColor)
                    surface.SetMaterial(mat)
                    surface.DrawTexturedRect(6, 12, 24, 24)
                end

                draw.SimpleText(string.upper(v.name), "VlissFontMenuItem", widthAdjust, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(string.upper(v.description), "VlissFontMenuSubinfo", widthAdjust, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

            end

            self.ButtonTabCustom.DoClick = v.func

        end
    end

    self.PanelTabControlsContent = vgui.Create( 'vliss_panel_tab_controls', self.PanelLeft )
    self.PanelTabControlsContent:Dock(FILL)
    self.PanelTabControlsContent:SetWide(200)
    self.PanelTabControlsContent:SetVisible(false)

    -----------------------------------------------------------------
    -- [ ABOUT VLISS BUTTON ]
    -----------------------------------------------------------------

    self.ButtonVlissInfo = vgui.Create("DButton", self.PanelTabHomeContent)
    self.ButtonVlissInfo:SetText("")
    self.ButtonVlissInfo:SetSize(200, 30)
    self.ButtonVlissInfo:Dock(BOTTOM)
    if not Vliss.Core.AboutVlissEnabled then
    	self.ButtonVlissInfo:SetVisible(false)
    end
    self.ButtonVlissInfo:SetTooltip("About the Vliss Scoreboard")
    self.ButtonVlissInfo.Paint = function( self, w, h )

        local txtColor = Color( 255, 255, 255, 100)
        local boxColor = Color( 0, 0, 0, 254 )
        local lineColor = Color( 50, 50, 50, 150 )

        if self:IsHovered() or self:IsDown() then
            txtColor = Color( 255, 255, 255, 200 )
            boxColor = Color( 0, 0, 0, 255 )
            lineColor = Color( 50, 50, 50, 210 ) 
        end

        draw.RoundedBox(0, 0, 0, w, h, boxColor)
        surface.SetDrawColor(lineColor)
        surface.DrawLine(0, 0, w, 0)

        draw.SimpleText(string.upper("About Vliss Scoreboard"), "VlissAboutText", self:GetWide() / 2, self:GetTall() / 2 + 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end
    self.ButtonVlissInfo.DoClick = function()
        if IsValid(self.PanelAV) then
            self.PanelAV:Remove()
        end

        net.WriteEntity(pl)
        net.SendToServer()

        self:VlissProductInformation()

        if IsValid(GetScoreboardPanel()) and Vliss_PanelInnerBottom:IsVisible() then
            Vliss_PanelInnerBottom:SetVisible(false)
            self.PanelAV:SetVisible(true)
        elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelIBAdminList) and self.PanelIBAdminList:IsVisible() then
            self.PanelInnerTopAdmins:SetVisible(false)
            self.PanelIBAdminList:SetVisible(false)
            self.PanelInnerTop:SetVisible(true)
            self.PanelAV:SetVisible(true)
        elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelServerSettings) and self.PanelServerSettings:IsVisible() then
            self.PanelServerSettings:SetVisible(false)
            self.PanelInnerTop:SetVisible(true)
            self.PanelAV:SetVisible(true)
        else
            self.PanelAV:SetVisible(false)
            self.PanelInnerTop:SetVisible(true)
            Vliss_PanelInnerBottom:SetVisible(true)
        end
    end

    -----------------------------------------------------------------
    -- [ WIDGET ]
    -----------------------------------------------------------------
    -- Originally just the clock, I added the ability to change how
    -- this section could be utilized. As time goes on, I'll add more 
    -- things that players can select from.
    -----------------------------------------------------------------
    -- [ Vliss.Core.WidgetType ]
    --
    -- This setting determines how will show in the widget.
    --      Vliss.Core.WidgetType = 1   :: Displays a clock
    --      Vliss.Core.WidgetType = 2   :: Current map / # of players
    -----------------------------------------------------------------

    if Vliss.Core.WidgetEnabled then
        self.PanelCustomWidget = vgui.Create("DPanel", self.PanelLeft)
        self.PanelCustomWidget:Dock(BOTTOM)
        self.PanelCustomWidget:SetSize(200, 60)
        self.PanelCustomWidget.Paint = function(self, w, h)
            if Vliss.Core.BackgroundBlurEnabled then
                DrawBlurPanel(self, 3)
            end
            draw.RoundedBox(0, 0, 0, w, h, Color(0, 100, 200, 250))
            if Vliss.Core.WidgetType == 1 then
                draw.SimpleText(os.date(Vliss.Core.WidgetClockFormat), "VlissFontClock", w / 2, h / 2, Vliss.Core.WidgetTextColor or Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            elseif Vliss.Core.WidgetType == 2 then
                draw.SimpleText("Map:", "VlissFontServerInfo", 10, 15, Vliss.Core.WidgetTextColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(game.GetMap(), "VlissFontServerInfo", w - 10, 15, Vliss.Core.WidgetTextColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

                draw.SimpleText("Players:", "VlissFontServerInfo", 10, 40, Vliss.Core.WidgetTextColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(table.Count(player.GetAll()) .. " / " .. game.MaxPlayers(), "VlissFontServerInfo", w - 10, 40, Vliss.Core.WidgetTextColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Invalid Widget Type", "VlissFontClock", w / 2, h / 2, Vliss.Core.WidgetTextColor or Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end
    end

    -----------------------------------------------------------------
    -- Panel: Right Container
    -----------------------------------------------------------------

    self.PanelRight = vgui.Create("DPanel", self)
    self.PanelRight:Dock(FILL)
    self.PanelRight.Paint = function(self, w, h)
        if Vliss.Core.BackgroundBlurEnabled then DrawBlurPanel(self, 3) end
        draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.MiddlePanelBGColor or Color( 16, 16, 16, 210 ))
    end

    -----------------------------------------------------------------
    -- Panel: Inner Top
    -- Holds Network Name, server players, and current map
    -----------------------------------------------------------------

    self.PanelInnerTop = vgui.Create("DPanel", self.PanelRight)
    self.PanelInnerTop:Dock(TOP)
    self.PanelInnerTop:DockMargin(5, 5, 5, 0)
    self.PanelInnerTop:SetTall(60)
    self.PanelInnerTop.Paint = function(self, w, h)
        draw.SimpleText(Vliss.Core.NetworkName or "Garrys Mod Server", "VlissFontNetworkName", w - 5, 45, Vliss.Core.NetworkNameColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end

    -----------------------------------------------------------------
    -- [ TTT : ROUND STATUS ]
    -- Code which determines how many rounds or how much time is left 
    -- on the current map.
    -----------------------------------------------------------------

    if Vliss.TTT.Enabled and Vliss.TTT.RemainingTimeEnabled then

        self.PanelTTTCalc = vgui.Create("DPanel", self.PanelRight)
        self.PanelTTTCalc:SetTall(14)
        self.PanelTTTCalc:SetPos(2, 50)
        self.PanelTTTCalc:SetWide(300)
        self.PanelTTTCalc.Paint = function(self, w, h)
            local defineWidthPos = 40
            if Vliss.ColumnStyleOCD then
                defineWidthPos = 5
            end
            draw.SimpleText(Vliss_TTTRemaining, "VlissFontTTTRemaining", defineWidthPos, 5, Vliss.TTT.RemainingTimeText or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

    end

    -----------------------------------------------------------------
    -- Panel: Inner Bottom
    -- Holds the VlissPlayerList
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
        Vliss_PanelInnerBottom = vgui.Create("DPanel", self.PanelRight)
        Vliss_PanelInnerBottom:Dock(FILL)
        Vliss_PanelInnerBottom:DockMargin(5, 5, 5, 5)
        Vliss_PanelInnerBottom.Paint = function(self, w, h) end

        Vliss_PanelAltContainer = vgui.Create("DPanel", Vliss_PanelInnerBottom)
        Vliss_PanelAltContainer:Dock(BOTTOM)
        Vliss_PanelAltContainer:SetTall(100)
        Vliss_PanelAltContainer:DockMargin(0, 0, 0, 0)
        Vliss_PanelAltContainer:SetVisible(false)
        Vliss_PanelAltContainer.Paint = function(self, w, h) end

        self.VlissPMurderPlayers = vgui.Create("DPanel", Vliss_PanelInnerBottom)
        self.VlissPMurderPlayers:Dock(LEFT)
        self.VlissPMurderPlayers:SetWide(470)
        self.VlissPMurderPlayers:DockMargin(0, 0, 5, 0)
        self.VlissPMurderPlayers.Paint = function(self, w, h) end

        self.VlissPMurderSpec = vgui.Create("DPanel", Vliss_PanelInnerBottom)
        self.VlissPMurderSpec:Dock(FILL)
        self.VlissPMurderSpec:SetWide(470)
        self.VlissPMurderSpec:DockMargin(0, 0, 0, 0)
        self.VlissPMurderSpec.Paint = function(self, w, h) end
    else
        Vliss_PanelInnerBottom = vgui.Create("DPanel", self.PanelRight)
        Vliss_PanelInnerBottom:Dock(FILL)
        Vliss_PanelInnerBottom:DockMargin(5, 5, 5, 5)
        Vliss_PanelInnerBottom.Paint = function(self, w, h) end
    end

    -----------------------------------------------------------------
    -- Panel: Inner Top Admins
    -- Displays current staff # and Online Staff text
    -----------------------------------------------------------------

    self.PanelInnerTopAdmins = vgui.Create("DPanel", self.PanelRight)
    self.PanelInnerTopAdmins:Dock(TOP)
    self.PanelInnerTopAdmins:DockMargin(5, 5, 5, 0)
    self.PanelInnerTopAdmins:SetTall(60)
    self.PanelInnerTopAdmins:SetVisible(false)

    self.PanelIBAdminList = vgui.Create("DPanel", self.PanelRight)
    self.PanelIBAdminList:Dock(FILL)
    self.PanelIBAdminList:DockMargin(25, 20, 10, 10)
    self.PanelIBAdminList:SetVisible(false)
    self.PanelIBAdminList.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- Panel: Inner Cols
    -- Player list top column names
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
        self.PanelInnerCols = vgui.Create("DPanel", self.VlissPMurderPlayers)

    	local PanelLabel
    	local teamID
    	local teamScore
    	if Vliss.Murder.Enabled then
    		PanelLabel = Vliss.Murder.TeamSpecLabel
    	elseif Vliss.PropHunt.Enabled then
			teamID = Vliss.PropHunt.TeamProps
			teamScore = team.GetScore( teamID ) 
    		PanelLabel = Vliss.PropHunt.TeamPropsTitle .. " ( " .. teamScore .. " wins )"
    	end

        self.PanelInnerColsSpec = vgui.Create("DPanel", self.VlissPMurderSpec)
        self.PanelInnerColsSpec:Dock(TOP)
        self.PanelInnerColsSpec:DockMargin(0, 5, 0, 0)
        self.PanelInnerColsSpec:SetTall(30)
        self.PanelInnerColsSpec.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Vliss.Murder.TeamSpecLabelBgColor or Color( 0, 0, 0, 230 ))
            draw.SimpleText( PanelLabel, "VlissFontColName", 6, 15, Vliss.Murder.TeamSpecLabelColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        -----------------------------------------------------------------
        -- [ ALT SECONDARY LIST ]
        -----------------------------------------------------------------

        self.ButtonTeamAltJoin = vgui.Create("DButton", self.PanelInnerColsSpec)
        self.ButtonTeamAltJoin:Dock(RIGHT)
        self.ButtonTeamAltJoin:SetText(Vliss.Murder.TeamSpecJoinBtnText)
        self.ButtonTeamAltJoin:SetTextColor(Vliss.Murder.TeamSpecJoinBtnTextColor)
        self.ButtonTeamAltJoin:SetFont("Trebuchet18")
        self.ButtonTeamAltJoin.DoClick = function()
        	local TeamID 
			if Vliss.Murder.Enabled then
            	TeamID = 1
            elseif Vliss.PropHunt.Enabled then
            	TeamID = Vliss.PropHunt.TeamProps
            end
            RunConsoleCommand("vliss_jointeam", TeamID)
        end
        self.ButtonTeamAltJoin.Paint = function(self, w, h)
            surface.SetDrawColor(Vliss.Murder.TeamSpecJoinBtnColor)
            surface.DrawRect(0, 0, w, h)

            surface.SetDrawColor(255,255,255,10)
            surface.DrawRect(0, 0, w, h * 0.45 )

            surface.SetDrawColor(color_black)
            surface.DrawOutlinedRect(0, 0, w, h)

            if self:IsDown() then
                surface.SetDrawColor(50,50,50,120)
                surface.DrawRect(1, 1, w - 2, h - 2)
            elseif self:IsHovered() then
                surface.SetDrawColor(255,255,255,30)
                surface.DrawRect(1, 1, w - 2, h - 2)
            end
        end

    else
		self.PanelInnerCols = vgui.Create("DPanel", Vliss_PanelInnerBottom)
    end

    self.PanelInnerCols:Dock(TOP)
    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
        self.PanelInnerCols:DockMargin(0, 5, 0, 0)
    else
        if Vliss.ColumnStyleOCD then
            self.PanelInnerCols:DockMargin(0, 5, 0, 0)
        else
            self.PanelInnerCols:DockMargin(35, 5, 0, 0)
        end
    end

    self.PanelInnerCols:SetTall(30)

    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then

        self.PanelInnerCols.Paint = function(self, w, h)
        	local PanelLabel
        	local teamID
        	local teamScore
        	if Vliss.Murder.Enabled then
        		PanelLabel = Vliss.Murder.TeamPlayersLabel
        	elseif Vliss.PropHunt.Enabled then
				teamID = Vliss.PropHunt.TeamHunters
				teamScore = team.GetScore( teamID ) 
    			PanelLabel = Vliss.PropHunt.TeamHuntersTitle .. " ( " .. teamScore .. " wins )"
        	end
            draw.RoundedBox(0, 0, 0, w, h, Vliss.Murder.TeamPlayersLabelBgColor or Color( 0, 0, 0, 230 ))
            draw.SimpleText( PanelLabel, "VlissFontColName", 6, 15, Vliss.Murder.TeamPlayersLabelColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        -----------------------------------------------------------------
        -- [ MURDER MODE ]
        -- Join players button
        -----------------------------------------------------------------

        self.ButtonTeamPlayersJoin = vgui.Create("DButton", self.PanelInnerCols)
        self.ButtonTeamPlayersJoin:Dock(RIGHT)
        self.ButtonTeamPlayersJoin:SetText(Vliss.Murder.TeamPlayersJoinBtnText)
        self.ButtonTeamPlayersJoin:SetTextColor(Vliss.Murder.TeamPlayersJoinBtnTextColor)
        self.ButtonTeamPlayersJoin:SetFont("Trebuchet18")
        self.ButtonTeamPlayersJoin.DoClick = function()
        	local TeamID 
			if Vliss.Murder.Enabled then
            	TeamID = 2
            elseif Vliss.PropHunt.Enabled then
            	TeamID = Vliss.PropHunt.TeamHunters
            end
            RunConsoleCommand("vliss_jointeam", TeamID)
        end
        self.ButtonTeamPlayersJoin.Paint = function(self, w, h)
            surface.SetDrawColor(Vliss.Murder.TeamPlayersJoinBtnColor)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(255,255,255,10)
            surface.DrawRect(0, 0, w, h * 0.45 )
            surface.SetDrawColor(color_black)
            surface.DrawOutlinedRect(0, 0, w, h)
            if self:IsDown() then
                surface.SetDrawColor(50,50,50,120)
                surface.DrawRect(1, 1, w - 2, h - 2)
            elseif self:IsHovered() then
                surface.SetDrawColor(255,255,255,30)
                surface.DrawRect(1, 1, w - 2, h - 2)
            end
        end

	else

		self.PanelInnerCols.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 230))
            draw.SimpleText(Vliss.Language.name, "VlissFontColName", 6, 15, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end

        self.cols = {}
        self:AddColumn(Vliss.Language.ping)
        for k, v in pairs(Vliss.CustomColumns) do
            if v.enabled then self:AddColumn(v.name, v.func, v.width) end
        end

    end

    -----------------------------------------------------------------
    -- [ PLAYER LIST ]
    -----------------------------------------------------------------
    -- Generates the needed lists for players. Certain gamemodes use 
    -- a different layout.
    -----------------------------------------------------------------

    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
        VlissPlayerList = vgui.Create('DPanelList', self.VlissPMurderPlayers)
        VlissSpectatorList = vgui.Create('DPanelList', self.VlissPMurderSpec)
        VlissSpectatorList:Dock(TOP)
        VlissSpectatorList:SetSpacing(-1)
        VlissSpectatorList:EnableVerticalScrollbar(false)
        VlissSpectatorList.Paint = function(self, w, h) end
    else
		VlissPlayerList = vgui.Create('DPanelList', Vliss_PanelInnerBottom)
    end

    VlissPlayerList:Dock(TOP)
    VlissPlayerList:SetSpacing(-1)
    VlissPlayerList:EnableVerticalScrollbar(false)
    VlissPlayerList.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- [ SERVER LIST ]
    -----------------------------------------------------------------
    -- This allows for the server owner to specify servers that 
    -- players can click on in order to connect to.
    -----------------------------------------------------------------

    if table.Count(Vliss.Servers) > 0 and Vliss.ServersEnabled then
        self.PanelServerlistBox = vgui.Create( 'vliss_panel_serverconn', self.PanelRight )
        self.PanelServerlistBox:Dock(BOTTOM)
        self.PanelServerlistBox:SetTall(60)
    end

    -----------------------------------------------------------------
    -- Function Vliss:OpenURL
    -----------------------------------------------------------------
    -- Takes a URL and opens it within the custom browser.
    -----------------------------------------------------------------
    function Vliss:OpenURL(vlissURL, VlissTitle)

        if IsValid(self.FrameBrowser) then self.FrameBrowser:Remove() end

        self.FrameBrowser = vgui.Create("DFrame", self)
        self.FrameBrowser:SetSize(ScrW() - 200, ScrH() - 250)
        self.FrameBrowser:SetVisible(true)
        self.FrameBrowser:MakePopup()
        self.FrameBrowser:Center()
        self.FrameBrowser:ShowCloseButton(false)
        self.FrameBrowser:SetTitle("")
        self.FrameBrowser.Paint = function(self, w, h)
            if Vliss.Core.BackgroundBlurEnabled then
                DrawBlurPanel(self)
            end
            surface.SetDrawColor(0, 0, 0, 0)
            draw.RoundedBox(4, 0, 0, w, h, Vliss.Core.BrowserColor or Color( 0, 0, 0, 240 ))
            draw.DrawText(VlissTitle, "VlissFontBrowserTitle", self:GetWide() / 2, 8, color_white, TEXT_ALIGN_CENTER)
        end

        self.ButtonDoClose = vgui.Create("DButton", self.FrameBrowser)
        self.ButtonDoClose:SetColor(Color(255, 255, 255, 255))
        self.ButtonDoClose:SetFont("VlissFontCloseGUI")
        self.ButtonDoClose:SetText("")
        self.ButtonDoClose.Paint = function()
            surface.SetDrawColor(Color(255, 255, 255, 255))
            surface.SetMaterial(Material(VlissBtnClose, "noclamp smooth"))
            surface.DrawTexturedRect(0, 10, 16, 16)
        end
        self.ButtonDoClose:SetSize(32, 32)
        self.ButtonDoClose:SetPos(self.FrameBrowser:GetWide() - 30, 0)
        self.ButtonDoClose.DoClick = function()
            if IsValid(self.FrameBrowser) then
                self.FrameBrowser:Remove()
            end
        end

        self.DHTMLWindow = vgui.Create("DHTML", self.FrameBrowser)
        self.DHTMLWindow:SetSize(ScrW() - 200, 300)
        self.DHTMLWindow:DockMargin(10, 10, 5, 10)
        self.DHTMLWindow:Dock(FILL)

        self.DHTMLControlsBrowser = vgui.Create("DHTMLControls", self.FrameBrowser)
        self.DHTMLControlsBrowser:Dock(TOP)
        self.DHTMLControlsBrowser:SetWide(ScrW() - 200)
        self.DHTMLControlsBrowser:SetPos(0, 0)
        self.DHTMLControlsBrowser:SetHTML(self.DHTMLWindow)
        self.DHTMLControlsBrowser.AddressBar:SetText(vlissURL)

        self.DHTMLWindow:MoveBelow(self.DHTMLControlsBrowser)
        self.DHTMLWindow:OpenURL(vlissURL)
    end

    -----------------------------------------------------------------
    -- Function Vliss:OpenText
    -----------------------------------------------------------------
    -- Takes standard text (or a table of text) and prints it to 
    -- window.
    -----------------------------------------------------------------
    function Vliss:OpenText(vlissText, VlissTitle)

        if IsValid(self.FrameBrowser) then self.FrameBrowser:Remove() end

        self.FrameBrowser = vgui.Create("DFrame", self)
        self.FrameBrowser:SetPos(100, 70)
        self.FrameBrowser:SetSize(ScrW() - 200, ScrH() - 250)
        self.FrameBrowser:SetVisible(true)
        self.FrameBrowser:MakePopup()
        self.FrameBrowser:ShowCloseButton(false)
        self.FrameBrowser:SetTitle("")
        self.FrameBrowser.Paint = function(self, w, h)
            if Vliss.Core.BackgroundBlurEnabled then
                DrawBlurPanel(self)
            end
            surface.SetDrawColor(0, 0, 0, 0)
            draw.RoundedBox(4, 0, 0, w, h, Vliss.Core.BrowserColor or Color( 0, 0, 0, 240 ))
            draw.DrawText(VlissTitle, "VlissFontBrowserTitle", self.FrameBrowser:GetWide() / 2, 8, color_white, TEXT_ALIGN_CENTER)
        end

        self.ButtonDoClose = vgui.Create("DButton", self.FrameBrowser)
        self.ButtonDoClose:SetColor(Color(255, 255, 255, 255))
        self.ButtonDoClose:SetFont("VlissFontCloseGUI")
        self.ButtonDoClose:SetText("")
        self.ButtonDoClose:SetSize(32, 32)
        self.ButtonDoClose:SetPos(self.FrameBrowser:GetWide() - 30, 0)
        self.ButtonDoClose.Paint = function()
            surface.SetDrawColor(Color(255, 255, 255, 255))
            surface.SetMaterial(Material(VlissBtnClose, "noclamp smooth"))
            surface.DrawTexturedRect(0, 10, 16, 16)
        end
        self.ButtonDoClose.DoClick = function()
            if IsValid(self.FrameBrowser) then
                self.FrameBrowser:Remove()
            end
        end

        self.txtEntryMessage = vgui.Create("DTextEntry", self.FrameBrowser)
        self.txtEntryMessage:SetPos(15, 80)
        self.txtEntryMessage:SetMultiline(true)
        self.txtEntryMessage:SetDrawBackground(false)
        self.txtEntryMessage:SetEnabled(true)
        self.txtEntryMessage:SetSize(ScrW() - 225, ScrH() / 2)
        self.txtEntryMessage:SetVerticalScrollbarEnabled(true)
        self.txtEntryMessage:SetFont("VlissFontStandardText")
        self.txtEntryMessage:SetText(vlissText)
        self.txtEntryMessage:SetTextColor(Color(255, 255, 255, 255))
    end

    self:UpdateScoreboard()
    self:StartUpdateTimer()

end

function PANEL:AddColumn(label, func, width)
    self.cols = self.cols or {}
    local lbl = vgui.Create("DLabel", self.PanelInnerCols)
    lbl:SetText(label)
    lbl:SetFont("VlissFontColName")
    lbl.IsHeading = true
    lbl.Width = width or 55
    table.insert(self.cols, lbl)

    return lbl
end

local oldconfig
local madeteams

function PANEL:UpdateScoreboard(force)
    if not force and not self:IsVisible() then return end
    local layout = true

    if oldconfig != Vliss.Core.TeamMode then
        if IsValid(VlissPlayerList) then VlissPlayerList:Clear() end
        if IsValid(VlissSpectatorList) then VlissSpectatorList:Clear() end
    end

    if not madeteams or ( IsValid(VlissPlayerList) and table.Count(VlissPlayerList:GetChildren()) < 1 ) then
        self:LayoutTeams()
        madeteams = true
    end

    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
        if not madeteams or ( IsValid(VlissSpectatorList) and table.Count(VlissSpectatorList:GetChildren()) < 1 ) then
            self:LayoutTeams()
            madeteams = true
        end
    end

    if Vliss.TTT.Enabled then
        self:LayoutPlayersTTTMode()
    elseif not Vliss.Core.TeamMode then
        self:LayoutPlayersNoTeams()
        if Vliss.Murder.Enabled then
            self:LayoutPlayersMurderMode()
        elseif Vliss.PropHunt.Enabled then
            self:LayoutPlayersPropHuntMode()
        end
    else
        self:LayoutPlayers()
    end

    if layout then
        self:PerformLayout()
    else
        self:InvalidateLayout()
    end

    if IsValid(self.PanelSpectatorlistBox) then self.PanelSpectatorlistBox:Remove() end

    self:BuildAdminList()
	self:GeneratePropHuntSpectators()
	self.PanelRight:InvalidateLayout()
    oldconfig = Vliss.Core.TeamMode
end

-----------------------------------------------------------------
-- [ UPDATE TIMER ]
-- Tick tock on the clock but the party don't stop.
-----------------------------------------------------------------

function PANEL:StartUpdateTimer()
    if not timer.Exists("VlissScoreboardUpdater") then
        timer.Create("VlissScoreboardUpdater", 1, 0, function()
            local VlissPanel = GetScoreboardPanel()
            if IsValid(VlissPanel) then VlissPanel:UpdateScoreboard() end
        end)
    end
end

function PANEL:GeneratePropHuntSpectators()

    if Vliss.PropHunt.Enabled then

		local spectatorList = ""
		local specCount = 0
		for k, v in pairs(player.GetAll()) do
			if v:Team() != TEAM_SPECTATOR then continue end
			specCount = specCount + 1
			spectatorList = v:Name() .. "      " .. spectatorList
		end

		if specCount > 0 then 

		    self.PanelSpectatorlistBox = vgui.Create("DPanel", self.PanelRight)
		    self.PanelSpectatorlistBox:Dock(BOTTOM)
		    self.PanelSpectatorlistBox:SetTall(Vliss.PropHunt.SpeclistBoxHeight or 35)
		    self.PanelSpectatorlistBox.Paint = function(self, w, h)
		        draw.RoundedBox(0, 0, 0, w, h, Vliss.PropHunt.SpeclistBoxColor or Color(0, 0, 0, 250))
	            surface.SetDrawColor(Vliss.PropHunt.SpeclistBoxBorderlineColor or Color( 255, 255, 255, 255 ))
	            surface.DrawLine(0, 0, w, 0)
		    end

			self.LabelSpectatorsTitle = vgui.Create("DLabel", self.PanelSpectatorlistBox)
			self.LabelSpectatorsTitle:DockMargin( 15, 5, 5, 5 )
			self.LabelSpectatorsTitle:Dock(LEFT)
			self.LabelSpectatorsTitle:SetTall(15)
			self.LabelSpectatorsTitle:SetWide(70)
			self.LabelSpectatorsTitle:SetFont("VlissFontPHSpecTitle")
			self.LabelSpectatorsTitle:SetText("SPECTATORS")
			self.LabelSpectatorsTitle:SetTextColor(Vliss.PropHunt.SpeclistTitleTextColor)
			self.LabelSpectatorsTitle.Paint = function(w, h) end

            self.LabelSpectatorsList = vgui.Create("DLabel", self.PanelSpectatorlistBox)
			self.LabelSpectatorsList:DockMargin( 15, 5, 5, 5 )
			self.LabelSpectatorsList:Dock(FILL)
			self.LabelSpectatorsList:SetTall(15)
			self.LabelSpectatorsList:SetFont("VlissFontPHSpecList")
			self.LabelSpectatorsList:SetText(spectatorList)
			self.LabelSpectatorsList:SetTextColor(Vliss.PropHunt.SpeclistPlayersTextColor)
			self.LabelSpectatorsList.Paint = function(w, h) end

		end

	end

end

function PANEL:PerformLayout()

    if IsValid(Vliss_PanelPlayer) then
        VlissPlayerList:SetSize(self.w - 10, self.h - 278)
        if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then VlissSpectatorList:SetSize(self.w - 10, self.h - 170) end
    else
        VlissPlayerList:SetSize(self.w - 10, self.h - 170)
        if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then VlissSpectatorList:SetSize(self.w - 10, self.h - 170) end
    end

    if Vliss.ScrollbarEnable then
        VlissPlayerList:EnableVerticalScrollbar(true)
        if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then VlissSpectatorList:EnableVerticalScrollbar(true) end
    else
        VlissPlayerList:EnableVerticalScrollbar(false)
        if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then VlissSpectatorList:EnableVerticalScrollbar(false) end
    end

    VlissPlayerList:SetPos(5, 90)
    if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then VlissSpectatorList:SetPos(5, 90) end
    local cx = self.w - 220
    self.cols = self.cols or {}

    for k, v in ipairs(self.cols) do
        v:SizeToContents()
        cx = cx - v.Width
        v:SetPos(cx - v:GetWide() / 2, 4)
    end

end

-----------------------------------------------------------------
-- [ LAYOUT PLAYERS : NO TEAMS ]
-----------------------------------------------------------------

function PANEL:LayoutPlayersNoTeams()

    VlissPlayerList:Clear()
    self.SortedPlayers = {}

    for k, v in ipairs(player.GetAll()) do
        self.SortedPlayers[k] = v
    end

    if Vliss.ColumnSortBy == "deaths" then
        table.sort(self.SortedPlayers, function(a, b) return a:Deaths() > b:Deaths() end)
    elseif Vliss.ColumnSortBy == "kills" then
        table.sort(self.SortedPlayers, function(a, b) return a:Frags() > b:Frags() end)
    elseif Vliss.ColumnSortBy == "teams" then
        table.sort(self.SortedPlayers, function(a, b) return a:Team() > b:Team() end)
    else
        table.sort(self.SortedPlayers, function(a, b) return a:Frags() > b:Frags() end)
    end

    for k, v in ipairs(self.SortedPlayers) do
        if IsValid(v) and (v:Team() != TEAM_CONNECTING) then
            if Vliss.Murder.Enabled or Vliss.PropHunt.Enabled then
            	local TeamID
            	if Vliss.Murder.Enabled then
            		TeamID = 2
            	elseif Vliss.PropHunt.Enabled then
            		TeamID = Vliss.PropHunt.TeamHunters
            	end
                if v:Team() == TeamID then 
                    local row = vgui.Create("vliss_playerrow")
                    row.ply = v
                    row:SetSize(VlissPlayerList:GetWide(), 40)
                    row:SetPos(0, 0)
                    row:SetPlayer(v)
                    row:SetParent(VlissPlayerList)
                    VlissPlayerList:AddItem(row)
                end
            else
                local row = vgui.Create("vliss_playerrow")
                row.ply = v
                row:SetSize(VlissPlayerList:GetWide(), 40)
                row:SetPos(0, 0)
                row:SetPlayer(v)
                row:SetParent(VlissPlayerList)
                VlissPlayerList:AddItem(row)
            end
        end
    end

end

local i = 0

-----------------------------------------------------------------
-- [ LIST OF PLAYERS - USED FOR ALL GAMEMODES ]
-----------------------------------------------------------------

function PANEL:MakeTeamPanel(tm)
    i = 10
    VlissPlayerList[tm] = vgui.Create("DPanelList", VlissPlayerList)
    VlissPlayerList[tm]:SetPos(0, 0)
    VlissPlayerList[tm]:Dock(TOP)
    VlissPlayerList[tm]:SetTall(60)
    VlissPlayerList[tm].team = tm
    VlissPlayerList[tm].rows = 0
    VlissPlayerList[tm].Paint = function(self, w, h) end

    VlissPlayerList:AddItem(VlissPlayerList[tm])
end

-----------------------------------------------------------------
-- [ LIST OF SPECTATORS - USED FOR CERTAIN GAMEMODES ]
-----------------------------------------------------------------

function PANEL:VlissSpectatorList(tm)
    i = 10
    VlissSpectatorList[tm] = vgui.Create("DPanelList", VlissSpectatorList)
    VlissSpectatorList[tm]:SetPos(0, 0)
    VlissSpectatorList[tm]:Dock(TOP)
    VlissSpectatorList[tm]:SetTall(60)
    VlissSpectatorList[tm].team = tm
    VlissSpectatorList[tm].rows = 0
    VlissSpectatorList[tm].Paint = function(self, w, h) end

    VlissSpectatorList:AddItem(VlissSpectatorList[tm])
end

-----------------------------------------------------------------
-- [ LAYOUT TEAMS : STANDARD ]
-----------------------------------------------------------------

function PANEL:LayoutTeams(tm, rm)

    if rm then
        if IsValid(VlissPlayerList[tm]) then
            VlissPlayerList[tm]:Remove()
        end
        return
    end

    if tm and not IsValid(VlissPlayerList[tm]) then
        self:MakeTeamPanel(tm)
        return
    end

    if Vliss.TTT.Enabled then
        for g = 1, Vliss.Core.HideSpectators and 3 or 4 do
            self:MakeTeamPanel(g)
        end
        self:LayoutPlayersTTTMode()
        return
    end

    for k, v in pairs(team.GetAllTeams()) do
        if table.Count(team.GetPlayers(k)) == 0 or (Vliss.Core.HideSpectators and (k == TEAM_SPECTATOR or k == TEAM_SPEC)) then
            if VlissPlayerList[k] then
                VlissPlayerList[k]:Remove()
            end
            continue
        end
        self:MakeTeamPanel(k)
    end

    self:LayoutPlayers()

end

-----------------------------------------------------------------
-- [ TTT TEAMS ]
-----------------------------------------------------------------

local TTTNames = {}
TTTNames[1] = "Terrorists"
TTTNames[2] = "Missing in Action"
TTTNames[3] = "Dead"
TTTNames[4] = "Spectators"

-----------------------------------------------------------------
-- [ GENERATE TEAM NAMES ]
-----------------------------------------------------------------

function PANEL:MakeTeamName(k)

    VlissPlayerList[k].teamname = vgui.Create("DPanel", VlissPlayerList[k])
    VlissPlayerList[k].teamname:SetTall(20)
    VlissPlayerList[k].teamname:Dock(TOP)

    if ColumnStyleMatch then
        VlissPlayerList[k].teamname:DockMargin(0,0,0,0)
    else
        VlissPlayerList[k].teamname:DockMargin(35,0,0,0)
    end

    local name = "Unknown"
    if team.GetName(k) then
        name = team.GetName(k) .. " (" ..  VlissPlayerList[k].rows .. ")"
    elseif Vliss.TeamNames and Vliss.TeamNames[team.GetName(k)] then
        name = Vliss.TeamNames[team.GetName(k)]
    end

    if Vliss.TTT.Enabled then
        name = TTTNames[k] .. " (" ..  VlissPlayerList[k].rows .. ")"
    end

    surface.SetFont("VlissFontCloseGUI")
    local sizex, _ = surface.GetTextSize(name)
    VlissPlayerList[k].teamname:SetWide(sizex + 10)

    VlissPlayerList[k].teamname.Paint = function(self, w, h)

        if Vliss.TTT.Enabled and TTTNames[k] then
            name = TTTNames[k] .. " (" ..  VlissPlayerList[k].rows .. ")"
        end

        draw.VlissBox(0, 0, w, h, Vliss.Core.TeamRowColor )
        draw.DrawText(name, "VlissFontCloseGUI", 5, 3, color_white, TEXT_ALIGN_LEFT)
    end
    VlissPlayerList[k]:AddItem(VlissPlayerList[k].teamname)

end

-----------------------------------------------------------------
-- [ LAYOUT PLAYERS : TTT GAMEMODE ]
-----------------------------------------------------------------

function PANEL:LayoutPlayersTTTMode()

    for g = 1, Vliss.Core.HideSpectators and 3 or 4 do
        if IsValid(VlissPlayerList[g]) then
            VlissPlayerList[g]:Clear()
            VlissPlayerList[g].rows = 0
            self:MakeTeamName(g)
        else
            self:MakeTeamPanel(g)
        end
    end

    for k, v in pairs(player.GetAll()) do
        if not IsValid(v) then continue end
        local group = ScoreGroup(v)

        if Vliss.Core.HideSpectators and (v:Team() == TEAM_SPECTATOR) then 
			if IsValid(VlissPlayerList[group]) then VlissPlayerList[group]:Remove() end
			continue
		end

        local row = vgui.Create("vliss_playerrow", VlissPlayerList[group])
        row.ply = v
        row:SetSize(VlissPlayerList[group]:GetWide(), 40)
        row:SetPlayer(v)
        VlissPlayerList[group]:AddItem(row)
        VlissPlayerList[group].rows = VlissPlayerList[group].rows and VlissPlayerList[group].rows + 1 or 1
    end

    for r = 1, Vliss.Core.HideSpectators and 3 or 4 do
        if !IsValid(VlissPlayerList[r]) then continue end
        VlissPlayerList[r]:SetTall(20 + ( ( VlissPlayerList[r].rows or 0 ) * 40))
        if Vliss.TTT.ShowUsedTeamsOnly and VlissPlayerList[r].rows < 1 then VlissPlayerList[r]:Remove() end
    end
end

-----------------------------------------------------------------
-- [ LAYOUT PLAYERS : MURDER GAMEMODE ]
-----------------------------------------------------------------

function PANEL:LayoutPlayersMurderMode()
    if IsValid(VlissSpectatorList) then VlissSpectatorList:Clear() end
    self.SortedPlayers = {}

    for k, v in ipairs(player.GetAll()) do
        self.SortedPlayers[k] = v
    end

    if Vliss.ColumnSortBy == "deaths" then
        table.sort(self.SortedPlayers, function(a, b) return a:Deaths() > b:Deaths() end)
    elseif Vliss.ColumnSortBy == "kills" then
        table.sort(self.SortedPlayers, function(a, b) return a:Frags() > b:Frags() end)
    elseif Vliss.ColumnSortBy == "teams" then
        table.sort(self.SortedPlayers, function(a, b) return a:Team() > b:Team() end)
    else
        table.sort(self.SortedPlayers, function(a, b) return a:Frags() > b:Frags() end)
    end

    for k, v in ipairs(self.SortedPlayers) do
        if IsValid(v) and (v:Team() != TEAM_CONNECTING) then
            if v:Team() == 2 then continue end
            local row = vgui.Create("vliss_playerrow")
            row.ply = v
            row:SetSize(VlissSpectatorList:GetWide(), 40)
            row:SetPos(0, 0)
            row:SetPlayer(v)
            row:SetParent(VlissSpectatorList)
            VlissSpectatorList:AddItem(row)
        end
    end
end

-----------------------------------------------------------------
-- [ LAYOUT PLAYERS : PROPHUNT GAMEMODE ]
-----------------------------------------------------------------

function PANEL:LayoutPlayersPropHuntMode()
    if IsValid(VlissSpectatorList) then VlissSpectatorList:Clear() end
    self.SortedPlayers = {}

    for k, v in ipairs(player.GetAll()) do
        self.SortedPlayers[k] = v
    end

    if Vliss.ColumnSortBy == "deaths" then
        table.sort(self.SortedPlayers, function(a, b) return a:Deaths() > b:Deaths() end)
    elseif Vliss.ColumnSortBy == "kills" then
        table.sort(self.SortedPlayers, function(a, b) return a:Frags() > b:Frags() end)
    elseif Vliss.ColumnSortBy == "teams" then
        table.sort(self.SortedPlayers, function(a, b) return a:Team() > b:Team() end)
    else
        table.sort(self.SortedPlayers, function(a, b) return a:Frags() > b:Frags() end)
    end

    for k, v in ipairs(self.SortedPlayers) do
        if IsValid(v) and (v:Team() != TEAM_CONNECTING) then
            if v:Team() == Vliss.PropHunt.TeamProps then 
	            local row = vgui.Create("vliss_playerrow")
	            row.ply = v
	            row:SetSize(VlissSpectatorList:GetWide(), 40)
	            row:SetPos(0, 0)
	            row:SetPlayer(v)
	            row:SetParent(VlissSpectatorList)
	            VlissSpectatorList:AddItem(row)
            end

        end
    end
end

-----------------------------------------------------------------
-- [ LAYOUT PLAYERS : STANDARD ]
-----------------------------------------------------------------

function PANEL:LayoutPlayers()
    self.SortedPlayers = {}

    for k, v in pairs(team.GetAllTeams()) do
        if not IsValid(VlissPlayerList[k]) and table.Count(team.GetPlayers(k)) > 0 then
            self:LayoutTeams(k)
            continue
        end

        if table.Count(team.GetPlayers(k)) == 0 or (Vliss.Core.HideSpectators and k == TEAM_SPECTATOR) then
            self:LayoutTeams(k, true)
            continue
        end

        VlissPlayerList[k]:Clear()
        self:MakeTeamName(k)
        VlissPlayerList[k].rows = 0

        for _k, _v in pairs(team.GetPlayers(k)) do
            if not IsValid(_v) then continue end
            if _v:Team() == TEAM_CONNECTING then continue end
            if Vliss.Core.HideSpectators and (_v:Team() == 1) then continue end
            local row = vgui.Create("vliss_playerrow", VlissPlayerList[k])
            row.ply = _v
            row:SetSize(VlissPlayerList[k]:GetWide(), 40)
            row:SetPlayer(_v)
            VlissPlayerList[k]:AddItem(row)
            VlissPlayerList[k].rows = VlissPlayerList[k].rows and VlissPlayerList[k].rows + 1 or 1
        end

        VlissPlayerList[k]:SetTall(20 + (VlissPlayerList[k].rows * 40))
    end
end

function PANEL:Paint(w, h)
    draw.VlissBox(0, 0, w, 40, Color(255, 255, 255, 255))
end

concommand.Add("vliss_settings", function()
    if not LocalPlayer():IsSuperAdmin() then return end
    vgui.Create( "vliss_settings" )
end)

vgui.Register("vliss_scoreboard", PANEL, "EditablePanel")