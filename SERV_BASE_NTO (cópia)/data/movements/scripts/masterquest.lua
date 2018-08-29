local level = 250 -- Level to pass

function onStepIn(cid, item, position, fromPosition)

if isPlayer(cid) == false then
return true
end

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, 27, "Only "..level.."Levels+!")
return true
end
setPlayerStorageValue(cid, 64722, 1)
doSendAnimatedText(getCreaturePosition(cid), "250+", math.random(1,255))
return true
end
