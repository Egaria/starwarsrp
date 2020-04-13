--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------]]
--storm troopers
TEAM_STPVT = DarkRP.createJob("StormTrooperPVT", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper PVT]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stpvt", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 12;
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STPFC = DarkRP.createJob("StormTrooperPFC", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper PFC]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stpfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 13;
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STCPL = DarkRP.createJob("StormTrooperCPL", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper CPL]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stcpl", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 14;
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STSGT = DarkRP.createJob("StormTrooperSGT", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper SGT]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stsgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 15;
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STSSGT = DarkRP.createJob("StormTrooperSSGT", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper SSGT]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stssgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 16;
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STLT = DarkRP.createJob("StormTrooperLT", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper LT]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stlt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 17;
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STCPT = DarkRP.createJob("StormTrooperCPT", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper CPT]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "stcpt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 18;
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


TEAM_STMJR = DarkRP.createJob("StormTrooperMJR", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper MJR]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "stmjr", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 19;
	PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_STCOL = DarkRP.createJob("StormTrooperCOL", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper COL]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","stunstick"}, -- Additional weapons
    command = "stcol", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 20;
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,5) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_STBATTCOM = DarkRP.createJob("Storm Trooper BATT Commander", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper Commander]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "stbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 21;
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,3) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license",
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_STREGCOM = DarkRP.createJob("Storm Trooper REG Commander", { -- Name
    color = Color(211, 219, 222, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a storm trooper Commander]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "stregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 22;
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,4) ply:SetBodygroup(3,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license",
	category = "StormTroopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("STREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
----------SHOCK TROOPERS
---

TEAM_SKPVT = DarkRP.createJob("ShockTrooperPVT", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shockTrooperPVT]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "skpvt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 70;
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Shock Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKPFC = DarkRP.createJob("ShockTrooperPFC", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shockTrooper PFC]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "skpfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 71;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKCPL = DarkRP.createJob("ShockTrooperCPL", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shockTrooper CPL]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "skcpl", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 72;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKSGT = DarkRP.createJob("ShockTrooperSGT", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper SGT]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "sksgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 73;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKSSGT = DarkRP.createJob("ShockTrooperSSGT", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper SSGT]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "skssgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 74;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKLT = DarkRP.createJob("ShockTrooperLT", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper LT]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "sklt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 75;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKCPT = DarkRP.createJob("ShockTrooperCPT", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper CPT]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","dc17grapple"}, -- Additional weapons
    command = "skcpt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 76;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


TEAM_SKMJR = DarkRP.createJob("ShockTrooperMJR", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper MJR]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","dc17grapple"}, -- Additional weapons
    command = "skmjr", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 77;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKCOL = DarkRP.createJob("ShockTrooperCOL", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper COL]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","stunstick","weapon_752_e60r","dc17grapple"}, -- Additional weapons
    command = "skcol", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 78;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,5) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_SKBATTCOM = DarkRP.createJob("Shock Trooper BATT Commander", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper Commander]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic","dc17grapple","weapon_752_e60r"}, -- Additional weapons
    command = "skbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 79;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,4) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SKREGCOM = DarkRP.createJob("Shock Trooper REG Commander", { -- Name
    color = Color(192, 27, 185, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shock trooper Commander]],  -- Job description
    weapons = {"weapon_752bf3_rt97c", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","dc17grapple","weapon_752_westar34","stunstick","weapon_cuff_elastic","weapon_752_e60r"}, -- Additional weapons
    command = "skregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 80;
	category = "Shock Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,4) ply:SetBodygroup(3,1) ply:SetSkin(4) return CLIENT end,
	hasLicense = true, -- Has a license",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SKREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
----------- Sand Troopers
---------------------
----------------
TEAM_SDPVT = DarkRP.createJob("SandTrooperPVT", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperPVT]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdpvt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 82;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
 TEAM_SDPFC = DarkRP.createJob("SandTrooperPFC", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperPFC]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdpfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 83;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
 TEAM_SDCPL = DarkRP.createJob("SandTrooperCPL", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperCPL]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdcpl", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 84;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

 TEAM_SDSGT = DarkRP.createJob("SandTrooperSGT", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperSGT]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdsgt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
	category = "Sand Troopers",
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 85;
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
 TEAM_SDSSGT = DarkRP.createJob("SandTrooperSSGT", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperSSGT]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdssgt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 86;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,0) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
 TEAM_SDLT = DarkRP.createJob("SandTrooperLT", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperLT]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdlt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
	category = "Sand Troopers",
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 87;
	PlayerSpawn = function(ply) ply:SetHealth(350) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,0) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

 TEAM_SDCPT = DarkRP.createJob("SandTrooperCPT", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperCPT]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys"}, -- Additional weapons
    command = "sdcpt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 88;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
  TEAM_SDMJR = DarkRP.createJob("SandTrooperMJR", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperMJR]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "sdmjr", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 89;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
  TEAM_SDCOL = DarkRP.createJob("SandTrooperCOL", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperCOL]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","stunstick"}, -- Additional weapons
    command = "sdcol", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 90;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,5) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

  TEAM_SDBATTCOM = DarkRP.createJob("SandTrooperBATTCOMM", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooper COMMANDER]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "sdbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 91;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,3) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
  TEAM_SDREGCOM = DarkRP.createJob("SandTrooperREGCOMM", { -- Name
    color = Color(209, 200, 75, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/sandtrooper.mdl", -- Player model
    description = [[become a ShadowTrooper COMMANDER]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "sdregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 92;
	category = "Sand Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,4) ply:SetBodygroup(3,1) ply:SetSkin(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


--------------------------------- Shadow troopers
-----------------------------------
------------------------------
TEAM_SDTPVT = DarkRP.createJob("ShadowTrooperPVT", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a ShadowTrooperPVT]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtpvt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 23;
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Shadow Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTPFC = DarkRP.createJob("ShadowTrooperPFC", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a ShadowTrooper PFC]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtpfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 46, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 24;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTCPL = DarkRP.createJob("ShadowTrooperCPL", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a ShadowTrooper CPL]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtcpl", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 47, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 25;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTSGT = DarkRP.createJob("ShadowTrooperSGT", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper SGT]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtsgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 48, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 26;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTSSGT = DarkRP.createJob("ShadowTrooperSSGT", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper SSGT]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtssgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 49, -- Salary
	category = "Shadow Troopers",
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 27;
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTLT = DarkRP.createJob("ShadowTrooperLT", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper LT]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtlt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 50, -- Salary
	category = "Shadow Troopers",
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 28;
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTCPT = DarkRP.createJob("ShadowTrooperCPT", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper CPT]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo"}, -- Additional weapons
    command = "sdtcpt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 51, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 29;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


TEAM_SDTMJR = DarkRP.createJob("ShadowTrooperMJR", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper MJR]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "sdtmjr", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 52, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 30;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SDTCOL = DarkRP.createJob("ShadowTrooperCOL", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper COL]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo","weapon_752bf3_binoculars","stunstick"}, -- Additional weapons
    command = "sdtcol", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 53, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 31;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,5) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_SDTBATTCOM = DarkRP.createJob("Shadow Trooper BATT Commander", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper Commander]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "sdtbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 54, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 54;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,3) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_SDTREGCOM = DarkRP.createJob("Shadow Trooper REG Commander", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a shadow trooper Commander]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_camo","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "sdtregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 55, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 55;
	category = "Shadow Troopers",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,4) ply:SetBodygroup(3,1) ply:SetSkin(2) return CLIENT end,
	hasLicense = true, -- Has a license",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SDTREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})









---other
TEAM_GRANDADMIRAL = DarkRP.createJob("Fleet Grand Admiral", { -- Name
    color = Color(61, 100, 50, 1), -- Team color
    model = "models/kriegsyntax/starwars/grandadmiral_playermodel.mdl", -- Player model
    description = [[become a fleet grand admiral]],  -- Job description
    weapons = {"weapon_752bf3_scoutblaster","keys","weapon_752bf3_binoculars","weapon_752bf3_se14c"}, -- Additional weapons
    command = "grandadmiral", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 200, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 60;
	category = "Fleets",
	PlayerSpawn = function(ply) ply:SetHealth(700) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("GrandAdmiral") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_DEADFLEET = DarkRP.createJob("Zombie-Fleet", { -- Name
    color = Color(61, 100, 50, 1), -- Team color
    model = "models/kriegsyntax/starwars/deathtroopers/lieutenant_playermodel.mdl", -- Player model
    description = [[become a dead fleet AND BITE ALL THE TROOPERS!]],  -- Job description
    weapons = {"weapon_752bf3_scoutblaster","keys","weapon_752bf3_binoculars","weapon_fists","stunstick","dc17grapple"}, -- Additional weapons
    command = "deadfleet", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 201, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 61;
	PlayerSpawn = function(ply) ply:SetHealth(1200) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Events",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("DEADFLEET") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_DEADTROOPER = DarkRP.createJob("Zombie-TROOPER", { -- Name
    color = Color(61, 100, 50, 1), -- Team color
    model = "models/kriegsyntax/starwars/deathtroopers/stormtrooper_playermodel.mdl", -- Player model
    description = [[become a dead TROOPER AND BITE ALL THE TROOPERS!]],  -- Job description
    weapons = {"weapon_752bf3_scoutblaster","keys","weapon_fists","stunstick","dc17grapple"}, -- Additional weapons
    command = "deadtrooper", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 202, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 62;
	PlayerSpawn = function(ply) ply:SetHealth(1100) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Events",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("DEADTROOPER") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
----- MEDICS
-----------
TEAM_MEDPVT = DarkRP.createJob("MedicPVT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medpvt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 58, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 40;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDPFC = DarkRP.createJob("MedicPFC", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medpfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 59;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDCPL = DarkRP.createJob("MedicCPL", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medCPL", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 60;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDSGT = DarkRP.createJob("MedicSGT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medsgt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 61;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDSSGT = DarkRP.createJob("MedicSSGT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medssgt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 62;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDLT = DarkRP.createJob("MedicLT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medlt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 63;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(350) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDCPT = DarkRP.createJob("MedicCPT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medcpt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 64;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDMJR = DarkRP.createJob("MedicMJR", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit"}, -- Additional weapons
    command = "medmjr", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 65;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDCOL = DarkRP.createJob("MedicCOL", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_e11", "weapon_752bf3_dh17","keys","weapon_medkit","stunstick","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "medcol", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 66;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDBATTCOM = DarkRP.createJob("Medic BATT COMMANDER", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic","weapon_medkit"}, -- Additional weapons
    command = "medbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 67;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_MEDREGCOM = DarkRP.createJob("Medic REG Commander", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_stormsurgeon/stormsurgeon.mdl", -- Player model
    description = [[become a MEDIC and heavily RP]],  -- Job description
    weapons = {"weapon_752bf3_t21", "weapon_752bf3_dh17","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic","weapon_medkit"}, -- Additional weapons
    command = "medregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 68;
	category = "Medics",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) ply:SetBodygroup(3,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("MEDREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
---
--501sts



TEAM_501PVT = DarkRP.createJob("501STPVT", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st PVT]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501pvt", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 12;
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501PVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("JUDGE") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501PFC = DarkRP.createJob("501STPFC", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st PFC]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501pfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 13;
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501PFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501CPL = DarkRP.createJob("501STCPL", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st CPL]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501cpl", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 14;
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501CPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501SGT = DarkRP.createJob("501STSGT", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st SGT]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501sgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 15;
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,6) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501SGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501SSGT = DarkRP.createJob("501STSSGT", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st SSGT]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501ssgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 16;
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501SSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501LT = DarkRP.createJob("501STLT", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st LT]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501lt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 17;
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501LT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501CPT = DarkRP.createJob("501STCPT", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st CPT]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys"}, -- Additional weapons
    command = "501cpt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 18;
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501CPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


TEAM_501MJR = DarkRP.createJob("501STMJR", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st MJR]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "501mjr", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 19;
	PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,2) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501MJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_501COL = DarkRP.createJob("501STCOL", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st COL]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick"}, -- Additional weapons
    command = "501col", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 20;
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,5) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license,
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501COL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_501BATTCOM = DarkRP.createJob("501st BATT Commander", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st Commander]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "501battcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 21;
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,3) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license",
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501BATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_501REGCOM = DarkRP.createJob("501st REG Commander", { -- Name
    color = Color(0, 149, 229, 255), -- Team color
    model = "models/nate159/swbf2015/playermodels/stormtrooper.mdl", -- Player model
    description = [[become a 501st Commander]],  -- Job description
    weapons = {"weapon_752bf3_ee3","weapon_752bf3_dlt19","weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "501regcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 22;
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,4) ply:SetBodygroup(3,0) ply:SetSkin(5) return CLIENT end,
	hasLicense = true, -- Has a license",
	category = "501STs",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("501REGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

-- NTs
TEAM_NTPVT = DarkRP.createJob("NTPVT", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic","taser","arrest_stick","unarrest_stick"}, -- Additional weapons
    command = "ntpvt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 58, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 40;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTPFC = DarkRP.createJob("NTPFC", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","arrest_stick","unarrest_stick","stunstick","taser","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntpfc", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 59;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTCPL = DarkRP.createJob("NTCPL", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntCPL", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 60;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTSGT = DarkRP.createJob("NTSGT", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntsgt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 61;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTSSGT = DarkRP.createJob("NTSSGT", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntssgt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 62;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTLT = DarkRP.createJob("NTLT", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntlt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 63;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(350) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTCPT = DarkRP.createJob("NTCPT", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntcpt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 64;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTMJR = DarkRP.createJob("NTMJR", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntmjr", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 65;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,0) ply:SetBodygroup(2,1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTCOL = DarkRP.createJob("NTCOL", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic","stunstick","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "ntcol", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 66;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTBATTCOM = DarkRP.createJob("NT BATT COMMANDER", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 67;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_NTREGCOM = DarkRP.createJob("NT REG Commander", { -- Name
    color = Color(255, 247, 0, 255), -- Team color
    model = "models/player/hydro/novatrooper/novatrooper.mdl", -- Player model
    description = [[Become a Nova Trooper, NT reg' is an elite regiment]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","arrest_stick","unarrest_stick","keys","weapon_752bf3_binoculars","taser","stunstick","weapon_cuff_elastic","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "ntregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 68;
	category = "NovaTroopers",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetBodygroup(2,0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("NTREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SITHSTALKER = DarkRP.createJob("SITH STALKER", { -- Name
    color = Color(174, 254, 37, 255), -- Team color
    model = "models/nate159/req/swtfu/dark_stalker.mdl", -- Player model
    description = [[VIP job, you are a SithStalker, you take orders from fleets,Darth Vader, The Emperor]],  -- Job description
    weapons = {"keys","weapon_lightsaber","weapon_cuff_elastic","weapon_camo"}, -- Additional weapons
    command = "sithstalker", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 70, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 160;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(9500) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SITHSTALKER") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SITHMAST = DarkRP.createJob("Sith Master", { -- Name
    color = Color(174, 254, 37, 255), -- Team color
    model = "models/grealms/characters/revan_real/revan.mdl", -- Player model
    description = [[donation job, you are a Sith Master, you can train your apprentices and the darths]],  -- Job description
    weapons = {"keys","weapon_lightsaber","forcechoke"}, -- Additional weapons
    command = "sithm", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 70, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 30;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(8000) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SITHM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_DARTH = DarkRP.createJob("Darth", { -- Name
    color = Color(174, 254, 37, 255), -- Team color
    model = "models/player/darth_revan.mdl", -- Player model
    description = [[donation job, you are a darth, you are under sith master]],  -- Job description
    weapons = {"keys","weapon_lightsaber"}, -- Additional weapons
    command = "darth", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 70, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 32;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(6800) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("DARTH") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_SITHAPP = DarkRP.createJob("Sith Apprentice", { -- Name
    color = Color(174, 254, 37, 255), -- Team color
    model = "models/kriegsyntax/sw_752/meleetrooper_est.mdl", -- Player model
    description = [[donation job, you are a Sith Apprantice]],  -- Job description
    weapons = {"keys","weapon_lightsaber"}, -- Additional weapons
    command = "sithapp", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 70, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 16;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(5000) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("SITHAPP") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

---NTS

TEAM_RGPVT = DarkRP.createJob("RGPVT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empire's head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgpvt", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 58, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 40;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) ply:SetBodygroup(1,6) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGPFC = DarkRP.createJob("RGPFC", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgpfc", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 59;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) ply:SetBodygroup(1,6) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGCPL = DarkRP.createJob("RGCPL", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgCPL", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 60;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(200) ply:SetGravity(1) ply:SetBodygroup(1,6) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGSGT = DarkRP.createJob("RGSGT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgsgt", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 61;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(250) ply:SetGravity(1) ply:SetBodygroup(1,6) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGSSGT = DarkRP.createJob("RGSSGT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgssgt", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 62;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,0) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGLT = DarkRP.createJob("RGLT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rglt", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 63;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(350) ply:SetGravity(1) ply:SetBodygroup(1,1) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGLT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGCPT = DarkRP.createJob("RGCPT", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgcpt", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 64;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,2) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGCPT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGMJR = DarkRP.createJob("RGMJR", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgmjr", -- Command to become the job
    max = 8, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 65;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) ply:SetBodygroup(1,3) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGCOL = DarkRP.createJob("RGCOL", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic","stunstick","weapon_752bf3_binoculars"}, -- Additional weapons
    command = "rgcol", -- Command to become the job
    max = 1, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 66;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) ply:SetBodygroup(1,4) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGCOL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGBATTCOM = DarkRP.createJob("RG BATT COMMANDER", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgbattcom", -- Command to become the job
    max = 1, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 67;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,5) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_RGREGCOM = DarkRP.createJob("RG REG Commander", { -- Name
    color = Color(255, 0, 0, 255), -- Team color
    model = "models/player/hydro/imperial_royal_stormtrooper/royal_stormtrooper.mdl", -- Player model
    description = [[Become a Royal guard and be the personal body guard of the empires head lords.]],  -- Job description
    weapons = {"weapon_752bf3_dlt19", "weapon_752bf3_dl44","keys","weapon_752bf3_binoculars","stunstick","weapon_cuff_elastic","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"}, -- Additional weapons
    command = "rgregcom", -- Command to become the job
    max = 1, -- Maximum amourg of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 68;
	category = "RGs",
	PlayerSpawn = function(ply) ply:SetHealth(650) ply:SetGravity(1) ply:SetBodygroup(1,5) return CLIERG end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIERG or ply:IsUserGroup("RGREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


TEAM_REC = DarkRP.createJob("Recruit", { -- Name
    color = Color(82, 82, 82, 255), -- Team color
    model = "models/player/b4p/b4p_imperial.mdl",  --"models/kriegsyntax/starwars/nco_playermodel.mdl", -- Player model
    description = [[you are a recruit , switch job or wait to be trained!]],  -- Job description
    weapons = {"keys"}, -- Additional weapons
    command = "rec", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 20, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 1;
	category = "Recruit",
	hasLicense = false, -- Has a license
	
})


TEAM_AOD = DarkRP.createJob("AdminOnDuty", { -- Name
    color = Color(238, 99, 99, 255), -- Team color
    model = {"models/player/gman_high.mdl","models/player/combine_super_soldier.mdl"}, -- Player model
    description = [[Be an Admin and help the server]],  -- Job description
    weapons = {"weapon_physgun","gmod_tool"}, -- Additional weapons
    command = "aod", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 1, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 100;
	hasLicense = true, -- Has a license
	PlayerSpawn = function(ply) ply:SetHealth(1000) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("mod") or ply:IsUserGroup("TMod") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is only for admins!" 
})

TEAM_JUDGE = DarkRP.createJob("Judge On Duty", { -- Name
    color = Color(238, 99, 99, 255), -- Team color
    model = {"models/player/breen.mdl"}, -- Player model
    description = [[Be an judge and help the server when you need to Judge players for what they did]],  -- Job description
    weapons = {"weapon_physgun","gmod_tool"}, -- Additional weapons
    command = "judge", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 101;
	hasLicense = true, -- Has a license
	PlayerSpawn = function(ply) ply:SetHealth(1000) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("mod") or ply:IsUserGroup("TMod") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("JUDGE") end,
		CustomCheckFailMsg = "This job is only for Judges!" 
})


TEAM_TP = DarkRP.createJob("TP PVT", {
   color = Color(0, 153, 255, 255),
   model = {"models/player/sgg/starwars/tie_pilot.mdl"},
   description = [[You are a Tie Pilot]],
   weapons = {"weapon_752bf3_scoutblaster"},
   command = "tppvt",
   max = 0, -- Maximum amount of said job
    salary = 80, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 1;
	hasLicense = true, -- Has a license
	category = "Tie Pilots",
	PlayerSpawn = function(ply) ply:SetHealth(100) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("TPPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is for TP PVTs!" 
})


-- models/player/sgg/starwars/tie_pilot_181st.mdl
TEAM_TPPFC = DarkRP.createJob("Tie Pilot PFC", {
   color = Color(0, 153, 255, 255),
   model = {"models/player/sgg/starwars/tie_pilot.mdl"},
   description = [[You are a Tie Pilot PFC]],
   weapons = {"weapon_752bf3_scoutblaster","keys"},
   command = "tppfc",
   max = 0,
   salary = 250,
   admin = 0,
   vote = false,
   category = "Tie Pilots",
   setorder = 2;
   hasLicense = true, -- Has a license
	PlayerSpawn = function(ply) ply:SetHealth(150) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("TPPFC") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is for TP PVTs!" 
})
TEAM_TPSGT = DarkRP.createJob("Tie Pilot SGT", {
   color = Color(0, 153, 255, 255),
   model = {"models/player/sgg/starwars/tie_pilot.mdl","keys"},
   description = [[You are a Tie Pilot SGT]],
   weapons = {"weapon_752bf3_scoutblaster"},
   command = "tpsgt",
   max = 0,
   salary = 250,
   admin = 0,
   vote = false,
   category = "Tie Pilots",
   setorder = 3;
   hasLicense = true, -- Has a license
	PlayerSpawn = function(ply) ply:SetHealth(350) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("TPSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is for TP PVTs!" 
})

TEAM_TPMJR = DarkRP.createJob("Tie Pilot MJR", {
   color = Color(0, 153, 255, 255),
   model = {"models/player/sgg/starwars/tie_pilot.mdl"},
   description = [[You are a Tie Pilot MJR]],
   weapons = {"weapon_752bf3_scoutblaster","stunstick","keys"},
   command = "tpmjr",
   max = 0,
   salary = 250,
   admin = 0,
   vote = false,
   category = "Tie Pilots",
   setorder = 4;
   hasLicense = true, -- Has a license
	PlayerSpawn = function(ply) ply:SetHealth(450) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("TPMJR") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is for TP PVTs!" 
})

TEAM_TPBATTCOM = DarkRP.createJob("Tie Pilot BATT Commander", {
   color = Color(0, 153, 255, 255),
   model = {"models/player/sgg/starwars/tie_pilot_181st.mdl"},
   description = [[You are a Tie Pilot BATT commander]],
   weapons = {"weapon_752bf3_scoutblaster","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"},
   command = "tpbattcom",
   max = 0,
   salary = 250,
   admin = 0,
   vote = false,
   category = "Tie Pilots",
   setorder = 5;
   hasLicense = true, -- Has a license
	PlayerSpawn = function(ply) ply:SetHealth(550) ply:SetGravity(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("TPBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is for TP PVTs!" 
})

TEAM_TPREGCOM = DarkRP.createJob("Tie Pilot REG Commander", {
   color = Color(0, 153, 255, 255),
   model = {"models/player/sgg/starwars/tie_pilot_181st.mdl"},
   description = [[You are a Tie Pilot REG commander]],
   weapons = {"weapon_752bf3_scoutblaster","keys","weapon_752bf3_binoculars","weapon_752_westar34","stunstick","weapon_cuff_elastic"},
   command = "tpregcom",
   max = 0,
   salary = 250,
   admin = 0,
   vote = false,
   category = "Tie Pilots",
   setorder = 6;
   hasLicense = true, -- Has a license
   PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetSkin(1) return CLIENT end,
	--PlayerDeath = function(ply) GAMEMODE:SetPlayerSpeed(ply, GAMEMODE.Config.walkspeed * 1, GAMEMODE.Config.runspeed * 1) return CLIENT end,
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("TPREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is for TP PVTs!" 
})

-- models/player/luke_skywalker.mdl
TEAM_LUKESKY = DarkRP.createJob("Luke SkyWalker", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/player/luke_skywalker.mdl", -- Player model
    description = [[Become Luke skywalker]],  -- Job description
    weapons = {"keys","weapon_lightsaber","sswep_luke"}, -- Additional weapons
    command = "luke", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 140;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(10000) ply:SetGravity(1) ply:SetRunSpeed(450)  ply:SetJumpPower(1200)  return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("luke") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
-- models/player/b4p/b4p_yoda.mdl

TEAM_DARTHVADER = DarkRP.createJob("Darth Vader", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/player/b4p/b4p_vader.mdl", -- Player model
    description = [[Lead the Empire as lord vader]],  -- Job description
    weapons = {"keys","weapon_lightsaber","sswep_vader","sswep_dvader"}, -- Additional weapons
    command = "DV", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 140;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(10000) ply:SetGravity(1) ply:SetModelScale(1.1, 0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("DarthVader") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_YODA = DarkRP.createJob("Jedi Master Yoda", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/player/b4p/b4p_yoda.mdl", -- Player model
    description = [[Become Jedi master yoda]],  -- Job description
    weapons = {"keys","weapon_lightsaber","sswep_dyoda","sswep_yoda"}, -- Additional weapons
    command = "yoda", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 140;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(10000) ply:SetGravity(1) ply:SetModelScale(0.65, 0) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("yoda") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
-- models/imperial/guard/blackguard.mdl


TEAM_SHADOW = DarkRP.createJob("shadow guard", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/imperial/guard/blackguard.mdl", -- Player model
    description = [[Become a shadow guard]],  -- Job description
    weapons = {"keys","weapon_lightsaber"}, -- Additional weapons
    command = "shadowguard", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 140;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(6500) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("shadow") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
-- models/player/deckboy/boba_pm/boba_pm.mdl


TEAM_BOBBA = DarkRP.createJob("Boba Fett", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/bobafett_tfu.mdl", -- Player model
    description = [[Be bobba feett, a bounty hunter]],  -- Job description
    weapons = {"keys","weapon_lightsaber","weapon_752bf3_ee3","weapon_752bf3_se14c","weapon_752_e60r","dc17grapple"}, -- Additional weapons
    command = "boba", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 140;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(6000) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("bobba") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

-- models/grealms/characters/jedibattlelord/jedibattlelord_04.mdl
TEAM_JEDI = DarkRP.createJob("JEDI", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/grealms/characters/jedibattlelord/jedibattlelord_04.mdl", -- Player model
    description = [[Become Jedi master yoda]],  -- Job description
    weapons = {"keys","weapon_lightsaber"}, -- Additional weapons
    command = "jedi", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 140;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(6000) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("jedi") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_EMPERORPALPATINE = DarkRP.createJob("Emperor Palpatine", { -- Name
    color = Color(174, 254, 37, 1), -- Team color
    model = "models/player/emperor_palpatine.mdl", -- Player model
    description = [[Lead the Empire]],  -- Job description
    weapons = {"keys","weapon_lightsaber","sswep_palpatine"}, -- Additional weapons
    command = "EP", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 120, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 150;
	category = "VIP",
	PlayerSpawn = function(ply) ply:SetHealth(10000) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("EmperorPalpatine") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
--- rebels
  TEAM_REBEL = DarkRP.createJob("REBEL", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/player/sgg/starwars/rebels/r_trooper/male_03.mdl", -- Player model
    description = [[become a REBEL]],  -- Job description
    weapons = {"weapon_752bf3_a280","weapon_cuff_elastic","dc17grapple"}, -- Additional weapons
    command = "rebel", -- Command to become the job
    max = 0, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 500;
	category = "Events",
	PlayerSpawn = function(ply) ply:SetHealth(2500) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("REBEL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

  TEAM_REBELCOM = DarkRP.createJob("REBEL Commander", { -- Name
    color = Color(0, 0, 0, 255), -- Team color
    model = "models/player/sgg/starwars/rebels/r_soldier_urban/male_11.mdl", -- Player model
    description = [[become a REBEL]],  -- Job description
    weapons = {"weapon_752bf3_a280","weapon_cuff_elastic","dc17grapple"}, -- Additional weapons
    command = "rebelcom", -- Command to become the job
    max = 2, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 501;
	category = "Events",
	PlayerSpawn = function(ply) ply:SetHealth(4500) ply:SetGravity(1) return CLIENT end,
	hasLicense = true, -- Has a license
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("REBELCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})


TEAM_SITHDOM = DarkRP.createJob("Sith Denominators", {
   color = Color(0, 0, 0, 255),
   model = {"models/jazzmcfly/jka/eg5/noflicker/jka_eg5.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","keys"},
   command = "SD",
   max = 0,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = false,
   sortOrder = 1000;
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   category = "VIP",
   cook = false,
   PlayerSpawn = function(ply) ply:SetHealth(4500) ply:SetGravity(1) return CLIENT end,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Sith Domination") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   
})
-- Havoc Troopers
TEAM_HTPVT = DarkRP.createJob("Havoc Trooper Recruit", { -- Name
    color = Color(139, 224, 108, 255), -- Team color
    model = "models/ninja/mgs4_haven_trooper.mdl", -- Player model
    description = [[Havoc Troopers are heavy front line troopers that are specially trained to kill, they usually wrok with sith in battle following them all around, they are armed with Imperial Heavy Reapeaters, Cloak and A DLT20A ]],  -- Job description
    weapons = {"keys","weapon_camo","weapon_752bf3_dlt20a","weapon_752bf3_rt97c"}, -- Additional weapons
    command = "hcpvt", -- Command to become the job
    max = 8, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 1;
	PlayerSpawn = function(ply) ply:SetHealth(300) ply:SetGravity(1) ply:SetBodygroup(1,1) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Havoc Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("HTPVT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_HTCPL = DarkRP.createJob("Havoc Trooper", { -- Name
    color = Color(139, 224, 108, 255), -- Team color
    model = "models/ninja/mgs4_haven_trooper.mdl", -- Player model
    description = [[Havoc Troopers are heavy front line troopers that are specially trained to kill, they usually wrok with sith in battle following them all around, they are armed with Imperial Heavy Reapeaters, Cloak and A DLT20A ]],  -- Job description
    weapons = {"keys","weapon_camo","weapon_752bf3_dlt20a","weapon_752bf3_rt97c"}, -- Additional weapons
    command = "hccpl", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 2;
	PlayerSpawn = function(ply) ply:SetHealth(400) ply:SetGravity(1) ply:SetBodygroup(1,2) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Havoc Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("HTCPL") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_HTSGT = DarkRP.createJob("Havoc Trooper Heavy", { -- Name
    color = Color(139, 224, 108, 255), -- Team color
    model = "models/ninja/mgs4_haven_trooper.mdl", -- Player model
    description = [[Havoc Troopers are heavy front line troopers that are specially trained to kill, they usually wrok with sith in battle following them all around, they are armed with Imperial Heavy Reapeaters, Cloak and A DLT20A ]],  -- Job description
    weapons = {"keys","weapon_camo","weapon_752bf3_dlt20a","weapon_752_ihr"}, -- Additional weapons
    command = "hcsgt", -- Command to become the job
    max = 4, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 3;
	PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) ply:SetBodygroup(1,3) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Havoc Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("HTSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_HTSSGT = DarkRP.createJob("Havoc Trooper Squad Leader", { -- Name
    color = Color(139, 224, 108, 255), -- Team color
    model = "models/ninja/mgs4_haven_trooper.mdl", -- Player model
    description = [[Havoc Troopers are heavy front line troopers that are specially trained to kill, they usually wrok with sith in battle following them all around, they are armed with Imperial Heavy Reapeaters, Cloak and A DLT20A ]],  -- Job description
    weapons = {"keys","weapon_camo","weapon_752bf3_dlt20a","weapon_752bf3_rt97c"}, -- Additional weapons
    command = "hcssgt", -- Command to become the job
    max = 6, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 4;
	PlayerSpawn = function(ply) ply:SetHealth(600) ply:SetGravity(1) ply:SetBodygroup(1,4) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Havoc Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("HTSSGT") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})
TEAM_HTBATTCOM = DarkRP.createJob("Havoc Trooper Captain", { -- Name
    color = Color(139, 224, 108, 255), -- Team color
    model = "models/ninja/mgs4_haven_trooper.mdl", -- Player model
    description = [[Havoc Troopers are heavy front line troopers that are specially trained to kill, they usually wrok with sith in battle following them all around, they are armed with Imperial Heavy Reapeaters, Cloak and A DLT20A ]],  -- Job description
    weapons = {"keys","weapon_camo","weapon_752bf3_dlt20a","weapon_752bf3_rt97c"}, -- Additional weapons
    command = "hcbattcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 5;
	PlayerSpawn = function(ply) ply:SetHealth(700) ply:SetGravity(1) ply:SetBodygroup(1,5) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Havoc Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("HTBATTCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_HTREGCOM = DarkRP.createJob("Havoc Trooper Commander", { -- Name
    color = Color(139, 224, 108, 255), -- Team color
    model = "models/ninja/mgs4_haven_trooper.mdl", -- Player model
    description = [[Havoc Troopers are heavy front line troopers that are specially trained to kill, they usually wrok with sith in battle following them all around, they are armed with Imperial Heavy Reapeaters, Cloak and A DLT20A ]],  -- Job description
    weapons = {"keys","weapon_camo","weapon_752bf3_dlt20a","weapon_752bf3_rt97c"}, -- Additional weapons
    command = "hcregcom", -- Command to become the job
    max = 1, -- Maximum amount of said job
    salary = 45, -- Salary
    admin = 0, -- Requires Admin? 1 for yes, 0 for no.
    vote = false, -- Do they need to vote? true for yes, false for no.
    sortOrder = 6;
	PlayerSpawn = function(ply) ply:SetHealth(1000) ply:SetGravity(1) ply:SetBodygroup(1,6) ply:SetSkin(0) return CLIENT end,
	hasLicense = true, -- Has a license
	category = "Havoc Troopers",
	customCheck = function(ply) return CLIENT or ply:IsUserGroup("HTREGCOM") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
		CustomCheckFailMsg = "This job is not for your group!"
})

TEAM_TrialFleet = DarkRP.createJob("Trial Fleet", {
   color = Color(66, 255, 0, 255),
   model = {"models/kriegsyntax/starwars/ensign_playermodel.mdl"},
   description = [[You Are A Trial Fleet]],
   weapons = {"weapon_752bf3_se14c","keys"},
   command = "TF",
   max = 3,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Trial Fleet") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})

TEAM_FLEETENSIGN = DarkRP.createJob("Fleet Ensign", {
   color = Color(66, 255, 0, 255),
   model = {"models/kriegsyntax/starwars/ensign_playermodel.mdl"},
   description = [[You Are A Trial Fleet]],
   weapons = {"weapon_752bf3_se14c","keys"},
   command = "FE",
   max = 3,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Fleet Ensign") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})
TEAM_R2D2 = DarkRP.createJob("R2D2", {
   color = Color(66, 255, 0, 255),
   model = {"models/player/r2d2.mdl"},
   description = [[you are R2D2]],
   weapons = {stunstick,},
   command = "R2",
   max = 10,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("VIP") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "VIP",
})

TEAM_C3PO = DarkRP.createJob("C3PO", {
   color = Color(66, 255, 0, 255),
   model = {"models/player/c3po.mdl"},
   description = [[you are C3PO]],
   weapons = {stunstick,sswep_c3po_talk,sswep_c3po_scream,keys,weapon_cuff_elastic},
   command = "C3PO",
   max = 10,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("VIP") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "VIP",
})

TEAM_FL = DarkRP.createJob("Fleet Lieutenant", {
   color = Color(168, 178, 169, 255),
   model = {"models/kriegsyntax/starwars/lieutenant_playermodel.mdl"},
   description = [[you are a Fleet Lieutenant]],
   weapons = {"weapon_752bf3_se14c","keys"},
   command = "FL",
   max = 3,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   -- CustomCheck
   medic = false,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Fleet Lieutenant") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})

TEAM_FCO = DarkRP.createJob("Fleet Commodore", {
   color = Color(142, 142, 142, 255),
   model = {"models/kriegsyntax/starwars/commodore_playermodel.mdl"},
   description = [[you are a fleet Fleet Commodore]],
   weapons = {"weapon_752bf3_se14c","keys"},
   command = "FC",
   max = 2,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   -- CustomCheck
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Fleet Commodore") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})

TEAM_FC = DarkRP.createJob("Fleet Captain", {
   color = Color(142, 142, 142, 255),
   model = {"models/kriegsyntax/starwars/captain_playermodel.mdl"},
   description = [[you are a Fleet Captain ]],
   weapons = {"weapon_752bf3_se14c","keys"},
   command = "FCA",
   max = 2,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = true,
   candemote = false,
   -- CustomCheck
   
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Fleet Captain") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})

TEAM_FA = DarkRP.createJob("Fleet Admiral", {
   color = Color(142, 142, 142, 255),
   model = {"models/kriegsyntax/starwars/admiral_playermodel.mdl"},
   description = [[you are a fleet Fleet Admiral]],
   weapons = {"weapon_752bf3_se14c","keys"},
   command = "FA",
   max = 1,
   salary = 250,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = false,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Fleet Admiral") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})

TEAM_FG = DarkRP.createJob("Fleet General", {
   color = Color(142, 142, 142, 255),
   model = {"models/kriegsyntax/starwars/general_playermodel.mdl"},
   description = [[you are a Fleet General]],
   weapons = {"keys","weapon_752bf3_binoculars","weapon_752bf3_se14c"},
   command = "FG",
   max = 1,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = false,
   PlayerSpawn = function(ply) ply:SetHealth(500) ply:SetGravity(1) return CLIENT end,
   candemote = false,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   customCheck = function(ply) return CLIENT or ply:IsUserGroup("Fleet General") or ply:IsAdmin() or ply:IsSuperAdmin() or ply:IsUserGroup("JUDGE") or ply:IsUserGroup("Event Manager") end,
   category = "Fleets",
})





--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_REC


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_MAYOR] = true,
}

--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)

