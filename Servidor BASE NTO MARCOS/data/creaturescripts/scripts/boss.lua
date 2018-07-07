function onKill(cid, target)

local creaturepos = {x=981, y=903, z=7} -- posiçao onde o monstro vai ser renascido
local endpos = {x=986, y=902, z=8} -- posiçao onde vai levar o player ao bau
local from,to = {x=979, y=901, z=7},{x=991, y=905, z=7}

local boss = {
[1] = "Uchiha Fugaku",
[2] = "Chouza Akimichi",
[3] = "Anko",
[4] = "Zabuza",
[5] = "Kakashi"
}

if isInRange(getCreaturePosition(cid), from, to) then

if((isMonster(target) and not isSummon(target)) and string.lower(getCreatureName(target)) == string.lower(boss[1])) then
doCreateMonster(boss[2], creaturepos)

elseif((isMonster(target) and not isSummon(target)) and string.lower(getCreatureName(target)) == string.lower(boss[2])) then
doCreateMonster(boss[3], creaturepos)

elseif((isMonster(target) and not isSummon(target)) and string.lower(getCreatureName(target)) == string.lower(boss[3])) then
doCreateMonster(boss[4], creaturepos)

elseif((isMonster(target) and not isSummon(target)) and string.lower(getCreatureName(target)) == string.lower(boss[4])) then
doCreateMonster(boss[5], creaturepos)

elseif((isMonster(target) and not isSummon(target)) and string.lower(getCreatureName(target)) == string.lower(boss[5])) then
doTeleportThing(cid, endpos)
end
return true
end
return true
end