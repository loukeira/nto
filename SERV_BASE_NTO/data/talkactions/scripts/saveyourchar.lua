function onSay(cid, words, param, channel)

local config = {
s = 11548, -- n mexa
exhau = 30 -- tempo em seegundos para salvar denovo
}

if (getPlayerStorageValue(cid, config.s) <= os.time()) then
doPlayerSave(cid)
setPlayerStorageValue(cid,config.s,os.time()+config.exhau)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Seu Personagem foi salvo com sucesso!!.")
else
doPlayerSendCancel(cid, "Você tem que esperar " .. config.exhau .. " segundos para salvar novamente.")
end
return TRUE
end