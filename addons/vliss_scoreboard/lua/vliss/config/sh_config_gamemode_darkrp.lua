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
-----------------------------------------------------------------
-- [ DARKRP MODE SETTINGS ]
-----------------------------------------------------------------
-- These settings are for the DARKRP GAMEMODE ONLY.
-- If you are using Vliss on another gamemode, then you should 
-- set Vliss.DarkRP.Enabled = false
-----------------------------------------------------------------

Vliss.DarkRP.Enabled = false -- Set this to true if DarkRP is your gamemode.

Vliss.DarkRP.FAdminActions = {
    ButtonContainerW = 300,
    ButtonContainerH = 100,
    ButtonActionW = 65,
    ButtonActionH = 25,
    ButtonNormalColor = Color(64, 105, 126, 190),
    ButtonHoverColor = Color(64, 105, 126, 240),
    ButtonToggledColor = Color(4, 80, 4, 190),
    ButtonToggledHoverColor = Color(4, 80, 4, 240),
    ButtonTextColor = Color(255,255,255,255),
}

-----------------------------------------------------------------
-- [ DARKRP : ADVANCED SETTINGS ]
-----------------------------------------------------------------
-- These settings work by default and should NOT be modified 
-- unless you know what you're doing. If you do modify these 
-- and break something, then it's on you. I will not spend time 
-- trying to diagnose things that you've modified.
-----------------------------------------------------------------

Vliss.Commands.DarkRP = {
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Teleport",
        NameStart = "Bring",
        CommandStart = "bring"
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Teleport",
        NameStart = "Goto",
        CommandStart = "goto"
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "StripWeapons",
        NameStart = "Strip Weapons",
        CommandStart = "stripweapons"
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "God",
        CheckState = "FAdmin_godded",
        NameStart = "God",
        CommandStart = "god",
        NameReverse = "Ungod",
        CommandReverse = "Ungod",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Cloak",
        CheckState = "FAdmin_cloaked",
        NameStart = "Cloak",
        CommandStart = "Cloak",
        NameReverse = "Uncloak",
        CommandReverse = "Uncloak",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Spectate",
        NameStart = "Spectate",
        CommandStart = "Spectate",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Freeze",
        CheckState = "FAdmin_frozen",
        NameStart = "Freeze",
        CommandStart = "freeze",
        NameReverse = "Unfreeze",
        CommandReverse = "unfreeze",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Jail",
        CheckState = "fadmin_jailed",
        NameStart = "Jail",
        CommandStart = "jail",
        NameReverse = "Unjail",
        CommandReverse = "unjail",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Slay",
        NameStart = "Slay",
        CommandStart = "slay",
    },
   {
        Enabled = true,
        IsSpecial = false,
        Permission = "Ignite",
        CheckState = "FAdmin_ignited",
        NameStart = "Ignite",
        CommandStart = "ignite",
        NameReverse = "Extinguish",
        CommandReverse = "unignite",
    },
   {
        Enabled = true,
        IsSpecial = false,
        Permission = "Ragdoll",
        CheckState = "fadmin_ragdolled",
        NameStart = "Ragdoll",
        CommandStart = "ragdoll",
        NameReverse = "Unragdoll",
        CommandReverse = "unragdoll",
    },
   {
        Enabled = true,
        IsSpecial = false,
        Permission = "Slap",
        NameStart = "Slap",
        CommandStart = "slap",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Chatmute",
        CheckState = "FAdmin_chatmuted",
        NameStart = "Mute Chat",
        CommandStart = "chatmute",
        NameReverse = "Unmute Chat",
        CommandReverse = "UnChatmute",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Voicemute",
        CheckState = "FAdmin_voicemuted",
        NameStart = "Mute Voice",
        CommandStart = "Voicemute",
        NameReverse = "Unmute Voice",
        CommandReverse = "UnVoicemute",
    },
    {
        Enabled = true,
        IsSpecial = false,
        Permission = "Kick",
        NameStart = "Quick Kick",
        CommandStart = "kick"
    },
}

