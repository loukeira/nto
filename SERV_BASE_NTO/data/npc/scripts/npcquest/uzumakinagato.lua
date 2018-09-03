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
if(msgcontains(msg, 'missao')) then
selfSay('não me diga que consiguil {derrota} meus pains?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'derrota')) then
selfSay('Então é Verdade Isso?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,1011225) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 10551, 10) == TRUE) then
setPlayerStorageValue(cid,1011225,1)
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,105,1)
selfSay('Impossivel Isso,Tome o Meu Anel Da Akatsuki Eu Reviverei Todos Que Matei Em Sua Vila', cid)
else
selfSay('Voce não tens os 10 nukenins talisma ainda..', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())