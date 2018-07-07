function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 13589) < 1 then
doPlayerSendTextMessage(cid,22,"Voce Termino a Quest Akatsuki Ring")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2516, 1)
doAddContainerItem(bag, 2659, 1)
doAddContainerItem(bag, 105, 1)
setPlayerStorageValue(cid, 13589, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce Ja Fes a Quest.")
end

return TRUE
end