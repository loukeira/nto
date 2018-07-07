function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 5327) < 1 then
doPlayerSendTextMessage(cid,22,"Voce Terminou a Quest Kyuuby Seal")
doAddContainerItem(bag, 102, 1)
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