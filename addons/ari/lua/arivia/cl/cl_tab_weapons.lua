-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------

local PANEL = {}

function PANEL:Init()

    local Property = self

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

    local function GenerateCategory(name)
        for k, v in pairs(Property.Categories) do
            if v.Title == name then return v end
        end

        local AriviaCategory = vgui.Create("AriviaCategory", Property.Scroll)
        AriviaCategory:Dock(TOP)
        AriviaCategory:DockMargin(0, 5, 0, 0)
        AriviaCategory:HeaderTitle(name)
        table.insert(Property.Categories, AriviaCategory)

        AriviaCategory.List = vgui.Create("DIconLayout", AriviaCategory)
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
        for k, v in ipairs(CustomShipments) do

            if not (v.separate or v.noship) then continue end
            if not AriviaAllowGunPurchase(v) then continue end

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

                local itemUnavailable = false
                
                local color = Arivia.TabWeapons.buttonColor
                local txtColor = textNormal
                if ListItem:IsHovered() or ListItem:IsDown() then 
                    color = Arivia.TabWeapons.buttonHoverColor
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

                -----------------------------------------------------------------
                -- SUPPORT FOR LEVELING SYSTEM
                -----------------------------------------------------------------

                if Arivia.LevelSystemEnabled then
                    local itemLevel = v.level or v.lvl
                    if itemLevel == nil or !itemLevel then 
                        levelText = Arivia.Language.NoLevel
                    elseif itemLevel != nil then 
                        levelText = Arivia.Language.Level .. " " .. itemLevel
                    end
                end

                -----------------------------------------------------------------
                -- SUPPORT FOR PRESTIGE SCRIPT
                -- https://scriptfodder.com/scripts/view/390
                -----------------------------------------------------------------

                if LevelSystemConfiguration then
                    local itemPrestige = v.prestige
                    if itemPrestige == nil or !itemPrestige then 
                        prestigeText = Arivia.Language.NoPrestige
                    elseif itemPrestige != nil then 
                        prestigeText = Arivia.Language.Prestige .. " " .. itemPrestige
                    end
                end

                local itemCount = v.max
                if itemCount == 0 then itemCount = Arivia.Language.JobMaxUnlimited end

                local originNameX = 20
                if Arivia.LevelSystemEnabled or ( LevelSystemConfiguration and v.prestige ) then
                    originNameX = 11
                end

                draw.RoundedBox( 0, 0, 0, w, h, color )
                surface.SetDrawColor( 255, 255, 255, 20 )

                draw.NoTexture()
                draw.Circle( w - 30, 30, 22, 22 )

                draw.DrawText( objectName, "AriviaFontObjectListName", 65, originNameX, Color( 255, 240, 244 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

                if Arivia.LevelSystemEnabled and LevelSystemConfiguration then
                    draw.DrawText( levelText, "AriviaFontObjectLevel", 65, 28, Color( 255, 240, 244, 100 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
                    draw.DrawText( prestigeText, "AriviaFontObjectLevel", 145, 28, Color( 255, 240, 244, 100 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
                elseif Arivia.LevelSystemEnabled and !LevelSystemConfiguration then
                    draw.DrawText( levelText, "AriviaFontObjectLevel", 65, 28, Color( 255, 240, 244, 100 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
                elseif !Arivia.LevelSystemEnabled and LevelSystemConfiguration then
                    draw.DrawText( prestigeText, "AriviaFontObjectLevel", 65, 28, Color( 255, 240, 244, 100 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
                end

                draw.DrawText( GAMEMODE.Config.currency .. ( v.pricesep or v.price ), "AriviaFontObjectPrice", w - 31, 19, Color( 255, 255, 255, 120 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                -----------------------------------------------------------------
                -- itemUnavailable - CHECK PLAYER LEVEL
                -----------------------------------------------------------------
                if Arivia.LevelSystemEnabled then
                    local itemLevel = v.level or v.lvl
                    local PlayerLevel = LocalPlayer():getDarkRPVar('level') or 0
                    if itemLevel != nil and itemLevel then 
                        if itemLevel >  PlayerLevel then
                            itemUnavailable = true
                        end
                    end
                end

                -----------------------------------------------------------------
                -- itemUnavailable - CHECK PLAYER PRESTIGE
                -----------------------------------------------------------------
                if LevelSystemConfiguration and v.prestige then
                    local itemPrestige = v.prestige
                    local PlayerPrestigeAmount = LocalPlayer():getDarkRPVar('prestige') or 0
                    if itemPrestige != nil then
                        if itemPrestige >  PlayerPrestigeAmount then
                            itemUnavailable = true
                        end
                    end
                end

                -----------------------------------------------------------------
                -- itemUnavailable - CHECK PLAYER CAN AFFORD
                -----------------------------------------------------------------
                if ( v.pricesep > LocalPlayer():getDarkRPVar("money") ) or ( v.price > LocalPlayer():getDarkRPVar("money") ) then
                    itemUnavailable = true
                end

                -----------------------------------------------------------------
                -- itemUnavailable - DARKEN BOX IF TRUE
                -----------------------------------------------------------------
                if Arivia.TabWeapons.unavailableDarken and itemUnavailable then
                    draw.RoundedBox( 0, 0, 0, w, h, Arivia.TabWeapons.unavailableColor )
                end

            end

            local PlayerModel = vgui.Create("DModelPanel", ListItem)
            PlayerModel.LayoutEntity = function() return end

            if istable(v.model) then
                PlayerModel:SetModel(v.model[1])
            else
                PlayerModel:SetModel(v.model)
            end

            local mn, mx = PlayerModel.Entity:GetRenderBounds()
            local size = 0
            size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
            size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
            size = math.max(size, math.abs(mn.z) + math.abs(mx.z))
            PlayerModel:SetFOV(38)
            PlayerModel:SetCamPos(Vector(size, size, size))
            PlayerModel:SetLookAt((mn + mx) * 0.5)

            PlayerModel:SetPos( 0, 0 )
            PlayerModel:SetSize( 60, 60 )

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
    Property.PanelPreview.Title.Paint = function( self, w, h )
        draw.SimpleText(Property.Value.name, "AriviaFontCategoryName", w / 2, 20, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    Property.PanelPreview.ModelObject = vgui.Create("DModelPanel", Property.PanelPreview)
    Property.PanelPreview.ModelObject:SetSize( Property.PanelPreview:GetWide() / 2, self:GetTall() + 160 )
    Property.PanelPreview.ModelObject:Dock(TOP)
    Property.PanelPreview.ModelObject:DockMargin(3, 0, 3, 0)
    Property.PanelPreview.ModelObject:SetCamPos(Vector(110, -10, 70))
    Property.PanelPreview.ModelObject:SetLookAt(Vector(0, 0, 5))
    Property.PanelPreview.ModelObject:SetFOV(10)
    Property.PanelPreview.ModelObject:SetAmbientLight( Color( 255, 255, 255, 255 ) )
    Property.PanelPreview.ModelObject:SetModel(Property.Value.model)

    local mn, mx = Property.PanelPreview.ModelObject.Entity:GetRenderBounds()
    local size = 0
    size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
    size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
    size = math.max(size, math.abs(mn.z) + math.abs(mx.z))
    Property.PanelPreview.ModelObject:SetFOV(100)
    Property.PanelPreview.ModelObject:SetCamPos(Vector(size, size, size))
    Property.PanelPreview.ModelObject:SetLookAt((mn + mx) * 0.5)

    Property.PanelPreview.ModelObject.LayoutEntity = function() end

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
            local text = "Entity '" .. Property.Value.entity .. "' does not yet have a description!\n\nPlease set one inside the DarkRP /config/addentities.lua file for description, or alternatively use Arivia.CustomEntityDescriptions in /arivia/sh/sh_config.php for ease of use!\n\n\n"
            Property.PanelPreview.Description:SetText( Arivia.CustomEntityDescriptions[Property.Value.entity] and Arivia.CustomEntityDescriptions[Property.Value.entity] .. "\n\n\n" or text )
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
        if AriviaAllowGunPurchase(Property.Value) then
            Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.MakePurchase .. ": " .. GAMEMODE.Config.currency .. ( Property.Value.pricesep or Property.Value.price ) )
            Property.PanelPreview.ButtonAction.DoClick = function() 
                RunConsoleCommand("darkrp", "buy", Property.Value.name)
            end
        else
            Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.CannotPurchase )
            Property.PanelPreview.ButtonAction.DoClick = function() end
        end
    end
    
    Property.PanelPreview.ButtonAction.Paint = function(self, w, h)

        local buttonColor
        local WeaponStatus = Property.PanelPreview.ButtonAction.Text or ""

        if AriviaAllowGunPurchase(Property.Value) then
            buttonColor = Color( 72, 112, 58, 255 )
        else
            buttonColor = Color( 124, 51, 50, 190 )
        end

        -----------------------------------------------------------------
        -- CHECK PLAYER LEVEL
        -----------------------------------------------------------------
        if Arivia.LevelSystemEnabled then
            local itemLevel = Property.Value.level
            local PlayerLevel = LocalPlayer():getDarkRPVar('level') or 0
            if itemLevel != nil and itemLevel then 
                if itemLevel >  PlayerLevel then
                    buttonColor = Arivia.TabWeapons.unavailableColor
                    WeaponStatus = string.upper(Arivia.Language.InsufficientLevel)
                end
            end
        end

        -----------------------------------------------------------------
        -- CHECK PLAYER PRESTIGE
        -----------------------------------------------------------------
        if LevelSystemConfiguration and Property.Value.prestige then
            local PlayerPrestigeAmount = LocalPlayer():getDarkRPVar('prestige') or 0
            if Property.Value.prestige != nil then
                if Property.Value.prestige >  PlayerPrestigeAmount then
                    buttonColor = Arivia.TabWeapons.unavailableColor
                    WeaponStatus = string.upper(Arivia.Language.NotEnoughPrestige)
                end
            end
        end

        draw.RoundedBox( 0, 0, 0, w, h, buttonColor )
        draw.SimpleText( WeaponStatus, "AriviaFontCloseGUI", w / 2, h / 2, Color(230, 230, 230, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

    end

end

vgui.Register("AriviaTabWeapons", PANEL, "DPanel")