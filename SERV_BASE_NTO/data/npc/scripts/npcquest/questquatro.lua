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
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'ajudar')) then
selfSay('Muito Obrigado por querer me ajudar, preciso de um estoque de "chakra armor", ouvi dizer que podes se concetrar muito com elas, eu e os monges queremos tres.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'chakra armor')) then
selfSay('Voce ja tem as 3 chakra armor para me "conseguir"?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'conseguir') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,104) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 2397, 3) == TRUE) then
setPlayerStorageValue(cid,104,1)
doPlayerAddExperience(cid,2000)
doPlayerAddItem(cid,10135,1)
selfSay('Obrigado! Como recompensa pegue e leia esse livro que nosso mestre escreveu, podera aprender muito com ele...{voce leu o livro}... (you received 2000 points of experience)', cid)
else
selfSay('Voce ainda nao conseguiu o que preciso, estou esperando amigo.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())