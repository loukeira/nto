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
-- Conversa Jogador/NPC
if(msgcontains(msg, 'offer') or msgcontains(msg, 'offer')) then
selfSay('Para Premium diga ( premium ) Para bencao diga ( bencao ) Para trocar de sexo diga ( trocar sexo ) Para trocar de cidade natal diga ( cidade natal ).', cid)
elseif(msgcontains(msg, 'premium') or msgcontains(msg, 'Premium')) then
selfSay('dialogo da premium - diga sim para comprar-', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'bencao') or msgcontains(msg, 'Bencao')) then
selfSay('Com bencao reduz sua penalidade quando morto ( perde menos XP skills etc..) ela custa apenas 3 Diamonds.Deseja ter a Bencao??', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'trocar sexo') or msgcontains(msg, 'trocar sexo')) then
selfSay('Para trocar de sexo sao nescessarios 5 Diamonds. Deseja mudar seu sexo??', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'cidade natal') or msgcontains(msg, 'cidade natal')) then
selfSay('deseja trocar de cidade natal? custa apenas 1 Diamonds. Deseja trocar Cidade Natal??', cid)
talkState[talkUser] = 4
-- Confirmação da Compra
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(doPlayerRemoveItem(cid, 3956, 10) == true) then
selfSay('Parabens, Premium de 30 dias!', cid)
doPlayerAddPremiumDays(cid, 30)
talkState[talkUser] = 0
else
selfSay('Voce nao tem Diamonds suficientes.', cid)
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 2) then
if getPlayerBlessing(cid, 1) and getPlayerBlessing(cid, 2) and getPlayerBlessing(cid, 3) and getPlayerBlessing(cid, 4) and getPlayerBlessing(cid, 5) then
selfSay('Voce ja esta usando bencao!', cid)
else
if(doPlayerRemoveItem(cid, 102, 3) == true) then
selfSay('Thanks!', cid)
doPlayerAddBlessing(cid, 1)
doPlayerAddBlessing(cid, 2)
doPlayerAddBlessing(cid, 3)
doPlayerAddBlessing(cid, 4)
doPlayerAddBlessing(cid, 5)
talkState[talkUser] = 0
else
selfSay('Voce nao tem Diamonds suficientes.', cid)
talkState[talkUser] = 0
end
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
if(doPlayerRemoveItem(cid, 2145, 5) == true) then
selfSay('Thanks!', cid)
if(getPlayerSex(cid) == PLAYERSEX_FEMALE) then
doPlayerSetSex(cid, PLAYERSEX_MALE)
else
doPlayerSetSex(cid, PLAYERSEX_FEMALE)
end
talkState[talkUser] = 0
else
selfSay('Você nao tem Diamonds suficientes.', cid)
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'sendas') and talkState[talkUser] == 4) then
if(doPlayerRemoveItem(cid, 2145, 5) == true) then
selfSay('Thanks!', cid)
doPlayerSetTown(cid, 2)
talkState[talkUser] = 0
else
selfSay('Você nao tem Diamonds suficientes.', cid)
talkState[talkUser] = 0
end
elseif(msgcontains(msg, 'falador') and talkState[talkUser] == 4) then
if(doPlayerRemoveItem(cid, 2145, 5) == true) then
selfSay('Thanks!', cid)
doPlayerSetTown(cid, 1)
talkState[talkUser] = 0
else
selfSay('Você não tem Dimond suficientes.', cid)
talkState[talkUser] = 0
end
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())