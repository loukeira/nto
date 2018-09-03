function onSay(cid, words, param, channel)
if param == "" then
return sendMsgToPlayer(cid, 20, "Estao faltam os parametros! [change] ou [clan name], [rank]")
end
local t = string.explode(param, ",")
local clans = {'Volcanic', 'Seavell', 'Orebound', 'Wingeon', 'Malefic', 'Gardestrike', 'Psycraft', 'Naturia', 'Raibolt'}

if param == "change" and getPlayerStorageValue(cid, 612233) >= 1 and doPlayerRemoveItem(cid, 2160, 50) then
setPlayerStorageValue(cid, 612233, 0)
doPlayerSendTextMessage(cid, 20, "Agora você pode mudar de clan.")
return true
end
if not isInArray(clans, t[1]) then
   return sendMsgToPlayer(cid, 20, t[1].." nao é uma clan valido!")
elseif not tonumber(t[2]) then
   return sendMsgToPlayer(cid, 20, "Parametros errados! [clan name], [rank].")
end

local rank = tonumber(t[2])
local clan = t[1]
local javirou = 0

if getPlayerStorageValue(cid, 612233) >= 1 then
doPlayerSendTextMessage(cid, 20, "Custa 500k. Para permitir que mude diga /clan change")
return true
end

if getPlayerStorageValue(cid, 612233) <= 0 then
if setPlayerClan(cid, clan) then
   setPlayerClanRank(cid, rank)
setPlayerStorageValue(cid, 612233, 1)
   return sendMsgToPlayer(cid, 20, "Troca de clan feita. Agora voce pertence ao clan: "..clan)
else
   return sendMsgToPlayer(cid, 20, "Voce tem que terminar todas as tasks antes de sair do clan!")
end
end
return true
end