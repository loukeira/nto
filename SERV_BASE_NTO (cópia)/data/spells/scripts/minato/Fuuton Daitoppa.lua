function onCastSpell(cid, var) 
local max_sqm = 3 -- maximo de sqm que vai empurrar o player 
local pos = getPosByDir(getCreaturePosition(cid), getCreatureLookDirection(cid), 1) 
pos.stackpos = 253 
if (isPlayer(getThingFromPos(pos).uid)) then 
doTeleportThing(getThingFromPos(pos).uid, getClosestFreeTile(getThingFromPos(pos).uid, (getPosByDir(getCreaturePosition(cid), getCreatureLookDirection(cid), max_sqm)))) 
doSendMagicEffect(pos,54) 
end 
return FALSE 
end