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

    -----------------------------------------------------------------
    -- [ CONTROLS ]
    -----------------------------------------------------------------
    -- Specified in the configuration file, these are buttons that
    -- users can click on in order to perform certain tasks. 
    -- This could be things like executing Pointshop, the context 
    -- menu, or other features that have keybinds or you can even
    -- force playersays for chat commands.
    -----------------------------------------------------------------

    self.PanelTabControlsContent = vgui.Create("DPanel", self)
    self.PanelTabControlsContent:Dock(FILL)
    self.PanelTabControlsContent:DockMargin(0, 0, 0, 0)
    self.PanelTabControlsContent:SetWide(200)
    self.PanelTabControlsContent:SetVisible(true)
    self.PanelTabControlsContent.Paint = function(self, w, h)
        if Vliss.Core.BackgroundBlurEnabled then
            DrawBlurPanel(self, 3)
        end
        draw.RoundedBox(0, 0, 0, w, h, Vliss.Core.LeftMidPanelBGColor)
    end

    self.LayoutListControls = vgui.Create("DIconLayout", self.PanelTabControlsContent)
    self.LayoutListControls:Dock(FILL)
    self.LayoutListControls:DockMargin(7, 5, 0, 0)
    self.LayoutListControls:SetPos(0, 0)
    self.LayoutListControls:SetSpaceY(5)
    self.LayoutListControls:SetSpaceX(5)

    for k, v in pairs(Vliss.Controls) do
        if v.enabled then
            self.ButtonControlsList = self.LayoutListControls:Add("Button")
            self.ButtonControlsList:SetSize(90, 90)
            self.ButtonControlsList:SetText("")
            self.ButtonControlsList.Paint = function(self, w, h)
                local color = v.color
                if self:IsHovered() or self:IsDown() then
                    color = v.colorHover
                end
                draw.RoundedBox(4, 0, 0, w, h, color)
            end
            self.ButtonControlsList.DoClick = v.func

            self.ButtonControlsTrigger = vgui.Create("DLabel", self.ButtonControlsList)
            self.ButtonControlsTrigger:SetText(v.control)
            self.ButtonControlsTrigger:SetPos(8, 0)
            self.ButtonControlsTrigger:SetFont("VlissFontControlKey")
            self.ButtonControlsTrigger:SizeToContents()

            self.ButtonControlsDesc = vgui.Create("DLabel", self.ButtonControlsList)
            self.ButtonControlsDesc:SetText(v.description)
            self.ButtonControlsDesc:SetPos(8, 45)
            self.ButtonControlsDesc:SetFont("VlissFontControlDesc")
            self.ButtonControlsDesc:SizeToContents()
        end
    end

end

vgui.Register( 'vliss_panel_tab_controls', PANEL, 'EditablePanel' )