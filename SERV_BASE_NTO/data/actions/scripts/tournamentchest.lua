function onUse(cid, item, frompos, item2, topos)

local cfg = {
awardId = 2148, -- Item ID of winner prize
awardAmount = 100, -- Amount of item ID
}

doPlayerAddItem(cid, cfg.awardId, cfg.awardAmount)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doPlayerSendTextMessage(cid, 27, "Thanks for sign, added +1 Tournament Points!")
return true
end