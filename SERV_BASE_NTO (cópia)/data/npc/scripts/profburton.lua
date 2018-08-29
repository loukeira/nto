local focus = 0
local conv = 0
local talk_start = 0

function onCreatureSay(cid, type, msg)

	local msg = string.lower(msg)


if(msgcontains(msg, 'yes') and not isInArray(states, talkState[talkUser]) and talkState[talkUser] == 0 and focus == cid) then
if getPlayerStorageValue(cid, 200) >= 1 then
selfSay('I have already given you a stone!')
talkState[talkUser] = 0
return false
end
selfSay('Ok i can give you one water, leaf, heart, coccon or venom stone. You can choose only one, what will it be?')
talkState[talkUser] = 1
elseif (msgcontains(msg, 'no') and (focus == cid) and (talkState[talkUser] == 0)) then
selfSay('You like to do everything without help dont you? Thats the spirit.')
focus = 0
elseif (msgcontains(msg, 'no') and (focus == cid) and (talkState[talkUser] >= 2)) then
selfSay('Come back later when you are ready.')
focus = 0 
elseif (msgcontains(msg, 'bye') and focus == cid) then
focus = 0
selfSay('I will continue my studies.')
elseif (msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 2) then
if getPlayerStorageValue(cid, 200) >= 1 then
selfSay('Hello again ' .. getCreatureName(cid) .. '! Hope you enjoyed my help. Im very busy right now, come back later!')
focus = cid
else
focus = cid
talk_start = os.clock()
talkState[talkUser] = 0
selfSay('Hello, Im professor burton and i study pokemon evolutions. Would you like some help to evolve your pokemons?')
end
elseif (msgcontains(msg, 'water') and talkState[talkUser] ~= 0 and talkState[talkUser] ~= 6 and focus == cid) then
selfSay('Water stones are used to evolve water pokemons, but i can only give water stones to players at level 20 or higher, with at least 12 pokemon registred on your pokedex, do you have those requirements?')
talkState[talkUser] = 6
elseif (msgcontains(msg, 'leaf') and talkState[talkUser] ~= 0 and talkState[talkUser] ~= 2 and focus == cid) then
selfSay('Leaf stones evolve grass pokemon. You need to be level 18 and have at least 10 pokemons registrations in your pokedex, do you have these requirements?')
talkState[talkUser] = 2
elseif (msgcontains(msg, 'coccon') and talkState[talkUser] ~= 0 and talkState[talkUser] ~= 3 and focus == cid) then
selfSay('Coccon stones are very common and they evolve bug pokemons, the only requirement is to be level 15, are you at this level?')
talkState[talkUser] = 3
elseif (msgcontains(msg, 'heart') and talkState[talkUser] ~= 0 and talkState[talkUser] ~= 4 and focus == cid) then
selfSay('Heart stones evolve either flying or normal pokemon, and you gotta be level 20 with 12 pokemon registrations in your pokedex, are you ok with that?')
talkState[talkUser] = 4
elseif (msgcontains(msg, 'venom') and talkState[talkUser] ~= 0 and talkState[talkUser] ~= 5 and focus == cid) then
selfSay('Ah, venom, used to evolve poison pokemons, this isnt the rarest stone but its used only with strong pokemons, you need level 28 and 18 pokemons registrations in your pokedex to get this stone, fine?')
talkState[talkUser] = 5
elseif (msgcontains(msg, 'yes') and talkState[talkUser] ~= 0 and focus == cid) then
if getPlayerStorageValue(cid, 200) >= 1 then
selfSay('I have already given you a stone!')
talkState[talkUser] = 0
return true
end
if talkState[talkUser] == 6 then
   if getPlayerLevel(cid) >= 20 then
                   for i = 1, #store do
                        if getPlayerStorageValue(cid, store[i]) > 0 then
                                table.insert(unlock, 1)
                        end
                end
                if #unlock >= 12 then
                selfSay('Oh, very nice! Take this stone to help you complete your pokemon way!')
                talkState[talkUser] = 0
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Professor Burton has given you a water stone.")
                setPlayerStorageValue(cid, 200, 1)
                doPlayerAddItem(cid, 2277, 1)
                focus = 0
                else
                selfSay('You need to register more pokemon in your pokedex!')
                talkState[talkUser] = 0
                focus = 0
                end
                else
                selfSay('You dont have the required level to take this stone.')
                talkState[talkUser] = 0
                focus = 0
                end
