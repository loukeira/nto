local area1 = {x = 682, y = 701, z = 4}
local area2 = {x = 819, y = 844, z = 4}
function onStepIn(cid, item, position, lastPosition, fromPosition)
if isPlayer(cid) then
    if #getPlayerInArea(area1, area2) > 0 then
	doTeleportThing(cid, fromPosition)
	doPlayerSendTextMessage(cid, 20, "Tem um player na quest!")
        return true
    else
        doPlayerSendTextMessage(cid, 20, "Boa Sorte!")
        return false
    end
end
end