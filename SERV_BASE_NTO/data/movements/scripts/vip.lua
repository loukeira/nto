function onStepIn(cid, item, position, fromPosition)
local storage = 89745 -- Storage
if getPlayerPremiumDays(cid) ==
else
doTeleportThing(cid, fromPosition)
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Apenas Shinobis Chunin podem entrar.")
end
return true
end