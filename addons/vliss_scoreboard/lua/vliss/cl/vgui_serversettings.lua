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

function PANEL:Init()

    local w,h = ScrW() * Vliss.Core.ScoreboardScaleW - 200, ScrH() * Vliss.Core.ScoreboardScaleH

    self.PanelServerSettings = vgui.Create("DPanel", self)
    self.PanelServerSettings:Dock(FILL)
    self.PanelServerSettings:DockMargin(10, 0, 10, 20)
    self.PanelServerSettings:SetVisible(true)
    self.PanelServerSettings.Paint = function(self, w, h) end

    self.PanelSSContainerT = vgui.Create("DPanel", self.PanelServerSettings)
    self.PanelSSContainerT:Dock(TOP)
    self.PanelSSContainerT:DockMargin(0, 10, 0, 0)
    self.PanelSSContainerT:SetTall(35)
    self.PanelSSContainerT.Paint = function(self, w, h) end

    self.PanelSSContainer = vgui.Create("DPanel", self.PanelServerSettings)
    self.PanelSSContainer:Dock(FILL)
    self.PanelSSContainer:DockMargin(0, 0, 0, 0)
    self.PanelSSContainer.Paint = function(self, w, h) end

    self.PanelSSContainerTL = vgui.Create("DPanel", self.PanelSSContainer)
    self.PanelSSContainerTL:Dock(LEFT)
    self.PanelSSContainerTL:SetWide(w * .32)
    self.PanelSSContainerTL:DockMargin(0, 0, 0, 0)
    self.PanelSSContainerTL.Paint = function(self, w, h) end

    self.PanelSSContainerTL2 = vgui.Create("DPanel", self.PanelSSContainer)
    self.PanelSSContainerTL2:Dock(LEFT)
    self.PanelSSContainerTL2:SetWide(w * .32)
    self.PanelSSContainerTL2:DockMargin(0, 0, 0, 0)
    self.PanelSSContainerTL2.Paint = function(self, w, h) end

    self.PanelSSContainerTL3 = vgui.Create("DPanel", self.PanelSSContainer)
    self.PanelSSContainerTL3:Dock(LEFT)
    self.PanelSSContainerTL3:SetWide(w * .32)
    self.PanelSSContainerTL3:DockMargin(0, 0, 0, 0)
    self.PanelSSContainerTL3.Paint = function(self, w, h) end

    self.PanelSSActions = vgui.Create( "DPanel", self.PanelSSContainerTL )
    self.PanelSSActions:SetSize( Vliss.DarkRP.FAdminActions.ButtonActionW, Vliss.DarkRP.FAdminActions.ButtonContainerH or 100 )
    self.PanelSSActions:Dock(FILL)
    self.PanelSSActions.Paint = function() end

    self.LayoutSSActions = vgui.Create("DIconLayout", self.PanelSSActions)
    self.LayoutSSActions:Dock(FILL)
    self.LayoutSSActions:DockMargin(7, 5, 0, 0)
    self.LayoutSSActions:SetSpaceY(5)
    self.LayoutSSActions:SetSpaceX(5)

    self.ButtonSS_ServerActionsTitle = vgui.Create("DButton", self.PanelSSContainerTL)
    self.ButtonSS_ServerActionsTitle:Dock(TOP)
    self.ButtonSS_ServerActionsTitle:SetText("")
    self.ButtonSS_ServerActionsTitle:DockMargin(5, 10, 5, 5)
    self.ButtonSS_ServerActionsTitle:SetTall(30)
    self.ButtonSS_ServerActionsTitle.Paint = function(self, w, h)
        draw.SimpleText(Vliss.Language.server_actions, "VlissFontNetworkName", 0, h/2, Vliss.Core.NetworkNameColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    for k, v in pairs( Vliss.DarkRP.ServerActions ) do

        if not FAdmin then return end
        if not v.enabled then continue end
        if not FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), v.permission, pl) then continue end

        self.ButtonServerItem = self.LayoutSSActions:Add("Button")
        self.ButtonServerItem:SetSize(250, 50)
        self.ButtonServerItem:SetText("")

        self.ButtonServerLabel = vgui.Create("DLabel", self.ButtonOptionShowIdentity)
        self.ButtonServerLabel:Dock(RIGHT)
        self.ButtonServerLabel:DockMargin(5,5,5,5)
        self.ButtonServerLabel:SetFont("VlissFontSandboxItemLabel")
        self.ButtonServerLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
        self.ButtonServerLabel:SetSize( ButtonLabelW, ButtonActionH )
        self.ButtonServerLabel:SetText("")

        self.ButtonServerItem.Paint = function(self, w, h)
            local buttonNormal = v.buttonNormal or Color(64, 105, 126, 190)
            local buttonHover = v.buttonHover or Color(64, 105, 126, 240)
            local textNormal = v.textNormal or Color(255, 255, 255, 255)
            local textHover = v.textHover or Color(255, 255, 255, 255)
            local material = Material(v.icon, "noclamp smooth")

            local color = buttonNormal
            local txtColor = textNormal

            if self:IsHovered() or self:IsDown() then
                color = buttonHover
                txtColor = textHover
            end

            surface.SetDrawColor(color)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(0, Vliss.Core.ButtonLinedrawLength or 15, 0, 0)
            surface.DrawLine(Vliss.Core.ButtonLinedrawLength or 15, 0, 0, 0)
            surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(w - Vliss.Core.ButtonLinedrawLength or 15, h - 1, w, h - 1)
            surface.DrawLine(w - 1, h, w - 1, h - Vliss.Core.ButtonLinedrawLength or 15)

            if Vliss.UseMenuIconsWithText and material then
                surface.SetDrawColor(txtColor)
                surface.SetMaterial(material)
                surface.DrawTexturedRect(6, 12, 24, 24)
                draw.SimpleText(string.upper(v.name), "VlissFontMenuItem", 36, self:GetTall() * .48, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText(string.upper(v.name), "VlissFontMenuItem", 15, self:GetTall() * .48, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end

        self.ButtonServerItem.DoClick = v.func

    end

    self.PanelPlayerActions = vgui.Create( "DPanel", self.PanelSSContainerTL2 )
    self.PanelPlayerActions:SetSize( Vliss.DarkRP.FAdminActions.ButtonActionW, Vliss.DarkRP.FAdminActions.ButtonContainerH or 100 )
    self.PanelPlayerActions:Dock(FILL)
    self.PanelPlayerActions.Paint = function() end

    self.LayoutPlayerActions = vgui.Create("DIconLayout", self.PanelPlayerActions)
    self.LayoutPlayerActions:Dock(FILL)
    self.LayoutPlayerActions:DockMargin(7, 5, 0, 0)
    self.LayoutPlayerActions:SetSpaceY(5)
    self.LayoutPlayerActions:SetSpaceX(5)

    self.ButtonSS_PlayerActionsTitle = vgui.Create("DButton", self.PanelSSContainerTL2)
    self.ButtonSS_PlayerActionsTitle:Dock(TOP)
    self.ButtonSS_PlayerActionsTitle:SetText("")
    self.ButtonSS_PlayerActionsTitle:DockMargin(5, 10, 5, 5)
    self.ButtonSS_PlayerActionsTitle:SetTall(30)
    self.ButtonSS_PlayerActionsTitle.Paint = function(self, w, h)
        draw.SimpleText(Vliss.Language.player_actions, "VlissFontNetworkName", 0, h/2, Vliss.Core.NetworkNameColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    for k, v in pairs( Vliss.DarkRP.PlayerActions ) do

        if not FAdmin then return end
        self.ButtonServerItem = self.LayoutPlayerActions:Add("Button")
        self.ButtonServerItem:SetSize(250, 50)
        self.ButtonServerItem:SetText("")

        self.ButtonLabel = vgui.Create("DLabel", self.ButtonOptionShowIdentity)
        self.ButtonLabel:Dock(RIGHT)
        self.ButtonLabel:DockMargin(5,5,5,5)
        self.ButtonLabel:SetFont("VlissFontSandboxItemLabel")
        self.ButtonLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
        self.ButtonLabel:SetSize( ButtonLabelW, ButtonActionH )
        self.ButtonLabel:SetText("")

        self.ButtonServerItem.Paint = function(self, w, h)
            local buttonNormal = v.buttonNormal or Color(64, 105, 126, 190)
            local buttonHover = v.buttonHover or Color(64, 105, 126, 240)
            local textNormal = v.textNormal or Color(255, 255, 255, 255)
            local textHover = v.textHover or Color(255, 255, 255, 255)
            local material = Material(v.icon, "noclamp smooth")
            local buttonText = v.name or ""
            local buttonStatus = v.status or ""

            local buttonColor = buttonNormal
            local txtColor = textNormal

            if self:IsHovered() or self:IsDown() then
                buttonColor = buttonHover
                txtColor = textHover
            end

            if v.convarAvail then
                if GetConVarNumber(v.convar) == v.convarDefault then
                    buttonColor = v.toggledButtonNormal or Color(64, 105, 126, 190)
                    buttonStatus = v.toggledStatus or ""
                    material = Material(v.toggledIcon, "noclamp smooth")
                    if self:IsHovered() or self:IsDown() then
                        buttonColor = v.toggledButtonHover or Color(64, 105, 126, 190)
                    end

                end
            end

            surface.SetDrawColor(buttonColor)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(0, Vliss.Core.ButtonLinedrawLength or 15, 0, 0)
            surface.DrawLine(Vliss.Core.ButtonLinedrawLength or 15, 0, 0, 0)
            surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(w - Vliss.Core.ButtonLinedrawLength or 15, h - 1, w, h - 1)
            surface.DrawLine(w - 1, h, w - 1, h - Vliss.Core.ButtonLinedrawLength or 15)


            -- [ TODO ]
            -- Bad way to do this. Next update I'm going to completely optimize the code.

            if Vliss.UseMenuIconsWithText and material then
                surface.SetDrawColor(txtColor)
                surface.SetMaterial(material)
                surface.DrawTexturedRect(6, 12, 24, 24)
                if v.status and v.toggledStatus then
                    draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", 36, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(string.upper(buttonStatus), "VlissFontMenuSubinfo", 36, self:GetTall() * .70, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", 36, self:GetTall() * .48, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(string.upper(buttonStatus), "VlissFontMenuSubinfo", 36, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end
            else
                draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", 15, self:GetTall() * .48, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(string.upper(buttonStatus), "VlissFontMenuSubinfo", 15, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end

        self.ButtonServerItem.DoClick = v.func

    end

    self.PanelServerSet = vgui.Create( "DPanel", self.PanelSSContainerTL3 )
    self.PanelServerSet:SetSize( Vliss.DarkRP.FAdminActions.ButtonActionW, Vliss.DarkRP.FAdminActions.ButtonContainerH or 100 )
    self.PanelServerSet:Dock(FILL)
    self.PanelServerSet.Paint = function() end

    self.LayoutServerSet = vgui.Create("DIconLayout", self.PanelServerSet)
    self.LayoutServerSet:Dock(FILL)
    self.LayoutServerSet:DockMargin(7, 5, 0, 0)
    self.LayoutServerSet:SetSpaceY(5)
    self.LayoutServerSet:SetSpaceX(5)

    self.ButtonSS_ServerSetTitle = vgui.Create("DButton", self.PanelSSContainerTL3)
    self.ButtonSS_ServerSetTitle:Dock(TOP)
    self.ButtonSS_ServerSetTitle:SetText("")
    self.ButtonSS_ServerSetTitle:DockMargin(5, 10, 5, 5)
    self.ButtonSS_ServerSetTitle:SetTall(30)
    self.ButtonSS_ServerSetTitle.Paint = function(self, w, h)
        draw.SimpleText(Vliss.Language.server_settings, "VlissFontNetworkName", 0, h/2, Vliss.Core.NetworkNameColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    for k, v in pairs( Vliss.DarkRP.ServerSettings ) do

        if not FAdmin then return end
        self.ButtonServerItem = self.LayoutServerSet:Add("Button")
        self.ButtonServerItem:SetSize(250, 50)
        self.ButtonServerItem:SetText("")

        self.ButtonLabel = vgui.Create("DLabel", self.ButtonOptionShowIdentity)
        self.ButtonLabel:Dock(RIGHT)
        self.ButtonLabel:DockMargin(5,5,5,5)
        self.ButtonLabel:SetFont("VlissFontSandboxItemLabel")
        self.ButtonLabel:SetTextColor(Vliss.Murder.AdminFeatures.ButtonTextColor or Color(255, 255, 255, 255))
        self.ButtonLabel:SetSize( ButtonLabelW, ButtonActionH )
        self.ButtonLabel:SetText("")

        self.ButtonServerItem.Paint = function(self, w, h)
            local buttonNormal = v.buttonNormal or Color(64, 105, 126, 190)
            local buttonHover = v.buttonHover or Color(64, 105, 126, 240)
            local textNormal = v.textNormal or Color(255, 255, 255, 255)
            local textHover = v.textHover or Color(255, 255, 255, 255)
            local material = Material(v.icon, "noclamp smooth")
            local buttonText = v.name or ""
            local buttonStatus = v.status or ""

            local buttonColor = buttonNormal
            local txtColor = textNormal

            if self:IsHovered() or self:IsDown() then
                buttonColor = buttonHover
                txtColor = textHover
            end

            if v.convarAvail then
                if GetConVarNumber(v.convar) == v.convarDefault then
                    buttonColor = v.toggledButtonNormal or Color(64, 105, 126, 190)
                    buttonStatus = v.toggledStatus or ""
                    material = Material(v.toggledIcon, "noclamp smooth")
                    if self:IsHovered() or self:IsDown() then
                        buttonColor = v.toggledButtonHover or Color(64, 105, 126, 190)
                    end

                end
            end

            surface.SetDrawColor(buttonColor)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(0, Vliss.Core.ButtonLinedrawLength or 15, 0, 0)
            surface.DrawLine(Vliss.Core.ButtonLinedrawLength or 15, 0, 0, 0)
            surface.SetDrawColor(Vliss.Core.ButtonLinedrawColor or Color( 255, 255, 255, 255 ))
            surface.DrawLine(w - Vliss.Core.ButtonLinedrawLength or 15, h - 1, w, h - 1)
            surface.DrawLine(w - 1, h, w - 1, h - Vliss.Core.ButtonLinedrawLength or 15)

            if Vliss.UseMenuIconsWithText and material then
                surface.SetDrawColor(txtColor)
                surface.SetMaterial(material)
                surface.DrawTexturedRect(6, 12, 24, 24)
                if v.status and v.toggledStatus then
                    draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", 36, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(string.upper(buttonStatus), "VlissFontMenuSubinfo", 36, self:GetTall() * .70, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", 36, self:GetTall() * .48, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(string.upper(buttonStatus), "VlissFontMenuSubinfo", 36, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end
            else
                draw.SimpleText(string.upper(buttonText), "VlissFontMenuItem", 15, self:GetTall() * .48, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(string.upper(buttonStatus), "VlissFontMenuSubinfo", 15, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
        end

        self.ButtonServerItem.DoClick = v.func

    end

end

vgui.Register( 'vliss_panel_serversettings', PANEL, 'EditablePanel' )