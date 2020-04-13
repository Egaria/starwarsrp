-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------

local PANEL = {}

function PANEL:Init()

    local Property = self

    if GAMEMODE.AmmoTypes[1] == nil then 
        Property:Remove() return 
    end

    Property.Value = GAMEMODE.AmmoTypes[1]
    Property.Value.Key = 1

    Property:Dock(FILL)
    Property.Paint = function() end
    
    Property.Scroll = vgui.Create("DScrollPanel", Property)
    Property.Scroll:GetVBar():Remove()

    Property.Scroll.VBar = vgui.Create("AriviaDVScrollBar", Property)
    Property.Scroll.VBar.Content = Property.Scroll
    Property.Scroll.VBar:Dock(LEFT)
    Property.Scroll.VBar:DockMargin(0, 7, 0, 5)

    Property.Scroll.PerformLayout = function(self)

        local Wide = self:GetWide()
        local YPos = 0

        self:Rebuild()

        self.VBar:SetUp( self:GetTall(), self.pnlCanvas:GetTall() )
        YPos = self.VBar:GetOffset()
            
        self.pnlCanvas:SetPos( 0, YPos )
        self.pnlCanvas:SetWide( Wide )

        self:Rebuild()
    end

    Property.Scroll:Dock(LEFT)
    Property.Scroll:DockMargin(5, 5, 4, 0)
    Property.Scroll:SetWide((Property:GetParent():GetWide() - Property:GetParent():GetWide() / 3) + 9)
    Property.Scroll:GetVBar():ConstructScrollbarGUI()

    Property.Categories = {}

    local function GenerateCategory( name )
        for k, v in pairs(Property.Categories) do
            if v.Title == name then return v end
        end

        local AriviaCategory = vgui.Create( "AriviaCategory", Property.Scroll )
        AriviaCategory:Dock(TOP)
        AriviaCategory:DockMargin(0, 5, 0, 0)
        AriviaCategory:HeaderTitle(name)

        table.insert(Property.Categories, AriviaCategory)

        AriviaCategory.List = vgui.Create( "DIconLayout", AriviaCategory )
        AriviaCategory.List:SetLayoutDir(TOP)
        AriviaCategory.List:Dock(LEFT)
        AriviaCategory.List:DockMargin( 6, 5, 0, 0 )
        AriviaCategory.List:SetSize(Property:GetParent():GetWide() - Property:GetParent():GetWide() / 3 + 9, 65)
        AriviaCategory.List.Paint = function(panel, w, h) end
        AriviaCategory.List:SetSpaceY(5)
        AriviaCategory.List:SetSpaceX(5)

        return AriviaCategory
    end

    for i = 0, 0 do
        for k, v in ipairs(GAMEMODE.AmmoTypes) do

            if !Property.Value then
                Property.Value = v
            end

            if v.category then
                AriviaCategory = GenerateCategory( v.category )
            else
                AriviaCategory = GenerateCategory( Arivia.Language.CategoryOther )
            end

            local ListItem = vgui.Create("DButton")
            ListItem:SetSize((Property:GetParent():GetWide() / 3) - 4, 60)
            ListItem:SetText("")
            ListItem.oldpaint = ListItem.Paint

            ListItem.DoClick = function()
                Property.Value = v
                Property.Value.Key = 1
                if istable(Property.Value.model) then
                    Property.PanelPreview.ModelObject:SetModel(Property.Value.model[Property.Value.Key])
                else
                    Property.PanelPreview.ModelObject:SetModel(Property.Value.model)
                end
                Property.PanelPreview.ModelObject:InvalidateLayout()
                Property.PanelPreview.ButtonAction:InvalidateLayout()
            end

            function ListItem:Paint( w, h )
                
                local color = Arivia.TabAmmo.buttonColor
                local txtColor = textNormal
                if ListItem:IsHovered() or ListItem:IsDown() then 
                    color = Arivia.TabAmmo.buttonHoverColor
                    txtColor = textHover
                end

                local objectName = v.name

                if Arivia.TruncateEnabled then
                    local maxW = Arivia.TruncateLength or 170
                    surface.SetFont("AriviaFontObjectListName")
                    local fw,fh = surface.GetTextSize(objectName)
                    if fw > maxW then
                        objectName = string.sub(objectName, 1, objectName:len()-3).."..."
                    end
                end

                local itemCount = v.max
                if itemCount == 0 then 
                    itemCount = Arivia.Language.JobMaxUnlimited
                end

                draw.RoundedBox( 0, 0, 0, w, h, color )
                surface.SetDrawColor( 255, 255, 255, 20 )

                draw.NoTexture()
                draw.Circle( w - 30, 30, 22, 22 )
                draw.DrawText( objectName, "AriviaFontObjectListName", 65, 20, Color(255, 240, 244), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.DrawText( GAMEMODE.Config.currency .. v.price, "AriviaFontObjectPrice", w - 31, 19, Color(255, 255, 255, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local PlayerModel = vgui.Create("DModelPanel", ListItem)
            PlayerModel.LayoutEntity = function() return end

            if istable(v.model) then
                PlayerModel:SetModel(v.model[1])
            else
                PlayerModel:SetModel(v.model)
            end

            PlayerModel:SetPos( 0, 0 )
            PlayerModel:SetSize( 60, 60 )
            PlayerModel:SetFOV( 13 )
            PlayerModel:SetCamPos( Vector( 100, 90, 65 ) )
            PlayerModel:SetLookAt( Vector (12, 9, 11 ) )

            AriviaCategory.List:Add(ListItem)
            AriviaCategory:AddNewChild(ListItem)
        end
    end

    for k, v in pairs(Property.Categories) do
        v:SetupChildren()
    end

    Property.PanelPreview = vgui.Create("DPanel", self)
    Property.PanelPreview:SetSize(Property:GetParent():GetWide() * 0.33 - 25, Property.Scroll:GetTall())
    Property.PanelPreview:Dock(RIGHT)
    Property.PanelPreview:DockMargin(2, 7, 0, 0)
    Property.PanelPreview.Paint = function(self, w, h)
        draw.RoundedBox(0, 2.5, 2.5, w - 6.5, h, Color(5, 5, 5, 200))
    end

    Property.PanelPreview.Title = vgui.Create("DLabel", Property.PanelPreview)
    Property.PanelPreview.Title:Dock(TOP)
    Property.PanelPreview.Title:SetText("")
    Property.PanelPreview.Title:DockMargin(0, 0, 0, 0)
    Property.PanelPreview.Title:SetContentAlignment(7)
    Property.PanelPreview.Title:SetSize(Property.PanelPreview:GetWide() - 20, 40)
    Property.PanelPreview.Title.Paint = function(slf, w, h)
        draw.SimpleText(Property.Value.name, "AriviaFontCategoryName", w / 2, 20, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    Property.PanelPreview.ModelObject = vgui.Create( "DModelPanel", Property.PanelPreview )
    Property.PanelPreview.ModelObject:SetSize( Property.PanelPreview:GetWide() / 2, self:GetTall() + 160 )
    Property.PanelPreview.ModelObject:Dock(TOP)
    Property.PanelPreview.ModelObject:SetCamPos(Vector(110, -10, 70))
    Property.PanelPreview.ModelObject:SetLookAt(Vector(0, 0, 5))
    Property.PanelPreview.ModelObject:SetFOV(25)
    Property.PanelPreview.ModelObject:SetAmbientLight( Color( 255, 255, 255, 255 ) )
    Property.PanelPreview.ModelObject:SetModel(GAMEMODE.AmmoTypes[1].model)

    Property.PanelPreview.Scroll = vgui.Create( "DScrollPanel", Property.PanelPreview )
    Property.PanelPreview.Scroll:SetSize( Property.PanelPreview:GetWide() - 10, 230)
    Property.PanelPreview.Scroll.VBar:ConstructScrollbarGUI()
    Property.PanelPreview.Scroll:Dock(FILL)
    Property.PanelPreview.Scroll:DockPadding(5, 5, 5, 5)
    Property.PanelPreview.Scroll:DockMargin(5, 0, 0, 0)
    Property.PanelPreview.Scroll.Paint = function(self, w, h) end

    if Arivia.CustomEntityDescriptionsEnabled then

        Property.PanelPreview.Description = vgui.Create( "DLabel", Property.PanelPreview.Scroll )
        Property.PanelPreview.Description:Dock(FILL)
        Property.PanelPreview.Description:DockMargin(20, 20, 20, 10)
        Property.PanelPreview.Description:SetFont("AriviaFontItemInformation")
        Property.PanelPreview.Description:SetAutoStretchVertical(true)
        Property.PanelPreview.Description:SetWrap(true)
        Property.PanelPreview.Description:SetSize(40, 200)
        Property.PanelPreview.Description.PerformLayout = function()

            local ammoEntity = "ammo_" .. Property.Value.ammoType
            local text = "Entity '" .. ammoEntity .. "' does not yet have a description!\n\nPlease set one inside the DarkRP /config/addentities.lua file for description, or alternatively use Arivia.CustomEntityDescriptions in /arivia/sh/sh_config.php for ease of use!\n\n\n"
            Property.PanelPreview.Description:SetText( Arivia.CustomEntityDescriptions[ammoEntity] and Arivia.CustomEntityDescriptions[ammoEntity] .. "\n\n\n" or text )

        end

    end

    Property.PanelPreview.ButtonAction = vgui.Create("DButton", Property.PanelPreview)
    Property.PanelPreview.ButtonAction:Dock(BOTTOM)
    Property.PanelPreview.ButtonAction:DockMargin(10, 5, 10, 5)
    Property.PanelPreview.ButtonAction:SetText("")
    Property.PanelPreview.ButtonAction.Text = ""
    Property.PanelPreview.ButtonAction:SetSize(Property.PanelPreview:GetWide(), 40)
    Property.PanelPreview.ButtonAction:SetVisible(true)
    Property.PanelPreview.ButtonAction.PerformLayout = function()
        if AriviaAllowAmmoPurchase(Property.Value) then
            if (LocalPlayer().DarkRPVars.money or 0) < Property.Value.price then 
                Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.CannotAfford .. ": " .. GAMEMODE.Config.currency .. Property.Value.price )
                Property.PanelPreview.ButtonAction.DoClick = function() end
            else
                Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.MakePurchase .. ": " .. GAMEMODE.Config.currency .. Property.Value.price )
                Property.PanelPreview.ButtonAction.DoClick = function() 
                    RunConsoleCommand("darkrp", "buyammo", Property.Value.ammoType)
                end
            end
        else
            Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.CannotPurchase )
            Property.PanelPreview.ButtonAction.DoClick = function() end
        end
    end
    
    Property.PanelPreview.ButtonAction.Paint = function(self, w, h)

        local buttonColor
        if AriviaAllowAmmoPurchase(Property.Value) then
            buttonColor = Color( 72, 112, 58, 255 )
        else
            buttonColor = Color( 124, 51, 50, 190 )
        end

        draw.RoundedBox( 0, 0, 0, w, h, buttonColor )
        draw.SimpleText(Property.PanelPreview.ButtonAction.Text, "AriviaFontCloseGUI", w/2, h/2, Color(230, 230, 230, 255), 1, 1)

    end

end

vgui.Register("AriviaTabAmmo", PANEL, "DPanel")