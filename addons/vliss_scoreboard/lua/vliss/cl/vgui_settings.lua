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
-- [ DARKRP: SERVER SETTINGS ]
-----------------------------------------------------------------
-- As of v1.2: This is for DarkRP as the original scoreboard had.
-- It allows the admin to manage certain aspects of the server
-- in regards to toggling Player VS Player, global godmode etc.
-- Later, it will include features for sandbox and other 
-- gamemodes as well.
-----------------------------------------------------------------

function PANEL:Init()

    local VlissBtnClose = "vliss/vliss_btn_close.png"

    self.w, self.h = 550, 450
    self:SetSize(self.w, self.h)
    self:Center()
    self:MakePopup()
	self:SetMouseInputEnabled(true)
	self:SetKeyboardInputEnabled(false)
    self.Paint = function(self, w, h) 
        DrawBlurPanel(self, 3)
        draw.RoundedBox(5, 0, 0, w, h, Color( 0, 0, 0, 230 ))
    end

    self.PanelInnerTop = vgui.Create("DPanel", self)
    self.PanelInnerTop:Dock(TOP)
    self.PanelInnerTop:DockMargin(5, 5, 5, 0)
    self.PanelInnerTop:SetTall(45)
    self.PanelInnerTop.Paint = function(self, w, h)
        draw.SimpleText("Settings", "VlissFontNetworkName", 8, 25, Vliss.Core.NetworkNameColor or Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    self.LabelConfirmMessage = vgui.Create("DLabel", self)
    self.LabelConfirmMessage:Dock(TOP)
    self.LabelConfirmMessage:SetTall(45)
    self.LabelConfirmMessage:DockMargin(15, 0, 5, 5)
    self.LabelConfirmMessage:SetFont("VlissFontConfirmText")
    self.LabelConfirmMessage:SetTextColor(Vliss.Core.StaffCardNameColor or Color(255, 255, 255, 255))
    self.LabelConfirmMessage:SetWrap( true )
    self.LabelConfirmMessage:SetText("This area is still being developed - admins will be able to adjust settings here.")

    self.ButtonDoClose = vgui.Create("DButton", self)
    self.ButtonDoClose:SetColor(Color(255, 255, 255, 255))
    self.ButtonDoClose:SetFont("VlissFontCloseGUI")
    self.ButtonDoClose:SetText("")
    self.ButtonDoClose.Paint = function()
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.SetMaterial(Material(VlissBtnClose, "noclamp smooth"))
        surface.DrawTexturedRect(0, 10, 16, 16)
    end
    self.ButtonDoClose:SetSize(32, 32)
    self.ButtonDoClose:SetPos(self:GetWide() - 30, 0)
    self.ButtonDoClose.DoClick = function()
        if IsValid(self) then
            self:Remove()
        end
    end

end

vgui.Register("vliss_settings", PANEL, "EditablePanel")