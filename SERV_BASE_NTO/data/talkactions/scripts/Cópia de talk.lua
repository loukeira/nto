function onSay(cid, words, param, channel)

if(param == '') then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "� necess�rio um param�tro."), TRUE
end

local prm = string.explode(param, ",")
local pos = getCreaturePosition(cid)
local plr = getPlayerByName(prm[1])

if (plr == nil) then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O player est� offline ou n�o existe.")
elseif (prm[2] == nil) then
return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "� necess�rio a mensagem ap�s a v�rgula.")
end

return doCreatureSay(plr, prm[2], 1), TRUE
end