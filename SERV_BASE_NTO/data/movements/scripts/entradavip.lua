function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Você não e vip ,Compre =D.",
msgWelcome = "Seja Bem Vindo a Area vip."
}

if getPlayerStorageValue(cid, 55489) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end