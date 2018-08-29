function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 8585858585) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 822, 1)
setPlayerStorageValue(cid, 8585858585, 1)
pos = {x=957, y=1050, z=7}
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
pos1 = {x=957, y=1050, z=7}
doTeleportThing(cid, pos1)
end

return TRUE
end