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



---------------------------------------------------------
if(msgcontains(msg, "yes")) then
npcHandler:say("Entao voce tem os {pergaminhos} katon, suiton e raiton?", cid)
talkState[talkUser] = 1

elseif(msgcontains(msg, "pergaminhos") and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,89745) >= 5) then
npcHandler:say("Voce ja é sennin.", cid)

elseif doPlayerRemoveItem(cid, 820, 1) and doPlayerRemoveItem(cid, 821, 1) and doPlayerRemoveItem(cid, 822, 1) then
setPlayerStorageValue(cid,89745,5)
doPlayerAddItem(cid,823,1)
npcHandler:say("Agora voce é um Sennin!", cid)
else
npcHandler:say("Voce nao tem os pergaminhos.", cid)
end
end
return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())