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
selfSay('Ohh sim...verdade, de agora em diante seras chamado de {chunin}, gosto muito desse espirito jovem, lembro de minha juventude.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'chunin')) then
selfSay('Tudo bem então, sem mais delongas me de o {certificado} da conclusao do exame, pois ficara no seus arquivos ninja que voce concluiu o exame chunin!', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'certificado') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,89745) > 1) then
selfSay('Voce ja fes o exame chunin.', cid)
else
if(doPlayerRemoveItem(cid, 6087, 1) == TRUE) then
setPlayerStorageValue(cid,89745,2)
doPlayerAddExperience(cid,25000)
doPlayerAddItem(cid,8851,1)
selfSay('Umm, isso me da mais alegria e animo para viver, vendo essa juventude tao determinada, podes se considerar um chunin de agora em diante!', cid)
else
selfSay('Cade o certificado Shinobi, sem ele não podes ganhar o Titulo de Chunin, me traga o CERTIFICADO!', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())