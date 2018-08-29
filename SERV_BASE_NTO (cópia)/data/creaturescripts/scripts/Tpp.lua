local monsters = {
["The Gaara"] = {itemid = 3255, count = 1},
["The Yugito Nii"] = {itemid = 3256, count = 1},
["The Roushi"] = {itemid = 3258, count = 1},
["The Han"] = {itemid = 3259, count = 1},
["The Utakata"] = {itemid = 3260, count = 1},
["The Fuu"] = {itemid = 3261, count = 1},
["The Killer Bee"] = {itemid = 3262, count = 1},
["The Naruto"] = {itemid = 3266, count = 1}
}

function onDeath(cid, corpse, killer)
local mob = monsters[getCreatureName(cid)]

if mob then
doPlayerAddItem(killer[1], mob.itemid, mob.count)
end
return TRUE
end