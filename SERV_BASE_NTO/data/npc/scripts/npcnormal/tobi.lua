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

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('estamos quase presti a fazer o tsukuyomi me')
end
return true
end

function greetCallback(cid)

return true

end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'yes')) then
selfSay('voce quer ir {captura} as bijuus?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'missao')) then
selfSay('procure em todas as vilas mate e pegue o seu chakra', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'bijuu') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,55525) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 831, 9) == TRUE) then
setPlayerStorageValue(cid,55525,1)
doPlayerAddItem(cid,852,1)
doPlayerAddItem(cid,853,1)
doPlayerAddItem(cid,856,1)
doPlayerAddItem(cid,854,1)
selfSay('agora iremos completa o tsukuyomi me', cid)
else
selfSay('voce ainda nao pegou os bijuu', cid)
end
end
return true
end 
 
end

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())