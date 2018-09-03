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
selfSay('Ouvi falar que os "olhos" de Giant Fear sao milagrosos, preciso de 7 olho gigante para curar meu filho da cegueira.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'olhos')) then
selfSay('Voce ja tem os 7 olhos de gigante para me "conseguir"?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'conseguir') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,105) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 11191, 7) == TRUE) then
setPlayerStorageValue(cid,105,1)
doPlayerAddExperience(cid,5000)
doPlayerAddItem(cid,10135,1)
selfSay('Obrigada! Como recompensa pegue e leia esse livro, foi meu avo que me deu, ele era um jounin, podera aprender muito com ele...{voce leu o livro}... (you received 5000 points of experience)', cid)
else
selfSay('Voce ainda nao conseguiu o que preciso, estou esperando amigo.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())