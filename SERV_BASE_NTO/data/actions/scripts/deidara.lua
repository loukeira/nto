function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19893) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2430, 1)
doAddContainerItem(bag, 2383, 1)
doAddContainerItem(bag, 2529, 1)
setPlayerStorageValue(cid, 19893, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return TRUE
end