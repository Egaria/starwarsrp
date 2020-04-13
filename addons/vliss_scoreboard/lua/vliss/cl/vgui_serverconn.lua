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

    self.PanelServerlistBox = vgui.Create("DPanel", self)
    self.PanelServerlistBox:Dock(BOTTOM)
    self.PanelServerlistBox:SetTall(60)
    self.PanelServerlistBox.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
        surface.SetDrawColor(Color(5, 5, 5, 255))
    end

    local buttonCount = 0

    for k, v in pairs(Vliss.Servers) do
        self.ButtonTabServers = vgui.Create("DButton", self.PanelServerlistBox)
        self.ButtonTabServers:SetText("")
        surface.SetFont("VlissFontButtonItem")
        local sizex, sizey = surface.GetTextSize(string.upper(v.hostname))
        self.ButtonTabServers:SetSize(sizex + 20, 60)
        self.ButtonTabServers:Dock(LEFT)
        self.ButtonTabServers:DockMargin(5, 0, 0, 0)
        local mat = false

        if v.icon and Vliss.UseServerIconsWithText then
            mat = Material(v.icon, "noclamp smooth")
            self.ButtonTabServers:SetSize(self.ButtonTabServers:GetWide() + 32, self.ButtonTabServers:GetTall())
        elseif v.icon and Vliss.UseServerIconsOnly then
            mat = Material(v.icon, "noclamp smooth")
            self.ButtonTabServers:SetSize(64, self.ButtonTabServers:GetTall())
        end

        self.ButtonTabServers.Paint = function(self, w, h)
            local color = Vliss.ServerButtonColor or Color(15, 15, 15, 0)
            local txtColor = Vliss.ServerButtonTextColor or Color(255, 255, 255, 255)

            if self:IsHovered() or self:IsDown() then
                color = Vliss.ServerButtonHoverColor or Color(255, 255, 255, 220)
                txtColor = Vliss.ServerButtonHoverTextColor or Color(0, 0, 0, 255)
            end

            surface.SetDrawColor(color)
            surface.DrawRect(0, 0, w, h)

            if mat and (Vliss.UseServerIconsWithText or Vliss.UseServerIconsOnly) then
                surface.SetDrawColor(txtColor)
                surface.SetMaterial(mat)
            end

            if Vliss.UseServerIconsWithText and mat then
                surface.DrawTexturedRect(5, 14, 32, 32)
                draw.SimpleText(string.upper(v.hostname), "VlissFontButtonItem", self:GetWide() / 2 + 16, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            elseif Vliss.UseServerIconsOnly and mat then
                surface.DrawTexturedRect(17, 14, 32, 32)
            else
                draw.SimpleText(string.upper(v.hostname), "VlissFontButtonItem", self:GetWide() / 2, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end

        self.ButtonTabServers.DoClick = function()
            self.PanelEffect = vgui.Create("DPanel")
            self.PanelEffect:Dock(FILL)
            self.PanelEffect:DockMargin(0, 0, 0, 0)
            self.PanelEffect.Paint = function(self, w, h)
                if Vliss.Core.BackgroundBlurEnabled then
                    DrawBlurPanel(self, 3)
                end
                draw.RoundedBox(0, 0, 0, w, h, Color( 15, 15, 15, 230 ) )
            end

            self.FrameConfirmBox = vgui.Create( "DFrame" )
            self.FrameConfirmBox:SetTitle( "" )
            self.FrameConfirmBox:SetSize( 400, 160 )
            self.FrameConfirmBox:SetDraggable( false )
            self.FrameConfirmBox:ShowCloseButton( false )
            self.FrameConfirmBox:Center()
            self.FrameConfirmBox:MakePopup()
            self.FrameConfirmBox.Paint = function( self, w, h )
                if Vliss.Core.BackgroundBlurEnabled then
                    DrawBlurPanel(self)
                end
                draw.RoundedBox( 4, 0, 0, w, h, Color( 10, 10, 10, 230 ) )
            end
            self.FrameConfirmBox.OnKeyCodePressed = function()
                if IsValid(self.PanelEffect) then self.PanelEffect:Remove() end
                if IsValid(self.FrameConfirmBox) then self.FrameConfirmBox:Remove() end
            end

            self.LabelConfirmTitle = vgui.Create("DLabel", self.FrameConfirmBox)
            self.LabelConfirmTitle:Dock(TOP)
            self.LabelConfirmTitle:DockMargin(10, 0, 1, 0)
            self.LabelConfirmTitle:SetFont("VlissFontConfirmTitle")
            self.LabelConfirmTitle:SetTextColor(Vliss.Core.StaffCardNameColor or Color(255, 255, 255, 255))
            self.LabelConfirmTitle:SizeToContents()
            self.LabelConfirmTitle:SetText("Connect to " .. v.hostname .. "?")

            self.LabelConfirmMessage = vgui.Create("DLabel", self.FrameConfirmBox)
            self.LabelConfirmMessage:Dock(TOP)
            self.LabelConfirmMessage:SetTall(45)
            self.LabelConfirmMessage:DockMargin(10, 0, 5, 0)
            self.LabelConfirmMessage:SetFont("VlissFontConfirmText")
            self.LabelConfirmMessage:SetTextColor(Vliss.Core.StaffCardNameColor or Color(255, 255, 255, 255))
            self.LabelConfirmMessage:SetWrap( true )
            self.LabelConfirmMessage:SetText("Are you sure you want to connect to " .. v.ip .. "? You will be disconnected from the current server and redirected automatically.")

            self.PanelConfirmContainer = vgui.Create("DPanel", self.FrameConfirmBox)
            self.PanelConfirmContainer:Dock(FILL)
            self.PanelConfirmContainer:DockMargin(5, 10, 5, 10)
            self.PanelConfirmContainer.Paint = function(self, w, h) end

            self.ButtonConnect = vgui.Create( "DButton", self.PanelConfirmContainer )
            self.ButtonConnect:Dock(LEFT)
            self.ButtonConnect:SetWide(260)
            self.ButtonConnect:DockMargin(0, 0, 5, 0)
            self.ButtonConnect:SetText( "Yes, connect me" )
            self.ButtonConnect:SetFont("VlissFontConfirmButton")
            self.ButtonConnect:SetTextColor( Color( 255, 255, 255 ) )
            self.ButtonConnect.Paint = function( self, w, h )
                draw.RoundedBox( 4, 0, 0, w, h, Color(64, 105, 126, 190) )
            end
            self.ButtonConnect.DoClick = function()
                if IsValid(self.PanelEffect) then self.PanelEffect:Remove() end
                if IsValid(self.FrameConfirmBox) then self.FrameConfirmBox:Remove() end
                LocalPlayer():ConCommand("connect " .. v.ip)
            end

            self.ButtonClose = vgui.Create( "DButton", self.PanelConfirmContainer )
            self.ButtonClose:Dock(FILL)
            self.ButtonClose:DockMargin(5, 0, 0, 0)
            self.ButtonClose:SetWide(200)
            self.ButtonClose:SetText( "No, stay here" )
            self.ButtonClose:SetFont("VlissFontConfirmButton")
            self.ButtonClose:SetTextColor( Color( 255, 255, 255 ) )
            self.ButtonClose.Paint = function( self, w, h )
                draw.RoundedBox( 4, 0, 0, w, h, Color(124, 51, 50, 190) )
            end
            self.ButtonClose.DoClick = function()
                if IsValid(self.PanelEffect) then self.PanelEffect:Remove() end
                if IsValid(self.FrameConfirmBox) then self.FrameConfirmBox:Remove() end
            end

        end

        buttonCount = buttonCount + 1
    end
end

vgui.Register( 'vliss_panel_serverconn', PANEL, 'EditablePanel' )