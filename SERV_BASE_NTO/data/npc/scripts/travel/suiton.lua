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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local storage,pos = 5585885,{x=785, y=1010, z=2}
if isInArray({"yes","fight","entrar","participar"}, msg) then
npcHandler:say("entao voce quer {lutar} comigo", cid)
talkState[talkUser] = 1
elseif isInArray({"lutar","sim"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Nessa floresta sera seu Funeral!", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Você já terminou a missão", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Entao saia da minha frente inutil!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())