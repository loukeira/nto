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
selfSay('Obrigado o Meu {Armor} Esta Perto Do Orochimaru Cuidado Se Nao Ele Pode Te Mata.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'armor')) then
selfSay('Voce Ja Tem o Armor?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,103) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 3282, 1) == TRUE) then
setPlayerStorageValue(cid,108,1)
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,2534,1)
selfSay('Obrigado Aki Esta o Armor Do Orochimaru', cid)
else
selfSay('Voce ainda nao conseguiu o que preciso, estou esperando amigo.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())