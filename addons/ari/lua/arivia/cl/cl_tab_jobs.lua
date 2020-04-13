-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------

local PANEL = {}

function PANEL:Init()

    local Property = self

    if !RPExtraTeams[1] or RPExtraTeams[1] == nil then
        Property:Hide()
        return
    end

    Property:SetVisible(false)
    Property.Value = RPExtraTeams[1]

    if Property.Value.name == team.GetName(Arivia.Panel.CurJob) then
        Property.Value = RPExtraTeams[2]
    end

    Property.Value.Key = 1

    Property:Dock(FILL)
    Property.Paint = function() end
    
    Property.Scroll = vgui.Create("DScrollPanel", Property)
    Property.Scroll:GetVBar():Remove()

    Property.Scroll.VBar = vgui.Create("AriviaDVScrollBar", Property)
    Property.Scroll.VBar.Content = Property.Scroll
    Property.Scroll.VBar:Dock(LEFT)
    Property.Scroll.VBar:DockMargin( 0, 7, 0, 5 )

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

    Property.Scroll:Dock( LEFT )
    Property.Scroll:DockMargin( 5, 5, 4, 0 )
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
        for k, v in ipairs(RPExtraTeams) do

            if v.name == team.GetName(Arivia.Panel.CurJob) then continue end
            if !Arivia.TabJobs.showUnavailableJobs and !AriviaAllowJobSelection(v) then continue end

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

                Property.PanelPreview.Skins = istable(Property.Value.model) and table.Count(Property.Value.model) or 0
            end

            function ListItem:Paint( w, h )

                local jobUnavailable = false

                local color = Arivia.TabJobs.buttonColor
                local txtColor = textNormal

                if ListItem:IsHovered() or ListItem:IsDown() then
                    color = Arivia.TabJobs.buttonHoverColor
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

                draw.RoundedBox( 0, 0, 0, w, h, color )
                surface.SetDrawColor( 255, 255, 255, 20 )

                draw.NoTexture()
                draw.Circle( w - 30, 30, 22, 22 )

                local originNameX = 20
                if Arivia.LevelSystemEnabled then
                    originNameX = 11
                end

                draw.DrawText( objectName, "AriviaFontObjectListName", 65, originNameX, Color( 255, 240, 244 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                if Arivia.LevelSystemEnabled then
                    draw.DrawText( levelText, "AriviaFontObjectLevel", 65, 28, Color(255, 240, 244, 100), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end

                draw.DrawText( GAMEMODE.Config.currency .. v.salary, "AriviaFontObjectPrice", w - 31, 19, Color( 255, 255, 255, 120 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                -----------------------------------------------------------------
                -- itemUnavailable - CHECK PLAYER LEVEL
                -----------------------------------------------------------------
                if Arivia.LevelSystemEnabled then
                    local itemLevel = v.level or v.lvl
                    local PlayerLevel = LocalPlayer():getDarkRPVar('level') or 0
                    if itemLevel != nil and itemLevel then 
                        if itemLevel >  PlayerLevel then
                            jobUnavailable = true
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
                            jobUnavailable = true
                        end
                    end
                end

                -----------------------------------------------------------------
                -- itemUnavailable - DARKEN BOX IF TRUE
                -----------------------------------------------------------------
                if Arivia.TabJobs.unavailableDarken and jobUnavailable then
                    draw.RoundedBox( 0, 0, 0, w, h, Arivia.TabJobs.unavailableColor or Color( 20, 20, 20, 200 ) )
                end

            end

            local PlayerModel = vgui.Create("DModelPanel", ListItem)
            PlayerModel.LayoutEntity = function() return end

            if istable(v.model) then
                PlayerModel:SetModel(v.model[1])
            else
                PlayerModel:SetModel(v.model)
            end

            PlayerModel:SetPos(0, 0)
            PlayerModel:SetSize(60, 60)
            PlayerModel:SetFOV(37)
            PlayerModel:SetCamPos(Vector(25, 0, 65))
            PlayerModel:SetLookAt(Vector(10, 0, 65))

            AriviaCategory.List:Add(ListItem)
            AriviaCategory:AddNewChild(ListItem)

            PlayerModel.Paint = function (self, w, h)

                local jobPlayerMax = v.max
                if jobPlayerMax == 0 then 
                    jobPlayerMax = Arivia.Language.JobMaxUnlimited 
                end

                if ( !IsValid( self.Entity ) ) then return end

                local x, y = self:LocalToScreen( 0, 0 )

                self:LayoutEntity( self.Entity )

                local ang = self.aLookAngle
                if ( !ang ) then
                    ang = (self.vLookatPos-self.vCamPos):Angle()
                end

                cam.Start3D( self.vCamPos, ang, self.fFOV, x, y, w, h, 5, self.FarZ )

                render.SuppressEngineLighting( true )
                render.SetLightingOrigin( self.Entity:GetPos() )
                render.ResetModelLighting( self.colAmbientLight.r/255, self.colAmbientLight.g/255, self.colAmbientLight.b/255 )
                render.SetColorModulation( self.colColor.r/255, self.colColor.g/255, self.colColor.b/255 )
                render.SetBlend( self.colColor.a/255 )

                for i = 0, 6 do
                    local col = self.DirectionalLight[ i ]
                    if ( col ) then
                        render.SetModelLighting( i, col.r / 255, col.g / 255, col.b / 255 )
                    end
                end

                self:DrawModel()

                render.SuppressEngineLighting( false )
                cam.End3D()

                self.LastPaint = RealTime()

                draw.RoundedBox( 4, 1, h - 10, 60, 13, Color( 5, 5, 5, 240 ) )
                draw.SimpleText( table.Count(team.GetPlayers(v.team)) .. "/" .. jobPlayerMax, "AriviaFontObjectMinMax", w / 2, h - 5, Color(230, 230, 230, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end


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
    Property.PanelPreview.Skins = 0

    Property.PanelPreview.Title = vgui.Create("DLabel", Property.PanelPreview)
    Property.PanelPreview.Title:Dock(TOP)
    Property.PanelPreview.Title:SetText("")
    Property.PanelPreview.Title:DockMargin(0, 0, 0, 0)
    Property.PanelPreview.Title:SetContentAlignment(7)
    Property.PanelPreview.Title:SetSize(Property.PanelPreview:GetWide() - 20, 40)
    Property.PanelPreview.Title.Paint = function(self, w, h)
        draw.SimpleText(Property.Value.name, "AriviaFontCategoryName", w / 2, 20, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    Property.PanelPreview.ModelObject = vgui.Create("DModelPanel", Property.PanelPreview)
    Property.PanelPreview.ModelObject:SetSize( Property.PanelPreview:GetWide() / 2, Property:GetTall() + 90 )
    Property.PanelPreview.ModelObject:Dock(TOP)
    Property.PanelPreview.ModelObject:SetCamPos(Vector(25, 0, 65))
    Property.PanelPreview.ModelObject:SetLookAt(Vector(10, 0, 65))
    Property.PanelPreview.ModelObject:SetFOV(90)
    Property.PanelPreview.ModelObject:SetAmbientLight( Color( 255, 255, 255, 255 ) )
    if Property.Value.model and istable( Property.Value.model ) then
        Property.PanelPreview.ModelObject:SetModel( Property.Value.model[1] )
    else
        Property.PanelPreview.ModelObject:SetModel( Property.Value.model )
    end

    local oldPaint = Property.PanelPreview.ModelObject.Paint
    Property.PanelPreview.ModelObject.Paint = function(self, w, h)
        oldPaint(self, w, h)

        if Property.PanelPreview.Skins < 1 then return end

        draw.RoundedBox( 4, w / 2 - 25, -1, 50, 20, Color( 5, 5, 5, 240 ) )

        draw.SimpleText( Property.Value.Key .. "/" .. Property.PanelPreview.Skins, "AriviaFontCloseGUI", w / 2, 10, Color(230, 230, 230, 255), 1, 1)

    end

    Property.PanelPreview.ModelObject.PerformLayout = function()
        Property.PanelPreview.SkinNext:SetVisible(false)
        Property.PanelPreview.SkinPrev:SetVisible(false)
        if istable(Property.Value.model) then
            if #Property.Value.model != 1 then
                Property.PanelPreview.SkinNext:SetVisible(true)
                Property.PanelPreview.SkinPrev:SetVisible(true)
            end
        end

        Property.PanelPreview.Skins = istable(Property.Value.model) and table.Count(Property.Value.model) or 0
    end
    Property.PanelPreview.ModelObject.LayoutEntity = function( ent ) return end

    Property.PanelPreview.SkinPrev = vgui.Create("DButton", Property.PanelPreview)
    Property.PanelPreview.SkinPrev:SetSize(20, 20)
    Property.PanelPreview.SkinPrev:SetPos(10, 10)
    Property.PanelPreview.SkinPrev:SetText("")
    Property.PanelPreview.SkinPrev:SetVisible(false)
    Property.PanelPreview.SkinPrev:SetFont( "AriviaFontItemInformation" )
    Property.PanelPreview.SkinPrev.Paint = function( self, w, h )
        if Property.Value.Key <= 1 then return end

        draw.RoundedBox( 4, 0, 0, w, h, Color( 20, 20, 20 ) )
        draw.RoundedBox( 4, 1, 1, w - 2, h - 2, Color( 20, 20, 20 ) )
        draw.RoundedBox( 4, 2, 2, w - 4, h - 4, Color( 20, 20, 20 ) )
        draw.RoundedBox( 4, 3, 3, w - 6, h - 6, Color( 5, 5, 5 ) )

        draw.SimpleText( Arivia.Language.SkinPrevious, "AriviaFontCloseGUI", w / 2, h / 2, Color(230, 230, 230, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    Property.PanelPreview.SkinPrev.DoClick = function()

        Property.Value.Key = Property.Value.Key - 1
        if Property.Value.Key < 1 then Property.Value.Key = 1 end

        Property.PanelPreview.ModelObject:SetModel(Property.Value.model[Property.Value.Key])
        Property.PanelPreview.ModelObject:InvalidateLayout()

        if Property.Value.Key == 1 then
            Property.PanelPreview.SkinPrev:SetVisible(false)
        end

    end

    Property.PanelPreview.SkinNext = vgui.Create("DButton", Property.PanelPreview)
    Property.PanelPreview.SkinNext:SetSize(20, 20)
    Property.PanelPreview.SkinNext:SetPos(Property.PanelPreview:GetWide() - 30, 10)
    Property.PanelPreview.SkinNext:SetText("")
    Property.PanelPreview.SkinNext:SetVisible(false)
    Property.PanelPreview.SkinNext:SetFont( "AriviaFontItemInformation" )
    Property.PanelPreview.SkinNext.Paint = function( self, w, h )
        if Property.Value.Key == Property.PanelPreview.Skins then return end

        draw.RoundedBox( 4, 0, 0, w, h, Color( 20, 20, 20 ) )
        draw.RoundedBox( 4, 1, 1, w - 2, h - 2, Color( 20, 20, 20 ) )
        draw.RoundedBox( 4, 2, 2, w - 4, h - 4, Color( 20, 20, 20 ) )
        draw.RoundedBox( 4, 3, 3, w - 6, h - 6, Color( 5, 5, 5 ) )

        draw.SimpleText( Arivia.Language.SkinNext, "AriviaFontCloseGUI", w / 2, h / 2, Color(230, 230, 230, 255), 1, 1)
    end
    Property.PanelPreview.SkinNext.DoClick = function()
        if Property.Value.Key == #Property.Value.model then return end

        Property.PanelPreview.Skins = istable(Property.Value.model) and table.Count( Property.Value.model ) or 0

        Property.Value.Key = Property.Value.Key + 1
        Property.PanelPreview.ModelObject:SetModel(Property.Value.model[Property.Value.Key])
        Property.PanelPreview.ModelObject:InvalidateLayout()
        Property.PanelPreview.SkinNext:SetVisible(true)

        if Property.Value.Key > 1 then
            Property.PanelPreview.SkinPrev:SetVisible(true)
        end

    end

    Property.PanelPreview.Scroll = vgui.Create( "DScrollPanel", Property.PanelPreview )
    Property.PanelPreview.Scroll:SetSize( Property.PanelPreview:GetWide() - 10, 230)
    Property.PanelPreview.Scroll.VBar:ConstructScrollbarGUI()
    Property.PanelPreview.Scroll:Dock(FILL)
    Property.PanelPreview.Scroll:DockPadding(5, 5, 5, 5)
    Property.PanelPreview.Scroll:DockMargin(5, 0, 0, 0)
    Property.PanelPreview.Scroll.Paint = function(self, w, h) end

    Property.PanelPreview.Description = vgui.Create( "DLabel", Property.PanelPreview.Scroll )
    Property.PanelPreview.Description:Dock(FILL)
    Property.PanelPreview.Description:DockMargin(20, 20, 20, 10)
    Property.PanelPreview.Description:SetFont( "AriviaFontItemInformation" )
    Property.PanelPreview.Description:SetAutoStretchVertical(true)
    Property.PanelPreview.Description:SetWrap(true)
    Property.PanelPreview.Description:SetSize(40, 200)
    Property.PanelPreview.Description.PerformLayout = function()
        Property.PanelPreview.Description:SetText(Property.Value.description)
        if Property.Value.weapons != nil then
            Property.PanelPreview.Description:SetText(Property.PanelPreview.Description:GetText() .. "\n\n")
            for k, v in pairs(Property.Value.weapons) do
                Property.PanelPreview.Description:SetText(Property.PanelPreview.Description:GetText() .. "- " .. v .. "\n")
            end
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
        if Property.Value.vote then
            Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.JobCreateVote )
            Property.PanelPreview.ButtonAction.DoClick = function() 
                DarkRP.setPreferredJobModel(Property.Value.team, Property.PanelPreview.ModelObject:GetModel())
                RunConsoleCommand( "darkrp", "vote" .. Property.Value.command )
                DarkRP.closeF4Menu()
            end
        else
            Property.PanelPreview.ButtonAction.Text = string.upper( Arivia.Language.JobStartNewJob )
            Property.PanelPreview.ButtonAction.DoClick = function() 
                DarkRP.setPreferredJobModel( Property.Value.team, Property.PanelPreview.ModelObject:GetModel() )
                RunConsoleCommand( "darkrp", Property.Value.command )
                DarkRP.closeF4Menu()
            end
        end
        if !AriviaAllowJobSelection(Property.Value, true) then
            Property.PanelPreview.ButtonAction.DoClick = function() end
        end
    end

    Property.PanelPreview.ButtonAction.Paint = function( self, w, h )
        local buttonColor
        local jobStatus = Property.PanelPreview.ButtonAction.Text or ""
        if Property.Value.vote then
            buttonColor = Color( 163, 135, 79, 255 )
        else
            buttonColor = Color( 72, 112, 58, 255 )
        end

        -----------------------------------------------------------------
        -- CHECK UNAVAILABLE OR ADMINONLY
        -----------------------------------------------------------------

        if !AriviaAllowJobSelection(Property.Value) then
            buttonColor = Arivia.TabJobs.unavailableColor
            jobStatus = ( !( LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() ) and Property.Value.admin == 1 ) and Arivia.Language.JobUnavailable .. " - " .. Arivia.Language.JobAdminOnly or Arivia.Language.JobUnavailable
        end

        -----------------------------------------------------------------
        -- CHECK MAX SLOTS FOR JOB
        -----------------------------------------------------------------

        local jobMax = Property.Value.max or 1337
        if jobMax != 0 then
            if table.Count( team.GetPlayers(Property.Value.team) ) == jobMax then
                buttonColor = Arivia.TabJobs.unavailableColor
                jobStatus = Arivia.Language.JobFull
            end
        end

        -----------------------------------------------------------------
        -- CHECK PLAYER LEVEL
        -----------------------------------------------------------------
        if Arivia.LevelSystemEnabled then
            local itemLevel = Property.Value.level
            local PlayerLevel = LocalPlayer():getDarkRPVar('level') or 0
            if itemLevel != nil and itemLevel then 
                if itemLevel >  PlayerLevel then
                    buttonColor = Arivia.TabJobs.unavailableColor
                    jobStatus = string.upper(Arivia.Language.InsufficientLevel)
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
                    buttonColor = Arivia.TabJobs.unavailableColor
                    jobStatus = string.upper(Arivia.Language.NotEnoughPrestige)
                end
            end
        end

        draw.RoundedBox( 0, 0, 0, w, h, buttonColor )
        draw.SimpleText( jobStatus, "AriviaFontCloseGUI", w / 2, h / 2, Color(230, 230, 230, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end

end

vgui.Register("AriviaTabJobs", PANEL, "DPanel")