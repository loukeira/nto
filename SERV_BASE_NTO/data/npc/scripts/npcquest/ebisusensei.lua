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
if(msgcontains(msg, 'jounin')) then
selfSay('Exato, fiquei sabendo que kakashi sensei esta a procura de uns chunins para fazer umas {missoes} para ele.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'missoes')) then
selfSay('Sim, se voce terminar as missoes para ele, creio que ele te dara 3 {medalhas} de rank S podendo assim fazer o exame jounin.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'medalhas') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,13502) > 0) then
selfSay('Voce ja me entregou o comprovante.', cid)
else
if(doPlayerRemoveItem(cid, 10136, 3) == TRUE) then
setPlayerStorageValue(cid,13502,1)
selfSay('Muito bem ent�o, ja podes fazer o exame jounin quando quiser, se realmente for um chunin!', cid)
else
selfSay('N�o me fa�a perder tempo amigo, volte com 3 comprovantes de que completaste 3 missoes rank A para fazer o exame jounin!', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())