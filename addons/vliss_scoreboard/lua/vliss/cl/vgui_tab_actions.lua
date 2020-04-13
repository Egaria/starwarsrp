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

local VlissButtonToggleOff = "vliss/vliss_btn_switch_off.png"
local VlissButtonToggleOn = "vliss/vliss_btn_switch_on.png"
local VlissBtnLimits = "vliss/vliss_btn_limits.png"

function PANEL:Init()

    self.PanelTabActionContent = vgui.Create("DPanel", self)
    self.PanelTabActionContent:Dock(FILL)
    self.PanelTabActionContent:DockMargin(0, 0, 0, 0)
    self.PanelTabActionContent:SetWide(200)
    self.PanelTabActionContent:SetVisible(true)
    self.PanelTabActionContent.Paint = function(self, w, h)
        if Vliss.Core.BackgroundBlurEnabled then
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
        local buttonNormal = Color(255, 0, 0, 250)
        local buttonHover = Color(255, 0, 0, 250)
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
            self.PanelIBAdminList:SetVisible(true)
            self.PanelInnerTopAdmins:SetVisible(true)
        elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelAV) and self.PanelAV:IsVisible() then
            self.PanelAV:SetVisible(false)
            self.PanelInnerTop:SetVisible(false)
            self.PanelIBAdminList:SetVisible(true)
            self.PanelInnerTopAdmins:SetVisible(true)
        elseif IsValid(GetScoreboardPanel()) and IsValid(self.PanelServerSettings) and self.PanelServerSettings:IsVisible() then
            self.PanelServerSettings:SetVisible(false)
            self.PanelInnerTop:SetVisible(false)
            self.PanelIBAdminList:SetVisible(true)
            self.PanelInnerTopAdmins:SetVisible(true)
        else
            self.PanelInnerTopAdmins:SetVisible(false)
            self.PanelIBAdminList:SetVisible(false)
            self.PanelInnerTop:SetVisible(true)
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
            local buttonNormal = Color(255, 0, 0, 250)
            local buttonHover = Color(255, 0, 0, 250)
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

end

vgui.Register( 'vliss_panel_tab_actions', PANEL, 'EditablePanel' )