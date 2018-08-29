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
local storage,pos = 130,{x=1571, y=879, z=7}
if isInArray({"destruir","yes","teleporte","entrar"}, msg) then
npcHandler:say("Então Voce Quer me Destruir? Voce Tera Que {Enfrentar} Meus Pains Primeiro", cid)
talkState[talkUser] = 1
elseif isInArray({"enfrentar","inicio"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Pain No Rikkudou.", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Saia Daki Eu Ja Fis Minha Parte", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Suma Daki Voce Nunca Vencera Meus Pains", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())