function onUse(cid, item)


local pos = {x=1885, y=1355, z=7, stackpos=253} -- posi��o do jogador mais proximo da alavanca

local uid = nil

local delay = 5 -- tempo para resetar a quest
local t = {}


for i = pos.x -3, pos.x do

local player = getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid

if isCreature(player) then

if getPlayerStorageValue(player, 13589) == -1 and getPlayerLevel(player) >= 10 then

uid = uid == nil and 1 or uid + 1

t[uid] = player

end

else

return doPlayerSendCancel(cid, "Voc� precisa de 4 membros para fazer a quest.")

end

end


if #t == 4 then

if getGlobalStorageValue(13589) - os.time() <= 0 then

for i = pos.x -3, pos.x do

doTeleportThing(getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid, {x=i, y=pos.y, z=pos.z + 1})
doSendMagicEffect({x=i, y=pos.y, z=pos.z + 1}, 27)
end
doRespaw('beezer')
setGlobalStorageValue(13589, delay + os.time())
addEvent(doCheck, delay*1000, t)
else
doPlayerSendCancel(cid, "Espere "..getGlobalStorageValue(62799) - os.time().." segundos para fazer a quest.")
end
else
doPlayerSendCancel(cid, "Algu�m no seu grupo j� fez a quest.")
end

return TRUE
end

function doRespaw(mon)

mon1 = {x=1881, y=1355, z=7, stackpos=253} -- posi��o demon 1
mon2 = {x=1881, y=1357, z=7, stackpos=253} -- posi��o demon 2
mon3 = {x=1885, y=1357, z=7, stackpos=253} -- posi��o demon 3


doCreateMonster(mon, mon1)
doCreateMonster(mon, {x=mon1.x +2, y=mon1.y, z=mon1.z})
doCreateMonster(mon, mon2)
doCreateMonster(mon, {x=mon2.x +2, y=mon2.y, z=mon2.z})
doCreateMonster(mon, mon3)
doCreateMonster(mon, {x=mon3.x +1, y=mon3.y, z=mon3.z})

end

function doCheck(tab)

local templepos = {x=1838, y=1304, z=7}

for i = 1, 4 do
if isCreature(tab[i]) then

if getPlayerStorageValue(tab[i], 13589) == -1 then

doTeleportThing(tab[i], templepos)

end

end

end


for posx = mon1.x, mon1.x + 2, 2 do

local monster = {x=posx, y=mon1.y, z=mon1.z, stackpos=253}

if isCreature(getThingFromPos(monster).uid) then

if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then

doRemoveCreature(getThingFromPos(monster).uid)

end

end


end


for posx = mon2.x, mon2.x + 2, 2 do

local monster = {x=posx, y=mon2.y, z=mon2.z, stackpos=253}

if isCreature(getThingFromPos(monster).uid) then

if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then

doRemoveCreature(getThingFromPos(monster).uid)

end

end


end


for posx = mon3.x, mon3.x + 1 do

local monster = {x=posx, y=mon3.y, z=mon3.z, stackpos=253}

if isCreature(getThingFromPos(monster).uid) then

if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then

doRemoveCreature(getThingFromPos(monster).uid)

end
end
end
end