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
selfSay('Preciso de 10 "ervas" antidotes, ouvi falar que os Yoths perto de mist gakure tem muitas ja que sao imunes a venenos.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'ervas')) then
selfSay('Voce ja tem as 10 ervas para me "conseguir"?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'conseguir') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,106) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 2794, 10) == TRUE) then
setPlayerStorageValue(cid,106,1)
doPlayerAddExperience(cid,5000)
doPlayerAddItem(cid,10135,1)
selfSay('Obrigada! Como recompensa pegue e leia esse livro, e de meu marido, ele pertence ao clan aburame, podera aprender muito com ele...{voce leu o livro}... (you received 5000 points of experience)', cid)
else
selfSay('Voce ainda nao conseguiu o que preciso, estou esperando amigo.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())