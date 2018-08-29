function onCastSpell(cid, words, param)

local targetpos = getCreaturePosition(getCreatureTarget(cid))
local posy, toposy = {x=targetpos.x-4, y=targetpos.y, z=targetpos.z}, {x=targetpos.x+3, y=targetpos.y, z=targetpos.z}

local function effectFollow(cid,efect,jump)
local min, max = 50000, 50000
if not isCreature(cid) then return true end
if jump <= 0 then return true end
local posx = getPosByDir(posy,getDirectionTo(posy,toposy))
doAreaCombatHealth(cid, 1, posx, 0, -min, -max, efect)
addEvent(effectFollow, 100, cid, efect, jump-1)
end

local waittime = 1 -- Tempo de exhaustion
local storage = 5858

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
return effectFollow(cid,112,7)
end
