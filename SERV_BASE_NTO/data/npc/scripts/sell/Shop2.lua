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
local moeda = 2160
local t = {
   ["hashirama armor"] = {1000, 8854}, -- ["nome do item"] = {quanto vai custar, id do tem que sera vendido}
   ["nidaime armor"] = {500, 7463},
   ["raijin nidaime sword"] = {1000, 7869},
   ["kage shuriken"] = {1000, 2659},
   ["akatsuki ring"] = {2000, 105},
   ["kage boots"] = {500, 2161},
   ["sennin legs"] = {1000, 2431},
   }

local s = {
   ["pergaminho obito"] = {3000, 316},
   ["pergaminho kisame"] = {3000, 116},
   ["pergaminho itachi"] = {3000, 115},
   ["pergaminho tsunade"] = {3000, 830},
   }
---------------------------------------------------------
if(msgcontains(msg, 'conseguir')) then
selfSay('Basta Fazer As Task,Fale Com a {Tsunade}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') and talkState[talkUser] == 1) then
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
str = str .. "Eu Posso lhe Vende Esse Items: "
for name, pos in pairs(t) do
str = str.." {"..name.."} por "..pos[1].." Gold Bar, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif t[msg] then
                if doPlayerRemoveItem(cid,moeda,t[msg][1]) then
                       doPlayerAddItem(cid,t[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(t[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem dinheiro suficientes! fassa task para consegui ".. getItemNameById(moeda), cid)
                end
end
-----------------------------------------------------------------------------------------
if (msgcontains(msg, 'vocation') or msgcontains(msg, 'VOCATION'))then
local str = ""
str = str .. "Eu Posso lhe Vende Essas Vocaçao: "
for name, pos in pairs(s) do
str = str.." {"..name.."} por "..pos[1].." Gold Bar, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif s[msg] then
                if doPlayerRemoveItem(cid,moeda,s[msg][1]) then
                       doPlayerAddItem(cid,s[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(s[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem dinheiro suficientes! fassa task para consegui ".. getItemNameById(moeda), cid)
                end
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())