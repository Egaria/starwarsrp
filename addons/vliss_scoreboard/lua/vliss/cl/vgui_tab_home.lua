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

    self.PanelTabHomeContent = vgui.Create("DPanel", self)
    self.PanelTabHomeContent:Dock(FILL)
    self.PanelTabHomeContent:DockMargin(0, 0, 0, 0)
    self.PanelTabHomeContent:SetWide(200)
    self.PanelTabHomeContent.Paint = function(self, w, h)
        if Vliss.Core.BackgroundBlurEnabled then
            DrawBlurPanel(self, 3)
        end
        draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.LeftMidPanelBGColor or Color( 0, 0, 0, 250 ))
    end

    -----------------------------------------------------------------
    -- [ BUTTONS ]
    -----------------------------------------------------------------
    -- These are the standard buttons that a user can click on 
    -- in order to navigate to different network areas including 
    -- steam workshop collections, a network website, or even a 
    -- donation link.
    -----------------------------------------------------------------

    for k, v in pairs(Vliss.Buttons) do
        if v.enabled then
            self.ButtonTabCustom = vgui.Create("DButton", self.PanelTabHomeContent)
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

vgui.Register( 'vliss_panel_tab_home', PANEL, 'EditablePanel' )