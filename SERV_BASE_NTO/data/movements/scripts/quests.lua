local level = 170 -- Level to pass

function onStepIn(cid, item, position, fromPosition)

if isPlayer(cid) == false then
return true
end

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, 27, "Only "..level.."Levels+!")
return true
end
doSendAnimatedText(getCreaturePosition(cid), "Quest", math.random(1,255))
return true
end