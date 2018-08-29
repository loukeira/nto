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
local moeda = 884
local t = {
   ["gunbai"] = {15, 346}, -- ["nome do item"] = {quanto vai custar, id do tem que sera vendido}
   ["semana premium"] = {5, 3277},
   ["mes premium"] = {10, 3276},
   ["yondaime tunic"] = {5, 7408},
   ["tobi war mask"] = {5, 7380},
   ["madara boots"] = {5, 111},
   ["madara legs"] = {10, 110},
   ["madara armor"] = {15, 107},
   ["nagato ring"] = {15, 112},
   ["chojuro sword"] = {10, 114},
   }

local s = {
   ["pergaminho obito"] = {20, 316},
   ["pergaminho madara"] = {20, 395},
   ["pergaminho nagato"] = {20, 3293},
   ["pergaminho minato"] = {40, 118},
   ["pergaminho raikage"] = {20, 117},
   ["pergaminho kisame"] = {20, 116},
   ["pergaminho itachi"] = {20, 115},
   ["pergaminho hashirama"] = {20, 829},
   ["pergaminho tsunade"] = {20, 830},
   ["pergaminho nidaime"] = {20, 4758},
   }

---------------------------------------------------------
if(msgcontains(msg, 'pontos')) then
selfSay('Para conseguir  Nto points fassa a quest', cid)
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
str = str.." {"..name.."} por "..pos[1].." Pontos, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif t[msg] then
                if doPlayerRemoveItem(cid,moeda,t[msg][1]) then
                       doPlayerAddItem(cid,t[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(t[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem points suficientes para adquirir Fassa a quest".. getItemNameById(moeda), cid)
                end
end
-----------------------------------------------------------------------------------------
if (msgcontains(msg, 'vocation') or msgcontains(msg, 'VOCATION'))then
local str = ""
str = str .. "Eu Posso lhe Vende Essas Vocaçao: "
for name, pos in pairs(s) do
str = str.." {"..name.."} por "..pos[1].." Pontos, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif s[msg] then
                if doPlayerRemoveItem(cid,moeda,s[msg][1]) then
                       doPlayerAddItem(cid,s[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(s[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem points suficientes para adquirir Fassa a quest".. getItemNameById(moeda), cid)
                end
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())