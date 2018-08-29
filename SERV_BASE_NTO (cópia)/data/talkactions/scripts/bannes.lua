function onSay(cid, words, param, channel)


local t = param:explode(",")
local name, days = t[1], tonumber(t[2]) 
if name then
if days then 
local acc = getAccountIdByName(name)
if acc ~= 0 then
local tempo = days * 24 * 3600 
doAddAccountBanishment(acc, target, os.time() + tempo, 5, 2, 'Voce Cometeu Algo Errado e Por Isso Foi Ban,Não Repita Isso !.', 0)

else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Este player não existe.")
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode adicionar essa quantidade de dia(s) de dias de banimento.")
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "esse player nao existe.")
end
return true
end
