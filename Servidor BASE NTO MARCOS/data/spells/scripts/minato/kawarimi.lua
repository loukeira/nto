function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)

if not isPlayer(target) then
    doPlayerSendCancel(cid, "Apenas em Players XD")
return FALSE
end

if(target > 0) then
doTeleportThing(target, getThingPos(cid))
doSendMagicEffect(targetpos, 54)
end

return true
end 