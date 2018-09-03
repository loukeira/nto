function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 5858) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 3293, 1)
setPlayerStorageValue(cid, 5858, 1)
pos = {x=1026, y=910, z=7}
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return TRUE
end