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
if(msgcontains(msg, 'yes')) then
selfSay('então voce consiguil pega o {pergaminho} que ele roubou do Terceiro Hokage?.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'pergaminho')) then
selfSay('Parabens Voce Consiguil Pega o Pergaminho,Agora Se Caso Voce Quise Vira Um {Genin}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'genin') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,89745) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 2155, 1) == TRUE) then
setPlayerStorageValue(cid,89745,1)
doPlayerAddExperience(cid,7000)
doPlayerAddItem(cid,10140,1)
selfSay('Muito Bem Genin, de agora em diante tambem tera acesso a lugares que os guardas deixao apenas genin passarem, como recompensa tome esse livro, esta anotado varios jutsus nele...{voce leu o livro}... (you received 7000 points of experience)', cid)
else
selfSay('Ueh.. cade o pergaminho? nao me digas que perdeu? volte e pegue ele...', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())