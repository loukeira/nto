local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)    npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'chakra boots'}, 7417, 12500, 1, 'chakra boots')
shopModule:addSellableItem({'chakra armor'}, 2397, 12500, 1, 'chakra armor')
shopModule:addSellableItem({'chakra mask'}, 2447, 70000, 1, 'orochimaru armor')
shopModule:addSellableItem({'elite anbu mask'}, 2451, 70000, 1, 'elite anbu mask')
shopModule:addSellableItem({'anbu armor'}, 2393, 70000, 1, 'anbu armor')
shopModule:addSellableItem({'akatsuki robe'}, 2395, 25000, 1, 'akatsuki robe')
shopModule:addSellableItem({'akatsuke boots'}, 2529, 25000, 1, 'akatsuke boots')

local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
function creatureSayCallback(cid, type, msg)
 if(not npcHandler:isFocused(cid)) then
  return false
 end

 local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 if(msgcontains(msg, 'desability ronnd') or msgcontains(msg, 'desability wannnd')) then
  if(isSorcerer(cid) or isDruid(cid)) then
   if(getPlayerStorageValue(cid, 30002) <= 0) then
    selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
    talkState[talkUser] = 1
   else
    selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
   end
  else
   selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
  end
 elseif(msgcontains(msg, 'yes')) then
  if(talkState[talkUser] == 1) then
   doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
   selfSay('Here you are young adept, take care yourself.', cid)
   setPlayerStorageValue(cid, 30002, 1)
  end
  talkState[talkUser] = 0
 elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
  selfSay('Ok then.', cid)
  talkState[talkUser] = 0
 end

 return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())