function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 5326) < 1 then
doPlayerSendTextMessage(cid,22,"Voce Terminou a Quest Da Kage Shuriken")
local bag = doPlayerAddItem(cid, 2659, 1)
setPlayerStorageValue(cid, 5326, 1)
pos = {x=1029, y=909, z=7}
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
pos1 = {x=1029, y=909, z=7}
doTeleportThing(cid, pos1)
end

return TRUE
end