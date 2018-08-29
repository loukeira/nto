function onUse(cid, item)

local pos = {x=1708, y=1408, z=7, stackpos=253} -- posição do jogador mais proximo da alavanca
local uid = nil
local delay = 500 -- tempo para resetar a quest
local t = {}

for i = pos.x -1, pos.x do
local player = getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid
if isCreature(player) then
if getPlayerStorageValue(player, 15836) == -1 and getPlayerLevel(player) >= 10 then
uid = uid == nil and 1 or uid + 1
t[uid] = player
end
else
return doPlayerSendCancel(cid, "Voce precisa de 9 membros para fazer a quest.")
end
end

if #t == 2 then
if getGlobalStorageValue(15836) - os.time() <= 0 then
for i = pos.x -2, pos.x do
doTeleportThing(getThingFromPos({x=i, y=pos.y, z=pos.z, stackpos=253}).uid, {x=i, y=pos.y, z=pos.z + 1})
doSendMagicEffect({x=i, y=pos.y, z=pos.z + 1}, 27)
doPlayerSendTextMessage(cid, 22, "Voce tem apenas 25 minutos para fazer a quest, caso contrario sera teleportado para fora!")
end
doRespaw('beezer')
setGlobalStorageValue(15836, delay + os.time())
addEvent(doCheck, delay*1000, t)
else
doPlayerSendCancel(cid, "Espere "..getGlobalStorageValue(15836) - os.time().." segundos para fazer a quest.")
end
else
doPlayerSendCancel(cid, "Alguem no seu grupo ja fez a quest.")
end

return TRUE
end

function doRespaw(mon)

mon1 = {x=1710, y=1408, z=7, stackpos=253} -- posição demon 1
mon2 = {x=1712, y=1408, z=7, stackpos=253} -- posição demon 2
mon3 = {x=1714, y=1408, z=7, stackpos=253} -- posição demon 3
mon4 = {x=1706, y=1408, z=7, stackpos=253} -- posição demon 3
mon5 = {x=1704, y=1408, z=7, stackpos=253} -- posição demon 3
mon6 = {x=1708, y=1414, z=7, stackpos=253} -- posição demon 3
mon7 = {x=1710, y=1414, z=7, stackpos=253} -- posição demon 3
mon8 = {x=1712, y=1414, z=7, stackpos=253} -- posição demon 3


doCreateMonster(mon, mon1)
doCreateMonster(mon, {x=mon1.x +2, y=mon1.y, z=mon1.z})
doCreateMonster(mon, mon2)
doCreateMonster(mon, {x=mon2.x +2, y=mon2.y, z=mon2.z})
doCreateMonster(mon, mon3)
doCreateMonster(mon, {x=mon3.x +1, y=mon3.y, z=mon3.z})
doCreateMonster(mon, mon4)
doCreateMonster(mon, {x=mon4.x +1, y=mon4.y, z=mon4.z})
doCreateMonster(mon, mon5)
doCreateMonster(mon, {x=mon5.x +1, y=mon5.y, z=mon5.z})
doCreateMonster(mon, mon6)
doCreateMonster(mon, {x=mon6.x +1, y=mon6.y, z=mon6.z})
doCreateMonster(mon, mon7)
doCreateMonster(mon, {x=mon7.x +1, y=mon7.y, z=mon7.z})
doCreateMonster(mon, mon8)
doCreateMonster(mon, {x=mon8.x +1, y=mon8.y, z=mon8.z})

end

function doCheck(tab)

local templepos = {x=1838, y=1304, z=7}

for i = 1, 9 do
if isCreature(tab[i]) then
if getPlayerStorageValue(tab[i], 15836) == -1 then
doTeleportThing(tab[i], templepos)
doCreatureSay(cid, "Voce tem apenas 25 minutos para finalizar a Quest, por isso foi teleportado para fora da quest!", TALKTYPE_MONSTER)
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

for posx = mon4.x, mon4.x + 1 do
local monster = {x=posx, y=mon4.y, z=mon4.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end
end

for posx = mon5.x, mon5.x + 1 do
local monster = {x=posx, y=mon5.y, z=mon5.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end
end

for posx = mon6.x, mon6.x + 1 do
local monster = {x=posx, y=mon6.y, z=mon6.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end
end

for posx = mon7.x, mon7.x + 1 do
local monster = {x=posx, y=mon7.y, z=mon7.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end
end

for posx = mon8.x, mon8.x + 1 do
local monster = {x=posx, y=mon8.y, z=mon8.z, stackpos=253}
if isCreature(getThingFromPos(monster).uid) then
if string.lower(getCreatureName(getThingFromPos(monster).uid)) == 'beezer' and isMonster(getThingFromPos(monster).uid) then
doRemoveCreature(getThingFromPos(monster).uid)
end
end
end

end