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
local exp,t = 15000,{2244,1}
local s1,s2 = 15214,89745

if isInArray({'certo','right'}, msg) then
if getPlayerStorageValue(cid, s1) <= 0 then
talkState[talkUser] = 1
selfSay('Olá guerreiro, você pode me trazer '..t[2]..' '..getItemNameById(t[1])..'? {yes}', cid)
else
talkState[talkUser] = 2
selfSay('Já voltas-te bravo guerreiro! por acaso já tens as '..t[2]..' '..getItemNameById(t[1])..'? {yes}', cid)
end
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
selfSay('Muito bem então! Volte aqui quando tiver as '..t[2]..' '..getItemNameById(t[1])..' e será muito bem recompensado!', cid)
setPlayerStorageValue(cid,s1,1)
talkState[talkUser] = 0
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then
if getPlayerStorageValue(cid, s1) == 1 then
if doPlayerRemoveItem(cid, t[1], t[2]) then
doPlayerAddExp(cid, exp)
setPlayerStorageValue(cid,s2,1)
setPlayerStorageValue(cid,s1,2)
selfSay('Muito Bem, agora ja podes entrar no Olimpo e sentar em um dos tronos Deuses !', cid)
talkState[talkUser] = 0
else
selfSay('voce ainda nao tem as '..t[2]..' '..getItemNameById(t[1])..' que eu lhe pedi, va pegar e mostre que tens valor para ser um de nos.', cid)
talkState[talkUser] = 0
end
else
selfSay('Você já tem o acesso ao olimpo!', cid)
talkState[talkUser] = 0
end
elseif msg == "no" and talkState[talkUser] >= 1 then
selfSay("Hmm... ok.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())