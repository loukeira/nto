function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 23254) < 10 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
setPlayerStorageValue(cid, 23254, 10)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return TRUE
end