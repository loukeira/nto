local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	 npcHandler:onCreatureAppear(cid)	 end
function onCreatureDisappear(cid)	 npcHandler:onCreatureDisappear(cid)	 end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg)	 end
function onThink()	 npcHandler:onThink()	 end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

preco = {
[-1] =  100000,
[0] = 200000,
[1] = 300000,
[2] = 400000,
[3] = 500000,
[4] = 600000,
[5] = 700000,
[6] = 800000,
[7] = 900000,
[8] = 1000000
}

if(msgcontains(msg, 'promover')) then
selfSay('Diga o nome do jogador que voce deseja promover.', cid)
talkState[talkUser] = 1
elseif isPlayer(getPlayerByNameWildcard(msg)) and talkState[talkUser] == 1 then
if getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) < 9 then
if doPlayerRemoveMoney(cid, preco[getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)]) == TRUE then
setPlayerStorageValue(getPlayerByNameWildcard(msg), 13131, getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) + 1)
doBroadcastMessage("O jogador "..msg.." foi promovido para o nivel "..getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)..".", BroadCast_Type)
else
selfSay('Descupe, voce não possui o dinheiro necessário para promover este jogador.', cid)
end
else
selfSay('O jogador que voce escolheu ja foi promovido ao maximo.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'level')) then
selfSay('Diga o nome do jogador que voce deseja checar o level.', cid)
talkState[talkUser] = 2
elseif isPlayer(getPlayerByNameWildcard(msg)) and talkState[talkUser] == 2 then
if getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) >= 0 then
selfSay("O level de recompensa deste jogador é "..getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)..".", cid)
else
selfSay('Este jogador nao esta sendo procurado.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'recompensa')) then
selfSay('Deseja checar o seu level de recompensa?', cid)
talkState[talkUser] = 3
elseif (msgcontains(msg, 'yes') and talkState[talkUser]) == 3 then
if getPlayerStorageValue(cid, 13131) >= 0 then
selfSay("O seu level de recompensa é "..getPlayerStorageValue(cid, 13131)..".", cid)
else
selfSay('Voce nao esta sendo procurado.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'informaçoes')) then
selfSay('O sistema funciona da seguinte maneira: voce pode colocar recompensas pela cabeça de jogadores, assim, quem matar estes jogadores irá ganhar algum item, porem, ha um alto custo para utilizar os meus serviços.', cid)
talkState[talkUser] = 0
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())