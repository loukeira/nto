local config = {
    itemid = 4874,
    count = 1
}

function onStepIn(cid, item, position, lastPosition, fromPosition)
if isPlayer(cid) then
    if getPlayerItemCount(cid, config.itemid) >= config.count then
        doPlayerRemoveItem(cid, config.itemid, config.count)
		setPlayerStorageValue(cid, 64339, 0)
        return true
    else
        doTeleportThing(cid, fromPosition)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need at least ".. config.count .." ".. getItemInfo(config.itemid).name .." to pass.")
        return false
    end
end
end