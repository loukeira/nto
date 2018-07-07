local config = {
    itemid = 2145,
    count = 1
}

function onStepIn(cid, item, position, lastPosition, fromPosition)
if isPlayer(cid) then
    if getPlayerItemCount(cid, config.itemid) >= config.count then
        doPlayerRemoveItem(cid, config.itemid, getPlayerItemCount(cid, config.itemid))
        return true
    end
end
end