Vliss.DarkRP.ServerActions = {
    {
        enabled = true,
        permission = "RCon",
        name = "RCon", 
        icon = "vliss/vliss_btn_rcon.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function()
            Derma_StringRequest("RCon comand", "Enter a command to be run on the server. Note: a lot of commands are blocked and they will not work!", "", function(text) RunConsoleCommand("_FAdmin", "RCon", unpack(string.Explode(" ", text))) end) 
        end
    },
    {
        enabled = true,
        permission = "ClearDecals",
        name = "Clear Decals", 
        icon = "vliss/vliss_btn_decals.png",
        buttonNormal = Color(64, 105, 126, 255),
        buttonHover = Color(64, 105, 126, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function() RunConsoleCommand("_FAdmin", "ClearDecals") end
    },
    {
        enabled = true,
        permission = "StopSounds",
        name = "Stop All Sounds", 
        icon = "vliss/vliss_btn_stopsound.png",
        buttonNormal = Color(163, 135, 79, 255),
        buttonHover = Color(163, 135, 79, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function() RunConsoleCommand("_FAdmin", "StopSounds") end
    },
    {
        enabled = true,
        permission = "CleanUp",
        name = "Clean Server", 
        icon = "vliss/vliss_btn_cleanup.png",
        buttonNormal = Color(145, 71, 101, 255),
        buttonHover = Color(145, 71, 101, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function() RunConsoleCommand("_FAdmin", "CleanUp") end
    },
    {
        enabled = true,
        permission = "CreateMOTD",
        name = "Place MOTD", 
        icon = "vliss/vliss_btn_motd.png",
        buttonNormal = Color(64, 126, 105, 255),
        buttonHover = Color(64, 126, 105, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function() RunConsoleCommand("_FAdmin", "CreateMOTD") end
    },

}

Vliss.DarkRP.PlayerActions = {
    {
        enabled = true,
        permission = "PickUpPlayers",
        convarAvail = true,
        convar = "AdminsCanPickUpPlayers",
        convarDefault = 1,
        name = "Admin > Player Pickup", 
        status = "Disabled",
        icon = "vliss/vliss_btn_switch_on.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        toggledStatus = "Enabled",
        toggledIcon = "vliss/vliss_btn_switch_off.png",
        toggledButtonNormal = Color(71, 145, 94, 255),
        toggledButtonHover = Color(71, 145, 94, 200),
        toggledTextNormal = Color(255, 255, 255, 255),
        toggledTextHover = Color(255, 255, 255, 255),
        func = function()
            local AdminsCanPickUpPlayers = CreateConVar("AdminsCanPickUpPlayers", 1, {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE})
            RunConsoleCommand("_FAdmin", "AdminsCanPickUpPlayers", AdminsCanPickUpPlayers:GetBool() and "0" or "1")
        end
    },
    {
        enabled = true,
        permission = "PickUpPlayers",
        convarAvail = true,
        convar = "PlayersCanPickUpPlayers",
        convarDefault = 1,
        name = "Player > Player Pickup", 
        status = "Disabled",
        icon = "vliss/vliss_btn_switch_on.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        toggledStatus = "Enabled",
        toggledIcon = "vliss/vliss_btn_switch_off.png",
        toggledButtonNormal = Color(71, 145, 94, 255),
        toggledButtonHover = Color(71, 145, 94, 200),
        toggledTextNormal = Color(255, 255, 255, 255),
        toggledTextHover = Color(255, 255, 255, 255),
        func = function()
            local PlayersCanPickUpPlayers = CreateConVar("PlayersCanPickUpPlayers", 0, {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE})
            RunConsoleCommand("_FAdmin", "PlayersCanPickUpPlayers", PlayersCanPickUpPlayers:GetBool() and "0" or "1")
        end
    },
    {
        enabled = true,
        permission = "SetAccess",
        name = "Edit Groups", 
        icon = "vliss/vliss_btn_group.png",
        buttonNormal = Color(64, 126, 105, 255),
        buttonHover = Color(64, 126, 105, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function()

            local StarterGroups = {"superadmin", "admin", "user", "noaccess"}
            local ContinueNewGroup
            local EditGroups

            local frame, SelectedGroup, AddGroup, RemGroup, Privileges, SelectedPrivs, AddPriv, RemPriv, lblImmunity, nmbrImmunity

            frame = vgui.Create("DFrame")
            frame:SetTitle("Create, edit and remove groups")
            frame:MakePopup()
            frame:SetVisible(true)
            frame:SetSize(640, 480)
            frame:Center()

            SelectedGroup = vgui.Create("DComboBox", frame)
            SelectedGroup:SetPos(5, 30)
            SelectedGroup:SetWidth(145)

            for k,v in pairs(FAdmin.Access.Groups) do
                v.immunity = v.immunity or 0
            end
            for k,v in SortedPairsByMemberValue(FAdmin.Access.Groups, "immunity", true) do
                SelectedGroup:AddChoice(k)
            end

            AddGroup = vgui.Create("DButton", frame)
            AddGroup:SetPos(155, 30)
            AddGroup:SetSize(60, 22)
            AddGroup:SetText("Add Group")
            AddGroup.DoClick = function()
                addGroupUI(nil, function(name, admin, privs)
                    SelectedGroup:AddChoice(name)
                    SelectedGroup:SetValue(name)
                    RemGroup:SetDisabled(false)

                    Privileges:Clear()
                    SelectedPrivs:Clear()
                    nmbrImmunity:SetText(FAdmin.Access.Groups[FAdmin.Access.ADMIN[admin + 1]].immunity)
                    nmbrImmunity:SetDisabled(false)
                    nmbrImmunity:SetEditable(true)

                    for priv, am in SortedPairs(FAdmin.Access.Privileges) do
                        if am <= admin + 1 then
                            SelectedPrivs:AddLine(priv)
                        else
                            Privileges:AddLine(priv)
                        end
                    end
                end)
            end

            RemGroup = vgui.Create("DButton", frame)
            RemGroup:SetPos(220, 30)
            RemGroup:SetSize(85, 22)
            RemGroup:SetText("Remove Group")
            RemGroup.DoClick = function()
                RunConsoleCommand("_FAdmin", "RemoveGroup", SelectedGroup:GetValue())

                for k,v in pairs(SelectedGroup.Choices) do
                    if v ~= SelectedGroup:GetValue() then continue end

                    SelectedGroup.Choices[k] = nil
                    break
                end
                table.ClearKeys(SelectedGroup.Choices)

                SelectedGroup:SetValue("user")
                SelectedGroup:OnSelect(1, "user")
            end

            Privileges = vgui.Create("DListView", frame)
            Privileges:SetPos(5, 55)
            Privileges:SetSize(300, 420)
            Privileges:AddColumn("Available privileges")

            SelectedPrivs = vgui.Create("DListView", frame)
            SelectedPrivs:SetPos(340, 55)
            SelectedPrivs:SetSize(295, 420)
            SelectedPrivs:AddColumn("Selected Privileges")

            function SelectedGroup:OnSelect(index, value, data)
                if not FAdmin.Access.Groups[value] then return end

                RemGroup:SetDisabled(false)
                if table.HasValue(FAdmin.Access.ADMIN, value) then
                    RemGroup:SetDisabled(true)
                end

                Privileges:Clear()
                SelectedPrivs:Clear()

                for priv, _ in SortedPairs(FAdmin.Access.Privileges) do
                    if FAdmin.Access.Groups[value].PRIVS[priv] then
                        SelectedPrivs:AddLine(priv)
                    else
                        Privileges:AddLine(priv)
                    end
                end

                if nmbrImmunity then
                    nmbrImmunity:SetText(FAdmin.Access.Groups[value].immunity or "")
                    if table.HasValue({"superadmin", "admin", "user", "noaccess"}, string.lower(value)) then
                        nmbrImmunity:SetDisabled(true)
                        nmbrImmunity:SetEditable(false)
                    else
                        nmbrImmunity:SetDisabled(false)
                        nmbrImmunity:SetEditable(true)
                    end
                end
            end
            SelectedGroup:SetValue("user")
            SelectedGroup:OnSelect(1, "user")

            AddPriv = vgui.Create("DButton", frame)
            AddPriv:SetPos(310, 55)
            AddPriv:SetSize(25, 25)
            AddPriv:SetText(">")
            AddPriv.DoClick = function()
                for k,v in pairs(Privileges:GetSelected()) do
                    local priv = v.Columns[1]:GetValue()
                    RunConsoleCommand("FAdmin", "AddPrivilege", SelectedGroup:GetValue(), priv)
                    SelectedPrivs:AddLine(priv)
                    Privileges:RemoveLine(v.m_iID)
                end
            end

            RemPriv = vgui.Create("DButton", frame)
            RemPriv:SetPos(310, 85)
            RemPriv:SetSize(25, 25)
            RemPriv:SetText("<")
            RemPriv.DoClick = function()
                for k,v in pairs(SelectedPrivs:GetSelected()) do
                    local priv = v.Columns[1]:GetValue()
                    if SelectedGroup:GetValue() == LocalPlayer():GetUserGroup() and priv == "SetAccess" then
                        return Derma_Message("You shouldn't be removing SetAccess. It will make you unable to edit the groups. This is preventing you from locking yourself out of the system.", "Clever move.")
                    end
                    RunConsoleCommand("FAdmin", "RemovePrivilege", SelectedGroup:GetValue(), priv)
                    Privileges:AddLine(priv)
                    SelectedPrivs:RemoveLine(v.m_iID)
                end
            end

            lblImmunity = vgui.Create("DLabel", frame)
            lblImmunity:SetPos(340, 30)
            lblImmunity:SetText("Immunity number (higher is more immune)")
            lblImmunity:SizeToContents()

            nmbrImmunity = vgui.Create("DTextEntry", frame)
            nmbrImmunity:SetPos(545, 28)
            nmbrImmunity:SetWide(90)
            nmbrImmunity:SetNumeric(true)
            nmbrImmunity:SetText(FAdmin.Access.Groups.user.immunity)
            nmbrImmunity:SetDisabled(true)
            nmbrImmunity:SetEditable(false)
            nmbrImmunity.OnEnter = function(self) RunConsoleCommand("FAdmin", "SetImmunity", SelectedGroup:GetValue(), self:GetValue()) end

        end
    },
    {
        enabled = true,
        permission = "UnBan",
        name = "Unban", 
        icon = "vliss/vliss_btn_unban.png",
        buttonNormal = Color(163, 135, 79, 255),
        buttonHover = Color(163, 135, 79, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function()

            local selectedLine

            local Frame = vgui.Create("DFrame")
            Frame:SetSize(740, 600)
            Frame:SetTitle("Unban Details")
            Frame:SetDraggable(true)
            Frame:ShowCloseButton(true)
            Frame:SetBackgroundBlur(true)
            Frame:SetDrawOnTop(true)

            local BanList = vgui.Create("DListView", Frame)
            BanList:StretchToParent(5, 55, 5, 5)
            BanList:AddColumn("SteamID")
            BanList:AddColumn("Name")
            BanList:AddColumn("Time")
            BanList:AddColumn("Reason")
            BanList:AddColumn("Banned by")
            BanList:AddColumn("Banned by SteamID")

            local unban = vgui.Create("DButton", Frame)
            unban:SetText("Unban")
            unban:SetPos(695, 25)
            unban:SetSize(40, 25)

            function unban:DoClick()
                if IsValid(selectedLine) then
                    RunConsoleCommand("_FAdmin", "Unban", string.upper(selectedLine:GetValue(1)))
                    BanList:RemoveLine(selectedLine:GetID())
                end
            end

            local edit = vgui.Create("DButton", Frame)
            edit:SetText("Edit")
            edit:SetPos(650, 25)
            edit:SetSize(40, 25)
            function edit:DoClick()
                if not selectedLine then return end
                showBanWindow(selectedLine:GetValue(1), selectedLine.name, selectedLine.time > os.time() and (selectedLine.time - os.time()) / 60 or 0, selectedLine.reason)
                Frame:Close()
            end

        local function RetrieveBans(len)
            local bans = net.ReadTable()
            for k,v in pairs(bans) do               local Line = BanList:AddLine(
                        k,
                        v.name or "N/A",
                        (tonumber(v.time or "") and FAdmin.PlayerActions.ConvertBanTime((tonumber(v.time) - os.time()) / 60)) or "N/A",
                        v.reason or "",
                        v.adminname or "",
                        v.adminsteam or "")
                    Line.name = v.name
                    Line.time = v.time
                    Line.reason = v.reason

                    function Line:OnSelect()
                        selectedLine = self
                    end
                end
            end
            net.Receive("FAdmin_retrievebans", RetrieveBans)
            RunConsoleCommand("_FAdmin", "RequestBans")

            Frame:Center()
            Frame:MakePopup()
            Frame:DoModal()
        end
    },
    {
        enabled = true,
        permission = "Restrict",
        name = "Weapon Restrictions", 
        icon = "vliss/vliss_btn_weap.png",
        buttonNormal = Color(64, 105, 126, 255),
        buttonHover = Color(64, 105, 126, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function()

            local function FillMenu(menu, SpawnName, GroupName)
                menu:AddOption("unrestrict", function() RunConsoleCommand("_FAdmin", "UnRestrictWeapon", SpawnName) end)

                menu:AddSpacer("")
                for k,v in SortedPairsByMemberValue(FAdmin.Access.Groups, "ADMIN", true) do
                    menu:AddOption(k, function() RunConsoleCommand("_FAdmin", "RestrictWeapon", SpawnName, k) end)
                end
            end

            local frame = vgui.Create("DFrame")
            frame:SetTitle("Restrict weapons")
            frame:SetSize(ScrW() / 2, ScrH() - 50)
            frame:Center()
            frame:SetVisible(true)
            frame:MakePopup()

            local WeaponMenu = vgui.Create("FAdmin_weaponPanel", frame)
            WeaponMenu.HideAmmo = true
            function WeaponMenu:DoGiveWeapon(SpawnName)
                local menu = DermaMenu()
                menu:SetPos(gui.MouseX(), gui.MouseY())
                FillMenu(menu, SpawnName)
                menu:Open()
            end
            WeaponMenu:BuildList()
            WeaponMenu:StretchToParent(0,25,0,0)
        end
    },
}

Vliss.DarkRP.ServerSettings = {
    {
        enabled = true,
        permission = "PickUpPlayers",
        convarAvail = true,
        convar = "sbox_playershurtplayers",
        convarDefault = 1,
        name = "Players Hurt Players", 
        status = "Disabled",
        icon = "vliss/vliss_btn_switch_on.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        toggledStatus = "Enabled",
        toggledIcon = "vliss/vliss_btn_switch_off.png",
        toggledButtonNormal = Color(71, 145, 94, 255),
        toggledButtonHover = Color(71, 145, 94, 200),
        toggledTextNormal = Color(255, 255, 255, 255),
        toggledTextHover = Color(255, 255, 255, 255),
        func = function()
            local sbox_playershurtplayers = GetConVar("sbox_playershurtplayers")
            local val = sbox_playershurtplayers:GetBool()
            RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_playershurtplayers", val and 0 or 1)
        end
    },
    {
        enabled = true,
        permission = "PickUpPlayers",
        convarAvail = true,
        convar = "sbox_godmode",
        convarDefault = 1,
        name = "Global Godmode", 
        status = "Disabled",
        icon = "vliss/vliss_btn_switch_on.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        toggledStatus = "Enabled",
        toggledIcon = "vliss/vliss_btn_switch_off.png",
        toggledButtonNormal = Color(71, 145, 94, 255),
        toggledButtonHover = Color(71, 145, 94, 200),
        toggledTextNormal = Color(255, 255, 255, 255),
        toggledTextHover = Color(255, 255, 255, 255),
        func = function()
            local sbox_godmode = GetConVar("sbox_godmode")
            local val = sbox_godmode:GetBool()
            RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_godmode", val and 0 or 1)
        end
    },
    {
        enabled = true,
        permission = "PickUpPlayers",
        convarAvail = true,
        convar = "sbox_noclip",
        convarDefault = 1,
        name = "Global Noclip", 
        status = "Disabled",
        icon = "vliss/vliss_btn_switch_on.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        toggledStatus = "Enabled",
        toggledIcon = "vliss/vliss_btn_switch_off.png",
        toggledButtonNormal = Color(71, 145, 94, 255),
        toggledButtonHover = Color(71, 145, 94, 200),
        toggledTextNormal = Color(255, 255, 255, 255),
        toggledTextHover = Color(255, 255, 255, 255),
        func = function()
            local sbox_noclip = GetConVar("sbox_noclip")
            local val = sbox_noclip:GetBool()
            RunConsoleCommand("_FAdmin", "ServerSetting", "sbox_noclip", val and 0 or 1)
        end
    },
    {
        enabled = true,
        permission = "Logging",
        convarAvail = true,
        convar = "FAdmin_logging",
        convarDefault = 1,
        name = "Logging", 
        status = "Disabled",
        icon = "vliss/vliss_btn_switch_on.png",
        buttonNormal = Color(124, 51, 50, 255),
        buttonHover = Color(124, 51, 50, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        toggledStatus = "Enabled",
        toggledIcon = "vliss/vliss_btn_switch_off.png",
        toggledButtonNormal = Color(71, 145, 94, 255),
        toggledButtonHover = Color(71, 145, 94, 200),
        toggledTextNormal = Color(255, 255, 255, 255),
        toggledTextHover = Color(255, 255, 255, 255),
        func = function()
            local logging = CreateConVar("FAdmin_logging", 1, {FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE})
            RunConsoleCommand("_Fadmin", "Logging", logging:GetBool() and 0 or 1)
        end
    },
    {
        enabled = true,
        permission = "ServerSetting",
        name = "Set Server Limits", 
        icon = "vliss/vliss_btn_limits.png",
        buttonNormal = Color(163, 135, 79, 255),
        buttonHover = Color(163, 135, 79, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function()
            local frame = vgui.Create("DFrame")
            frame:SetTitle("Set Limits")
            frame:SetSize(300, 460)
            frame:Center()
            frame:SetVisible(true)
            frame:MakePopup()

            local PanelList = vgui.Create("DPanelList", frame)
            PanelList:StretchToParent(5, 25, 5, 5)
            PanelList:EnableVerticalScrollbar(true)

            local Form = vgui.Create("DForm", PanelList)
            Form:SetName("")

            local Settings = util.KeyValuesToTable(file.Read("gamemodes/sandbox/sandbox.txt", "GAME")) -- All SBox limits are in here :D
            for k, v in SortedPairs(Settings.settings or {}) do
                if v.type == "Numeric" then
                    local left, right = Form:NumberWang(v.text, nil, v.low or 0, v.high or 1000, v.decimals or 0 )
                    left:SetFloatValue(GetConVar(v.name):GetFloat())
                    left:SetValue(GetConVar(v.name):GetFloat())

                    function left:OnValueChanged(val)
                        if val == GetConVar(v.name):GetFloat() then
                            return
                        end
                        RunConsoleCommand("_FAdmin", "ServerSetting", v.name, val)
                    end
                end
            end
            PanelList:AddItem(Form)
        end
    },
    {
        enabled = true,
        permission = "CreateMOTD",
        name = "Set MOTD Page", 
        icon = "vliss/vliss_btn_motd.png",
        buttonNormal = Color(145, 71, 101, 255),
        buttonHover = Color(145, 71, 101, 200),
        textNormal = Color(255, 255, 255, 255),
        textHover = Color(255, 255, 255, 255),
        func = function()
            local MOTDPage = CreateConVar("_FAdmin_MOTDPage", "default", {FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE})
            local Window = vgui.Create("DFrame")
            Window:SetTitle("Set MOTD page")
            Window:SetDraggable(false)
            Window:ShowCloseButton(false)
            Window:SetBackgroundBlur(true)
            Window:SetDrawOnTop(true)

            local InnerPanel = vgui.Create("DPanel", Window)
            InnerPanel:SetPaintBackground(false) -- clear background

            local Text = vgui.Create("DLabel", InnerPanel)
            Text:SetText("Set the MOTD page. Click default to reset the MOTD to default.")
            Text:SizeToContents()
            Text:SetContentAlignment(5)
            Text:SetTextColor(color_white)

            local TextEntry = vgui.Create("DTextEntry", InnerPanel)
            TextEntry:SetText(MOTDPage:GetString())
            TextEntry.OnEnter = function() Window:Close() RunConsoleCommand("_FAdmin", "motdpage", TextEntry:GetValue()) end
            function TextEntry:OnFocusChanged(changed)
                self:RequestFocus()
                self:SelectAllText(true)
            end

            local ButtonPanel = vgui.Create("DPanel", Window )
            ButtonPanel:SetPaintBackground(false) -- clear background
            ButtonPanel:SetTall( 30 )

            local Button = vgui.Create("DButton", ButtonPanel )
                Button:SetText("OK")
                Button:SizeToContents()
                Button:SetTall( 20 )
                Button:SetWide( Button:GetWide() + 20 )
                Button:SetPos( 5, 5 )
                Button.DoClick = function() Window:Close() RunConsoleCommand("_FAdmin", "motdpage", TextEntry:GetValue()) end

            local ButtonDefault = vgui.Create("DButton", ButtonPanel)
                ButtonDefault:SetText("Default")
                ButtonDefault:SizeToContents()
                ButtonDefault:SetTall(20)
                ButtonDefault:SetWide(Button:GetWide() + 20)
                ButtonDefault:SetPos(5, 5)
                ButtonDefault.DoClick = function() Window:Close() RunConsoleCommand("_FAdmin", "motdpage", "default") end
                ButtonDefault:MoveRightOf(Button, 5)

            local ButtonCancel = vgui.Create("DButton", ButtonPanel)
                ButtonCancel:SetText("Cancel")
                ButtonCancel:SizeToContents()
                ButtonCancel:SetTall(20)
                ButtonCancel:SetWide(Button:GetWide() + 20)
                ButtonCancel:SetPos(5, 5)
                ButtonCancel.DoClick = function() Window:Close() end
                ButtonCancel:MoveRightOf(ButtonDefault, 5)

            ButtonPanel:SetWide(Button:GetWide() + 5 + ButtonCancel:GetWide() + 10 + ButtonDefault:GetWide() + 5)

            local w, h = Text:GetSize()
            w = math.max( w, 400 )

            Window:SetSize( w + 50, h + 25 + 75 + 10 )
            Window:Center()

            InnerPanel:StretchToParent( 5, 25, 5, 45 )

            Text:StretchToParent( 5, 5, 5, 35 )

            TextEntry:StretchToParent( 5, nil, 5, nil )
            TextEntry:AlignBottom( 5 )

            TextEntry:RequestFocus()

            ButtonPanel:CenterHorizontal()
            ButtonPanel:AlignBottom( 8 )

            Window:MakePopup()
            Window:DoModal()
        end
    },
}

