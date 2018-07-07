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

local storage,pos = 15800,{x=1883, y=1352, z=7}

if isInArray({"yes","quest pain","pain quest","entrar"}, msg) then

npcHandler:say("Entao Ja Lhe Digo Que Voce Precisa Ter Treis Amigo Para Ir Quest Diga {Comecar}.", cid)

talkState[talkUser] = 1

elseif isInArray({"yes","comecar"}, msg) and talkState[talkUser] == 1 then

if getPlayerStorageValue(cid, storage) <= 0 then

npcHandler:say("Boa Sorte Na Que Cuidado Para Nao Morre Pois Se Voce Morre Nao Consiguira Minato", cid)

talkState[talkUser] = 0  

doTeleportThing(cid, pos)

else
npcHandler:say("Voce ja completou essa Quest, nao pode mais ir ate o local", cid)

talkState[talkUser] = 0

end

elseif msg == "no" then  

selfSay("Ok, volte quando quiser fazer a mesma e organize um time!", cid)  

talkState[talkUser] = 0  

npcHandler:releaseFocus(cid)  

end

return true

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())