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
if(msgcontains(msg, 'ajudar')) then
selfSay('Mrphh... ahh, minha barriga clama por comida, tens 10 "gold" para me dar?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'gold')) then
selfSay('Mrpphhh.. vais mesmo me "dar" 10 golds?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'dar') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 2160, 10) == TRUE) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,10135,1)
selfSay('Hahaha.. não passarei mais fome! Como gratidao peguei esse livro, robei ele da casa de um clan poderoso de konoha, podera aprender muito com ele...{voce leu o livro}... (you received 1000 points of experience)', cid)
else
selfSay('Ahhh... estou com muita fome, voce não tem mesmo 10g? por favor, tente conseguir para mim!.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())