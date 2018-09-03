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

if(msgcontains(msg, 'nagato') or msgcontains(msg, 'nagato')) then
selfSay('Deseja virar {nagato} por 1 pergaminhos perdidos?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 2153) >= 1) then
doPlayerRemoveItem(cid, 2153, 1)
doPlayerSetVocation(cid,216)
selfSay('Vocação trocada com sucesso , Agora você é um nagato.', cid)
else
selfSay('Você não tem {pergaminhos perdidos} Suficientes.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'madara') or msgcontains(msg, 'madara')) then
selfSay('Deseja virar {madara} por 1 pergaminhos perdidos?', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 2153) >= 1) then
doPlayerRemoveItem(cid, 2153, 1)
doPlayerSetVocation(cid,209)
selfSay('Vocação trocada com sucesso , Agora você é um madara.', cid)
else
selfSay('Você não tem {pergaminhos perdidos} Suficientes.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'jiraya') or msgcontains(msg, 'jiraya')) then
selfSay('Deseja virar {jiraya} por 1 pergaminhos perdidos?', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 2153) >= 1) then
doPlayerRemoveItem(cid, 2153, 1)
doPlayerSetVocation(cid,305)
selfSay('Vocação trocada com sucesso , Agora você é um jiraya.', cid)
else
selfSay('Você não tem {pergaminhos perdidos} Suficientes.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'minato') or msgcontains(msg, 'minato')) then
selfSay('Deseja virar {minato} por 1 pergaminhos perdidos?', cid)
talkState[talkUser] = 4
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
if(getPlayerItemCount(cid, 2153) >= 1) then
doPlayerRemoveItem(cid, 2153, 1)
doPlayerSetVocation(cid,300)
selfSay('Vocação trocada com sucesso , Agora você é um minato.', cid)
else
selfSay('Você não tem {pergaminhos perdidos} Suficientes.', cid)
end
talkState[talkUser] = 0
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())