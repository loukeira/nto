local config = {
    itemid = 2145,
    count = 100
}

function onStepIn(cid, item, position, lastPosition, fromPosition)
if isPlayer(cid) then
    if getPlayerItemCount(cid, config.itemid) >= config.count then
        doPlayerRemoveItem(cid, config.itemid, config.count)
        return true
    else
        doTeleportThing(cid, fromPosition)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need at least ".. config.count .." ".. getItemInfo(config.itemid).name .." to do it.")
        return false
    end
end
end