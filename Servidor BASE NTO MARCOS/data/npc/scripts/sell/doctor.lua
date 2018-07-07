local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local moeda = 824
local t = {
   ["kurama helmet"] = {200, 853}, -- ["nome do item"] = {quanto vai custar, id do tem que sera vendido}
   ["kurama armor"] = {300, 852},
   ["kurama boots"] = {300, 856},
   ["kurama legs"] = {300, 854},
   ["akatsuki ring"] = {200, 105},
   ["pergaminho pain"] = {400, 119},
   }

---------------------------------------------------------
if(msgcontains(msg, 'amostras')) then
selfSay('voce precisa pega em eventos ou fazer quests', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'essence') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,112) > 0) then
selfSay('Voce ja acabou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 6500, 25) == TRUE) then
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,10136,1)
selfSay('Obrigado! Se quiser ja podes fazer a {terceira missao}.. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
else
selfSay('Voce não tens os  25 renegade essence ainda', cid)
end
end
return true
end
---------------------------------------------------------
if (msgcontains(msg, 'items') or msgcontains(msg, 'ITEMS'))then
local str = ""
str = str .. "Eu vendo estes items: "
for name, pos in pairs(t) do
str = str.." {"..name.."} por "..pos[1].." amostras, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif t[msg] then
                if doPlayerRemoveItem(cid,moeda,t[msg][1]) then
                        doPlayerAddItem(cid,t[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(t[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem points suficientes! para adquirir points entre no blog de nosso server para saber como pagar: ".. getItemNameById(moeda), cid)
                end
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())