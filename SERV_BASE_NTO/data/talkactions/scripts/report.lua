function onSay(cid, words, param)
local sto = 2133
if getPlayerStorageValue(cid, sto) > os.time() then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Precisa esperar  "..falta_tempo_player(cid,sto).." para reportar novamente")
return true
end
if #param <= 10 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu report precisa ter pelo menos 10 caracters")
return true
end
local file = io.open("data/report.txt", "a")
file:write("\n "..getPlayerName(cid)..", "..os.date("%A").." as "..tostring(os.date("%X")):sub(1, 5).." reportou dizendo: ("..param..")")
file:close()
--setGlobalStorageValue(28212, getGlobalStorageValue(28212)+1)
setPlayerStorageValue(cid, sto, os.time()+ 10)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu report foi enviada com sucesso logo sera atendido! obrigado pela colaboração")
for _, id in ipairs(getPlayersOnline()) do
if getPlayerGroupId(cid) > 5 then
doShowTextDialog(cid, 1952, ""..getPlayerName(cid).." acabou de reportar dizendo:("..param..")\neste report esta salvo no log")
--exhaustion.set(cid, 2123, 36000)
return true
end
return true
end
end