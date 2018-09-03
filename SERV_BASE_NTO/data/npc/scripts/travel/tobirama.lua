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
local storage,pos = 130,{x=1709, y=879, z=7}
if isInArray({"lutar","yes","teleporte","entrar"}, msg) then
npcHandler:say("Entao Voce Pensa Que Pode Me {Vence}?,Entao Shinobi Mostre Sua Força", cid)
talkState[talkUser] = 1
elseif isInArray({"vence","inicio"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Suiton Dragon Reta No Jutsu.", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Voce Ja Me Venceu e Como Parte Eu Te Dei Minha Espada", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Saia Daki Voce Nunca Me Vencera", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())