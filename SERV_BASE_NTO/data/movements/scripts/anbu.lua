function onStepIn(cid, item, position, fromPosition)

if isPlayer(cid) and getPlayerStorageValue(cid, 89745) < 5 then
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"voce nao é sennin")
end
return true
end