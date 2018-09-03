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
local storage,pos = 89745,{x=1083, y=919, z=7}
if isInArray({"lutar","fight","entrar","participar"}, msg) then
npcHandler:say("HAHAHAHA, um mero academico quer mesmo lutar contra um Chunin, sabes que nao tem chance, esta mesmo preparado? {yes}", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","sim"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Nessa floresta sera seu Funeral!", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Voc� j� terminou a miss�o", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Hahahaha, sabia que voce era fraco, fuja seu verme, fuja pra bem longe", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())