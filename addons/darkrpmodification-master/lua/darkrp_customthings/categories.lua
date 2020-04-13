--[[-----------------------------------------------------------------------
Categories
---------------------------------------------------------------------------
The categories of the default F4 menu.

Please read this page for more information:
http://wiki.darkrp.com/index.php/DarkRP:Categories

In case that page can't be reached, here's an example with explanation:

DarkRP.createCategory{
    name = "Citizens", -- The name of the category.
    categorises = "jobs", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(0, 107, 0, 255), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 100, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}


Add new categories under the next line!
---------------------------------------------------------------------------]]

DarkRP.createCategory{
   name = "StormTroopers",
   categorises = "jobs",
   startExpanded = false,
   color = Color(211, 219, 222, 255),
   canSee = function(ply) return true end,
   sortOrder = 2,
}

DarkRP.createCategory{
   name = "501STs",
   categorises = "jobs",
   startExpanded = false,
   color = Color(0, 149, 229, 255),
   canSee = function(ply) return true end,
   sortOrder = 15,
}

DarkRP.createCategory{
   name = "NovaTroopers",
   categorises = "jobs",
   startExpanded = false,
   color = Color(255, 247, 0, 255),
   canSee = function(ply) return true end,
   sortOrder = 13,
}

DarkRP.createCategory{
   name = "RGs",
   categorises = "jobs",
   startExpanded = false,
   color = Color(255, 0, 0, 255),
   canSee = function(ply) return true end,
   sortOrder = 13,
}

DarkRP.createCategory{
   name = "Recruit",
   categorises = "jobs",
   startExpanded = true,
   color = Color(82, 82, 82, 255),
   canSee = function(ply) return true end,
   sortOrder = 1,
}

DarkRP.createCategory{
   name = "Shock Troopers",
   categorises = "jobs",
   startExpanded = false,
   color = Color(192, 27, 185, 255),
   canSee = function(ply) return true end,
   sortOrder = 3,
}

DarkRP.createCategory{
   name = "Sand Troopers",
   categorises = "jobs",
   startExpanded = false,
   color = Color(209, 200, 75, 255),
   canSee = function(ply) return true end,
   sortOrder = 4,
}

DarkRP.createCategory{
   name = "Shadow Troopers",
   categorises = "jobs",
   startExpanded = false,
   color = Color(55, 56, 36, 255),
   canSee = function(ply) return true end,
   sortOrder = 5,
}

DarkRP.createCategory{
   name = "Fleets",
   categorises = "jobs",
   startExpanded = false,
   color = Color(145, 145, 145, 255),
   canSee = function(ply) return true end,
   sortOrder = 6,
}

DarkRP.createCategory{
   name = "Events",
   categorises = "jobs",
   startExpanded = false,
   color = Color(255, 255, 255, 255),
   canSee = function(ply) return true end,
   sortOrder = 10,
}
DarkRP.createCategory{
   name = "Medics",
   categorises = "jobs",
   startExpanded = false,
   color = Color(255, 0, 0, 255),
   canSee = function(ply) return true end,
   sortOrder = 7,
}

DarkRP.createCategory{
   name = "Tie Pilots",
   categorises = "jobs",
   startExpanded = false,
   color = Color(0, 153, 255, 255),
   canSee = function(ply) return true end,
   sortOrder = 8,
}

DarkRP.createCategory{
   name = "Havoc Troopers",
   categorises = "jobs",
   startExpanded = false,
   color = Color(139, 224, 108, 255),
   canSee = function(ply) return true end,
   sortOrder = 9,
}
DarkRP.createCategory{
   name = "VIP",
   categorises = "jobs",
   startExpanded = false,
   color = Color(222,39, 224, 108, 255),
   canSee = function(ply) return true end,
   sortOrder = 10,
}