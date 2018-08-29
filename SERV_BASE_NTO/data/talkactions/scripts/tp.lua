-- Script by Luck Oake
function onSay(cid, words, param)
local toPos = {x = 1556, y = 1260, z = 7} --pos para onde o player vai ser teleportado
local tempo = 20 --tempo q ele vai ficar la... em segs
local voc = 5 --tempo q ele vai ficar la... em segs

function back(cid)
if isInArea(getCreaturePosition(cid), topos) then
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
doCreateTeleport(tpId, to, from)
addEvent(removeTp, 5000, tp)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
end
return true
end