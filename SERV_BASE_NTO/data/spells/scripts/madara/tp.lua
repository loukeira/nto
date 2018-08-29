-- Script by Luck Oake
function onSay(cid, words, param)
local storage = 5560
local pos = getCreaturePosition(cid)
from = {x=pos.x, y=pos.y, z=7}
to = {x = 1000, y = 1000, z = 7} -- Para onde o teleport levará
area1 = {x = 998, y = 998, z = 7} -- Ponta de cima na esquerda na area que o tp leva
area2 = {x = 1002, y = 1002, z = 7} -- Ponta de baixo na direita na area que o tp leva

function back(cid)
if isInArea(getCreaturePosition(cid), area1, area2) then
doTeleportThing(cid, from)
end
end

function removeTp(tp)
local tp = getTileItemById(from, tpId)
if tp then
doRemoveItem(tp.uid, 1)
doSendMagicEffect(from, CONST_ME_POFF)
end
end

if exhaustion.check(cid, storage) == false then
for _, pid in ipairs(getPlayersOnline()) do
addEvent(back, 20000, pid)
end
exhaustion.set(cid, storage, waittime)
addEvent(removeTp, 5000, tp)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
end
return true
end