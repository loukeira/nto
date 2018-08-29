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

shopModule:addBuyableItem({'renegade essence'}, 6500, 12500, 1, 'renegade essence')
shopModule:addBuyableItem({'nukenin talisma'}, 10551, 12500, 1, 'nukenin talisma')
shopModule:addBuyableItem({'orochimaru armor'}, 2463, 500000, 1, 'orochimaru armor')
shopModule:addBuyableItem({'vital boots'}, 7402, 7000000, 1, 'vital boots')
shopModule:addBuyableItem({'sennin legs'}, 2431, 700000, 1, 'sennin legs')
shopModule:addBuyableItem({'chakra legs'}, 2431, 2500000, 1, 'chakra legs')

shopModule:addSellableItem({'flask', 'flask'}, 7478, 10, 'empty flask')

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