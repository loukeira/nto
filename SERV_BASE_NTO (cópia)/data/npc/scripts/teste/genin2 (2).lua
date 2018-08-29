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
 
local exp = 15000 
local t = {item1={2244,1}}
 
--[[ 
XXXX = ID DO ITEM 
YY = QUANTIDADE DO ITEM 
]]-- 
 
if(msgcontains(msg, 'certo') or msgcontains(msg, 'yes')) then 
selfSay('Me traga 5 ervas que sao encontradas no vale do fim ou voce ja tem as {ervas}? ', cid) 
talkState[talkUser] = 1 
elseif msgcontains(msg, 'ervas') and talkState[talkUser] == 1  then 
if getPlayerStorageValue(cid,5078) == -1 then
if(getPlayerItemCount(cid, t.item1[1]) >= t.item1[2]) then  
doPlayerRemoveItem(cid, t.item1[1], t.item1[2])
doPlayerAddExp(cid, exp)
setPlayerStorageValue(cid,8181,2)
selfSay('Muito Bom Shinobi, siga agora sua jornada no mundo Shinobi e prepare-se para muitos desafios !', cid) 
talkState[talkUser] = 0 
else 
selfSay('voce ainda nao tem as ' .. t.item1[2] .. ' ' .. getItemNameById(t.item1[1]) .. '  que eu lhe pedi, va pegar e mostre que tens valor para ser um Genin.', cid) 
talkState[talkUser] = 0 
end
else
selfSay('Muito Shinobi, tens um futuro brilhante pela frente.', cid) 
talkState[talkUser] = 0 
end
elseif msg == "no" and talkState[talkUser] == 1 then 
selfSay("Hmm..", cid) 
talkState[talkUser] = 0 
npcHandler:releaseFocus(cid) 
end 
return TRUE 
end 
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())