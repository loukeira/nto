function onStepIn(cid, item, position, fromPosition)

local from,to = {x=952, y=889, z=7},{x=973, y=899, z=7}
local pos1 = {x=959, y=896, z=7} -- player pos
local pos2 = {x=965, y=896, z=7} -- monster pos

if getPlayerStorageValue(cid, 89745) < 2 then
doPlayerSendTextMessage(cid, 27,"Apenas Chunins podem fazer o exame jounin!")
doTeleportThing(cid, fromPosition)
return TRUE
end

if getPlayerStorageValue(cid, 89745) > 2 then
doPlayerSendTextMessage(cid, 27,"Voce ja fez o exame jounin!")
doTeleportThing(cid, fromPosition)
return TRUE
end

for x = from.x, to.x do
for y = from.y,to.y do
local m = getTopCreature({x=x, y=y, z=from.z}).uid
if m~= 0 and isPlayer(m) then
doTeleportThing(cid, fromPosition)
return doPlayerSendCancel(cid, "Alguem esta fazendo o exame Jounin.")
end
end
end

for _, uid in pairs (getCreatureSummons(cid)) do
doRemoveCreature(uid)
end
doTeleportThing(cid, pos1)
doCreateMonster("Uchiha Fugaku", pos2)
doPlayerSendTextMessage(cid, 27,"Boa sorte no exame jounin!")
return TRUE
end