elseif talkState[talkUser] == 2 then
   if getPlayerLevel(cid) >= 18 then
                   for i = 1, #store do
                        if getPlayerStorageValue(cid, store[i]) > 0 then
                                table.insert(unlock, 1)
                        end
                end
                if #unlock >= 10 then
                selfSay('Oh, very nice! Take this stone to help you complete your pokemon way!')
                talkState[talkUser] = 0
                focus = 0
                setPlayerStorageValue(cid, 200, 1)
                doPlayerAddItem(cid, 2276, 1)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Professor Burton has given you a leaf stone.")
                else
                selfSay('You need to register more pokemon in your pokedex!')
                talkState[talkUser] = 0
                focus = 0
                end
                else
                selfSay('You dont have the required level to take this stone.')
                talkState[talkUser] = 0
                focus = 0
                end
elseif talkState[talkUser] == 3 then
   if getPlayerLevel(cid) >= 15 then
                selfSay('Oh, very nice! Take this stone to help you complete your pokemon way!')
                talkState[talkUser] = 0
                focus = 0
                setPlayerStorageValue(cid, 200, 1)
                doPlayerAddItem(cid, 2284, 1)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Professor Burton has given you a coccon stone.")
                else
                selfSay('You dont have the required level to take this stone.')
                talkState[talkUser] = 0
                focus = 0
                end
elseif talkState[talkUser] == 4 then
   if getPlayerLevel(cid) >= 20 then
                   for i = 1, #store do
                        if getPlayerStorageValue(cid, store[i]) > 0 then
                                table.insert(unlock, 1)
                        end
                end
                if #unlock >= 12 then
                selfSay('Oh, very nice! Take this stone to help you complete your pokemon way!')
                talkState[talkUser] = 0
                setPlayerStorageValue(cid, 200, 1)
                doPlayerAddItem(cid, 2289, 1)
                focus = 0
                else
                selfSay('You need to register more pokemon in your pokedex!')
                talkState[talkUser] = 0
                focus = 0
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Professor Burton has given you a heart stone.")
                end
                else
                selfSay('You dont have the required level to take this stone.')
                talkState[talkUser] = 0
                focus = 0
                end
elseif talkState[talkUser] == 5 then
   if getPlayerLevel(cid) >= 28 then
                   for i = 1, #store do
                        if getPlayerStorageValue(cid, store[i]) > 0 then
                                table.insert(unlock, 1)
                        end
                end
                if #unlock >= 18 then
                selfSay('Oh, very nice! Take this stone to help you complete your pokemon way!')
                talkState[talkUser] = 0
                focus = 0
                setPlayerStorageValue(cid, 200, 1)
                doPlayerAddItem(cid, 2278, 1)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Professor Burton has given you a venom stone.")
                else
                selfSay('You need to register more pokemon in your pokedex!')
                talkState[talkUser] = 0
                focus = 0
                end
                else
                selfSay('You dont have the required level to take this stone.')
                talkState[talkUser] = 0
                focus = 0
                end
end
end
 end
 
 function onThink()
if focus == 0 then

selfTurn(0)
else
argx, argy, argz = selfGetPosition()
dir = getDirectionTo({x=argx,y=argy,z=argz}, getThingPos(focus))
    if dir == 7 then
    dir = 0
    elseif dir == 6 then
    dir = 3
    elseif dir == 5 then
    dir = 1
    elseif dir == 4 then
    dir = 3
    end
selfTurn(dir)
end

if (os.clock() - talk_start) > 61 then

focus = 0

end

if focus ~= 0 then
a, b, c = selfGetPosition()
if c ~= getThingPos(focus).z then
focus = 0
end
end

if focus ~= 0 then
if getDistanceToCreature(focus) > 3 then
focus = 0
end
end

return true
end