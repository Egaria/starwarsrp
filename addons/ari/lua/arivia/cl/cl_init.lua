-----------------------------------------------------------------
-- @package     Arivia
-- @author      Richard
-- @build       v1.4.1
-- @release     10.24.2015
-----------------------------------------------------------------

Arivia = Arivia or {}
Arivia.Language = Arivia.Language or {}

local PANEL = {}
local AriviaTickers = {}

-----------------------------------------------------------------
--  DisplayTicker
-----------------------------------------------------------------

function Arivia:DisplayTicker(str, color)
    AriviaTickers.color = color
    AriviaTickers.CurrentAd = str
end

-----------------------------------------------------------------
--  Network Receivers
-----------------------------------------------------------------

net.Receive("AriviaSendTickerData", function(len)
    local vcol = net.ReadVector()
    Arivia:DisplayTicker(net.ReadString(), Color(vcol.x, vcol.y, vcol.z))
end)

-----------------------------------------------------------------
-- [ MATERIALS ]
-----------------------------------------------------------------

local AriviaBtnClose = "arivia/arivia_btn_close.png"

-----------------------------------------------------------------
-- [ FONTS ]
-----------------------------------------------------------------
surface.CreateFont("AriviaFontTicker", {
    size = 27,
    weight = 200,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    font = "Teko Light"
})

