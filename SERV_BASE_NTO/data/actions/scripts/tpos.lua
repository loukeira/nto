function onUse(cid, item, frompos, item2, topos)


local config = {
pos = {x=1800, y=1495, z=7},
storage = 52868
}

if getPlayerStorageValue(cid, config.storage) > 0 then
doSendMagicEffect(getCreaturePos(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce Ja Fes a Quest.")
return TRUE
end

if item.itemid == 3268 then
doPlayerSendTextMessage(cid,22,"Voce Foi Teleportado Para a Quest Uchiha Sword")
doPlayerRemoveItem(cid, 3268, 1)
doTeleportThing(cid,config.pos)
doSendMagicEffect(getCreaturePos(cid), 10)
doSendMagicEffect(fromPosition, 6)
end
return TRUE
end