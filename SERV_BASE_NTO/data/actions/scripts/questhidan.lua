function onUse(cid, item, frompos, item2, topos)

pos = {x=1026, y=910, z=7}

if getPlayerStorageValue(cid, 22222) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 8854, 1)
doAddContainerItem(bag, 113, 2)
doAddContainerItem(bag, 2431, 1)
doAddContainerItem(bag, 7402, 1)
doAddContainerItem(bag, 7869, 1)

doAddContainerItem(bag, 3578, 1)
doAddContainerItem(bag, 102, 1)
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return TRUE
end