surface.CreateFont("AriviaFontCloseGUI", {
    size = 14,
    weight = 700,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("AriviaFontObjectMinMax", {
    size = 12,
    weight = 700,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("AriviaFontBrowserTitle", {
    size = 26,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("AriviaFontPlayerWalletTitle", {
    size = 14,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("AriviaFontPlayerWallet", {
    size = 24,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("AriviaFontOnlineStaff", {
    size = 34,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("AriviaFontCategoryName", {
    size = 34,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("AriviaFontObjectListName", {
    size = 20,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("AriviaFontObjectName", {
    size = 34,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

surface.CreateFont("AriviaFontObjectPrice", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = true,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontObjectLevel", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = true,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontObjectSlots", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = true,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontServerInfo", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontPlayerName", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontStandardText", {
    size = 16,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("AriviaFontColName", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontControlKey", {
    size = 46,
    weight = 200,
    antialias = true,
    shadow = true,
    font = "Teko Light"
})

surface.CreateFont("AriviaFontControlDesc", {
    size = 22,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontCardPlayerName", {
    size = 26,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontCardSteamID", {
    size = 18,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontCardRank", {
    size = 22,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontPlayername", {
    size = 40,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("AriviaFontSteamID", {
    size = 26,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("AriviaFontClock", {
    size = 34,
    weight = 100,
    antialias = true,
    shadow = false,
    font = "Teko Light"
})

surface.CreateFont("AriviaFontMenuItem", {
    size = 25,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontButtonItem", {
    size = 18,
    weight = 200,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontMenuSubinfo", {
    size = 16,
    weight = 300,
    antialias = true,
    shadow = false,
    font = "Oswald Light"
})

surface.CreateFont("AriviaFontItemInformation", {
    size = 14,
    weight = 700,
    antialias = true,
    shadow = false,
    font = "Marlett"
})

surface.CreateFont("AriviaFontNetworkName", {
    size = 34,
    weight = 400,
    antialias = true,
    shadow = false,
    font = "Advent Pro Light"
})

-----------------------------------------------------------------
-- [ CUSTOM HELPERS ]
-----------------------------------------------------------------
local blur = Material("pp/blurscreen")

function DrawBlurPanel(panel, amount, heavyness)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, (heavyness or 3) do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

function draw.AriviaBox(x, y, w, h, col)
    surface.SetDrawColor(col)
    surface.DrawRect(x, y, w, h)
end

function draw.AriviaOutlinedBox(x, y, w, h, col, bordercol)
    surface.SetDrawColor(col)
    surface.DrawRect(x + 1, y + 1, w - 2, h - 2)
    surface.SetDrawColor(bordercol)
    surface.DrawOutlinedRect(x, y, w, h)
end

function draw.Circle(x, y, radius, seg)
    local cir = {}

    table.insert(cir, {
        x = x,
        y = y,
        u = 0.5,
        v = 0.5
    })

    for i = 0, seg do
        local a = math.rad((i / seg) * -360)

        table.insert(cir, {
            x = x + math.sin(a) * radius,
            y = y + math.cos(a) * radius,
            u = math.sin(a) / 2 + 0.5,
            v = math.cos(a) / 2 + 0.5
        })
    end

    local a = math.rad(0)

    table.insert(cir, {
        x = x + math.sin(a) * radius,
        y = y + math.cos(a) * radius,
        u = math.sin(a) / 2 + 0.5,
        v = math.cos(a) / 2 + 0.5
    })

    surface.DrawPoly(cir)
end

local tabs = {}
-----------------------------------------------------------------
-- [ SCROLLBAR PAINTING ]
-----------------------------------------------------------------
local META = FindMetaTable("Panel")

function META:ConstructScrollbarGUI()
    AriviaScrollbar = self

    AriviaScrollbar.Paint = function(AriviaScrollbar, w, h)
        surface.SetDrawColor(5, 5, 5, 200)
        surface.DrawRect(0, 0, w, h)
    end

    AriviaScrollbar.btnUp.Paint = function(AriviaScrollbar, w, h)
        surface.SetDrawColor(64, 105, 126, 190)
        surface.DrawRect(0, 0, w, h)
    end

    AriviaScrollbar.btnDown.Paint = function(AriviaScrollbar, w, h)
        surface.SetDrawColor(64, 105, 126, 190)
        surface.DrawRect(0, 0, w, h)
    end

    AriviaScrollbar.btnGrip.Paint = function(AriviaScrollbar, w, h)
        surface.SetDrawColor(52, 87, 104, 190)
        surface.DrawRect(0, 0, w, h)
    end
end

-----------------------------------------------------------------
-- [ DARKRP FUNCTIONS ]
-----------------------------------------------------------------
function AriviaAllowGunPurchase(ship)
    local ply = LocalPlayer()
    local playerJob = 1

    if IsValid(Arivia.Panel) then playerJob = Arivia.Panel.CurJob else playerJob = ply:Team() end

    if GAMEMODE.Config.restrictbuypistol and not table.HasValue(ship.allowed, playerJob) then return false, true end
    if ship.customCheck and not ship.customCheck(ply) then return false, true end
    local canbuy, suppress, message, price = hook.Call("canBuyPistol", nil, ply, ship)
    local cost = price or ship.getPrice and ship.getPrice(ply, ship.pricesep) or ship.pricesep
    --if not ply:canAfford(cost) then return false, false, cost end
    if canbuy == false then return false, suppress, cost end

    return true, nil, cost
end

function AriviaAllowEntityPurchase(item)
    local ply = LocalPlayer()
    local playerJob = 1

    if IsValid(Arivia.Panel) then playerJob = Arivia.Panel.CurJob else playerJob = ply:Team() end

    if istable(item.allowed) and not table.HasValue(item.allowed, playerJob) then return false, true end
    if item.customCheck and not item.customCheck(ply) then return false, true end
    local canbuy, suppress, message, price = hook.Call("canBuyCustomEntity", nil, ply, item)
    local cost = price or item.getPrice and item.getPrice(ply, item.price) or item.price
    --if not ply:canAfford(cost) then return false, false, cost end
    if canbuy == false then return false, suppress, cost end

    return true, nil, cost
end

function AriviaAllowAmmoPurchase(item)
    local ply = LocalPlayer()
    local playerJob = 1

    if IsValid(Arivia.Panel) then playerJob = Arivia.Panel.CurJob else playerJob = ply:Team() end

    if item.customCheck and not item.customCheck(ply) then return false, true end
    local canbuy, suppress, message, price = hook.Call("canBuyAmmo", nil, ply, item)
    local cost = price or item.getPrice and item.getPrice(ply, item.price) or item.price
    --if not ply:canAfford(cost) then return false, false, cost end
    if canbuy == false then return false, suppress, price end

    return true, nil, price
end

function AriviaAllowShipmentPurchase(ship)
    local ply = LocalPlayer()
    local playerJob = 1

    if IsValid(Arivia.Panel) then playerJob = Arivia.Panel.CurJob else playerJob = ply:Team() end

    if not table.HasValue(ship.allowed, playerJob) then return false, true end
    if ship.customCheck and not ship.customCheck(ply) then return false, true end
    local canbuy, suppress, message, price = hook.Call("canBuyShipment", nil, ply, ship)
    local cost = price or ship.getPrice and ship.getPrice(ply, ship.price) or ship.price
    --if not ply:canAfford(cost) then return false, false, cost end
    if canbuy == false then return false, suppress, cost end
    if ship.noship then return false end

    return true, nil, cost
end

function AriviaAllowJobSelection(job, maxTeamCheck)
    local ply = LocalPlayer()
    if maxTeamCheck and table.Count(team.GetPlayers(job.team)) >= (job.Max or 1337) then return false end
    if job.customCheck and not job.customCheck(ply) then return false end
    if job.admin == 1 and not (LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin()) then return false end

    return true
end

function AriviaAllowVehiclePurchase(item)
    local ply = LocalPlayer()
    local playerJob = 1

    if IsValid(Arivia.Panel) then playerJob = Arivia.Panel.CurJob else playerJob = ply:Team() end
    
    local cost = item.getPrice and item.getPrice(ply, item.price) or item.price
    if istable(item.allowed) and not table.HasValue(item.allowed, playerJob) then return false, true end
    if item.customCheck and not item.customCheck(ply) then return false, true end
    local canbuy, suppress, message, price = hook.Call("canBuyVehicle", nil, ply, item)
    cost = price or cost
    --if not ply:canAfford(cost) then return false, false, cost end
    if canbuy == false then return false, suppress, cost end

    return true, nil, cost
end

-----------------------------------------------------------------
-- [ INITIALIZE PANEL ]
-----------------------------------------------------------------

function PANEL:Init()
    Arivia.Panel = self
    self.w, self.h = ScrW() * .8, ScrH() * .8
    self:SetSize(self.w, self.h)
    self:Center()
    self:MakePopup()
    self.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- [ BACKGROUND FEATURE ]
    -----------------------------------------------------------------
    if Arivia.BackgroundsEnable then
        dhtmlBackground = vgui.Create("DHTML", self)
        dhtmlBackground:SetSize(ScrW(), ScrH())
        dhtmlBackground:SetScrollbars(false)
        dhtmlBackground:SetHTML([[
            <body style="overflow: hidden; height: 100%; width: 100%;">
                <img src="]] .. table.Random(Arivia.Backgrounds) .. [[" style="position: absolute; height: auto; width: auto; top: -50%; left: -50%; bottom: -50%; right: -50%; margin: auto;">
            </body>
        ]])

        dhtmlBackground.Paint = function(self, w, h)
            DrawBlurPanel(self)
        end
    end

    self.CurJob = LocalPlayer():Team() -- Citizen

    -----------------------------------------------------------------
    -- Panel: Left
    -- Far left side panel which holds tabs, action menus, and clock
    -----------------------------------------------------------------
    self.PanelLeft = vgui.Create("DPanel", self)
    self.PanelLeft:Dock(LEFT)
    self.PanelLeft:DockMargin(0, 0, 0, 0)
    self.PanelLeft:SetWide(200)
    self.PanelLeft.Paint = function(self, w, h) end
    -----------------------------------------------------------------
    -- Panel: Left Top
    -- Container for Action Icons
    -----------------------------------------------------------------
    self.PanelLeftTop = vgui.Create("DPanel", self.PanelLeft)

    if Arivia.BackgroundsEnable then
        self.PanelLeftTop:Dock(FILL)
    else
        self.PanelLeftTop:Dock(TOP)
    end

    self.PanelLeftTop:DockMargin(0, 0, 0, 0)
    self.PanelLeftTop:SetSize(200, 60)
    self.PanelLeftTop.Paint = function(self, w, h) end
    self.PanelLeftTabs = vgui.Create("DPanel", self.PanelLeft)
    self.PanelLeftTabs:Dock(TOP)
    self.PanelLeftTabs:DockMargin(0, 0, 0, 0)
    self.PanelLeftTabs:SetSize(200, 50)

    self.PanelLeftTabs.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Arivia.LeftTopPanelBackgroundColor)
    end

    -----------------------------------------------------------------
    -- Panel: Left Middle
    -- 
    -- Button Contents
    -----------------------------------------------------------------
    PanelLeftMiddle = vgui.Create("DPanel", self.PanelLeft)
    PanelLeftMiddle:Dock(FILL)
    PanelLeftMiddle:DockMargin(0, 0, 0, 0)
    PanelLeftMiddle:SetWide(200)

    PanelLeftMiddle.Paint = function(self, w, h)
        if Arivia.LeftMidPanelBlur then
            DrawBlurPanel(self, 3)
        end

        draw.RoundedBox(0, 0, 0, w, h, Arivia.LeftMidPanelBackgroundColor)
    end

    PanelAriviaLeftMiddleHome = vgui.Create("DPanel", PanelLeftMiddle)
    PanelAriviaLeftMiddleHome:SetSize(200, 0)
    PanelAriviaLeftMiddleHome:DockMargin(0, 0, 0, 0)
    PanelAriviaLeftMiddleHome:Dock(LEFT)
    PanelAriviaLeftMiddleHome.Paint = function(self, w, h) end

    local PanelLeftMiddleControls = vgui.Create("DPanel", self.PanelLeft)
    PanelLeftMiddleControls:Dock(FILL)
    PanelLeftMiddleControls:DockMargin(0, 0, 0, 0)
    PanelLeftMiddleControls:SetWide(200)
    PanelLeftMiddleControls:SetVisible(false)
    PanelLeftMiddleControls.Paint = function(self, w, h) end

    local listControls = vgui.Create("DIconLayout", PanelLeftMiddleControls)
    listControls:Dock(FILL)
    listControls:DockMargin(7, 5, 0, 0)
    listControls:SetPos(0, 0)
    listControls:SetSpaceY(5)
    listControls:SetSpaceX(5)

    for k, v in pairs(Arivia.Controls) do
        if v.enabled then
            local ListItem = listControls:Add("Button")
            ListItem:SetSize(90, 90)
            ListItem:SetText("")

            ListItem.Paint = function(self, w, h)
                local color = v.color

                if self:IsHovered() or self:IsDown() then
                    color = v.colorHover
                end

                draw.RoundedBox(4, 0, 0, w, h, color)
            end

            local Nick = vgui.Create("DLabel", ListItem)
            Nick:SetText(v.control)
            Nick:SetPos(8, 0)
            Nick:SetFont("AriviaFontControlKey")
            Nick:SizeToContents()
            local controlDesc = vgui.Create("DLabel", ListItem)
            controlDesc:SetText(v.description)
            controlDesc:SetPos(8, 45)
            controlDesc:SetFont("AriviaFontControlDesc")
            controlDesc:SizeToContents()
            ListItem.DoClick = v.func
        end
    end

    PanelLeftMiddleInfo = vgui.Create("DPanel", self.PanelLeft)
    PanelLeftMiddleInfo:Dock(FILL)
    PanelLeftMiddleInfo:DockMargin(0, 0, 0, 0)
    PanelLeftMiddleInfo:SetWide(200)
    PanelLeftMiddleInfo:SetVisible(false)
    PanelLeftMiddleInfo.Paint = function(self, w, h) end
    -----------------------------------------------------------------
    -- Left Middle Panel Buttons
    -----------------------------------------------------------------
    local i = 0

    for k, v in pairs(Arivia.InfoButtons) do
        if v.enabled then
            local buttonCustom = vgui.Create("DButton", PanelLeftMiddleInfo)
            buttonCustom:SetText("")
            buttonCustom:SetSize(190, 50)
            buttonCustom:SetPos(5, 5 + i)
            local mat = false

            if v.icon and Arivia.UseIconsWithInfo then
                mat = Material(v.icon, "noclamp smooth")
                buttonCustom:SetSize(buttonCustom:GetWide(), buttonCustom:GetTall())
            end

            buttonCustom.Paint = function(self, w, h)
                local color = v.buttonNormal
                local txtColor = v.textNormal

                if self:IsHovered() or self:IsDown() then
                    color = v.buttonHover
                    txtColor = v.textHover
                end

                surface.SetDrawColor(color)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(Color(255, 255, 255, 255))
                surface.DrawLine(0, 15, 0, 0)
                surface.DrawLine(15, 0, 0, 0)
                surface.SetDrawColor(Color(255, 255, 255, 255))
                surface.DrawLine(w - 20, h - 1, w, h - 1)
                surface.DrawLine(w - 1, h, w - 1, h - 20)

                if Arivia.UseIconsWithInfo and mat then
                    surface.SetDrawColor(txtColor)
                    surface.SetMaterial(mat)
                    surface.DrawTexturedRect(6, 12, 24, 24)
                    draw.SimpleText(string.upper(v.name), "AriviaFontMenuItem", 36, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(string.upper(v.description), "AriviaFontMenuSubinfo", 36, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText(string.upper(v.name), "AriviaFontMenuItem", 15, self:GetTall() * .35, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(string.upper(v.description), "AriviaFontMenuSubinfo", 15, self:GetTall() * .65, txtColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end
            end

            buttonCustom.DoClick = v.func
            i = i + 55
        end
    end

    -----------------------------------------------------------------
    -- Panel: Bar Bottom
    -----------------------------------------------------------------
    self.panelBarBottom = vgui.Create("DPanel", self.PanelLeft)
    self.panelBarBottom:Dock(BOTTOM)
    self.panelBarBottom:SetSize(200, 60)
    if Arivia.ClockEnabled then
    self.panelBarBottom:SetVisible(true)
    else
    self.panelBarBottom:SetVisible(false)
    end

    self.panelBarBottom.Paint = function(self, w, h)
        DrawBlurPanel(self, 3)
        draw.RoundedBox(0, 0, 0, w, h, Color(128, 0, 0, 250))
        draw.SimpleText(os.date(Arivia.ClockFormat), "AriviaFontClock", w / 2, h / 2, Arivia.ClockColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    -----------------------------------------------------------------
    -- Panel: Right Container
    -----------------------------------------------------------------
    self.PanelRight = vgui.Create("DPanel", self)
    self.PanelRight:Dock(FILL)

    self.PanelRight.Paint = function(self, w, h)
        if Arivia.MiddlePanelBlur then
            DrawBlurPanel(self, 3)
        end

        draw.RoundedBox(0, 0, 0, w, h, Arivia.MiddlePanelBackgroundColor)


        if Arivia.NetworkNameDisplayed then
            draw.SimpleText(Arivia.NetworkName, "AriviaFontNetworkName", w-10, 50, Arivia.NetworknameColor or Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end
    end

    -----------------------------------------------------------------
    -- Panel: Inner Top
    --
    -- Holds Network Name, server players, and current map
    -----------------------------------------------------------------
    local PanelInnerTop = vgui.Create("DPanel", self.PanelRight)
    PanelInnerTop:Dock(TOP)
    PanelInnerTop:DockMargin(5, 5, 5, 0)
    PanelInnerTop:SetTall(60)

    PanelInnerTop.Paint = function(self, w, h)
        draw.SimpleText(LocalPlayer():getDarkRPVar("job") or "", "AriviaFontServerInfo", 60, 25, Arivia.PlayerJobColor or Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(DarkRP.formatMoney(LocalPlayer():getDarkRPVar("money")), "AriviaFontPlayerWallet", 60, 45, Arivia.PlayerMoneyColor or Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end

    local Avatar = vgui.Create("AvatarImage", PanelInnerTop)
    Avatar:SetSize(50, 50)
    Avatar:SetPos(6, 10)
    Avatar:SetPlayer(LocalPlayer(), 50)
    local closeButton = vgui.Create("DButton", self)
    closeButton:SetColor(Color(255, 255, 255, 255))
    closeButton:SetFont("AriviaFontCloseGUI")
    closeButton:SetText("")

    closeButton.Paint = function()
        surface.SetDrawColor(Arivia.CloseButtonColor or Color(255, 255, 255, 255))
        surface.SetMaterial(Material(AriviaBtnClose))
        surface.DrawTexturedRect(0, 10, 16, 16)
    end

    closeButton:SetSize(32, 32)
    closeButton:SetPos(self:GetWide() - 25, 0)

    closeButton.DoClick = function()
        if IsValid(self) then
            if Arivia.InitRegenPanel then
                self:Remove()
            else
                self:Hide()
            end
        end
    end

    self.Tab = 1
    self:UpdateTabs()

    self:UpdateAdmins()

    PanelCustomContent = vgui.Create("DPanel", self.PanelRight)
    PanelCustomContent:Dock(FILL)
    PanelCustomContent:SetSize(self:GetWide() - 215, 0)
    PanelCustomContent:DockMargin(5, 5, 5, 5)
    PanelCustomContent:SetVisible(false)

    PanelCustomContent.Paint = function(self, w, h)
        draw.SimpleText( Arivia.Language.NetworkRules, "AriviaFontOnlineStaff", 18, 35, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.DrawLine(w - 20, 48, 15, 48)
    end

    local txtEntryMessage = vgui.Create("DTextEntry", PanelCustomContent)
    txtEntryMessage:SetPos(15, 80)
    txtEntryMessage:SetMultiline(true)
    txtEntryMessage:SetDrawBackground(false)
    txtEntryMessage:SetEnabled(true)
    txtEntryMessage:Dock(FILL)
    txtEntryMessage:DockMargin(10, 80, 5, 5)
    txtEntryMessage:SetVerticalScrollbarEnabled(true)
    txtEntryMessage:SetFont("AriviaFontStandardText")
    txtEntryMessage:SetText(Arivia.RulesText)
    txtEntryMessage:SetTextColor(Color(255, 255, 255, 255))

    -----------------------------------------------------------------
    -- Home Button
    -----------------------------------------------------------------
    local buttonHome = vgui.Create("DButton", self.PanelLeftTabs)
    buttonHome:Dock(LEFT)
    buttonHome:DockMargin(2, 0, 0, 0)
    buttonHome:SetSize(60, 40)
    buttonHome:SetText("")
    buttonHome:SetVisible(true)
    buttonHome:SetTooltip(string.upper(Arivia.Language.TabMain))

    function buttonHome:Paint(w, h)
        local color = Color(60, 0, 0, 0)

        if buttonHome:IsHovered() or buttonHome:IsDown() then
            color = Color(100, 0, 0, 240)
        end

        draw.RoundedBox(0, 0, 0, w, h, color)
        draw.SimpleText(string.upper(Arivia.Language.TabMain), "AriviaFontButtonItem", self:GetWide() / 2, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function buttonHome:DoClick()
        PanelLeftMiddleInfo:SetVisible(false)
        PanelLeftMiddleControls:SetVisible(false)
        PanelAriviaLeftMiddleHome:SetVisible(true)
    end

    -----------------------------------------------------------------
    -- Actions Button
    -----------------------------------------------------------------
    local buttonActions = vgui.Create("DButton", self.PanelLeftTabs)
    buttonActions:Dock(LEFT)
    buttonActions:DockMargin(0, 0, 0, 0)
    buttonActions:SetSize(60, 40)
    buttonActions:SetText("")
    buttonActions:SetVisible(true)
    buttonActions:SetTooltip(string.upper(Arivia.Language.TabInfo))

    function buttonActions:Paint(w, h)
        local color = Color(60, 0, 0, 0)

        if self:IsHovered() or self:IsDown() then
            color = Color(100, 0, 0, 240)
        end

        draw.RoundedBox(0, 0, 0, w, h, color)
        draw.SimpleText(string.upper(Arivia.Language.TabInfo), "AriviaFontButtonItem", self:GetWide() / 2, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function buttonActions:DoClick()
        PanelAriviaLeftMiddleHome:SetVisible(false)
        PanelLeftMiddleControls:SetVisible(false)
        PanelLeftMiddleInfo:SetVisible(true)
    end

    -----------------------------------------------------------------
    -- Controls Button
    -----------------------------------------------------------------
    local buttonControls = vgui.Create("DButton", self.PanelLeftTabs)
    buttonControls:Dock(LEFT)
    buttonControls:DockMargin(0, 0, 17, 0)
    buttonControls:SetSize(78, 40)
    buttonControls:SetText("")
    buttonControls:SetVisible(true)
    buttonControls:SetTooltip(string.upper(Arivia.Language.TabCommands))

    function buttonControls:Paint(w, h)
        local color = Color(60, 0, 0, 0)

        if self:IsHovered() or self:IsDown() then
            color = Color(100, 0, 0, 240)
        end

        draw.RoundedBox(0, 0, 0, w, h, color)
        draw.SimpleText(string.upper(Arivia.Language.TabCommands), "AriviaFontButtonItem", self:GetWide() / 2, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function buttonControls:DoClick()
        PanelAriviaLeftMiddleHome:SetVisible(false)
        PanelLeftMiddleInfo:SetVisible(false)
        PanelLeftMiddleControls:SetVisible(true)
    end

    -----------------------------------------------------------------
    -- Function Arivia:OpenURL
    -- 
    -- Takes a URL and opens it within the custom browser.
    -----------------------------------------------------------------
    function Arivia:OpenURL(ariviaURL, AriviaTitle)
        if IsValid(panelBrowser) then
            panelBrowser:Remove()
        end

        panelBrowser = vgui.Create("DFrame", self)
        panelBrowser:SetSize(ScrW() - 200, ScrH() - 250)
        panelBrowser:SetVisible(true)
        panelBrowser:MakePopup()
        panelBrowser:Center()
        panelBrowser:ShowCloseButton(false)
        panelBrowser:SetTitle("")

        panelBrowser.Paint = function(self, w, h)
            DrawBlurPanel(self)
            surface.SetDrawColor(0, 0, 0, 0)
            draw.RoundedBox(4, 0, 0, w, h, Arivia.BrowserColor)
            draw.DrawText(AriviaTitle, "AriviaFontBrowserTitle", panelBrowser:GetWide() / 2, 8, color_white, TEXT_ALIGN_CENTER)
        end

        local closeButton = vgui.Create("DButton", panelBrowser)
        closeButton:SetColor(Color(255, 255, 255, 255))
        closeButton:SetFont("AriviaFontCloseGUI")
        closeButton:SetText("")

        closeButton.Paint = function()
            surface.SetDrawColor(Color(255, 255, 255, 255))
            surface.SetMaterial(Material(AriviaBtnClose, "noclamp smooth"))
            surface.DrawTexturedRect(0, 10, 16, 16)
        end

        closeButton:SetSize(32, 32)
        closeButton:SetPos(panelBrowser:GetWide() - 30, 0)

        closeButton.DoClick = function()
            if IsValid(panelBrowser) then
                panelBrowser:Remove()
            end
        end

        local dhtmlWindow = vgui.Create("DHTML", panelBrowser)
        dhtmlWindow:SetSize(ScrW() - 200, 300)
        dhtmlWindow:DockMargin(10, 10, 5, 10)
        dhtmlWindow:Dock(FILL)
        local dhtmlControlsBar = vgui.Create("DHTMLControls", panelBrowser)
        dhtmlControlsBar:Dock(TOP)
        dhtmlControlsBar:SetWide(ScrW() - 200)
        dhtmlControlsBar:SetPos(0, 0)
        dhtmlControlsBar:SetHTML(dhtmlWindow)
        dhtmlControlsBar.AddressBar:SetText(ariviaURL)
        dhtmlWindow:MoveBelow(dhtmlControlsBar)
        dhtmlWindow:OpenURL(ariviaURL)
    end

    -----------------------------------------------------------------
    -- Function Arivia:OpenText
    -- 
    -- Takes standard text (or a table of text) and prints it to 
    -- window.
    -----------------------------------------------------------------
    function Arivia:OpenRules()
        if IsValid(panelBrowser) then
            panelBrowser:Remove()
        end

        PanelAriviaInnerBottom:SetVisible(false)
        PanelCustomContent:SetVisible(true)
        PanelAriviaInnerBottomAdmins:SetVisible(false)
    end

    function Arivia:OpenAdmins()
        Arivia.Panel:UpdateAdmins()

        if IsValid(panelBrowser) then
            panelBrowser:Remove()
        end

        if IsValid(PanelAriviaInnerBottomAdmins) and PanelAriviaInnerBottomAdmins:IsVisible() then
            PanelAriviaInnerBottomAdmins:SetVisible(false)
            PanelCustomContent:SetVisible(false)
            PanelAriviaInnerBottom:SetVisible(true)
        else
            PanelAriviaInnerBottom:SetVisible(false)
            PanelCustomContent:SetVisible(false)
            PanelAriviaInnerBottomAdmins:SetVisible(true)
        end
    end

    function Arivia:TickerLoader()
        local W, H = ScrW(), ScrH()

        if not (W) then
            timer.Simple(0.5, Load)

            return
        end

        local panelTickerConst = vgui.Create("DPanel", panelBarTicker)

        if Arivia.TickerEnabled then
            panelTickerConst:SetVisible(true)
        else
            panelTickerConst:SetVisible(false)
        end

        panelTickerConst:SetSize(W, H)
        panelTickerConst:SetPos(1, 1)
        local labelTickerArivia = vgui.Create("DLabel", panelTickerConst)
        labelTickerArivia:SetText("")

        if Arivia.TickerEnabled then
            labelTickerArivia:SetVisible(true)
        else
            labelTickerArivia:SetVisible(false)
        end

        labelTickerArivia:SetFont("AriviaFontTicker")
        labelTickerArivia:SetTextColor(AriviaTickers.color)
        panelTickerConst.Alpha = 0

        panelTickerConst.Paint = function(self)
            if (FrameTime() == 0) then return end
            if (IsValid(LocalPlayer():GetActiveWeapon())) and (LocalPlayer():GetActiveWeapon():GetClass() == "gmod_camera") then return end

            if (AriviaTickers.CurrentAd) then
                if not (labelTickerArivia.Setup) then
                    labelTickerArivia:SetText(AriviaTickers.CurrentAd)
                    labelTickerArivia:SetTextColor(AriviaTickers.color)
                    labelTickerArivia:SizeToContents()
                    labelTickerArivia:SetPos(panelTickerConst:GetWide() + 50, 2)
                    labelTickerArivia.PosX, labelTickerArivia.PosY = labelTickerArivia:GetPos()
                    labelTickerArivia.Setup = true
                end

                self.Alpha = math.Approach(self.Alpha, 1, FrameTime() * 500)
                draw.RoundedBox(4, 0, 0, self:GetWide(), self:GetTall(), Color(0, 0, 0, self.Alpha))
                labelTickerArivia.PosX = labelTickerArivia.PosX - FrameTime() * Arivia.TickerSpeed
                labelTickerArivia:SetPos(labelTickerArivia.PosX, labelTickerArivia.PosY)

                if (labelTickerArivia.PosX + labelTickerArivia:GetWide() < -50) then
                    AriviaTickers.CurrentAd = nil
                end
            elseif (self.Alpha > 0) then
                self.Alpha = math.Approach(self.Alpha, 0, FrameTime() * 500)

                if (self.Alpha == 0) then
                    labelTickerArivia.Setup = false
                end
            end
        end

        AriviaTickers.VGUI = panelTickerConst
    end

    timer.Simple(1, Arivia.TickerLoader)
end

function PANEL:UpdateAdmins()

    if IsValid(PanelAriviaInnerBottomAdmins) then PanelAriviaInnerBottomAdmins:Remove() end

    PanelAriviaInnerBottomAdmins = vgui.Create("DPanel", self.PanelRight)
    PanelAriviaInnerBottomAdmins:Dock(FILL)
    PanelAriviaInnerBottomAdmins:DockMargin(10, 5, 10, 10)
    PanelAriviaInnerBottomAdmins:SetVisible(false)

    PanelAriviaInnerBottomAdmins.Paint = function(self, w, h)
        draw.SimpleText( Arivia.Language.OnlineStaff, "AriviaFontOnlineStaff", 0, 15, Arivia.NetworknameColor or Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.DrawLine(w - 5, 30, 0, 30)
    end

    local List = vgui.Create("DIconLayout", PanelAriviaInnerBottomAdmins)
    List:Dock(FILL)
    List:DockMargin(0, 40, 0, 0)
    List:SetPos(0, 0)
    List:SetSpaceY(5)
    List:SetSpaceX(5)
    local i = 0

    for k, v in ipairs(player.GetAll()) do
        if not table.HasValue(Arivia.StaffGroups, v:GetUserGroup()) then continue end

        if not v:SteamID() or v:SteamID() == "NULL" then
            playerSteamID = Arivia.Language.NoSteamID
        else
            playerSteamID = v:SteamID()
        end

        local ListItem = List:Add("DPanel")
        ListItem:SetSize(275, 72)

        ListItem.Paint = function(self, w, h)
            if Arivia.StaffCardBlur then
                DrawBlurPanel(self)
            end

            if Arivia.StaffCardBackgroundUseRankColor then
                draw.RoundedBox(5, 0, 0, w, h, Arivia.UserGroupColors[v:GetUserGroup()] and Arivia.UserGroupColors[v:GetUserGroup()] or Arivia.StaffCardBackgroundColor)
            else
                draw.RoundedBox(5, 0, 0, w, h, Arivia.StaffCardBackgroundColor)
            end
        end

        local Avatar = vgui.Create("AvatarImage", ListItem)
        Avatar:SetSize(64, 64)
        Avatar:SetPos(4, 4)
        Avatar:SetPlayer(v, 64)

        local Nick = vgui.Create("DLabel", ListItem)
        Nick:SetText(v:Nick())
        Nick:SetPos(75, 5)
        Nick:SetFont("AriviaFontCardPlayerName")
        Nick:SetTextColor(Arivia.StaffCardNameColor or Color(255, 255, 255, 255))
        Nick:SizeToContents()

        local Rank = vgui.Create("DLabel", ListItem)
        Rank:SetText(Arivia.UserGroupTitles[v:GetUserGroup()] and Arivia.UserGroupTitles[v:GetUserGroup()] or v:GetUserGroup())
        Rank:SetPos(75, 30)
        Rank:SetFont("AriviaFontCardRank")
        Rank:SetTextColor(Arivia.StaffCardRankColor or Color(255, 255, 255, 255))
        Rank:SizeToContents()

        local buttonStaffProfile = vgui.Create("DButton", ListItem)
        buttonStaffProfile:SetText("")
        buttonStaffProfile:SetSize(190, 50)
        buttonStaffProfile:SetPos(ListItem:GetWide() - 30, 0)
        buttonStaffProfile:SetTooltip( Arivia.Language.ViewSteamProfile )

        buttonStaffProfile.Paint = function(self, w, h)
            local staffSteamProfile = Material("arivia/arivia_btn_steam.png", "noclamp smooth")

            if v:IsPlayer() and IsValid(v) and not v:IsBot() then
                surface.SetDrawColor(Color(255, 255, 255, 255))
                surface.SetMaterial(staffSteamProfile)
                surface.DrawTexturedRect(3, 7, 19, 19)
            else
                surface.SetDrawColor(Color(255, 255, 255, 25))
                surface.SetMaterial(staffSteamProfile)
                surface.DrawTexturedRect(3, 7, 19, 19)
            end

            if self:IsHovered() or self:IsDown() then
                color = buttonHover
                txtColor = textHover
            end
        end

        buttonStaffProfile.DoClick = function()
            if IsValid(v) then
                v:ShowProfile()
            end
        end

        i = i + 1
    end
end


function PANEL:UpdateServers()

    if table.Count(Arivia.Servers) > 0 and Arivia.ServersEnabled then
        if IsValid(PanelAriviaServers) then PanelAriviaServers:Remove() end
        PanelAriviaServers = vgui.Create("DPanel", self.PanelRight)
        PanelAriviaServers:Dock(BOTTOM)
        PanelAriviaServers:SetTall(60)

        PanelAriviaServers.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
            surface.SetDrawColor(Color(5, 5, 5, 255))
        end

        local buttonCount = 0

        for k, v in pairs(Arivia.Servers) do
            local buttonCustom = vgui.Create("DButton", PanelAriviaServers)
            buttonCustom:SetText("")
            surface.SetFont("AriviaFontButtonItem")
            local sizex, sizey = surface.GetTextSize(string.upper(v.hostname))
            buttonCustom:SetSize(sizex + 20, 60)
            buttonCustom:Dock(LEFT)
            buttonCustom:DockMargin(5, 0, 0, 0)
            local mat = false

            if v.icon and Arivia.UseServerIconsWithText then
                mat = Material(v.icon, "noclamp smooth")
                buttonCustom:SetSize(buttonCustom:GetWide() + 32, buttonCustom:GetTall())
            elseif v.icon and Arivia.UseServerIconsOnly then
                mat = Material(v.icon, "noclamp smooth")
                buttonCustom:SetSize(64, buttonCustom:GetTall())
            end

            buttonCustom.Paint = function(self, w, h)
                local color = Arivia.ServerButtonColor
                local txtColor = Arivia.ServerButtonTextColor

                if self:IsHovered() or self:IsDown() then
                    color = Arivia.ServerButtonHoverColor
                    txtColor = Arivia.ServerButtonHoverTextColor
                end

                surface.SetDrawColor(color)
                surface.DrawRect(0, 0, w, h)

                if Arivia.UseServerIconsWithText and mat then
                    surface.SetDrawColor(txtColor)
                    surface.SetMaterial(mat)
                    surface.DrawTexturedRect(5, 14, 32, 32)
                    draw.SimpleText(string.upper(v.hostname), "AriviaFontButtonItem", self:GetWide() / 2 + 16, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif Arivia.UseServerIconsOnly and mat then
                    surface.SetDrawColor(txtColor)
                    surface.SetMaterial(mat)
                    surface.DrawTexturedRect(17, 14, 32, 32)
                else
                    draw.SimpleText(string.upper(v.hostname), "AriviaFontButtonItem", self:GetWide() / 2, self:GetTall() / 2, txtColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end

            buttonCustom.DoClick = function()
                LocalPlayer():ConCommand("connect " .. v.ip)
            end

            buttonCount = buttonCount + 1
        end
    end

    if IsValid(panelBarTicker) then panelBarTicker:Remove() end 
    panelBarTicker = vgui.Create("DLabel", self.PanelRight)
    panelBarTicker:Dock(BOTTOM)
    panelBarTicker:SetTall(30)
    panelBarTicker:SetText("")

    if Arivia.TickerEnabled then
        panelBarTicker:SetVisible(true)
    else
        panelBarTicker:SetVisible(false)
    end

    panelBarTicker.Paint = function(self, w, h)
        draw.AriviaBox(0, 0, w, h, Color(0, 0, 0, 200))
        draw.AriviaBox(0, 0, w, 2, Color(0, 0, 0, 200))
    end
end

function PANEL:UpdateTabs()

    tabs = {}

    if IsValid(PanelAriviaLeftMiddleHome) then PanelAriviaLeftMiddleHome:Remove() end
    if IsValid(PanelLeftMiddleInfo) then PanelLeftMiddleInfo:SetVisible(false) end

    PanelAriviaLeftMiddleHome = vgui.Create("DPanel", PanelLeftMiddle)
    PanelAriviaLeftMiddleHome:SetSize(200, 0)
    PanelAriviaLeftMiddleHome:DockMargin(0, 0, 0, 0)
    PanelAriviaLeftMiddleHome:Dock(LEFT)
    PanelAriviaLeftMiddleHome.Paint = function(self, w, h) end

    if IsValid(PanelAriviaInnerBottom) then PanelAriviaInnerBottom:Remove() end
    PanelAriviaInnerBottom = vgui.Create("DPanel", self.PanelRight)
    PanelAriviaInnerBottom:Dock(FILL)
    PanelAriviaInnerBottom:SetSize(self:GetWide() - 215, 0)
    PanelAriviaInnerBottom:DockMargin(5, 5, 5, 5)

    PanelAriviaInnerBottom.Paint = function(self, w, h) end

    -----------------------------------------------------------------
    -- [ JOBS ]
    -----------------------------------------------------------------

    self.Jobs = vgui.Create("AriviaTabJobs", PanelAriviaInnerBottom)
    self:GenerateCategory(Arivia.TabJobs.name, Arivia.TabJobs.description, Arivia.TabJobs.icon, Arivia.TabJobs.buttonColor, Arivia.TabJobs.buttonHoverColor, self.Jobs)

    -----------------------------------------------------------------
    -- [ WEAPONS ]
    -----------------------------------------------------------------
    local count = 0

    for k, v in pairs(CustomShipments) do
        if not AriviaAllowGunPurchase(v) and not Arivia.TabShipments.showUnavailableGuns then continue end
        if not (v.separate or v.noship) then continue end
        count = count + 1
    end

    if count ~= 0 then
        self.Weapons = vgui.Create("AriviaTabWeapons", PanelAriviaInnerBottom)
        self:GenerateCategory(Arivia.TabWeapons.name, Arivia.TabWeapons.description, Arivia.TabWeapons.icon, Arivia.TabWeapons.buttonColor, Arivia.TabWeapons.buttonHoverColor, self.Weapons)
    end

    -----------------------------------------------------------------
    -- [ AMMO ]
    -----------------------------------------------------------------
    if #GAMEMODE.AmmoTypes ~= 0 then
        self.Ammo = vgui.Create("AriviaTabAmmo", PanelAriviaInnerBottom)
        self:GenerateCategory(Arivia.TabAmmo.name, Arivia.TabAmmo.description, Arivia.TabAmmo.icon, Arivia.TabAmmo.buttonColor, Arivia.TabAmmo.buttonHoverColor, self.Ammo)
    end

    -----------------------------------------------------------------
    -- [ SHIPMENTS ]
    -----------------------------------------------------------------
    count = 0

    for k, v in pairs(CustomShipments) do
        self.Value = v
        if not AriviaAllowShipmentPurchase(v) and not Arivia.TabShipments.showUnavailableShipments then continue end
        count = count + 1
    end

    if count ~= 0 then
        self.Ships = vgui.Create("AriviaTabShipments", PanelAriviaInnerBottom)
        self:GenerateCategory(Arivia.TabShipments.name, Arivia.TabShipments.description, Arivia.TabShipments.icon, Arivia.TabShipments.buttonColor, Arivia.TabShipments.buttonHoverColor, self.Ships)
    end

    -----------------------------------------------------------------
    -- [ ENTITIES ]
    -----------------------------------------------------------------
    count = 0

    for k, v in pairs(DarkRPEntities) do
        if not AriviaAllowEntityPurchase(v) then continue end
        count = count + 1
    end

    if count ~= 0 then
        self.Ents = vgui.Create("AriviaTabEntities", PanelAriviaInnerBottom)
        self:GenerateCategory(Arivia.TabEntities.name, Arivia.TabEntities.description, Arivia.TabEntities.icon, Arivia.TabEntities.buttonColor, Arivia.TabEntities.buttonHoverColor, self.Ents)
    end

    for k, v in pairs(tabs) do
        if IsValid(v) then
            v:SetVisible(false)
        end
    end

    if IsValid(tabs[self.Tab]) then
        tabs[self.Tab]:SetVisible(true)
    end

    self:UpdateServers()

end

function PANEL:GetCurrentTab()
    return self.Tab
end

-----------------------------------------------------------------
-- [ GENERATE NEW CATEGORY ]
-----------------------------------------------------------------
function PANEL:GenerateCategory(name, description, icon, buttoncolor, buttonhovercolor, panel)
    table.insert(tabs, panel)
    local AriviaCategory = vgui.Create("DButton", PanelAriviaLeftMiddleHome)
    AriviaCategory:SetSize(190, 50)
    AriviaCategory:DockMargin(5, 5, 5, 0)
    AriviaCategory:Dock(TOP)
    AriviaCategory:SetText("")

    AriviaCategory.DoClick = function()
        self.Tab = table.KeyFromValue(tabs, panel)

        -----------------------------------------------------------------
        -- If Admin Panel is visible - hide
        -----------------------------------------------------------------
        if PanelAriviaInnerBottomAdmins:IsVisible() then
            PanelAriviaInnerBottomAdmins:SetVisible(false)
        end

        -----------------------------------------------------------------
        -- If Admin Panel is visible - hide
        -----------------------------------------------------------------
        if PanelCustomContent:IsVisible() then
            PanelCustomContent:SetVisible(false)
        end

        if not PanelAriviaInnerBottom:IsVisible() then
            PanelAriviaInnerBottom:SetVisible(true)
        end

        for k, v in pairs(tabs) do
            if IsValid(v) then
                v:SetVisible(false)
            end
        end

        if panel:IsValid() then
            panel:SetVisible(true)
        end
    end

    AriviaCategory.Paint = function(this, w, h)
        local buttonNormal = buttoncolor
        local buttonHover = buttonhovercolor
        local textNormal = Color(255, 255, 255, 255)
        local textHover = Color(255, 255, 255, 255)
        local material = Material(icon, "noclamp smooth")
        local color = buttonNormal
        local txtColor = textNormal

        if AriviaCategory:IsHovered() or AriviaCategory:IsDown() then
            color = buttonHover
            txtColor = textHover
        end

        surface.SetDrawColor(color)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.DrawLine(0, 15, 0, 0)
        surface.DrawLine(15, 0, 0, 0)
        surface.SetDrawColor(Color(255, 255, 255, 255))
        surface.DrawLine(w - 20, h - 1, w, h - 1)
        surface.DrawLine(w - 1, h, w - 1, h - 20)
        surface.SetDrawColor(textNormal)
        surface.SetMaterial(material)
        surface.DrawTexturedRect(6, 12, 24, 24)
        draw.SimpleText(string.upper(name), "AriviaFontMenuItem", 36, AriviaCategory:GetTall() * .35, textNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText(string.upper(description), "AriviaFontMenuSubinfo", 36, AriviaCategory:GetTall() * .65, textNormal, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

-----------------------------------------------------------------
-- [ CHECK F4 KEYPRESS ]
-----------------------------------------------------------------
function PANEL:OnKeyCodePressed(keyCode)
    if keyCode == KEY_F4 then
        DarkRP.toggleF4Menu()
    end
end

vgui.Register("AriviaPanel", PANEL, "DPanel")

hook.Add("OnPlayerChangedTeam", "AriviaTeamChanged", function(ply, old, new)

    if Arivia.InitRegenPanel then return end

    if IsValid( Arivia.Panel ) then
        Arivia.Panel.CurJob = new
        Arivia.Panel:UpdateTabs()
    end

end )

hook.Add("InitPostEntity", "AriviaPanel", function()

    Arivia.Panel = nil

    -----------------------------------------------------------------
    -- [ OPEN MENU ]
    -----------------------------------------------------------------
    function DarkRP.openF4Menu()
        if Arivia.Panel and IsValid(Arivia.Panel) then
            if Arivia.InitRegenPanel then
                Arivia.Panel = vgui.Create("AriviaPanel")
            else
                Arivia.Panel:Show()
            end

            Arivia.Panel:InvalidateLayout()
        else
            Arivia.Panel = vgui.Create("AriviaPanel")
        end
    end

    -----------------------------------------------------------------
    -- [ CLOSE MENU ]
    -----------------------------------------------------------------
    function DarkRP.closeF4Menu()
        if Arivia.Panel then
            if Arivia.InitRegenPanel then
                Arivia.Panel:Remove()
            else
                Arivia.Panel:Hide()
            end
        end
    end

    -----------------------------------------------------------------
    -- [ TOGGLE MENU ]
    -----------------------------------------------------------------
    function DarkRP.toggleF4Menu()
        if not IsValid(Arivia.Panel) or not Arivia.Panel:IsVisible() then
            DarkRP.openF4Menu()
        else
            DarkRP.closeF4Menu()
        end
    end

    GAMEMODE.ShowSpare2 = DarkRP.toggleF4Menu

end)