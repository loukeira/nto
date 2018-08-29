vips = {} vips.__index = vips

function vips.moveBack(cid, fromPosition, text) doTeleportThing(cid, fromPosition, TRUE) doPlayerSendCancel(cid, text)
end

function onStepIn(cid, item, position, fromPosition)

if item.actionid == 65535 then if(getPlayerPremiumDays(cid) < 1) then
vips.moveBack(cid, fromPosition, "apenas premium account podem passar.")
end
end
end