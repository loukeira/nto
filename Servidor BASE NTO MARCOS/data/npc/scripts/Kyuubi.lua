local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

-- fogo
if(msgcontains(msg, 'kyuubi')) then
if getPlayerStorageValue(cid, 25501) < 1 then
setPlayerStorageValue(cid, 25501, 1)
doPlayerLearnInstantSpell(cid, 'Biju Rasengan')
doPlayerLearnInstantSpell(cid, 'Bijuu Dama')
doPlayerLearnInstantSpell(cid, 'Kyuubi Punchi')
doPlayerLearnInstantSpell(cid, 'Kyuubi Furie!')
doPlayerLearnInstantSpell(cid, 'Kyuubi Bijuu Furie')
doSendMagicEffect(getPlayerPosition(cid), 6)
else
npcHandler:say("já te ensinei um elemento!", cid)
end

-- agua
elseif(msgcontains(msg, 'agua')) then
if getPlayerStorageValue(cid, 25501) < 1 then
setPlayerStorageValue(cid, 25501, 1)
doPlayerLearnInstantSpell(cid, 'nome da magia de agua 1')
doPlayerLearnInstantSpell(cid, 'nome da magia de agua 2')
doPlayerLearnInstantSpell(cid, 'nome da magia de agua 3')
doPlayerLearnInstantSpell(cid, 'nome da magia de agua 4')
doPlayerLearnInstantSpell(cid, 'nome da magia de agua 5')
doSendMagicEffect(getPlayerPosition(cid), 53)
else
npcHandler:say("já te ensinei um elemento!", cid)
end

-- terra
elseif(msgcontains(msg, 'terra')) then
if getPlayerStorageValue(cid, 25501) < 1 then
setPlayerStorageValue(cid, 25501, 1)
doPlayerLearnInstantSpell(cid, 'nome da magia de terra 1')
doPlayerLearnInstantSpell(cid, 'nome da magia de terra 2')
doPlayerLearnInstantSpell(cid, 'nome da magia de terra 3')
doPlayerLearnInstantSpell(cid, 'nome da magia de terra 4')
doPlayerLearnInstantSpell(cid, 'nome da magia de terra 5')
doSendMagicEffect(getPlayerPosition(cid), 44)
else
npcHandler:say("já te ensinei um elemento!", cid)
end

-- ar
elseif(msgcontains(msg, 'ar')) then
if getPlayerStorageValue(cid, 25501) < 1 then
setPlayerStorageValue(cid, 25501, 1)
doPlayerLearnInstantSpell(cid, 'nome da magia de ar 1')
doPlayerLearnInstantSpell(cid, 'nome da magia de ar 2')
doPlayerLearnInstantSpell(cid, 'nome da magia de ar 3')
doPlayerLearnInstantSpell(cid, 'nome da magia de ar 4')
doPlayerLearnInstantSpell(cid, 'nome da magia de ar 5')
doSendMagicEffect(getPlayerPosition(cid), 2)
else
npcHandler:say("já te ensinei um elemento!", cid)
end

-- raio
elseif(msgcontains(msg, 'raio')) then
if getPlayerStorageValue(cid, 25501) < 1 then
setPlayerStorageValue(cid, 25501, 1)
doPlayerLearnInstantSpell(cid, 'nome da magia de raio 1')
doPlayerLearnInstantSpell(cid, 'nome da magia de raio 2')
doPlayerLearnInstantSpell(cid, 'nome da magia de raio 3')
doPlayerLearnInstantSpell(cid, 'nome da magia de raio 4')
doPlayerLearnInstantSpell(cid, 'nome da magia de raio 5')
doSendMagicEffect(getPlayerPosition(cid), 47)
else
npcHandler:say("já te ensinei um elemento!", cid)
end
end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())