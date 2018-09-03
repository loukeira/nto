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

preco = {
[-1] = 100000,        
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

if(msgcontains(msg, 'recompensa')) then
selfSay('Diga o nome do shinobi que desejas colocar na lista de recompensa.', cid)
talkState[talkUser] = 1
elseif isPlayer(getPlayerByNameWildcard(msg)) and talkState[talkUser] == 1 then
if getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) < 9 then
if doPlayerRemoveMoney(cid, preco[getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)]) == TRUE then
setPlayerStorageValue(getPlayerByNameWildcard(msg), 13131, getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) + 1)
doBroadcastMessage("Noticia: Jornal Shinobi informa: NPC OININ, informou que o shinobi "..msg.." esta procurado, e agora o seu nivel de recompensa e procura � "..getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)..".", BroadCast_Type)
else
selfSay('Descupe, voce n�o possui o dinheiro necess�rio para por uma recompensa a cabe�a a este jogador.', cid)
end
else
selfSay('O jogador que voce escolheu ja esta em um rank maximo de procurado.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'checar')) then
selfSay('Diga o nome do jogador que voce deseja checar o level.', cid)
talkState[talkUser] = 2
elseif isPlayer(getPlayerByNameWildcard(msg)) and talkState[talkUser] == 2 then
if getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) >= 0 then
selfSay("O rank de recompensa deste shinobi � "..getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)..".", cid)
else
selfSay('Este jogador nao esta sendo procurado.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'procurado')) then
selfSay('Deseja checar o seu rank de recompensa?', cid)
talkState[talkUser] = 3
elseif (msgcontains(msg, 'yes') and talkState[talkUser]) == 3 then
if getPlayerStorageValue(cid, 13131) >= 0 then
selfSay("O seu rank de recompensa � "..getPlayerStorageValue(cid, 13131)..".", cid)
else
selfSay('Voce nao esta sendo procurado.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'informacoes')) then
selfSay('O sistema funciona da seguinte maneira: voce pode colocar recompensas pela cabe�a de jogadores, assim, quem matar estes jogadores ir� ganhar um bom dinheiro, porem, ha um alto custo para utilizar os meus servi�os.', cid)
talkState[talkUser] = 0
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())