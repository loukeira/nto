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


local S = { 
        [3] = 100000, -- white skull preço
        [4] = 500000, -- red skull preço
        [5] = 1000000 -- black skull preço
}
local battle_price = 10000 -- battle preço

if(msgcontains(msg, 'remover') or msgcontains(msg, 'REMOVER')) then 
selfSay('E ai oque vai ser? Remover {skulls} e o battle ou quer retirar só {battle}?', cid) 
talkState[talkUser] = 1 
elseif msgcontains(msg, 'skulls') and talkState[talkUser] == 1 then
if not S[getCreatureSkullType(cid)] then
selfSay('Você não está com nenhuma skull!', cid)
talkState[talkUser] = 0 
else
selfSay('Você quer remover sua skull por '..S[getCreatureSkullType(cid)]..' gps? {yes}', cid) 
talkState[talkUser] = 2
end
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then 
if doPlayerRemoveMoney(cid, S[getCreatureSkullType(cid)]) == TRUE then
db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")") 
doCreatureSetSkullType(cid, 0)
if getCreatureCondition(cid, CONDITION_INFIGHT) ~= FALSE then 
doRemoveCondition(cid, CONDITION_INFIGHT)
end
selfSay('Pronto meu caro,seus males foram removidos!', cid)
talkState[talkUser] = 0 
else
selfSay('Você não tem '..S[getCreatureSkullType(cid)]..' gps suficientes!', cid)
talkState[talkUser] = 0 
end
elseif msgcontains(msg, 'battle') and talkState[talkUser] == 1 then
selfSay('Você quer remover seu battle por '.. battle_price ..' gps? {yes}', cid) 
talkState[talkUser] = 3
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 3 then
if getCreatureCondition(cid, CONDITION_INFIGHT) ~= FALSE then 
if doPlayerRemoveMoney(cid, battle_price) == TRUE then
doRemoveCondition(cid, CONDITION_INFIGHT)
selfSay('Pronto meu caro,seu battle foi removido!', cid)
talkState[talkUser] = 0
else
selfSay('Você não tem  '.. battle_price ..' gps suficientes!', cid)
talkState[talkUser] = 0
end
else
selfSay('Você não está com battle!', cid)
talkState[talkUser] = 0
end
elseif msg == "no" and talkState[talkUser] >= 1 then 
selfSay("Then not", cid) 
talkState[talkUser] = 0 
npcHandler:releaseFocus(cid) 
end 
return TRUE 
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())