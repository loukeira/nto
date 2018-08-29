local minlevel = 50 -- level inical para resetar
local price = 1000 -- preço inicial para resetar
local newlevel = 8 -- level após reset
local newexp = 4200 -- nova experiencia após reset
local lvlByReset = 50 -- level acrescentado por reset
local priceByReset = 100 -- preço acrescentado por reset
local maxResets = 100 -- máximo de resets
-- end config


function addReset(cid)
resets = getResets(cid)
setPlayerStorageValue(cid,1020,resets+1)
return true
end


function getResets(cid)
resets = getPlayerStorageValue(cid,1020)
if resets &lt; 0 then
resets = 0
end
return resets
end




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


local needlvl = minlevel + (getResets(cid) * lvlByReset)
local newPrice = price + (getResets(cid) * priceByReset)


if msgcontains(msg, 'resetar') then
if getResets(cid) &lt; maxResets then
selfSay('Voce deseja reset seu char? Isto custará '..newPrice..' gp\'s!', cid)
talkState[talkUser] = 1
else
selfSay('Você ja alcançou seu limite de resets!', cid)
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if getPlayerMoney(cid) &lt; newPrice then
selfSay('É Necessario ter '..newPrice..' gp\'s para resetar!', cid)
elseif getPlayerLevel(cid) &lt; needlvl then
selfSay('O level minimo para reset é '..needlvl..'!', cid)
else
doPlayerRemoveMoney(cid,newPrice)
if isInArray(vocs, getPlayerVocation(cid)) then
doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
end
addReset(cid)
playerid = getPlayerGUID(cid)
doRemoveCreature(cid)
db.executeQuery("UPDATE `players` SET `level`="..newlevel..",`experience`="..newexp.." WHERE `players`.`id`= ".. playerid .."")
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
talkState[talkUser] = 0
selfSay('Ok.', cid)
elseif msgcontains(msg, 'quant') then
selfSay('Voce tem um total de '..getResets(cid)..' reset(s).', cid)
end


return true
end