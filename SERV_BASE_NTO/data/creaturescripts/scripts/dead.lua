function onDeath(cid, corpse, killer)
local pos = getCreaturePosition(cid)
local from,to = {x=979, y=901, z=7},{x=991, y=905, z=7}

if isInRange(pos, from, to) then
for x = from.x, to.x do
for y = from.y, to.y do
local mob = getTopCreature({x=x, y=y, z=from.z}).uid
if mob ~= 0 and isMonster(mob) then
doRemoveCreature(mob)
end
end
end
end
return TRUE
end