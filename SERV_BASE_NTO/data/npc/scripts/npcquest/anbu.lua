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
if(msgcontains(msg, 'shinobi')) then
selfSay('Ohh sim...verdade, de agora em diante seras chamado de {anbu}, foi muito valente por ter feito o exame.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'anbu')) then
selfSay('Hahaha, axa mesmo que terminou? So estara terminado quando matar a PRISIONEIRA e me der o {cerebro} dela!', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'cerebro') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,89745) > 3) then
selfSay('Voce ja me deu o cerebro da prisioneira e ja se tornou um anbu.', cid)
else
if(doPlayerRemoveItem(cid, 5808, 1) == TRUE) then
setPlayerStorageValue(cid,89745,4)
doPlayerAddExperience(cid,25000)
selfSay('Hahaha, vejo que nao sera dificil de tomar decisoes no futuro, tem potencial pra se tornar um captao anbu algum dia!', cid)
else
selfSay('Ande LOGO, mate a PRISIONEIRA e me de o CEREBRO dela!', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())