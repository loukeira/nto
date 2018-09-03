function returnToDimension(cid)

local position = tostring(getPlayerStorageValue(cid, 38292))
local pos = string.explode(position, ",")

if isCreature(cid) then
doTeleporThing(cid, {x = tonumber(pos[1]), y = tonumber(pos[2]), z = tonumber(pos[3])})
end
end

function onCastSpell(cid, var)

local toPos = {x = 1026, y = 955, z = 7}
local pos = getThingPos(cid)
setPlayerStorageValue(cid, 38292, pos.x .. ", " .. pos.y .. ", " .. pos.z .. "")  
doTeleportThing(cid, toPos)
addEvent(returnToDimension, 20 * 1000, cid)
return true
end