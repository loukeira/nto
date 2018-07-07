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
if(msgcontains(msg, 'ajuda')) then
selfSay('Obrigado é Que Perdi a Armor Do Jyaraya e Se Ele Descobri Vai Quere Briga o Armor Esta Perto Do Orochimaru.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'armor')) then
selfSay('Voce Ja Tem o Armor?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,109) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 3284, 1) == TRUE) then
setPlayerStorageValue(cid,109,1)
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,7416,1)
selfSay('Obrigado Aki Esta o Armor Do Tsunade', cid)
else
selfSay('Voce ainda nao conseguiu o que preciso, estou esperando amigo.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())