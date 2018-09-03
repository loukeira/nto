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
local storage,pos = 130,{x=1565, y=941, z=7}
if isInArray({"vence","yes","teleporte","entrar"}, msg) then
npcHandler:say("Entao Quer Realmente Tenta Me {Derrota}?", cid)
talkState[talkUser] = 1
elseif isInArray({"derrota","inicio"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Voce Perdera Agora.", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Voce Ja Pegou Sua Shuriken", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Saia Daki Voce Nao Me Vencera", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())