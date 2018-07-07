--- Staff Island Teleport --- By Hayashii
function onSay (cid,words, param, channel)

local newPos = {x= POSX, y= POSY, z= POSZ} --- aonde o Staff member sera teletransportado

doTeleportThing(cid, newPos)
doPlayerSendTextMessage(cid, 27, "Você foi teleportado para a Staff Island")
return TRUE
end