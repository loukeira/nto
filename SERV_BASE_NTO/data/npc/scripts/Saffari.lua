focus = 0
talk_start = 0
target = 0
following = false
attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)
end
function onCreatureAppear(creature)
end
function onCreatureDisappear(cid, pos)
if focus == cid then
   selfSay('See ya.')
   focus = 0
   talk_start = 0
end
end
function onCreatureTurn(creature)
end
function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
msg = string.lower(msg)
if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 3 then
   selfSay('Hello, i can let you enter in the saffari zone for 500 Dollars, do you accept?')--alterado v1.9
   focus = cid
   talk_start = os.clock()
elseif (msgcontains(msg, 'yes') and focus == cid ) then  --alterado v1.9
   if getPlayerItemCount(cid,2391) >= 1 or getPlayerItemCount(cid,2394) >= 1 or getPlayerItemCount(cid,2393) >= 1 or getPlayerItemCount(cid, 12617) >= 1 then
      selfSay("You can't enter in the saffari zone with any type of pokeballs! Cya")                                                                   --alterado v1.9 /\
     focus = 0
     talk_start = 0
   elseif getPlayerStorageValue(cid, 98796) >= 1 or getPlayerStorageValue(cid, 98797) >= 1 then
      selfSay("You already are in the saffari zone!")
      focus = 0
      talk_start = 0
   elseif doPlayerRemoveMoney(cid, 50000) then --500dl --alterado v1.9
      setPlayerStorageValue(cid, 98796, 1)
      setPlayerStorageValue(cid, 98797, 1)
      doPlayerAddItem(cid, 2394, 30)  --alterado v1.9
      doTeleportThing(cid, SafariEnter)
      doSendMagicEffect(getThingPos(cid), 21)
      talk_start = os.clock()
   else
      selfSay("You don't have that much of money. Cya")   --alterado v1.9
      focus = 0
      talk_start = 0
   end
elseif (msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 3) then
   selfSay('Sorry, Im busy at this moment.')
elseif (msgcontains(msg, 'bye') and focus == cid and getDistanceToCreature(cid) < 3) then
   selfSay('Good bye then.')
   focus = 0
   talk_start = 0
end
end

function onCreatureChangeOutfit(creature)
end
function onThink()
if (os.clock() - talk_start) > 30 then
if focus > 0 then
selfSay('See ya.')
end
focus = 0
end
end