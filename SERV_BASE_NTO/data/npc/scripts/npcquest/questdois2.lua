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
 
local exp =1
local t = {item1={2422,1}}
 
--[[ 
XXXX = ID DO ITEM 
YY = QUANTIDADE DO ITEM 
]]-- 
 
if(msgcontains(msg, 'ajudar') or msgcontains(msg, 'ajuda')) then 
selfSay('Sim, estou precisando de uma haku coat, podes me conseguir? {yes} ', cid) 
talkState[talkUser] = 1 
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1  then 
if getPlayerStorageValue(cid,35060) == -1 then
if(getPlayerItemCount(cid, t.item1[1]) >= t.item1[2]) then  
doPlayerRemoveItem(cid, t.item1[1], t.item1[2])
doPlayerAddItem(cid,10135,1)
doPlayerAddExp(cid, exp)
setPlayerStorageValue(cid,35059,1)
selfSay('Obrigado, falarei muito de seu nome, oh bondoso shinobi!', cid) 
talkState[talkUser] = 0 
else 
selfSay('Voce nao tem o ' .. t.item1[2] .. ' ' .. getItemNameById(t.item1[1]) .. '  para completar essa missao.', cid) 
talkState[talkUser] = 0 
end
else
selfSay('Você já terminou esta missão.', cid) 
talkState[talkUser] = 0 
end
elseif msg == "no" and talkState[talkUser] == 1 then 
selfSay("Devo encontrar um outro shinobi que me ajude com isso", cid) 
talkState[talkUser] = 0 
npcHandler:releaseFocus(cid) 
end 
return TRUE 
end 
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())