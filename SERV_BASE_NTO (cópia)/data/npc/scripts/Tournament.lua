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

local cfg = {
price = 100, -- Money to sign in tournament
startPos = {x = 1326, y = 1575, z = 7}, -- Posição central da sala de torneio
hour = "18:00:00", -- Hour to start
maxhour = "18:15:00", -- Max to start
}



if msgcontains(msg, 'torneio') or msgcontains(msg, 'enter') then
selfSay('You want to participate in the tournament by '..cfg.price..' gps / dollars?', cid)
talkState[talkUser] = 2


elseif talkState[talkUser] == 2 then

if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then

if os.date("%X") < cfg.hour or os.date("%X") > cfg.maxhour then
				selfSay('Registration for the tournament finished, come back later.', cid)
return true
end

if doPlayerRemoveMoney(cid, cfg.price) then
doTeleportThing(cid, {x = 1007, y = 1018, z = 7})
doPlayerSendTextMessage(cid, 27, "Welcome to the tournament, the fights will start on time, good luck, hahaha!")
else

selfSay('You do not have enough money ('..cfg.price..').', cid)
end
else
selfSay('Sure you do not want to participate? Okay, see you next time!!', cid)
talkState[talkUser] = 0
end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())