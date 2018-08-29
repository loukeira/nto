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
selfSay('Valeu amigo, estou precisando de umas cinco "ervas" medicinais, ouvi falar que Tem uns Bandidos perto de konoha que sempre carregam elas.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'ervas')) then
selfSay('Voce ja tem as ervas medicinais para me "conseguir"?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'conseguir') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,103) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 2795, 5) == TRUE) then
setPlayerStorageValue(cid,103,1)
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,10135,1)
selfSay('Obrigado! Como recompensa pegue e leia esse livro de um clan poderoso de konoha que comprei, podera aprender muito com ele...{voce leu o livro}... (you received 1000 points of experience)', cid)
else
selfSay('Voce ainda nao conseguiu o que preciso, estou esperando amigo.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())