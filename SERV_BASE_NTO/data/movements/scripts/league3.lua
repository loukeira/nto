function onStepIn(cid, item, position, fromPosition)

if isPlayer(cid) == false then
return true
end

if getPlayerStorageValue(cid, 63454) <= 0 then
doTeleportThing(cid, fromPosition, true)
return true
end

doSendAnimatedText(getCreaturePosition(cid), "!!", math.random(1,255))
return true
end