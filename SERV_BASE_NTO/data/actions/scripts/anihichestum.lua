function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 62799) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 7862, 1)
doAddContainerItem(bag, 2161, 1)
setPlayerStorageValue(cid, 62799, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return TRUE
end