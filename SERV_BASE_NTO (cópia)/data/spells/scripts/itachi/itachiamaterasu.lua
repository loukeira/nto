function onCastSpell(cid, words, param)
local waittime = 10 -- Tempo de exhaustion
local storage = 5818
local target = getCreatureTarget(cid)
    doCreatureSay(cid, "Mangekyou Susano", TALKTYPE_MONSTER)
if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end
if not isCreature(target) then
return false

end
pos = getCreaturePosition(cid)
function effectFollow(uid,jump,pos)
if jump <= 0 then
return true
end
posx = getPosByDir(pos,getDirectionTo(pos,getCreaturePosition(getCreatureTarget(cid))))
doAreaCombatHealth(cid, 1, posx, 0, -7000, -8400, 79)
addEvent(effectFollow, 500, uid, jump-1, pos)
    exhaustion.set(cid, storage, waittime)
end
effectFollow(getCreatureTarget(cid),15,pos)
end