function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 5327) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 853, 1)
doAddContainerItem(bag, 852, 1)
doAddContainerItem(bag, 854, 1)
doAddContainerItem(bag, 856, 1)
setPlayerStorageValue(cid, 5327, 1)
pos = {x=1029, y=909, z=7}
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
pos1 = {x=1029, y=909, z=7}
doTeleportThing(cid, pos1)
end

return TRUE
end