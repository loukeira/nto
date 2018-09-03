local s = {
--[action id] = {pos de volta}
[33691] = {x = 261, y = 1939, z = 7}, -- Twin City
}

local b = {
--[action id] = {{pos para onde ir}, {pos de volta}},
[33702] = {{x = 477, y = 1958, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Psycraft
[33703] = {{x = 432, y = 1958, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Orebound
[33704] = {{x = 390, y = 1958, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Wingeon
[33705] = {{x = 349, y = 1957, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Naturia
[33706] = {{x = 307, y = 1957, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Seavel
[33707] = {{x = 267, y = 1957, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Gardestrike
[33708] = {{x = 226, y = 1957, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Malefic
[33709] = {{x = 186, y = 1957, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Raibolt
[33710] = {{x = 145, y = 1957, z = 10}, {x = 270, y = 1871, z = 8}}, -- Clan Volcanic
}

function onStepIn(cid, item, pos)
if isSummon(cid) then
return false
end
--
local posi = {x = 270, y = 1871, z = 8} --posiçao do Trade Center... 
local pos = s[item.actionid]
local storage = 171877 
--
if b[item.actionid] then
   pos = b[item.actionid][2]
   posi = b[item.actionid][1] 
   storage = 171878
end
setPlayerStorageValue(cid, storage, "/"..pos.x..";"..pos.y..";"..pos.z.."/")
--
if #getCreatureSummons(cid) >= 1 then
   for i = 1, #getCreatureSummons(cid) do
       doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
   end
end 
doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)  
return true
end